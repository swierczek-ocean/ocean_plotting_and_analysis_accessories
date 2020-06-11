clear
close all
clc
tic()

load RMSE_ARGO

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
h10 = plot(RMSE3(:,1),RMSE3(:,9),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,9),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,9),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 RMSE of Argo potential temperature misfit 0-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(RMSE3(:,1),RMSE3(:,10),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,10),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,10),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 RMSE of Argo potential temperature misfit 1000-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/rmse_misfit_T_1','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(RMSE3(:,1),RMSE3(:,2),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,2),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,2),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 RMSE of Argo potential temperature misfit 0-200m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(RMSE3(:,1),RMSE3(:,3),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,3),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,3),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 RMSE of Argo potential temperature misfit 200-400m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/rmse_misfit_T_2','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(RMSE3(:,1),RMSE3(:,4),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,4),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,4),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 RMSE of Argo potential temperature misfit 400-600m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(RMSE3(:,1),RMSE3(:,5),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,5),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,5),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 RMSE of Argo potential temperature misfit 600-800m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/rmse_misfit_T_3','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(RMSE3(:,1),RMSE3(:,6),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,6),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,6),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 RMSE of Argo potential temperature misfit 800-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(RMSE3(:,1),RMSE3(:,7),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,7),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,7),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 RMSE of Argo potential temperature misfit 1000-1500m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/rmse_misfit_T_4','-dpng')

close all

clear

load RMSE_ARGO_lg

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
h10 = plot(RMSE3(:,1),RMSE3(:,9),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,9),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,9),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 RMSE of Argo potential temperature misfit 0-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(RMSE3(:,1),RMSE3(:,10),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,10),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,10),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 RMSE of Argo potential temperature misfit 1000-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/rmse_misfitlg_T_1','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(RMSE3(:,1),RMSE3(:,2),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,2),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,2),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 RMSE of Argo potential temperature misfit 0-200m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(RMSE3(:,1),RMSE3(:,3),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,3),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,3),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 RMSE of Argo potential temperature misfit 200-400m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/rmse_misfitlg_T_2','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(RMSE3(:,1),RMSE3(:,4),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,4),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,4),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 RMSE of Argo potential temperature misfit 400-600m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(RMSE3(:,1),RMSE3(:,5),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,5),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,5),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 RMSE of Argo potential temperature misfit 600-800m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/rmse_misfitlg_T_3','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(RMSE3(:,1),RMSE3(:,6),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,6),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,6),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 RMSE of Argo potential temperature misfit 800-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(RMSE3(:,1),RMSE3(:,7),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(RMSE6(:,1),RMSE6(:,7),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(RMSE12(:,1),RMSE12(:,7),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 RMSE of Argo potential temperature misfit 1000-1500m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/rmse_misfitlg_T_4','-dpng')

close all




% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% ax1 = subplot(2,1,1);
% h1 = plot(RMSE3(:,1),RMSE3(:,2),'LineWidth',lw,'Color',Color(c3,:));
% hold on
% h2 = plot(RMSE6(:,1),RMSE6(:,2),'LineWidth',lw,'Color',Color(c6,:));
% h3 = plot(RMSE12(:,1),RMSE12(:,2),'LineWidth',lw,'Color',Color(c12,:));
% h4 = plot(RMSE3(:,1),RMSE3(:,3),'--','LineWidth',lw,'Color',Color(c3,:));
% h5 = plot(RMSE6(:,1),RMSE6(:,3),'--','LineWidth',lw,'Color',Color(c6,:));
% h6 = plot(RMSE12(:,1),RMSE12(:,3),'--','LineWidth',lw,'Color',Color(c12,:));
% h7 = plot(RMSE3(:,1),RMSE3(:,4),'-.','LineWidth',lw,'Color',Color(c3,:));
% h8 = plot(RMSE6(:,1),RMSE6(:,4),'-.','LineWidth',lw,'Color',Color(c6,:));
% h9 = plot(RMSE12(:,1),RMSE12(:,4),'-.','LineWidth',lw,'Color',Color(c12,:));
% h10 = plot(RMSE3(:,1),RMSE3(:,5),':','LineWidth',lw,'Color',Color(c3,:));
% h11 = plot(RMSE6(:,1),RMSE6(:,5),':','LineWidth',lw,'Color',Color(c6,:));
% h12 = plot(RMSE12(:,1),RMSE12(:,5),':','LineWidth',lw,'Color',Color(c12,:));
% h13 = plot(RMSE3(:,1),RMSE3(:,6),'--o','LineWidth',lw,'Color',Color(c3,:));
% h14 = plot(RMSE6(:,1),RMSE6(:,6),'--o','LineWidth',lw,'Color',Color(c6,:));
% h15 = plot(RMSE12(:,1),RMSE12(:,6),'--o','LineWidth',lw,'Color',Color(c12,:));
% grid on
% xticks(dates2)
% dateFormat = 'mmm yyyy';
% datetick('x',dateFormat,'keepticks')
% xticklabels({})
% xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),...
%     h9(1),h10(1),h11(1),h12(1),h13(1),h14(1),h15(1)],...
%     '1/3 0-200m','1/6 0-200m','1/12 0-200m',...
%     '1/3 200-400m','1/6 200-400m','1/12 200-400m',...
%     '1/3 400-600m','1/6 400-600m','1/12 400-600m',...
%     '1/3 600-800m','1/6 600-800m','1/12 600-800m',...
%     '1/3 800-1000m','1/6 800-1000m','1/12 800-1000m',...
%     'Location','eastoutside','FontSize',20)
% acc_movie_w
% acc_plots_ud(1)
% title('2017 RMSE of Argo potential temperature misfit 0-1000m [deg C]','FontWeight','Normal','FontSize',20)
% hold off
% 
% ax2 = subplot(2,1,2);
% h10 = plot(RMSE3(:,1),RMSE3(:,9),'LineWidth',lw,'Color',Color(c3,:));
% hold on
% h11 = plot(RMSE6(:,1),RMSE6(:,9),'LineWidth',lw,'Color',Color(c6,:));
% h12 = plot(RMSE12(:,1),RMSE12(:,9),'LineWidth',lw,'Color',Color(c12,:));
% h13 = plot(RMSE3(:,1),RMSE3(:,10),'--','LineWidth',lw,'Color',Color(c3,:));
% h14 = plot(RMSE6(:,1),RMSE6(:,10),'--','LineWidth',lw,'Color',Color(c6,:));
% h15 = plot(RMSE12(:,1),RMSE12(:,10),'--','LineWidth',lw,'Color',Color(c12,:));
% grid on
% xticks(dates2)
% dateFormat = 'mmm yyyy';
% datetick('x',dateFormat,'keepticks')
% xtickangle(45)
% xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% legend([h10(1),h11(1),h12(1),h13(1),h14(1),h15(1)],...
%     '1/3 1000-1500m','1/6 1000-1500m','1/12 1000-1500m',...
%     '1/3 1500-2000m','1/6 1500-2000m','1/12 1500-2000m',...
%     'Location','southeastoutside','FontSize',20)
% acc_movie_w
% acc_plots_ud(2)
% title('2017 RMSE of Argo potential temperature misfit 1000-2000m [deg C]','FontWeight','Normal','FontSize',20)
% hold off
% set(gcf,'InvertHardCopy','off'); 
% print('-r200','argo/rmse_misfit_T_10','-dpng')









toc()