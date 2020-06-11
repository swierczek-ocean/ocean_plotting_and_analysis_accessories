clear
close all
clc
tic()

% ncdisp('CO2FLX/fgco2_Omon_MIROC-ES2L_historical_r1i1p1f2_gn_185001-201412.nc')

str = 'CO2FLX/fgco2_Omon_MIROC-ES2L_historical_r1i1p1f2_gn_185001-201412.nc';

miroc_lon = ncread(str,'longitude',[228,1],[66,1]);
miroc_lat = ncread(str,'latitude',[1,49],[1,43]);
miroc_fgco2 = ncread(str,'fgco2',[228,49,1921],[66,43,60]);

str = 'CO2FLX/fgco2_Omon_INM-CM5-0_historical_r1i1p1f1_gr1_200001-201412.nc';

inm5_lon = ncread(str,'lon',288,66);
inm5_lat = ncread(str,'lat',29,34);
inm5_fgco2 = ncread(str,'fgco2',[288,29,121],[66,34,60]);

str = 'CO2FLX/fgco2_Omon_INM-CM4-8_historical_r1i1p1f1_gr1_200001-201412.nc';

inm4_lon = ncread(str,'lon',288,66);
inm4_lat = ncread(str,'lat',29,34);
inm4_fgco2 = ncread(str,'fgco2',[288,29,121],[66,34,60]);

str = 'CO2FLX/fgco2_Omon_BCC-ESM1_historical_r1i1p1f1_gn_185001-201412.nc';

bcce_lon = ncread(str,'longitude',[288,1],[66,1]) + 360;
bcce_lat = ncread(str,'latitude',[1,20],[1,36]);
bcce_fgco2 = ncread(str,'fgco2',[288,20,1921],[66,36,60]);

str = 'CO2FLX/fgco2_Omon_BCC-CSM2-MR_historical_r1i1p1f1_gn_185001-201412.nc';

bccc_lon = ncread(str,'longitude',[288,1],[66,1]) + 360;
bccc_lat = ncread(str,'latitude',[1,20],[1,36]);
bccc_fgco2 = ncread(str,'fgco2',[288,20,1921],[66,36,60]);

str = 'CO2FLX/fgco2_Omon_UKESM1-0-LL_historical_r1i1p1f2_gn_195001-201412.nc';

ukesm_lon = ncread(str,'longitude',[226,1],[43,1]) + 360;
ukesm_lat = ncread(str,'latitude',[1,92],[1,50]);
ukesm_fgco2 = ncread(str,'fgco2',[226,92,721],[43,50,60]);

str = 'CO2FLX/fgco2_Omon_ACCESS-ESM1-5_historical_r1i1p1f1_gn_185001-201412.nc';

accesse_lon = ncread(str,'longitude',[209,1],[65,1]);
accesse_lat = ncread(str,'latitude',[1,42],[1,38]);
accesse_fgco2 = ncread(str,'fgco2',[209,42,1921],[65,38,60]);

str = 'CO2FLX/fgco2_Omon_CanESM5_historical_r1i1p1f1_gn_185001-201412.nc';

can_lon = ncread(str,'longitude',[216,1],[65,1]);
can_lat = ncread(str,'latitude',[1,55],[1,47]);
can_fgco2 = ncread(str,'fgco2',[216,55,1921],[65,47,60]);

str = 'CO2FLX/fgco2_Omon_CESM2-WACCM_historical_r1i1p1f1_gn_185001-201412.nc';

cesw_lon1 = ncread(str,'lon',[1,1],[30,1]);
cesw_lat = ncread(str,'lat',[1,36],[1,59]);
cesw_fgco21 = ncread(str,'fgco2',[1,36,1921],[30,59,60]);
cesw_lon2 = ncread(str,'lon',[292,1],[29,1]);
cesw_fgco22 = ncread(str,'fgco2',[292,36,1921],[29,59,60]);
cesw_lon = [cesw_lon2;cesw_lon1];
cesw_fgco2 = [cesw_fgco22;cesw_fgco21];
clear cesw_lon1 cesw_lon2 cesw_fgco21 cesw_fgco22

str = 'CO2FLX/fgco2_Omon_CESM2_historical_r1i1p1f1_gn_185001-201412.nc';

cesm_lon1 = ncread(str,'lon',[1,1],[30,1]);
cesm_lat = ncread(str,'lat',[1,36],[1,59]);
cesm_fgco21 = ncread(str,'fgco2',[1,36,1921],[30,59,60]);
cesm_lon2 = ncread(str,'lon',[292,1],[29,1]);
cesm_fgco22 = ncread(str,'fgco2',[292,36,1921],[29,59,60]);
cesm_lon = [cesm_lon2;cesm_lon1];
cesm_fgco2 = [cesm_fgco22;cesm_fgco21];
clear cesm_lon1 cesm_lon2 cesm_fgco21 cesm_fgco22

str = 'CO2FLX/fgco2_Omon_CESM2-WACCM-FV2_historical_r1i1p1f1_gn_200001-201412.nc';

