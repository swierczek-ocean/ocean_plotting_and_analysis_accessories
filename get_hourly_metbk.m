clear
close all
clc
tic()

timeh = 736038:(1/24):737075;
timeh = timeh';

%% 1
load OOI_MTBLK_MATS/ooi_metbk_dlw
ooi_array = [time,dlw];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_dlw_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 1

%% 2
load OOI_MTBLK_MATS/ooi_metbk_dsw
ooi_array = [time,dsw];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_dsw_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 2

%% 3
load OOI_MTBLK_MATS/ooi_metbk_lattfluxup
ooi_array = [time,lattfluxup];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);

array_exist = ooi_metbk_hourly(:,2);
array_exist = array_exist(isnan(array_exist)==0);
ooi_mean = mean(array_exist);
ooi_std = std(array_exist,0);


% ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
% ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_lattfluxup_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 3

%% 4
load OOI_MTBLK_MATS/ooi_metbk_netlirr
ooi_array = [time,netlirr];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);

array_exist = ooi_metbk_hourly(:,2);
array_exist = array_exist(isnan(array_exist)==0);
ooi_mean = mean(array_exist);
ooi_std = std(array_exist,0);


% ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
% ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_netlirr_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 4

%% 5
load OOI_MTBLK_MATS/ooi_metbk_netsirr
ooi_array = [time,netsirr];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_netsirr_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 5

%% 6
load OOI_MTBLK_MATS/ooi_metbk_pres
ooi_array = [time,pres];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_pres_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 6

%% 7
load OOI_MTBLK_MATS/ooi_metbk_rain
ooi_array = [time,rain];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_rain_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 7

%% 8
load OOI_MTBLK_MATS/ooi_metbk_relhum
ooi_array = [time,relhum];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_relhum_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 8

%% 9
load OOI_MTBLK_MATS/ooi_metbk_relwindspd
ooi_array = [time,relwindspd];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_relwindspd_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 9

%% 10
load OOI_MTBLK_MATS/ooi_metbk_senstfluxup
ooi_array = [time,senstfluxup];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);

array_exist = ooi_metbk_hourly(:,2);
array_exist = array_exist(isnan(array_exist)==0);
ooi_mean = mean(array_exist);
ooi_std = std(array_exist,0);


% ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
% ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_senstfluxup_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 10

%% 11
load OOI_MTBLK_MATS/ooi_metbk_spfh2m
ooi_array = [time,spfh2m];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_spfh2m_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 11

%% 12
load OOI_MTBLK_MATS/ooi_metbk_sss
ooi_array = [time,sss];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_sss_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 12

%% 13
load OOI_MTBLK_MATS/ooi_metbk_sst
ooi_array = [time,sst];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_sst_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 13

%% 14
load OOI_MTBLK_MATS/ooi_metbk_tfluxup
ooi_array = [time,tfluxup];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);

array_exist = ooi_metbk_hourly(:,2);
array_exist = array_exist(isnan(array_exist)==0);
ooi_mean = mean(array_exist);
ooi_std = std(array_exist,0);


% ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
% ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_tfluxup_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 14

%% 15
load OOI_MTBLK_MATS/ooi_metbk_tmp2m_degC
ooi_array = [time,air_temp];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_tmp2m_degC_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 15

%% 16
load OOI_MTBLK_MATS/ooi_metbk_u5m
ooi_array = [time,u5m];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_u5m_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 16

%% 17
load OOI_MTBLK_MATS/ooi_metbk_v5m
ooi_array = [time,v5m];
ooi_metbk_hourly = process_OOI_met_hourly(ooi_array,timeh);
ooi_mean = mean(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2));
ooi_std = std(ooi_metbk_hourly(ooi_metbk_hourly(:,3)==1,2),0);
save OOI_MTBLK_MATS/ooi_metbk_v5m_hourly ooi_metbk_hourly ooi_mean ooi_std
clearvars -except timeh
%% 17






toc()