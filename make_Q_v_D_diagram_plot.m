clear
close all
clc
tic()

load Depth_52_104
acc_settings

load ../2019_09_September_analysis/OOI_Sampling/DIC_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/DIC_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/DIC_OOI_122 *ooip*

load ../2019_09_September_analysis/OOI_Sampling/NO3_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/NO3_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/NO3_OOI_122 *ooip*

load ../2019_09_September_analysis/OOI_Sampling/O2_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/O2_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/O2_OOI_122 *ooip*

% load ../2019_09_September_analysis/OOI_Sampling/PHYTO_OOI_32 *ooip*
% load ../2019_09_September_analysis/OOI_Sampling/PHYTO_OOI_62 *ooip*
% load ../2019_09_September_analysis/OOI_Sampling/PHYTO_OOI_122 *ooip*

load ../2019_09_September_analysis/OOI_Sampling/ALK_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/ALK_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/ALK_OOI_122 *ooip*

load ../2019_09_September_analysis/OOI_Sampling/PH_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/PH_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/PH_OOI_122 *ooip*

numdate = datenum('12012016','mmddyyyy');
option = 1;
lw = 2.5;
ms = 20;
cb = 85;
c3 = 86;
c6 = 87;
c12 = 88;
c_coords = [2.1 2.35 -5200 15];
n_coords = [0.0055 0.0335 -5200 15];
o_coords = [0.198 0.301 -5200 15];
p_coords = [-0.7 0.7 -5200 15];
a_coords = [2.33 2.43 -5200 15];
ph_coords = [7.78 8.08 -5200 15];
%%

% min(min(o2_ooip_32(1:50,1:(end-1))))
% min(min(o2_ooip_62(1:50,1:(end-1))))
% min(min(o2_ooip_122(1:100,1:(end-1))))
% 
% max(max(o2_ooip_32(1:50,1:(end-1))))
% max(max(o2_ooip_62(1:50,1:(end-1))))
% max(max(o2_ooip_122(1:100,1:(end-1))))


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