ceswfv_lon1 = ncread(str,'lon',[1,1],[30,1]);
ceswfv_lat = ncread(str,'lat',[1,36],[1,59]);
ceswfv_fgco21 = ncread(str,'fgco2',[1,36,121],[30,59,60]);
ceswfv_lon2 = ncread(str,'lon',[292,1],[29,1]);
ceswfv_fgco22 = ncread(str,'fgco2',[292,36,121],[29,59,60]);
ceswfv_lon = [ceswfv_lon2;ceswfv_lon1];
ceswfv_fgco2 = [ceswfv_fgco22;ceswfv_fgco21];
clear ceswfv_lon1 ceswfv_lon2 ceswfv_fgco21 ceswfv_fgco22

str = 'CO2FLX/fgco2_Omon_CESM2-FV2_historical_r1i1p1f1_gn_200001-201412.nc';

cesmfv_lon1 = ncread(str,'lon',[1,1],[30,1]);
cesmfv_lat = ncread(str,'lat',[1,36],[1,59]);
cesmfv_fgco21 = ncread(str,'fgco2',[1,36,121],[30,59,60]);
cesmfv_lon2 = ncread(str,'lon',[292,1],[29,1]);
cesmfv_fgco22 = ncread(str,'fgco2',[292,36,121],[29,59,60]);
cesmfv_lon = [cesmfv_lon2;cesmfv_lon1];
cesmfv_fgco2 = [cesmfv_fgco22;cesmfv_fgco21];
cesmfv_lon(57:59) = cesm_lon(57:59);
clear cesmfv_lon1 cesmfv_lon2 cesmfv_fgco21 cesmfv_fgco22

str = 'CO2FLX/fgco2_Omon_GFDL-CM4_historical_r1i1p1f1_gr_201001-201412.nc';

gfdlc_lon = ncread(str,'lon',288,66);
gfdlc_lat = ncread(str,'lat',29,34);
gfdlc_fgco2 = ncread(str,'fgco2',[288,29,1],[66,34,60]);

str = 'CO2FLX/fgco2_Omon_GFDL-ESM4_historical_r1i1p1f1_gr_201001-201412.nc';

gfdle_lon = ncread(str,'lon',288,66);
gfdle_lat = ncread(str,'lat',29,34);
gfdle_fgco2 = ncread(str,'fgco2',[288,29,1],[66,34,60]);

str = 'CO2FLX/fgco2_Omon_GISS-E2-1-G-CC_historical_r1i1p1f1_gn_200101-201412.nc';

gisscc_lon = ncread(str,'lon',231,54);
gisscc_lat = ncread(str,'lat',30,34)';
gisscc_fgco2 = ncread(str,'fgco2',[231,30,109],[54,34,60]);

str = 'CO2FLX/fgco2_Omon_IPSL-CM6A-LR_historical_r1i1p1f1_gn_185001-201412.nc';

ipsl_lon = ncread(str,'nav_lon',[217,1],[51,1]) + 360;
ipsl_lat = ncread(str,'nav_lat',[1,95],[1,48]);
ipsl_fgco2 = ncread(str,'fgco2',[217,95,1921],[51,48,60]);

str = 'CO2FLX/fgco2_Omon_MPI-ESM-1-2-HAM_historical_r1i1p1f1_gn_201001-201412.nc';

mpiham_lon = ncread(str,'longitude');
mpiham_lat = ncread(str,'latitude');
mpiham_fgco2 = ncread(str,'fgco2');

str = 'CO2FLX/fgco2_Omon_MPI-ESM1-2-HR_historical_r1i1p1f1_gn_201001-201412.nc';

mpihr_lon = ncread(str,'longitude');
mpihr_lat = ncread(str,'latitude');
mpihr_fgco2 = ncread(str,'fgco2');

str = 'CO2FLX/fgco2_Omon_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_201001-201412.nc';

mpilr_lon = ncread(str,'longitude');
mpilr_lat = ncread(str,'latitude');
mpilr_fgco2 = ncread(str,'fgco2');

str = 'CO2FLX/fgco2_Omon_NorCPM1_historical_r1i1p1f1_gn_185001-201412.nc';

norc_lon1 = ncread(str,'longitude',[1,1],[30,1]);
norc_lat = ncread(str,'latitude',[1,36],[1,59]);
norc_fgco21 = ncread(str,'fgco2',[1,36,1921],[30,59,60]);
norc_lon2 = ncread(str,'longitude',[292,1],[29,1]);
norc_fgco22 = ncread(str,'fgco2',[292,36,1921],[29,59,60]);
norc_lon = [norc_lon2;norc_lon1];
norc_fgco2 = [norc_fgco22;norc_fgco21];
clear norc_lon1 norc_lon2 norc_fgco21 norc_fgco22

str = 'CO2FLX/fgco2_Omon_NorESM2-LM_historical_r1i1p1f1_gn_201001-201412.nc';

norelm_lon = ncread(str,'longitude',[39,1],[65,1]);
norelm_lat = ncread(str,'latitude',[1,64],[1,48]);
norelm_fgco2 = ncread(str,'fgco2',[39,64,1],[65,48,60]);

str = 'CO2FLX/fgco2_Omon_NorESM2-MM_historical_r1i1p1f1_gn_201001-201412.nc';

noremm_lon = ncread(str,'longitude',[39,1],[65,1]);
noremm_lat = ncread(str,'latitude',[1,64],[1,48]);
noremm_fgco2 = ncread(str,'fgco2',[39,64,1],[65,48,60]);


clear str

save CMIP6_CFLX


toc()