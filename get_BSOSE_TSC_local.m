clear
close all
clc
tic()

load BSOSE_TSC

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
        if hFacC(ii,jj,42)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

areaBox(52) = 0;

bsthv = zeros(52,12);
bssav = zeros(52,12);
bsdicv = zeros(52,12);
A = [1,2,3;4,5,6;7,8,9;10,11,12];

for jj=1:12
    bsthv(:,jj) = squeeze(sum(sum(THETAB(x,y,:,jj).*areaTop)))./areaBox;
    bssav(:,jj) = squeeze(sum(sum(SALTB(x,y,:,jj).*areaTop)))./areaBox;
    bsdicv(:,jj) = squeeze(sum(sum(DICB(x,y,:,jj).*areaTop)))./areaBox;
end

bsths = zeros(52,4);
bssas = zeros(52,4);
bsdics = zeros(52,4);

for ii=1:4
    bsths(:,ii) = mean(bsthv(:,A(ii,:)),2);
    bssas(:,ii) = mean(bssav(:,A(ii,:)),2);
    bsdics(:,ii) = mean(bsdicv(:,A(ii,:)),2);
end

% SALTB = mean(SALTB,4);
% THETAB = mean(THETAB,4);
% DICB = mean(DICB,4);

save BSOSE_TSC_local bs* *B

% clear

toc()