% B-SOSE DIC budget
% Ariane Verdy, May 2018

clear all
close all


tracername = 'DIC';
tracernum = 1;

% file name
diag_budget_file = 'diag_dic_budget';



% for 2008-2012 monthly output
whichrun = '2008';
dts = 730.2; tmax=43812;
cd /data/averdy/soccom/bgc_budgets/diags/
diag_state_file = 'diag_state';
dt = 2628900; 

% for 2013-2016 monthly output
% whichrun = '2013';
% dts = 730; tmax=35040;
% cd /data/averdy/soccom/bgc_budgets/diags_2013/
% diag_state_file = 'diag_state';
% dt = 2628000; 

% for 2008-2012 iter 105 5-day output
%  = '2013_5d';
% dts = 120; tmax=43800;
% cd /data/soccom/SO3/optim2012/ITERATION105/ITERATION105_O2NO3FeBdgt/OUTPUT2
% diag_state_file = 'SOstt_5d';
% dt = 86400*5; % 5 days



% for rdmds
addpath ~/scripts_m

% for plotting
addpath ~/scripts_m/
addpath ~/scripts_m/m_map/
load ~/scripts_m/redbluecolormap.mat

% time stepping
ts = round(dts:dts:tmax);
nt = length(ts);

% select area
x = 1:1080; % all longitudes
y = 1:294; % poleward of 30S
z = 1:36; % top 1000 m

% model grid
load /data/averdy/soccom/SO3grid/grid.mat
XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
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


% initialize
surf = single(zeros(nx,ny,nz,nt));
dilut = single(zeros(nx,ny,nz,nt));
bio = single(zeros(nx,ny,nz,nt));
mix = single(zeros(nx,ny,nz,nt));
adv = single(zeros(nx,ny,nz,nt));
adv_h = single(zeros(nx,ny,nz,nt));
adv_v = single(zeros(nx,ny,nz,nt));
corr = single(zeros(nx,ny,nz,nt));
div = single(zeros(nx,ny,nz,nt));
tend = single(zeros(nx,ny,nz,nt));


% read diagnostics
% calculate tendencies in mol/m3/s
for t=1:nt

display(t)

% tendency due to air-sea flux 
% diagnostic: BLGCFLX
% surface flux (mol/m3/s)
flux = rdmds('diag_airsea',ts(t),'rec',3); 
surf(:,:,1,t) = flux(x,y)./(DRF(1)*squeeze(hFacC(:,:,1)));

% tendency due to dilution
% diagnostic: FORCTR01
% forcing tendency (mol/m3/s) includes effects of E-P-R and sponge layer contributions
if strcmp(whichrun,'2013_5d')
 tmp = rdmds(diag_budget_file,ts(t),'rec',1100);
elseif strcmp(whichrun,'2013')
 tmp = rdmds(diag_budget_file,ts(t),'rec',9);
elseif strcmp(whichrun,'2008')
 tmp = rdmds(diag_budget_file,ts(t),'rec',7);
else
 display('error')
end
dilut(:,:,1,t) = tmp(x,y,1);

% tendency due to biology
% diagnostic: BLGBIOC
% - uptake + remin + carbonate system (mol/m3/s)
if strcmp(whichrun,'2013_5d')
 tmp = rdmds(diag_budget_file,ts(t),'rec',1000);
elseif strcmp(whichrun,'2013')
 tmp = rdmds(diag_budget_file,ts(t),'rec',8);
elseif strcmp(whichrun,'2008')
 tmp = rdmds(diag_budget_file,ts(t),'rec',8);
else
 display('error')
end
bio(:,:,:,t) = tmp(x,y,z);

% advection
% diagnostics: ADVxTr01, ADVyTr01, ADVrTr01
% advective flux (mol/s)
advflux = rdmds(diag_budget_file,ts(t),'rec',1:3);

if x(end)==1080
 advflux_x = advflux([x 1],y,z,1);
else
 advflux_x = advflux([x x(end)+1],y,z,1);
end
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
% adv(:,:,:,t) = -(adv_x + adv_y + adv_z);

% divergence
% diagnostics: UVEL, VVEL, WVEL
vel = rdmds(diag_state_file,ts(t),'rec',3:5);
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

% tracer field (mol/m3)
tmp = rdmds('diag_bgc',ts(t),'rec',1);
tracer = tmp(x,y,z);
div(:,:,:,t) = tracer.*(div_x + div_y + div_z);

% advection components
adv_h(:,:,:,t) = -(adv_x + adv_y)+tracer.*(div_x + div_y);
adv_v(:,:,:,t) = -(adv_z)+tracer.*(div_z);

adv(:,:,:,t) = adv_h(:,:,:,t) + adv_v(:,:,:,t);

% correction to vertical advection at z=0
% diagnostic: WTRAC01
if strcmp(whichrun,'2013_5d')
 tmp = rdmds(diag_budget_file,ts(t),'rec',9);
elseif strcmp(whichrun,'2013')
 tmp = rdmds(diag_budget_file,ts(t),'rec',7);
elseif strcmp(whichrun,'2008')
 tmp = rdmds('diag_bgc_corr',ts(t),'rec',tracernum);
