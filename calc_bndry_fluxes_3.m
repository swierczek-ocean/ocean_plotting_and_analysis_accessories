clear
close all
clc
tic()

hFacC = rdmds('../Grids/3/hFacC');
hFacW = rdmds('../Grids/3/hFacW');
hFacS = rdmds('../Grids/3/hFacS');
DXG = rdmds('../Grids/3/DXG');
DYG = rdmds('../Grids/3/DYG');
DXC = rdmds('../Grids/3/DXC');
DYC = rdmds('../Grids/3/DYC');
XC = rdmds('../Grids/3/XC');
YC = rdmds('../Grids/3/YC');
RAC = squeeze(rdmds('../Grids/3/RAC'));
RC = squeeze(rdmds('../Grids/3/RC'));
RF = squeeze(rdmds('../Grids/3/RF'));
DRF = squeeze(rdmds('../Grids/3/DRF'));
str = 'Output/3/';

%% prelim
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


%% volume
volume_N3 = zeros(nt,1);
volume_S3 = zeros(nt,1);
volume_E3 = zeros(nt,1);
volume_W3 = zeros(nt,1);

for t=2:13
    
    charstate = [str,'diag_state.',num2str(1460*t,'%010.f')];
    vel = rdmds(charstate,'rec',3:5);
    vel = vel([x x(end)+1],[y y(end)+1],:,:);
    
    volume_N3(t) = sum(sum(vel(1:(end-1),end,:,2).*areaSouth(:,end,:)));
    volume_S3(t) = sum(sum(vel(1:(end-1),1,:,2).*areaSouth(:,1,:)));
    
    volume_E3(t) = sum(sum(vel(end,1:(end-1),:,1).*areaWest(end,:,:)));
    volume_W3(t) = sum(sum(vel(1,1:(end-1),:,1).*areaWest(1,:,:)));
    clear vel
end % for t
%% volume

%% heat in Watts
cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3
heat_N3 = zeros(nt,1);
heat_S3 = zeros(nt,1);
heat_E3 = zeros(nt,1);
heat_W3 = zeros(nt,1);
heat_surf3 = zeros(nt,1);

for t=2:13

    charheat = [str,'diag_T_budget.',num2str(1460*t,'%010.f')];
    adv = rdmds(charheat,'rec',1:2);
    diff = rdmds(charheat,'rec',4:5);
    adv = adv([x x(end)+1],[y y(end)+1],:,:);
    diff = diff([x x(end)+1],[y y(end)+1],:,:);
    adv = adv + diff;
    
    heat_N3(t) = cp_oce*rho*sum(sum(adv(1:(end-1),end,:,2)));
    heat_S3(t) = cp_oce*rho*sum(sum(adv(1:(end-1),1,:,2)));
    
    heat_E3(t) = cp_oce*rho*sum(sum(adv(end,1:(end-1),:,1)));
    heat_W3(t) = cp_oce*rho*sum(sum(adv(1,1:(end-1),:,1)));
    clear adv diff
    
    charheatflux = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    tflux = rdmds(charheatflux,'rec',1);
    tflux = tflux(x,y);
    
    heat_surf3(t) = sum(sum(tflux.*area));
end % for t
%% heat

%% salt in kgs
salt_N3 = zeros(nt,1);
salt_S3 = zeros(nt,1);
salt_E3 = zeros(nt,1);
salt_W3 = zeros(nt,1);
salt_surf3 = zeros(nt,1);

for t=2:13
    
    charsalt = [str,'diag_S_budget.',num2str(1460*t,'%010.f')];
    adv = rdmds(charsalt,'rec',1:2);
    diff = rdmds(charsalt,'rec',4:5);
    adv = adv([x x(end)+1],[y y(end)+1],:,:);
    diff = diff([x x(end)+1],[y y(end)+1],:,:);
    adv = adv + diff;
    
    salt_N3(t) = rho*sum(sum(adv(1:(end-1),end,:,2)))/1000;
    salt_S3(t) = rho*sum(sum(adv(1:(end-1),1,:,2)))/1000;
    
    salt_E3(t) = rho*sum(sum(adv(end,1:(end-1),:,1)))/1000;
    salt_W3(t) = rho*sum(sum(adv(1,1:(end-1),:,1)))/1000;
    clear adv diff
    
    charsaltflux = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    sflux = rdmds(charsaltflux,'rec',2);
    sflux = sflux(x,y);
    
    salt_surf3(t) = sum(sum(sflux.*area))/1000;
