clear
close all
clc
tic()

load theta_season_anom theta*

heat3v = mean(theta3s,2);
heat6v = mean(theta6s,2);
heat12v = mean(theta12s,2);


RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');
DRF = squeeze(rdmds('../Grids/6/DRF'));

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
        if hFacC(ii,jj,84)<1
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

volume = areaBox(2:2:104)'.*DRF;
mass = 1035.*volume;

heat_inv3 = 3850*sum(heat3v(1:35).*mass(1:35));
heat_inv6 = 3850*sum(heat6v(1:35).*mass(1:35));
heat_inv12 = 3850*sum(heat12v(1:35).*mass(1:35));


toc()