clear
close all
clc
tic()

hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO6_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO6_20190513/run/hFacS');
DXG = rdmds('../MITgcm/verification/SO6_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO6_20190513/run/DYG');
DXC = rdmds('../MITgcm/verification/SO6_20190513/run/DXC');
DYC = rdmds('../MITgcm/verification/SO6_20190513/run/DYC');
XC = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
RF = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RF'));
DRF = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/DRF'));
str = '../MITgcm/verification/SO6_20190513/diag/';
strb = '../MITgcm/verification/SO6_20190513/diag_budgets/';

%% prelim
nt = 12;

% select area
x = 11:340;
y = 54:235;
z = 1:22; %
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
volume_N6 = zeros(nt,1);
volume_S6 = zeros(nt,1);
volume_E6 = zeros(nt,1);
volume_W6 = zeros(nt,1);
volume_Bot6 = zeros(nt,1);

for t=1:12
    
    charstate = [str,'diag_state.',num2str(2190*(t+1),'%010.f')];
    vel = rdmds(charstate,'rec',3:5);
    vel = vel([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    
    volume_N6(t) = sum(sum(vel(1:(end-1),end,1:(end-1),2).*areaSouth(:,end,:)));
    volume_S6(t) = sum(sum(vel(1:(end-1),1,1:(end-1),2).*areaSouth(:,1,:)));
    
    volume_E6(t) = sum(sum(vel(end,1:(end-1),1:(end-1),1).*areaWest(end,:,:)));
    volume_W6(t) = sum(sum(vel(1,1:(end-1),1:(end-1),1).*areaWest(1,:,:)));
    
    volume_Bot6(t) = sum(sum(vel(1:(end-1),1:(end-1),end,3).*areaTop(:,:,end)));
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
heat_Bot6 = zeros(nt,1);

for t=1:12

    charheat = [strb,'diag_T_budget.',num2str(2190*(t+1),'%010.f')];
    adv = rdmds(charheat,'rec',1:3);
    diff = rdmds(charheat,'rec',4:6);
    adv = adv([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    diff = diff([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    
    adv = adv + diff;
    
    heat_N6(t) = cp_oce*rho*sum(sum(adv(1:(end-1),end,1:(end-1),2)));
    heat_S6(t) = cp_oce*rho*sum(sum(adv(1:(end-1),1,1:(end-1),2)));
    
    heat_E6(t) = cp_oce*rho*sum(sum(adv(end,1:(end-1),1:(end-1),1)));
    heat_W6(t) = cp_oce*rho*sum(sum(adv(1,1:(end-1),1:(end-1),1)));
    
    heat_Bot6(t) = cp_oce*rho*sum(sum(adv(1:(end-1),1:(end-1),end,3)));
    clear adv diff
    
    charheatflux = [str,'diag_airsea.',num2str(2190*(t+1),'%010.f')];
    tflux = rdmds(charheatflux,'rec',1);
    tflux = tflux(x,y);
    
    heat_surf6(t) = sum(sum(tflux.*area));
end % for t
%% heat

%% salt in kgs
salt_N6 = zeros(nt,1);
salt_S6 = zeros(nt,1);
salt_E6 = zeros(nt,1);
salt_W6 = zeros(nt,1);
salt_surf6 = zeros(nt,1);
salt_Bot6 = zeros(nt,1);

for t=1:12
    
    charsalt = [strb,'diag_S_budget.',num2str(2190*(t+1),'%010.f')];
    adv = rdmds(charsalt,'rec',1:3);
    diff = rdmds(charsalt,'rec',4:6);
    adv = adv([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    diff = diff([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    adv = adv + diff;
    
    salt_N6(t) = rho*sum(sum(adv(1:(end-1),end,1:(end-1),2)))/1000;
    salt_S6(t) = rho*sum(sum(adv(1:(end-1),1,1:(end-1),2)))/1000;
    
    salt_E6(t) = rho*sum(sum(adv(end,1:(end-1),1:(end-1),1)))/1000;
    salt_W6(t) = rho*sum(sum(adv(1,1:(end-1),1:(end-1),1)))/1000;
    
    salt_Bot6(t) = rho*sum(sum(adv(1:(end-1),1:(end-1),end,3)))/1000;
    clear adv diff
    
    charsaltflux = [str,'diag_airsea.',num2str(2190*(t+1),'%010.f')];
    sflux = rdmds(charsaltflux,'rec',2);
    sflux = sflux(x,y);
    
    salt_surf6(t) = sum(sum(sflux.*area))/1000;
end % for t
%% salt

%% carbon in kgs
gty = 31536000/1000000000000;
carbon_N6 = zeros(nt,1);
carbon_S6 = zeros(nt,1);
carbon_E6 = zeros(nt,1);
carbon_W6 = zeros(nt,1);
carbon_surf6 = zeros(nt,1);
carbon_Bot6 = zeros(nt,1);

for t=1:12
    
    charcarbon = [strb,'diag_dic_budget.',num2str(2190*(t+1),'%010.f')];
    adv = rdmds(charcarbon,'rec',1:3);
    diff = rdmds(charcarbon,'rec',4:6);
    adv = adv([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    diff = diff([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    adv = adv + diff;
    
    carbon_N6(t) = gty*12.0107*sum(sum(adv(1:(end-1),end,1:(end-1),2)))/1000;
    carbon_S6(t) = gty*12.0107*sum(sum(adv(1:(end-1),1,1:(end-1),2)))/1000;
    
    carbon_E6(t) = gty*12.0107*sum(sum(adv(end,1:(end-1),1:(end-1),1)))/1000;
    carbon_W6(t) = gty*12.0107*sum(sum(adv(1,1:(end-1),1:(end-1),1)))/1000;
    
    carbon_Bot6(t) = gty*12.0107*sum(sum(adv(1:(end-1),1:(end-1),end,3)))/1000;
    clear adv diff
    
    charcarbonflux = [str,'diag_airsea.',num2str(2190*(t+1),'%010.f')];
    cflux = rdmds(charcarbonflux,'rec',3);
    cflux = cflux(x,y);
    
    carbon_surf6(t) = gty*12.0107*sum(sum(cflux.*area))/1000;
end % for t
%% carbon

%% oxygen in kgs
oxygen_N6 = zeros(nt,1);
oxygen_S6 = zeros(nt,1);
oxygen_E6 = zeros(nt,1);
oxygen_W6 = zeros(nt,1);
oxygen_surf6 = zeros(nt,1);
oxygen_Bot6 = zeros(nt,1);

for t=1:12
    
    charoxygen = [strb,'diag_o2_budget.',num2str(2190*(t+1),'%010.f')];
    adv = rdmds(charoxygen,'rec',1:3);
    diff = rdmds(charoxygen,'rec',4:6);
    adv = adv([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    diff = diff([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    adv = adv + diff;
    
    oxygen_N6(t) = gty*15.9994*sum(sum(adv(1:(end-1),end,1:(end-1),2)))/1000;
    oxygen_S6(t) = gty*15.9994*sum(sum(adv(1:(end-1),1,1:(end-1),2)))/1000;
    
    oxygen_E6(t) = gty*15.9994*sum(sum(adv(end,1:(end-1),1:(end-1),1)))/1000;
    oxygen_W6(t) = gty*15.9994*sum(sum(adv(1,1:(end-1),1:(end-1),1)))/1000;
    
    oxygen_Bot6(t) = gty*15.9994*sum(sum(adv(1:(end-1),1:(end-1),end,3)))/1000;
    clear adv diff
    
    charoxygenflux = [str,'diag_airsea.',num2str(2190*(t+1),'%010.f')];
    o2flux = rdmds(charoxygenflux,'rec',4);
    o2flux = o2flux(x,y);
    
    oxygen_surf6(t) = gty*15.9994*sum(sum(o2flux.*area))/1000;
end % for t
%% oxygen

%% nitrate in kgs
nitrate_N6 = zeros(nt,1);
nitrate_S6 = zeros(nt,1);
nitrate_E6 = zeros(nt,1);
nitrate_W6 = zeros(nt,1);
nitrate_Bot6 = zeros(nt,1);

for t=1:12
    
    charnitrate = [strb,'diag_no3_budget.',num2str(2190*(t+1),'%010.f')];
    adv = rdmds(charnitrate,'rec',1:3);
    diff = rdmds(charnitrate,'rec',4:6);
    adv = adv([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    diff = diff([x x(end)+1],[y y(end)+1],[z z(end)+1],:);
    adv = adv + diff;
    
    nitrate_N6(t) = gty*14.0067*sum(sum(adv(1:(end-1),end,1:(end-1),2)))/1000;
    nitrate_S6(t) = gty*14.0067*sum(sum(adv(1:(end-1),1,1:(end-1),2)))/1000;
    
    nitrate_E6(t) = gty*14.0067*sum(sum(adv(end,1:(end-1),1:(end-1),1)))/1000;
    nitrate_W6(t) = gty*14.0067*sum(sum(adv(1,1:(end-1),1:(end-1),1)))/1000;
    
    nitrate_Bot6(t) = gty*14.0067*sum(sum(adv(1:(end-1),1:(end-1),end,3)))/1000;
    clear adv diff
    
end % for t
%% nitrate

save Budgets6_60m 

clear







toc()