clear
close all
clc
tic()

hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO3_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO3_20190513/run/hFacS');
DXG = rdmds('../MITgcm/verification/SO3_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO3_20190513/run/DYG');
DXC = rdmds('../MITgcm/verification/SO3_20190513/run/DXC');
DYC = rdmds('../MITgcm/verification/SO3_20190513/run/DYC');
XC = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC'));
RF = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RF'));
DRF = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/DRF'));
str = '../MITgcm/verification/SO3_20190513/diag/';
strb = '../MITgcm/verification/SO3_20190513/diag_budgets/';

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
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

parfor ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
    end
end

dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end

area = RAC(x,y);

lvls = [3,6];

cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3
gty = 31536000/1000000000000;
vert_wvel_3 = zeros(52,12);
vert_heat_adv_3 = zeros(52,12);
vert_salt_adv_3 = zeros(52,12);
vert_carbon_adv_3 = zeros(52,12);
vert_oxygen_adv_3 = zeros(52,12);
vert_nitrate_adv_3 = zeros(52,12);
vert_heat_dif_3 = zeros(52,12);
vert_salt_dif_3 = zeros(52,12);
vert_carbon_dif_3 = zeros(52,12);
vert_oxygen_dif_3 = zeros(52,12);
vert_nitrate_dif_3 = zeros(52,12);

