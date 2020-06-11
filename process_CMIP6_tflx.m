clear
close all
clc
tic()

ncdisp('HEATFLX/hfds_Omon_UKESM1-0-LL_historical_r1i1p1f2_gn_195001-201412.nc')

str = 'HEATFLX/hfds_Omon_UKESM1-0-LL_historical_r1i1p1f2_gn_195001-201412.nc';

ukesm_lon = ncread(str,'longitude',[226,1],[43,1]) + 360;
ukesm_lat = ncread(str,'latitude',[1,92],[1,50]);
ukesm_hfds = ncread(str,'hfds',[226,92,721],[43,50,60]);

str = 'HEATFLX/hfds_Omon_HadGEM3-GC31-MM_historical_r1i1p1f3_gn_201001-201412.nc';

hadmm_lon = ncread(str,'longitude',[908,1],[165,1]) + 360;
hadmm_lat = ncread(str,'latitude',[1,370],[1,194]);
hadmm_hfds = ncread(str,'hfds',[908,370,1],[165,194,60]);

str = 'HEATFLX/hfds_Omon_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_195001-201412.nc';

hadll_lon = ncread(str,'longitude',[226,1],[42,1]) + 360;
hadll_lat = ncread(str,'latitude',[1,93],[1,49]);
hadll_hfds = ncread(str,'hfds',[226,93,721],[42,49,60]);

str = 'HEATFLX/hfds_Omon_CNRM-ESM2-1_historical_r1i1p1f2_gn_185001-201412.nc';

cnrme_lon = ncread(str,'lon',[218,1],[63,1]) + 360;
cnrme_lat = ncread(str,'lat',[1,57],[1,48]);
cnrme_hfds = ncread(str,'hfds',[218,57,1921],[63,48,60]);

str = 'HEATFLX/hfds_Omon_CNRM-CM6-1_historical_r1i1p1f2_gn_185001-201412.nc';

cnrmc_lon = ncread(str,'lon',[218,1],[63,1]) + 360;
cnrmc_lat = ncread(str,'lat',[1,57],[1,48]);
cnrmc_hfds = ncread(str,'hfds',[218,57,1921],[63,48,60]);

str = 'HEATFLX/hfds_Omon_ACCESS-CM2_historical_r1i1p1f1_gn_185001-201412.nc';

accessc_lon = ncread(str,'longitude',[209,1],[65,1]);
accessc_lat = ncread(str,'latitude',[1,42],[1,38]);
accessc_hfds = ncread(str,'hfds',[209,42,1921],[65,38,60]);

str = 'HEATFLX/hfds_Omon_ACCESS-ESM1-5_historical_r1i1p1f1_gn_185001-201412.nc';

accesse_lon = ncread(str,'longitude',[209,1],[65,1]);
accesse_lat = ncread(str,'latitude',[1,42],[1,38]);
accesse_hfds = ncread(str,'hfds',[209,42,1921],[65,38,60]);

str = 'HEATFLX/hfds_Omon_EC-Earth3_historical_r1i1p1f1_gn_201001-201012.nc';

ec_lon = ncread(str,'longitude',[218,1],[63,1]);
ec_lat = ncread(str,'latitude',[1,55],[1,48]);
ec_hfds1 = ncread(str,'hfds',[218,55,1],[63,48,12]);

str = 'HEATFLX/hfds_Omon_EC-Earth3_historical_r1i1p1f1_gn_201101-201112.nc';

ec_hfds2 = ncread(str,'hfds',[218,55,1],[63,48,12]);

str = 'HEATFLX/hfds_Omon_EC-Earth3_historical_r1i1p1f1_gn_201201-201212.nc';

ec_hfds3 = ncread(str,'hfds',[218,55,1],[63,48,12]);

str = 'HEATFLX/hfds_Omon_EC-Earth3_historical_r1i1p1f1_gn_201301-201312.nc';

