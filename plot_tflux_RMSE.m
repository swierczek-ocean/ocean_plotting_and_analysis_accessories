clear
close all
clc
tic()

acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
load TFLX_RMSE


dates2 = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];


figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(dates2,eratflxrmse3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates2,eratflxrmse6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates2,eratflxrmse12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(dates2,sodatflxrmse3,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(dates2,sodatflxrmse6,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(dates2,sodatflxrmse12,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(dates2,eccotflxrmse3,':','LineWidth',lw,'Color',Color(c3,:));
h8 = plot(dates2,eccotflxrmse6,':','LineWidth',lw,'Color',Color(c6,:));
h9 = plot(dates2,eccotflxrmse12,':','LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mm/yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
title('model heat flux RMSE [W/m^2]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
    '1/3 - ERA5','1/6 - ERA5','1/12 - ERA5',...
    '1/3 - SODA3','1/6 - SODA3','1/12 - SODA3',...
    '1/3 - ECCO4','1/6 - ECCO4','1/12 - ECCO4',...
    'Location','northeast','FontSize',18)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','TFLUX_RMSE','-dpng')









toc()