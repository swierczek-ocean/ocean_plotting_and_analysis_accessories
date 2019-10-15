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
c5 = 65;
c6 = 89;
c7 = 54;
c8 = 69;
c9 = 22;
timeh = 736038:(1/24):737075;
timeh = timeh';
xdatesfull = [datenum('030115','mmddyy'),datenum('040115','mmddyy'),...
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
lw = 0.6;

%% 1
load OOI_MTBLK_MATS/ooi_metbk_dlw_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c3,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK downward longwave irradiance','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean DLW irr: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of DLW irr: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_DLW','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK downward longwave irradiance','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_DLW_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 1

%% 2
load OOI_MTBLK_MATS/ooi_metbk_dsw_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c6,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK downward shortwave irradiance','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean DSW irr: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of DSW irr: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_DSW','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK downward shortwave irradiance','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_DSW_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 2

%% 3
load OOI_MTBLK_MATS/ooi_metbk_lattfluxup_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c1,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK upward latent heat flux','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean latent T flux: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of latent T flux: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_LTFLXU','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK upward latent heat flux','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_LTFLXU_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 3

%% 4
load OOI_MTBLK_MATS/ooi_metbk_netlirr_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c7,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK net upward longwave irradiance','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean lw irradiance: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of lw irradiance: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_NETLIRR','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK net upward longwave irradiance','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_NETLIRR_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 4

%% 5
load OOI_MTBLK_MATS/ooi_metbk_netsirr_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c3,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK downward shortwave irradiance','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean sw irr: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of sw irr: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_NETSIRR','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK downward shortwave irradiance','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_NETSIRR_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 5

%% 6
load OOI_MTBLK_MATS/ooi_metbk_pres_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c2,:))
hold on
grid on
ylabel('[mbar]')
title('Argentine Basin OOI METBK barometric pressure','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean barometric pressure: ',...
    num2str(ooi_mean,4),' mbar'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of barometric pressure: ',...
    num2str(ooi_std,3),' mbar'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_PRES','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[mbar]')
title('Argentine Basin OOI METBK barometric pressure','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_PRES_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 6

%% 7
load OOI_MTBLK_MATS/ooi_metbk_rain_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c8,:))
hold on
grid on
ylabel('[mm]')
title('Argentine Basin OOI METBK precipitation','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean precip: ',...
    num2str(ooi_mean,3),' mm'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of precip: ',...
    num2str(ooi_std,3),' mm'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_RAIN','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[mm]')
title('Argentine Basin OOI METBK precipitation','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_RAIN_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 7

%% 8
load OOI_MTBLK_MATS/ooi_metbk_spfh2m_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c9,:))
hold on
grid on
ylabel('[g/kg]')
title('Argentine Basin OOI METBK specific humidity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean spec humidity: ',...
    num2str(ooi_mean,3),' g/kg'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of spec humidity: ',...
    num2str(ooi_std,3),' g/kg'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_SPFH','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[g/kg]')
title('Argentine Basin OOI METBK specific humidity','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_SPFH_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 8

%% 9
load OOI_MTBLK_MATS/ooi_metbk_sss_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c2,:))
hold on
grid on
ylabel('[psu]')
title('Argentine Basin OOI METBK sea surface salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean SSS: ',...
    num2str(ooi_mean,3),' psu'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of SSS: ',...
    num2str(ooi_std,3),' psu'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_SSS','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[psu]')
title('Argentine Basin OOI METBK sea surface salinity','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_SSS_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 9

%% 10
load OOI_MTBLK_MATS/ooi_metbk_sst_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c3,:))
hold on
grid on
ylabel('[C]')
title('Argentine Basin OOI METBK sea surface temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean SST: ',...
    num2str(ooi_mean,3),' C'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of SST: ',...
    num2str(ooi_std,3),' C'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_SST','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[C]')
title('Argentine Basin OOI METBK sea surface temperature','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_SST_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 10

%% 11
load OOI_MTBLK_MATS/ooi_metbk_tfluxup_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c9,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK upward heat flux','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean heat flux: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of heat flux: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_TFLXU','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK upward heat flux','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_TFLXU_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 11

%% 12
load OOI_MTBLK_MATS/ooi_metbk_tmp2m_degC_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c6,:))
hold on
grid on
ylabel('[C]')
title('Argentine Basin OOI METBK air temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean air temp: ',...
    num2str(ooi_mean,3),' C'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of air temp: ',...
    num2str(ooi_std,3),' C'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_2mAT','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[C]')
title('Argentine Basin OOI METBK air temperature','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_2mAT_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 12

%% 13
load OOI_MTBLK_MATS/ooi_metbk_senstfluxup_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c7,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK net upward sensible heat flux','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean sensible T flux: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of sensible T flux: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_SENSTFLX','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK net upward sensible heat flux','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_SENSTFLX_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 13

%% 14
load OOI_MTBLK_MATS/ooi_metbk_senstfluxup_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c8,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK net upward sensible heat flux','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean sensible T flux: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of sensible T flux: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_SENSTFLX','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK net upward sensible heat flux','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_SENSTFLX_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 14

%% 15
load OOI_MTBLK_MATS/ooi_metbk_senstfluxup_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c8,:))
hold on
grid on
ylabel('[W/m^2]')
title('Argentine Basin OOI METBK net upward sensible heat flux','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean sensible T flux: ',...
    num2str(ooi_mean,3),' W/m^2'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of sensible T flux: ',...
    num2str(ooi_std,3),' W/m^2'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_SENSTFLX','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[W/m^2]')
title('Argentine Basin OOI METBK net upward sensible heat flux','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_SENSTFLX_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 15

%% 16
load OOI_MTBLK_MATS/ooi_metbk_u5m_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c9,:))
hold on
grid on
ylabel('[m/s]')
title('Argentine Basin OOI METBK 5m U wind','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean 5m u wind: ',...
    num2str(ooi_mean,3),' m/s'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of 5m u wind: ',...
    num2str(ooi_std,3),' m/s'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_U5M','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[m/s]')
title('Argentine Basin OOI METBK 5m U wind','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_U5M_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 16

%% 17
load OOI_MTBLK_MATS/ooi_metbk_v5m_hourly

datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c1,:))
hold on
grid on
ylabel('[m/s]')
title('Argentine Basin OOI METBK 5m V wind','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean 5m v wind: ',...
    num2str(ooi_mean,3),' m/s'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of 5m v wind: ',...
    num2str(ooi_std,3),' m/s'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_V5M','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[m/s]')
title('Argentine Basin OOI METBK 5m V wind','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_V5M_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 17

%% 18
load OOI_MTBLK_MATS/ooi_metbk_u5m_hourly
U = ooi_metbk_hourly(:,2);
load OOI_MTBLK_MATS/ooi_metbk_v5m_hourly
V = ooi_metbk_hourly(:,2);

ooi_metbk_hourly(:,2) = sqrt(U.^2 + V.^2);
datest = find(xdatesfull>ooi_metbk_hourly(1,1),1);
datend = find(xdatesfull>ooi_metbk_hourly(end,1),1)-1;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(ooi_metbk_hourly(:,1),ooi_metbk_hourly(:,2),'LineWidth',lw,'Color',Color(c2,:))
hold on
grid on
ylabel('[m/s]')
title('Argentine Basin OOI METBK 5m wind speed','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([ooi_metbk_hourly(1,1) ooi_metbk_hourly(end,1)])
acc_plots_ctd
acc_movie
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest)+12,y1(1)+0.15*yrange,['mean 5m wind speed: ',...
    num2str(ooi_mean,3),' m/s'],'FontSize',16,'Color','k')
text(xdatesfull(datest)+12,y1(1)+0.10*yrange,['st dev of 5m wind speed: ',...
    num2str(ooi_std,3),' m/s'],'FontSize',16,'Color','k')
hold off
print('PLOTS/OOI_METBK_5mWNDSPD','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(ooi_metbk_hourly(:,2),35,'FaceColor',Color(c4,:),'EdgeColor',Color(c5,:))
xlabel('[m/s]')
title('Argentine Basin OOI METBK 5m wind speed','FontWeight','Normal')
acc_plots_ctd
acc_movie
print('PLOTS/OOI_METBK_5mWNDSPD_hist','-dpng')

close all
clear ooi_metbk_hourly
%% 18


toc()
