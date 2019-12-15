
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
str = '../MITgcm/verification/SO6_20190513/diag/';
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

lw = 2.6;

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



