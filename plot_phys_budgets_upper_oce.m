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
h1 = plot(dates,-volume_E3./(1e6),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-volume_E6./(1e6),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-volume_E12./(1e6),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-volume_N3./(1e6),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-volume_N6./(1e6),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-volume_N12./(1e6),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,volume_S3./(1e6),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,volume_S6./(1e6),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,volume_S12./(1e6),'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,volume_Bot3./(1e6),':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,volume_Bot6./(1e6),':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,volume_Bot12./(1e6),':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-8,'east','FontSize',18)
text(dates(2),9.5,'south','FontSize',18)
text(dates(3),3,'north','FontSize',18)
text(dates(8),-3,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-10 11])
title('2017 boundary volume fluxes in upper 60m [Sv] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_60m_00_VOLUME','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-heat_E3/(1e15),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-heat_E6/(1e15),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-heat_E12/(1e15),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-heat_N3/(1e15),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-heat_N6/(1e15),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-heat_N12/(1e15),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,heat_S3/(1e15),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,heat_S6/(1e15),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,heat_S12/(1e15),'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,heat_surf3/(1e15),'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,heat_surf6/(1e15),'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12/(1e15),'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,heat_Bot3/(1e15),':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,heat_Bot6/(1e15),':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,heat_Bot12./(1e15),':','LineWidth',lw,'Color',Color(c12,:));
text(dates(11),-0.45,'east','FontSize',18)
text(dates(5),-0.8,'surface','FontSize',18)
text(dates(6),0.2,'south','FontSize',18)
text(dates(1),0.4,'north','FontSize',18)
text(dates(6),0.6,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-1.2 1.4])
title('2017 boundary heat fluxes in upper 60m [PW] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_60m_01_HEAT','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-salt_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-salt_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-salt_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-salt_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-salt_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-salt_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,salt_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,salt_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,salt_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,salt_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,salt_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,salt_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,salt_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,salt_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,salt_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-2.7e8,'east','FontSize',18)
text(dates(8),-0.3e8,'surface','FontSize',18)
text(dates(2),3.2e8,'south','FontSize',18)
text(dates(3),1.3e8,'north','FontSize',18)
text(dates(3),-0.8e8,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-3.5e8 4e8])
title('2017 boundary salt fluxes in upper 60m [kg/s] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_60m_02_SALT','-dpng')



figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-carbon_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-carbon_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-carbon_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-carbon_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-carbon_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-carbon_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,carbon_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,carbon_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,carbon_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,carbon_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,carbon_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,carbon_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,carbon_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,carbon_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,carbon_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-6,'east','FontSize',18)
text(dates(8),-0.5,'surface','FontSize',18)
text(dates(2),8,'south','FontSize',18)
text(dates(3),3,'north','FontSize',18)
text(dates(3),-1.3,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-8.5 9.5])
title('2017 boundary carbon fluxes in upper 60m [Gt C/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_60m_03_DIC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-oxygen_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-oxygen_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-oxygen_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-oxygen_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-oxygen_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-oxygen_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,oxygen_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,oxygen_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,oxygen_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,oxygen_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,oxygen_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,oxygen_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,oxygen_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,oxygen_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,oxygen_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(7),-1,'east','FontSize',18)
text(dates(11),-2.4,'surface','FontSize',18)
text(dates(2),1.65,'south','FontSize',18)
text(dates(2),0.5,'north','FontSize',18)
text(dates(6)+10,-2.2,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-3 2])
title('2017 boundary oxygen fluxes in upper 60m [Gt O/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_60m_04_O2','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-nitrate_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-nitrate_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-nitrate_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-nitrate_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-nitrate_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-nitrate_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,nitrate_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,nitrate_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,nitrate_S12,'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,nitrate_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,nitrate_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,nitrate_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(6),-0.045,'east','FontSize',18)
text(dates(7),0.1,'south','FontSize',18)
text(dates(3),0.01,'north','FontSize',18)
text(dates(8),0.045,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-0.08 0.12])
title('2017 boundary nitrate fluxes in upper 60m [Gt N/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_60m_05_NO3','-dpng')

close all


clear
close all
clc
tic()

