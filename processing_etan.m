clear
close all
clc

tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12
load ETAN_CURRENTS
load BSOSE_ETAN
%%

SPEED_BSOSE = squeeze(SPEED_BSOSE);
% ETAN_BSOSE(SPEED_BSOSE==0) = 999999999;
SPEED_BSOSE(SPEED_BSOSE==0) = 999999999;

% ETAN_Series32(ETAN_Series32==-10) = 999999999;
% ETAN_Series62(ETAN_Series62==-10) = 999999999;
% ETAN_Series122(ETAN_Series122==-10) = 999999999;

SPEED_Series32(SPEED_Series32==0) = 999999999;
SPEED_Series62(SPEED_Series62==0) = 999999999;
SPEED_Series122(SPEED_Series122==0) = 999999999;

clearvars -except SPEED*

save SPEED_MAT



