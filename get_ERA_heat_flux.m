clear
close all
clc
tic()

name = 'adaptor.mars.internal-1587165775.4775364-31912-23-190fe292-ede8-40fc-80f8-f39ff8835d0b.nc';

ncdisp(name)

long = ncread(name,'longitude');
long = long + 360;
lat = ncread(name,'latitude');
lat = lat';
lat = fliplr(lat);

slhf = ncread(name,'slhf');
ssr = ncread(name,'ssr');
sshf = ncread(name,'sshf');
str = ncread(name,'str');

syr = 60*60*24;

slhf(slhf==-32767) = NaN;
str(str==-32767) = NaN;
sshf(sshf==-32767) = NaN;
ssr(ssr==-32767) = NaN;

slhf = slhf./syr;
str = str./syr;
sshf = sshf./syr;
ssr = ssr./syr;

thf = sshf + slhf + ssr + str;
thf = fliplr(thf);
thfm = mean(thf,3);

clear name syr

save ERAflx









toc()