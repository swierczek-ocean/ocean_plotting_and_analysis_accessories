clear
close all
clc
tic()

acc_settings

%%
load XY3 YC3
load XY6 YC6
load XY12 YC12
load BSOSE_surf_slice_avgs OFLUX_BSOSE* YCS
load MAT_files/AB122_output_OFLUX_slice_vert OFLUX_122*
load MAT_files/AB62_output_OFLUX_slice_vert OFLUX_62*
load MAT_files/AB32_output_OFLUX_slice_vert OFLUX_32*
load MAT_files/AB124_output_OFLUX_slice_vert OFLUX_124*
load MAT_files/AB64_output_OFLUX_slice_vert OFLUX_64*
load MAT_files/AB34_output_OFLUX_slice_vert OFLUX_34*
%%

%%
lw = 3.3;
ms = 20;
cb = 85;
c3 = 86;
c6 = 87;
c12 = 88;
coords = [-60 -32];
%%

%% 01
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_DJF_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_32_DJF_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_62_DJF_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_122_DJF_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean DJF 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_01DJF','-dpng')
close all
%%

%% 02
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_JFM_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_32_JFM_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_62_JFM_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_122_JFM_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean JFM 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_02JFM','-dpng')
close all
%%

%% 03
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_DJFMAM_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_32_DJFMAM_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_62_DJFMAM_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_122_DJFMAM_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean DJFMAM 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_03DJFMAM','-dpng')
close all
%%

%% 04
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_JFMAMJ_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_32_JFMAMJ_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_62_JFMAMJ_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_122_JFMAMJ_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean JFMAMJ 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_04JFMAMJ','-dpng')
close all
%%

%% 05
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_JJA_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_34_JJA_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_64_JJA_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_124_JJA_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean JJA 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_05JJA','-dpng')
close all
%%

%% 06
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_JAS_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_34_JAS_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_64_JAS_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_124_JAS_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean JAS 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_06JAS','-dpng')
close all
%%

%% 07
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_JJASON_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_34_JJASON_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_64_JJASON_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_124_JJASON_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean JJASON 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_07JJASON','-dpng')
close all
%%

%% 08
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_JASOND_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_34_JASOND_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_64_JASOND_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_124_JASOND_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean JASOND 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_08JASOND','-dpng')
close all
%%

%% 09
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_DN_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_32_DN_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_62_DN_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_122_DN_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean DN 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_09DN','-dpng')
close all
%%

%% 10
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,OFLUX_BSOSE_JD_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,OFLUX_32_JD_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,OFLUX_62_JD_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,OFLUX_122_JD_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[mol/m^2/sec ]')
title('mean JD 2017 O2 flux along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OFLUX_SLICE_10JD','-dpng')
close all
%%

toc()