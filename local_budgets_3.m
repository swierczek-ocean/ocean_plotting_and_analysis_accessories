
%%

% hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
% hFacW = rdmds('../MITgcm/verification/SO3_20190513/run/hFacW');
% hFacS = rdmds('../MITgcm/verification/SO3_20190513/run/hFacS');
% DXG = rdmds('../MITgcm/verification/SO3_20190513/run/DXG');
% DYG = rdmds('../MITgcm/verification/SO3_20190513/run/DYG');
% DXC = rdmds('../MITgcm/verification/SO3_20190513/run/DXC');
% DYC = rdmds('../MITgcm/verification/SO3_20190513/run/DYC');
% XC = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
% YC = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
% RAC = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RAC'));
% RC = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC'));
% RF = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RF'));
% DRF = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/DRF'));
% str = '../MITgcm/verification/SO3_20190513/diag/';
% strs = '../MITgcm/verification/SO3_20190513/diag_slice/';
% strb = '../MITgcm/verification/SO3_20190513/diag_budgets/';
% strsn = '../MITgcm/verification/SO3_20190513/diag_snaps/';


sec = 2628000;
dt = sec;

%% heat, salt, carbon, nitrate, and phyto inventories

% heat_inv3_box_ab = zeros(396,1);
% salt_inv3_box_ab = zeros(396,1);
% carbon_inv3_box_ab = zeros(396,1);
% nitrate_inv3_box_ab = zeros(396,1);
% oxygen_inv3_box_ab = zeros(396,1);
% phyto_inv3_box_ab = zeros(396,1);
% 
% tfield = 1;
% sfield = 2;
% cfield = 1;
% nfield = 4;
% phfield = 9;
% ofield = 3;
% 
% ab_ind_w = 6;
% ab_ind_e = 170;
% ab_ind_s = 26;
% ab_ind_n = 119;
% 
% lw = 2.6;
% 
% cp_oce = 3994; % J/(kg deg C)
% rho = 1035; % kg/m^3
% 
% 
% 
% for ii=1:396
%     charstate = [strs,'diag_state.',num2str(48*ii,'%010.f')];
%     THETA = rdmds(charstate,'rec',tfield);
%     heat_inv3_box_ab(ii) = sum(sum(sum(cp_oce*rho*THETA(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:))));
%     SALT = rdmds(charstate,'rec',sfield);
%     salt_inv3_box_ab(ii) = sum(sum(sum(1000*rho*SALT(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:))));
%     clear THETA
%     charbgc = [strs,'diag_bgc.',num2str(48*ii,'%010.f')];
%     CARBON = rdmds(charbgc,'rec',cfield);
%     carbon_inv3_box_ab(ii) = sum(sum(sum(CARBON(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:))));
%     NITRATE = rdmds(charbgc,'rec',nfield);
%     nitrate_inv3_box_ab(ii) = sum(sum(sum(NITRATE(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:))));
%     OXYGEN = rdmds(charbgc,'rec',ofield);
%     oxygen_inv3_box_ab(ii) = sum(sum(sum(OXYGEN(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:))));
%     PHYTO = rdmds(charbgc,'rec',phfield);
%     phyto_inv3_box_ab(ii) = sum(sum(sum(PHYTO(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
%         ab_ind_s:ab_ind_n,:))));
%     clear CARBON NITRATE PHYTO
% end
% 
% save carbon_inv3 carbon_inv3*
% save nitrate_inv3 nitrate_inv3*
% save phyto_inv3 phyto_inv3*
% save heat_inv3 heat_inv3*
% save salt_inv3 salt_inv3*
% save oxygen_inv3 oxygen_inv3*


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

% read diagnostics
% calculate tendencies in mol/m3/s

% read diagnostics
% calculate tendencies in mol/m3/s
for t=2:13
    
    % tendency due to air-sea flux
    % diagnostic: BLGCFLX
    % surface flux (mol/m3/s)
    charairsea = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    flux = rdmds(charairsea,'rec',3);
    dicsurf(:,:,1,t-1) = flux(x,y)./(DRF(1)*squeeze(hFacC(:,:,1)));
    
    % tendency due to dilution
    % diagnostic: FORCTR01
    % forcing tendency (mol/m3/s) includes effects of E-P-R and sponge layer contributions
    chardic = [strb,'diag_dic_budget.',num2str(1460*t,'%010.f')];
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
    
    snap = rdmds([strsn,'diag_snaps'],[1460*(t-1) 1460*t],'rec',3);
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