ax1 = subplot(1,4,1);
h1 = plot(mean(dic_ooip_32(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(dic_ooip_62(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(dic_ooip_122(2:101,731:9490),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(c_coords)
ylim([-5150 15])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('depth [m]')
xlabel('DIC [mol C/m^3]')
grid on
legend([h1(1),h2(1),h3(1)],'1/3','1/6','1/12','Location','Southeast')
acc_movie
acc_4plots_1
hold off

ax2 = subplot(1,4,2);
h1 = plot(mean(no3_ooip_32(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(no3_ooip_62(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(no3_ooip_122(2:101,731:9490),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(n_coords)
ylim([-5150 15])
xlabel('NO3 [mol N/m^3]')
grid on
acc_movie
acc_4plots_2
hold off

ax3 = subplot(1,4,3);
h1 = plot(mean(o2_ooip_32(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(o2_ooip_62(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(o2_ooip_122(2:101,731:9490),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(o_coords)
ylim([-5150 15])
xlabel('O2 [mol Om^3]')
grid on
acc_movie
acc_4plots_3
hold off

ax4 = subplot(1,4,4);
h1 = plot(mean(ph_ooip_32(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(ph_ooip_62(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(ph_ooip_122(2:101,731:9490),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(ph_coords)
ylim([-5150 15])
xlabel('pH')
grid on
acc_movie
acc_4plots_4
sgtitle('mean 2017 BGC variables vs. depth in Argentine Basin','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','BGC_v_D_2017','-dpng')


load ../2019_09_September_analysis/OOI_Sampling/THETA_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/THETA_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/THETA_OOI_122 *ooip*

load ../2019_09_September_analysis/OOI_Sampling/SALT_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/SALT_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/SALT_OOI_122 *ooip*

% load ../2019_09_September_analysis/OOI_Sampling/UVEL_OOI_32 *ooip*
% load ../2019_09_September_analysis/OOI_Sampling/UVEL_OOI_62 *ooip*
% load ../2019_09_September_analysis/OOI_Sampling/UVEL_OOI_122 *ooip*

load ../2019_09_September_analysis/OOI_Sampling/VVEL_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/VVEL_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/VVEL_OOI_122 *ooip*

load ../2019_09_September_analysis/OOI_Sampling/WVEL_OOI_32 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/WVEL_OOI_62 *ooip*
load ../2019_09_September_analysis/OOI_Sampling/WVEL_OOI_122 *ooip*

numdate = datenum('12012016','mmddyyyy');
option = 1;
lw = 2.4;
ms = 20;
cb = 85;
c3 = 86;
c6 = 87;
c12 = 88;
t_coords = [-0.5 17 -5150 15];
s_coords = [34 35 -5150 15];
u_coords = [-0.7 0.7 -5150 15];
v_coords = [-0.7 0.7 -5150 15];
w_coords = [-0.0025 0.0025 -5150 15];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])

ax1 = subplot(1,4,1);
h1 = plot(mean(theta_ooip_32(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(theta_ooip_62(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(theta_ooip_122(2:101,731:9490),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(t_coords)
ylim([-5150 15])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('depth [m]')
xlabel('theta [C]')
grid on
legend([h1(1),h2(1),h3(1)],'1/3','1/6','1/12','Location','Southeast')
acc_movie
acc_4plots_1
hold off

ax2 = subplot(1,4,2);
h1 = plot(mean(salt_ooip_32(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(salt_ooip_62(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(salt_ooip_122(2:101,731:9490),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(s_coords)
ylim([-5150 15])
xlabel('salt [psu]')
grid on
acc_movie
acc_4plots_2
hold off

ax3 = subplot(1,4,3);
h1 = plot(mean(wvel_ooip_32(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(wvel_ooip_62(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(wvel_ooip_122(2:101,731:9490),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(w_coords)
ylim([-5150 15])
xlabel('wvel [m/s]')
grid on
xticks([-0.002 0 0.002])
xticklabels({'-0.002','0','0.002'})
acc_movie
acc_4plots_3
hold off

ax4 = subplot(1,4,4);
h1 = plot(mean(vvel_ooip_32(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vvel_ooip_62(2:51,731:9490),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vvel_ooip_122(2:101,731:9490),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(v_coords)
ylim([-5150 15])
xlabel('vvel [m/s]')
grid on
acc_movie
acc_4plots_4
sgtitle('mean 2017 thermodynamic variables vs. depth in Argentine Basin','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','TSUV_v_D_2017','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

ax1 = subplot(1,4,1);
h1 = plot(mean(theta_ooip_32(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(theta_ooip_62(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(theta_ooip_122(2:101,731:2915),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(t_coords)
ylim([-5150 15])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('depth [m]')
xlabel('theta [C]')
grid on
legend([h1(1),h2(1),h3(1)],'1/3','1/6','1/12','Location','Southeast')
acc_movie
acc_4plots_1
hold off

ax2 = subplot(1,4,2);
h1 = plot(mean(salt_ooip_32(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(salt_ooip_62(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(salt_ooip_122(2:101,731:2915),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(s_coords)
ylim([-5150 15])
xlabel('salt [psu]')
grid on
acc_movie
acc_4plots_2
hold off

ax3 = subplot(1,4,3);
h1 = plot(mean(wvel_ooip_32(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(wvel_ooip_62(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(wvel_ooip_122(2:101,731:2915),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% % axis(w_coords)
ylim([-5150 15])
xlabel('wvel [m/s]')
grid on
xticks([-0.002 0 0.002])
xticklabels({'-0.002','0','0.002'})
acc_movie
acc_4plots_3
hold off

ax4 = subplot(1,4,4);
h1 = plot(mean(vvel_ooip_32(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vvel_ooip_62(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vvel_ooip_122(2:101,731:2915),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% % axis(v_coords)
ylim([-5150 15])
xlabel('vvel [m/s]')
grid on
acc_movie
acc_4plots_4
sgtitle('mean JFM 2017 thermodynamic variables vs. depth in Argentine Basin','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','TSUV_v_D_2017_JFM','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

ax1 = subplot(1,4,1);
h1 = plot(mean(theta_ooip_32(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(theta_ooip_62(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(theta_ooip_122(2:101,5112:7296),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% % axis(t_coords)
ylim([-5150 15])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('depth [m]')
xlabel('theta [C]')
grid on
legend([h1(1),h2(1),h3(1)],'1/3','1/6','1/12','Location','Southeast')
acc_movie
acc_4plots_1
hold off

ax2 = subplot(1,4,2);
h1 = plot(mean(salt_ooip_32(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(salt_ooip_62(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(salt_ooip_122(2:101,5112:7296),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% % axis(s_coords)
ylim([-5150 15])
xlabel('salt [psu]')
grid on
acc_movie
acc_4plots_2
hold off

ax3 = subplot(1,4,3);
h1 = plot(mean(wvel_ooip_32(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(wvel_ooip_62(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(wvel_ooip_122(2:101,5112:7296),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% % axis(w_coords)
ylim([-5150 15])
xlabel('wvel [m/s]')
grid on
xticks([-0.002 0 0.002])
xticklabels({'-0.002','0','0.002'})
acc_movie
acc_4plots_3
hold off

ax4 = subplot(1,4,4);
h1 = plot(mean(vvel_ooip_32(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vvel_ooip_62(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vvel_ooip_122(2:101,5112:7296),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% % axis(v_coords)
ylim([-5150 15])
xlabel('vvel [m/s]')
grid on
acc_movie
acc_4plots_4
sgtitle('mean JAS 2017 thermodynamic variables vs. depth in Argentine Basin','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','TSUV_v_D_2017_JAS','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

ax1 = subplot(1,4,1);
h1 = plot(mean(dic_ooip_32(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(dic_ooip_62(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(dic_ooip_122(2:101,731:2915),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(c_coords)
ylim([-5150 15])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('depth [m]')
xlabel('DIC [mol C/m^3]')
grid on
legend([h1(1),h2(1),h3(1)],'1/3','1/6','1/12','Location','Southeast')
acc_movie
acc_4plots_1
hold off

ax2 = subplot(1,4,2);
h1 = plot(mean(no3_ooip_32(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(no3_ooip_62(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(no3_ooip_122(2:101,731:2915),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(n_coords)
ylim([-5150 15])
xlabel('NO3 [mol N/m^3]')
grid on
acc_movie
acc_4plots_2
hold off

ax3 = subplot(1,4,3);
h1 = plot(mean(o2_ooip_32(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(o2_ooip_62(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(o2_ooip_122(2:101,731:2915),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(o_coords)
ylim([-5150 15])
xlabel('O2 [mol Om^3]')
grid on
acc_movie
acc_4plots_3
hold off

ax4 = subplot(1,4,4);
h1 = plot(mean(ph_ooip_32(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(ph_ooip_62(2:51,731:2915),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(ph_ooip_122(2:101,731:2915),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(ph_coords)
ylim([-5150 15])
xlabel('pH')
grid on
acc_movie
acc_4plots_4
sgtitle('mean JFM 2017 BGC variables vs. depth in Argentine Basin','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','BGC_v_D_2017_JFM','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

ax1 = subplot(1,4,1);
h1 = plot(mean(dic_ooip_32(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(dic_ooip_62(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(dic_ooip_122(2:101,5112:7296),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(c_coords)
ylim([-5150 15])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('depth [m]')
xlabel('DIC [mol C/m^3]')
grid on
legend([h1(1),h2(1),h3(1)],'1/3','1/6','1/12','Location','Southeast')
acc_movie
acc_4plots_1
hold off

ax2 = subplot(1,4,2);
h1 = plot(mean(no3_ooip_32(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(no3_ooip_62(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(no3_ooip_122(2:101,5112:7296),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(n_coords)
ylim([-5150 15])
xlabel('NO3 [mol N/m^3]')
grid on
acc_movie
acc_4plots_2
hold off

ax3 = subplot(1,4,3);
h1 = plot(mean(o2_ooip_32(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(o2_ooip_62(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(o2_ooip_122(2:101,5112:7296),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(o_coords)
ylim([-5150 15])
xlabel('O2 [mol Om^3]')
grid on
acc_movie
acc_4plots_3
hold off

ax4 = subplot(1,4,4);
h1 = plot(mean(ph_ooip_32(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(ph_ooip_62(2:51,5112:7296),2),RC52(1:50),'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(ph_ooip_122(2:101,5112:7296),2),RC104(1:100),'LineWidth',lw,'Color',Color(c12,:));
% axis(ph_coords)
ylim([-5150 15])
xlabel('pH')
grid on
acc_movie
acc_4plots_4
sgtitle('mean JAS 2017 BGC variables vs. depth in Argentine Basin','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','BGC_v_D_2017_JAS','-dpng')







