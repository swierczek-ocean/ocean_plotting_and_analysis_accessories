clear
close all
clc

hFacC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
DXG3 = rdmds('../MITgcm/verification/SO3_20190513/run/DXG');
DYG3 = rdmds('../MITgcm/verification/SO3_20190513/run/DYG');
DXC3 = rdmds('../MITgcm/verification/SO3_20190513/run/DXC');
DYC3 = rdmds('../MITgcm/verification/SO3_20190513/run/DYC');
XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
XG3 = rdmds('../MITgcm/verification/SO3_20190513/run/XG');
YG3 = rdmds('../MITgcm/verification/SO3_20190513/run/YG');
RAC3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RAC'));
RC3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC'));
RF3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RF'));
DRF3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/DRF'));
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';
str = '../MITgcm/verification/SO3_20190513/diag/';



tflux_3 = zeros(192,132,12);
cflux_3 = zeros(192,132,12);
theta_3 = zeros(192,132,52,365);
dic_3 = zeros(192,132,52,365);
wvel_3 = zeros(192,132,52,365);

for ii=1:12
    charstate = [str,'diag_airsea.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',[1,3]);
    tflux_3(:,:,ii) = temp(:,:,1);
    cflux_3(:,:,ii) = temp(:,:,2);
    clear temp
end

for ii=1:365
    charstate = [strs,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',[1,5]);
    theta_3(:,:,:,ii) = temp(:,:,:,1);
    wvel_3(:,:,:,ii) = temp(:,:,:,2);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(48*(ii+31),'%010.f')];
    dic_3(:,:,:,ii) = rdmds(charbgc,'rec',1);
end

clear temp char* str*

nccreate('AB3_output.nc','theta_3','Dimensions',...
    {'lon',192,'lat',132,'z',52,'time_days',365},'Datatype','single')
nccreate('AB3_output.nc','dic_3','Dimensions',...
    {'lon',192,'lat',132,'z',52,'time_days',365},'Datatype','single')
nccreate('AB3_output.nc','wvel_3','Dimensions',...
    {'lon',192,'lat',132,'z',52,'time_days',365},'Datatype','single')
nccreate('AB3_output.nc','tflux_3','Dimensions',...
    {'lon',192,'lat',132,'time_months',12},'Datatype','single')
nccreate('AB3_output.nc','cflux_3','Dimensions',...
    {'lon',192,'lat',132,'time_months',12},'Datatype','single')
nccreate('AB3_output.nc','hFacC3','Dimensions',...
    {'lon',192,'lat',132,'z',52},'Datatype','single')
nccreate('AB3_output.nc','XC3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','YC3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','DXC3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','DYC3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','XG3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','YG3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','DXG3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','DYG3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','RAC3','Dimensions',...
    {'lon',192,'lat',132},'Datatype','single')
nccreate('AB3_output.nc','RC3','Dimensions',...
    {'z',52},'Datatype','single')
nccreate('AB3_output.nc','RF3','Dimensions',...
    {'ze',53},'Datatype','single')
nccreate('AB3_output.nc','DRF3','Dimensions',...
    {'z',52},'Datatype','single')


ncwrite('AB3_output.nc','theta_3',theta_3)
ncwrite('AB3_output.nc','dic_3',dic_3)
ncwrite('AB3_output.nc','wvel_3',wvel_3)
ncwrite('AB3_output.nc','tflux_3',tflux_3)
ncwrite('AB3_output.nc','cflux_3',cflux_3)
ncwrite('AB3_output.nc','XC3',XC3)
ncwrite('AB3_output.nc','YC3',YC3)
ncwrite('AB3_output.nc','DXC3',DXC3)
ncwrite('AB3_output.nc','DYC3',DYC3)
ncwrite('AB3_output.nc','XG3',XG3)
ncwrite('AB3_output.nc','YG3',YG3)
ncwrite('AB3_output.nc','DXG3',DXG3)
ncwrite('AB3_output.nc','DYG3',DYG3)
ncwrite('AB3_output.nc','RC3',RC3)
ncwrite('AB3_output.nc','RF3',RF3)
ncwrite('AB3_output.nc','DRF3',DRF3)
ncwrite('AB3_output.nc','RAC3',RAC3)
ncwrite('AB3_output.nc','hFacC3',hFacC3)

