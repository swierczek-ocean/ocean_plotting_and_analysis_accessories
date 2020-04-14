clear
close all
clc
tic()

load Budgets_surf
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;

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
h10 = plot(dates,heat_surf3/(1e15),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,heat_surf6/(1e15),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12/(1e15),'LineWidth',lw,'Color',Color(c12,:));
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
title('2017 surface heat flux [PW]','FontWeight','Normal','FontSize',20)
legend([h10(1),h11(1),h12(1)],...
    '1/3 mean: 0.032 PW','1/6 mean: 0.027 PW','1/12 mean: -0.010 PW',...
    'Location','southeast','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(dates,carbon_surf3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,carbon_surf6,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,carbon_surf12,'LineWidth',lw,'Color',Color(c12,:));
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
title('2017 surface carbon flux [Gt C/yr]','FontWeight','Normal','FontSize',20)
legend([h10(1),h11(1),h12(1)],...
    '1/3 mean: 0.21 Gt C/yr','1/6 mean: 0.20 Gt C/yr','1/12 mean: 0.20 Gt C/yr',...
    'Location','southeast','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_surf_heat_DIC','-dpng')


toc()