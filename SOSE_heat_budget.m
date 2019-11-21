% SOSE heat budget
% for 2008-2012 iter 105

tracername = 'THETA';

% for plotting
addpath ~/scripts_m/
addpath ~/scripts_m/m_map/
load ~/scripts_m/redbluecolormap.mat

% path to diagnostics
cd /data/soccom/SO3/optim2012/ITERATION105/ITERATION105_WtrMass5d/OUTPUT/
diag_budget_file = 'SO_Tbdg5';

% time stepping
ts = 120:120:1440;
nt = length(ts);

% select area
x = 1:1080; % all longitudes
y = 1:294; % poleward of 30S
z = 1:36; % top 1000 m

% model grid
load /data/averdy/soccom/SO3grid/grid 
XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
RF = RF([z z(end)+1]);
hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

% cell volume, face areas (for flux calculations)
volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz+1);
for k=1:nz
 volume(:,:,k) = hFacC(:,:,k).*RAC(x,y)*DRF(k);
 areaTop(:,:,k) = RAC(x,y);
 if x(end)==1080
  areaWest(:,:,k)  = DYG([x 1],y).*DRF(k).*hFacW([x 1],y,k);
 else
  areaWest(:,:,k)  = DYG([x x(end)+1],y).*DRF(k).*hFacW([x x(end)+1],y,k);
 end
 areaSouth(:,:,k) = DXG(x,[y y(end)+1]).*DRF(k).*hFacS(x,[y y(end)+1],k);
end
areaTop(:,:,nz+1) = RAC(x,y);
area = RAC(x,y);
area(Depth==0)=0;


% for heat flux calc
z1=RF(1:end-1); z2=RF(2:end);
swfrac = 0.62*exp(z1/0.6)+(1.0-0.62)*exp(z1/20.0);
swfrac1 = 0.62*exp(z2/0.6)+(1.0-0.62)*exp(z2/20.0);
swfrac = permute(repmat(swfrac,1,nx,ny),[2 3 1]);
swfrac1 = permute(repmat(swfrac1,1,nx,ny),[2 3 1]);
rho=1029; Cp=3994;


% initialize
sw = zeros(nx,ny,nz,nt);
airsea = zeros(nx,ny,nz,nt);
dilut = zeros(nx,ny,nz,nt);
bio = zeros(nx,ny,nz,nt);
mix = zeros(nx,ny,nz,nt);
adv = zeros(nx,ny,nz,nt);
adv_h = zeros(nx,ny,nz,nt);
adv_v = zeros(nx,ny,nz,nt);
div = zeros(nx,ny,nz,nt);
corr = zeros(nx,ny,nz,nt);
tend = zeros(nx,ny,nz,nt);
tend_calc = zeros(nx,ny,nz,nt);


% read diagnostics
% calculate tendencies in mol/m3/s
for t=1:nt

display(t)

% tendency due to short-wave heating
% diagnostic: oceQsw
oceQsw = rdmds('SO_Frce5',ts(t),'rec',9);
sw(:,:,:,t) = repmat(oceQsw(x,y),1,1,nz)./(rho*Cp)./dz.*(swfrac-swfrac1);

% tendency due to air-sea flux 
% diagnostic: TFLUX
flux = rdmds('SO_Frce5',ts(t),'rec',4); 
% divide by thickness of first layer 
% (hFacC accounts for partial cells)
airsea(:,:,1,t) = (flux(x,y)-oceQsw(x,y))./(rho*Cp*dz(:,:,1));

% advection
% diagnostics: ADVx_TH, ADVy_TH, ADVr_TH
advflux = rdmds(diag_budget_file,ts(t),'rec',1:3);
% correction
% diagnostic: WTHMASS
tmp = rdmds(diag_budget_file,ts(t),'rec',11);
corr(:,:,1,t) = tmp(x,y,1)./dz(:,:,1);

if x(end)==1080
 advflux_x = advflux([x 1],y,z,2);
else
 advflux_x = advflux([x x(end)+1],y,z,2);
end
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
adv(:,:,:,t) = -(adv_x + adv_y + adv_z);

% divergence
% diagnostics: UVEL, VVEL, WVEL
vel = rdmds('SOstt_5d',ts(t),'rec',3:5);
if x(end)==1080
 U = vel([x 1],y,z,1).*areaWest;
else
 U = vel([x x(end)+1],y,z,1).*areaWest;
end
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
% THETA field 
tmp = rdmds('SOstt_5d',ts(t),'rec',1);
tracer = tmp(x,y,z);
div(:,:,:,t) = tracer.*(div_x + div_y + div_z);

% advection components
adv_h(:,:,:,t) = -(adv_x + adv_y)+tracer.*(div_x + div_y);
adv_v(:,:,:,t) = -(adv_z)+tracer.*(div_z);




% mixing
% diagnostics: DFxETr01, DFyETr01, DFrITr01
diffflux = rdmds(diag_budget_file,ts(t),'rec',4:7);
if x(end)==1080
 diffflux_x = diffflux([x 1],y,z,2);
else
 diffflux_x = diffflux([x x(end)+1],y,z,2);
