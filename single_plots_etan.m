clear
close all
clc
tic()

acc_settings

%%
load SLICE_DEPTH
load XY3 YC3
load XY6 YC6
load XY12 YC12
load BSOSE_surf_slice_avgs ETAN_BSOSE* YCS
load MAT_files/AB122_output_ETAN_slice_vert ETAN_122*
load MAT_files/AB62_output_ETAN_slice_vert ETAN_62*
load MAT_files/AB32_output_ETAN_slice_vert ETAN_32*
load MAT_files/AB124_output_ETAN_slice_vert ETAN_124*
load MAT_files/AB64_output_ETAN_slice_vert ETAN_64*
load MAT_files/AB34_output_ETAN_slice_vert ETAN_34*
%%

%%
lw = 3.3;
ms = 20;
cb = 85;
c3 = 86;
c6 = 87;
c12 = 88;
cbd = 37;
coords = [-60 -32];
%%

%% 01
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_DJF_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_32_DJF_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_62_DJF_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_122_DJF_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean DJF 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_01DJF','-dpng')
close all
%%

%% 02
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_JFM_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_32_JFM_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_62_JFM_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_122_JFM_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean JFM 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_02JFM','-dpng')
close all
%%

%% 03
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_DJFMAM_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_32_DJFMAM_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_62_DJFMAM_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_122_DJFMAM_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean DJFMAM 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_03DJFMAM','-dpng')
close all
%%

%% 04
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_JFMAMJ_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_32_JFMAMJ_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_62_JFMAMJ_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_122_JFMAMJ_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean JFMAMJ 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_04JFMAMJ','-dpng')
close all
%%

%% 05
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_JJA_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_34_JJA_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_64_JJA_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_124_JJA_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean JJA 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_05JJA','-dpng')
close all
%%

%% 06
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_JAS_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_34_JAS_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_64_JAS_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_124_JAS_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean JAS 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_06JAS','-dpng')
close all
%%

%% 07
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_JJASON_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_34_JJASON_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_64_JJASON_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_124_JJASON_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean JJASON 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_07JJASON','-dpng')
close all
%%

%% 08
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_JASOND_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_34_JASOND_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_64_JASOND_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_124_JASOND_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean JASOND 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_08JASOND','-dpng')
close all
%%

%% 09
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_DN_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_32_DN_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_62_DN_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_122_DN_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean DN 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_09DN','-dpng')
close all
%%

%% 10
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(YC12,slice_depth_12,'LineWidth',lw-1,'Color',Color(cbd,:))
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
ylabel('Depth [m]')
hold on
yyaxis right
h1 = plot(YCS,ETAN_BSOSE_JD_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(YC3,ETAN_32_JD_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,ETAN_62_JD_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,ETAN_122_JD_slice_avg,'LineStyle','-','Marker','none',...
    'LineWidth',lw,'Color',Color(c12,:));
yline(0)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xlim(coords)
xtickformat('degrees')
ylabel('anomaly [m]')
title('mean JD 2017 SSH anomaly along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12','location','southeast')
acc_movie
acc_plots
hold off
print('ETAN_SLICE_10JD','-dpng')
close all
%%




toc()