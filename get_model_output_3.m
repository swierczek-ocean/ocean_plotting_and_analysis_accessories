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


