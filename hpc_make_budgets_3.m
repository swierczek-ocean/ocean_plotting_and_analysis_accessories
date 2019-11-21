
%% 

hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO3_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO3_20190513/run/hFacS');
DXG = rdmds('../MITgcm/verification/SO3_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO3_20190513/run/DYG');
DXC = rdmds('../MITgcm/verification/SO3_20190513/run/DXC');
DYC = rdmds('../MITgcm/verification/SO3_20190513/run/DYC');
DRF = rdmds('../MITgcm/verification/SO3_20190513/run/DRF');
RAC = rdmds('../MITgcm/verification/SO3_20190513/run/RAC');
RF = rdmds('../MITgcm/verification/SO3_20190513/run/RF');
DRF = rdmds('../MITgcm/verification/SO3_20190513/run/DRF');
str = '../MITgcm/verification/SO3_20190513/diag/';
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';
strb = '../MITgcm/verification/SO3_20190513/diag_budgets/';
strsn = '../MITgcm/verification/SO3_20190513/diag_snaps/';


sec = 2628000;
dt = sec;

%% heat, salt, carbon, nitrate, and phyto inventories

heat_inv3_full = zeros(396,1);
heat_inv3_box_ab = zeros(396,1);
heat_inv3_box_abe = zeros(396,1);
% salt_inv3_full = zeros(396,1);
% salt_inv3_box_ab = zeros(396,1);
% salt_inv3_box_abe = zeros(396,1);
carbon_inv3_full = zeros(396,1);
carbon_inv3_box_ab = zeros(396,1);
carbon_inv3_box_abe = zeros(396,1);
nitrate_inv3_full = zeros(396,1);
nitrate_inv3_box_ab = zeros(396,1);
nitrate_inv3_box_abe = zeros(396,1);
phyto_inv3_full = zeros(396,1);
phyto_inv3_box_ab = zeros(396,1);
phyto_inv3_box_abe = zeros(396,1);

tfield = 1;
sfield = 2;
cfield = 1;
nfield = 4;
phfield = 9;

fb_ind_w = 6;
fb_ind_e = 185;
fb_ind_s = 7;
fb_ind_n = 126;

ab_ind_w = 36;
ab_ind_e = 111;
ab_ind_s = 44;
ab_ind_n = 111;

abe_ind_w = 112;
abe_ind_e = 126;
abe_ind_s = 44;
abe_ind_n = 111;

cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3



