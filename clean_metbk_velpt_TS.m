clear
close all
clc
tic()

load OOI_MTBLK_MATS/OOI_METBK

time = 736038:(1/24):737075;
time = time';

OOI_METBK_hourly = process_OOI_met_hourly(OOI_METBK,time);

save OOI_MTBLK_MATS/OOI_METBK_hourly OOI_METBK_hourly str_key_metbk

load OOI_MTBLK_MATS/VELPT_12m

time = 736282:(1/24):736779;
time = time';

VELPT_12m_hourly = process_OOI_met_hourly(VELPT_12m,time);

save OOI_MTBLK_MATS/VELPT_12m_hourly VELPT_12m_hourly str_velpt



toc()