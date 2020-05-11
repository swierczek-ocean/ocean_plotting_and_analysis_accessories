clear
close all
clc
tic()

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_Theta.nc';


XC = ncread(str,'XC');
YC = ncread(str,'YC');
RC = ncread(str,'RC');










toc()