clear
close all
clc
tic()

str = '../2020_07_July_Analysis/JMA_co2map_2017.nc';

ncdisp(str)

jlon = ncread(str,'lon');
jlat = ncread(str,'lat');
jflux = -0.012.*ncread(str,'flux');
jflux(isnan(jflux)==1) = 0;


RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');
mask12 = zeros(756,512);
load XY12 XC12 YC12


[XC12,YC12] = ndgrid(XC12,YC12);
[jlon,jlat] = ndgrid(jlon,jlat);

jflux12 = zeros(756,512,12);

for ii=1:12
    F = griddedInterpolant(jlon,jlat,jflux(:,:,ii),'linear');
    jflux12(:,:,ii) = F(XC12,YC12);
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

jflxm12 = zeros(12,1);

for ii=1:12
    jflxm12(ii) = sum(sum(jflux12(x,y,ii).*areaTop))./areaBox;
end

save jflux jflxm12












toc()