ncwriteatt('AB3_output.nc','theta_3','units','degrees Celsius');
ncwriteatt('AB3_output.nc','dic_3','units','mol C/m^3');
ncwriteatt('AB3_output.nc','wvel_3','units','m/s');
ncwriteatt('AB3_output.nc','tflux_3','units','W/m^2');
ncwriteatt('AB3_output.nc','cflux_3','units','mol C/m^2/sec');
ncwriteatt('AB3_output.nc','XC3','units','degrees');
ncwriteatt('AB3_output.nc','YC3','units','degrees');
ncwriteatt('AB3_output.nc','XG3','units','degrees');
ncwriteatt('AB3_output.nc','YG3','units','degrees');
ncwriteatt('AB3_output.nc','DXC3','units','meters');
ncwriteatt('AB3_output.nc','DYC3','units','meters');
ncwriteatt('AB3_output.nc','DXG3','units','meters');
ncwriteatt('AB3_output.nc','DYG3','units','meters');
ncwriteatt('AB3_output.nc','RC3','units','meters');
ncwriteatt('AB3_output.nc','RF3','units','meters');
ncwriteatt('AB3_output.nc','DRF3','units','meters');
ncwriteatt('AB3_output.nc','RAC3','units','m^2');
ncwriteatt('AB3_output.nc','hFacC3','units','unitless (proportion of volume)');

ncwriteatt('AB3_output.nc','theta_3','description','potential temperature');
ncwriteatt('AB3_output.nc','dic_3','description','dissolved inorganic carbon');
ncwriteatt('AB3_output.nc','wvel_3','description','vertical velocity');
ncwriteatt('AB3_output.nc','tflux_3','description','downward surface heat flux');
ncwriteatt('AB3_output.nc','cflux_3','description','downward surface carbon flux');
ncwriteatt('AB3_output.nc','XC3','description','tracer cell center zonal coordinate');
ncwriteatt('AB3_output.nc','YC3','description','tracer cell center meridional coordinate');
ncwriteatt('AB3_output.nc','XG3','description','tracer cell boundary zonal coordinate');
ncwriteatt('AB3_output.nc','YG3','description','tracer cell boundary meridional coordinate');
ncwriteatt('AB3_output.nc','DXC3','description','zonal distance between tracer cell centers');
ncwriteatt('AB3_output.nc','DYC3','description','meridional distance between tracer cell centers');
ncwriteatt('AB3_output.nc','DXG3','description','tracer cell zonal width');
ncwriteatt('AB3_output.nc','DYG3','description','tracer cell meridional width');
ncwriteatt('AB3_output.nc','RAC3','description','tracer cell top area');
ncwriteatt('AB3_output.nc','RC3','description','tracer cell center depth');
ncwriteatt('AB3_output.nc','RF3','description','tracer cell top depth');
ncwriteatt('AB3_output.nc','DRF3','description','tracer cell height');
ncwriteatt('AB3_output.nc','hFacC3','description','tracer cell mask');

time_m = 736711:30:737060;
time_d = 736696:737060;
nccreate('AB3_output.nc','time_m','Dimensions',...
    {'time_months',12})
nccreate('AB3_output.nc','time_d','Dimensions',...
    {'time_days',365})
ncwrite('AB3_output.nc','time_m',time_m)
ncwrite('AB3_output.nc','time_d',time_d)
ncwriteatt('AB3_output.nc','time_d','units','MATLAB datenum');
ncwriteatt('AB3_output.nc','time_m','units','MATLAB datenum');
ncwriteatt('AB3_output.nc','time_m','description','month');
ncwriteatt('AB3_output.nc','time_d','description','day');

