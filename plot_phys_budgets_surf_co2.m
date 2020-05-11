clear
close all
clc
tic()

load ../2020_01_January_analysis/Budgets_surf
load areas
load eratflx
load co2flx
load flux2
load BSOSE_flux
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
syr = 60*60*24*365.25;
gty = 31536000/1000000000000;
carbon_surf3 = syr*1000.*carbon_surf3./gty./12.0107;
carbon_surf6 = syr*1000.*carbon_surf6./gty./12.0107;
carbon_surf12 = syr*1000.*carbon_surf12./gty./12.0107;

carbon_surf3 = carbon_surf3./area3;
carbon_surf6 = carbon_surf6./area6;
carbon_surf12 = carbon_surf12./area12;

dates = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];
dates2 = [datenum('20170101','yyyymmdd'),datenum('20170201','yyyymmdd'),...
    datenum('20170301','yyyymmdd'),datenum('20170401','yyyymmdd'),...
    datenum('20170501','yyyymmdd'),datenum('20170601','yyyymmdd'),...
    datenum('20170701','yyyymmdd'),datenum('20170801','yyyymmdd'),...
    datenum('20170901','yyyymmdd'),datenum('20171001','yyyymmdd'),...
    datenum('20171101','yyyymmdd'),datenum('20171201','yyyymmdd'),...
    datenum('20180101','yyyymmdd')];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(dates,carbon_surf3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,carbon_surf6,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,carbon_surf12,'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,co2flx,'LineWidth',lw,'Color','k');
h14 = plot(dates,syr.*bscflx,'LineWidth',lw,'Color',Color(9,:));
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
acc_movie_w
acc_plots_ud(1)
title('2017 surface carbon flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',20)
legend([h10(1),h11(1),h12(1),h13(1),h14(1)],...
    '1/3 mean: 2.13 mol C/m^2/yr','1/6 mean: 2.12 mol C/m^2/yr','1/12 mean: 2.15 mol C/m^2/yr',...
    'Landschutzer mean: 1.96 mol C/m^2/yr','BSOSE mean: 0.88 mol C/m^2/yr',...
'Location','southeast','FontSize',17)
hold off


ax2 = subplot(2,1,2);
h10 = plot(dates,carbon_surf3 - co2flx,'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,carbon_surf6 - co2flx,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,carbon_surf12 - co2flx,'LineWidth',lw,'Color',Color(c12,:));
h14 = plot(dates,syr.*bscflx - co2flx,'LineWidth',lw,'Color',Color(9,:));
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
acc_movie_w
acc_plots_ud(2)
title('2017 surface carbon flux anomaly from Landschutzer [W/m^2]','FontWeight','Normal','FontSize',20)
legend([h10(1),h11(1),h12(1),h14(1)],...
    '1/3 - Landschutzer','1/6 - Landschutzer',...
    '1/12 - Landschutzer','BSOSE - Landschutzer',...
'Location','southeast','FontSize',17)
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','CO2_FLUX_ALL','-dpng')












toc()