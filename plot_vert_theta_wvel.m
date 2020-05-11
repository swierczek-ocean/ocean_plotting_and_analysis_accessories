clear
close all
clc
tic()

%%
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
alpha = 0.8;
%%

%%
% load VERT_3_2000 vert_wvel_3 vert_theta_3 RC3 RF3
% load VERT_6_2000 vert_wvel_6 vert_theta_6 RC6 RF6
% load VERT_12_2000 vert_wvel_12 vert_theta_12 RC12 RF12
load vert_wvel_theta_dic
load ODA_wt
load rgt
load woa_t
load anomalies
depth = -depth;
depthrg = -depthrg;
%%

%% plot
yfull = [-6000 15];
y500 = [-500 10];
y1000 = [-1000 10];
y250 = [-255 10];
y2000 = [-2000 10];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(theta320,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(theta620,RC3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(theta1220,RC3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(rgt,depthrg,'LineWidth',lw,'Color','k');
h5 = plot(odat,RCt,'--','LineWidth',lw,'Color','k');
h6 = plot(woa_t,depth,':','LineWidth',lw,'Color','k');
yline(0)
grid on
title('temperature profile','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
'1/3','1/6','1/12','R&G Argo','GFDL ODA','WOA18',...
'FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(anomt3,depths,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(anomt6,depths,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(anomt12,depths,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(anomrgt,depths,'LineWidth',lw,'Color','k');
h5 = plot(anomodat,depths,'--','LineWidth',lw,'Color','k');
h6 = plot(anomwoat,depths,':','LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('temperature anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylim(y500)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
'1/3','1/6','1/12','R&G Argo','GFDL ODA','WOA18',...
'FontSize',20,'Location','north')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_new/mean_vert_temp_all_500','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(wvel320,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(wvel620,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(wvel1220,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(odaw,RFt,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity profile','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12','GFDL ODA',...
'FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(anomw3,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(anomw6,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(anomw12,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(anomodaw,RF3,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylim(y500)
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12','GFDL ODA',...
'FontSize',20,'Location','north')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_new/mean_vert_wvel_all_500','-dpng')



figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(theta320,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(theta620,RC3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(theta1220,RC3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(rgt,depthrg,'LineWidth',lw,'Color','k');
h5 = plot(odat,RCt,'--','LineWidth',lw,'Color','k');
h6 = plot(woa_t,depth,':','LineWidth',lw,'Color','k');
yline(0)
grid on
title('temperature profile','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
ylim(y250)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
'1/3','1/6','1/12','R&G Argo','GFDL ODA','WOA18',...
'FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(anomt3,depths,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(anomt6,depths,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(anomt12,depths,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(anomrgt,depths,'LineWidth',lw,'Color','k');
h5 = plot(anomodat,depths,'--','LineWidth',lw,'Color','k');
h6 = plot(anomwoat,depths,':','LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('temperature anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylim(y250)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
'1/3','1/6','1/12','R&G Argo','GFDL ODA','WOA18',...
'FontSize',20,'Location','north')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_new/mean_vert_temp_all_250','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(wvel320,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(wvel620,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(wvel1220,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(odaw,RFt,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity profile','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylabel('depth [m]')
ylim(y250)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12','GFDL ODA',...
'FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(anomw3,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(anomw6,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(anomw12,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(anomodaw,RF3,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylim(y250)
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12','GFDL ODA',...
'FontSize',20,'Location','north')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_new/mean_vert_wvel_all_250','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(theta320,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(theta620,RC3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(theta1220,RC3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(rgt,depthrg,'LineWidth',lw,'Color','k');
h5 = plot(odat,RCt,'--','LineWidth',lw,'Color','k');
h6 = plot(woa_t,depth,':','LineWidth',lw,'Color','k');
yline(0)
grid on
title('temperature profile','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
'1/3','1/6','1/12','R&G Argo','GFDL ODA','WOA18',...
'FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(anomt3,depths,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(anomt6,depths,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(anomt12,depths,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(anomrgt,depths,'LineWidth',lw,'Color','k');
h5 = plot(anomodat,depths,'--','LineWidth',lw,'Color','k');
h6 = plot(anomwoat,depths,':','LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('temperature anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylim(y1000)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
'1/3','1/6','1/12','R&G Argo','GFDL ODA','WOA18',...
'FontSize',20,'Location','north')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_new/mean_vert_temp_all_1000','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(wvel320,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(wvel620,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(wvel1220,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(odaw,RFt,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity profile','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12','GFDL ODA',...
'FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(anomw3,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(anomw6,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(anomw12,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(anomodaw,RF3,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylim(y1000)
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12','GFDL ODA',...
'FontSize',20,'Location','north')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_new/mean_vert_wvel_all_1000','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(theta320,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(theta620,RC3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(theta1220,RC3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(rgt,depthrg,'LineWidth',lw,'Color','k');
h5 = plot(odat,RCt,'--','LineWidth',lw,'Color','k');
h6 = plot(woa_t,depth,':','LineWidth',lw,'Color','k');
yline(0)
grid on
title('temperature profile','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
ylim(y2000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
'1/3','1/6','1/12','R&G Argo','GFDL ODA','WOA18',...
'FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(anomt3,depths,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(anomt6,depths,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(anomt12,depths,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(anomrgt,depths,'LineWidth',lw,'Color','k');
h5 = plot(anomodat,depths,'--','LineWidth',lw,'Color','k');
h6 = plot(anomwoat,depths,':','LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('temperature anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylim(y2000)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
'1/3','1/6','1/12','R&G Argo','GFDL ODA','WOA18',...
'FontSize',20,'Location','north')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_new/mean_vert_temp_all_2000','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(wvel320,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(wvel620,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(wvel1220,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(odaw,RFt,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity profile','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylabel('depth [m]')
ylim(y2000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12','GFDL ODA',...
'FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(anomw3,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(anomw6,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(anomw12,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(anomodaw,RF3,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylim(y2000)
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12','GFDL ODA',...
'FontSize',20,'Location','north')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_new/mean_vert_wvel_all_2000','-dpng')



toc()