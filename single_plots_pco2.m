clear
close all
clc
tic()

acc_settings

%%
load XY3 YC3
load XY6 YC6
load XY12 YC12
load BSOSE_surf_slice_avgs PCO2_BSOSE* YCS
load MAT_files/AB122_output_PCO2_slice_vert PCO2_122*
load MAT_files/AB62_output_PCO2_slice_vert PCO2_62*
load MAT_files/AB32_output_PCO2_slice_vert PCO2_32*
load MAT_files/AB124_output_PCO2_slice_vert PCO2_124*
load MAT_files/AB64_output_PCO2_slice_vert PCO2_64*
load MAT_files/AB34_output_PCO2_slice_vert PCO2_34*
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
h1 = plot(YCS,PCO2_BSOSE_DJF_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_32_DJF_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_62_DJF_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_122_DJF_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean DJF 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_01DJF','-dpng')
close all
%%

%% 02
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_JFM_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_32_JFM_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_62_JFM_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_122_JFM_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean JFM 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_02JFM','-dpng')
close all
%%

%% 03
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_DJFMAM_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_32_DJFMAM_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_62_DJFMAM_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_122_DJFMAM_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean DJFMAM 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_03DJFMAM','-dpng')
close all
%%

%% 04
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_JFMAMJ_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_32_JFMAMJ_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_62_JFMAMJ_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_122_JFMAMJ_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean JFMAMJ 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_04JFMAMJ','-dpng')
close all
%%

%% 05
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_JJA_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_34_JJA_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_64_JJA_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_124_JJA_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean JJA 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_05JJA','-dpng')
close all
%%

%% 06
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_JAS_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_34_JAS_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_64_JAS_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_124_JAS_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean JAS 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_06JAS','-dpng')
close all
%%

%% 07
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_JJASON_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_34_JJASON_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_64_JJASON_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_124_JJASON_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean JJASON 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_07JJASON','-dpng')
close all
%%

%% 08
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_JASOND_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_34_JASOND_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_64_JASOND_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_124_JASOND_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean JASOND 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_08JASOND','-dpng')
close all
%%

%% 09
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_DN_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_32_DN_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_62_DN_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_122_DN_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean DN 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_09DN','-dpng')
close all
%%

%% 10
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(YCS,PCO2_BSOSE_JD_slice_avg,'LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(YC3,PCO2_32_JD_slice_avg,'LineWidth',lw,'Color',Color(c3,:));
h3 = plot(YC6,PCO2_62_JD_slice_avg,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(YC12,PCO2_122_JD_slice_avg,'LineWidth',lw,'Color',Color(c12,:));
xlim(coords)
xtickformat('degrees')
ylabel('[atm]')
title('mean JD 2017 pCO2 along 307 E','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'BSOSE','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('PCO2_SLICE_10JD','-dpng')
close all
%%

toc()