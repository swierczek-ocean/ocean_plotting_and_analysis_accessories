clear
close all
clc
tic()

load CMIP6_CFLX *fgco2

A = [1:12:49;2:12:50;3:12:51;4:12:52;5:12:53;6:12:54;...
    7:12:55;8:12:56;9:12:57;10:12:58;11:12:59;12:12:60];

accesse_fgco2_clim = zeros(65,38,12);
bccc_fgco2_clim = zeros(66,36,12);
bcce_fgco2_clim = zeros(66,36,12);
can_fgco2_clim = zeros(65,47,12);
cesm_fgco2_clim = zeros(59,59,12);
cesw_fgco2_clim = zeros(59,59,12);
cesmfv_fgco2_clim = zeros(59,59,12);
ceswfv_fgco2_clim = zeros(59,59,12);
gfdlc_fgco2_clim = zeros(66,34,12);
gfdle_fgco2_clim = zeros(66,34,12);
gisscc_fgco2_clim = zeros(54,34,12);
inm4_fgco2_clim = zeros(66,34,12);
inm5_fgco2_clim = zeros(66,34,12);
ipsl_fgco2_clim = zeros(51,48,12);
miroc_fgco2_clim = zeros(66,43,12);
mpiham_fgco2_clim = zeros(256,220,12);
mpihr_fgco2_clim = zeros(802,404,12);
mpilr_fgco2_clim = zeros(256,220,12);
norc_fgco2_clim = zeros(59,59,12);
norelm_fgco2_clim = zeros(65,48,12);
noremm_fgco2_clim = zeros(65,48,12);
ukesm_fgco2_clim = zeros(43,50,12);


for ii=1:12
    accesse_fgco2_clim(:,:,ii) = mean(accesse_fgco2(:,:,A(ii,:)),3);
    bccc_fgco2_clim(:,:,ii) = mean(bccc_fgco2(:,:,A(ii,:)),3);
    bcce_fgco2_clim(:,:,ii) = mean(bcce_fgco2(:,:,A(ii,:)),3);
    can_fgco2_clim(:,:,ii) = mean(can_fgco2(:,:,A(ii,:)),3);
    cesm_fgco2_clim(:,:,ii) = mean(cesm_fgco2(:,:,A(ii,:)),3);
    cesw_fgco2_clim(:,:,ii) = mean(cesw_fgco2(:,:,A(ii,:)),3);
    cesmfv_fgco2_clim(:,:,ii) = mean(cesmfv_fgco2(:,:,A(ii,:)),3);
    ceswfv_fgco2_clim(:,:,ii) = mean(ceswfv_fgco2(:,:,A(ii,:)),3);
    gfdlc_fgco2_clim(:,:,ii) = mean(gfdlc_fgco2(:,:,A(ii,:)),3);
    gfdle_fgco2_clim(:,:,ii) = mean(gfdle_fgco2(:,:,A(ii,:)),3);
    gisscc_fgco2_clim(:,:,ii) = mean(gisscc_fgco2(:,:,A(ii,:)),3);
    inm4_fgco2_clim(:,:,ii) = mean(inm4_fgco2(:,:,A(ii,:)),3);
    inm5_fgco2_clim(:,:,ii) = mean(inm5_fgco2(:,:,A(ii,:)),3);
    ipsl_fgco2_clim(:,:,ii) = mean(ipsl_fgco2(:,:,A(ii,:)),3);
    miroc_fgco2_clim(:,:,ii) = mean(miroc_fgco2(:,:,A(ii,:)),3);
    mpiham_fgco2_clim(:,:,ii) = mean(mpiham_fgco2(:,:,A(ii,:)),3);
    mpihr_fgco2_clim(:,:,ii) = mean(mpihr_fgco2(:,:,A(ii,:)),3);
    mpilr_fgco2_clim(:,:,ii) = mean(mpilr_fgco2(:,:,A(ii,:)),3);
    norc_fgco2_clim(:,:,ii) = mean(norc_fgco2(:,:,A(ii,:)),3);
    norelm_fgco2_clim(:,:,ii) = mean(norelm_fgco2(:,:,A(ii,:)),3);
    noremm_fgco2_clim(:,:,ii) = mean(noremm_fgco2(:,:,A(ii,:)),3);
    ukesm_fgco2_clim(:,:,ii) = mean(ukesm_fgco2(:,:,A(ii,:)),3);
end

accesse_fgco2_clim(isnan(accesse_fgco2_clim)==1) = 0;
bccc_fgco2_clim(isnan(bccc_fgco2_clim)==1) = 0;
bcce_fgco2_clim(isnan(bcce_fgco2_clim)==1) = 0;
can_fgco2_clim(isnan(can_fgco2_clim)==1) = 0;
cesm_fgco2_clim(isnan(cesm_fgco2_clim)==1) = 0;
cesw_fgco2_clim(isnan(cesw_fgco2_clim)==1) = 0;
cesmfv_fgco2_clim(isnan(cesmfv_fgco2_clim)==1) = 0;
ceswfv_fgco2_clim(isnan(ceswfv_fgco2_clim)==1) = 0;
gfdlc_fgco2_clim(isnan(gfdlc_fgco2_clim)==1) = 0;
gfdle_fgco2_clim(isnan(gfdle_fgco2_clim)==1) = 0;
gisscc_fgco2_clim(isnan(gisscc_fgco2_clim)==1) = 0;
inm4_fgco2_clim(isnan(inm4_fgco2_clim)==1) = 0;
inm5_fgco2_clim(isnan(inm5_fgco2_clim)==1) = 0;
ipsl_fgco2_clim(isnan(ipsl_fgco2_clim)==1) = 0;
miroc_fgco2_clim(isnan(miroc_fgco2_clim)==1) = 0;
mpiham_fgco2_clim(isnan(mpiham_fgco2_clim)==1) = 0;
mpihr_fgco2_clim(isnan(mpihr_fgco2_clim)==1) = 0;
mpilr_fgco2_clim(isnan(mpilr_fgco2_clim)==1) = 0;
norc_fgco2_clim(isnan(norc_fgco2_clim)==1) = 0;
norelm_fgco2_clim(isnan(norelm_fgco2_clim)==1) = 0;
noremm_fgco2_clim(isnan(noremm_fgco2_clim)==1) = 0;
ukesm_fgco2_clim(isnan(ukesm_fgco2_clim)==1) = 0;


load CMIP6_CFLX *lat *lon

mpiham_fgco2_clim = reshape(mpiham_fgco2_clim,[56320,12]);
mpihr_fgco2_clim = reshape(mpihr_fgco2_clim,[324008,12]);
mpilr_fgco2_clim = reshape(mpilr_fgco2_clim,[56320,12]);

mpiham_lon = reshape(mpiham_lon,[56320,1]);
mpihr_lon = reshape(mpihr_lon,[324008,1]);
mpilr_lon = reshape(mpilr_lon,[56320,1]);

mpiham_lat = reshape(mpiham_lat,[56320,1]);
mpihr_lat = reshape(mpihr_lat,[324008,1]);
mpilr_lat = reshape(mpilr_lat,[56320,1]);

save CMIP6_CFLX_clim *lat *lon *clim

clear














toc()