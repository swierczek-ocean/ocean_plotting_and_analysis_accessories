clear
close all
clc
tic()
%%

hFacC = rdmds('Grid3/hFacC');
hFacW = rdmds('Grid3/hFacW');
hFacS = rdmds('Grid3/hFacS');
DXG = rdmds('Grid3/DXG');
DYG = rdmds('Grid3/DYG');
DXC = rdmds('Grid3/DXC');
DYC = rdmds('Grid3/DYC');
XC = rdmds('Grid3/XC');
YC = rdmds('Grid3/YC');
RAC = squeeze(rdmds('Grid3/RAC'));
RC = squeeze(rdmds('Grid3/RC'));
RF = squeeze(rdmds('Grid3/RF'));
DRF = squeeze(rdmds('Grid3/DRF'));
str = 'Output3/';


sec = 2628000;
dt = sec;

tfield = 1;
sfield = 2;
cfield = 1;
nfield = 4;
phfield = 9;
ofield = 3;

lw = 2.6;


%% DIC Budgets
nt = 12;

% select area
x = 6:170;
y = 29:119;
z = 1:52; %
% z = 1:36; % top 1000 m

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz+1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = RAC(x,y);
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end
areaTop(:,:,nz+1) = RAC(x,y);
area = RAC(x,y);


%% heat budget
% initialize
RF = RF([z z(end)+1]);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

heatsw = zeros(nx,ny,nz,nt);
heatairsea = zeros(nx,ny,nz,nt);
heatdilut = zeros(nx,ny,nz,nt);
heatbio = zeros(nx,ny,nz,nt);
heatmix = zeros(nx,ny,nz,nt);
heatadv = zeros(nx,ny,nz,nt);
heatadv_h = zeros(nx,ny,nz,nt);
heatadv_v = zeros(nx,ny,nz,nt);
heatdiv = zeros(nx,ny,nz,nt);
heatcorr = zeros(nx,ny,nz,nt);
heattend = zeros(nx,ny,nz,nt);
heattend_calc = zeros(nx,ny,nz,nt);

z1=RF(1:end-1); z2=RF(2:end);
swfrac = 0.62*exp(z1/0.6)+(1.0-0.62)*exp(z1/20.0);
swfrac1 = 0.62*exp(z2/0.6)+(1.0-0.62)*exp(z2/20.0);
swfrac = permute(repmat(swfrac,1,nx,ny),[2 3 1]);
swfrac1 = permute(repmat(swfrac1,1,nx,ny),[2 3 1]);
rho=1035; Cp=3994;