end
diffflux_y = diffflux(x,[y y(end)+1],z,3);
if z(end)==52
 diffflux_z = diffflux(x,y,[z z(end)],3); 
 diffflux_z(:,:,end) = 0*diffflux_z(:,:,end);
else
 diffflux_z = diffflux(x,y,[z z(end)+1],3); 
end
%diffflux1_z = diffflux(x,y,[z z(end)+1],1);
mix_x = diff(diffflux_x,1,1)./volume;
mix_y = diff(diffflux_y,1,2)./volume;
mix_z = -diff(diffflux_z,1,3)./volume;
mix1_z = -diff(diffflux1_z,1,3)./volume;

% minus sign because diffusive flux is on lhs, moving to rhs
mix(:,:,:,t) = -(mix_x + mix_y + mix_z + mix1_z);

if 0
% total tendency, calc
if t==1
 snap = rdmds('SOst_Snp',[0 ts(t)],'rec',1);
else
 snap = rdmds('SOst_Snp',[ts(t-1) ts(t)],'rec',1);
end
dt = 86400*5;
tend_calc(:,:,:,t) = diff(snap(x,y,z,:),1,4)/dt;
end

% total tendency, diag
tmp = rdmds(diag_budget_file,ts(t),'rec',8);
tend(:,:,:,t) = tmp(x,y,z)/86400;

end % for t


% fix divisions by hFacC=0
airsea(isnan(airsea)) = 0;
adv(isnan(adv)) = 0;
adv_h(isnan(adv_h)) = 0;
adv_v(isnan(adv_v)) = 0;
mix(isnan(mix)) = 0;

% residual
tmp=airsea+sw;
tmp2=adv-corr;
res = tmp2+div+mix+tmp-tend;
res0 = tmp2+mix+tmp-tend;
res2 = tmp2+mix+tmp;
res1 = adv+div+mix+airsea+sw-corr-tend_calc;



% check that the terms balance locally
% plot a single time, single location
t=1; x1=620; y1=100;

figure;
plot(squeeze(tend(x1,y1,:,t)),RC); hold on
%plot(squeeze(tend_calc(x1,y1,:,t)),RC); hold on
plot(squeeze(airsea(x1,y1,:,t)),RC);
plot(squeeze(sw(x1,y1,:,t)),RC);
plot(squeeze(mix(x1,y1,:,t)),RC);
plot(squeeze(adv(x1,y1,:,t)),RC);
plot(squeeze(corr(x1,y1,:,t)),RC);
plot(squeeze(res(x1,y1,:,t)),RC,'--k');
ylabel('depth'); xlabel('mol C/m3/s');
legend('tend','airsea','sw','mix','adv','corr','res')

% top 150m
figure;
plot(squeeze(-tend(x1,y1,:,t)),RC); hold on
plot(squeeze(adv(x1,y1,:,t)),RC); hold on
plot(squeeze(airsea(x1,y1,:,t)),RC);
plot(squeeze(sw(x1,y1,:,t)),RC);
plot(squeeze(mix(x1,y1,:,t)),RC);
plot(squeeze(-corr(x1,y1,:,t)),RC);
plot(squeeze(res(x1,y1,:,t)),RC,'--k');
ylim([-150 0])
ylabel('depth'); xlabel('mol C/m3/s');
legend('tend','adv','airsea','sw','mix','corr','res')




% vertical integral
% multiply by cell thickness 
% convert s^-1 to year^-1
speryr = 86400*365.25;
% units are then mol C/m2/yr
dzt = repmat(dz,[1 1 1 nt]);
tend_intz = squeeze(cumsum(tend.*dzt,3))*speryr; %clear tend
dilut_intz = squeeze(cumsum(dilut.*dzt,3))*speryr; %clear dilut
airsea_intz = squeeze(cumsum(airsea.*dzt,3))*speryr; %clear airsea
bio_intz = squeeze(cumsum(bio.*dzt,3))*speryr; %clear bio
mix_intz = squeeze(cumsum(mix.*dzt,3))*speryr; %clear mix
adv_intz = squeeze(cumsum(adv.*dzt,3))*speryr; %clear adv
adv_v_intz = squeeze(cumsum(adv_v.*dzt,3))*speryr; %clear adv_v
adv_h_intz = squeeze(cumsum(adv_h.*dzt,3))*speryr; %clear adv_h
res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res

% plot 2D maps
z1 = 17; % 150m
c1 = -8:1:8;
c2 = [-6 6];

figure; set(gcf,'position',[ 182  5  1008  697]);
subplot(3,3,1); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(bio_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
colormap(redblue)
title('bio');

subplot(3,3,2); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(airsea_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('airsea');

subplot(3,3,3); 
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

subplot(3,3,5); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(mix_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('mix');

subplot(3,3,6); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(tend_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('tend');

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

subplot(3,3,9); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(adv_intz(:,:,z1,:)-tend_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
title('mat deriv');

axes('position',[.91 .115 .02 .2]);
contourf([0 1],c1,[c1;c1]',c1,'LineStyle','none');
caxis(c2)
set(gca,'xtick','')




