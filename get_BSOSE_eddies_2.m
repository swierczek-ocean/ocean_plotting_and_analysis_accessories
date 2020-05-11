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

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_surfTflx.nc';

TFLUXB = ncread(str,'TFLUX',[lox,loy,sd],[nn,mm,nd]);
rA = ncread(str,'rA');

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_surfCO2flx.nc';

CFLUXLB = ncread(str,'BLGCFLX',[lox,loy,sd],[nn,mm,nd]);


x = 11:340;
y = 54:235;
z = 1:52; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC(:,:,1);
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:1
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj) = 1;
            end
        end
        if hFacC(ii,jj,42)<1
            hFacC_ind(ii,jj) = 0;
        end
    end
end



areaTop = hFacC_ind.*rA(x,y);
areaBox(kk) = sum(sum(areaTop));


bstflx = zeros(12,1);
bscflx = zeros(12,1);


for ii=1:12
    bscflx(ii) = sum(sum(CFLUXLB(x,y,ii).*areaTop))./areaBox;
    bstflx(ii) = sum(sum(TFLUXB(x,y,ii).*areaTop))./areaBox;
end

save BSOSE_flux bs*

clear

toc()