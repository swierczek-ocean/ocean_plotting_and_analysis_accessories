clear
close all
clc
tic()

str1 = 'deployment0002_GA01SUMO-RID16-04-VELPTA000-telemetered-velpt_ab_dcl_instrument_20151114T211621-20161108T084652.nc';
str2 = 'deployment0003_GA01SUMO-RID16-04-VELPTA000-telemetered-velpt_ab_dcl_instrument_20161027T020000-20170324T223325.nc';

ncdisp(str2)

VELPT_12m = zeros(47622,3);

time = [ncread(str1,'time');ncread(str2,'time')];
uvel12 = [ncread(str1,'eastward_velocity');ncread(str2,'eastward_velocity')];
vvel12 = [ncread(str1,'northward_velocity');ncread(str2,'northward_velocity')];

time = acc_convert_time_19000101(time);
VELPT_12m(:,1) = time;
VELPT_12m(:,2) = uvel12;
VELPT_12m(:,3) = vvel12;

str_velpt = 'time,uvel12,vvel12';
lat = -42.92;
lon1 = 360-42.59;
lon2 = 360-42.44;

save OOI_MTBLK_MATS/VELPT_12m VELPT_12m str_velpt lat lon1 lon2

toc()