clear
close all
clc
tic()

load MEAN_ARGO

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
h10 = plot(MEAN3(:,1),MEAN3(:,9),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,9),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,9),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 0-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,9),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,9),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,9),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 0-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_1','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,10),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,10),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,10),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 1000-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,10),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,10),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,10),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 1000-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_2','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,11),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,11),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,11),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 0-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,11),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,11),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,11),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 0-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_3','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,2),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,2),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,2),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 0-200m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,2),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,2),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,2),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 0-200m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_4','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,3),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,3),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,3),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 200-400m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,3),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,3),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,3),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 200-400m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_5','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,4),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,4),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,4),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 400-600m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,4),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,4),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,4),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 400-600m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_6','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,5),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,5),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,5),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 600-800m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,5),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,5),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,5),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 600-800m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_7','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,6),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,6),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,6),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 800-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,6),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,6),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,6),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 800-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_8','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,7),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,7),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,7),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 1000-1500m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,7),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,7),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,7),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 1000-1500m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_9','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,8),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,8),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,8),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 1500-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,8),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,8),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,8),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 1500-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfit_T_10','-dpng')

close all


clear

load MEAN_ARGO_lg

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
h10 = plot(MEAN3(:,1),MEAN3(:,9),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,9),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,9),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 0-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,9),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,9),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,9),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 0-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_1','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,10),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,10),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,10),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 1000-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,10),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,10),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,10),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 1000-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_2','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,11),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,11),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,11),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 0-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,11),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,11),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,11),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 0-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_3','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,2),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,2),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,2),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 0-200m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,2),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,2),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,2),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 0-200m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_4','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,3),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,3),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,3),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 200-400m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,3),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,3),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,3),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 200-400m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_5','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,4),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,4),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,4),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 400-600m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,4),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,4),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,4),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 400-600m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_6','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,5),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,5),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,5),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 600-800m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,5),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,5),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,5),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 600-800m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_7','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,6),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,6),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,6),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 800-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,6),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,6),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,6),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 800-1000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_8','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,7),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,7),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,7),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 1000-1500m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,7),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,7),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,7),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 1000-1500m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_9','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h10 = plot(MEAN3(:,1),MEAN3(:,8),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(MEAN6(:,1),MEAN6(:,8),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(MEAN12(:,1),MEAN12(:,8),'LineWidth',lw,'Color',Color(c12,:));
yline(0)
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(1)
title('2017 mean Argo potential temperature misfit 1500-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off

ax2 = subplot(2,1,2);
h10 = plot(SD3(:,1),SD3(:,8),'LineWidth',lw,'Color',Color(c3,:));
hold on
h11 = plot(SD6(:,1),SD6(:,8),'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(SD12(:,1),SD12(:,8),'LineWidth',lw,'Color',Color(c12,:));
grid on
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
legend([h10(1),h11(1),h12(1)],'1/3','1/6','1/12','Location','northeast','FontSize',20)
acc_movie_w
acc_plots_ud(2)
title('2017 standard deviation of Argo potential temperature misfit 1500-2000m [deg C]','FontWeight','Normal','FontSize',20)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','argo/mean_misfitlg_T_10','-dpng')

close all

clear

toc()