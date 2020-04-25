clear
close all
clc
tic()

load XY3 XC3 YC3
load ERAflx lat long thf

[XC3,YC3] = ndgrid(XC3,YC3);
[long,lat] = ndgrid(long,lat);
THF3 = zeros(192,132,12);

for ii=1:12
    F = griddedInterpolant(long,lat,thf(:,:,ii),'linear');
    THF3(:,:,ii) = F(XC3,YC3);
end


RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');


x = 6:170;
y = 29:119;
z = 1:52; 

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
        if hFacC(ii,jj,21)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = zeros(nx,ny,nz);
areaBox = zeros(1,nz);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

eratflx = zeros(12,1);

for ii=1:12
    eratflx(ii) = sum(sum(THF3(x,y,ii).*areaTop(:,:,1)))./areaBox(1);
end


save eratflx eratflx


toc()