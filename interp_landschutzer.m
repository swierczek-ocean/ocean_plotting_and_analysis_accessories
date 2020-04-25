clear
close all
clc
tic()

% load landschutzer2018_sose_grid6 co2flux_interp % time_land
% 
% co2flux_2017 = co2flux_interp(:,:,421:432);
% clear co2flux_interp
% 
% % datestr(time_land(421),'mmm dd yyyy')
% % datestr(time_land(432),'mmm dd yyyy')
% 
% save co2flux_2017

load co2flux_2017

load ../PhaseII/input6/6grid/grid XC YC
load XY6 XC6 YC6

XC = XC(:,1);
YC = YC(1,:);

xlo = find(XC==XC6(1));
xhi = find(XC==XC6(382));
ylo = find(YC==YC6(1));
yhi = find(YC==YC6(260));

co2flux_2017 = co2flux_2017(xlo:xhi,ylo:yhi,:);

RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');

x = 11:340;
y = 54:235;
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

co2flx = zeros(12,1);
co2flux_2017(isnan(co2flux_2017)==1) = 0;

for ii=1:12
    co2flx(ii) = sum(sum(co2flux_2017(x,y,ii).*areaTop(:,:,1)))./areaBox(1);
end
co2flx = -co2flx;
save co2flx co2flx

toc()