clear
close all
clc
tic()

%% interpolate 

XC = rdmds('../Grids/12/XC');
YC = rdmds('../Grids/12/YC');


RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

x = 17:676;
y = 106:467;
z = 1:104; 

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
mask = ones(nx,ny);

for ii=1:nx
    for jj=1:ny
        if hFacC(ii,jj,1)>0
            mask(ii,jj) = 1;
        end
        if hFacC(ii,jj,85)<1
            mask(ii,jj) = 0;
        end
    end
end

areaTop = mask.*RAC(x,y);
areaBox = sum(areaTop,[1,2]);

accessc_hfds_m = zeros(12,2);
accesse_hfds_m = zeros(12,2);
awic_hfds_m = zeros(12,2);
awie_hfds_m = zeros(12,2);
cams_hfds_m = zeros(12,2);
can_hfds_m = zeros(12,2);
cas_hfds_m = zeros(12,2);
cesm_hfds_m = zeros(12,2);
cesw_hfds_m = zeros(12,2);
ciesm_hfds_m = zeros(12,2);
cnrmc_hfds_m = zeros(12,2);
cnrme_hfds_m = zeros(12,2);
e3sm_hfds_m = zeros(12,2);
ec_hfds_m = zeros(12,2);
ecv_hfds_m = zeros(12,2);
fio_hfds_m = zeros(12,2);
fgoalsf_hfds_m = zeros(12,2);
fgoalsg_hfds_m = zeros(12,2);
gfdlc_hfds_m = zeros(12,2);
gfdle_hfds_m = zeros(12,2);
gisscc_hfds_m = zeros(12,2);
gissg_hfds_m = zeros(12,2);
gissh_hfds_m = zeros(12,2);
hadll_hfds_m = zeros(12,2);
hadmm_hfds_m = zeros(12,2);
ipsl_hfds_m = zeros(12,2);
mcm_hfds_m = zeros(12,2);
mpiham_hfds_m = zeros(12,2);
mpihr_hfds_m = zeros(12,2);
mpilr_hfds_m = zeros(12,2);
nesm_hfds_m = zeros(12,2);
norc_hfds_m = zeros(12,2);
norelm_hfds_m = zeros(12,2);
noremm_hfds_m = zeros(12,2);
samo_hfds_m = zeros(12,2);
ukesm_hfds_m = zeros(12,2);


for ii=1:12
    load CMIP6_TFLX_clim fgoalsf*
    F = scatteredInterpolant(fgoalsf_lon,fgoalsf_lat,...
        fgoalsf_hfds_clim(:,ii),'linear');
    temp = F(XC,YC);
    fgoalsf_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    fgoalsf_hfds_m(ii,2) = fgoalsf_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim fgoalsg*
    F = scatteredInterpolant(fgoalsg_lon,fgoalsg_lat,...
        fgoalsg_hfds_clim(:,ii),'linear');
    temp = F(XC,YC);
    fgoalsg_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    fgoalsg_hfds_m(ii,2) = fgoalsg_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim awic*
    F = scatteredInterpolant(awic_lon,awic_lat,...
        awic_hfds_clim(:,ii),'linear');
    temp = F(XC,YC);
    awic_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    awic_hfds_m(ii,2) = awic_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim awie*
    F = scatteredInterpolant(awie_lon,awie_lat,...
        awie_hfds_clim(:,ii),'linear');
    temp = F(XC,YC);
    awie_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    awie_hfds_m(ii,2) = awie_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim mpiham*
    F = scatteredInterpolant(mpiham_lon,mpiham_lat,...
        mpiham_hfds_clim(:,ii),'linear');
    temp = F(XC,YC);
    mpiham_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    mpiham_hfds_m(ii,2) = mpiham_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim mpihr*
    F = scatteredInterpolant(mpihr_lon,mpihr_lat,...
        mpihr_hfds_clim(:,ii),'linear');
    temp = F(XC,YC);
    mpihr_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    mpihr_hfds_m(ii,2) = mpihr_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim mpilr*
    F = scatteredInterpolant(mpilr_lon,mpilr_lat,...
        mpilr_hfds_clim(:,ii),'linear');
    temp = F(XC,YC);
    mpilr_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    mpilr_hfds_m(ii,2) = mpilr_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
end





