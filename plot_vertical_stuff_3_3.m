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

vert_wvel_3 = 100*86400.*vert_wvel_3;
vert_uvel_3 = 100*86400.*vert_uvel_3;
vert_vvel_3 = 100*86400.*vert_vvel_3;
vert_wvel_6 = 100*86400.*vert_wvel_6;
vert_uvel_6 = 100*86400.*vert_uvel_6;
vert_vvel_6 = 100*86400.*vert_vvel_6;
vert_wvel_12 = 100*86400.*vert_wvel_12;
vert_uvel_12 = 100*86400.*vert_uvel_12;
vert_vvel_12 = 100*86400.*vert_vvel_12;





%% plot
yfull = [-6000 15];
y500 = [-500 10];
y1000 = [-1000 10];
y250 = [-255 10];

temp3 = mean(vert_theta_3,2);
temp6 = mean(vert_theta_6,2);
temp12_s = mean(vert_theta_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_theta_3,0,2);
stemp6 = std(vert_theta_6,0,2);
stemp12_s = std(vert_theta_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean theta anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
% xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('theta st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
% xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_theta_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean theta anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
% xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('theta st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
% xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_theta_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean theta anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
% xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('theta st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
% xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_theta_500m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean theta anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
ylabel('depth [m]')
% xlim([5.5 11.5])
ylim(y250)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('theta st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[deg C]')
% xlim([0 2])
ylim(y250)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/250m/anom_mean_std_theta_250m','-dpng')
%% theta
close all

%% salt

temp3 = mean(vert_salt_3,2);
temp6 = mean(vert_salt_6,2);
temp12_s = mean(vert_salt_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_salt_3,0,2);
stemp6 = std(vert_salt_6,0,2);
stemp12_s = std(vert_salt_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean salinity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('salinity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
% xlim([-0.005 0.05])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_salt_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean salinity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('salinity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_salt_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean salinity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('salinity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_salt_500m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean salinity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y250)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('salinity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[psu]')
% % xlim([0 2])
ylim(y250)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/250m/anom_mean_std_salt_250m','-dpng')
%% salt

close all
%% wvel

temp3 = mean(vert_wvel_3,2);
temp6 = mean(vert_wvel_6,2);
temp12_s = mean(vert_wvel_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_wvel_3,0,2);
stemp6 = std(vert_wvel_6,0,2);
stemp12_s = std(vert_wvel_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('vertical velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_wvel_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_wvel_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_wvel_500m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean vertical velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y250)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([0 2])
ylim(y250)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/250m/anom_mean_std_wvel_250m','-dpng')
%% wvel
close all

%% age

temp3 = mean(vert_age_3,2);
temp6 = mean(vert_age_6,2);
temp12_s = mean(vert_age_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_age_3,0,2);
stemp6 = std(vert_age_6,0,2);
stemp12_s = std(vert_age_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean normalized age anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
ylabel('depth [m]')
% xlim([0.625 1.01])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('normalized age st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
% xlim([-0.005 0.115])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_age_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean normalized age anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
ylabel('depth [m]')
% xlim([0.625 1.01])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('normalized age st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
% xlim([-0.005 0.115])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_age_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean normalized age anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
ylabel('depth [m]')
% xlim([0.625 1.01])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('normalized age st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
% xlim([-0.001 0.115])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_age_500m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean normalized age anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
ylabel('depth [m]')
% xlim([0.625 1])
ylim(y250)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('normalized age st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
% % xlim([-0.001 0.115])
ylim(y250)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/250m/anom_mean_std_age_250m','-dpng')
%% age
close all

%% uvel

temp3 = mean(vert_uvel_3,2);
temp6 = mean(vert_uvel_6,2);
temp12_s = mean(vert_uvel_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_uvel_3,0,2);
stemp6 = std(vert_uvel_6,0,2);
stemp12_s = std(vert_uvel_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean zonal velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% xlim([-0.01 0.12])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('zonal velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_uvel_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean zonal velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('zonal velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_uvel_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean zonal velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('zonal velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_uvel_500m','-dpng')

%% uvel
close all

%% vvel

temp3 = mean(vert_vvel_3,2);
temp6 = mean(vert_vvel_6,2);
temp12_s = mean(vert_vvel_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_vvel_3,0,2);
stemp6 = std(vert_vvel_6,0,2);
stemp12_s = std(vert_vvel_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean meridional velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% xlim([-0.005 0.04])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('meridional velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_vvel_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean meridional velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('meridional velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_vvel_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean meridional velocity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('meridional velocity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_vvel_500m','-dpng')
%% vvel
close all

%% carbon

temp3 = mean(vert_carbon_3,2);
temp6 = mean(vert_carbon_6,2);
temp12_s = mean(vert_carbon_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_carbon_3,0,2);
stemp6 = std(vert_carbon_6,0,2);
stemp12_s = std(vert_carbon_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean dissolved inorganic carbon anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3]')
ylabel('depth [m]')
% xlim([2.15 2.325])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('dissolved inorganic carbon st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3]')
% xlim([-0.001 0.013])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_carbon_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved inorganic carbon anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved inorganic carbon st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_carbon_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved inorganic carbon anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved inorganic carbon st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_carbon_500m','-dpng')
%% carbon
close all

%% oxygen

temp3 = mean(vert_oxygen_3,2);
temp6 = mean(vert_oxygen_6,2);
temp12_s = mean(vert_oxygen_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_oxygen_3,0,2);
stemp6 = std(vert_oxygen_6,0,2);
stemp12_s = std(vert_oxygen_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean dissolved oxygen anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol O/m^3]')
ylabel('depth [m]')
% xlim([0.2 0.29])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('dissolved oxygen st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol O/m^3]')
% xlim([-0.0005 0.01])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_oxygen_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved oxygen anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol O/m^3]')
ylabel('depth [m]')
% xlim([0.205 0.29])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved oxygen st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol O/m^3]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_oxygen_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved oxygen anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol O/m^3]')
ylabel('depth [m]')
% xlim([0.225 0.287])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved oxygen st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol O/m^3]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_oxygen_500m','-dpng')
%% oxygen
close all

%% alk

temp3 = mean(vert_alk_3,2);
temp6 = mean(vert_alk_6,2);
temp12_s = mean(vert_alk_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_alk_3,0,2);
stemp6 = std(vert_alk_6,0,2);
stemp12_s = std(vert_alk_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean alkalinity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol eq/m^3]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('alkalinity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol eq/m^3]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_alk_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean alkalinity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol eq/m^3]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','northeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('alkalinity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol eq/m^3]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_alk_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean alkalinity anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol eq/m^3]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('alkalinity st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol eq/m^3]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_alk_500m','-dpng')
%% alk
close all

%% nitrate

temp3 = mean(vert_nitrate_3,2);
temp6 = mean(vert_nitrate_6,2);
temp12_s = mean(vert_nitrate_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_nitrate_3,0,2);
stemp6 = std(vert_nitrate_6,0,2);
stemp12_s = std(vert_nitrate_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;



figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean nitrate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('nitrate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
% xlim([-0.1e-3 2e-3])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_nitrate_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean nitrate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('nitrate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_nitrate_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean nitrate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('nitrate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_nitrate_500m','-dpng')
%% nitrate
close all

%% iron

temp3 = mean(vert_iron_3,2);
temp6 = mean(vert_iron_6,2);
temp12_s = mean(vert_iron_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_iron_3,0,2);
stemp6 = std(vert_iron_6,0,2);
stemp12_s = std(vert_iron_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean dissolved iron anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol Fe/m^3]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('dissolved iron st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol Fe/m^3]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_iron_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved iron anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol Fe/m^3]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved iron st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol Fe/m^3]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_iron_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved iron anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol Fe/m^3]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved iron st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol Fe/m^3]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_iron_500m','-dpng')
%% iron
close all

%% phosphate

temp3 = mean(vert_phosphate_3,2);
temp6 = mean(vert_phosphate_6,2);
temp12_s = mean(vert_phosphate_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_phosphate_3,0,2);
stemp6 = std(vert_phosphate_6,0,2);
stemp12_s = std(vert_phosphate_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean phosphate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('phosphate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_phosphate_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean phosphate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('phosphate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_phosphate_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean phosphate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('phosphate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_phosphate_500m','-dpng')
%% phosphate

close all
%% dop

temp3 = mean(vert_dop_3,2);
temp6 = mean(vert_dop_6,2);
temp12_s = mean(vert_dop_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_dop_3,0,2);
stemp6 = std(vert_dop_6,0,2);
stemp12_s = std(vert_dop_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean dissolved organic phosphate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('dissolved organic phosphate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_dop_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved organic phosphate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved organic phosphate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_dop_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved organic phosphate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved organic phosphate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol P/m^3]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_dop_500m','-dpng')

%% dop

close all
%% don

temp3 = mean(vert_don_3,2);
temp6 = mean(vert_don_6,2);
temp12_s = mean(vert_don_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_don_3,0,2);
stemp6 = std(vert_don_6,0,2);
stemp12_s = std(vert_don_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;



figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean dissolved organic nitrate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('dissolved organic nitrate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_don_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved organic nitrate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved organic nitrate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_don_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean dissolved organic nitrate anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('dissolved organic nitrate st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[mol N/m^3]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_don_500m','-dpng')
%% don
close all

%% phyto

temp3 = mean(vert_phyto_3,2);
temp6 = mean(vert_phyto_6,2);
temp12_s = mean(vert_phyto_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_phyto_3,0,2);
stemp6 = std(vert_phyto_6,0,2);
stemp12_s = std(vert_phyto_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean phytoplankton biomass anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('phytoplankton biomass st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_phyto_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean phytoplankton biomass anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('phytoplankton biomass st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_phyto_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean phytoplankton biomass anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('phytoplankton biomass st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_phyto_500m','-dpng')

%% phyto
close all

%% ph

temp3 = mean(vert_ph_3,2);
temp6 = mean(vert_ph_6,2);
temp12_s = mean(vert_ph_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_ph_3,0,2);
stemp6 = std(vert_ph_6,0,2);
stemp12_s = std(vert_ph_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean pH anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('pH st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_ph_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean pH anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('pH st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_ph_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean pH anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('pH st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[dimensionless]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_ph_500m','-dpng')
%% ph

close all
%% phihyd

temp3 = mean(vert_phihyd_3,2);
temp6 = mean(vert_phihyd_6,2);
temp12_s = mean(vert_phihyd_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_phihyd_3,0,2);
stemp6 = std(vert_phihyd_6,0,2);
stemp12_s = std(vert_phihyd_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean hydrostatic pressure anomaly anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m^2/s^2]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('hydrostatic pressure anomaly st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m^2/s^2]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_phihyd_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean hydrostatic pressure anomaly anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m^2/s^2]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('hydrostatic pressure anomaly st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m^2/s^2]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_phihyd_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean hydrostatic pressure anomaly anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m^2/s^2]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('hydrostatic pressure anomaly st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[m^2/s^2]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_phihyd_500m','-dpng')
%% phihyd
close all

%% drhodr

temp3 = mean(vert_drhodr_3,2);
temp6 = mean(vert_drhodr_6,2);
temp12_s = mean(vert_drhodr_12,2);
temp12 = zeros(52,1);
for ii=1:52
    temp12(ii) = (temp12_s(2*ii-1)+temp12_s(2*ii))./2;
end
stemp3 = std(vert_drhodr_3,0,2);
stemp6 = std(vert_drhodr_6,0,2);
stemp12_s = std(vert_drhodr_12,0,2);
stemp12 = zeros(52,1);
for ii=1:52
    stemp12(ii) = (stemp12_s(2*ii-1)+stemp12_s(2*ii))./2;
end

tmean = mean([temp3,temp6,temp12],2);

temp3 = temp3 - tmean;
temp6 = temp6 - tmean;
temp12 = temp12 - tmean;

smean = mean([stemp3,stemp6,stemp12],2);

stemp3 = stemp3 - smean;
stemp6 = stemp6 - smean;
stemp12 = stemp12 - smean;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('stratification (drho/dr) mean anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg/m^4]')
ylabel('depth [m]')
% % xlim([-0.5 11.5])
ylim(yfull)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('stratification (drho/dr) st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg/m^4]')
% % xlim([-0.1 2])
ylim(yfull)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/full/anom_mean_std_drhodr_full','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('stratification (drho/dr) mean anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg/m^4]')
ylabel('depth [m]')
% % xlim([3 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('stratification (drho/dr) st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg/m^4]')
% % xlim([0 2])
ylim(y1000)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/1000m/anom_mean_std_drhodr_1000m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

subplot(1,2,1)
h7 = plot(temp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(temp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(temp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('stratification (drho/dr) mean anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg/m^4]')
ylabel('depth [m]')
% % xlim([5.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
plot(stemp3,RC3,'LineWidth',lw,'Color',Color(c3,:));
hold on
plot(stemp6,RC6,'LineWidth',lw,'Color',Color(c6,:));
plot(stemp12,RC6,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('stratification (drho/dr) st dev anomaly','FontWeight','Normal','FontSize',24)
xlabel('[kg/m^4]')
% % xlim([0 2])
ylim(y500)
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_plots/500m/anom_mean_std_drhodr_500m','-dpng')
%% drhodr

close all

clear

toc()