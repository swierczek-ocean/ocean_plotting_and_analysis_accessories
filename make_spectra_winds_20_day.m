clear
close all
clc
tic()
acc_colors
set(0,'DefaultFigureVisible','on')
close all

%%
lwpsd = 2.8;
ms = 20;
cb = 56;
cbd = 36;
c3 = 57;
%%


%% u

load ERA5_u10m
load OOI_MTBLK_MATS/ooi_metbk_u5m_hourly_psd

timehp = 736038:(1/24):737075;
timehp = timehp';

ooi_u5m = ooi_metbk_hourly(:,2);

NT = length(ooi_u5m);

time = ooi_metbk_hourly(:,1);

ind_start_era5 = find(timehp==time(1),1);
ind_end_era5 = find(timehp==time(end),1);

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time(1),datefmt),...
    '; last OOI obs at ',datestr(time(end),datefmt),'\n'])

dyn_OOI = ooi_u5m;
dyn_ERA5 = ERA5_u10m(ind_start_era5:ind_end_era5);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 1200;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_ERA5(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmpERA5(:,count) = detrend(tmp2).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_ERA5=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmpERA5(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_ERA5 = psd_ERA5 + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI u5m','ERA5 u10m','location','southwest')
xlabel('cpd')
ylabel('[m^2/s^2/cpd]')
title('Argentine Basin zonal wind power spectrum','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print('ERA5_PLOTS/ERA5_vs_OOI_METBK_U510M__PSD','-dpng')
%% u

%% v

load ERA5_v10m
load OOI_MTBLK_MATS/ooi_metbk_v5m_hourly_psd

timehp = 736038:(1/24):737075;
timehp = timehp';

ooi_v5m = ooi_metbk_hourly(:,2);

NT = length(ooi_v5m);

time = ooi_metbk_hourly(:,1);

ind_start_era5 = find(timehp==time(1),1);
ind_end_era5 = find(timehp==time(end),1);

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time(1),datefmt),...
    '; last OOI obs at ',datestr(time(end),datefmt),'\n'])

dyn_OOI = ooi_v5m;
dyn_ERA5 = ERA5_v10m(ind_start_era5:ind_end_era5);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 1200;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_ERA5(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmpERA5(:,count) = detrend(tmp2).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_ERA5=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmpERA5(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_ERA5 = psd_ERA5 + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI v5m','ERA5 v10m','location','southwest')
xlabel('cpd')
ylabel('[m^2/s^2/cpd]')
title('Argentine Basin meridional wind power spectrum','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print('ERA5_PLOTS/ERA5_vs_OOI_METBK_V510M__PSD','-dpng')
%% v

%% spd

load ERA5_v10m
load ERA5_u10m
load OOI_MTBLK_MATS/ooi_metbk_v5m_hourly_psd

timehp = 736038:(1/24):737075;
timehp = timehp';

ooi_v5m = ooi_metbk_hourly(:,2);

load OOI_MTBLK_MATS/ooi_metbk_u5m_hourly_psd

ooi_u5m = ooi_metbk_hourly(:,2);

NT = length(ooi_v5m);

time = ooi_metbk_hourly(:,1);

ind_start_era5 = find(timehp==time(1),1);
ind_end_era5 = find(timehp==time(end),1);

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time(1),datefmt),...
    '; last OOI obs at ',datestr(time(end),datefmt),'\n'])

dyn_OOI = sqrt(ooi_v5m.^2 + ooi_u5m.^2);
dyn_ERA5 = sqrt(ERA5_u10m(ind_start_era5:ind_end_era5).^2 + ...
    ERA5_v10m(ind_start_era5:ind_end_era5).^2);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 1200;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_ERA5(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmpERA5(:,count) = detrend(tmp2).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_ERA5=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmpERA5(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_ERA5 = psd_ERA5 + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI 5m wind speed','ERA5 10m wind speed','location','southwest')
xlabel('cpd')
ylabel('[m^2/s^2/cpd]')
title('Argentine Basin wind speed power spectrum','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print('ERA5_PLOTS/ERA5_vs_OOI_METBK_WINDSPEED__PSD','-dpng')
%% spd

%% T

load ERA5_tmp2m_degC
load OOI_MTBLK_MATS/ooi_metbk_tmp2m_degC_hourly_psd

timehp = 736038:(1/24):737075;
timehp = timehp';

ooi_tmp2m = ooi_metbk_hourly(:,2);

NT = length(ooi_tmp2m);

time = ooi_metbk_hourly(:,1);

ind_start_era5 = find(timehp==time(1),1);
ind_end_era5 = find(timehp==time(end),1);

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time(1),datefmt),...
    '; last OOI obs at ',datestr(time(end),datefmt),'\n'])