for t=2:13
    
    fprintf('heat step number %g \n',t-1)
    % tendency due to short-wave heating
    % diagnostic: oceQsw
    charairsea = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    oceQsw = rdmds(charairsea,'rec',10);
    heatsw(:,:,:,t-1) = repmat(oceQsw(x,y),1,1,nz)./(rho*Cp)./dz.*(swfrac-swfrac1);
    % tendency due to air-sea flux
    % diagnostic: TFLUX
    flux = rdmds(charairsea,'rec',1);
    % divide by thickness of first layer
    % (hFacC accounts for partial cells)
    heatairsea(:,:,1,t-1) = (flux(x,y)-oceQsw(x,y))./(rho*Cp*dz(:,:,1));
    % advection
    % diagnostics: ADVx_TH, ADVy_TH, ADVr_TH
    
    charheat = [str,'diag_T_budget.',num2str(1460*t,'%010.f')];
    advflux = rdmds(charheat,'rec',1:3);
    % correction
    % diagnostic: WTHMASS
    tmp = rdmds(charheat,'rec',11);
    heatcorr(:,:,1,t-1) = tmp(x,y,1)./dz(:,:,1);
    
    advflux_x = advflux([x x(end)+1],y,z,2);
    advflux_y = advflux(x,[y y(end)+1],z,3);
    if z(end)==52
        advflux_z = advflux(x,y,[z z(end)],3);
        advflux_z(:,:,end) = 0*advflux_z(:,:,end);
    else
        advflux_z = advflux(x,y,[z z(end)+1],3);
    end
    adv_x = diff(advflux_x,1,1)./volume;
    adv_y = diff(advflux_y,1,2)./volume;
    adv_z = -diff(advflux_z,1,3)./volume;
    
    % minus sign because advective flux is on lhs, moving to rhs
    heatadv(:,:,:,t-1) = -(adv_x + adv_y + adv_z);
    
    % divergence
    % diagnostics: UVEL, VVEL, WVEL
    charstate = [str,'diag_state.',num2str(1460*t,'%010.f')];
    vel = rdmds(charstate,'rec',3:5);
    
    U = vel([x x(end)+1],y,z,1).*areaWest;
    V = vel(x,[y y(end)+1],z,2).*areaSouth;
    if z(end)==52
        W = vel(x,y,[z z(end)],3).*areaTop;
        W(:,:,end) = 0*W(:,:,end);
    else
        W = vel(x,y,[z z(end)+1],3).*areaTop;
    end
    div_x=diff(U,1,1)./volume;
    div_y=diff(V,1,2)./volume;
    div_z=-diff(W,1,3)./volume;
    
    % tracer field (deg C)
    tmp = rdmds(charstate,'rec',1);
    tracer = tmp(x,y,z);
    heatdiv(:,:,:,t-1) = tracer.*(div_x + div_y + div_z);
    % advection components
    heatadv_h(:,:,:,t-1) = -(adv_x + adv_y)+tracer.*(div_x + div_y);
    heatadv_v(:,:,:,t-1) = -(adv_z)+tracer.*(div_z);
    
    heatadv(:,:,:,t-1) = heatadv_h(:,:,:,t-1) + heatadv_v(:,:,:,t-1);
    % mixing
    % diagnostics: DFxETr04, DFyETr04, DFrITr04
    % diffusive flux (mol/s)
    diffflux = rdmds(charheat,'rec',4:6);
    
    diffflux_x = diffflux([x x(end)+1],y,z,1);
    diffflux_y = diffflux(x,[y y(end)+1],z,2);
    if z(end)==52
        diffflux_z = diffflux(x,y,[z z(end)],3);
        diffflux_z(:,:,end) = 0*diffflux_z(:,:,end);
    else
        diffflux_z = diffflux(x,y,[z z(end)+1],3);
    end
    mix_x = diff(diffflux_x,1,1)./volume;
    mix_y = diff(diffflux_y,1,2)./volume;
    mix_z = -diff(diffflux_z,1,3)./volume;
    
    % minus sign because diffusive flux is on lhs, moving to rhs
    heatmix(:,:,:,t-1) = -(mix_x + mix_y + mix_z);
    % total tendency
    
    snap = rdmds([str,'diag_snaps'],[1460*(t-1) 1460*t],'rec',1);
    heattend_calc(:,:,:,t-1) = diff(snap(x,y,z,:),1,4)/dt;
    
    tmp = rdmds(charheat,'rec',10);
    heattend(:,:,:,t-1) = tmp(x,y,z)./86400;
    
end % for t

clear tmp snap flux mix_* diffflux* div_* vel U V W advflux*



% fix divisions by hFacC=0
heatairsea(isnan(heatairsea)) = 0;
heatadv(isnan(heatadv)) = 0;
heatadv_h(isnan(heatadv_h)) = 0;
heatadv_v(isnan(heatadv_v)) = 0;
heatmix(isnan(heatmix)) = 0;
heatcorr(isnan(heatcorr)) = 0;


% remove correction from advection
heatadv = heatadv-heatcorr;
heatadv_v = heatadv_v-heatcorr;


% residual
tmp=heatairsea+heatsw;
tmp2=heatadv-heatcorr;
% heatres = tmp2+heatdiv+heatmix+tmp-heattend;
heatres = tmp2+heatmix+tmp-heattend;
heatres0 = tmp2+heatmix+tmp-heattend;
heatres2 = tmp2+heatmix+tmp;
% heatres1 = heatadv+heatdiv+heatmix+heatairsea+heatsw-heatcorr-heattend_calc;
heatres1 = heatadv+heatmix+heatairsea+heatsw-heatcorr-heattend_calc;


% res = heatadv+heatdiv+heatmix+heatbio+heatdilut-heattend;
save HEAT3_budget heat* XC YC RC hFacC area* volume dz DRF

heatadv=heatadv+heatdiv;

% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;


