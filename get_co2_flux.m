clear
close all
clc
tic()

load PANGAEA_CF PT PX PY roeden* cmems* land*

syr = 60*60*24*365.2;

roedencf = 0.012*syr.*roeden_cf(:,:,85:96);
landcf = 0.012*syr.*land_cf(:,:,85:96);
cmemscf = 0.012*syr.*cmems_cf(:,:,85:96);

roedencf(isnan(roedencf)==1) = 0;
landcf(isnan(landcf)==1) = 0;
cmemscf(isnan(cmemscf)==1) = 0;

[PX,PY] = ndgrid(PX,PY');


RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');
mask12 = zeros(756,512);
load XY12 XC12 YC12


[XC12,YC12] = ndgrid(XC12,YC12);

landflux12 = zeros(756,512,12);
roedenflux12 = zeros(756,512,12);
cmemsflux12 = zeros(756,512,12);

for ii=1:12
    F = griddedInterpolant(PX,PY,landcf(:,:,ii),'linear');
    landflux12(:,:,ii) = F(XC12,YC12);
    F = griddedInterpolant(PX,PY,roedencf(:,:,ii),'linear');
    roedenflux12(:,:,ii) = F(XC12,YC12);
    F = griddedInterpolant(PX,PY,cmemscf(:,:,ii),'linear');
    cmemsflux12(:,:,ii) = F(XC12,YC12);
end


x = 17:676;
y = 106:467;
z = 1:104; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,85)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end
mask12(x,y) = hFacC_ind(:,:,1);

areaTop = hFacC_ind(:,:,1).*RAC(x,y);
areaBox = sum(sum(areaTop));

landflxm12 = zeros(12,1);
roedenflxm12 = zeros(12,1);
cmemsflxm12 = zeros(12,1);

for ii=1:12
    landflxm12(ii) = sum(sum(landflux12(x,y,ii).*areaTop))./areaBox;
    roedenflxm12(ii) = sum(sum(roedenflux12(x,y,ii).*areaTop))./areaBox;
    cmemsflxm12(ii) = sum(sum(cmemsflux12(x,y,ii).*areaTop))./areaBox;
end

save pangaeaflx *flxm12









toc()