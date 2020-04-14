clear
close all
clc
tic()

load hpc/Budgets3_60m
load hpc/Budgets6_60m
load hpc/Budgets12_60m
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
set(gcf, 'Position', [1, 1, 1500, 850])
h10 = plot(dates,heat_surf3/(1e15),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,heat_surf6/(1e15),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12/(1e15),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-1.2 1.4])
title('2017 surface heat flux [PW]','FontWeight','Normal','FontSize',18)
legend([h10(1),h11(1),h12(1)],...
    '1/3','1/6','1/12',...
    'Location','southeast','FontSize',20)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_surf_01_HEAT','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h10 = plot(dates,salt_surf3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,salt_surf6,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,salt_surf12,'LineWidth',lw,'Color',Color(c12,:));
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-3.5e8 4e8])
title('2017 surface salt flux [kg/s]','FontWeight','Normal','FontSize',18)
legend([h10(1),h11(1),h12(1)],...
    '1/3','1/6','1/12',...
    'Location','best','FontSize',18)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_surf_02_SALT','-dpng')



figure()
set(gcf, 'Position', [1, 1, 1500, 850])
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
title('2017 surface carbon flux [Gt C/yr]','FontWeight','Normal','FontSize',18)
legend([h10(1),h11(1),h12(1)],...
    '1/3','1/6','1/12',...
    'Location','southeast','FontSize',20)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_surf_03_DIC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h10 = plot(dates,oxygen_surf3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(dates,oxygen_surf6,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,oxygen_surf12,'LineWidth',lw,'Color',Color(c12,:));
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-3 2])
title('2017 surface oxygen flux [Gt O/yr]','FontWeight','Normal','FontSize',18)
legend([h10(1),h11(1),h12(1)],...
    '1/3','1/6','1/12',...
    'Location','best','FontSize',18)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_surf_04_O2','-dpng')



close all



close all


toc()