load hpc/Budgets3_100m
load hpc/Budgets6_100m
load hpc/Budgets12_100m
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
h1 = plot(dates,-volume_E3./(1e6),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-volume_E6./(1e6),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-volume_E12./(1e6),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-volume_N3./(1e6),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-volume_N6./(1e6),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-volume_N12./(1e6),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,volume_S3./(1e6),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,volume_S6./(1e6),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,volume_S12./(1e6),'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,volume_Bot3./(1e6),':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,volume_Bot6./(1e6),':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,volume_Bot12./(1e6),':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-12.5,'east','FontSize',18)
text(dates(4),11,'south','FontSize',18)
text(dates(3),5,'north','FontSize',18)
text(dates(8),-3,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-16 16])
title('2017 boundary volume fluxes in upper 100m [Sv] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_100m_00_VOLUME','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-heat_E3/(1e15),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-heat_E6/(1e15),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-heat_E12/(1e15),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-heat_N3/(1e15),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-heat_N6/(1e15),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-heat_N12/(1e15),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,heat_S3/(1e15),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,heat_S6/(1e15),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,heat_S12/(1e15),'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,heat_surf3/(1e15),'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,heat_surf6/(1e15),'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12/(1e15),'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,heat_Bot3/(1e15),':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,heat_Bot6/(1e15),':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,heat_Bot12./(1e15),':','LineWidth',lw,'Color',Color(c12,:));
text(dates(11),-0.55,'east','FontSize',18)
text(dates(5)+10,-0.85,'surface','FontSize',18)
text(dates(1),0.2,'south','FontSize',18)
text(dates(1),0.5,'north','FontSize',18)
text(dates(6)-15,-0.1,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-1.2 1.45])
title('2017 boundary heat fluxes in upper 100m [PW] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_100m_01_HEAT','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-salt_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-salt_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-salt_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-salt_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-salt_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-salt_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,salt_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,salt_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,salt_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,salt_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,salt_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,salt_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,salt_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,salt_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,salt_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-4.5e8,'east','FontSize',18)
text(dates(8),-0.3e8,'surface','FontSize',18)
text(dates(2),3.8e8,'south','FontSize',18)
text(dates(3),2e8,'north','FontSize',18)
text(dates(3),-0.8e8,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-6e8 5.6e8])
title('2017 boundary salt fluxes in upper 100m [kg/s] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_100m_02_SALT','-dpng')



figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-carbon_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-carbon_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-carbon_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-carbon_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-carbon_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-carbon_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,carbon_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,carbon_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,carbon_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,carbon_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,carbon_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,carbon_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,carbon_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,carbon_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,carbon_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-10,'east','FontSize',18)
text(dates(8),-0.5,'surface','FontSize',18)
text(dates(2),9,'south','FontSize',18)
text(dates(3),4.1,'north','FontSize',18)
text(dates(3),-1.9,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-13.5 12.5])
title('2017 boundary carbon fluxes in upper 100m [Gt C/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_100m_03_DIC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-oxygen_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-oxygen_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-oxygen_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-oxygen_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-oxygen_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-oxygen_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,oxygen_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,oxygen_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,oxygen_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,oxygen_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,oxygen_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,oxygen_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,oxygen_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,oxygen_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,oxygen_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(5),-2.2,'east','FontSize',18)
text(dates(9)-10,1,'surface','FontSize',18)
text(dates(2),1.65,'south','FontSize',18)
text(dates(2),0.7,'north','FontSize',18)
text(dates(6)+20,-1,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-3 2.5])
title('2017 boundary oxygen fluxes in upper 100m [Gt O/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_100m_04_O2','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-nitrate_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-nitrate_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-nitrate_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-nitrate_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-nitrate_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-nitrate_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,nitrate_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,nitrate_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,nitrate_S12,'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,nitrate_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,nitrate_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,nitrate_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(6),-0.075,'east','FontSize',18)
text(dates(7),0.12,'south','FontSize',18)
text(dates(3),-0.015,'north','FontSize',18)
text(dates(8),0.055,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-0.12 0.165])
title('2017 boundary nitrate fluxes in upper 100m [Gt N/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_100m_05_NO3','-dpng')

close all


clear
close all
clc
tic()