clear

hFacC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
DXG6 = rdmds('../MITgcm/verification/SO6_20190513/run/DXG');
DYG6 = rdmds('../MITgcm/verification/SO6_20190513/run/DYG');
DXC6 = rdmds('../MITgcm/verification/SO6_20190513/run/DXC');
DYC6 = rdmds('../MITgcm/verification/SO6_20190513/run/DYC');
XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
XG6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YG6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RAC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RAC'));
RC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
RF6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RF'));
DRF6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/DRF'));
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';
str = '../MITgcm/verification/SO6_20190513/diag/';


tflux_6 = zeros(384,260,12);
cflux_6 = zeros(384,260,12);
theta_6 = zeros(384,260,52,365);
dic_6 = zeros(384,260,52,365);
wvel_6 = zeros(384,260,52,365);

for ii=1:12
    charstate = [str,'diag_airsea.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',[1,3]);
    tflux_6(:,:,ii) = temp(:,:,1);
    cflux_6(:,:,ii) = temp(:,:,2);
    clear temp
end

for ii=1:365
    charstate = [strs,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',[1,5]);
    theta_6(:,:,:,ii) = temp(:,:,:,1);
    wvel_6(:,:,:,ii) = temp(:,:,:,2);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(72*(ii+31),'%010.f')];
    dic_6(:,:,:,ii) = rdmds(charbgc,'rec',1);
end

clear temp char* str*

nccreate('AB6_output.nc','theta_6','Dimensions',...
    {'lon',384,'lat',260,'z',52,'time_days',365},'Datatype','single')
nccreate('AB6_output.nc','dic_6','Dimensions',...
    {'lon',384,'lat',260,'z',52,'time_days',365},'Datatype','single')
nccreate('AB6_output.nc','wvel_6','Dimensions',...
    {'lon',384,'lat',260,'z',52,'time_days',365},'Datatype','single')
nccreate('AB6_output.nc','tflux_6','Dimensions',...
    {'lon',384,'lat',260,'time_months',12},'Datatype','single')
nccreate('AB6_output.nc','cflux_6','Dimensions',...
    {'lon',384,'lat',260,'time_months',12},'Datatype','single')

nccreate('AB6_output.nc','hFacC6','Dimensions',...
    {'lon',384,'lat',260,'z',52},'Datatype','single')
nccreate('AB6_output.nc','XC6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','YC6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','DXC6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','DYC6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','XG6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','YG6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','DXG6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','DYG6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','RAC6','Dimensions',...
    {'lon',384,'lat',260},'Datatype','single')
nccreate('AB6_output.nc','RC6','Dimensions',...
    {'z',52},'Datatype','single')
nccreate('AB6_output.nc','RF6','Dimensions',...
    {'ze',53},'Datatype','single')
nccreate('AB6_output.nc','DRF6','Dimensions',...
    {'z',52},'Datatype','single')


ncwrite('AB6_output.nc','theta_6',theta_6)
ncwrite('AB6_output.nc','dic_6',dic_6)
ncwrite('AB6_output.nc','wvel_6',wvel_6)
ncwrite('AB6_output.nc','tflux_6',tflux_6)
ncwrite('AB6_output.nc','cflux_6',cflux_6)
ncwrite('AB6_output.nc','XC6',XC6)
ncwrite('AB6_output.nc','YC6',YC6)
ncwrite('AB6_output.nc','DXC6',DXC6)
ncwrite('AB6_output.nc','DYC6',DYC6)
ncwrite('AB6_output.nc','XG6',XG6)
ncwrite('AB6_output.nc','YG6',YG6)
ncwrite('AB6_output.nc','DXG6',DXG6)
ncwrite('AB6_output.nc','DYG6',DYG6)
ncwrite('AB6_output.nc','RC6',RC6)
ncwrite('AB6_output.nc','RF6',RF6)
ncwrite('AB6_output.nc','DRF6',DRF6)
ncwrite('AB6_output.nc','RAC6',RAC6)
ncwrite('AB6_output.nc','hFacC6',hFacC6)