ec_hfds4 = ncread(str,'hfds',[218,55,1],[63,48,12]);

str = 'HEATFLX/hfds_Omon_EC-Earth3_historical_r1i1p1f1_gn_201401-201412.nc';

ec_hfds5 = ncread(str,'hfds',[218,55,1],[63,48,12]);

ec_hfds = zeros(63,48,60);
ec_hfds(:,:,1:12) = ec_hfds1;
ec_hfds(:,:,13:24) = ec_hfds2;
ec_hfds(:,:,25:36) = ec_hfds3;
ec_hfds(:,:,37:48) = ec_hfds4;
ec_hfds(:,:,49:60) = ec_hfds5;

clear ec_hfds1 ec_hfds2 ec_hfds3 ec_hfds4 ec_hfds5

% ncdisp('HEATFLX/hfds_Omon_EC-Earth3-Veg_historical_r1i1p1f1_gn_201001-201012.nc')

str = 'HEATFLX/hfds_Omon_EC-Earth3-Veg_historical_r1i1p1f1_gn_201001-201012.nc';

ecv_lon = ncread(str,'longitude',[218,1],[63,1]);
ecv_lat = ncread(str,'latitude',[1,55],[1,48]);
ecv_hfds1 = ncread(str,'hfds',[218,55,1],[63,48,12]);

str = 'HEATFLX/hfds_Omon_EC-Earth3-Veg_historical_r1i1p1f1_gn_201101-201112.nc';

ecv_hfds2 = ncread(str,'hfds',[218,55,1],[63,48,12]);

str = 'HEATFLX/hfds_Omon_EC-Earth3-Veg_historical_r1i1p1f1_gn_201201-201212.nc';

ecv_hfds3 = ncread(str,'hfds',[218,55,1],[63,48,12]);

str = 'HEATFLX/hfds_Omon_EC-Earth3-Veg_historical_r1i1p1f1_gn_201301-201312.nc';

ecv_hfds4 = ncread(str,'hfds',[218,55,1],[63,48,12]);

str = 'HEATFLX/hfds_Omon_EC-Earth3-Veg_historical_r1i1p1f1_gn_201401-201412.nc';

ecv_hfds5 = ncread(str,'hfds',[218,55,1],[63,48,12]);

ecv_hfds = zeros(63,48,60);
ecv_hfds(:,:,1:12) = ecv_hfds1;
ecv_hfds(:,:,13:24) = ecv_hfds2;
ecv_hfds(:,:,25:36) = ecv_hfds3;
ecv_hfds(:,:,37:48) = ecv_hfds4;
ecv_hfds(:,:,49:60) = ecv_hfds5;

clear ecv_hfds1 ecv_hfds2 ecv_hfds3 ecv_hfds4 ecv_hfds5

str = 'HEATFLX/hfds_Omon_CAMS-CSM1-0_historical_r1i1p1f1_gn_185001-201412.nc';

cams_lon = ncread(str,'longitude',[209,1],[65,1]);
cams_lat = ncread(str,'latitude',[1,22],[1,32]);
cams_hfds = ncread(str,'hfds',[209,22,1921],[65,32,60]);

str = 'HEATFLX/hfds_Omon_CanESM5_historical_r1i1p1f1_gn_185001-201412.nc';

can_lon = ncread(str,'longitude',[216,1],[65,1]);
can_lat = ncread(str,'latitude',[1,55],[1,47]);
can_hfds = ncread(str,'hfds',[216,55,1921],[65,47,60]);

str = 'HEATFLX/hfds_Omon_CAS-ESM2-0_historical_r1i1p1f1_gn_185001-201412.nc';

cas_lon = ncread(str,'lon',289,66);
cas_lat = ncread(str,'lat',18,33);
cas_hfds = ncread(str,'hfds',[289,18,1921],[66,33,60]);

str = 'HEATFLX/hfds_Omon_CESM2-WACCM_historical_r1i1p1f1_gn_185001-201412.nc';

