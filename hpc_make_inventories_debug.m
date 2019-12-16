
%%

hFacC = rdmds('diag/hFacC');
hFacW = rdmds('diag/hFacW');
hFacS = rdmds('diag/hFacS');
DXG = rdmds('diag/DXG');
DYG = rdmds('diag/DYG');
DXC = rdmds('diag/DXC');
DYC = rdmds('diag/DYC');
XC = rdmds('diag/XC');
YC = rdmds('diag/YC');
RAC = squeeze(rdmds('diag/RAC'));
RC = squeeze(rdmds('diag/RC'));
RF = squeeze(rdmds('diag/RF'));
DRF = squeeze(rdmds('diag/DRF'));
strs = 'diag/';


sec = 2628000;
dt = sec;

%% heat, salt, carbon, nitrate, and phyto inventories

heat_inv3_box_ab = zeros(396,1);
salt_inv3_box_ab = zeros(396,1);
carbon_inv3_box_ab = zeros(396,1);
nitrate_inv3_box_ab = zeros(396,1);
oxygen_inv3_box_ab = zeros(396,1);
phyto_inv3_box_ab = zeros(396,1);

tfield = 1;
sfield = 2;
cfield = 1;
nfield = 4;
phfield = 9;
ofield = 3;

ab_ind_w = 6;
ab_ind_e = 170;
ab_ind_s = 26;
ab_ind_n = 119;


cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3



for ii=1:13
    charstate = [strs,'diag_state.',num2str(1460*ii,'%010.f')];
    THETA = rdmds(charstate,'rec',tfield);
    heat_inv3_box_ab(ii) = sum(sum(sum(cp_oce*rho.*THETA(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    SALT = rdmds(charstate,'rec',sfield);
    salt_inv3_box_ab(ii) = sum(sum(sum(1000*rho*SALT(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    clear THETA SALT
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
end

save carbon_inv3 carbon_inv3*
save nitrate_inv3 nitrate_inv3*
save phyto_inv3 phyto_inv3*
save heat_inv3 heat_inv3*
save salt_inv3 salt_inv3*
save oxygen_inv3 oxygen_inv3*



%%

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
strs = '../MITgcm/verification/SO6_20190513/diag/';
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';
strb = '../MITgcm/verification/SO6_20190513/diag_budgets/';
strsn = '../MITgcm/verification/SO6_20190513/diag_snaps/';


sec = 2628000;
dt = sec;

%% heat, salt, carbon, nitrate, and phyto inventories

heat_inv6_box_ab = zeros(396,1);
salt_inv6_box_ab = zeros(396,1);
carbon_inv6_box_ab = zeros(396,1);
nitrate_inv6_box_ab = zeros(396,1);
oxygen_inv6_box_ab = zeros(396,1);
phyto_inv6_box_ab = zeros(396,1);

tfield = 1;
sfield = 2;
cfield = 1;
nfield = 4;
phfield = 9;
ofield = 3;

ab_ind_w = 11;
ab_ind_e = 340;
ab_ind_s = 54;
ab_ind_n = 235;


cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3



for ii=1:396
    charstate = [strs,'diag_state.',num2str(72*ii,'%010.f')];
    THETA = rdmds(charstate,'rec',tfield);
    heat_inv6_box_ab(ii) = sum(sum(sum(cp_oce*rho*THETA(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    SALT = rdmds(charstate,'rec',sfield);
    salt_inv6_box_ab(ii) = sum(sum(sum(1000*rho*SALT(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    clear THETA
    charbgc = [strs,'diag_bgc.',num2str(72*ii,'%010.f')];
    CARBON = rdmds(charbgc,'rec',cfield);
    carbon_inv6_box_ab(ii) = sum(sum(sum(CARBON(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    NITRATE = rdmds(charbgc,'rec',nfield);
    nitrate_inv6_box_ab(ii) = sum(sum(sum(NITRATE(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    OXYGEN = rdmds(charbgc,'rec',ofield);
    oxygen_inv6_box_ab(ii) = sum(sum(sum(OXYGEN(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    PHYTO = rdmds(charbgc,'rec',phfield);
    phyto_inv6_box_ab(ii) = sum(sum(sum(PHYTO(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    clear CARBON NITRATE PHYTO
end

save carbon_inv6 carbon_inv6*
save nitrate_inv6 nitrate_inv6*
save phyto_inv6 phyto_inv6*
save heat_inv6 heat_inv6*
save salt_inv6 salt_inv6*
save oxygen_inv6 oxygen_inv6*



%%

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
strs = '../MITgcm/verification/SO12_20190513/diag/';
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';
strb = '../MITgcm/verification/SO12_20190513/diag_budgets/';
strsn = '../MITgcm/verification/SO12_20190513/diag_snaps/';


sec = 2628000;
dt = sec;

%% heat, salt, carbon, nitrate, and phyto inventories

heat_inv12_box_ab = zeros(396,1);
salt_inv12_box_ab = zeros(396,1);
carbon_inv12_box_ab = zeros(396,1);
nitrate_inv12_box_ab = zeros(396,1);
oxygen_inv12_box_ab = zeros(396,1);
phyto_inv12_box_ab = zeros(396,1);

tfield = 1;
sfield = 2;
cfield = 1;
nfield = 4;
phfield = 9;
ofield = 3;

ab_ind_w = 17;
ab_ind_e = 676;
ab_ind_s = 106;
ab_ind_n = 467;

lw = 2.6;

cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3



for ii=1:396
    charstate = [strs,'diag_state.',num2str(360*ii,'%010.f')];
    THETA = rdmds(charstate,'rec',tfield);
    heat_inv12_box_ab(ii) = sum(sum(sum(cp_oce*rho*THETA(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    SALT = rdmds(charstate,'rec',sfield);
    salt_inv12_box_ab(ii) = sum(sum(sum(1000*rho*SALT(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    clear THETA
    charbgc = [strs,'diag_bgc.',num2str(360*ii,'%010.f')];
    CARBON = rdmds(charbgc,'rec',cfield);
    carbon_inv12_box_ab(ii) = sum(sum(sum(CARBON(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    NITRATE = rdmds(charbgc,'rec',nfield);
    nitrate_inv12_box_ab(ii) = sum(sum(sum(NITRATE(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    OXYGEN = rdmds(charbgc,'rec',ofield);
    oxygen_inv12_box_ab(ii) = sum(sum(sum(OXYGEN(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    PHYTO = rdmds(charbgc,'rec',phfield);
    phyto_inv12_box_ab(ii) = sum(sum(sum(PHYTO(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:).*DRF.*RAC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n).*hFacC(ab_ind_w:ab_ind_e,...
        ab_ind_s:ab_ind_n,:))));
    clear CARBON NITRATE PHYTO
end

save carbon_inv12 carbon_inv12*
save nitrate_inv12 nitrate_inv12*
save phyto_inv12 phyto_inv12*
save heat_inv12 heat_inv12*
save salt_inv12 salt_inv12*
save oxygen_inv12 oxygen_inv12*

clear