for ii=1:12
    load CMIP6_TFLX_clim cnrmc*
    [X,Y] = ndgrid(cnrmc_lon,cnrmc_lat);
    F = griddedInterpolant(X,Y,cnrmc_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cnrmc_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cnrmc_hfds_m(ii,2) = cnrmc_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim cnrme*
    [X,Y] = ndgrid(cnrme_lon,cnrme_lat);
    F = griddedInterpolant(X,Y,cnrme_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cnrme_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cnrme_hfds_m(ii,2) = cnrme_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim hadll*
    [X,Y] = ndgrid(hadll_lon,hadll_lat);
    F = griddedInterpolant(X,Y,hadll_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    hadll_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    hadll_hfds_m(ii,2) = hadll_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim hadmm*
    [X,Y] = ndgrid(hadmm_lon,hadmm_lat);
    F = griddedInterpolant(X,Y,hadmm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    hadmm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    hadmm_hfds_m(ii,2) = hadmm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim ukesm*
    [X,Y] = ndgrid(ukesm_lon,ukesm_lat);
    F = griddedInterpolant(X,Y,ukesm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    ukesm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    ukesm_hfds_m(ii,2) = ukesm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim accessc*
    [X,Y] = ndgrid(accessc_lon,accessc_lat);
    F = griddedInterpolant(X,Y,accessc_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    accessc_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    accessc_hfds_m(ii,2) = accessc_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim accesse*
    [X,Y] = ndgrid(accesse_lon,accesse_lat);
    F = griddedInterpolant(X,Y,accesse_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    accesse_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    accesse_hfds_m(ii,2) = accesse_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim gfdlc*
    [X,Y] = ndgrid(gfdlc_lon,gfdlc_lat);
    F = griddedInterpolant(X,Y,gfdlc_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    gfdlc_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    gfdlc_hfds_m(ii,2) = gfdlc_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim gfdle*
    [X,Y] = ndgrid(gfdle_lon,gfdle_lat);
    F = griddedInterpolant(X,Y,gfdle_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    gfdle_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    gfdle_hfds_m(ii,2) = gfdle_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim cams*
    [X,Y] = ndgrid(cams_lon,cams_lat);
    F = griddedInterpolant(X,Y,cams_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cams_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cams_hfds_m(ii,2) = cams_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim can*
    [X,Y] = ndgrid(can_lon,can_lat);
    F = griddedInterpolant(X,Y,can_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    can_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    can_hfds_m(ii,2) = can_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim cas*
    [X,Y] = ndgrid(cas_lon,cas_lat);
    F = griddedInterpolant(X,Y,cas_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cas_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cas_hfds_m(ii,2) = cas_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim cesm*
    [X,Y] = ndgrid(cesm_lon,cesm_lat);
    F = griddedInterpolant(X,Y,cesm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cesm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cesm_hfds_m(ii,2) = cesm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim cesw*
    [X,Y] = ndgrid(cesw_lon,cesw_lat);
    F = griddedInterpolant(X,Y,cesw_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cesw_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cesw_hfds_m(ii,2) = cesw_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim ciesm*
    [X,Y] = ndgrid(ciesm_lon,ciesm_lat);
    F = griddedInterpolant(X,Y,ciesm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    ciesm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    ciesm_hfds_m(ii,2) = ciesm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim e3sm*
    [X,Y] = ndgrid(e3sm_lon,e3sm_lat);
    F = griddedInterpolant(X,Y,e3sm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    e3sm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    e3sm_hfds_m(ii,2) = e3sm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim ec*
    [X,Y] = ndgrid(ec_lon,ec_lat);
    F = griddedInterpolant(X,Y,ec_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    ec_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    ec_hfds_m(ii,2) = ec_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim ecv*
    [X,Y] = ndgrid(ecv_lon,ecv_lat);
    F = griddedInterpolant(X,Y,ecv_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    ecv_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    ecv_hfds_m(ii,2) = ecv_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim fio*
    [X,Y] = ndgrid(fio_lon,fio_lat);
    F = griddedInterpolant(X,Y,fio_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    fio_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    fio_hfds_m(ii,2) = fio_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim gisscc*
    [X,Y] = ndgrid(gisscc_lon,gisscc_lat);
    F = griddedInterpolant(X,Y,gisscc_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    gisscc_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    gisscc_hfds_m(ii,2) = gisscc_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim gissg*
    [X,Y] = ndgrid(gissg_lon,gissg_lat);
    F = griddedInterpolant(X,Y,gissg_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    gissg_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    gissg_hfds_m(ii,2) = gissg_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim gissh*
    [X,Y] = ndgrid(gissh_lon,gissh_lat);
    F = griddedInterpolant(X,Y,gissh_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    gissh_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    gissh_hfds_m(ii,2) = gissh_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim ipsl*
    [X,Y] = ndgrid(ipsl_lon,ipsl_lat);
    F = griddedInterpolant(X,Y,ipsl_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    ipsl_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    ipsl_hfds_m(ii,2) = ipsl_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim mcm*
    [X,Y] = ndgrid(mcm_lon,mcm_lat);
    F = griddedInterpolant(X,Y,mcm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    mcm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    mcm_hfds_m(ii,2) = mcm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim nesm*
    [X,Y] = ndgrid(nesm_lon,nesm_lat);
    F = griddedInterpolant(X,Y,nesm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    nesm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    nesm_hfds_m(ii,2) = nesm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim norc*
    [X,Y] = ndgrid(norc_lon,norc_lat);
    F = griddedInterpolant(X,Y,norc_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    norc_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    norc_hfds_m(ii,2) = norc_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim norelm*
    [X,Y] = ndgrid(norelm_lon,norelm_lat);
    F = griddedInterpolant(X,Y,norelm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    norelm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    norelm_hfds_m(ii,2) = norelm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim samo*
    [X,Y] = ndgrid(samo_lon,samo_lat);
    F = griddedInterpolant(X,Y,samo_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    samo_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    samo_hfds_m(ii,2) = samo_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
    
    load CMIP6_TFLX_clim noremm*
    [X,Y] = ndgrid(noremm_lon,noremm_lat);
    F = griddedInterpolant(X,Y,noremm_hfds_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    noremm_hfds_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    noremm_hfds_m(ii,2) = noremm_hfds_m(ii,1)*areaBox/(1e15);
    clear temp *_hfds_clim *_lat *_lon
end

save CMIP6_TFLX_m *_m

clear

load CMIP6_TFLX_m







toc()

