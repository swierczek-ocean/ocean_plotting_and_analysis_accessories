clear
close all
clc
tic()

%% THETA
strt = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Theta.nc';
stru = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Uvel.nc';
strv = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Vvel.nc';
sd = 49;
nt = 12;

x = 1741:2070;
y = 379:560;
z = 1:52; %

% THETA_temp = ncread(strt,'THETA',[1741,379,1,sd+t-1],[331,183,52,1]);
XC = ncread(strt,'XC');
YC = ncread(strt,'YC');
DXG = ncread(strv,'dxG');
DYG = ncread(stru,'dyG');
hFacC = ncread(strt,'hFacC');
hFacW = ncread(stru,'hFacW');
hFacS = ncread(strv,'hFacS');
DRF = ncread(strt,'drF');
RAC = ncread(strt,'rA');
RC = ncread(strt,'Z');

XC = XC(x);
YC = YC(y);
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


%% volume
volume_N6 = zeros(nt,1);
volume_S6 = zeros(nt,1);
volume_E6 = zeros(nt,1);
volume_W6 = zeros(nt,1);

for t=1:12
    UVEL = ncread(stru,'UVEL',[1741,379,1,sd+t-1],[331,183,52,1]);
    VVEL = ncread(strv,'VVEL',[1741,379,1,sd+t-1],[331,183,52,1]);
    
    volume_N6(t) = sum(sum(VVEL(1:(end-1),end,:).*areaSouth(:,end,:)));
    volume_S6(t) = sum(sum(VVEL(1:(end-1),1,:).*areaSouth(:,1,:)));
    
    volume_E6(t) = sum(sum(UVEL(end,1:(end-1),:).*areaWest(end,:,:)));
    volume_W6(t) = sum(sum(UVEL(1,1:(end-1),:).*areaWest(1,:,:)));
    clear vel
end % for t
%% volume

%% heat in Watts
cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3
heat_N6 = zeros(nt,1);
heat_S6 = zeros(nt,1);
heat_E6 = zeros(nt,1);
heat_W6 = zeros(nt,1);
heat_surf6 = zeros(nt,1);

str1 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVx_TH.nc';
str2 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVy_TH.nc';
str3 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFxE_TH.nc';
str4 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFyE_TH.nc';
strtf = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfTflx.nc';

for t=1:12
    advx = ncread(str1,'ADVx_TH',[1741,379,1,sd+t-1],[331,183,52,1]);
    advy = ncread(str2,'ADVy_TH',[1741,379,1,sd+t-1],[331,183,52,1]);
    difx = ncread(str3,'DFxE_TH',[1741,379,1,sd+t-1],[331,183,52,1]);
    dify = ncread(str4,'DFyE_TH',[1741,379,1,sd+t-1],[331,183,52,1]);
    
    advx = advx + difx;
    advy = advy + dify;
    
    heat_N6(t) = cp_oce*rho*sum(sum(advy(1:(end-1),end,:)));
    heat_S6(t) = cp_oce*rho*sum(sum(advy(1:(end-1),1,:)));
    
    heat_E6(t) = cp_oce*rho*sum(sum(advx(end,1:(end-1),:)));
    heat_W6(t) = cp_oce*rho*sum(sum(advx(1,1:(end-1),:)));
    clear adv* dif*
    
    tflux = ncread(strtf,'TFLUX',[1741,379,sd+t-1],[330,182,1]);
    
    heat_surf6(t) = sum(sum(tflux.*area));
end % for t
%% heat

%% salt in kgs
salt_N6 = zeros(nt,1);
salt_S6 = zeros(nt,1);
salt_E6 = zeros(nt,1);
salt_W6 = zeros(nt,1);
salt_surf6 = zeros(nt,1);

str1 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVx_SLT.nc';
str2 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVy_SLT.nc';
str3 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFxE_SLT.nc';
str4 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFyE_SLT.nc';
strsf = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfSflx.nc';

for t=1:12
    advx = ncread(str1,'ADVx_SLT',[1741,379,1,sd+t-1],[331,183,52,1]);
    advy = ncread(str2,'ADVy_SLT',[1741,379,1,sd+t-1],[331,183,52,1]);
    difx = ncread(str3,'DFxE_SLT',[1741,379,1,sd+t-1],[331,183,52,1]);
    dify = ncread(str4,'DFyE_SLT',[1741,379,1,sd+t-1],[331,183,52,1]);
    
    advx = advx + difx;
    advy = advy + dify;
    
    salt_N6(t) = rho*sum(sum(advy(1:(end-1),end,:)));
    salt_S6(t) = rho*sum(sum(advy(1:(end-1),1,:)));
    
    salt_E6(t) = rho*sum(sum(advx(end,1:(end-1),:)));
    salt_W6(t) = rho*sum(sum(advx(1,1:(end-1),:)));
    clear adv* dif*
    
    sflux = ncread(strsf,'SFLUX',[1741,379,sd+t-1],[330,182,1]);
    
    salt_surf6(t) = sum(sum(sflux.*area));