cesw_lon1 = ncread(str,'lon',[1,1],[30,1]);
cesw_lat = ncread(str,'lat',[1,36],[1,59]);
cesw_hfds1 = ncread(str,'hfds',[1,36,1921],[30,59,60]);
cesw_lon2 = ncread(str,'lon',[292,1],[29,1]);
cesw_hfds2 = ncread(str,'hfds',[292,36,1921],[29,59,60]);
cesw_lon = [cesw_lon2;cesw_lon1];
cesw_hfds = [cesw_hfds2;cesw_hfds1];
clear cesw_lon1 cesw_lon2 cesw_hfds1 cesw_hfds2

str = 'HEATFLX/hfds_Omon_CESM2_historical_r1i1p1f1_gn_185001-201412.nc';

cesm_lon1 = ncread(str,'lon',[1,1],[30,1]);
cesm_lat = ncread(str,'lat',[1,36],[1,59]);
cesm_hfds1 = ncread(str,'hfds',[1,36,1921],[30,59,60]);
cesm_lon2 = ncread(str,'lon',[292,1],[29,1]);
cesm_hfds2 = ncread(str,'hfds',[292,36,1921],[29,59,60]);
cesm_lon = [cesm_lon2;cesm_lon1];
cesm_hfds = [cesm_hfds2;cesm_hfds1];
clear cesm_lon1 cesm_lon2 cesm_hfds1 cesm_hfds2

str = 'HEATFLX/hfds_Omon_CIESM_historical_r1i1p1f1_gn_200001-201412.nc';

ciesm_lon1 = ncread(str,'longitude',[1,1],[30,1]);
ciesm_lat = ncread(str,'latitude',[1,36],[1,59]);
ciesm_hfds1 = ncread(str,'hfds',[1,36,121],[30,59,60]);
ciesm_lon2 = ncread(str,'longitude',[292,1],[29,1]);
ciesm_hfds2 = ncread(str,'hfds',[292,36,121],[29,59,60]);
ciesm_lon = [ciesm_lon2;ciesm_lon1];
ciesm_hfds = [ciesm_hfds2;ciesm_hfds1];
clear ciesm_lon1 ciesm_lon2 ciesm_hfds1 ciesm_hfds2

str = 'HEATFLX/hfds_Omon_E3SM-1-0_historical_r1i1p1f1_gr_201001-201412.nc';

e3sm_lon = ncread(str,'lon',289,65);
e3sm_lat = ncread(str,'lat',30,32);
e3sm_hfds = ncread(str,'hfds',[289,30,1],[65,32,60]);

str = 'HEATFLX/hfds_Omon_FIO-ESM-2-0_historical_r1i1p1f1_gn_185001-201412.nc';

fio_lon1 = ncread(str,'longitude',[1,1],[30,1]);
fio_lat = ncread(str,'latitude',[1,36],[1,59]);
fio_hfds1 = ncread(str,'hfds',[1,36,1921],[30,59,60]);
fio_lon2 = ncread(str,'longitude',[292,1],[29,1]);
fio_hfds2 = ncread(str,'hfds',[292,36,1921],[29,59,60]);
fio_lon = [fio_lon2;fio_lon1];
fio_hfds = [fio_hfds2;fio_hfds1];
clear fio_lon1 fio_lon2 fio_hfds1 fio_hfds2

str = 'HEATFLX/hfds_Omon_GFDL-CM4_historical_r1i1p1f1_gn_201001-201412.nc';

gfdlc_lon = ncread(str,'lon',[911,1],[258,1]) + 360;
gfdlc_lat = ncread(str,'lat',[1,195],[1,188]);
gfdlc_hfds = ncread(str,'hfds',[911,195,1],[258,188,60]);

str = 'HEATFLX/hfds_Omon_GFDL-ESM4_historical_r1i1p1f1_gn_201001-201412.nc';