for ii=1:396
    charstate = [strs,'diag_state.',num2str(48*ii,'%010.f')];
    THETA = rdmds(charstate,'rec',tfield);
    heat_inv3_full(ii) = cp_oce*rho*sum(sum(sum(THETA(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n,:).*DRF.*RAC(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n).*hFacC(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n,:))));
    heat_inv3_box_ab(ii) = cp_oce*rho*sum(sum(sum(THETA(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    heat_inv3_box_abe(ii) = cp_oce*rho*sum(sum(sum(THETA(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n,:).*DRF.*RAC(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n).*hFacC(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n,:))));
    clear THETA
    charbgc = [strs,'diag_bgc.',num2str(48*ii,'%010.f')];
    DIC = rdmds(charbgc,'rec',cfield);
    carbon_inv3_full(ii) = sum(sum(sum(CARBON(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n,:).*DRF.*RAC(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n).*hFacC(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n,:))));
    carbon_inv3_box_ab(ii) = sum(sum(sum(CARBON(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    carbon_inv3_box_abe(ii) = sum(sum(sum(CARBON(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n,:).*DRF.*RAC(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n).*hFacC(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n,:))));
    NITRATE = rdmds(charbgc,'rec',nfield);
    nitrate_inv3_full(ii) = sum(sum(sum(NITRATE(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n,:).*DRF.*RAC(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n).*hFacC(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n,:))));
    nitrate_inv3_box_ab(ii) = sum(sum(sum(NITRATE(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    nitrate_inv3_box_abe(ii) = sum(sum(sum(NITRATE(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n,:).*DRF.*RAC(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n).*hFacC(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n,:))));
    PHYTO = rdmds(charbgc,'rec',phfield);
    phyto_inv3_full(ii) = sum(sum(sum(PHYTO(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n,:).*DRF.*RAC(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n).*hFacC(fb_ind_w:fb_ind_e,...
        fb_ind_s:fb_ind_n,:))));
    phyto_inv3_box_ab(ii) = sum(sum(sum(PHYTO(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    phyto_inv3_box_abe(ii) = sum(sum(sum(PHYTO(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n,:).*DRF.*RAC(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n).*hFacC(abe_ind_w:abe_ind_e,...
        abe_ind_s:abe_ind_n,:))));
    clear CARBON NITRATE PHYTO
end

save carbon_inv3 carbon_inv3*
save nitrate_inv3 nitrate_inv3*
save phyto_inv3 phyto_inv3*
save heat_inv3 heat_inv3*

%% DIC Budgets
nt = 12;

% select area
x = 1:191;
y = 1:131; 
z = 1:52; %
% z = 1:36; % top 1000 m

% x = 5:186;
% y = 7:127; 
% z = 1:52; %
% % z = 1:36; % top 1000 m

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

save DIC3_budget dic* XC YC RC

if 0

% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(squeeze(dictend(x1,y1,:,t)),RC); hold on
plot(squeeze(dicsurf(x1,y1,:,t)),RC);
plot(squeeze(dicdilut(x1,y1,:,t)),RC);
plot(squeeze(dicmix(x1,y1,:,t)),RC);
plot(squeeze(dicbio(x1,y1,:,t)),RC);
plot(squeeze(dicadv(x1,y1,:,t)),RC);
plot(squeeze(res(x1,y1,:,t)),RC,'--k');
ylabel('depth'); xlabel('mol/m3/s');
legend('tend','surf','sed','mix','bio','adv','res')
set(gcf,'InvertHardCopy','off'); print('-r300','single_dicbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(squeeze(-dictend(x1,y1,:,t)+dicadv(x1,y1,:,t)),RC); hold on
plot(squeeze(dicsurf(x1,y1,:,t)),RC);
plot(squeeze(dicmix(x1,y1,:,t)),RC);
plot(squeeze(dicbio(x1,y1,:,t)),RC);
plot(squeeze(res(x1,y1,:,t)),RC,'--k');
ylim([-150 0])
ylabel('depth'); xlabel('mol/m3/s');
legend('mat deriv','surf','mix','bio','res')
set(gcf,'InvertHardCopy','off'); print('-r300','single_dicbudget_box_3_2','-dpng')

end % if 0



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


figure()
set(gcf, 'Position', [1, 1, 1600, 1000])
subplot(3,2,1); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(tend_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
colormap(acc_colormap('cmo_balance'))
title('tend');

subplot(3,2,2); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(bio_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('bio');

subplot(3,2,5); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(surf_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('surf');

subplot(3,2,6); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(dilut_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('dilut');

subplot(3,2,4); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(adv_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('adv');

subplot(3,2,3); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(mix_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('mix');

if 0
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
end

axes('position',[.91 .115 .02 .2]);
contourf([0 1],c1,[c1;c1]',c1,'LineStyle','none');
caxis(c2); ylim(c2);
set(gca,'xtick','')
set(gcf,'InvertHardCopy','off'); print('-r600','single_dicbudget_box_3_3','-dpng')

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

save NO33_budget no3* XC YC RC

if 0

% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(squeeze(no3tend(x1,y1,:,t)),RC); hold on
plot(squeeze(no3mix(x1,y1,:,t)),RC);
plot(squeeze(no3bio(x1,y1,:,t)),RC);
plot(squeeze(no3adv(x1,y1,:,t)),RC);
plot(squeeze(res(x1,y1,:,t)),RC,'--k');
ylabel('depth'); xlabel('mol/m3/s');
legend('tend','mix','bio','adv','res')
set(gcf,'InvertHardCopy','off'); print('-r300','single_no3budget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(squeeze(-no3tend(x1,y1,:,t)+no3adv(x1,y1,:,t)),RC); hold on
plot(squeeze(no3mix(x1,y1,:,t)),RC);
plot(squeeze(no3bio(x1,y1,:,t)),RC);
plot(squeeze(res(x1,y1,:,t)),RC,'--k');
ylim([-150 0])
ylabel('depth'); xlabel('mol/m3/s');
legend('mat deriv','mix','bio','res')
set(gcf,'InvertHardCopy','off'); print('-r300','single_no3budget_box_3_2','-dpng')

end % if 0



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
tend_intz = squeeze(cumsum(no3tend.*dzt,3))*speryr; %clear tend
bio_intz = squeeze(cumsum(no3bio.*dzt,3))*speryr; %clear bio
mix_intz = squeeze(cumsum(no3mix.*dzt,3))*speryr; %clear mix
adv_intz = squeeze(cumsum(no3adv.*dzt,3))*speryr; %clear adv
adv_v_intz = squeeze(cumsum(no3adv_v.*dzt,3))*speryr; %clear adv_v
adv_h_intz = squeeze(cumsum(no3adv_h.*dzt,3))*speryr; %clear adv_h
res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res


figure()
set(gcf, 'Position', [1, 1, 1600, 1000])
subplot(3,2,1); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(tend_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
colormap(acc_colormap('cmo_balance'))
title('tend');

subplot(3,2,2); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(bio_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('bio');

subplot(3,2,5); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(surf_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('surf');

subplot(3,2,6); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(dilut_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('dilut');

subplot(3,2,4); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(adv_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('adv');

subplot(3,2,3); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(mix_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('mix');

if 0
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
end

axes('position',[.91 .115 .02 .2]);
contourf([0 1],c1,[c1;c1]',c1,'LineStyle','none');
caxis(c2); ylim(c2);
set(gca,'xtick','')
set(gcf,'InvertHardCopy','off'); print('-r600','single_no3budget_box_3_3','-dpng')

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
heattend_calc = zeros(nx,ny,nz,nt);
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
charheat = [strb,'diag_heat_budget.',num2str(1460*t,'%010.f')];
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

% % mixing
% % diagnostics: DFxETr01, DFyETr01, DFrITr01
% diffflux = rdmds(diag_budget_file,ts(t),'rec',4:7);
% if x(end)==1080
%  diffflux_x = diffflux([x 1],y,z,2);
% else
%  diffflux_x = diffflux([x x(end)+1],y,z,2);
% end
% diffflux_y = diffflux(x,[y y(end)+1],z,3);
% if z(end)==52
%  diffflux_z = diffflux(x,y,[z z(end)],3); 
%  diffflux_z(:,:,end) = 0*diffflux_z(:,:,end);
% else
%  diffflux_z = diffflux(x,y,[z z(end)+1],3); 
% end
% %diffflux1_z = diffflux(x,y,[z z(end)+1],1);
% mix_x = diff(diffflux_x,1,1)./volume;
% mix_y = diff(diffflux_y,1,2)./volume;
% mix_z = -diff(diffflux_z,1,3)./volume;
% mix1_z = -diff(diffflux1_z,1,3)./volume;
% 
% % minus sign because diffusive flux is on lhs, moving to rhs
% mix(:,:,:,t) = -(mix_x + mix_y + mix_z + mix1_z);

% total tendency

snap = rdmds([strsn,'diag_snaps'],[1460*(t-1) 1460*t],'rec',1);
heattend_calc(:,:,:,t-1) = diff(snap(x,y,z,:),1,4)/dt;

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
heatres = tmp2+heatdiv+heatmix+tmp-heattend;
heatres0 = tmp2+heatmix+tmp-heattend;
heatres2 = tmp2+heatmix+tmp;
heatres1 = heatadv+heatdiv+heatmix+heatairsea+heatsw-heatcorr-heattend_calc;
% res = heatadv+heatdiv+heatmix+heatbio+heatdilut-heattend;

heatadv=heatadv+heatdiv;
clear div;

save HEAT3_budget heat* XC YC RC

if 0

% check that the terms balance locally
% plot a single time, single location
t=2; x1=88; y1=84;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(squeeze(heattend_calc(x1,y1,:,t)),RC); hold on
plot(squeeze(heatmix(x1,y1,:,t)),RC);
plot(squeeze(heatadv(x1,y1,:,t)),RC);
plot(squeeze(heatres(x1,y1,:,t)),RC,'--k');
ylabel('depth'); xlabel('mol/m3/s');
legend('tend','mix','adv','res')
set(gcf,'InvertHardCopy','off'); print('-r300','single_heatbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(squeeze(-heattend_calc(x1,y1,:,t)+heatadv(x1,y1,:,t)),RC); hold on
plot(squeeze(heatmix(x1,y1,:,t)),RC);
plot(squeeze(heatres(x1,y1,:,t)),RC,'--k');
ylim([-150 0])
ylabel('depth'); xlabel('mol/m3/s');
legend('mat deriv','mix','res')
set(gcf,'InvertHardCopy','off'); print('-r300','single_heatbudget_box_3_2','-dpng')

end % if 0



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
tend_intz = squeeze(cumsum(heattend_calc.*dzt,3))*speryr; %clear tend
mix_intz = squeeze(cumsum(heatmix.*dzt,3))*speryr; %clear mix
adv_intz = squeeze(cumsum(heatadv.*dzt,3))*speryr; %clear adv
adv_v_intz = squeeze(cumsum(heatadv_v.*dzt,3))*speryr; %clear adv_v
adv_h_intz = squeeze(cumsum(heatadv_h.*dzt,3))*speryr; %clear adv_h
res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res


figure()
set(gcf, 'Position', [1, 1, 1600, 1000])
subplot(3,2,1); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(tend_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
colormap(acc_colormap('cmo_balance'))
title('tend');


subplot(3,2,5); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(surf_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('surf');

subplot(3,2,6); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(dilut_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('dilut');

subplot(3,2,4); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(adv_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('adv');

subplot(3,2,3); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(mix_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('mix');

if 0
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
end

axes('position',[.91 .115 .02 .2]);
contourf([0 1],c1,[c1;c1]',c1,'LineStyle','none');
caxis(c2); ylim(c2);
set(gca,'xtick','')
set(gcf,'InvertHardCopy','off'); print('-r600','single_heatbudget_box_3_3','-dpng')

end % for z

%% heat






