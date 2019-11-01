clear
close all
clc
tic()
acc_colors
set(0,'DefaultFigureVisible','on')
close all
c1 = 55;
c2 = 70;
c3 = 57;
c4 = 64;
c5 = 49;
c6 = 89;
c7 = 54;
c8 = 69;
c9 = 22;
c10 = 57;
c11 = 56;
c12 = 69;
lwpsd = 1.8;
lw = 2.8;
ms = 20;
cb = 56;
cbd = 36;
timeh = datenum('010115','mmddyy'):(1/24):datenum('010118','mmddyy');
timeh = timeh(1:(end-1))';
xdatesfull = [datenum('010115','mmddyy'),datenum('020115','mmddyy'),...
    datenum('030115','mmddyy'),datenum('040115','mmddyy'),...
    datenum('050115','mmddyy'),...
    datenum('060115','mmddyy'),datenum('070115','mmddyy'),...
    datenum('080115','mmddyy'),datenum('090115','mmddyy'),...
    datenum('100115','mmddyy'),datenum('110115','mmddyy'),...
    datenum('120115','mmddyy'),datenum('010116','mmddyy'),...
    datenum('020116','mmddyy'),datenum('030116','mmddyy'),...
    datenum('040116','mmddyy'),datenum('050116','mmddyy'),...
    datenum('060116','mmddyy'),datenum('070116','mmddyy'),...
    datenum('080116','mmddyy'),datenum('090116','mmddyy'),...
    datenum('100116','mmddyy'),datenum('110116','mmddyy'),...
    datenum('120116','mmddyy'),datenum('010117','mmddyy'),...
    datenum('020117','mmddyy'),datenum('030117','mmddyy'),...
    datenum('040117','mmddyy'),datenum('050117','mmddyy'),...
    datenum('060117','mmddyy'),datenum('070117','mmddyy'),...
    datenum('080117','mmddyy'),datenum('090117','mmddyy'),...
    datenum('100117','mmddyy'),datenum('110117','mmddyy'),...
    datenum('120117','mmddyy'),datenum('010118','mmddyy'),...
    datenum('020118','mmddyy')];
lw = 0.4;

%% 1
load OOI_MTBLK_MATS/ooi_metbk_dlw_hourly
load ERA5_dlw
era5_mean = -mean(ERA5_dlw);
era5_std = std(ERA5_dlw,0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(2,2,1)
h1 = plot(timeh,-ERA5_dlw,'LineWidth',lw,'Color',Color(c10,:));
hold on
h2 = plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c11,:));
grid on
ylabel('[W/m^2]')
title('ERA5 vs OOI downward longwave irradiance','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(1:2:end))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([timeh(1) timeh(end)])
acc_tri_panel_1
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);

legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

ooi_hist = ooi_metbk_hourly(isnan(ooi_metbk_hourly(:,2))==0,2);

subplot(2,2,2)
h1 = histogram(-ERA5_dlw,'FaceColor',Color(c10,:),'EdgeColor',Color(c5,:));
hold on
h2 = histogram(ooi_hist,'FaceColor',Color(c11,:),'EdgeColor',Color(c12,:));
xlabel('[W/m^2]')
title('distribution of downward longwave irradiance','FontWeight','Normal')
acc_tri_panel_2
acc_movie
h1.Normalization = 'pdf';
h1.BinWidth = 5;
h2.Normalization = 'pdf';
h2.BinWidth = 5;
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