gfdle_lon = ncread(str,'lon',[457,1],[130,1]) + 360;
gfdle_lat = ncread(str,'lat',[1,88],[1,94]);
gfdle_hfds = ncread(str,'hfds',[457,88,1],[130,94,60]);

str = 'HEATFLX/hfds_Omon_GISS-E2-1-G-CC_historical_r1i1p1f1_gn_200101-201412.nc';

gisscc_lon = ncread(str,'lon',116,27);
gisscc_lat = ncread(str,'lat',15,17)';
gisscc_hfds = ncread(str,'hfds',[116,15,109],[27,17,60]);

str = 'HEATFLX/hfds_Omon_GISS-E2-1-G_historical_r1i1p1f1_gn_200101-201412.nc';

gissg_lon = ncread(str,'lon',116,27);
gissg_lat = ncread(str,'lat',15,17)';
gissg_hfds = ncread(str,'hfds',[116,15,109],[27,17,60]);

str = 'HEATFLX/hfds_Omon_GISS-E2-1-H_historical_r1i1p1f1_gn_200101-201412.nc';

gissh_lon = ncread(str,'lon',116,27);
gissh_lat = ncread(str,'lat',15,17)';
gissh_hfds = ncread(str,'hfds',[116,15,109],[27,17,60]);

str = 'HEATFLX/hfds_Omon_IPSL-CM6A-LR_historical_r1i1p1f1_gn_185001-201412.nc';

ipsl_lon = ncread(str,'nav_lon',[217,1],[51,1]) + 360;
ipsl_lat = ncread(str,'nav_lat',[1,95],[1,48]);
ipsl_hfds = ncread(str,'hfds',[217,95,1921],[51,48,60]);

str = 'HEATFLX/hfds_Omon_MCM-UA-1-0_historical_r1i1p1f1_gn_185001-201412.nc';

mcm_lon = ncread(str,'longitude',155,36);
mcm_lat = ncread(str,'latitude',13,16)';
mcm_hfds = ncread(str,'hfds',[155,13,1921],[36,16,60]);

str = 'HEATFLX/hfds_Omon_MPI-ESM-1-2-HAM_historical_r1i1p1f1_gn_201001-201412.nc';

mpiham_lon = ncread(str,'longitude');
mpiham_lat = ncread(str,'latitude');
mpiham_hfds = ncread(str,'hfds');

str = 'HEATFLX/hfds_Omon_MPI-ESM1-2-HR_historical_r1i1p1f1_gn_201001-201412.nc';

mpihr_lon = ncread(str,'longitude');
mpihr_lat = ncread(str,'latitude');
mpihr_hfds = ncread(str,'hfds');

str = 'HEATFLX/hfds_Omon_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_201001-201412.nc';

mpilr_lon = ncread(str,'longitude');
mpilr_lat = ncread(str,'latitude');
mpilr_hfds = ncread(str,'hfds');

str = 'HEATFLX/hfds_Omon_NESM3_historical_r1i1p1f1_gn_185001-201412.nc';

nesm_lon = ncread(str,'longitude',[217,1],[65,1]) + 360;
nesm_lat = ncread(str,'latitude',[1,55],[1,47]);
nesm_hfds = ncread(str,'hfds',[217,55,1921],[65,47,60]);

str = 'HEATFLX/hfds_Omon_NorCPM1_historical_r1i1p1f1_gn_185001-201412.nc';

norc_lon1 = ncread(str,'longitude',[1,1],[30,1]);
norc_lat = ncread(str,'latitude',[1,36],[1,59]);
norc_hfds1 = ncread(str,'hfds',[1,36,1921],[30,59,60]);
norc_lon2 = ncread(str,'longitude',[292,1],[29,1]);
norc_hfds2 = ncread(str,'hfds',[292,36,1921],[29,59,60]);
norc_lon = [norc_lon2;norc_lon1];
norc_hfds = [norc_hfds2;norc_hfds1];
clear norc_lon1 norc_lon2 norc_hfds1 norc_hfds2