fprintf('making 1st heat budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(heattend(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(heatairsea(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(heatsw(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(heatmix(x1,y1,:,t)),RC,'LineWidth',lw);
h5 = plot(squeeze(heatcorr(x1,y1,:,t)),RC,'LineWidth',lw);
h6 = plot(squeeze(heatadv(x1,y1,:,t)),RC,'LineWidth',lw);
h7 = plot(squeeze(heatres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('degC/s');
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1)],'tend','air sea','shortwave','mix','corr','adv','res')
title('heat budget with diagnostic tendency')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_heatbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd heat budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-heattend_calc(x1,y1,:,t)+heatadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(heatmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(heatres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('degC/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
title('heat budget with diagnostic tendency')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_heatbudget_box_3_2','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(heattend(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(heatairsea(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(heatsw(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(heatmix(x1,y1,:,t)),RC,'LineWidth',lw);
h5 = plot(squeeze(heatcorr(x1,y1,:,t)),RC,'LineWidth',lw);
h6 = plot(squeeze(heatadv(x1,y1,:,t)),RC,'LineWidth',lw);
h7 = plot(squeeze(heatres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('degC/s');
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1)],'tend','air sea','shortwave','mix','corr','adv','res')
title('heat budget with calculated tendency')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_heatbudget_box_3_3','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd heat budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-heattend_calc(x1,y1,:,t)+heatadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(heatmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(heatres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('degC/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
title('heat budget with calculated tendency')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_heatbudget_box_3_4','-dpng')


close all

for z1=32 % 150 m, 650 m
    
    depth = round(-RF(z1+1));
    if z1==17
        depth = 150;
    end
    
    
    % plot 2D maps
    c1 = -8:1:8;
    c2 = [-6 6];
    
    % vertical integral
    % multiply by cell thickness
    % convert s^-1 to year^-1
    speryr = 86400*365.25;
    % units are then mol/m2/yr
    dzt = repmat(dz,[1 1 1 nt]);
    tend_intz = squeeze(cumsum(heattend_calc.*dzt,3))*speryr; %clear tend
    mix_intz = squeeze(cumsum(heatmix.*dzt,3))*speryr; %clear mix
    adv_intz = squeeze(cumsum(heatadv.*dzt,3))*speryr; %clear adv
    adv_v_intz = squeeze(cumsum(heatadv_v.*dzt,3))*speryr; %clear adv_v
    adv_h_intz = squeeze(cumsum(heatadv_h.*dzt,3))*speryr; %clear adv_h
    res_intz = squeeze(cumsum(heatres.*dzt,3))*speryr; %clear res
    surf_intz = squeeze(cumsum(heatsurf.*dzt,3))*speryr; %clear surf
    
    fprintf('making 9-plot heat budget \n')
    figure()
    set(gcf, 'Position', [1, 1, 1600, 1000])
    subplot(3,3,1);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(tend_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    colormap(acc_colormap('cmo_balance'))
    title('tend');
    
    
    subplot(3,3,5);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(surf_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('surf');
    
    subplot(3,3,4);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(adv_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('adv');
    
    subplot(3,3,3);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(mix_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('mix');
    
    
    subplot(3,3,7);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(adv_h_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('adv horiz');
    
    subplot(3,3,8);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(adv_v_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('adv vert');
    
    
    axes('position',[.91 .115 .02 .2]);
    contourf([0 1],c1,[c1;c1]',c1,'LineStyle','none');
    caxis(c2); ylim(c2);
    set(gca,'xtick','')
    set(gcf,'InvertHardCopy','off'); print('-r200','heatbudget_boxes_3','-dpng')
    
end % for z
close all
%% heat

%% salt budget
% initialize
RF = RF([z z(end)+1]);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

saltsw = zeros(nx,ny,nz,nt);
saltairsea = zeros(nx,ny,nz,nt);
saltdilut = zeros(nx,ny,nz,nt);
saltbio = zeros(nx,ny,nz,nt);
saltmix = zeros(nx,ny,nz,nt);
saltadv = zeros(nx,ny,nz,nt);
saltadv_h = zeros(nx,ny,nz,nt);
saltadv_v = zeros(nx,ny,nz,nt);
saltdiv = zeros(nx,ny,nz,nt);
saltcorr = zeros(nx,ny,nz,nt);
salttend = zeros(nx,ny,nz,nt);
salttend_calc = zeros(nx,ny,nz,nt);

for t=2:13
    fprintf('salt step number %g \n',t-1)
    % tendency due to precip
    % diagnostic: oceSflux
    charairsea = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    oceSflux = rdmds(charairsea,'rec',8);
    saltsw(:,:,1,t-1) = oceSflux(x,y)./(dz(:,:,1))./rho;
    
    % tendency due to air-sea flux
    % diagnostic: SFLUX
    flux = rdmds(charairsea,'rec',2);
    
    % divide by thickness of first layer
    % (hFacC accounts for partial cells)
    saltairsea(:,:,1,t-1) = (flux(x,y)-oceSflux(x,y))./(dz(:,:,1))./rho;
    
    % advection
    % diagnostics: ADVx_TH, ADVy_TH, ADVr_TH
    charsalt = [str,'diag_S_budget.',num2str(1460*t,'%010.f')];
    advflux = rdmds(charsalt,'rec',1:3);
    
    % correction
    % diagnostic: WSLTMASS
    tmp = rdmds(charsalt,'rec',11);
    saltcorr(:,:,1,t-1) = tmp(x,y,1)./dz(:,:,1);
    
    advflux_x = advflux([x x(end)+1],y,z,2);
    advflux_y = advflux(x,[y y(end)+1],z,3);
    if z(end)==52
        advflux_z = advflux(x,y,[z z(end)],3);
        advflux_z(:,:,end) = 0*advflux_z(:,:,end);
    else
        advflux_z = advflux(x,y,[z z(end)+1],3);
    end
    adv_x = diff(advflux_x,1,1)./volume;
    adv_y = diff(advflux_y,1,2)./volume;
    adv_z = -diff(advflux_z,1,3)./volume;
    
    % minus sign because advective flux is on lhs, moving to rhs
    saltadv(:,:,:,t-1) = -(adv_x + adv_y + adv_z);
    
    
    % divergence
    % diagnostics: UVEL, VVEL, WVEL
    charstate = [str,'diag_state.',num2str(1460*t,'%010.f')];
    vel = rdmds(charstate,'rec',3:5);
    
    U = vel([x x(end)+1],y,z,1).*areaWest;
    V = vel(x,[y y(end)+1],z,2).*areaSouth;
    if z(end)==52
        W = vel(x,y,[z z(end)],3).*areaTop;
        W(:,:,end) = 0*W(:,:,end);
    else
        W = vel(x,y,[z z(end)+1],3).*areaTop;
    end
    div_x=diff(U,1,1)./volume;
    div_y=diff(V,1,2)./volume;
    div_z=-diff(W,1,3)./volume;
    
    % tracer field (deg C)
    tmp = rdmds(charstate,'rec',2);
    tracer = tmp(x,y,z);
    saltdiv(:,:,:,t-1) = tracer.*(div_x + div_y + div_z);
    
    % advection components
    saltadv_h(:,:,:,t-1) = -(adv_x + adv_y)+tracer.*(div_x + div_y);
    saltadv_v(:,:,:,t-1) = -(adv_z)+tracer.*(div_z);
    
    saltadv(:,:,:,t-1) = saltadv_h(:,:,:,t-1) + saltadv_v(:,:,:,t-1);
    
    % mixing
    % diagnostics: DFxETr04, DFyETr04, DFrITr04
    % diffusive flux (mol/s)
    diffflux = rdmds(charsalt,'rec',4:6);
    diffflux_x = diffflux([x x(end)+1],y,z,1);
    diffflux_y = diffflux(x,[y y(end)+1],z,2);
    if z(end)==52
        diffflux_z = diffflux(x,y,[z z(end)],3);
        diffflux_z(:,:,end) = 0*diffflux_z(:,:,end);
    else
        diffflux_z = diffflux(x,y,[z z(end)+1],3);
    end
    mix_x = diff(diffflux_x,1,1)./volume;
    mix_y = diff(diffflux_y,1,2)./volume;
    mix_z = -diff(diffflux_z,1,3)./volume;
    
    % minus sign because diffusive flux is on lhs, moving to rhs
    saltmix(:,:,:,t-1) = -(mix_x + mix_y + mix_z);
    
    % total tendency
    
    snap = rdmds([str,'diag_snaps'],[1460*(t-1) 1460*t],'rec',2);
    salttend_calc(:,:,:,t-1) = diff(snap(x,y,z,:),1,4)/dt;
    
    tmp = rdmds(charsalt,'rec',10);
    salttend(:,:,:,t-1) = tmp(x,y,z)./86400;
    
end % for t

clear tmp snap flux mix_* diffflux* div_* vel U V W advflux*



% fix divisions by hFacC=0
saltairsea(isnan(saltairsea)) = 0;
saltadv(isnan(saltadv)) = 0;
saltadv_h(isnan(saltadv_h)) = 0;
saltadv_v(isnan(saltadv_v)) = 0;
saltmix(isnan(saltmix)) = 0;
saltcorr(isnan(saltcorr)) = 0;


% remove correction from advection
% saltadv = saltadv-saltcorr;
% saltadv_v = saltadv_v-saltcorr;


% residual
tmp=saltairsea+saltsw;
tmp2=saltadv-saltcorr;
% saltres = tmp2+saltdiv+saltmix+tmp-salttend;
saltres = tmp2+saltmix+tmp-salttend;
saltres0 = tmp2+saltmix+tmp-salttend;
saltres2 = tmp2+saltmix+tmp;
% saltres1 = saltadv+saltdiv+saltmix+saltairsea+saltsw-saltcorr-salttend_calc;
saltres1 = saltadv+saltmix+saltairsea+saltsw-saltcorr-salttend_calc;

save SALT3_budget salt* XC YC RC hFacC area* volume dz DRF

saltadv=saltadv+saltdiv;

% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;

fprintf('making 1st salt budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(salttend_calc(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(saltres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1),h4(1)],'tend','mix','adv','res')
title('salt budget with diagnostic tendency')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_saltbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd salt budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-salttend_calc(x1,y1,:,t)+saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
title('salt budget with diagnostic tendency')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_saltbudget_box_3_2','-dpng')

fprintf('making 1st salt budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(salttend_calc(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(saltres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1),h4(1)],'tend','mix','adv','res')
title('salt budget with calculated tendency')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_saltbudget_box_3_3','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd salt budget at single point \n \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-salttend_calc(x1,y1,:,t)+saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
title('salt budget with calculated tendency')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_saltbudget_box_3_4','-dpng')

%% salt

%% dic
% initialize
dicsurf = zeros(nx,ny,nz,nt);
dicdilut = zeros(nx,ny,nz,nt);
dicbio = zeros(nx,ny,nz,nt);
dicmix = zeros(nx,ny,nz,nt);
dicadv = zeros(nx,ny,nz,nt);
dicadv_h = zeros(nx,ny,nz,nt);
dicadv_v = zeros(nx,ny,nz,nt);
diccorr = zeros(nx,ny,nz,nt);
dicdiv = zeros(nx,ny,nz,nt);
dictend = zeros(nx,ny,nz,nt);

for t=2:13
    fprintf('dic step number %g \n',t-1)
    % tendency due to air-sea flux
    % diagnostic: BLGCFLX
    % surface flux (mol/m3/s)
    charairsea = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    flux = rdmds(charairsea,'rec',3);
    fprintf('flux size: %g \n',size(flux))
    fprintf('DRF*squeezehFacC size: %g \n',size((DRF(1)*squeeze(hFacC(:,:,1)))))
    fprintf('dz size: %g \n',size(dz))
    dicsurf(:,:,1,t-1) = flux(x,y)./(dz(:,:,1));
    
    % tendency due to dilution
    % diagnostic: FORCTR01
    % forcing tendency (mol/m3/s) includes effects of E-P-R and sponge layer contributions
    chardic = [str,'diag_dic_budget.',num2str(1460*t,'%010.f')];
    tmp = rdmds(chardic,'rec',11);
    dicdilut(:,:,1,t-1) = tmp(x,y,1);
    
    % tendency due to biology
    % diagnostic: BLGBIOC
    % - uptake + remin + carbonate system (mol/m3/s)
    tmp = rdmds(chardic,'rec',10);
    dicbio(:,:,:,t-1) = tmp(x,y,z);
    
    % advection
    % diagnostics: ADVxTr01, ADVyTr01, ADVrTr01
    % advective flux (mol/s)
    advflux = rdmds(chardic,'rec',1:3);
    
    advflux_x = advflux([x x(end)+1],y,z,1);
    advflux_y = advflux(x,[y y(end)+1],z,2);
    if z(end)==52
        advflux_z = advflux(x,y,[z z(end)],3);
        advflux_z(:,:,end) = 0*advflux_z(:,:,end);
    else
        advflux_z = advflux(x,y,[z z(end)+1],3);
    end
    adv_x = diff(advflux_x,1,1)./volume;
    adv_y = diff(advflux_y,1,2)./volume;
    adv_z = -diff(advflux_z,1,3)./volume;
    
    % minus sign because advective flux is on lhs, moving to rhs
    dicadv(:,:,:,t-1) = -(adv_x + adv_y + adv_z);
    
    % divergence
    % diagnostics: UVEL, VVEL, WVEL
    charstate = [str,'diag_state.',num2str(1460*t,'%010.f')];
    vel = rdmds(charstate,'rec',3:5);
    
    U = vel([x x(end)+1],y,z,1).*areaWest;
    V = vel(x,[y y(end)+1],z,2).*areaSouth;
    if z(end)==52
        W = vel(x,y,[z z(end)],3).*areaTop;
        W(:,:,end) = 0*W(:,:,end);
    else
        W = vel(x,y,[z z(end)+1],3).*areaTop;
    end
    div_x=diff(U,1,1)./volume;
    div_y=diff(V,1,2)./volume;
    div_z=-diff(W,1,3)./volume;
    
    % tracer field (mol/m3)
    charbgc = [str,'diag_bgc.',num2str(1460*t,'%010.f')];
    tmp = rdmds(charbgc,'rec',1);
    tracer = tmp(x,y,z);
    dicdiv(:,:,:,t-1) = tracer.*(div_x + div_y + div_z);
    
    % advection components
    dicadv_h(:,:,:,t-1) = -(adv_x + adv_y)+tracer.*(div_x + div_y);
    dicadv_v(:,:,:,t-1) = -(adv_z)+tracer.*(div_z);
    
    dicadv(:,:,:,t-1) = dicadv_h(:,:,:,t-1) + dicadv_v(:,:,:,t-1);
    
    % correction to vertical advection at z=0
    % diagnostic: WTRAC01
    tmp = rdmds(chardic,'rec',9);
    diccorr(:,:,1,t-1) = tmp(x,y,1)./dz(:,:,1);
    
    % mixing
    % diagnostics: DFxETr01, DFyETr01, DFrITr01
    % diffusive flux (mol/s)
    diffflux = rdmds(chardic,'rec',4:6);
    diffflux_x = diffflux([x x(end)+1],y,z,1);
    diffflux_y = diffflux(x,[y y(end)+1],z,2);
    if z(end)==52
        diffflux_z = diffflux(x,y,[z z(end)],3);
        diffflux_z(:,:,end) = 0*diffflux_z(:,:,end);
    else
        diffflux_z = diffflux(x,y,[z z(end)+1],3);
    end
    mix_x = diff(diffflux_x,1,1)./volume;
    mix_y = diff(diffflux_y,1,2)./volume;
    mix_z = -diff(diffflux_z,1,3)./volume;
    
    % minus sign because diffusive flux is on lhs, moving to rhs
    dicmix(:,:,:,t-1) = -(mix_x + mix_y + mix_z);
    
    % total tendency
    
    snap = rdmds([str,'diag_snaps'],[1460*(t-1) 1460*t],'rec',3);
    dictend(:,:,:,t-1) = diff(snap(x,y,z,:),1,4)/dt;
    
end % for t

clear tmp snap flux mix_* diffflux* div_* vel U V W advflux*



% fix divisions by hFacC=0
dicsurf(isnan(dicsurf)) = 0;
dicadv(isnan(dicadv)) = 0;
dicadv_h(isnan(dicadv_h)) = 0;
dicadv_v(isnan(dicadv_v)) = 0;
dicmix(isnan(dicmix)) = 0;
diccorr(isnan(diccorr)) = 0;


% remove correction from advection
dicadv = dicadv-diccorr;
dicadv_v = dicadv_v-diccorr;


% residual
res = dicadv+dicdiv+dicmix+dicbio+dicsurf+dicdilut-dictend;

dicadv=dicadv+dicdiv;
clear div;

save DIC3_budget dic* XC YC RC res hFacC area* volume dz DRF


% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;

fprintf('making 1st DIC budget at single point \n')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(dictend(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(dicsurf(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(dicdilut(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(dicmix(x1,y1,:,t)),RC,'LineWidth',lw);
h5 = plot(squeeze(dicbio(x1,y1,:,t)),RC,'LineWidth',lw);
h6 = plot(squeeze(dicadv(x1,y1,:,t)),RC,'LineWidth',lw);
h7 = plot(squeeze(res(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('mol/m3/s');
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1)],...
    'tend','surf','sed','mix','bio','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_dicbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd DIC budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-dictend(x1,y1,:,t)+dicadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(dicsurf(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(dicmix(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(dicbio(x1,y1,:,t)),RC,'LineWidth',lw);
h5 = plot(squeeze(res(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('mol/m3/s');
legend([h1(1),h2(1),h3(1),h4(1),h5(1)],'mat deriv','surf','mix','bio','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_dicbudget_box_3_2','-dpng')
%% dic

close all
toc()
