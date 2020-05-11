clear
close all
clc
tic()

load fluxes

eccotemp = zeros(756,512,12);
sodatemp = eccotemp;

tfluxsoda(isnan(tfluxsoda)==1) = 0;
tfluxecco(isnan(tfluxecco)==1) = 0;

load XY12 XC12 YC12
[XC12,YC12] = ndgrid(XC12,YC12);

for ii=1:12
    F = griddedInterpolant(XCS,YCS,tfluxsoda(:,:,ii),'linear');
    sodatemp(:,:,ii) = F(XC12,YC12);
    F = griddedInterpolant(elon,elat,tfluxecco(:,:,ii),'linear');
    eccotemp(:,:,ii) = F(XC12,YC12);
end


RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

x = 17:676;
y = 106:467;
z = 1:104; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC(:,:,1);
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:1
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,85)<1
            hFacC_ind(ii,jj) = 0;
        end
    end
end

areaTop = hFacC_ind.*RAC(x,y);
areaBox = sum(sum(areaTop));

eccotflux = zeros(12,1);
sodatflux = zeros(12,1);

for ii=1:12
    eccotflux(ii) = sum(sum(eccotemp(x,y,ii).*areaTop))./areaBox;
    sodatflux(ii) = sum(sum(sodatemp(x,y,ii).*areaTop))./areaBox;
end

save flux2 eccotflux sodatflux





toc()