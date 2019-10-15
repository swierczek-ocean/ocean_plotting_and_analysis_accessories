clear
close all
clc
tic()

str1 = 'deployment0001_GA01SUMO-SBD11-06-METBKA000-telemetered-metbk_a_dcl_instrument_20150315T212522.380000-20150610T084422.012000.nc';
str2 = 'deployment0002_GA01SUMO-SBD11-06-METBKA000-telemetered-metbk_a_dcl_instrument_20151114T210631.697000-20161108T100305.770000.nc';
str3 = 'deployment0003_GA01SUMO-SBD11-06-METBKA000-telemetered-metbk_a_dcl_instrument_20161027T014720.743000-20180114T102330.970000.nc';

ncdisp(str3)

str_key_metbk = '[time,lat,lon,air_temp,pres,dlw,rain,relhum,sst,dsw,u5m,v5m,netsirr,sss,spfh2m,ctd_depth,relwindspd,tfluxup,lattfluxup,netlirr,senstfluxup,]';

OOI_METBK = zeros(1026970,21);

OOI_METBK(1:9299,2) = -42.9228*ones(9299,1);
OOI_METBK(1:9299,3) = -42.4558*ones(9299,1);
OOI_METBK(9300:424274,2) = -42.9246*ones(414975,1);
OOI_METBK(9300:424274,3) = -42.5867*ones(414975,1);
OOI_METBK(424275:end,2) = -42.9204*ones(602696,1);
OOI_METBK(424275:end,3) = -42.4409*ones(602696,1);

%% air temperature
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
air_temp = [ncread(str1,'air_temperature');ncread(str2,'air_temperature');...
    ncread(str3,'air_temperature')];
atqce = [ncread(str1,'air_temperature_qc_executed');...
    ncread(str2,'air_temperature_qc_executed');...
    ncread(str3,'air_temperature_qc_executed')];
