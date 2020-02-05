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
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';

%% prelim
nt = 12;

% select area
x = 6:170;
y = 29:119;
z = 1:52; %
% z = 1:36; % top 1000 m
vl = 52;

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

for ii=1:nx
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
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end

area = RAC(x,y);

lvls = [3,6];

vert_theta_3 = zeros(vl,365);
vert_salt_3 = zeros(vl,365);
vert_uvel_3 = zeros(vl,365);
vert_vvel_3 = zeros(vl,365);
vert_wvel_3 = zeros(vl,365);
vert_phihyd_3 = zeros(vl,365);
vert_drhodr_3 = zeros(vl,365);
vert_carbon_3 = zeros(vl,365);
vert_alk_3 = zeros(vl,365);
vert_oxygen_3 = zeros(vl,365);
vert_nitrate_3 = zeros(vl,365);
vert_phosphate_3 = zeros(vl,365);
vert_iron_3 = zeros(vl,365);
vert_don_3 = zeros(vl,365);
vert_dop_3 = zeros(vl,365);
vert_phyto_3 = zeros(vl,365);
vert_age_3 = zeros(vl,365);
vert_ph_3 = zeros(vl,365);

temp2 = zeros(vl,1);


for ii=1:365
    charstate = [strs,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    temp = temp(x,y,z).*areaTop;
    vert_theta_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',2);
    temp = temp(x,y,z).*areaTop;
    vert_salt_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',3);
    temp = temp(x,y,z).*areaTop;
    vert_uvel_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',4);
    temp = temp(x,y,z).*areaTop;
    vert_vvel_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',5);
    temp = temp(x,y,z).*areaTop;
    vert_wvel_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',6);
    temp = temp(x,y,z).*areaTop;
    vert_phihyd_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',7);
    temp = temp(x,y,z).*areaTop;
    vert_drhodr_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    charbgc = [strs,'diag_bgc.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    temp = temp(x,y,z).*areaTop;
    vert_carbon_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',2);
    temp = temp(x,y,z).*areaTop;
    vert_alk_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',3);
    temp = temp(x,y,z).*areaTop;
    vert_oxygen_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',4);
    temp = temp(x,y,z).*areaTop;
    vert_nitrate_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',5);
    temp = temp(x,y,z).*areaTop;
    vert_phosphate_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',6);
    temp = temp(x,y,z).*areaTop;
    vert_iron_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',7);
    temp = temp(x,y,z).*areaTop;
    vert_don_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',8);
    temp = temp(x,y,z).*areaTop;
    vert_dop_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',9);
    temp = temp(x,y,z).*areaTop;
    vert_phyto_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',10);
    temp = temp(x,y,z).*areaTop;
    vert_age_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',11);
    temp = temp(x,y,z).*areaTop;
    vert_ph_3(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
end

RC3 = RC;
RF3 = RF;
DRF3 = DRF;

save VERT_3  vert*_3 RC3 RF3 DRF3

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
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim
nt = 12;

% select area
x = 11:340;
y = 54:235;
z = 1:52; %
% z = 1:36; % top 1000 m
vl = 52;


XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

for ii=1:nx
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
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end

area = RAC(x,y);

lvls = [3,6];

vert_theta_6 = zeros(vl,365);
vert_salt_6 = zeros(vl,365);
vert_uvel_6 = zeros(vl,365);
vert_vvel_6 = zeros(vl,365);
vert_wvel_6 = zeros(vl,365);
vert_phihyd_6 = zeros(vl,365);
vert_drhodr_6 = zeros(vl,365);
vert_carbon_6 = zeros(vl,365);
vert_alk_6 = zeros(vl,365);
vert_oxygen_6 = zeros(vl,365);
vert_nitrate_6 = zeros(vl,365);
vert_phosphate_6 = zeros(vl,365);
vert_iron_6 = zeros(vl,365);
vert_don_6 = zeros(vl,365);
vert_dop_6 = zeros(vl,365);
vert_phyto_6 = zeros(vl,365);
vert_age_6 = zeros(vl,365);
vert_ph_6 = zeros(vl,365);

temp2 = zeros(vl,1);


for ii=1:365
    charstate = [strs,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    temp = temp(x,y,z).*areaTop;
    vert_theta_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',2);
    temp = temp(x,y,z).*areaTop;
    vert_salt_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',3);
    temp = temp(x,y,z).*areaTop;
    vert_uvel_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',4);
    temp = temp(x,y,z).*areaTop;
    vert_vvel_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',5);
    temp = temp(x,y,z).*areaTop;
    vert_wvel_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',6);
    temp = temp(x,y,z).*areaTop;
    vert_phihyd_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',7);
    temp = temp(x,y,z).*areaTop;
    vert_drhodr_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    charbgc = [strs,'diag_bgc.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    temp = temp(x,y,z).*areaTop;
    vert_carbon_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',2);
    temp = temp(x,y,z).*areaTop;
    vert_alk_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',3);
    temp = temp(x,y,z).*areaTop;
    vert_oxygen_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',4);
    temp = temp(x,y,z).*areaTop;
    vert_nitrate_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',5);
    temp = temp(x,y,z).*areaTop;
    vert_phosphate_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',6);
    temp = temp(x,y,z).*areaTop;
    vert_iron_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',7);
    temp = temp(x,y,z).*areaTop;
    vert_don_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',8);
    temp = temp(x,y,z).*areaTop;
    vert_dop_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',9);
    temp = temp(x,y,z).*areaTop;
    vert_phyto_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',10);
    temp = temp(x,y,z).*areaTop;
    vert_age_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',11);
    temp = temp(x,y,z).*areaTop;
    vert_ph_6(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
end

RC6 = RC;
RF6 = RF;
DRF6 = DRF;

save VERT_6  vert*_6 RC6 RF6 DRF6

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
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim
nt = 12;

% select area
x = 17:676;
y = 106:467;
z = 1:104; %
% z = 1:36; % top 1000 m
vl = 104;


XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

for ii=1:nx
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
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end

area = RAC(x,y);

lvls = [3,6];

vert_theta_12 = zeros(vl,365);
vert_salt_12 = zeros(vl,365);
vert_uvel_12 = zeros(vl,365);
vert_vvel_12 = zeros(vl,365);
vert_wvel_12 = zeros(vl,365);
vert_phihyd_12 = zeros(vl,365);
vert_drhodr_12 = zeros(vl,365);
vert_carbon_12 = zeros(vl,365);
vert_alk_12 = zeros(vl,365);
vert_oxygen_12 = zeros(vl,365);
vert_nitrate_12 = zeros(vl,365);
vert_phosphate_12 = zeros(vl,365);
vert_iron_12 = zeros(vl,365);
vert_don_12 = zeros(vl,365);
vert_dop_12 = zeros(vl,365);
vert_phyto_12 = zeros(vl,365);
vert_age_12 = zeros(vl,365);
vert_ph_12 = zeros(vl,365);

temp2 = zeros(vl,1);


for ii=1:365
    charstate = [strs,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    temp = temp(x,y,z).*areaTop;
    vert_theta_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',2);
    temp = temp(x,y,z).*areaTop;
    vert_salt_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',3);
    temp = temp(x,y,z).*areaTop;
    vert_uvel_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',4);
    temp = temp(x,y,z).*areaTop;
    vert_vvel_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',5);
    temp = temp(x,y,z).*areaTop;
    vert_wvel_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',6);
    temp = temp(x,y,z).*areaTop;
    vert_phihyd_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charstate,'rec',7);
    temp = temp(x,y,z).*areaTop;
    vert_drhodr_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    charbgc = [strs,'diag_bgc.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    temp = temp(x,y,z).*areaTop;
    vert_carbon_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',2);
    temp = temp(x,y,z).*areaTop;
    vert_alk_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',3);
    temp = temp(x,y,z).*areaTop;
    vert_oxygen_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',4);
    temp = temp(x,y,z).*areaTop;
    vert_nitrate_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',5);
    temp = temp(x,y,z).*areaTop;
    vert_phosphate_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',6);
    temp = temp(x,y,z).*areaTop;
    vert_iron_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',7);
    temp = temp(x,y,z).*areaTop;
    vert_don_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',8);
    temp = temp(x,y,z).*areaTop;
    vert_dop_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',9);
    temp = temp(x,y,z).*areaTop;
    vert_phyto_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',10);
    temp = temp(x,y,z).*areaTop;
    vert_age_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
    
    temp = rdmds(charbgc,'rec',11);
    temp = temp(x,y,z).*areaTop;
    vert_ph_12(:,ii) = sum(temp,[1,2])./areaBox;
    clear temp
end

RC12 = RC;
RF12 = RF;
DRF12 = DRF;

save VERT_12  vert*_12 RC12 RF12 DRF12



toc()