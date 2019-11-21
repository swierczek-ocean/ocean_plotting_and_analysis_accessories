
%% 

hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO12_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO12_20190513/run/hFacS');
DXG = rdmds('../MITgcm/verification/SO12_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO12_20190513/run/DYG');
DXC = rdmds('../MITgcm/verification/SO12_20190513/run/DXC');
DYC = rdmds('../MITgcm/verification/SO12_20190513/run/DYC');
DRF = rdmds('../MITgcm/verification/SO12_20190513/run/DRF');
RAC = rdmds('../MITgcm/verification/SO12_20190513/run/RAC');
str = '../MITgcm/verification/SO12_20190513/diag/';
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';
strb = '../MITgcm/verification/SO12_20190513/diag_budgets/';

sec = 2628000;

%% heat, salt, carbon, nitrate, and phyto inventories

heat_inv12_full = zeros(396,1);
heat_inv12_box_ab = zeros(396,1);
heat_inv12_box_abe = zeros(396,1);
% salt_inv12_full = zeros(396,1);
% salt_inv12_box_ab = zeros(396,1);
% salt_inv12_box_abe = zeros(396,1);
carbon_inv12_full = zeros(396,1);
carbon_inv12_box_ab = zeros(396,1);
carbon_inv12_box_abe = zeros(396,1);
nitrate_inv12_full = zeros(396,1);
nitrate_inv12_box_ab = zeros(396,1);
nitrate_inv12_box_abe = zeros(396,1);
phyto_inv12_full = zeros(396,1);
phyto_inv12_box_ab = zeros(396,1);
phyto_inv12_box_abe = zeros(396,1);

tfield = 1;
sfield = 2;
cfield = 1;
nfield = 4;
phfield = 9;

fb_ind_w = 17;
fb_ind_e = 736;
fb_ind_s = 18;
fb_ind_n = 496;

ab_ind_w = 137;
ab_ind_e = 437;
ab_ind_s = 165;
ab_ind_n = 433;

abe_ind_w = 438;
abe_ind_e = 497;
abe_ind_s = 165;
abe_ind_n = 433;

cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3





