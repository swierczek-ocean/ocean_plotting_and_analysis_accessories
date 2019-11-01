clear
close all
clc
tic()

timeh = 736038:(1/24):737075;
timeh = timeh';

%% 1
load OOI_MTBLK_MATS/ooi_metbk_dlw
ooi_array = [time,dlw];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_dlw_hourly_psd ooi_metbk_hourly 
clearvars -except timeh
%% 1

%% 2
load OOI_MTBLK_MATS/ooi_metbk_dsw
ooi_array = [time,dsw];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_dsw_hourly_psd ooi_metbk_hourly
clearvars -except timeh
%% 2

%% 6
load OOI_MTBLK_MATS/ooi_metbk_pres
ooi_array = [time,pres];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_pres_hourly_psd ooi_metbk_hourly
clearvars -except timeh
%% 6

%% 7
load OOI_MTBLK_MATS/ooi_metbk_rain
ooi_array = [time,rain];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_rain_hourly_psd ooi_metbk_hourly
clearvars -except timeh
%% 7


%% 11
load OOI_MTBLK_MATS/ooi_metbk_spfh2m
ooi_array = [time,spfh2m];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_spfh2m_hourly_psd ooi_metbk_hourly
clearvars -except timeh
%% 11

%% 12
load OOI_MTBLK_MATS/ooi_metbk_sss
ooi_array = [time,sss];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_sss_hourly_psd ooi_metbk_hourly 
clearvars -except timeh
%% 12

%% 13
load OOI_MTBLK_MATS/ooi_metbk_sst
ooi_array = [time,sst];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_sst_hourly_psd ooi_metbk_hourly 
clearvars -except timeh
%% 13

%% 15
load OOI_MTBLK_MATS/ooi_metbk_tmp2m_degC
ooi_array = [time,air_temp];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_tmp2m_degC_hourly_psd ooi_metbk_hourly 
clearvars -except timeh
%% 15

%% 16
load OOI_MTBLK_MATS/ooi_metbk_u5m
ooi_array = [time,u5m];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_u5m_hourly_psd ooi_metbk_hourly 
clearvars -except timeh
%% 16

%% 17
load OOI_MTBLK_MATS/ooi_metbk_v5m
ooi_array = [time,v5m];
ooi_metbk_hourly = process_OOI_met_hourly_2(ooi_array,timeh);
save OOI_MTBLK_MATS/ooi_metbk_v5m_hourly_psd ooi_metbk_hourly 
clearvars -except timeh
%% 17






toc()