end % for t
%% salt

%% carbon in kgs
carbon_N6 = zeros(nt,1);
carbon_S6 = zeros(nt,1);
carbon_E6 = zeros(nt,1);
carbon_W6 = zeros(nt,1);
carbon_surf6 = zeros(nt,1);

str1 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVxDIC.nc';
str2 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVyDIC.nc';
str3 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFxEDIC.nc';
str4 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFyEDIC.nc';
strcf = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfCO2flx.nc';

for t=1:12
    advx = ncread(str1,'ADVxTr01',[1741,379,1,sd+t-1],[331,183,52,1]);
    advy = ncread(str2,'ADVyTr01',[1741,379,1,sd+t-1],[331,183,52,1]);
    difx = ncread(str3,'DFxETr01',[1741,379,1,sd+t-1],[331,183,52,1]);
    dify = ncread(str4,'DFyETr01',[1741,379,1,sd+t-1],[331,183,52,1]);
    
    advx = advx + difx;
    advy = advy + dify;
    
    carbon_N6(t) = 12.0107*sum(sum(advy(1:(end-1),end,:)))/1000;
    carbon_S6(t) = 12.0107*sum(sum(advy(1:(end-1),1,:)))/1000;
    
    carbon_E6(t) = 12.0107*sum(sum(advx(end,1:(end-1),:)))/1000;
    carbon_W6(t) = 12.0107*sum(sum(advx(1,1:(end-1),:)))/1000;
    clear adv* dif*
    
    cflux = ncread(strcf,'BLGCFLX',[1741,379,sd+t-1],[330,182,1]);
    
    carbon_surf6(t) = 12.0107*sum(sum(cflux.*area))/1000;
end % for t
%% carbon

%% oxygen in kgs
oxygen_N6 = zeros(nt,1);
oxygen_S6 = zeros(nt,1);
oxygen_E6 = zeros(nt,1);
oxygen_W6 = zeros(nt,1);
oxygen_surf6 = zeros(nt,1);

str1 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVxO2.nc';
str2 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVyO2.nc';
str3 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFxEO2.nc';
str4 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFyEO2.nc';
strof = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfO2flx.nc';

for t=1:12
    advx = ncread(str1,'ADVxTr03',[1741,379,1,sd+t-1],[331,183,52,1]);
    advy = ncread(str2,'ADVyTr03',[1741,379,1,sd+t-1],[331,183,52,1]);
    difx = ncread(str3,'DFxETr03',[1741,379,1,sd+t-1],[331,183,52,1]);
    dify = ncread(str4,'DFyETr03',[1741,379,1,sd+t-1],[331,183,52,1]);
    
    advx = advx + difx;
    advy = advy + dify;
    
    oxygen_N6(t) = 15.9994*sum(sum(advy(1:(end-1),end,:)))/1000;
    oxygen_S6(t) = 15.9994*sum(sum(advy(1:(end-1),1,:)))/1000;
    
    oxygen_E6(t) = 15.9994*sum(sum(advx(end,1:(end-1),:)))/1000;
    oxygen_W6(t) = 15.9994*sum(sum(advx(1,1:(end-1),:)))/1000;
    clear adv* dif*
    
    oflux = ncread(strof,'BLGOFLX',[1741,379,sd+t-1],[330,182,1]);
    
    oxygen_surf6(t) = 15.9994*sum(sum(oflux.*area))/1000;
end % for t
%% oxygen

%% nitrate in kgs
nitrate_N6 = zeros(nt,1);
nitrate_S6 = zeros(nt,1);
nitrate_E6 = zeros(nt,1);
nitrate_W6 = zeros(nt,1);

str1 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVxNO3.nc';
str2 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_ADVyNO3.nc';
str3 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFxENO3.nc';
str4 = '/data/SOSE/SOSE/SO6/ITER122/budgets/bsose_i122_2013to2017_monthly_DFyENO3.nc';

for t=1:12
    advx = ncread(str1,'ADVxTr04',[1741,379,1,sd+t-1],[331,183,52,1]);
    advy = ncread(str2,'ADVyTr04',[1741,379,1,sd+t-1],[331,183,52,1]);
    difx = ncread(str3,'DFxETr04',[1741,379,1,sd+t-1],[331,183,52,1]);
    dify = ncread(str4,'DFyETr04',[1741,379,1,sd+t-1],[331,183,52,1]);
    
    advx = advx + difx;
    advy = advy + dify;
    
    nitrate_N6(t) = 14.0067*sum(sum(advy(1:(end-1),end,:)))/1000;
    nitrate_S6(t) = 14.0067*sum(sum(advy(1:(end-1),1,:)))/1000;
    
    nitrate_E6(t) = 14.0067*sum(sum(advx(end,1:(end-1),:)))/1000;
    nitrate_W6(t) = 14.0067*sum(sum(advx(1,1:(end-1),:)))/1000;
    clear adv* dif*
    
end % for t
%% nitrate

save BSOSE_budgets


toc()