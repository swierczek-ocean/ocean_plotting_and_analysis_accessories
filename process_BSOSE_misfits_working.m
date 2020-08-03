clear
close all
clc
tic()


str1 = 'BSOSE/VIZ_SO_2017_PFL_model.nc';

prof_O2m = ncread(str1,'prof_O2estim');
prof_O2o = ncread(str1,'prof_O2');

prof_NO3m = ncread(str1,'prof_NO3estim');
prof_NO3o = ncread(str1,'prof_NO3');

prof_CHLm = ncread(str1,'prof_CHLestim');
prof_CHLo = ncread(str1,'prof_CHL');

prof_DICm = ncread(str1,'prof_DICestim');
prof_DICo = ncread(str1,'prof_DIC');

prof_lonv = ncread(str1,'prof_lon');
prof_lonv(prof_lonv>180) = prof_lonv(prof_lonv>180) - 360;
prof_latv = ncread(str1,'prof_lat');

VIZ_O2_temp = prof_O2m - prof_O2o;
VIZ_NO3_temp = prof_NO3m - prof_NO3o;
VIZ_CHL_temp = prof_CHLm - prof_CHLo;
VIZ_DIC_temp = prof_DICm - prof_DICo;

VIZ_T = zeros(2801,1);
VIZ_NO3 = zeros(2801,1);

for ii=1:2801
    temp = VIZ_O2_temp(1:23,ii);
    VIZ_O2(ii) = mean(temp(isnan(temp)==0));
    temp = VIZ_NO3_temp(1:23,ii);
    VIZ_NO3(ii) = mean(temp(isnan(temp)==0));
    temp = VIZ_CHL_temp(1:23,ii);
    VIZ_CHL(ii) = mean(temp(isnan(temp)==0));
    temp = VIZ_DIC_temp(1:23,ii);
    VIZ_DIC(ii) = mean(temp(isnan(temp)==0));
end

clear *temp




str1 = 'BSOSE/USGO_SO_2017_PFL_D_model.nc';

prof_depth = ncread(str1,'prof_depth');

prof_YYYYMMDDm = ncread(str1,'prof_YYYYMMDD');
prof_HHMMSSm = ncread(str1,'prof_HHMMSS');

prof_Tm = ncread(str1,'prof_Testim');
prof_To = ncread(str1,'prof_T');

prof_Sm = ncread(str1,'prof_Sestim');
prof_So = ncread(str1,'prof_S');

prof_lon = ncread(str1,'prof_lon');
prof_lon(prof_lon>180) = prof_lon(prof_lon>180) - 360;
prof_lat = ncread(str1,'prof_lat');

USGO_T_temp = prof_Tm - prof_To;
USGO_S_temp = prof_Sm - prof_So;

USGO_T = zeros(31307,1);
USGO_S = zeros(31307,1);

for ii=1:31307
    temp = USGO_T_temp(1:23,ii);
    USGO_T(ii) = mean(temp(isnan(temp)==0));
    temp = USGO_S_temp(1:23,ii);
    USGO_S(ii) = mean(temp(isnan(temp)==0));
end

clear *temp



str1 = 'BSOSE/HDO_SO_2017_CTD_model.nc';

prof_depth = ncread(str1,'prof_depth');

prof_Tm = ncread(str1,'prof_Testim');
prof_To = ncread(str1,'prof_T');

prof_Sm = ncread(str1,'prof_Sestim');
prof_So = ncread(str1,'prof_S');

prof_O2m = ncread(str1,'prof_O2estim');
prof_O2o = ncread(str1,'prof_O2');

prof_CHLm = ncread(str1,'prof_CHLestim');
prof_CHLo = ncread(str1,'prof_CHL');

prof_lonh = ncread(str1,'prof_lon');
prof_lonh(prof_lonh>180) = prof_lonh(prof_lonh>180) - 360;
prof_lath = ncread(str1,'prof_lat');

HDO_T_temp = prof_Tm - prof_To;
HDO_S_temp = prof_Sm - prof_So;
HDO_O2_temp = prof_Tm - prof_O2o;
HDO_CHL_temp = prof_Sm - prof_CHLo;

HDO_T = zeros(372,1);
HDO_S = zeros(372,1);
HDO_O2 = zeros(372,1);
HDO_CHL = zeros(372,1);

for ii=1:372
    temp = HDO_T_temp(1:37,ii);
    HDO_T(ii) = mean(temp(isnan(temp)==0));
    temp = HDO_S_temp(1:37,ii);
    HDO_S(ii) = mean(temp(isnan(temp)==0));
    temp = HDO_O2_temp(1:37,ii);
    HDO_O2(ii) = mean(temp(isnan(temp)==0));
    temp = HDO_CHL_temp(1:37,ii);
    HDO_CHL(ii) = mean(temp(isnan(temp)==0));
end

clear *temp

save BSOSE_misfits USGO* HDO* VIZ* prof_l*


toc()