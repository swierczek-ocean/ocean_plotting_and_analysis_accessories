clear
close all
clc
tic()

load ../2020_01_January_analysis/Budgets_surf
load areas
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;

gty = 31536000/1000000000000;
carbon_surf3 = 1000.*carbon_surf3./gty./12.0107;
carbon_surf6 = 1000.*carbon_surf6./gty./12.0107;
carbon_surf12 = 1000.*carbon_surf12./gty./12.0107;

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
h10 = plot(dates,heat_surf3./area3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,heat_surf6./area6,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12./area12,'LineWidth',lw,'Color',Color(c12,:));
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-1.2 1.4])
acc_movie_w
acc_plots_ud(1)
title('2017 surface heat flux [W/m^2]','FontWeight','Normal','FontSize',20)
legend([h10(1),h11(1),h12(1)],...
    '1/3 mean: 3.95 W/m^2','1/6 mean: 3.41 W/m^2','1/12 mean: -1.30 W/m^2',...
    'Location','southeast','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(dates,carbon_surf3./area3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,carbon_surf6./area6,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,carbon_surf12./area12,'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% % ylim([-8.5 9.5])
acc_movie_w
acc_plots_ud(2)
title('2017 surface carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',20)
legend([h10(1),h11(1),h12(1)],...
    '1/3 mean: 6.75e-8 mol C/m^2/s','1/6 mean: 6.71e-8 mol C/m^2/s','1/12 mean: 6.81e-8 mol C/m^2/s',...
    'Location','southeast','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_BUDGETS_surf_heat_DIC_2','-dpng')


toc()