else
 display('error')
end
corr(:,:,1,t) = tmp(x,y,1)./dz(:,:,1);

% mixing
% diagnostics: DFxETr01, DFyETr01, DFrITr01
% diffusive flux (mol/s)
diffflux = rdmds(diag_budget_file,ts(t),'rec',4:6);
if x(end)==1080
 diffflux_x = diffflux([x 1],y,z,1);
else
 diffflux_x = diffflux([x x(end)+1],y,z,1);
end
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
mix(:,:,:,t) = -(mix_x + mix_y + mix_z);

% total tendency
if t==1
 snap = rdmds('diag_bgc_snaps',[0 ts(t)],'rec',tracernum);
else
 snap = rdmds('diag_bgc_snaps',[ts(t-1) ts(t)],'rec',tracernum);
end
tend(:,:,:,t) = diff(snap(x,y,z,:),1,4)/dt;

end % for t

clear tmp snap flux mix_* diffflux* div_* vel U V W advflux*



% fix divisions by hFacC=0
surf(isnan(surf)) = 0;
adv(isnan(adv)) = 0;
adv_h(isnan(adv_h)) = 0;
adv_v(isnan(adv_v)) = 0;
mix(isnan(mix)) = 0;
corr(isnan(corr)) = 0;


% remove correction from advection
adv = adv-corr;
adv_v = adv_v-corr;


% residual
res = adv+div+mix+bio+surf+dilut-tend;

adv=adv+div;
clear div;


if 0

% check that the terms balance locally
% plot a single time, single location
t=1; x1=620; y1=100;

figure;
plot(squeeze(tend(x1,y1,:,t)),RC); hold on
plot(squeeze(surf(x1,y1,:,t)),RC);
plot(squeeze(dilut(x1,y1,:,t)),RC);
plot(squeeze(mix(x1,y1,:,t)),RC);
plot(squeeze(bio(x1,y1,:,t)),RC);
plot(squeeze(adv(x1,y1,:,t)),RC);
plot(squeeze(res(x1,y1,:,t)),RC,'--k');
ylabel('depth'); xlabel('mol/m3/s');
legend('tend','surf','sed','mix','bio','adv','res')

% top 150m
% bundle tend and adv into "material derivative"
figure;
plot(squeeze(-tend(x1,y1,:,t)+adv(x1,y1,:,t)),RC); hold on
plot(squeeze(surf(x1,y1,:,t)),RC);
plot(squeeze(mix(x1,y1,:,t)),RC);
plot(squeeze(bio(x1,y1,:,t)),RC);
plot(squeeze(res(x1,y1,:,t)),RC,'--k');
ylim([-150 0])
ylabel('depth'); xlabel('mol/m3/s');
legend('mat deriv','surf','mix','bio','res')

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
tend_intz = squeeze(cumsum(tend.*dzt,3))*speryr; %clear tend
dilut_intz = squeeze(cumsum(dilut.*dzt,3))*speryr; %clear dilut
surf_intz = squeeze(cumsum(surf.*dzt,3))*speryr; %clear surf
bio_intz = squeeze(cumsum(bio.*dzt,3))*speryr; %clear bio
mix_intz = squeeze(cumsum(mix.*dzt,3))*speryr; %clear mix
adv_intz = squeeze(cumsum(adv.*dzt,3))*speryr; %clear adv
adv_v_intz = squeeze(cumsum(adv_v.*dzt,3))*speryr; %clear adv_v
adv_h_intz = squeeze(cumsum(adv_h.*dzt,3))*speryr; %clear adv_h
res_intz = squeeze(cumsum(res.*dzt,3))*speryr; %clear res



