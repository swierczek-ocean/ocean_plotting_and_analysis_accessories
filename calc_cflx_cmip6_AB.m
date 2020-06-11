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

accesse_fgco2_m = zeros(12,2);
bccc_fgco2_m = zeros(12,2);
bcce_fgco2_m = zeros(12,2);
can_fgco2_m = zeros(12,2);
cesm_fgco2_m = zeros(12,2);
cesw_fgco2_m = zeros(12,2);
cesmfv_fgco2_m = zeros(12,2);
ceswfv_fgco2_m = zeros(12,2);
gfdlc_fgco2_m = zeros(12,2);
gfdle_fgco2_m = zeros(12,2);
gisscc_fgco2_m = zeros(12,2);
inm4_fgco2_m = zeros(12,2);
inm5_fgco2_m = zeros(12,2);
ipsl_fgco2_m = zeros(12,2);
miroc_fgco2_m = zeros(12,2);
mpiham_fgco2_m = zeros(12,2);
mpihr_fgco2_m = zeros(12,2);
mpilr_fgco2_m = zeros(12,2);
norc_fgco2_m = zeros(12,2);
norelm_fgco2_m = zeros(12,2);
noremm_fgco2_m = zeros(12,2);
ukesm_fgco2_m = zeros(12,2);


for ii=1:12
    load CMIP6_CFLX_clim mpiham*
    F = scatteredInterpolant(mpiham_lon,mpiham_lat,...
        mpiham_fgco2_clim(:,ii),'linear');
    temp = F(XC,YC);
    mpiham_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    mpiham_fgco2_m(ii,2) = mpiham_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim mpihr*
    F = scatteredInterpolant(mpihr_lon,mpihr_lat,...
        mpihr_fgco2_clim(:,ii),'linear');
    temp = F(XC,YC);
    mpihr_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    mpihr_fgco2_m(ii,2) = mpihr_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim mpilr*
    F = scatteredInterpolant(mpilr_lon,mpilr_lat,...
        mpilr_fgco2_clim(:,ii),'linear');
    temp = F(XC,YC);
    mpilr_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    mpilr_fgco2_m(ii,2) = mpilr_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
end





for ii=1:12
    load CMIP6_CFLX_clim ukesm*
    [X,Y] = ndgrid(ukesm_lon,ukesm_lat);
    F = griddedInterpolant(X,Y,ukesm_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    ukesm_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    ukesm_fgco2_m(ii,2) = ukesm_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim accesse*
    [X,Y] = ndgrid(accesse_lon,accesse_lat);
    F = griddedInterpolant(X,Y,accesse_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    accesse_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    accesse_fgco2_m(ii,2) = accesse_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim gfdlc*
    [X,Y] = ndgrid(gfdlc_lon,gfdlc_lat);
    F = griddedInterpolant(X,Y,gfdlc_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    gfdlc_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    gfdlc_fgco2_m(ii,2) = gfdlc_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim gfdle*
    [X,Y] = ndgrid(gfdle_lon,gfdle_lat);
    F = griddedInterpolant(X,Y,gfdle_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    gfdle_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    gfdle_fgco2_m(ii,2) = gfdle_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim can*
    [X,Y] = ndgrid(can_lon,can_lat);
    F = griddedInterpolant(X,Y,can_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    can_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    can_fgco2_m(ii,2) = can_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim cesm*
    [X,Y] = ndgrid(cesm_lon,cesm_lat);
    F = griddedInterpolant(X,Y,cesm_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cesm_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cesm_fgco2_m(ii,2) = cesm_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim cesw*
    [X,Y] = ndgrid(cesw_lon,cesw_lat);
    F = griddedInterpolant(X,Y,cesw_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cesw_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cesw_fgco2_m(ii,2) = cesw_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim gisscc*
    [X,Y] = ndgrid(gisscc_lon,gisscc_lat);
    F = griddedInterpolant(X,Y,gisscc_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    gisscc_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    gisscc_fgco2_m(ii,2) = gisscc_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim ipsl*
    [X,Y] = ndgrid(ipsl_lon,ipsl_lat);
    F = griddedInterpolant(X,Y,ipsl_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    ipsl_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    ipsl_fgco2_m(ii,2) = ipsl_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim norc*
    [X,Y] = ndgrid(norc_lon,norc_lat);
    F = griddedInterpolant(X,Y,norc_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    norc_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    norc_fgco2_m(ii,2) = norc_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim norelm*
    [X,Y] = ndgrid(norelm_lon,norelm_lat);
    F = griddedInterpolant(X,Y,norelm_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    norelm_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    norelm_fgco2_m(ii,2) = norelm_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim noremm*
    [X,Y] = ndgrid(noremm_lon,noremm_lat);
    F = griddedInterpolant(X,Y,noremm_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    noremm_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    noremm_fgco2_m(ii,2) = noremm_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim cesmfv*
    [X,Y] = ndgrid(cesmfv_lon,cesmfv_lat);
    F = griddedInterpolant(X,Y,cesmfv_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    cesmfv_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    cesmfv_fgco2_m(ii,2) = cesmfv_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim ceswfv*
    [X,Y] = ndgrid(ceswfv_lon,ceswfv_lat);
    F = griddedInterpolant(X,Y,ceswfv_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    ceswfv_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    ceswfv_fgco2_m(ii,2) = ceswfv_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim miroc*
    [X,Y] = ndgrid(miroc_lon,miroc_lat);
    F = griddedInterpolant(X,Y,miroc_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    miroc_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    miroc_fgco2_m(ii,2) = miroc_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim bccc*
    [X,Y] = ndgrid(bccc_lon,bccc_lat);
    F = griddedInterpolant(X,Y,bccc_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    bccc_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    bccc_fgco2_m(ii,2) = bccc_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim bcce*
    [X,Y] = ndgrid(bcce_lon,bcce_lat);
    F = griddedInterpolant(X,Y,bcce_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    bcce_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    bcce_fgco2_m(ii,2) = bcce_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim inm4*
    [X,Y] = ndgrid(inm4_lon,inm4_lat);
    F = griddedInterpolant(X,Y,inm4_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    inm4_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    inm4_fgco2_m(ii,2) = inm4_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
    
    load CMIP6_CFLX_clim inm5*
    [X,Y] = ndgrid(inm5_lon,inm5_lat);
    F = griddedInterpolant(X,Y,inm5_fgco2_clim(:,:,ii),'linear');
    temp = F(XC,YC);
    inm5_fgco2_m(ii,1) = sum(areaTop.*temp(x,y),[1,2])./areaBox;
    inm5_fgco2_m(ii,2) = inm5_fgco2_m(ii,1)*areaBox/(1e15);
    clear temp *_fgco2_clim *_lat *_lon
end

save CMIP6_CFLX_m *_m

clear

load CMIP6_CFLX_m







toc()

