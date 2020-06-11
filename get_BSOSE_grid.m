clear
close all
clc
tic()

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_Theta.nc';


XC = ncread(str,'XC');
YC = ncread(str,'YC');
Z = ncread(str,'Z');

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_Uvel.nc';

XG = ncread(str,'XG');

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_Vvel.nc';

YG = ncread(str,'YG');
drF = ncread(str,'drF');
month_time = ncread(str,'time');

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_5day_Theta.nc';

time_5day = ncread(str,'time');

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_Wvel.nc';

Zl = ncread(str,'Zl');

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_1dy_pCO2.nc';

time_1day = ncread(str,'time');


clear str

save BSOSE_grid


toc()