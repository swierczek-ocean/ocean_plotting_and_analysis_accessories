clear
close all
clc

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

