clear
close all
clc
tic()

load ADVr_3 *carbon* RF*
load ADVr_6 *carbon* RF*
load ADVr_12 *carbon* RF*
load VERT_3 *wvel* RC*
load VERT_6 *wvel* RC*
load VERT_12 *wvel* RC*
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

vert_wvel_3 = 100*86400.*vert_wvel_3;
vert_wvel_6 = 100*86400.*vert_wvel_6;
vert_wvel_12 = 100*86400.*vert_wvel_12;

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
title('net vertical advective DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[Gt C/yr]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1)],'1/3','1/6',...
    '1/12','Location','southeast','FontSize',20)
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(mean(vert_wvel_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_wvel_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_wvel_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical velocity','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% xlim([-2.5 0])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','DIC_AVDr_WVEL','-dpng')


















