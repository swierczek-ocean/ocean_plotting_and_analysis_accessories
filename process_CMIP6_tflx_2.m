clear
close all
clc
tic()

load CMIP6_TFLX *hfds

A = [1:12:49;2:12:50;3:12:51;4:12:52;5:12:53;6:12:54;...
    7:12:55;8:12:56;9:12:57;10:12:58;11:12:59;12:12:60];

accessc_hfds_clim = zeros(65,38,12);
accesse_hfds_clim = zeros(65,38,12);
awic_hfds_clim = zeros(830305,12);
awie_hfds_clim = zeros(126859,12);
cams_hfds_clim = zeros(65,32,12);
can_hfds_clim = zeros(65,47,12);
cas_hfds_clim = zeros(66,33,12);
cesm_hfds_clim = zeros(59,59,12);
cesw_hfds_clim = zeros(59,59,12);
ciesm_hfds_clim = zeros(59,59,12);
cnrmc_hfds_clim = zeros(63,48,12);
cnrme_hfds_clim = zeros(63,48,12);
e3sm_hfds_clim = zeros(65,32,12);
ec_hfds_clim = zeros(63,48,12);
ecv_hfds_clim = zeros(63,48,12);
fgoalsf_hfds_clim = zeros(360,218,12);
fgoalsg_hfds_clim = zeros(360,218,12);
fio_hfds_clim = zeros(59,59,12);
gfdlc_hfds_clim = zeros(258,188,12);
gfdle_hfds_clim = zeros(130,94,12);
gisscc_hfds_clim = zeros(27,17,12);
gissg_hfds_clim = zeros(27,17,12);
gissh_hfds_clim = zeros(27,17,12);
hadll_hfds_clim = zeros(42,49,12);
hadmm_hfds_clim = zeros(165,194,12);
ipsl_hfds_clim = zeros(51,48,12);
mcm_hfds_clim = zeros(36,16,12);
mpiham_hfds_clim = zeros(256,220,12);
mpihr_hfds_clim = zeros(802,404,12);
mpilr_hfds_clim = zeros(256,220,12);
nesm_hfds_clim = zeros(65,47,12);
norc_hfds_clim = zeros(59,59,12);
norelm_hfds_clim = zeros(65,48,12);
noremm_hfds_clim = zeros(65,48,12);
samo_hfds_clim = zeros(59,59,12);
ukesm_hfds_clim = zeros(43,50,12);


for ii=1:12
    accessc_hfds_clim(:,:,ii) = mean(accessc_hfds(:,:,A(ii,:)),3);
    accesse_hfds_clim(:,:,ii) = mean(accesse_hfds(:,:,A(ii,:)),3);
    awic_hfds_clim(:,ii) = mean(awic_hfds(:,A(ii,:)),2);
    awie_hfds_clim(:,ii) = mean(awie_hfds(:,A(ii,:)),2);
    cams_hfds_clim(:,:,ii) = mean(cams_hfds(:,:,A(ii,:)),3);
    can_hfds_clim(:,:,ii) = mean(can_hfds(:,:,A(ii,:)),3);
    cas_hfds_clim(:,:,ii) = mean(cas_hfds(:,:,A(ii,:)),3);
    cesm_hfds_clim(:,:,ii) = mean(cesm_hfds(:,:,A(ii,:)),3);
    cesw_hfds_clim(:,:,ii) = mean(cesw_hfds(:,:,A(ii,:)),3);
    ciesm_hfds_clim(:,:,ii) = mean(ciesm_hfds(:,:,A(ii,:)),3);
    cnrmc_hfds_clim(:,:,ii) = mean(cnrmc_hfds(:,:,A(ii,:)),3);
    cnrme_hfds_clim(:,:,ii) = mean(cnrme_hfds(:,:,A(ii,:)),3);
    e3sm_hfds_clim(:,:,ii) = mean(e3sm_hfds(:,:,A(ii,:)),3);
    ec_hfds_clim(:,:,ii) = mean(ec_hfds(:,:,A(ii,:)),3);
    ecv_hfds_clim(:,:,ii) = mean(ecv_hfds(:,:,A(ii,:)),3);
    fgoalsf_hfds_clim(:,:,ii) = mean(fgoalsf_hfds(:,:,A(ii,:)),3);
    fgoalsg_hfds_clim(:,:,ii) = mean(fgoalsg_hfds(:,:,A(ii,:)),3);
    fio_hfds_clim(:,:,ii) = mean(fio_hfds(:,:,A(ii,:)),3);
    gfdlc_hfds_clim(:,:,ii) = mean(gfdlc_hfds(:,:,A(ii,:)),3);
    gfdle_hfds_clim(:,:,ii) = mean(gfdle_hfds(:,:,A(ii,:)),3);
    gisscc_hfds_clim(:,:,ii) = mean(gisscc_hfds(:,:,A(ii,:)),3);
    gissg_hfds_clim(:,:,ii) = mean(gissg_hfds(:,:,A(ii,:)),3);
    gissh_hfds_clim(:,:,ii) = mean(gissh_hfds(:,:,A(ii,:)),3);
    hadll_hfds_clim(:,:,ii) = mean(hadll_hfds(:,:,A(ii,:)),3);
    hadmm_hfds_clim(:,:,ii) = mean(hadmm_hfds(:,:,A(ii,:)),3);
    e3sm_hfds_clim(:,:,ii) = mean(e3sm_hfds(:,:,A(ii,:)),3);
    ipsl_hfds_clim(:,:,ii) = mean(ipsl_hfds(:,:,A(ii,:)),3);
    mcm_hfds_clim(:,:,ii) = mean(mcm_hfds(:,:,A(ii,:)),3);
    mpiham_hfds_clim(:,:,ii) = mean(mpiham_hfds(:,:,A(ii,:)),3);
    mpihr_hfds_clim(:,:,ii) = mean(mpihr_hfds(:,:,A(ii,:)),3);
    mpilr_hfds_clim(:,:,ii) = mean(mpilr_hfds(:,:,A(ii,:)),3);
    nesm_hfds_clim(:,:,ii) = mean(nesm_hfds(:,:,A(ii,:)),3);
    norc_hfds_clim(:,:,ii) = mean(norc_hfds(:,:,A(ii,:)),3);
    norelm_hfds_clim(:,:,ii) = mean(norelm_hfds(:,:,A(ii,:)),3);
    noremm_hfds_clim(:,:,ii) = mean(noremm_hfds(:,:,A(ii,:)),3);
    samo_hfds_clim(:,:,ii) = mean(samo_hfds(:,:,A(ii,:)),3);
    ukesm_hfds_clim(:,:,ii) = mean(ukesm_hfds(:,:,A(ii,:)),3);