save DIC3_budget dic* XC YC RC res


% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;

fprintf('making 1st DIC budget at single point')

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
set(gcf,'InvertHardCopy','off'); print('-r300','single_dicbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd DIC budget at single point')
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
set(gcf,'InvertHardCopy','off'); print('-r300','single_dicbudget_box_3_2','-dpng')





for z1=[17 32] % 150 m, 650 m
    
    depth = round(-RF(z1+1));
    if z1==17
        depth = 150;
    end
    
    
    % plot 2D maps
    c1=-8:.2:8;
    c2=[-5 5];
    
    % vertical integral
    % multiply by cell thickness
    % convert s^-1 to year^-1
    speryr = 86400*365.25;
    % units are then mol/m2/yr
    dzt = repmat(dz,[1 1 1 nt]);
    tend_intz = squeeze(cumsum(dictend.*dzt,3))*speryr; %clear tend
    dilut_intz = squeeze(cumsum(dicdilut.*dzt,3))*speryr; %clear dilut
    surf_intz = squeeze(cumsum(dicsurf.*dzt,3))*speryr; %clear surf
    bio_intz = squeeze(cumsum(dicbio.*dzt,3))*speryr; %clear bio
    mix_intz = squeeze(cumsum(dicmix.*dzt,3))*speryr; %clear mix
    adv_intz = squeeze(cumsum(dicadv.*dzt,3))*speryr; %clear adv
    adv_v_intz = squeeze(cumsum(dicadv_v.*dzt,3))*speryr; %clear adv_v
    adv_h_intz = squeeze(cumsum(dicadv_h.*dzt,3))*speryr; %clear adv_h
    res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res
    
    fprintf('making 9-plot DIC budget')
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
    
    subplot(3,3,2);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(bio_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('bio');
    
    subplot(3,3,5);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(surf_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('surf');
    
    subplot(3,3,6);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(dilut_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('dilut');
    
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
    set(gcf,'InvertHardCopy','off'); print('-r300','single_dicbudget_box_3_3','-dpng')
    
end % for z
%% end DIC

%% NO3 budget
% initialize
no3surf = zeros(nx,ny,nz,nt);
no3dilut = zeros(nx,ny,nz,nt);
no3bio = zeros(nx,ny,nz,nt);
no3mix = zeros(nx,ny,nz,nt);
no3adv = zeros(nx,ny,nz,nt);
no3adv_h = zeros(nx,ny,nz,nt);
no3adv_v = zeros(nx,ny,nz,nt);
no3corr = zeros(nx,ny,nz,nt);
no3div = zeros(nx,ny,nz,nt);
no3tend = zeros(nx,ny,nz,nt);

% read diagnostics
% calculate tendencies in mol/m3/s

% read diagnostics
% calculate tendencies in mol/m3/s
for t=2:13
    
    charno3 = [strb,'diag_no3_budget.',num2str(1460*t,'%010.f')];
    % % tendency due to dilution
    % % diagnostic: FORCTR04
    tmp = rdmds(charno3,'rec',11);
    no3dilut(:,:,1,t-1) = tmp(x,y,1);
    
    % tendency due to biology
    % diagnostic: BLGBION
    % - uptake + remin + carbonate system (mol/m3/s)
    tmp = rdmds(charno3,'rec',10);
    no3bio(:,:,:,t-1) = tmp(x,y,z);
    
    % advection
    % diagnostics: ADVxTr04, ADVyTr04, ADVrTr04
    % advective flux (mol/s)
    advflux = rdmds(charno3,'rec',1:3);
    
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
    no3adv(:,:,:,t-1) = -(adv_x + adv_y + adv_z);
    
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
    tmp = rdmds(charbgc,'rec',4);
    tracer = tmp(x,y,z);
    no3div(:,:,:,t-1) = tracer.*(div_x + div_y + div_z);
    
    % advection components
    no3adv_h(:,:,:,t-1) = -(adv_x + adv_y)+tracer.*(div_x + div_y);
    no3adv_v(:,:,:,t-1) = -(adv_z)+tracer.*(div_z);
    
    % correction to vertical advection at z=0
    % diagnostic: WTRAC04
    tmp = rdmds(charno3,'rec',9);
    no3corr(:,:,1,t-1) = tmp(x,y,1)./dz(:,:,1);
    
    % mixing
    % diagnostics: DFxETr04, DFyETr04, DFrITr04
    % diffusive flux (mol/s)
    diffflux = rdmds(charno3,'rec',4:6);
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
    no3mix(:,:,:,t-1) = -(mix_x + mix_y + mix_z);
    
    % total tendency
    
    snap = rdmds([strsn,'diag_snaps'],[1460*(t-1) 1460*t],'rec',6);
    no3tend(:,:,:,t-1) = diff(snap(x,y,z,:),1,4)/dt;
    
end % for t

clear tmp snap flux mix_* diffflux* div_* vel U V W advflux*



% fix divisions by hFacC=0
no3adv(isnan(no3adv)) = 0;
no3adv_h(isnan(no3adv_h)) = 0;
no3adv_v(isnan(no3adv_v)) = 0;
no3mix(isnan(no3mix)) = 0;
no3corr(isnan(no3corr)) = 0;


% remove correction from advection
no3adv = no3adv-no3corr;
no3adv_v = no3adv_v-no3corr;


% residual
res = no3adv+no3div+no3mix+no3bio-no3tend;
% res = no3adv+no3div+no3mix+no3bio+no3dilut-no3tend;

no3adv=no3adv+no3div;
clear div;

save NO33_budget no3* XC YC RC res



% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;
fprintf('making 1st NO3 budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(no3tend(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(no3mix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(no3bio(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(no3adv(x1,y1,:,t)),RC,'LineWidth',lw);
h5 = plot(squeeze(res(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('mol/m3/s');
legend([h1(1),h2(1),h3(1),h4(1),h5(1)],'tend','mix','bio','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_no3budget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"


fprintf('making 2nd NO3 budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-no3tend(x1,y1,:,t)+no3adv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(no3mix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(no3bio(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(res(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('mol/m3/s');
legend([h1(1),h2(1),h3(1),h4(1)],'mat deriv','mix','bio','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_no3budget_box_3_2','-dpng')




for z1=[17 32] % 150 m, 650 m
    
    depth = round(-RF(z1+1));
    if z1==17
        depth = 150;
    end
    
    
    % plot 2D maps
    c1=-2:.1:2;
    c2=[-2 2];
    
    % vertical integral
    % multiply by cell thickness
    % convert s^-1 to year^-1
    speryr = 86400*365.25;
    % units are then mol/m2/yr
    dzt = repmat(dz,[1 1 1 nt]);
    tend_intz = squeeze(cumsum(no3tend.*dzt,3))*speryr; %clear tend
    bio_intz = squeeze(cumsum(no3bio.*dzt,3))*speryr; %clear bio
    mix_intz = squeeze(cumsum(no3mix.*dzt,3))*speryr; %clear mix
    adv_intz = squeeze(cumsum(no3adv.*dzt,3))*speryr; %clear adv
    adv_v_intz = squeeze(cumsum(no3adv_v.*dzt,3))*speryr; %clear adv_v
    adv_h_intz = squeeze(cumsum(no3adv_h.*dzt,3))*speryr; %clear adv_h
    res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res
    
    
    fprintf('making 9-plot NO3 budget')
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
    
    subplot(3,3,2);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(bio_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('bio');
    
    subplot(3,3,5);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(surf_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('surf');
    
    subplot(3,3,6);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(dilut_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('dilut');
    
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
    set(gcf,'InvertHardCopy','off'); print('-r300','single_no3budget_box_3_3','-dpng')
    
end % for z
%% end NO3

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

% read diagnostics
% calculate tendencies in mol/m3/s

% read diagnostics
% calculate tendencies in mol/m3/s
for t=2:13
    
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
    
    charheat = [strb,'diag_T_budget.',num2str(1460*t,'%010.f')];
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
    
    snap = rdmds([strsn,'diag_snaps'],[1460*(t-1) 1460*t],'rec',1);
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
% heatadv = heatadv-heatcorr;
% heatadv_v = heatadv_v-heatcorr;


% residual
tmp=heatairsea+heatsw;
tmp2=heatadv-heatcorr;
heatres = tmp2+heatdiv+heatmix+tmp-heattend;
heatres0 = tmp2+heatmix+tmp-heattend;
heatres2 = tmp2+heatmix+tmp;
heatres1 = heatadv+heatdiv+heatmix+heatairsea+heatsw-heatcorr-heattend_calc;
% res = heatadv+heatdiv+heatmix+heatbio+heatdilut-heattend;

save HEAT3_budget heat* XC YC RC

heatadv=heatadv+heatdiv;

% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;

fprintf('making 1st heat budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(heattend_calc(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(heatmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(heatadv(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(heatres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('degC/s');
legend([h1(1),h2(1),h3(1),h4(1)],'tend','mix','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_heatbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd heat budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-heattend_calc(x1,y1,:,t)+heatadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(heatmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(heatres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('degC/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_heatbudget_box_3_2','-dpng')

fprintf('making 1st heat budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(heattend_calc(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(heatmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(heatadv(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(heatres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('degC/s');
legend([h1(1),h2(1),h3(1),h4(1)],'tend','mix','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_heatbudget_box_3_3','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd heat budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-heattend_calc(x1,y1,:,t)+heatadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(heatmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(heatres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('degC/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_heatbudget_box_3_4','-dpng')


for z1=[17 32] % 150 m, 650 m
    
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
    res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res
    
    
    fprintf('making 9-plot heat budget')
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
    set(gcf,'InvertHardCopy','off'); print('-r300','single_heatbudget_box_3_3','-dpng')
    
end % for z

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

z1=RF(1:end-1); z2=RF(2:end);
swfrac = 0.62*exp(z1/0.6)+(1.0-0.62)*exp(z1/20.0);
swfrac1 = 0.62*exp(z2/0.6)+(1.0-0.62)*exp(z2/20.0);
swfrac = permute(repmat(swfrac,1,nx,ny),[2 3 1]);
swfrac1 = permute(repmat(swfrac1,1,nx,ny),[2 3 1]);
rho=1035; Cp=3994;

% read diagnostics
% calculate tendencies in mol/m3/s

% read diagnostics
% calculate tendencies in mol/m3/s
for t=2:13
    
    % tendency due to precip
    % diagnostic: oceSflux
    charairsea = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    oceSflux = rdmds(charairsea,'rec',8);
    saltsw(:,:,1,t-1) = oceSflux./(dz(:,:,1))./rho;
    
    % tendency due to air-sea flux
    % diagnostic: SFLUX
    flux = rdmds(charairsea,'rec',2);
    % divide by thickness of first layer
    % (hFacC accounts for partial cells)
    saltairsea(:,:,1,t-1) = (flux(x,y)-oceSflux(x,y))./(dz(:,:,1))./rho;
    
    % advection
    % diagnostics: ADVx_TH, ADVy_TH, ADVr_TH
    charsalt = [strb,'diag_S_budget.',num2str(1460*t,'%010.f')];
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
    tmp = rdmds(charstate,'rec',1);
    tracer = tmp(x,y,z);
    saltdiv(:,:,:,t-1) = tracer.*(div_x + div_y + div_z);
    
    % advection components
    saltadv_h(:,:,:,t-1) = -(adv_x + adv_y)+tracer.*(div_x + div_y);
    saltadv_v(:,:,:,t-1) = -(adv_z)+tracer.*(div_z);
    
    
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
    
    snap = rdmds([strsn,'diag_snaps'],[1460*(t-1) 1460*t],'rec',2);
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
saltres = tmp2+saltdiv+saltmix+tmp-salttend;
saltres0 = tmp2+saltmix+tmp-salttend;
saltres2 = tmp2+saltmix+tmp;
saltres1 = saltadv+saltdiv+saltmix+saltairsea+saltsw-saltcorr-salttend_calc;
% res = saltadv+saltdiv+saltmix+saltbio+saltdilut-salttend;

save SALT3_budget salt* XC YC RC

saltadv=saltadv+saltdiv;

% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;

fprintf('making 1st salt budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(salttend_calc(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(saltres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1),h4(1)],'tend','mix','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_saltbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd salt budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-salttend_calc(x1,y1,:,t)+saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_saltbudget_box_3_2','-dpng')

fprintf('making 1st salt budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(salttend_calc(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(saltres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1),h4(1)],'tend','mix','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_saltbudget_box_3_3','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd salt budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-salttend_calc(x1,y1,:,t)+saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_saltbudget_box_3_4','-dpng')


for z1=[17 32] % 150 m, 650 m
    
    depth = round(-RF(z1+1));
    if z1==17
        depth = 150;
    end
    
    
    % plot 2D maps
    c1=-8:.2:8;
    c2=[-5 5];
    
    % vertical integral
    % multiply by cell thickness
    % convert s^-1 to year^-1
    speryr = 86400*365.25;
    % units are then mol/m2/yr
    dzt = repmat(dz,[1 1 1 nt]);
    tend_intz = squeeze(cumsum(salttend_calc.*dzt,3))*speryr; %clear tend
    mix_intz = squeeze(cumsum(saltmix.*dzt,3))*speryr; %clear mix
    adv_intz = squeeze(cumsum(saltadv.*dzt,3))*speryr; %clear adv
    adv_v_intz = squeeze(cumsum(saltadv_v.*dzt,3))*speryr; %clear adv_v
    adv_h_intz = squeeze(cumsum(saltadv_h.*dzt,3))*speryr; %clear adv_h
    res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res
    
    
    fprintf('making 9-plot salt budget')
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
    set(gcf,'InvertHardCopy','off'); print('-r300','single_saltbudget_box_3_3','-dpng')
    
end % for z

%% salt

%% O2 budget
% initialize
o2surf = zeros(nx,ny,nz,nt);
o2dilut = zeros(nx,ny,nz,nt);
o2bio = zeros(nx,ny,nz,nt);
o2mix = zeros(nx,ny,nz,nt);
o2adv = zeros(nx,ny,nz,nt);
o2adv_h = zeros(nx,ny,nz,nt);
o2adv_v = zeros(nx,ny,nz,nt);
o2corr = zeros(nx,ny,nz,nt);
o2div = zeros(nx,ny,nz,nt);
o2tend = zeros(nx,ny,nz,nt);

% read diagnostics
% calculate tendencies in mol/m3/s

% read diagnostics
% calculate tendencies in mol/m3/s
for t=2:13
    charo2 = [strb,'diag_o2_budget.',num2str(1460*t,'%010.f')];
    % tendency due to air-sea flux
    % diagnostic: BLGOFLX
    % surface flux (mol/m3/s)
    charairsea = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    flux = rdmds(charairsea,'rec',4);
    
    o2surf(:,:,1,t-1) = flux(x,y)./(DRF(1)*squeeze(hFacC(:,:,1)));
    
    % tendency due to biology
    % diagnostic: BLGBIOO
    % - uptake + remin + carbonate system (mol/m3/s)
    tmp = rdmds(charo2,'rec',10);
    o2bio(:,:,:,t-1) = tmp(x,y,z);
    
    % advection
    % diagnostics: ADVxTr04, ADVyTr04, ADVrTr04
    % advective flux (mol/s)
    advflux = rdmds(charo2,'rec',1:3);
    
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
    o2adv(:,:,:,t-1) = -(adv_x + adv_y + adv_z);
    
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
    tmp = rdmds(charbgc,'rec',4);
    tracer = tmp(x,y,z);
    o2div(:,:,:,t-1) = tracer.*(div_x + div_y + div_z);
    
    % advection components
    o2adv_h(:,:,:,t-1) = -(adv_x + adv_y)+tracer.*(div_x + div_y);
    o2adv_v(:,:,:,t-1) = -(adv_z)+tracer.*(div_z);
    
    % correction to vertical advection at z=0
    % diagnostic: WTRAC04
    tmp = rdmds(charo2,'rec',9);
    o2corr(:,:,1,t-1) = tmp(x,y,1)./dz(:,:,1);
    
    % mixing
    % diagnostics: DFxETr04, DFyETr04, DFrITr04
    % diffusive flux (mol/s)
    diffflux = rdmds(charo2,'rec',4:6);
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
    o2mix(:,:,:,t-1) = -(mix_x + mix_y + mix_z);
    
    % total tendency
    
    snap = rdmds([strsn,'diag_snaps'],[1460*(t-1) 1460*t],'rec',5);
    o2tend(:,:,:,t-1) = diff(snap(x,y,z,:),1,4)/dt;
    
end % for t

clear tmp snap flux mix_* diffflux* div_* vel U V W advflux*



o2surf(isnan(o2surf)) = 0;
o2adv(isnan(o2adv)) = 0;
o2adv_h(isnan(o2adv_h)) = 0;
o2adv_v(isnan(o2adv_v)) = 0;
o2mix(isnan(o2mix)) = 0;
o2corr(isnan(o2corr)) = 0;


% remove correction from advection
o2adv = o2adv-o2corr;
o2adv_v = o2adv_v-o2corr;


% residual
o2res = o2adv+o2div+o2mix+o2bio+o2surf-o2tend;

save O23_budget o2* XC YC RC res



% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;
fprintf('making 1st O2 budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(o2tend(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(o2mix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(o2bio(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(o2adv(x1,y1,:,t)),RC,'LineWidth',lw);
h5 = plot(squeeze(o2res(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('mol/m3/s');
legend([h1(1),h2(1),h3(1),h4(1),h5(1)],'tend','mix','bio','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_o2budget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"


fprintf('making 2nd O2 budget at single point')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-o2tend(x1,y1,:,t)+o2adv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(o2mix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(o2bio(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(o2res(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('mol/m3/s');
legend([h1(1),h2(1),h3(1),h4(1)],'mat deriv','mix','bio','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','single_o2budget_box_3_2','-dpng')


for z1=[17 32] % 150 m, 650 m
    
    depth = round(-RF(z1+1));
    if z1==17
        depth = 150;
    end
    
    
    % plot 2D maps
    c1=-20:1:20;
    c2=[-15 15];
    
    % vertical integral
    % multiply by cell thickness
    % convert s^-1 to year^-1
    speryr = 86400*365.25;
    % units are then mol/m2/yr
    dzt = repmat(dz,[1 1 1 nt]);
    tend_intz = squeeze(cumsum(tend.*dzt,3))*speryr; %clear tend
    surf_intz = squeeze(cumsum(surf.*dzt,3))*speryr; %clear surf
    bio_intz = squeeze(cumsum(bio.*dzt,3))*speryr; %clear bio
    mix_intz = squeeze(cumsum(mix.*dzt,3))*speryr; %clear mix
    adv_intz = squeeze(cumsum(adv.*dzt,3))*speryr; %clear adv
    adv_v_intz = squeeze(cumsum(adv_v.*dzt,3))*speryr; %clear adv_v
    adv_h_intz = squeeze(cumsum(adv_h.*dzt,3))*speryr; %clear adv_h
    res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res
    
    
    figure; set(gcf,'position',[182 1 630 701],'paperpositionmode','auto');
    subplot(3,3,1);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(tend_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    colormap(redblue)
    title('tend');
    
    subplot(3,3,2);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(bio_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('bio');
    
    subplot(3,3,5);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(surf_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('surf');
    
    subplot(3,3,6);
    m_proj('ortho','lon',0,'lat',-90,'radius',60);
    m_contourf(XC(:,1),YC(1,:),mean(res_intz(:,:,z1,:),4)',c1,'LineStyle','none');
    m_coast('color',[0 0 0]);
    m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
    caxis(c2)
    title('res');
    
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
    set(gcf,'InvertHardCopy','off'); print('-r300','single_o2budget_box_3_3','-dpng')
    
end % for z
%% end O2

%% volume
ab_ind_w = 6;
ab_ind_e = 170;
ab_ind_s = 26;
ab_ind_n = 119;

% Utr = U*DYG*DRF*hFaCW
% Vtr = V*DXG*DRF*hFacS

volumediv_x = zeros(nx,ny,nz,nt);
volumediv_y = zeros(nx,ny,nz,nt);
volumediv_z = zeros(nx,ny,nz,nt);

volume_N = zeros(nt,1);
volume_S = zeros(nt,1);
volume_E = zeros(nt,1);
volume_W = zeros(nt,1);


DXG = rdmds('../MITgcm/verification/SO3_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO3_20190513/run/DYG');
DRF = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/DRF'));

% read diagnostics
% calculate tendencies in mol/m3/s

% read diagnostics
% calculate tendencies in mol/m3/s
for t=2:13
    
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
    volumediv_x=diff(U,1,1)./volume;
    volumediv_y=diff(V,1,2)./volume;
    volumediv_z=-diff(W,1,3)./volume;
    
    volume_N(t) = sum(sum(vel(ab_ind_w:ab_ind_e,ab_ind_n+1,:,2).*DXG(ab_ind_w:ab_ind_e).*...
        DRF.*hFacS(ab_ind_w:ab_ind_e,ab_ind_n+1)));
    volume_S(t) = sum(sum(vel(ab_ind_w:ab_ind_e,ab_ind_s,:,2).*DXG(ab_ind_w:ab_ind_e).*...
        DRF.*hFacS(ab_ind_w:ab_ind_e,ab_ind_s)));
    
    volume_E(t) = sum(sum(vel(ab_ind_e+1,ab_ind_s:ab_ind_n,:,1).*DYG(ab_ind_s:ab_ind_n).*...
        DRF.*hFacW(ab_ind_e,ab_ind_s:ab_ind_n)));
    volume_W(t) = sum(sum(vel(ab_ind_w,ab_ind_s:ab_ind_n,:,1).*DYG(ab_ind_s:ab_ind_n).*...
        DRF.*hFacW(ab_ind_w,ab_ind_s:ab_ind_n)));
    
end % for t

clear vel charstate

save VOLUME3_budget volume* XC YC RC

%% end volume


