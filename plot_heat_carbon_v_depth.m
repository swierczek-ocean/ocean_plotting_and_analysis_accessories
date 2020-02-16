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
conv = 1e6/365;

y500 = [-500 10];

RF3 = RF3(1:52);
RF6 = RF6(1:52);
RF12 = RF12(1:104);

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
title('mean vertical advective heat transport','FontWeight','Normal','FontSize',26)
xlabel('[deg C cm/day]')
ylabel('depth [m]')
ylim(y500)
xlim([-30 40])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','southeast','FontSize',20)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(conv.*mean(vert_carbon_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(conv.*mean(vert_carbon_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(conv.*mean(vert_carbon_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical advective DIC transport','FontWeight','Normal','FontSize',26)
xlabel('[kt C/day]')
ylim(y500)
xlim([-4200 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','southeast','FontSize',20)
acc_movie_w
acc_2plots(2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','AB_VERTFLX_HEAT_CARBON_ADV_500m','-dpng')

clear

close all

acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
alpha = 0.8;
rho = 1035; % kg/m^3
%%

load VERT_3
load VERT_6
load VERT_12

y500 = [-500 10];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h7 = plot(mean(vert_theta_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_theta_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_theta_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean potential temperature','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
xlim([5.8 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(mean(vert_carbon_3,2).*(1e6/rho),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_carbon_6,2).*(1e6/rho),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_carbon_12,2).*(1e6/rho),RC12,'LineWidth',lw,'Color',Color(c12,:));
% xline(0)
yline(0)
grid on
title('mean dissolved inorganic carbon','FontWeight','Normal','FontSize',24)
xlabel('[\mumol C/kg]')
xticks(2090:20:2150)
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','AB_THETA_CARBON_500m','-dpng')

clear 
close all





toc()