atqcr = [ncread(str1,'air_temperature_qc_results');...
    ncread(str2,'air_temperature_qc_results');...
    ncread(str3,'air_temperature_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,4) = air_temp;

QC = atqce - atqcr;

air_temp = air_temp(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('air temp \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_tmp2m_degC air_temp time lat lon
%%

%% barometric_pressure
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
pres = [ncread(str1,'barometric_pressure');ncread(str2,'barometric_pressure');...
    ncread(str3,'barometric_pressure')];
btqce = [ncread(str1,'barometric_pressure_qc_executed');...
    ncread(str2,'barometric_pressure_qc_executed');...
    ncread(str3,'barometric_pressure_qc_executed')];
btqcr = [ncread(str1,'barometric_pressure_qc_results');...
    ncread(str2,'barometric_pressure_qc_results');...
    ncread(str3,'barometric_pressure_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,5) = pres;

QC = btqce - btqcr;

pres = pres(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('pressure \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_pres pres time lat lon

%% 

%% longwave_irradiance
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
dlw = [ncread(str1,'longwave_irradiance');ncread(str2,'longwave_irradiance');...
    ncread(str3,'longwave_irradiance')];
btqce = [ncread(str1,'longwave_irradiance_qc_executed');...
    ncread(str2,'longwave_irradiance_qc_executed');...
    ncread(str3,'longwave_irradiance_qc_executed')];
btqcr = [ncread(str1,'longwave_irradiance_qc_results');...
    ncread(str2,'longwave_irradiance_qc_results');...
    ncread(str3,'longwave_irradiance_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,6) = dlw;

QC = btqce - btqcr;

dlw = dlw(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('downward longwave radiation \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_dlw dlw time lat lon

%% 

%% precipitation
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
rain = [ncread(str1,'precipitation');ncread(str2,'precipitation');...
    ncread(str3,'precipitation')];
btqce = [ncread(str1,'precipitation_qc_executed');...
    ncread(str2,'precipitation_qc_executed');...
    ncread(str3,'precipitation_qc_executed')];
btqcr = [ncread(str1,'precipitation_qc_results');...
    ncread(str2,'precipitation_qc_results');...
    ncread(str3,'precipitation_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,7) = rain;

QC = btqce - btqcr;

rain = rain(QC==0|QC==16|QC==17);
time = time(QC==0|QC==16|QC==17);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('precipitation \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_rain rain time lat lon

%% 

%% relative_humidity
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
relhum = [ncread(str1,'relative_humidity');ncread(str2,'relative_humidity');...
    ncread(str3,'relative_humidity')];
btqce = [ncread(str1,'relative_humidity_qc_executed');...
    ncread(str2,'relative_humidity_qc_executed');...
    ncread(str3,'relative_humidity_qc_executed')];
btqcr = [ncread(str1,'relative_humidity_qc_results');...
    ncread(str2,'relative_humidity_qc_results');...
    ncread(str3,'relative_humidity_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,8) = relhum;

QC = btqce - btqcr;

relhum = relhum(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('relative humidity \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_relhum relhum time lat lon

%% 

%% sea_surface_temperature
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
sst = [ncread(str1,'sea_surface_temperature');ncread(str2,'sea_surface_temperature');...
    ncread(str3,'sea_surface_temperature')];
btqce = [ncread(str1,'sea_surface_temperature_qc_executed');...
    ncread(str2,'sea_surface_temperature_qc_executed');...
    ncread(str3,'sea_surface_temperature_qc_executed')];
btqcr = [ncread(str1,'sea_surface_temperature_qc_results');...
    ncread(str2,'sea_surface_temperature_qc_results');...
    ncread(str3,'sea_surface_temperature_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,9) = sst;

QC = btqce - btqcr;

sst = sst(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('sst \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_sst sst time lat lon

%% 

%% shortwave_irradiance
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
dsw = [ncread(str1,'shortwave_irradiance');ncread(str2,'shortwave_irradiance');...
    ncread(str3,'shortwave_irradiance')];
btqce = [ncread(str1,'shortwave_irradiance_qc_executed');...
    ncread(str2,'shortwave_irradiance_qc_executed');...
    ncread(str3,'shortwave_irradiance_qc_executed')];
btqcr = [ncread(str1,'shortwave_irradiance_qc_results');...
    ncread(str2,'shortwave_irradiance_qc_results');...
    ncread(str3,'shortwave_irradiance_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,10) = dsw;

QC = btqce - btqcr;

dsw = dsw(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('downward shortwave radiation \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_dsw dsw time lat lon

%% 

%% met_windavg_mag_corr_east
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
u5m = [ncread(str1,'met_windavg_mag_corr_east');ncread(str2,'met_windavg_mag_corr_east');...
    ncread(str3,'met_windavg_mag_corr_east')];
btqce = [ncread(str1,'eastward_wind_velocity_qc_executed');...
    ncread(str2,'eastward_wind_velocity_qc_executed');...
    ncread(str3,'eastward_wind_velocity_qc_executed')];
btqcr = [ncread(str1,'eastward_wind_velocity_qc_results');...
    ncread(str2,'eastward_wind_velocity_qc_results');...
    ncread(str3,'eastward_wind_velocity_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,11) = u5m;

QC = btqce - btqcr;

u5m = u5m(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('5m U wind \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_u5m u5m time lat lon

%% 

%% met_windavg_mag_corr_north
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
v5m = [ncread(str1,'met_windavg_mag_corr_north');ncread(str2,'met_windavg_mag_corr_north');...
    ncread(str3,'met_windavg_mag_corr_north')];
btqce = [ncread(str1,'northward_wind_velocity_qc_executed');...
    ncread(str2,'northward_wind_velocity_qc_executed');...
    ncread(str3,'northward_wind_velocity_qc_executed')];
btqcr = [ncread(str1,'northward_wind_velocity_qc_results');...
    ncread(str2,'northward_wind_velocity_qc_results');...
    ncread(str3,'northward_wind_velocity_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,12) = v5m;

QC = btqce - btqcr;

v5m = v5m(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('5m V wind \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_v5m v5m time lat lon

%% 


%% met_netsirr
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
netsirr = [ncread(str1,'met_netsirr');ncread(str2,'met_netsirr');...
    ncread(str3,'met_netsirr')];
btqce = [ncread(str1,'met_netsirr_qc_executed');...
    ncread(str2,'met_netsirr_qc_executed');...
    ncread(str3,'met_netsirr_qc_executed')];
btqcr = [ncread(str1,'met_netsirr_qc_results');...
    ncread(str2,'met_netsirr_qc_results');...
    ncread(str3,'met_netsirr_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,13) = netsirr;

QC = btqce - btqcr;

netsirr = netsirr(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('net shortwave irradiance \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_netsirr netsirr time lat lon

%% 

%% met_salsurf
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
sss = [ncread(str1,'met_salsurf');ncread(str2,'met_salsurf');...
    ncread(str3,'met_salsurf')];
btqce = [ncread(str1,'met_salsurf_qc_executed');...
    ncread(str2,'met_salsurf_qc_executed');...
    ncread(str3,'met_salsurf_qc_executed')];
btqcr = [ncread(str1,'met_salsurf_qc_results');...
    ncread(str2,'met_salsurf_qc_results');...
    ncread(str3,'met_salsurf_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,14) = sss;

QC = btqce - btqcr;

sss = sss(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('sss \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_sss sss time lat lon

%% 

%% met_spechum
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
spfh2m = [ncread(str1,'met_spechum');ncread(str2,'met_spechum');...
    ncread(str3,'met_spechum')];
btqce = [ncread(str1,'met_spechum_qc_executed');...
    ncread(str2,'met_spechum_qc_executed');...
    ncread(str3,'met_spechum_qc_executed')];
btqcr = [ncread(str1,'met_spechum_qc_results');...
    ncread(str2,'met_spechum_qc_results');...
    ncread(str3,'met_spechum_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,15) = spfh2m;

QC = btqce - btqcr;

spfh2m = spfh2m(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('specific humidity \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_spfh2m spfh2m time lat lon

%% 

%% ct_depth
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
depth = [ncread(str1,'ct_depth');ncread(str2,'ct_depth');...
    ncread(str3,'ct_depth')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,16) = depth;


lat = -42.92;
lon = 360-42.5;
fprintf('ctd depth \n')

save OOI_MTBLK_MATS/ooi_metbk_depth depth time lat lon

%% 

%% met_relwind_speed
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
relwindspd = [ncread(str1,'met_relwind_speed');ncread(str2,'met_relwind_speed');...
    ncread(str3,'met_relwind_speed')];
btqce = [ncread(str1,'met_relwind_speed_qc_executed');...
    ncread(str2,'met_relwind_speed_qc_executed');...
    ncread(str3,'met_relwind_speed_qc_executed')];
btqcr = [ncread(str1,'met_relwind_speed_qc_results');...
    ncread(str2,'met_relwind_speed_qc_results');...
    ncread(str3,'met_relwind_speed_qc_results')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,17) = relwindspd;

QC = btqce - btqcr;

relwindspd = relwindspd(QC==0|QC==16);
time = time(QC==0|QC==16);
lat = -42.92;
lon = 360-42.5;

len1 = length(QC);
len2 = length(time);
fprintf('relative wind speed \n')
fprintf('%g obs were saved out of %g total. %g failed QC \n',len2,len1,len1-len2)

save OOI_MTBLK_MATS/ooi_metbk_relwindspd relwindspd time lat lon

%% 

%% met_heatflx_minute
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
tfluxup = [ncread(str1,'met_heatflx_minute');ncread(str2,'met_heatflx_minute');...
    ncread(str3,'met_heatflx_minute')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,18) = tfluxup;

lat = -42.92;
lon = 360-42.5;

fprintf('net upward heat flux \n')

save OOI_MTBLK_MATS/ooi_metbk_tfluxup tfluxup time lat lon

%% 

%% met_latnflx_minute
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
lattfluxup = [ncread(str1,'met_latnflx_minute');ncread(str2,'met_latnflx_minute');...
    ncread(str3,'met_latnflx_minute')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,19) = lattfluxup;

lat = -42.92;
lon = 360-42.5;

fprintf('upward latent heat flux \n')

save OOI_MTBLK_MATS/ooi_metbk_lattfluxup lattfluxup time lat lon

%% 

%% met_netlirr_minute
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
netlirr = [ncread(str1,'met_netlirr_minute');ncread(str2,'met_netlirr_minute');...
    ncread(str3,'met_netlirr_minute')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,20) = netlirr;

lat = -42.92;
lon = 360-42.5;

fprintf('net longwave irradiance \n')

save OOI_MTBLK_MATS/ooi_metbk_netlirr netlirr time lat lon

%% 

%% met_sensflx_minute
time = [ncread(str1,'time');ncread(str2,'time');ncread(str3,'time')];
senstfluxup = [ncread(str1,'met_sensflx_minute');ncread(str2,'met_sensflx_minute');...
    ncread(str3,'met_sensflx_minute')];

time = acc_convert_time_19000101(time);

OOI_METBK(:,1) = time;
OOI_METBK(:,21) = senstfluxup;

lat = -42.92;
lon = 360-42.5;

fprintf('upward sensible heat flux \n')

save OOI_MTBLK_MATS/ooi_metbk_senstfluxup senstfluxup time lat lon

%% 

save OOI_MTBLK_MATS/OOI_METBK OOI_METBK str_key_metbk


toc()