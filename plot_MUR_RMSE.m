clear
close all
clc
tic()

acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
load RMSE_MUR

numdate = datenum('01012017','mmddyyyy');

dates1 = numdate:(numdate+364);
dates2 = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];


figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h7 = plot(dates1,sstrmse3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(dates1,sstrmse6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates1,sstrmse12,'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
title('model RMSE with MUR SST [deg C]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','northeast','FontSize',18)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','MUR_RMSE','-dpng')









toc()