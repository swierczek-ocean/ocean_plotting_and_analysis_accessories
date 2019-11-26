clear
close all
clc
tic()

acc_settings

load heat_inv3
load carbon_inv3
load nitrate_inv3
load phyto_inv3

load heat_inv6
load carbon_inv6
load nitrate_inv6
load phyto_inv6

load heat_inv12
load carbon_inv12
load nitrate_inv12
load phyto_inv12


%%
lw = 2.2;
ms = 20;
cb = 85;
cbd = 36;
c3 = 86;
c6 = 87;
c12 = 88;
xdatesfull = [datenum('20161201','yyyymmdd'),...
    datenum('20170101','yyyymmdd'),datenum('20170201','yyyymmdd'),...
    datenum('20170301','yyyymmdd'),datenum('20170401','yyyymmdd'),...
    datenum('20170501','yyyymmdd'),datenum('20170601','yyyymmdd'),...
    datenum('20170701','yyyymmdd'),datenum('20170801','yyyymmdd'),...
    datenum('20170901','yyyymmdd'),datenum('20171001','yyyymmdd'),...
    datenum('20171101','yyyymmdd'),datenum('20171201','yyyymmdd')];

time = datenum('20161201','yyyymmdd'):datenum('20171231','yyyymmdd');
%%

%% heat inventory
figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,heat_inv3_full,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,heat_inv6_full,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,heat_inv12_full,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[J]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin total heat inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_heat_inv_fd','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,heat_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,heat_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,heat_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[J]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin heat inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_heat_inv_ab','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,heat_inv3_box_abe,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,heat_inv6_box_abe,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,heat_inv12_box_abe,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[J]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin east heat inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_heat_inv_abe','-dpng')
%% heat inventory

%% carbon inventory
figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,(12.0107e-15).*carbon_inv3_full,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,(12.0107e-15).*carbon_inv6_full,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,(12.0107e-15).*carbon_inv12_full,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[Pg C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin total carbon inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_carbon_inv_fd','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,(12.0107e-15).*carbon_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,(12.0107e-15).*carbon_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,(12.0107e-15).*carbon_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[Pg C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin carbon inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_carbon_inv_ab','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,(12.0107e-15).*carbon_inv3_box_abe,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,(12.0107e-15).*carbon_inv6_box_abe,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,(12.0107e-15).*carbon_inv12_box_abe,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[Pg C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin east carbon inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_carbon_inv_abe','-dpng')
%% carbon inventory

%% nitrate inventory
figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,(28.014e-15).*nitrate_inv3_full,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,(28.014e-15).*nitrate_inv6_full,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,(28.014e-15).*nitrate_inv12_full,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[Pg N]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin total nitrate inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_nitrate_inv_fd','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,(28.014e-15).*nitrate_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,(28.014e-15).*nitrate_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,(28.014e-15).*nitrate_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[Pg N]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin nitrate inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_nitrate_inv_ab','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,(28.014e-15).*nitrate_inv3_box_abe,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,(28.014e-15).*nitrate_inv6_box_abe,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,(28.014e-15).*nitrate_inv12_box_abe,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[Pg N]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin east nitrate inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_nitrate_inv_abe','-dpng')
%% nitrate inventory

%% phyto inventory
figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,phyto_inv3_full,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,phyto_inv6_full,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,phyto_inv12_full,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[kg]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin total biomass inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_phyto_inv_fd','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,phyto_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,phyto_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,phyto_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[kg]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin biomass inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_phyto_inv_ab','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,phyto_inv3_box_abe,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,phyto_inv6_box_abe,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,phyto_inv12_box_abe,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[kg]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin east biomass inventory','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','INV_PLOTS/MITgcm_phyto_inv_abe','-dpng')
%% phyto inventory









toc()