for ii=1:12
    charwvel = [str,'diag_state.',num2str(1460*(ii+1),'%010.f')];
    temp1 = rdmds(charwvel,'rec',5);
    temp1 = temp1(x,y,z,:);
    vert_wvel_3(:,ii) = sum(sum(temp1.*areaTop));
    clear temp
    
    charheat = [strb,'diag_T_budget.',num2str(1460*(ii+1),'%010.f')];
    temp1 = rdmds(charheat,'rec',lvls(1));
    temp2 = rdmds(charheat,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_heat_adv_3(:,ii) = cp_oce*rho*sum(sum(temp1));
    vert_heat_dif_3(:,ii) = cp_oce*rho*sum(sum(temp2));
    clear temp
    
    charsalt = [strb,'diag_S_budget.',num2str(1460*(ii+1),'%010.f')];
    temp1 = rdmds(charsalt,'rec',lvls(1));
    temp2 = rdmds(charsalt,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_salt_adv_3(:,ii) = rho*sum(sum(temp1));
    vert_salt_dif_3(:,ii) = rho*sum(sum(temp2));
    clear temp
    
    charcarbon = [strb,'diag_dic_budget.',num2str(1460*(ii+1),'%010.f')];
    temp1 = rdmds(charcarbon,'rec',lvls(1));
    temp2 = rdmds(charcarbon,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_carbon_adv_3(:,ii) = gty*12.0107*sum(sum(temp1))/1000;
    vert_carbon_dif_3(:,ii) = gty*12.0107*sum(sum(temp2))/1000;
    clear temp
    
    charoxygen = [strb,'diag_o2_budget.',num2str(1460*(ii+1),'%010.f')];
    temp1 = rdmds(charoxygen,'rec',lvls(1));
    temp2 = rdmds(charoxygen,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_oxygen_adv_3(:,ii) = gty*15.9994*sum(sum(temp1))/1000;
    vert_oxygen_dif_3(:,ii) = gty*15.9994*sum(sum(temp2))/1000;
    clear temp
    
    charnitrate = [strb,'diag_no3_budget.',num2str(1460*(ii+1),'%010.f')];
    temp1 = rdmds(charnitrate,'rec',lvls(1));
    temp2 = rdmds(charnitrate,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_nitrate_adv_3(:,ii) = gty*14.0067*sum(sum(temp1))/1000;
    vert_nitrate_dif_3(:,ii) = gty*14.0067*sum(sum(temp2))/1000;
    clear temp
end

RC3 = RC;
RF3 = RF;
DRF3 = DRF;

save ADVr_3  vert*_3 RC3 RF3 DRF3

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
z = 1:52; %
% z = 1:36; % top 1000 m

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

parfor ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
    end
end

dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end

area = RAC(x,y);

lvls = [3,6];

cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3
gty = 31536000/1000000000000;
vert_wvel_6 = zeros(52,12);
vert_heat_adv_6 = zeros(52,12);
vert_salt_adv_6 = zeros(52,12);
vert_carbon_adv_6 = zeros(52,12);
vert_oxygen_adv_6 = zeros(52,12);
vert_nitrate_adv_6 = zeros(52,12);
vert_heat_dif_6 = zeros(52,12);
vert_salt_dif_6 = zeros(52,12);
vert_carbon_dif_6 = zeros(52,12);
vert_oxygen_dif_6 = zeros(52,12);
vert_nitrate_dif_6 = zeros(52,12);

for ii=1:12
    charwvel = [str,'diag_state.',num2str(2190*(ii+1),'%010.f')];
    temp1 = rdmds(charwvel,'rec',5);
    temp1 = temp1(x,y,z,:);
    vert_wvel_6(:,ii) = sum(sum(temp1.*areaTop));
    clear temp
    
    charheat = [strb,'diag_T_budget.',num2str(2190*(ii+1),'%010.f')];
    temp1 = rdmds(charheat,'rec',lvls(1));
    temp2 = rdmds(charheat,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_heat_adv_6(:,ii) = cp_oce*rho*sum(sum(temp1));
    vert_heat_dif_6(:,ii) = cp_oce*rho*sum(sum(temp2));
    clear temp
    
    charsalt = [strb,'diag_S_budget.',num2str(2190*(ii+1),'%010.f')];
    temp1 = rdmds(charsalt,'rec',lvls(1));
    temp2 = rdmds(charsalt,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_salt_adv_6(:,ii) = rho*sum(sum(temp1));
    vert_salt_dif_6(:,ii) = rho*sum(sum(temp2));
    clear temp
    
    charcarbon = [strb,'diag_dic_budget.',num2str(2190*(ii+1),'%010.f')];
    temp1 = rdmds(charcarbon,'rec',lvls(1));
    temp2 = rdmds(charcarbon,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_carbon_adv_6(:,ii) = gty*12.0107*sum(sum(temp1))/1000;
    vert_carbon_dif_6(:,ii) = gty*12.0107*sum(sum(temp2))/1000;
    clear temp
    
    charoxygen = [strb,'diag_o2_budget.',num2str(2190*(ii+1),'%010.f')];
    temp1 = rdmds(charoxygen,'rec',lvls(1));
    temp2 = rdmds(charoxygen,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_oxygen_adv_6(:,ii) = gty*15.9994*sum(sum(temp1))/1000;
    vert_oxygen_dif_6(:,ii) = gty*15.9994*sum(sum(temp2))/1000;
    clear temp
    
    charnitrate = [strb,'diag_no3_budget.',num2str(2190*(ii+1),'%010.f')];
    temp1 = rdmds(charnitrate,'rec',lvls(1));
    temp2 = rdmds(charnitrate,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_nitrate_adv_6(:,ii) = gty*14.0067*sum(sum(temp1))/1000;
    vert_nitrate_dif_6(:,ii) = gty*14.0067*sum(sum(temp2))/1000;
    clear temp
end

RC6 = RC;
RF6 = RF;
DRF6 = DRF;

save ADVr_6  vert*_6 RC6 RF6 DRF6

hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO12_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO12_20190513/run/hFacS');
DXG = rdmds('../MITgcm/verification/SO12_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO12_20190513/run/DYG');
DXC = rdmds('../MITgcm/verification/SO12_20190513/run/DXC');
DYC = rdmds('../MITgcm/verification/SO12_20190513/run/DYC');
XC = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
RF = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RF'));
DRF = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/DRF'));
str = '../MITgcm/verification/SO12_20190513/diag/';
strb = '../MITgcm/verification/SO12_20190513/diag_budgets/';

%% prelim
nt = 12;

% select area
x = 17:676;
y = 106:467;
z = 1:104; %
% z = 1:36; % top 1000 m

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

parfor ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
    end
end

dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end

area = RAC(x,y);

lvls = [3,6];

cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3
gty = 31536000/1000000000000;
vert_wvel_12 = zeros(104,12);
vert_heat_adv_12 = zeros(104,12);
vert_salt_adv_12 = zeros(104,12);
vert_carbon_adv_12 = zeros(104,12);
vert_oxygen_adv_12 = zeros(104,12);
vert_nitrate_adv_12 = zeros(104,12);
vert_heat_dif_12 = zeros(104,12);
vert_salt_dif_12 = zeros(104,12);
vert_carbon_dif_12 = zeros(104,12);
vert_oxygen_dif_12 = zeros(104,12);
vert_nitrate_dif_12 = zeros(104,12);

for ii=1:12
    charwvel = [str,'diag_state.',num2str(10950*(ii+1),'%010.f')];
    temp1 = rdmds(charwvel,'rec',5);
    temp1 = temp1(x,y,z,:);
    vert_wvel_12(:,ii) = sum(sum(temp1.*areaTop));
    clear temp
    
    charheat = [strb,'diag_T_budget.',num2str(10950*(ii+1),'%010.f')];
    temp1 = rdmds(charheat,'rec',lvls(1));
    temp2 = rdmds(charheat,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_heat_adv_12(:,ii) = cp_oce*rho*sum(sum(temp1));
    vert_heat_dif_12(:,ii) = cp_oce*rho*sum(sum(temp2));
    clear temp
    
    charsalt = [strb,'diag_S_budget.',num2str(10950*(ii+1),'%010.f')];
    temp1 = rdmds(charsalt,'rec',lvls(1));
    temp2 = rdmds(charsalt,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_salt_adv_12(:,ii) = rho*sum(sum(temp1));
    vert_salt_dif_12(:,ii) = rho*sum(sum(temp2));
    clear temp
    
    charcarbon = [strb,'diag_dic_budget.',num2str(10950*(ii+1),'%010.f')];
    temp1 = rdmds(charcarbon,'rec',lvls(1));
    temp2 = rdmds(charcarbon,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_carbon_adv_12(:,ii) = gty*12.0107*sum(sum(temp1))/1000;
    vert_carbon_dif_12(:,ii) = gty*12.0107*sum(sum(temp2))/1000;
    clear temp
    
    charoxygen = [strb,'diag_o2_budget.',num2str(10950*(ii+1),'%010.f')];
    temp1 = rdmds(charoxygen,'rec',lvls(1));
    temp2 = rdmds(charoxygen,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_oxygen_adv_12(:,ii) = gty*15.9994*sum(sum(temp1))/1000;
    vert_oxygen_dif_12(:,ii) = gty*15.9994*sum(sum(temp2))/1000;
    clear temp
    
    charnitrate = [strb,'diag_no3_budget.',num2str(10950*(ii+1),'%010.f')];
    temp1 = rdmds(charnitrate,'rec',lvls(1));
    temp2 = rdmds(charnitrate,'rec',lvls(2));
    temp1 = temp1(x,y,z,:);
    temp2 = temp2(x,y,z,:);
    vert_nitrate_adv_12(:,ii) = gty*14.0067*sum(sum(temp1))/1000;
    vert_nitrate_dif_12(:,ii) = gty*14.0067*sum(sum(temp2))/1000;
    clear temp
end

RC12 = RC;
RF12 = RF;
DRF12 = DRF;

save ADVr_12  vert*_12 RC12 RF12 DRF12


toc()