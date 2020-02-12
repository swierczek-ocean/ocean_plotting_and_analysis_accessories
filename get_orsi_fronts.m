clear
close all
clc
tic()

STF = load('front_stf.txt');
STF_Y = STF(:,2);
temp = STF(:,1);
% temp(temp<0) = % temp(temp<0)+360;
STF_X = temp;

SAF = load('front_saf.txt');
SAF_Y = SAF(:,2);
temp = SAF(:,1);
% temp(temp<0) = % temp(temp<0)+360;
SAF_X = temp;

SBDY = load('front_sbdy.txt');
SBDY_Y = SBDY(:,2);
temp = SBDY(:,1);
% temp(temp<0) = % temp(temp<0)+360;
SBDY_X = temp;

SACCF = load('front_saccf.txt');
SACCF_Y = SACCF(:,2);
temp = SACCF(:,1);
% temp(temp<0) = % temp(temp<0)+360;
SACCF_X = temp;

PF = load('front_pf.txt');
PF_Y = PF(:,2);
temp = PF(:,1);
% temp(temp<0) = % temp(temp<0)+360;
PF_X = temp;

save FRONTS STF_* SAF_* PF_* SBDY_* SACCF_*

toc()