clear
close all
clc
tic()

%% THETA
strt = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Theta.nc';
stru = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Uvel.nc';
strv = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Vvel.nc';
sd = 49;
nt = 12;

x = 1741:2070;
y = 379:560;
z = 1:52; %

THETA_temp = ncread(str,'THETA',[1741,379,1,sd],[2071,561,52,nt]);
XC = ncread(strt,'XC');
YC = ncread(strt,'YC');
DXG = ncread(strv,'DxG');
DYG = ncread(stru,'DyG');
hFacC = ncread(strt,'hFacC');
hFacW = ncread(stru,'hFacW');
hFacS = ncread(strv,'hFacS');
DRF = ncread(strtt,'drF');
RAC = ncread(strt,'rA');


XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz+1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = RAC(x,y);
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end
areaTop(:,:,nz+1) = RAC(x,y);
area = RAC(x,y);







toc()