dyn_OOI = ooi_tmp2m;
dyn_ERA5 = ERA5_tmp2m_degC(ind_start_era5:ind_end_era5);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 1200;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_ERA5(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmpERA5(:,count) = detrend(tmp2).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_ERA5=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmpERA5(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_ERA5 = psd_ERA5 + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[degC^2/cpd]')
title('Argentine Basin 2m air temperature power spectrum','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print('ERA5_PLOTS/ERA5_vs_OOI_METBK_2MTEMP__PSD','-dpng')
%% T

%% P

load ERA5_pres
load OOI_MTBLK_MATS/ooi_metbk_pres_hourly_psd

ERA5_pres = ERA5_pres./100;

timehp = 736038:(1/24):737075;
timehp = timehp';

ooi_pres = ooi_metbk_hourly(:,2);

NT = length(ooi_pres);

time = ooi_metbk_hourly(:,1);

ind_start_era5 = find(timehp==time(1),1);
ind_end_era5 = find(timehp==time(end),1);

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time(1),datefmt),...
    '; last OOI obs at ',datestr(time(end),datefmt),'\n'])

dyn_OOI = ooi_pres;
dyn_ERA5 = ERA5_pres(ind_start_era5:ind_end_era5);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 1200;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_ERA5(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmpERA5(:,count) = detrend(tmp2).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_ERA5=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmpERA5(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_ERA5 = psd_ERA5 + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[mbar^2/cpd]')
title('Argentine Basin barometric pressure power spectrum','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print('ERA5_PLOTS/ERA5_vs_OOI_METBK_PRES_PSD','-dpng')
%% P

%% SPFH

load OOI_MTBLK_MATS/ooi_metbk_spfh2m_hourly_psd
load ERA5_spfh2m
ERA5_spfh2m = 1000.*ERA5_spfh2m;

timehp = 736038:(1/24):737075;
timehp = timehp';

ooi_spfh2m = ooi_metbk_hourly(:,2);

NT = length(ooi_spfh2m);

time = ooi_metbk_hourly(:,1);

ind_start_era5 = find(timehp==time(1),1);
ind_end_era5 = find(timehp==time(end),1);

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time(1),datefmt),...
    '; last OOI obs at ',datestr(time(end),datefmt),'\n'])

dyn_OOI = ooi_spfh2m;
dyn_ERA5 = ERA5_spfh2m(ind_start_era5:ind_end_era5);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 1200;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_ERA5(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmpERA5(:,count) = detrend(tmp2).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_ERA5=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmpERA5(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_ERA5 = psd_ERA5 + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[g^2/kg^2/cpd]')
title('Argentine Basin specific humidity power spectrum','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print('ERA5_PLOTS/ERA5_vs_OOI_METBK_SPFH_PSD','-dpng')
%% SPFH

%% DLW

load OOI_MTBLK_MATS/ooi_metbk_dlw_hourly_psd
load ERA5_dlw

timehp = 736038:(1/24):737075;
timehp = timehp';

ooi_dlw = ooi_metbk_hourly(:,2);

NT = length(ooi_dlw);

time = ooi_metbk_hourly(:,1);

ind_start_era5 = find(timehp==time(1),1);
ind_end_era5 = find(timehp==time(end),1);

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time(1),datefmt),...
    '; last OOI obs at ',datestr(time(end),datefmt),'\n'])

dyn_OOI = ooi_dlw;
dyn_ERA5 = -ERA5_dlw(ind_start_era5:ind_end_era5);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 1200;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_ERA5(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmpERA5(:,count) = detrend(tmp2).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_ERA5=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmpERA5(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_ERA5 = psd_ERA5 + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[W^2/m^4/cpd]')
title('Argentine Basin downward longwave radiation power spectrum','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print('ERA5_PLOTS/ERA5_vs_OOI_METBK_DLW_PSD','-dpng')
%% DLW

%% DSW

load OOI_MTBLK_MATS/ooi_metbk_dsw_hourly_psd
load ERA5_dsw

timehp = 736038:(1/24):737075;
timehp = timehp';

ooi_dsw = ooi_metbk_hourly(:,2);

NT = length(ooi_dsw);

time = ooi_metbk_hourly(:,1);

ind_start_era5 = find(timehp==time(1),1);
ind_end_era5 = find(timehp==time(end),1);

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time(1),datefmt),...
    '; last OOI obs at ',datestr(time(end),datefmt),'\n'])

dyn_OOI = ooi_dsw;
dyn_ERA5 = -ERA5_dsw(ind_start_era5:ind_end_era5);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 1200;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_ERA5(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmpERA5(:,count) = detrend(tmp2).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_ERA5=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmpERA5(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_ERA5 = psd_ERA5 + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[W^2/m^4/cpd]')
title('Argentine Basin downward shortwave radiation power spectrum','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print('ERA5_PLOTS/ERA5_vs_OOI_METBK_DSW_PSD','-dpng')
%% DSW

toc()