str = 'HEATFLX/hfds_Omon_NorESM2-LM_historical_r1i1p1f1_gn_201001-201412.nc';

norelm_lon = ncread(str,'longitude',[39,1],[65,1]);
norelm_lat = ncread(str,'latitude',[1,64],[1,48]);
norelm_hfds = ncread(str,'hfds',[39,64,1],[65,48,60]);

str = 'HEATFLX/hfds_Omon_NorESM2-MM_historical_r1i1p1f1_gn_201001-201412.nc';

noremm_lon = ncread(str,'longitude',[39,1],[65,1]);
noremm_lat = ncread(str,'latitude',[1,64],[1,48]);
noremm_hfds = ncread(str,'hfds',[39,64,1],[65,48,60]);

str = 'HEATFLX/hfds_Omon_SAM0-UNICON_historical_r1i1p1f1_gn_201001-201412.nc';

samo_lon1 = ncread(str,'longitude',[1,1],[30,1]);
samo_lat = ncread(str,'latitude',[1,36],[1,59]);
samo_hfds1 = ncread(str,'hfds',[1,36,1],[30,59,60]);
samo_lon2 = ncread(str,'longitude',[292,1],[29,1]);
samo_hfds2 = ncread(str,'hfds',[292,36,1],[29,59,60]);
samo_lon = [samo_lon2;samo_lon1];
samo_hfds = [samo_hfds2;samo_hfds1];
clear samo_lon1 samo_lon2 samo_hfds1 samo_hfds2

str = 'HEATFLX/hfds_Omon_FGOALS-f3-L_historical_r1i1p1f1_gn_185001-201412.nc';

fgoalsf_lon = ncread(str,'longitude');
fgoalsf_lat = ncread(str,'latitude');
fgoalsf_hfds = ncread(str,'hfds',[1,1,1921],[360,218,60]);

str = 'HEATFLX/hfds_Omon_FGOALS-g3_historical_r1i1p1f1_gn_185001-201412.nc';

fgoalsg_lon = ncread(str,'longitude');
fgoalsg_lat = ncread(str,'latitude');
fgoalsg_hfds = ncread(str,'hfds',[1,1,1921],[360,218,60]);

str = 'HEATFLX/hfds_Omon_AWI-ESM-1-1-LR_historical_r1i1p1f1_gn_200101-201012.nc';

awie_lon = ncread(str,'lon');
for ii=1:126859
    if awie_lon(ii)<0
        awie_lon(ii) = awie_lon(ii) + 360;
    end
end
awie_lat = ncread(str,'lat');
awie1_hfds = ncread(str,'hfds',[1,109],[126859,12]);

str = 'HEATFLX/hfds_Omon_AWI-ESM-1-1-LR_historical_r1i1p1f1_gn_201101-201412.nc';

awie2_hfds = ncread(str,'hfds',[1,1],[126859,48]);
awie_hfds = [awie1_hfds,awie2_hfds];
clear awie1_hfds awie2_hfds

str = 'HEATFLX/hfds_Omon_AWI-CM-1-1-MR_historical_r1i1p1f1_gn_200101-201012.nc';

awic_lon = ncread(str,'lon');
for ii=1:830305
    if awic_lon(ii)<0
        awic_lon(ii) = awic_lon(ii) + 360;
    end
end
awic_lat = ncread(str,'lat');
awic1_hfds = ncread(str,'hfds',[1,109],[830305,12]);

str = 'HEATFLX/hfds_Omon_AWI-CM-1-1-MR_historical_r1i1p1f1_gn_201101-201412.nc';

awic2_hfds = ncread(str,'hfds',[1,1],[830305,48]);
awic_hfds = [awic1_hfds,awic2_hfds];
clear awic1_hfds awic2_hfds

clear str

save CMIP6_TFLX


toc()