ncwriteatt('AB6_output.nc','theta_6','units','degrees Celsius');
ncwriteatt('AB6_output.nc','dic_6','units','mol C/m^3');
ncwriteatt('AB6_output.nc','wvel_6','units','m/s');
ncwriteatt('AB6_output.nc','tflux_6','units','W/m^2');
ncwriteatt('AB6_output.nc','cflux_6','units','mol C/m^2/sec');
ncwriteatt('AB6_output.nc','XC6','units','degrees');
ncwriteatt('AB6_output.nc','YC6','units','degrees');
ncwriteatt('AB6_output.nc','XG6','units','degrees');
ncwriteatt('AB6_output.nc','YG6','units','degrees');
ncwriteatt('AB6_output.nc','DXC6','units','meters');
ncwriteatt('AB6_output.nc','DYC6','units','meters');
ncwriteatt('AB6_output.nc','DXG6','units','meters');
ncwriteatt('AB6_output.nc','DYG6','units','meters');
ncwriteatt('AB6_output.nc','RC6','units','meters');
ncwriteatt('AB6_output.nc','RF6','units','meters');
ncwriteatt('AB6_output.nc','DRF6','units','meters');
ncwriteatt('AB6_output.nc','RAC6','units','m^2');
ncwriteatt('AB6_output.nc','hFacC6','units','unitless (proportion of volume)');

ncwriteatt('AB6_output.nc','theta_6','description','potential temperature');
ncwriteatt('AB6_output.nc','dic_6','description','dissolved inorganic carbon');
ncwriteatt('AB6_output.nc','wvel_6','description','vertical velocity');
ncwriteatt('AB6_output.nc','tflux_6','description','downward surface heat flux');
ncwriteatt('AB6_output.nc','cflux_6','description','downward surface carbon flux');
ncwriteatt('AB6_output.nc','XC6','description','tracer cell center zonal coordinate');
ncwriteatt('AB6_output.nc','YC6','description','tracer cell center meridional coordinate');
ncwriteatt('AB6_output.nc','XG6','description','tracer cell boundary zonal coordinate');
ncwriteatt('AB6_output.nc','YG6','description','tracer cell boundary meridional coordinate');
ncwriteatt('AB6_output.nc','DXC6','description','zonal distance between tracer cell centers');
ncwriteatt('AB6_output.nc','DYC6','description','meridional distance between tracer cell centers');
ncwriteatt('AB6_output.nc','DXG6','description','tracer cell zonal width');
ncwriteatt('AB6_output.nc','DYG6','description','tracer cell meridional width');
ncwriteatt('AB6_output.nc','RAC6','description','tracer cell top area');
ncwriteatt('AB6_output.nc','RC6','description','tracer cell center depth');
ncwriteatt('AB6_output.nc','RF6','description','tracer cell top depth');
ncwriteatt('AB6_output.nc','DRF6','description','tracer cell height');
ncwriteatt('AB6_output.nc','hFacC6','description','tracer cell mask');

time_m = 736711:30:737060;
time_d = 736696:737060;
nccreate('AB6_output.nc','time_m','Dimensions',...
    {'time_months',12})
nccreate('AB6_output.nc','time_d','Dimensions',...
    {'time_days',365})
ncwrite('AB6_output.nc','time_m',time_m)
ncwrite('AB6_output.nc','time_d',time_d)
ncwriteatt('AB6_output.nc','time_d','units','MATLAB datenum');
ncwriteatt('AB6_output.nc','time_m','units','MATLAB datenum');
ncwriteatt('AB6_output.nc','time_m','description','month');
ncwriteatt('AB6_output.nc','time_d','description','day');


clear

