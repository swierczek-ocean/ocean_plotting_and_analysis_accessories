clear
close all
clc
tic()

acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;

load volumes

load nitrate_inv3
load nitrate_inv6
load nitrate_inv12

scale312 = volume12/volume3;
scale612 = volume12/volume6;

dates = [datenum('20161201','yyyymmdd'),...
    datenum('20170101','yyyymmdd'),datenum('20170201','yyyymmdd'),...
    datenum('20170301','yyyymmdd'),datenum('20170401','yyyymmdd'),...
    datenum('20170501','yyyymmdd'),datenum('20170601','yyyymmdd'),...
    datenum('20170701','yyyymmdd'),datenum('20170801','yyyymmdd'),...
    datenum('20170901','yyyymmdd'),datenum('20171001','yyyymmdd'),...
    datenum('20171101','yyyymmdd'),datenum('20171201','yyyymmdd')];

time = datenum('20161201','yyyymmdd'):datenum('20171231','yyyymmdd');
xx = (1/1000000000000);

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h7 = plot(time,scale312*xx.*nitrate_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(time,scale612*xx.*nitrate_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(time,xx.*nitrate_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));

xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20161201','yyyymmdd') datenum('20171231','yyyymmdd')])
% ylim([-2.4 2])
title('2017 nitrate inventories [Gt N]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_INVENTORIES_ADJ_TIME_05_NO3','-dpng')

clear nitrate*

load oxygen_inv3
load oxygen_inv6
load oxygen_inv12

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h7 = plot(time,scale312*xx.*oxygen_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(time,scale612*xx.*oxygen_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(time,xx.*oxygen_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));

xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20161201','yyyymmdd') datenum('20171231','yyyymmdd')])
% ylim([-2.4 2])
title('2017 oxygen inventories [Gt O]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_INVENTORIES_ADJ_TIME_04_O2','-dpng')

clear oxygen*

load carbon_inv3
load carbon_inv6
load carbon_inv12

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h7 = plot(time,scale312*xx.*carbon_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(time,scale612*xx.*carbon_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(time,xx.*carbon_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));

xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20161201','yyyymmdd') datenum('20171231','yyyymmdd')])
% ylim([-2.4 2])
title('2017 carbon inventories [Gt C]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_INVENTORIES_ADJ_TIME_03_DIC','-dpng')

clear carbon*

load salt_inv3
load salt_inv6
load salt_inv12

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h7 = plot(time,scale312*salt_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(time,scale612*salt_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(time,salt_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));

xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20161201','yyyymmdd') datenum('20171231','yyyymmdd')])
% ylim([-2.4 2])
title('2017 salt inventories [kg salt]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_INVENTORIES_ADJ_TIME_02_SALT','-dpng')

clear salt*

load heat_inv3
load heat_inv6
load heat_inv12

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h7 = plot(time,scale312*heat_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(time,scale612*heat_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(time,heat_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));

xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20161201','yyyymmdd') datenum('20171231','yyyymmdd')])
% ylim([-2.4 2])
title('2017 heat inventories [J]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_INVENTORIES_ADJ_TIME_01_HEAT','-dpng')

clear heat*

load phyto_inv3
load phyto_inv6
load phyto_inv12

figure;
set(gcf, 'Position', [1, 1, 1500, 850])
h7 = plot(time,scale312*phyto_inv3_box_ab,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(time,scale612*phyto_inv6_box_ab,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(time,phyto_inv12_box_ab,'LineWidth',lw,'Color',Color(c12,:));

xticks(dates)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20161201','yyyymmdd') datenum('20171231','yyyymmdd')])
% ylim([-2.4 2])
title('2017 phytoplankton inventories [kg]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','AB_INVENTORIES_ADJ_TIME_07_PHYTO','-dpng')

clear phyto*






toc()