subplot(2,2,3)
text(0.05,0.65,'Argentine Basin (42.5W,43S)','FontSize',16,'Color','k')
text(0.05,0.5,['ERA5 mean: ',...
    num2str(era5_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(0.05,0.35,['ERA5 st dev: ',...
    num2str(era5_std,3),' W/m^2'],'FontSize',16,'Color','k')
text(0.05,0.2,['OOI mean: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(0.05,0.05,['OOI st dev: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k'); axis off


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

subplot(2,2,4)
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[W^2/m^4/cpd]')
title('psd of downward longwave radiation','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_tri_panel_3
acc_movie
hold off
set(gcf,'color',Color(36,:))
set(gcf,'InvertHardCopy','off'); 
print('-r300','ERA5_PLOTS/ERA5_vs_OOI_METBK_DLW','-dpng')

close all
clear ooi_metbk_hourly
%% 1

%% 2
load OOI_MTBLK_MATS/ooi_metbk_dsw_hourly
load ERA5_dsw
era5_mean = -mean(ERA5_dsw);
era5_std = std(ERA5_dsw,0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(2,2,1)
h1 = plot(timeh,-ERA5_dsw,'LineWidth',lw,'Color',Color(c10,:));
hold on
h2 = plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c11,:));
grid on
ylabel('[W/m^2]')
title('ERA5 vs OOI downward shortwave irradiance','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(1:2:end))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([timeh(1) timeh(end)])
acc_tri_panel_1
acc_movie
ylim([-10 1050])
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off


ooi_hist = ooi_metbk_hourly(isnan(ooi_metbk_hourly(:,2))==0,2);

subplot(2,2,2)
h1 = histogram(-ERA5_dsw,'FaceColor',Color(c10,:),'EdgeColor',Color(c5,:));
hold on
h2 = histogram(ooi_hist,'FaceColor',Color(c11,:),'EdgeColor',Color(c12,:));
xlabel('[W/m^2]')
title('distribution of downward shortwave irradiance','FontWeight','Normal')
acc_tri_panel_2
acc_movie
h1.Normalization = 'pdf';
h1.BinWidth = 5;
h2.Normalization = 'pdf';
h2.BinWidth = 5;
set(gca,'YScale','log')
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

subplot(2,2,3)
text(0.05,0.65,'Argentine Basin (42.5W,43S)','FontSize',16,'Color','k')
text(0.05,0.5,['ERA5 mean: ',...
    num2str(era5_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(0.05,0.35,['ERA5 st dev: ',...
    num2str(era5_std,3),' W/m^2'],'FontSize',16,'Color','k')
text(0.05,0.2,['OOI mean: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(0.05,0.05,['OOI st dev: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
axis off

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

subplot(2,2,4)
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[W^2/m^4/cpd]')
title('psd of downward shortwave radiation','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_tri_panel_3
acc_movie
hold off
set(gcf,'color',Color(36,:))
set(gcf,'InvertHardCopy','off'); 
print('-r300','ERA5_PLOTS/ERA5_vs_OOI_METBK_DSW','-dpng')

close all
clear ooi_metbk_hourly
%% 2


%% 6
load OOI_MTBLK_MATS/ooi_metbk_pres_hourly
load ERA5_pres
ERA5_pres = ERA5_pres./100;
era5_mean = mean(ERA5_pres);
era5_std = std(ERA5_pres,0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(2,2,1)
h1 = plot(timeh,ERA5_pres,'LineWidth',lw,'Color',Color(c10,:));
hold on
h2 = plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c11,:));
grid on
ylabel('[mbar]')
title('ERA5 vs OOI barometric pressure','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(1:2:end))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([timeh(1) timeh(end)])
acc_tri_panel_1
acc_movie
ylim([960 1050])
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

ooi_hist = ooi_metbk_hourly(isnan(ooi_metbk_hourly(:,2))==0,2);

subplot(2,2,2)
h1 = histogram(ERA5_pres,'FaceColor',Color(c10,:),'EdgeColor',Color(c5,:));
hold on
h2 = histogram(ooi_hist,'FaceColor',Color(c11,:),'EdgeColor',Color(c12,:));
xlabel('[mbar]')
title('distribution of barometric pressure','FontWeight','Normal')
acc_tri_panel_2
acc_movie
h1.Normalization = 'pdf';
h1.BinWidth = 2.5;
h2.Normalization = 'pdf';
h2.BinWidth = 2.5;
xlim([960 1050])
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off


subplot(2,2,3)
text(0.05,0.65,'Argentine Basin (42.5W,43S)','FontSize',16,'Color','k')
text(0.05,0.5,['ERA5 mean: ',...
    num2str(era5_mean,4),' mbar'],'FontSize',16,'Color','k')
text(0.05,0.35,['ERA5 st dev: ',...
    num2str(era5_std,3),' mbar'],'FontSize',16,'Color','k')
text(0.05,0.2,['OOI mean: ',...
    num2str(ooi_mean,4),' mbar'],'FontSize',16,'Color','k')
text(0.05,0.05,['OOI st dev: ',...
    num2str(ooi_std,3),' mbar'],'FontSize',16,'Color','k')
axis off

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

subplot(2,2,4)
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[mbar^2/cpd]')
title('psd of barometric pressure','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_tri_panel_3
acc_movie
hold off
set(gcf,'color',Color(36,:))
set(gcf,'InvertHardCopy','off'); 
print('-r300','ERA5_PLOTS/ERA5_vs_OOI_METBK_PRES','-dpng')

close all
clear ooi_metbk_hourly
%% 6

%% 7
% load OOI_MTBLK_MATS/ooi_metbk_rain_hourly
% 
% datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
% datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c8,:))
% hold on
% grid on
% ylabel('[mm]')
% title('Argentine Basin OOI METBK precipitation','FontWeight','Normal')
% xtickangle(45)
% xticks(xdatesfull(datest:datend))
% dateFormat = 'mm/yy';
% datetick('x',dateFormat,'keepticks')
% xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
% acc_tri_panel_
% acc_movie
% y1 = ylim;
% yrange = y1(2) - y1(1);
% text(datenum('020115','mmddyy'),y1(1)+0.15*yrange,['mean precip: ',...
%     num2str(ooi_mean,3),' mm'],'FontSize',16,'Color','k')
% text(datenum('020115','mmddyy'),y1(1)+0.10*yrange,['st dev of precip: ',...
%     num2str(ooi_std,3),' mm'],'FontSize',16,'Color','k')
% hold off
% print('ERA5_PLOTS/ERA5_vs_OOI_METBK_RAIN','-dpng')
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% histogram(ooi_hist,35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
% xlabel('[mm]')
% title('Argentine Basin OOI METBK precipitation','FontWeight','Normal')
% acc_tri_panel_
% acc_movie
% print('ERA5_PLOTS/ERA5_vs_OOI_METBK_RAIN_hist','-dpng')
% 
% close all
% clear ooi_metbk_hourly
%% 7

%% 8
load OOI_MTBLK_MATS/ooi_metbk_spfh2m_hourly
load ERA5_spfh2m
ERA5_spfh2m = 1000.*ERA5_spfh2m;
era5_mean = mean(ERA5_spfh2m);
era5_std = std(ERA5_spfh2m,0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(2,2,1)
h1 = plot(timeh,ERA5_spfh2m,'LineWidth',lw,'Color',Color(c10,:));
hold on
h2 = plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c11,:));
grid on
ylabel('[g/kg]')
title('ERA5 vs OOI 2m specific humidity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(1:2:end))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([timeh(1) timeh(end)])
acc_tri_panel_1
acc_movie
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off


ooi_hist = ooi_metbk_hourly(isnan(ooi_metbk_hourly(:,2))==0,2);

subplot(2,2,2)
h1 = histogram(ERA5_spfh2m,'FaceColor',Color(c10,:),'EdgeColor',Color(c5,:));
hold on
h2 = histogram(ooi_hist,'FaceColor',Color(c11,:),'EdgeColor',Color(c12,:));
xlabel('[g/kg]')
title('distribution of 2m specific humidity','FontWeight','Normal')
acc_tri_panel_2
acc_movie
h1.Normalization = 'pdf';
h1.BinWidth = 0.25;
h2.Normalization = 'pdf';
h2.BinWidth = 0.25;
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

subplot(2,2,3)
text(0.05,0.65,'Argentine Basin (42.5W,43S)','FontSize',16,'Color','k')
text(0.05,0.5,['ERA5 mean: ',...
    num2str(era5_mean,4),' g/kg'],'FontSize',16,'Color','k')
text(0.05,0.35,['ERA5 st dev: ',...
    num2str(era5_std,3),' g/kg'],'FontSize',16,'Color','k')
text(0.05,0.2,['OOI mean: ',...
    num2str(ooi_mean,4),' g/kg'],'FontSize',16,'Color','k')
text(0.05,0.05,['OOI st dev: ',...
    num2str(ooi_std,3),' g/kg'],'FontSize',16,'Color','k')
axis off

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

subplot(2,2,4)
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[g^2/kg^2/cpd]')
title('psd of specific humidity','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_tri_panel_3
acc_movie
hold off
set(gcf,'color',Color(36,:))
set(gcf,'InvertHardCopy','off'); 
print('-r300','ERA5_PLOTS/ERA5_vs_OOI_METBK_SPFH','-dpng')

close all
clear ooi_metbk_hourly
%% 8


%% 12
load OOI_MTBLK_MATS/ooi_metbk_tmp2m_degC_hourly
load ERA5_tmp2m_degC
era5_mean = mean(ERA5_tmp2m_degC);
era5_std = std(ERA5_tmp2m_degC,0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(2,2,1)
h1 = plot(timeh,ERA5_tmp2m_degC,'LineWidth',lw,'Color',Color(c10,:));
hold on
h2 = plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c11,:));
grid on
ylabel('[C]')
title('ERA5 vs OOI 2m air temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(1:2:end))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([timeh(1) timeh(end)])
acc_tri_panel_1
acc_movie
ylim([4 20])
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

ooi_hist = ooi_metbk_hourly(isnan(ooi_metbk_hourly(:,2))==0,2);

subplot(2,2,2)
h1 = histogram(ERA5_tmp2m_degC,'FaceColor',Color(c10,:),'EdgeColor',Color(c5,:));
hold on
h2 = histogram(ooi_hist,'FaceColor',Color(c11,:),'EdgeColor',Color(c12,:));
xlabel('[C]')
title('distribution of 2m air temperature','FontWeight','Normal')
acc_tri_panel_2
acc_movie
xlim([4 20])
h1.Normalization = 'pdf';
h1.BinWidth = 0.5;
h2.Normalization = 'pdf';
h2.BinWidth = 0.5;
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

subplot(2,2,3)
text(0.05,0.65,'Argentine Basin (42.5W,43S)','FontSize',16,'Color','k')
text(0.05,0.5,['ERA5 mean: ',...
    num2str(era5_mean,4),' C'],'FontSize',16,'Color','k')
text(0.05,0.35,['ERA5 st dev: ',...
    num2str(era5_std,3),' C'],'FontSize',16,'Color','k')
text(0.05,0.2,['OOI mean: ',...
    num2str(ooi_mean,4),' C'],'FontSize',16,'Color','k')
text(0.05,0.05,['OOI st dev: ',...
    num2str(ooi_std,3),' C'],'FontSize',16,'Color','k')
axis off

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

subplot(2,2,4)
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI','ERA5','location','southwest')
xlabel('cpd')
ylabel('[degC^2/cpd]')
title('psd of 2m air temperature','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_tri_panel_3
acc_movie
hold off
set(gcf,'color',Color(36,:))
set(gcf,'InvertHardCopy','off'); 
print('-r300','ERA5_PLOTS/ERA5_vs_OOI_METBK_2MTEMP','-dpng')

close all
clear ooi_metbk_hourly
%% 12

%% 16
load OOI_MTBLK_MATS/ooi_metbk_u5m_hourly
load ERA5_u10m
era5_mean = mean(ERA5_u10m);
era5_std = std(ERA5_u10m,0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(2,2,1)
h1 = plot(timeh,ERA5_u10m,'LineWidth',lw,'Color',Color(c10,:));
hold on
h2 = plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c11,:));
grid on
ylabel('[m/s]')
title('ERA5 (10m) vs OOI (5m) zonal winds','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(1:2:end))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([timeh(1) timeh(end)])
acc_tri_panel_1
acc_movie
ylim([-21 23])
legend([h1(1),h2(1)],'ERA5','OOI','Location','northeast')
hold off

ooi_hist = ooi_metbk_hourly(isnan(ooi_metbk_hourly(:,2))==0,2);

subplot(2,2,2)
h1 = histogram(ERA5_u10m,'FaceColor',Color(c10,:),'EdgeColor',Color(c5,:));
hold on
h2 = histogram(ooi_hist,'FaceColor',Color(c11,:),'EdgeColor',Color(c12,:));
xlabel('[m/s]')
title('distribution of zonal winds','FontWeight','Normal')
acc_tri_panel_2
acc_movie
h1.Normalization = 'pdf';
h1.BinWidth = 0.5;
h2.Normalization = 'pdf';
h2.BinWidth = 0.5;
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

subplot(2,2,3)
text(0.05,0.65,'Argentine Basin (42.5W,43S)','FontSize',16,'Color','k')
text(0.05,0.5,['ERA5 mean (10m): ',...
    num2str(era5_mean,4),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.35,['ERA5 st dev (10m): ',...
    num2str(era5_std,3),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.2,['OOI mean (5m): ',...
    num2str(ooi_mean,4),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.05,['OOI st dev (5m): ',...
    num2str(ooi_std,3),' m/s'],'FontSize',16,'Color','k')
axis off

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

subplot(2,2,4)
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI u5m','ERA5 u10m','location','southwest')
xlabel('cpd')
ylabel('[m^2/s^2/cpd]')
title('psd of zonal wind','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_tri_panel_3
acc_movie
hold off
set(gcf,'color',Color(36,:))
set(gcf,'InvertHardCopy','off'); 
print('-r300','ERA5_PLOTS/ERA5_vs_OOI_METBK_U510M','-dpng')

close all
clear ooi_metbk_hourly
%% 16

%% 17
load OOI_MTBLK_MATS/ooi_metbk_v5m_hourly
load ERA5_v10m
era5_mean = mean(ERA5_v10m);
era5_std = std(ERA5_v10m,0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(2,2,1)
h1 = plot(timeh,ERA5_v10m,'LineWidth',lw,'Color',Color(c10,:));
hold on
h2 = plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c11,:));
grid on
ylabel('[m/s]')
title('ERA5 (10m) vs OOI (5m) meridional winds','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(1:2:end))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([timeh(1) timeh(end)])
acc_tri_panel_1
acc_movie
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off


ooi_hist = ooi_metbk_hourly(isnan(ooi_metbk_hourly(:,2))==0,2);

subplot(2,2,2)
h1 = histogram(ERA5_v10m,'FaceColor',Color(c10,:),'EdgeColor',Color(c5,:));
hold on
h2 = histogram(ooi_hist,'FaceColor',Color(c11,:),'EdgeColor',Color(c12,:));
xlabel('[m/s]')
title('distribution of meridional winds','FontWeight','Normal')
acc_tri_panel_2
acc_movie
h1.Normalization = 'pdf';
h1.BinWidth = 0.5;
h2.Normalization = 'pdf';
h2.BinWidth = 0.5;
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

subplot(2,2,3)
text(0.05,0.65,'Argentine Basin (42.5W,43S)','FontSize',16,'Color','k')
text(0.05,0.5,['ERA5 mean (10m): ',...
    num2str(era5_mean,4),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.35,['ERA5 st dev (10m): ',...
    num2str(era5_std,3),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.2,['OOI mean (5m): ',...
    num2str(ooi_mean,4),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.05,['OOI st dev (5m): ',...
    num2str(ooi_std,3),' m/s'],'FontSize',16,'Color','k')
axis off

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

subplot(2,2,4)
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI v5m','ERA5 v10m','location','southwest')
xlabel('cpd')
ylabel('[m^2/s^2/cpd]')
title('psd of meridional wind','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_tri_panel_3
acc_movie
hold off
set(gcf,'color',Color(36,:))
set(gcf,'InvertHardCopy','off'); 
print('-r300','ERA5_PLOTS/ERA5_vs_OOI_METBK_V510M','-dpng')

close all
clear ooi_metbk_hourly
%% 17

%% 18
load ERA5_v10m
load ERA5_u10m

ERA5_spd = sqrt(ERA5_u10m.^2 + ERA5_v10m.^2);
era5_mean = mean(ERA5_spd);
era5_std = std(ERA5_spd,0);

load OOI_MTBLK_MATS/ooi_metbk_u5m_hourly
U = ooi_metbk_hourly(:,2);
load OOI_MTBLK_MATS/ooi_metbk_v5m_hourly
V = ooi_metbk_hourly(:,2);


ooi_metbk_hourly(:,2) = sqrt(U.^2 + V.^2);
speed = ooi_metbk_hourly(:,2);
ooi_mean = mean(speed(isnan(speed)==0));
ooi_std = std(speed(isnan(speed)==0),0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(2,2,1)
h1 = plot(timeh,ERA5_spd,'LineWidth',lw,'Color',Color(c10,:));
hold on
h2 = plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c11,:));
grid on
ylabel('[m/s]')
title('ERA5 (10m) vs OOI (5m) wind speed','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(1:2:end))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([timeh(1) timeh(end)])
acc_tri_panel_1
acc_movie
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

ooi_hist = ooi_metbk_hourly(isnan(ooi_metbk_hourly(:,2))==0,2);

subplot(2,2,2)
h1 = histogram(ERA5_spd,'FaceColor',Color(c10,:),'EdgeColor',Color(c5,:));
hold on
h2 = histogram(ooi_hist,'FaceColor',Color(c11,:),'EdgeColor',Color(c12,:));
xlabel('[m/s]')
title('distribution of wind speed','FontWeight','Normal')
acc_tri_panel_2
acc_movie
h1.Normalization = 'pdf';
h1.BinWidth = 0.5;
h2.Normalization = 'pdf';
h2.BinWidth = 0.5;
legend([h1(1),h2(1)],'ERA5','OOI','Location','best')
hold off

subplot(2,2,3)
text(0.05,0.65,'Argentine Basin (42.5W,43S)','FontSize',16,'Color','k')
text(0.05,0.5,['ERA5 mean (10m): ',...
    num2str(era5_mean,4),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.35,['ERA5 st dev (10m): ',...
    num2str(era5_std,3),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.2,['OOI mean (5m): ',...
    num2str(ooi_mean,4),' m/s'],'FontSize',16,'Color','k')
text(0.05,0.05,['OOI st dev (5m): ',...
    num2str(ooi_std,3),' m/s'],'FontSize',16,'Color','k')
axis off

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

subplot(2,2,4)
h2 = loglog(freq,psd_ERA5,'Color',Color(c3,:),'LineWidth',lwpsd);
hold on
h1 = loglog(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lwpsd);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend([h1(1),h2(1)],'OOI 5m wind speed','ERA5 10m wind speed','location','southwest')
xlabel('cpd')
ylabel('[m^2/s^2/cpd]')
title('psd of wind speed','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_tri_panel_3
acc_movie
hold off
set(gcf,'color',Color(36,:))
set(gcf,'InvertHardCopy','off'); 
print('-r300','ERA5_PLOTS/ERA5_vs_OOI_METBK_WINDSPEED','-dpng')

close all
clear ooi_metbk_hourly
%% 18


toc()
