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

load VERT_3
load VERT_6
load VERT_12

vert_age_3 = normalize_age(vert_age_3);
vert_age_6 = normalize_age(vert_age_6);
vert_age_12 = normalize_age(vert_age_12);

%% plot
y500 = [-500 0];
y1000 = [-1000 0];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_theta_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_theta_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_theta_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_theta_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_theta_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_theta_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('theta','FontWeight','Normal','FontSize',18)
xlabel('[deg C]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_age_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_age_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_age_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_age_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_age_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_age_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('normalized age','FontWeight','Normal','FontSize',18)
xlabel('[unitless]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_wvel_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_wvel_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_wvel_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_wvel_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_wvel_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_wvel_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('vertical velocity','FontWeight','Normal','FontSize',18)
xlabel('[m/s]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/mean_std_theta_age_wvel_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_theta_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_theta_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_theta_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_theta_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_theta_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_theta_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('theta','FontWeight','Normal','FontSize',18)
xlabel('[deg C]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_age_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_age_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_age_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_age_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_age_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_age_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('normalized age','FontWeight','Normal','FontSize',18)
xlabel('[unitless]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_wvel_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_wvel_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_wvel_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_wvel_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_wvel_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_wvel_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('vertical velocity','FontWeight','Normal','FontSize',18)
xlabel('[m/s]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/mean_std_theta_age_wvel_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_theta_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_theta_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_theta_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_theta_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_theta_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_theta_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('theta','FontWeight','Normal','FontSize',18)
xlabel('[deg C]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_age_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_age_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_age_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_age_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_age_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_age_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('normalized age','FontWeight','Normal','FontSize',18)
xlabel('[unitless]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_wvel_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_wvel_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_wvel_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_wvel_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_wvel_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_wvel_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('vertical velocity','FontWeight','Normal','FontSize',18)
xlabel('[m/s]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/mean_std_theta_age_wvel_1000m','-dpng')

%% 
close all
%% plot
y500 = [-500 0];
y1000 = [-1000 0];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_carbon_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_carbon_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_carbon_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_carbon_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_carbon_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_carbon_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('DIC','FontWeight','Normal','FontSize',18)
xlabel('[mol C/m^3]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_oxygen_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_oxygen_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_oxygen_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_oxygen_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_oxygen_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_oxygen_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('dissolved oxygen','FontWeight','Normal','FontSize',18)
xlabel('[mol O/m^3]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_nitrate_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_nitrate_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_nitrate_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_nitrate_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_nitrate_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_nitrate_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('nitrate','FontWeight','Normal','FontSize',18)
xlabel('[mol N/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/mean_std_carbon_oxygen_nitrate_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_carbon_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_carbon_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_carbon_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_carbon_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_carbon_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_carbon_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('DIC','FontWeight','Normal','FontSize',18)
xlabel('[mol C/m^3]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_oxygen_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_oxygen_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_oxygen_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_oxygen_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_oxygen_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_oxygen_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('dissolved oxygen','FontWeight','Normal','FontSize',18)
xlabel('[mol O/m^3]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_nitrate_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_nitrate_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_nitrate_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_nitrate_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_nitrate_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_nitrate_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('nitrate','FontWeight','Normal','FontSize',18)
xlabel('[mol N/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/mean_std_carbon_oxygen_nitrate_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_carbon_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_carbon_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_carbon_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_carbon_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_carbon_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_carbon_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('DIC','FontWeight','Normal','FontSize',18)
xlabel('[mol C/m^3]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_oxygen_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_oxygen_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_oxygen_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_oxygen_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_oxygen_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_oxygen_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('dissolved oxygen','FontWeight','Normal','FontSize',18)
xlabel('[mol O/m^3]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_nitrate_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_nitrate_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_nitrate_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_nitrate_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_nitrate_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_nitrate_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('nitrate','FontWeight','Normal','FontSize',18)
xlabel('[mol N/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/mean_std_carbon_oxygen_nitrate_1000m','-dpng')

%% 
close all

%% plot
y500 = [-500 0];
y1000 = [-1000 0];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_alk_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_alk_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_alk_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_alk_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_alk_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_alk_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('alkalinity','FontWeight','Normal','FontSize',18)
xlabel('[mol eq/m^3]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_ph_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_ph_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_ph_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_ph_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_ph_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_ph_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('pH','FontWeight','Normal','FontSize',18)
xlabel('[dimensionless]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_iron_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_iron_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_iron_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_iron_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_iron_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_iron_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('iron','FontWeight','Normal','FontSize',18)
xlabel('[mol Fe/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/mean_std_alk_ph_iron_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_alk_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_alk_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_alk_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_alk_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_alk_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_alk_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('alkalinity','FontWeight','Normal','FontSize',18)
xlabel('[mol eq/m^3]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_ph_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_ph_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_ph_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_ph_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_ph_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_ph_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('pH','FontWeight','Normal','FontSize',18)
xlabel('[dimensionless]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_iron_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_iron_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_iron_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_iron_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_iron_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_iron_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('iron','FontWeight','Normal','FontSize',18)
xlabel('[mol Fe/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/mean_std_alk_ph_iron_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_alk_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_alk_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_alk_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_alk_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_alk_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_alk_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('alkalinity','FontWeight','Normal','FontSize',18)
xlabel('[mol eq/m^3]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_ph_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_ph_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_ph_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_ph_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_ph_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_ph_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('pH','FontWeight','Normal','FontSize',18)
xlabel('[dimensionless]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_iron_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_iron_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_iron_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_iron_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_iron_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_iron_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('iron','FontWeight','Normal','FontSize',18)
xlabel('[mol Fe/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/mean_std_alk_ph_iron_1000m','-dpng')

%% 
close all

%% plot
y500 = [-500 0];
y1000 = [-1000 0];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_phyto_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_phyto_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_phyto_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_phyto_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_phyto_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_phyto_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('phytoplankton biomass','FontWeight','Normal','FontSize',18)
xlabel('[kg]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_phosphate_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_phosphate_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_phosphate_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_phosphate_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_phosphate_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_phosphate_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('phosphate','FontWeight','Normal','FontSize',18)
xlabel('[mol P/m^3]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_don_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_don_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_don_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_don_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_don_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_don_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
title('dissolved organic nitrate','FontWeight','Normal','FontSize',18)
xlabel('[mol N/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/mean_std_phyto_phosphate_don_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_phyto_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_phyto_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_phyto_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_phyto_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_phyto_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_phyto_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('phytoplankton biomass','FontWeight','Normal','FontSize',18)
xlabel('[kg]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_phosphate_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_phosphate_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_phosphate_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_phosphate_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_phosphate_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_phosphate_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('phosphate','FontWeight','Normal','FontSize',18)
xlabel('[mol P/m^3]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_don_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_don_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_don_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_don_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_don_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_don_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y500)
title('dissolved organic nitrate','FontWeight','Normal','FontSize',18)
xlabel('[mol N/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/mean_std_phyto_phosphate_don_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,3,1)
h7 = plot(mean(vert_phyto_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_phyto_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_phyto_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_phyto_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_phyto_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_phyto_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('phytoplankton biomass','FontWeight','Normal','FontSize',18)
xlabel('[kg]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],'1/3 mean','1/6 mean',...
    '1/12 mean','1/3 std','1/6 std','1/12 std','Location','southeast')
acc_movie_w
acc_3vplots(1)
hold off

subplot(1,3,2)
h7 = plot(mean(vert_phosphate_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_phosphate_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_phosphate_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_phosphate_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_phosphate_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_phosphate_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('phosphate','FontWeight','Normal','FontSize',18)
xlabel('[mol P/m^3]')
acc_movie_w
acc_3vplots(2)
hold off

subplot(1,3,3)
h7 = plot(mean(vert_don_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_don_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_don_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_don_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_don_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_don_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
xline(0)
grid on
ylim(y1000)
title('dissolved organic nitrate','FontWeight','Normal','FontSize',18)
xlabel('[mol N/m^3]')
acc_movie_w
acc_3vplots(3)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/mean_std_phyto_phosphate_don_1000m','-dpng')

%% 

close all












toc()