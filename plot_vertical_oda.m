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
load vert_oda
RF3 = RF3(1:52);
%%

%% plot
yfull = [-6000 15];
y500 = [-500 10];
y1000 = [-1000 10];
y250 = [-255 10];



figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(theta_3v,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(theta_6v,RC3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(theta_12v,RC3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(oda_theta_v,-RCt,'LineWidth',lw,'Color','k');
yline(0)
grid on
title('temperature profile','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12',...
'ODA','FontSize',20,'Location','best')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(wvel_3v,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(wvel_6v,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(wvel_12v,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(oda_wvel_v,-RCWt,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylim(y500)
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12',...
'ODA','FontSize',20,'Location','best')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert/mean_vert_oda_500','-dpng')




figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(theta_3v,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(theta_6v,RC3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(theta_12v,RC3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(oda_theta_v,-RCt,'LineWidth',lw,'Color','k');
yline(0)
grid on
title('temperature profile','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12',...
'ODA','FontSize',20,'Location','best')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(wvel_3v,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(wvel_6v,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(wvel_12v,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(oda_wvel_v,-RCWt,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylim(y1000)
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12',...
'ODA','FontSize',20,'Location','best')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert/mean_vert_oda_1000','-dpng')



figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(theta_3v,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(theta_6v,RC3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(theta_12v,RC3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(oda_theta_v,-RCt,'LineWidth',lw,'Color','k');
yline(0)
grid on
title('temperature profile','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12',...
'ODA','FontSize',20,'Location','best')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(wvel_3v,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(wvel_6v,RF3,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(wvel_12v,RF3,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(oda_wvel_v,-RCWt,'LineWidth',lw,'Color','k');
xline(0)
yline(0)
grid on
title('vertical velocity','FontWeight','Normal','FontSize',24)
xlabel('[m/s]')
ylim(yfull)
legend([h1(1),h2(1),h3(1),h4(1)],...
'1/3','1/6','1/12',...
'ODA','FontSize',20,'Location','best')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert/mean_vert_oda_full','-dpng')

toc()