figure; set(gcf,'position',[182 1 630 701],'paperpositionmode','auto');
subplot(3,2,1); 
m_proj('ortho','lon',0,'lat',-90,'radius',60);
m_contourf(XC(:,1),YC(1,:),mean(tend_intz(:,:,z1,:),4)',c1,'LineStyle','none');
m_coast('color',[0 0 0]);
m_grid('xtick',[],'ytick',[],'XaxisLocation','top');
caxis(c2)
colormap(redblue)
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


print('-dpng',['/data/averdy/soccom/bgc_budgets/figures/budget_' tracername '_maps_' num2str(depth) 'm.png']);






% regional integral
% 5 frontal regions
load /data/averdy/soccom/SOSE_regional_masks_5.mat
zone = {'stz','saz','pfz','az','siz'};
t = datenum(2013,1:nt,15);

close all
figure(1); set(gcf,'position',[182 1 600 700],'paperpositionmode','auto'); clf
figure(2); set(gcf,'position',[182 1 300 700],'paperpositionmode','auto'); clf
figure(3); set(gcf,'position',[182 1 450 700],'paperpositionmode','auto'); clf


for n=1:length(zone)

if n==1
 mask = SOSE_index.stz;
elseif n==2
 mask = SOSE_index.saz;
elseif n==3
 mask = SOSE_index.pfz;
elseif n==4
 mask = SOSE_index.az;
elseif n==5
 mask = SOSE_index.siz;
end
mask = mask';
area_zone = area.*mask;
area_tot = sum(area_zone(:));
area_zone = repmat(area_zone,[1 1 1 nt]);

tend_area = squeeze(sum(sum(tend_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
bio_area = squeeze(sum(sum(bio_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
surf_area = squeeze(sum(sum(surf_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
dilut_area = squeeze(sum(sum(dilut_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
mix_area = squeeze(sum(sum(mix_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
adv_area = squeeze(sum(sum(adv_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
adv_h_area = squeeze(sum(sum(adv_h_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
adv_v_area = squeeze(sum(sum(adv_v_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
res_area = squeeze(sum(sum(res_intz(:,:,z1,:).*area_zone,1),2))./area_tot;

% seasonal cycle
for m=1:12
 tend_seas(m) = mean(tend_area(m:12:nt));
 bio_seas(m) = mean(bio_area(m:12:nt));
 surf_seas(m) = mean(surf_area(m:12:nt));
 dilut_seas(m) = mean(dilut_area(m:12:nt));
 mix_seas(m) = mean(mix_area(m:12:nt));
 adv_seas(m) = mean(adv_area(m:12:nt));
 adv_h_seas(m) = mean(adv_h_area(m:12:nt));
 adv_v_seas(m) = mean(adv_v_area(m:12:nt));
 res_seas(m) = mean(res_area(m:12:nt));
end % for m


figure(1);
subplot(5,1,n); hold on
plot(t,tend_area,'b');
plot(t,bio_area,'g');
plot(t,surf_area,'m');
plot(t,dilut_area,'y');
plot(t,mix_area,'c');
plot(t,adv_area,'r');
plot(t,adv_h_area,'r--');
plot(t,adv_v_area,'r:');
plot(t,res_area,'k--');
datetick('x');
title(zone{n});


figure(2);
subplot(5,1,n); hold on
plot(tend_seas,'b');
plot(bio_seas,'g');
plot(surf_seas,'m');
plot(dilut_seas,'y');
plot(mix_seas,'c');
plot(adv_seas,'r');
plot(adv_h_seas,'r--');
plot(adv_v_seas,'r:');
plot(res_seas,'k--');
title(zone{n});
xlim([1 12]);


figure(3);
subplot(5,1,n); hold on
%bar(1:9,[mean(tend_area),mean(bio_area),mean(surf_area),mean(sed_area),mean(mix_area),mean(adv_area),mean(adv_h_area),mean(adv_v_area),mean(res_area)]);
bar(1,mean(tend_area));
bar(2,mean(bio_area),'facecolor','g');
bar(3,mean(surf_area),'facecolor','m');
bar(4,mean(dilut_area),'facecolor','y');
bar(5,mean(mix_area),'facecolor','c');
bar(6,mean(adv_area),'facecolor','r');
bar(7,mean(adv_h_area),'facecolor','r');
bar(8,mean(adv_v_area),'facecolor','r');
bar(9,mean(res_area),'facecolor','k');
title(zone{n});
set(gca,'xtick',1:9,'xticklabel',{'tend','bio','surf','dilut','mix','adv','adv_h','adv_v','res'});


end % for n


figure(1);
leg=legend('tend','bio','surf','dilut','mix','adv','adv_h','adv_v','res');
set(leg,'position',[0.8228    0.7165    0.1340    0.2219]);
print('-dpng',['/data/averdy/soccom/bgc_budgets/figures/budget_' tracername '_timeseries_' num2str(depth) 'm.png']);

figure(2);
%leg=legend('tend','bio','surf','dilut','mix','adv','adv_h','adv_v','res');
%set(leg,'position',[0.8228    0.7165    0.1340    0.2219]);
print('-dpng',['/data/averdy/soccom/bgc_budgets/figures/budget_' tracername '_seascycle_' num2str(depth) 'm.png']);

figure(3);
print('-dpng',['/data/averdy/soccom/bgc_budgets/figures/budget_' tracername '_mean_' num2str(depth) 'm.png']);

end % for z



% Argentine basin
x1=880:900;
y1=195:205;
mask=mask*0;
mask(x1,y1)=1;
area_zone = area.*mask;
area_tot = sum(area_zone(:));
area_zone = repmat(area_zone,[1 1 1 nt]);

tend_area = squeeze(sum(sum(tend_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
bio_area = squeeze(sum(sum(bio_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
surf_area = squeeze(sum(sum(surf_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
sed_area = squeeze(sum(sum(sed_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
mix_area = squeeze(sum(sum(mix_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
adv_area = squeeze(sum(sum(adv_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
adv_h_area = squeeze(sum(sum(adv_h_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
adv_v_area = squeeze(sum(sum(adv_v_intz(:,:,z1,:).*area_zone,1),2))./area_tot;
res_area = squeeze(sum(sum(res_intz(:,:,z1,:).*area_zone,1),2))./area_tot;

figure; 
bar([mean(tend_area),mean(bio_area),mean(surf_area),mean(sed_area),mean(mix_area),mean(adv_area),mean(adv_h_area),mean(adv_v_area),mean(res_area)]);