end

accessc_hfds_clim(isnan(accessc_hfds_clim)==1) = 0;
accesse_hfds_clim(isnan(accesse_hfds_clim)==1) = 0;
awic_hfds_clim(isnan(awic_hfds_clim)==1) = 0;
awie_hfds_clim(isnan(awie_hfds_clim)==1) = 0;
cams_hfds_clim(isnan(cams_hfds_clim)==1) = 0;
can_hfds_clim(isnan(can_hfds_clim)==1) = 0;
cas_hfds_clim(isnan(cas_hfds_clim)==1) = 0;
cesm_hfds_clim(isnan(cesm_hfds_clim)==1) = 0;
cesw_hfds_clim(isnan(cesw_hfds_clim)==1) = 0;
ciesm_hfds_clim(isnan(ciesm_hfds_clim)==1) = 0;
cnrmc_hfds_clim(isnan(cnrmc_hfds_clim)==1) = 0;
cnrme_hfds_clim(isnan(cnrme_hfds_clim)==1) = 0;
e3sm_hfds_clim(isnan(e3sm_hfds_clim)==1) = 0;
ec_hfds_clim(isnan(ec_hfds_clim)==1) = 0;
ecv_hfds_clim(isnan(ecv_hfds_clim)==1) = 0;
fgoalsf_hfds_clim(isnan(fgoalsf_hfds_clim)==1) = 0;
fgoalsg_hfds_clim(isnan(fgoalsg_hfds_clim)==1) = 0;
fio_hfds_clim(isnan(fio_hfds_clim)==1) = 0;
gfdlc_hfds_clim(isnan(gfdlc_hfds_clim)==1) = 0;
gfdle_hfds_clim(isnan(gfdle_hfds_clim)==1) = 0;
gisscc_hfds_clim(isnan(gisscc_hfds_clim)==1) = 0;
gissg_hfds_clim(isnan(gissg_hfds_clim)==1) = 0;
gissh_hfds_clim(isnan(gissh_hfds_clim)==1) = 0;
hadll_hfds_clim(isnan(hadll_hfds_clim)==1) = 0;
hadmm_hfds_clim(isnan(hadmm_hfds_clim)==1) = 0;
ipsl_hfds_clim(isnan(ipsl_hfds_clim)==1) = 0;
mcm_hfds_clim(isnan(mcm_hfds_clim)==1) = 0;
mpiham_hfds_clim(isnan(mpiham_hfds_clim)==1) = 0;
mpihr_hfds_clim(isnan(mpihr_hfds_clim)==1) = 0;
mpilr_hfds_clim(isnan(mpilr_hfds_clim)==1) = 0;
nesm_hfds_clim(isnan(nesm_hfds_clim)==1) = 0;
norc_hfds_clim(isnan(norc_hfds_clim)==1) = 0;
norelm_hfds_clim(isnan(norelm_hfds_clim)==1) = 0;
noremm_hfds_clim(isnan(noremm_hfds_clim)==1) = 0;
samo_hfds_clim(isnan(samo_hfds_clim)==1) = 0;
ukesm_hfds_clim(isnan(ukesm_hfds_clim)==1) = 0;


load CMIP6_TFLX *lat *lon

fgoalsf_hfds_clim = reshape(fgoalsf_hfds_clim,[78480,12]);
fgoalsg_hfds_clim = reshape(fgoalsg_hfds_clim,[78480,12]);
mpiham_hfds_clim = reshape(mpiham_hfds_clim,[56320,12]);
mpihr_hfds_clim = reshape(mpihr_hfds_clim,[324008,12]);
mpilr_hfds_clim = reshape(mpilr_hfds_clim,[56320,12]);

fgoalsf_lon = reshape(fgoalsf_lon,[78480,1]);
fgoalsg_lon = reshape(fgoalsg_lon,[78480,1]);
mpiham_lon = reshape(mpiham_lon,[56320,1]);
mpihr_lon = reshape(mpihr_lon,[324008,1]);
mpilr_lon = reshape(mpilr_lon,[56320,1]);

fgoalsf_lat = reshape(fgoalsf_lat,[78480,1]);
fgoalsg_lat = reshape(fgoalsg_lat,[78480,1]);
mpiham_lat = reshape(mpiham_lat,[56320,1]);
mpihr_lat = reshape(mpihr_lat,[324008,1]);
mpilr_lat = reshape(mpilr_lat,[56320,1]);


save CMIP6_TFLX_clim *lat *lon *clim

clear














toc()