load hpc/Budgets3_190m
load hpc/Budgets6_190m
load hpc/Budgets12_190m
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
h1 = plot(dates,-volume_E3./(1e6),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-volume_E6./(1e6),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-volume_E12./(1e6),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-volume_N3./(1e6),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-volume_N6./(1e6),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-volume_N12./(1e6),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,volume_S3./(1e6),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,volume_S6./(1e6),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,volume_S12./(1e6),'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,volume_Bot3./(1e6),':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,volume_Bot6./(1e6),':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,volume_Bot12./(1e6),':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-23,'east','FontSize',18)
text(dates(4),18,'south','FontSize',18)
text(dates(3),9,'north','FontSize',18)
text(dates(8),-2,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-30 26])
title('2017 boundary volume fluxes in upper 190m [Sv] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_190m_00_VOLUME','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-heat_E3/(1e15),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-heat_E6/(1e15),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-heat_E12/(1e15),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-heat_N3/(1e15),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-heat_N6/(1e15),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-heat_N12/(1e15),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,heat_S3/(1e15),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,heat_S6/(1e15),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,heat_S12/(1e15),'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,heat_surf3/(1e15),'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,heat_surf6/(1e15),'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12/(1e15),'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,heat_Bot3/(1e15),':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,heat_Bot6/(1e15),':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,heat_Bot12./(1e15),':','LineWidth',lw,'Color',Color(c12,:));
text(dates(11),-0.55,'east','FontSize',18)
text(dates(4),-0.5,'surface','FontSize',18)
text(dates(1),0.35,'south','FontSize',18)
text(dates(1),0.6,'north','FontSize',18)
text(dates(6)-15,-0.1,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-1.2 1.45])
title('2017 boundary heat fluxes in upper 190m [PW] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_190m_01_HEAT','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-salt_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-salt_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-salt_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-salt_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-salt_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-salt_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,salt_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,salt_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,salt_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,salt_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,salt_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,salt_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,salt_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,salt_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,salt_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-0.8e9,'east','FontSize',18)
text(dates(8),-0.6e8,'surface','FontSize',18)
text(dates(3),0.65e9,'south','FontSize',18)
text(dates(3),0.35e9,'north','FontSize',18)
text(dates(3),-1.7e8,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-1e9 0.9e9])
title('2017 boundary salt fluxes in upper 190m [kg/s] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_190m_02_SALT','-dpng')



figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-carbon_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-carbon_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-carbon_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-carbon_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-carbon_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-carbon_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,carbon_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,carbon_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,carbon_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,carbon_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,carbon_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,carbon_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,carbon_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,carbon_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,carbon_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-18.5,'east','FontSize',18)
text(dates(8),-1,'surface','FontSize',18)
text(dates(2),15.5,'south','FontSize',18)
text(dates(3),7.5,'north','FontSize',18)
text(dates(3),-2.6,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-24 22])
title('2017 boundary carbon fluxes in upper 190m [Gt C/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_190m_03_DIC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-oxygen_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-oxygen_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-oxygen_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-oxygen_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-oxygen_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-oxygen_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,oxygen_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,oxygen_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,oxygen_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,oxygen_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,oxygen_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,oxygen_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,oxygen_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,oxygen_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,oxygen_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-3.2,'east','FontSize',18)
text(dates(8)+8,1.4,'surface','FontSize',18)
text(dates(4),3,'south','FontSize',18)
text(dates(2),1.2,'north','FontSize',18)
text(dates(6)+20,-1.2,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-4.5 4])
title('2017 boundary oxygen fluxes in upper 190m [Gt O/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_190m_04_O2','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-nitrate_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-nitrate_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-nitrate_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-nitrate_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-nitrate_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-nitrate_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,nitrate_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,nitrate_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,nitrate_S12,'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,nitrate_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,nitrate_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,nitrate_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(6),-0.15,'east','FontSize',18)
text(dates(7),0.21,'south','FontSize',18)
text(dates(2),0.03,'north','FontSize',18)
text(dates(2),-0.035,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-0.23 0.28])
title('2017 boundary nitrate fluxes in upper 190m [Gt N/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_190m_05_NO3','-dpng')

close all


clear
close all
clc
tic()

