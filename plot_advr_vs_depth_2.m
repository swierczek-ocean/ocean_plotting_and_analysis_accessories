clear
close all
clc
tic()

load ADVr_3
load ADVr_6
load ADVr_12
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
alpha = 0.6;
rho = 1035; % kg/m^3

yfull = [-6000 15];
y500 = [-500 10];
y1000 = [-1000 10];
y250 = [-255 10];

RF3 = RF3(1:52);
RF6 = RF6(1:52);
RF12 = RF12(1:104);

%% heat
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_heat_adv_3,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_adv_6,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_adv_12,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_heat_adv_3,0,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_heat_adv_6,0,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_heat_adv_12,0,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective heat transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_ADV_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_heat_adv_3,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_adv_6,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_adv_12,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_heat_adv_3,0,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_heat_adv_6,0,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_heat_adv_12,0,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective heat transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_ADV_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_heat_adv_3,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_adv_6,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_adv_12,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_heat_adv_3,0,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_heat_adv_6,0,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_heat_adv_12,0,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective heat transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_ADV_full','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_heat_dif_3,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_dif_6,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_dif_12,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_heat_dif_3,0,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_heat_dif_6,0,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_heat_dif_12,0,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive heat transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_DIF_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_heat_dif_3,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_dif_6,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_dif_12,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_heat_dif_3,0,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_heat_dif_6,0,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_heat_dif_12,0,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive heat transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_DIF_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_heat_dif_3,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_dif_6,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_dif_12,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_heat_dif_3,0,2).*86400*100,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_heat_dif_6,0,2).*86400*100,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_heat_dif_12,0,2).*86400*100,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive heat transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[deg C cm/day]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_DIF_full','-dpng')
%% heat

%% carbon
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_carbon_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_carbon_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_carbon_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_carbon_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective DIC transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_03_CARBON_ADV_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_carbon_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_carbon_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_carbon_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_carbon_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective DIC transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_03_CARBON_ADV_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_carbon_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_carbon_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_carbon_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_carbon_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective DIC transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_03_CARBON_ADV_full','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_carbon_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_carbon_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_carbon_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_carbon_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive DIC transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_03_CARBON_DIF_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_carbon_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_carbon_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_carbon_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_carbon_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive DIC transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_03_CARBON_DIF_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_carbon_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_carbon_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_carbon_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_carbon_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive DIC transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_03_CARBON_DIF_full','-dpng')
%% carbon

%% oxygen
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_oxygen_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective oxygen transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_oxygen_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_oxygen_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_oxygen_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective oxygen transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_04_OXYGEN_ADV_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_oxygen_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective oxygen transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_oxygen_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_oxygen_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_oxygen_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective oxygen transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_04_OXYGEN_ADV_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_oxygen_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective oxygen transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_oxygen_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_oxygen_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_oxygen_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective oxygen transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_04_OXYGEN_ADV_full','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_oxygen_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive oxygen transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_oxygen_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_oxygen_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_oxygen_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive oxygen transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_04_OXYGEN_DIF_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_oxygen_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive oxygen transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_oxygen_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_oxygen_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_oxygen_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive oxygen transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_04_OXYGEN_DIF_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_oxygen_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive oxygen transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_oxygen_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_oxygen_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_oxygen_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive oxygen transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt O/yr]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_04_OXYGEN_DIF_full','-dpng')
%% oxygen

%% nitrate
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_nitrate_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective nitrate transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_nitrate_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_nitrate_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_nitrate_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective nitrate transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_05_NITRATE_ADV_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_nitrate_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective nitrate transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_nitrate_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_nitrate_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_nitrate_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective nitrate transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_05_NITRATE_ADV_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_nitrate_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective nitrate transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_nitrate_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_nitrate_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_nitrate_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective nitrate transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_05_NITRATE_ADV_full','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_nitrate_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive nitrate transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_nitrate_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_nitrate_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_nitrate_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive nitrate transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_05_NITRATE_DIF_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_nitrate_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive nitrate transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_nitrate_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_nitrate_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_nitrate_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive nitrate transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_05_NITRATE_DIF_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_nitrate_dif_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_dif_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_dif_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive nitrate transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_nitrate_dif_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_nitrate_dif_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_nitrate_dif_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive nitrate transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[Gt N/yr]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_05_NITRATE_DIF_full','-dpng')
%% nitrate

%% salt
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_salt_adv_3,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_adv_6,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_adv_12,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective salt transport','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_salt_adv_3,0,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_salt_adv_6,0,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_salt_adv_12,0,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective salt transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_ADV_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_salt_adv_3,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_adv_6,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_adv_12,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective salt transport','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_salt_adv_3,0,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_salt_adv_6,0,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_salt_adv_12,0,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective salt transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_ADV_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_salt_adv_3,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_adv_6,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_adv_12,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective salt transport','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_salt_adv_3,0,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_salt_adv_6,0,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_salt_adv_12,0,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical advective salt transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_ADV_full','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_salt_dif_3,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_dif_6,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_dif_12,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive salt transport','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_salt_dif_3,0,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_salt_dif_6,0,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_salt_dif_12,0,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive salt transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_DIF_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_salt_dif_3,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_dif_6,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_dif_12,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive salt transport','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylabel('depth [m]')
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_salt_dif_3,0,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_salt_dif_6,0,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_salt_dif_12,0,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive salt transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_DIF_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(mean(vert_salt_dif_3,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_dif_6,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_dif_12,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical diffusive salt transport','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylabel('depth [m]')
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','best','FontSize',18)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(std(vert_salt_dif_3,0,2).*86400./rho,RF3,'LineWidth',lw,'Color',Color(c3,:))
hold on
plot(std(vert_salt_dif_6,0,2).*86400./rho,RF6,'LineWidth',lw,'Color',Color(c6,:))
plot(std(vert_salt_dif_12,0,2).*86400./rho,RF12,'LineWidth',lw,'Color',Color(c12,:))
xline(0)
yline(0)
grid on
title('vertical diffusive salt transport st dev','FontWeight','Normal','FontSize',24)
xlabel('[psu/m^2/day]')
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_DIF_full','-dpng')
%% salt




















toc()