hFacC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
DXG12 = rdmds('../MITgcm/verification/SO12_20190513/run/DXG');
DYG12 = rdmds('../MITgcm/verification/SO12_20190513/run/DYG');
DXC12 = rdmds('../MITgcm/verification/SO12_20190513/run/DXC');
DYC12 = rdmds('../MITgcm/verification/SO12_20190513/run/DYC');
XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
XG12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YG12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RAC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RAC'));
RC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
RF12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RF'));
DRF12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/DRF'));
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';
str = '../MITgcm/verification/SO12_20190513/diag/';

hFacC12 = hFacC12(:,:,1:2:104);
RC12 = RC12(1:2:104);
RF12 = RF12(1:2:105);
DRF12 = DRF12(1:2:104);


tflux_12 = zeros(756,512,12);
cflux_12 = zeros(756,512,12);
theta_12 = zeros(756,512,52,365);
dic_12 = zeros(756,512,52,365);
wvel_12 = zeros(756,512,52,365);

for ii=1:12
    charstate = [str,'diag_airsea.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',[1,3]);
    tflux_12(:,:,ii) = temp(:,:,1);
    cflux_12(:,:,ii) = temp(:,:,2);
    clear temp
end

for ii=1:365
    charstate = [strs,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',[1,5]);
    theta_12(:,:,:,ii) = temp(:,:,1:2:104,1);
    wvel_12(:,:,:,ii) = temp(:,:,1:2:104,2);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic_12(:,:,:,ii) = temp(:,:,1:2:104);
    clear temp
end

clear temp char* str*

nccreate('AB12_output.nc','theta_12','Dimensions',...
    {'lon',756,'lat',512,'z',52,'time_days',365},'Datatype','single')
nccreate('AB12_output.nc','dic_12','Dimensions',...
    {'lon',756,'lat',512,'z',52,'time_days',365},'Datatype','single')
nccreate('AB12_output.nc','wvel_12','Dimensions',...
    {'lon',756,'lat',512,'z',52,'time_days',365},'Datatype','single')
nccreate('AB12_output.nc','tflux_12','Dimensions',...
    {'lon',756,'lat',512,'time_months',12},'Datatype','single')
nccreate('AB12_output.nc','cflux_12','Dimensions',...
    {'lon',756,'lat',512,'time_months',12},'Datatype','single')

nccreate('AB12_output.nc','hFacC12','Dimensions',...
    {'lon',756,'lat',512,'z',52},'Datatype','single')
nccreate('AB12_output.nc','XC12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','YC12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','DXC12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','DYC12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','XG12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','YG12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','DXG12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','DYG12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','RAC12','Dimensions',...
    {'lon',756,'lat',512},'Datatype','single')
nccreate('AB12_output.nc','RC12','Dimensions',...
    {'z',52},'Datatype','single')
nccreate('AB12_output.nc','RF12','Dimensions',...
    {'ze',53},'Datatype','single')
nccreate('AB12_output.nc','DRF12','Dimensions',...
    {'z',52},'Datatype','single')


ncwrite('AB12_output.nc','theta_12',theta_12)
ncwrite('AB12_output.nc','dic_12',dic_12)
ncwrite('AB12_output.nc','wvel_12',wvel_12)
ncwrite('AB12_output.nc','tflux_12',tflux_12)
ncwrite('AB12_output.nc','cflux_12',cflux_12)
ncwrite('AB12_output.nc','XC12',XC12)
ncwrite('AB12_output.nc','YC12',YC12)
ncwrite('AB12_output.nc','DXC12',DXC12)
ncwrite('AB12_output.nc','DYC12',DYC12)
ncwrite('AB12_output.nc','XG12',XG12)
ncwrite('AB12_output.nc','YG12',YG12)
ncwrite('AB12_output.nc','DXG12',DXG12)
ncwrite('AB12_output.nc','DYG12',DYG12)
ncwrite('AB12_output.nc','RC12',RC12)
ncwrite('AB12_output.nc','RF12',RF12)
ncwrite('AB12_output.nc','DRF12',DRF12)
ncwrite('AB12_output.nc','RAC12',RAC12)
ncwrite('AB12_output.nc','hFacC12',hFacC12)

ncwriteatt('AB12_output.nc','theta_12','units','degrees Celsius');
ncwriteatt('AB12_output.nc','dic_12','units','mol C/m^3');
ncwriteatt('AB12_output.nc','wvel_12','units','m/s');
ncwriteatt('AB12_output.nc','tflux_12','units','W/m^2');
ncwriteatt('AB12_output.nc','cflux_12','units','mol C/m^2/sec');
ncwriteatt('AB12_output.nc','XC12','units','degrees');
ncwriteatt('AB12_output.nc','YC12','units','degrees');
ncwriteatt('AB12_output.nc','XG12','units','degrees');
ncwriteatt('AB12_output.nc','YG12','units','degrees');
ncwriteatt('AB12_output.nc','DXC12','units','meters');
ncwriteatt('AB12_output.nc','DYC12','units','meters');
ncwriteatt('AB12_output.nc','DXG12','units','meters');
ncwriteatt('AB12_output.nc','DYG12','units','meters');
ncwriteatt('AB12_output.nc','RC12','units','meters');
ncwriteatt('AB12_output.nc','RF12','units','meters');
ncwriteatt('AB12_output.nc','DRF12','units','meters');
ncwriteatt('AB12_output.nc','RAC12','units','m^2');
ncwriteatt('AB12_output.nc','hFacC12','units','unitless (proportion of volume)');

ncwriteatt('AB12_output.nc','theta_12','description','potential temperature');
ncwriteatt('AB12_output.nc','dic_12','description','dissolved inorganic carbon');
ncwriteatt('AB12_output.nc','wvel_12','description','vertical velocity');
ncwriteatt('AB12_output.nc','tflux_12','description','downward surface heat flux');
ncwriteatt('AB12_output.nc','cflux_12','description','downward surface carbon flux');
ncwriteatt('AB12_output.nc','XC12','description','tracer cell center zonal coordinate');
ncwriteatt('AB12_output.nc','YC12','description','tracer cell center meridional coordinate');
ncwriteatt('AB12_output.nc','XG12','description','tracer cell boundary zonal coordinate');
ncwriteatt('AB12_output.nc','YG12','description','tracer cell boundary meridional coordinate');
ncwriteatt('AB12_output.nc','DXC12','description','zonal distance between tracer cell centers');
ncwriteatt('AB12_output.nc','DYC12','description','meridional distance between tracer cell centers');
ncwriteatt('AB12_output.nc','DXG12','description','tracer cell zonal width');
ncwriteatt('AB12_output.nc','DYG12','description','tracer cell meridional width');
ncwriteatt('AB12_output.nc','RAC12','description','tracer cell top area');
ncwriteatt('AB12_output.nc','RC12','description','tracer cell center depth');
ncwriteatt('AB12_output.nc','RF12','description','tracer cell top depth');
ncwriteatt('AB12_output.nc','DRF12','description','tracer cell height');
ncwriteatt('AB12_output.nc','hFacC12','description','tracer cell mask');

time_m = 736711:30:737060;
time_d = 736696:737060;
nccreate('AB12_output.nc','time_m','Dimensions',...
    {'time_months',12})
nccreate('AB12_output.nc','time_d','Dimensions',...
    {'time_days',365})
ncwrite('AB12_output.nc','time_m',time_m)
ncwrite('AB12_output.nc','time_d',time_d)
ncwriteatt('AB12_output.nc','time_d','units','MATLAB datenum');
ncwriteatt('AB12_output.nc','time_m','units','MATLAB datenum');
ncwriteatt('AB12_output.nc','time_m','description','month');
ncwriteatt('AB12_output.nc','time_d','description','day');


clear
