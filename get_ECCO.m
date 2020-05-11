clear
close all
clc
tic()


str1 = 'ECCO/THETA_2017_01.nc';

ncdisp(str1);

elat = ncread(str1,'latitude');
elon = ncread(str1,'longitude');
ecdepth = ncread(str1,'Z');

str1 = 'ECCO/WVELMASS_2017_01.nc';

efdepth = ncread(str1,'Zl');

elon = elon(211:350);
elat = elat(51:130);

eccotheta = zeros(140,80,50,12);
eccosalt = zeros(140,80,50,12);
eccoadvrth = zeros(140,80,50,12);
eccowvel = zeros(140,80,50,12);
eccouvel = zeros(140,80,50,12);
eccovvel = zeros(140,80,50,12);
eccomld = zeros(140,80,12);
eccotflux = zeros(140,80,12);


for ii=1:12
    str1 = ['ECCO/THETA_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'THETA'));
    eccotheta(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/WVELMASS_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'WVELMASS'));
    eccowvel(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/UVEL_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'UVEL'));
    eccouvel(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/VVEL_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'VVEL'));
    eccovvel(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/ADVr_TH_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'ADVr_TH'));
    eccoadvrth(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/SALT_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'SALT'));
    eccosalt(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/MXLDEPTH_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'MXLDEPTH'));
    eccomld(:,:,ii) = temp(211:350,51:130);
    clear temp
    
    str1 = ['ECCO/TFLUX_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'TFLUX'));
    eccotflux(:,:,ii) = temp(211:350,51:130);
    clear temp
end

clear str1 ii


save ECCO_TSUVW












toc()