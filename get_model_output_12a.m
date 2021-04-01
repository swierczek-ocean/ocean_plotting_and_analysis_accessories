clear
close all
clc

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

for ii=1:12
    charstate = [str,'diag_airsea.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',[1,3]);
    tflux_12(:,:,ii) = temp(:,:,1);
    cflux_12(:,:,ii) = temp(:,:,2);
    clear temp
end

clear temp char* str*

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
