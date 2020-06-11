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
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

THETAB = ncread(str,'THETA',[lox,loy,1,sd],[nn,mm,52,nd]);

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_surfCO2flx.nc';

CFLUXB = ncread(str,'BLGCFLX',[lox,loy,1],[nn,mm,72]);
RAC = ncread(str,'rA',[lox,loy],[nn,mm]);

str = '/data/SOSE/SOSE/SO6/ITER133/bsose_i133_2013to2018_monthly_surfTflx.nc';

TFLUXB = ncread(str,'TFLUX',[lox,loy,1],[nn,mm,72]);



save BSOSE_FLX *FLUXB hFacC XCS YCS RAC

% clear

toc()