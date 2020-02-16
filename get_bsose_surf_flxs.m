clear
close all
clc
tic()

strt = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_surfTflx.nc';
strc = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_surfCO2flx.nc';
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Theta.nc';

bsose_day_1 = datenum('01012013','mmddyyyy');
mit_day_2 = datenum('01012017','mmddyyyy');
bsose_index_2 = mit_day_2 - bsose_day_1 + 1;
sd = bsose_index_2;
nd = 365;

XCS = ncread(strt,'XC');
YCS = ncread(strt,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288,1)-1;
hix = find(X>352,1)+1;
loy = find(Y>-65,1)-1;
hiy = find(Y>-30,1)+1;
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
HC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

TFLX_BSOSE = ncread(strt,'TFLUX',[lox,loy,sd],[nn,mm,nd]);
CFLX_BSOSE = ncread(strc,'BLGCFLX',[lox,loy,sd],[nn,mm,nd]);

for ii=1:nn
    for jj=1:mm
        if HC(ii,jj,1)==0
            TFLX_BSOSE(ii,jj,:) = NaN;
            CFLX_BSOSE(ii,jj,:) = NaN;
        end
    end
end

save BSOSE_surfflxs TFLX_BSOSE CFLX_BSOSE XCS YCS









toc()