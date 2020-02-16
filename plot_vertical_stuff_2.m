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


subplot(1,4,1)
h7 = plot(mean(vert_theta_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_theta_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_theta_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
grid on
title('mean theta','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',18,'Location','southeast')
acc_movie_w
acc_4plots(1)
hold off

subplot(1,4,2)
plot(std(vert_theta_3,0,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(std(vert_theta_6,0,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(std(vert_theta_12,0,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
grid on
title('theta st dev','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
acc_movie_w
acc_4plots(2)
hold off

subplot(1,4,3)
h7 = plot(mean(vert_salt_3,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(mean(vert_salt_6,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(mean(vert_salt_12,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
grid on
title('mean salinity','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',18,'Location','southwest')
acc_movie_w
acc_4plots(3)
hold off

subplot(1,4,4)
plot(std(vert_salt_3,0,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(std(vert_salt_6,0,2),RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(std(vert_salt_12,0,2),RC12,'LineWidth',lw,'Color',Color(c12,:));
grid on
title('salt st dev','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
acc_movie_w
acc_4plots(4)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/mean_std_theta_salt_full','-dpng')
toc()