end % for t
%% salt

%% carbon in kgs
carbon_N3 = zeros(nt,1);
carbon_S3 = zeros(nt,1);
carbon_E3 = zeros(nt,1);
carbon_W3 = zeros(nt,1);
carbon_surf3 = zeros(nt,1);

for t=2:13
    
    charcarbon = [str,'diag_dic_budget.',num2str(1460*t,'%010.f')];
    adv = rdmds(charcarbon,'rec',1:2);
    diff = rdmds(charcarbon,'rec',4:5);
    adv = adv([x x(end)+1],[y y(end)+1],:,:);
    diff = diff([x x(end)+1],[y y(end)+1],:,:);
    adv = adv + diff;
    
    carbon_N3(t) = 12.0107*sum(sum(adv(1:(end-1),end,:,2)))/1000;
    carbon_S3(t) = 12.0107*sum(sum(adv(1:(end-1),1,:,2)))/1000;
    
    carbon_E3(t) = 12.0107*sum(sum(adv(end,1:(end-1),:,1)))/1000;
    carbon_W3(t) = 12.0107*sum(sum(adv(1,1:(end-1),:,1)))/1000;
    clear adv diff
    
    charcarbonflux = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    cflux = rdmds(charcarbonflux,'rec',3);
    cflux = cflux(x,y);
    
    carbon_surf3(t) = 12.0107*sum(sum(cflux.*area))/1000;
end % for t
%% carbon

%% oxygen in kgs
oxygen_N3 = zeros(nt,1);
oxygen_S3 = zeros(nt,1);
oxygen_E3 = zeros(nt,1);
oxygen_W3 = zeros(nt,1);
oxygen_surf3 = zeros(nt,1);

for t=2:13
    
    charoxygen = [str,'diag_o2_budget.',num2str(1460*t,'%010.f')];
    adv = rdmds(charoxygen,'rec',1:2);
    diff = rdmds(charoxygen,'rec',4:5);
    adv = adv([x x(end)+1],[y y(end)+1],:,:);
    diff = diff([x x(end)+1],[y y(end)+1],:,:);
    adv = adv + diff;
    
    oxygen_N3(t) = 15.9994*sum(sum(adv(1:(end-1),end,:,2)))/1000;
    oxygen_S3(t) = 15.9994*sum(sum(adv(1:(end-1),1,:,2)))/1000;
    
    oxygen_E3(t) = 15.9994*sum(sum(adv(end,1:(end-1),:,1)))/1000;
    oxygen_W3(t) = 15.9994*sum(sum(adv(1,1:(end-1),:,1)))/1000;
    clear adv diff
    
    charoxygenflux = [str,'diag_airsea.',num2str(1460*t,'%010.f')];
    o2flux = rdmds(charoxygenflux,'rec',4);
    o2flux = o2flux(x,y);
    
    oxygen_surf3(t) = 15.9994*sum(sum(o2flux.*area))/1000;
end % for t
%% oxygen

%% nitrate in kgs
nitrate_N3 = zeros(nt,1);
nitrate_S3 = zeros(nt,1);
nitrate_E3 = zeros(nt,1);
nitrate_W3 = zeros(nt,1);

for t=2:13
    
    charnitrate = [str,'diag_no3_budget.',num2str(1460*t,'%010.f')];
    adv = rdmds(charnitrate,'rec',1:2);
    diff = rdmds(charnitrate,'rec',4:5);
    adv = adv([x x(end)+1],[y y(end)+1],:,:);
    diff = diff([x x(end)+1],[y y(end)+1],:,:);
    adv = adv + diff;
    
    nitrate_N3(t) = 14.0067*sum(sum(adv(1:(end-1),end,:,2)))/1000;
    nitrate_S3(t) = 14.0067*sum(sum(adv(1:(end-1),1,:,2)))/1000;
    
    nitrate_E3(t) = 14.0067*sum(sum(adv(end,1:(end-1),:,1)))/1000;
    nitrate_W3(t) = 14.0067*sum(sum(adv(1,1:(end-1),:,1)))/1000;
    clear adv diff
    
end % for t
%% nitrate











toc()