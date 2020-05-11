clear
close all
clc
tic()

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_Theta.nc';

sd = 49;
nd = 12;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.4,1);
hix = find(X>352.1,1);
loy = find(Y>-59.7,1);
hiy = find(Y>-30.23,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
HC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

THETAB = ncread(str,'THETA',[lox,loy,1,sd],[nn,mm,52,nd]);
THETAB = mean(THETAB,4);

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_Wvel.nc';

WVELB = ncread(str,'WVEL',[lox,loy,1,sd],[nn,mm,52,nd]);
WVELB = mean(WVELB,4);

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_5day_ADVr_TH.nc';

ADVr_THB = ncread(str,'ADVr_TH',[lox,loy,1,293],[nn,mm,52,73]);
rA = ncread(str,'rA',[lox,loy],[nn,mm]);
ADVr_THB = mean(ADVr_THB,4);
for ii=1:52
    ADVr_THB(:,:,ii) = ADVr_THB(:,:,ii)./rA;
end

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_5day_ADVr_DIC.nc';

ADVr_DICB = ncread(str,'ADVrTr01',[lox,loy,1,293],[nn,mm,52,73]);
rA = ncread(str,'rA',[lox,loy],[nn,mm]);
ADVr_DICB = mean(ADVr_DICB,4);
for ii=1:52
    ADVr_DICB(:,:,ii) = ADVr_DICB(:,:,ii)./rA;
end

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_DIC.nc';
DICB = ncread(str,'TRAC01',[lox,loy,1,sd],[nn,mm,52,nd]);
DICB = mean(DICB,4);

BTHEDDY = ADVr_THB - WVELB.*THETAB;
BDICEDDY = ADVr_DICB - WVELB.*DICB;

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
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*rA(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

bsthv = zeros(52,1);
bswv = zeros(52,1);
bsdicv = zeros(52,1);
bsthmv = zeros(52,1);
bsdicmv = zeros(52,1);
bsadvrthv = zeros(52,1);
bsadvrdicv = zeros(52,1);
bseddythv = zeros(52,1);
bseddydicv = zeros(52,1);


for ii=1:52
    bsthv(ii) = sum(sum(THETAB(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    bswv(ii) = sum(sum(WVELB(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    bsdicv(ii) = sum(sum(DICB(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    bsthmv(ii) = sum(sum(THETAB(x,y,ii).*WVELB(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    bsdicmv(ii) = sum(sum(DICB(x,y,ii).*WVELB(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    bsadvrthv(ii) = sum(sum(ADVr_THB(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    bsadvrdicv(ii) = sum(sum(ADVr_DICB(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    bseddythv(ii) = sum(sum(BTHEDDY(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    bseddydicv(ii) = sum(sum(BDICEDDY(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

save BSOSE_verts bs*

clear

toc()