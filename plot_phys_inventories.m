clear
close all
clc
tic()

load Budgets3
load Budgets6
load Budgets12
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


figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-heat_E3(2:13)/(1e15),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-heat_E6(2:13)/(1e15),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-heat_E12(2:13)/(1e15),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-heat_N3(2:13)/(1e15),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-heat_N6(2:13)/(1e15),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-heat_N12(2:13)/(1e15),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,heat_S3(2:13)/(1e15),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,heat_S6(2:13)/(1e15),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,heat_S12(2:13)/(1e15),'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,heat_surf3(2:13)/(1e15),'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,heat_surf6(2:13)/(1e15),'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12(2:13)/(1e15),'b--o','LineWidth',lw,'Color',Color(c12,:));
text(dates(8),-2.5,'east','FontSize',18)
text(dates(5),-0.7,'surface','FontSize',18)
text(dates(3),1,'south','FontSize',18)
text(dates(4),2.06,'north','FontSize',18)
yline(0)
xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-3.1 2.4])
title('2017 boundary heat fluxes [PW] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','east')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_BUDGETS_TIME_01_HEAT','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-salt_E3(2:13),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-salt_E6(2:13),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-salt_E12(2:13),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-salt_N3(2:13),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-salt_N6(2:13),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-salt_N12(2:13),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,salt_S3(2:13),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,salt_S6(2:13),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,salt_S12(2:13),'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,salt_surf3(2:13),'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,salt_surf6(2:13),'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,salt_surf12(2:13),'b--o','LineWidth',lw,'Color',Color(c12,:));
text(dates(8),-5.8e9,'east','FontSize',18)
text(dates(6),-0.5e9,'surface','FontSize',18)
text(dates(3),4.5e9,'south','FontSize',18)
text(dates(5),2.2e9,'north','FontSize',18)
yline(0)
xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-6.3e9 5.1e9])
title('2017 boundary salt fluxes [kg/s] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_BUDGETS_TIME_02_SALT','-dpng')


xx = (31536000/1000000000000);

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-xx.*carbon_E3(2:13),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-xx.*carbon_E6(2:13),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-xx.*carbon_E12(2:13),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-xx.*carbon_N3(2:13),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-xx.*carbon_N6(2:13),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-xx.*carbon_N12(2:13),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,xx.*carbon_S3(2:13),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,xx.*carbon_S6(2:13),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,xx.*carbon_S12(2:13),'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,xx.*carbon_surf3(2:13),'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,xx.*carbon_surf6(2:13),'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,xx.*carbon_surf12(2:13),'b--o','LineWidth',lw,'Color',Color(c12,:));
text(dates(8),-130,'east','FontSize',18)
text(dates(6),-17,'surface','FontSize',18)
text(dates(3),110,'south','FontSize',18)
text(dates(5),60,'north','FontSize',18)
yline(0)
xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-160 130])
title('2017 boundary carbon fluxes [Gt C/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_BUDGETS_TIME_03_DIC','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-xx.*oxygen_E3(2:13),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-xx.*oxygen_E6(2:13),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-xx.*oxygen_E12(2:13),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-xx.*oxygen_N3(2:13),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-xx.*oxygen_N6(2:13),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-xx.*oxygen_N12(2:13),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,xx.*oxygen_S3(2:13),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,xx.*oxygen_S6(2:13),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,xx.*oxygen_S12(2:13),'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(dates,xx.*oxygen_surf3(2:13),'b--o','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,xx.*oxygen_surf6(2:13),'b--o','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,xx.*oxygen_surf12(2:13),'b--o','LineWidth',lw,'Color',Color(c12,:));
text(dates(8),-18,'east','FontSize',18)
text(dates(6),-1.9,'surface','FontSize',18)
text(dates(3),14,'south','FontSize',18)
text(dates(5),7,'north','FontSize',18)
yline(0)
xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-21 18])
title('2017 boundary oxygen fluxes [Gt O/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_BUDGETS_TIME_04_O2','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h1 = plot(dates,-xx.*nitrate_E3(2:13),'-.','LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,-xx.*nitrate_E6(2:13),'-.','LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,-xx.*nitrate_E12(2:13),'-.','LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates,-xx.*nitrate_N3(2:13),'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates,-xx.*nitrate_N6(2:13),'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates,-xx.*nitrate_N12(2:13),'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates,xx.*nitrate_S3(2:13),'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates,xx.*nitrate_S6(2:13),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates,xx.*nitrate_S12(2:13),'LineWidth',lw,'Color',Color(c12,:));
text(dates(8),-2,'east','FontSize',18)
text(dates(3),1.6,'south','FontSize',18)
text(dates(5),0.6,'north','FontSize',18)
yline(0)
xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-2.4 2])
title('2017 boundary nitrate fluxes [Gt N/yr] (positive means into the basin)','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_BUDGETS_TIME_05_NO3','-dpng')








toc()