load hpc/Budgets3_250m
load hpc/Budgets6_250m
load hpc/Budgets12_250m
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
h1 = plot(dates,-volume_E3./(1e6),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-volume_E6./(1e6),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-volume_E12./(1e6),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-volume_N3./(1e6),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-volume_N6./(1e6),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-volume_N12./(1e6),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,volume_S3./(1e6),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,volume_S6./(1e6),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,volume_S12./(1e6),'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,volume_Bot3./(1e6),':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,volume_Bot6./(1e6),':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,volume_Bot12./(1e6),':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-29.5,'east','FontSize',18)
text(dates(4),23,'south','FontSize',18)
text(dates(3),11,'north','FontSize',18)
text(dates(10),-2,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-38 32])
title('2017 boundary volume fluxes in upper 250m [Sv] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_250m_00_VOLUME','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-heat_E3/(1e15),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-heat_E6/(1e15),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-heat_E12/(1e15),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-heat_N3/(1e15),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-heat_N6/(1e15),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-heat_N12/(1e15),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,heat_S3/(1e15),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,heat_S6/(1e15),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,heat_S12/(1e15),'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,heat_surf3/(1e15),'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,heat_surf6/(1e15),'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12/(1e15),'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,heat_Bot3/(1e15),':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,heat_Bot6/(1e15),':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,heat_Bot12./(1e15),':','LineWidth',lw,'Color',Color(c12,:));
text(dates(11),-0.8,'east','FontSize',18)
text(dates(4),-0.5,'surface','FontSize',18)
text(dates(1),0.43,'south','FontSize',18)
text(dates(4),0.8,'north','FontSize',18)
text(dates(6)-15,-0.1,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-1.2 1.45])
title('2017 boundary heat fluxes in upper 250m [PW] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_250m_01_HEAT','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-salt_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-salt_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-salt_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-salt_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-salt_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-salt_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,salt_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,salt_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,salt_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,salt_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,salt_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,salt_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,salt_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,salt_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,salt_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-1.05e9,'east','FontSize',18)
text(dates(3),0.1e9,'surface','FontSize',18)
text(dates(3),0.8e9,'south','FontSize',18)
text(dates(3),0.5e9,'north','FontSize',18)
text(dates(3),-1.7e8,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-1.4e9 1.15e9])
title('2017 boundary salt fluxes in upper 250m [kg/s] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_250m_02_SALT','-dpng')



figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-carbon_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-carbon_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-carbon_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-carbon_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-carbon_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-carbon_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,carbon_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,carbon_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,carbon_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,carbon_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,carbon_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,carbon_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,carbon_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,carbon_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,carbon_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-25,'east','FontSize',18)
text(dates(3),2,'surface','FontSize',18)
text(dates(3),19,'south','FontSize',18)
text(dates(3),10,'north','FontSize',18)
text(dates(3),-3,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-30 26])
title('2017 boundary carbon fluxes in upper 250m [Gt C/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_250m_03_DIC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-oxygen_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-oxygen_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-oxygen_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-oxygen_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-oxygen_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-oxygen_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,oxygen_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,oxygen_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,oxygen_S12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,oxygen_surf3,'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,oxygen_surf6,'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,oxygen_surf12,'b--o','LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,oxygen_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,oxygen_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,oxygen_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(3),-4,'east','FontSize',18)
text(dates(7),2.1,'surface','FontSize',18)
text(dates(4),3.7,'south','FontSize',18)
text(dates(2),1.5,'north','FontSize',18)
text(dates(6),-0.6,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-5.3 5])
title('2017 boundary oxygen fluxes in upper 250m [Gt O/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1),h10(1),h11(1),h12(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    '1/3 surf','1/6 surf','1/12 surf',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_250m_04_O2','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-nitrate_E3,'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-nitrate_E6,'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-nitrate_E12,'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-nitrate_N3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-nitrate_N6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-nitrate_N12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,nitrate_S3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,nitrate_S6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,nitrate_S12,'LineWidth',lw,'Color',Color(c12,:));
h13 = plot(dates,nitrate_Bot3,':','LineWidth',lw,'Color',Color(c3,:));
h14 = plot(dates,nitrate_Bot6,':','LineWidth',lw,'Color',Color(c6,:));
h15 = plot(dates,nitrate_Bot12,':','LineWidth',lw,'Color',Color(c12,:));
text(dates(6),-0.22,'east','FontSize',18)
text(dates(6),0.28,'south','FontSize',18)
text(dates(2),0.04,'north','FontSize',18)
text(dates(2),-0.04,'bottom','FontSize',18)
yline(0)
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-0.3 0.34])
title('2017 boundary nitrate fluxes in upper 250m [Gt N/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h13(1),h14(1),h15(1)],...
    '1/3 east','1/6 east','1/12 east','1/3 north',...
    '1/6 north','1/12 north','1/3 south','1/6 south',...
    '1/12 south','1/3 bottom','1/6 bottom','1/12 bottom',...
    'Location','eastoutside')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','Budgets/AB_BUDGETS_250m_05_NO3','-dpng')

close all


toc()