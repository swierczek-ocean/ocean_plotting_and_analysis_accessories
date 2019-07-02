clear
close all
clc

tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12 
load BSOSE_surf_avgs
load AB34_output
load AB64_output
load AB124_output
load AB32_output
load AB62_output
load AB122_output
%%

%%
mask = permute(mask,[2,1,3]);
outside_coords = [288.8 351.6 -59.6 -30.6];
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% THETA
cm = acc_colormap('thermal');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -3.5;
ub = 22;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,THETA_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,THETA_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,THETA_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_JJA','-dpng')
close all
%% END THETA

%% SALT
close all
cm = acc_colormap('haline');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 32;
ub = 37;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,SALT_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,SALT_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,SALT_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('SALT_AVG_JJA','-dpng')
%% END SALT

%% ETAN
close all
cm = acc_colormap('balance');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -1.8;
ub = 1.8;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

ETAN_mu = mean(ETAN_BSOSE_JJA_avg(ETAN_BSOSE_JJA_avg<1000));
ETAN_BSOSE_JJA_avg = ETAN_BSOSE_JJA_avg - ETAN_mu;
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('ETAN_AVG_JJA','-dpng')
%% END ETAN

%% TFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -330;
ub = 330;
lbcb = lb;
ubcb = 150;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,TFLUX_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,TFLUX_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,TFLUX_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,TFLUX_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('TFLUX_AVG_JJA','-dpng')
%% END TFLUX

%% SFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -0.005;
ub = 0.005;
lbcb = lb;
ubcb = 0.0025;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,SFLUX_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,SFLUX_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,SFLUX_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_JJA','-dpng')
%% END SFLUX

%% CFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -6e-7;
ub = 6e-7;
lbcb = -4e-7;
ubcb = ub;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('CFLUX_AVG_JJA','-dpng')
%% END CFLUX

%% OFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -2.5e-6;
ub = 2.5e-6;
lbcb = -2.4e-7;
ubcb = ub;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,OFLUX_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,OFLUX_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,OFLUX_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,OFLUX_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('OFLUX_AVG_JJA','-dpng')
%% END OFLUX

%% WVEL
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -1.9e-7;
ub = 1.9e-7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_AVG_JJA','-dpng')
%% END WVEL

%% WVEL STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 3e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_34_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_64_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_124_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_std_JJA','-dpng')
%% END WVEL STD

%% ETAN STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 0.5;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_34_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_64_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_124_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('ETAN_std_JJA','-dpng')
%% END ETAN STD

%% WVEL
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -1.9e-7;
ub = 1.9e-7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_34_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_64_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_124_JJA_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_AVG_JJA_outside','-dpng')
%% END WVEL

%% WVEL STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 3e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_34_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_64_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_124_JJA_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_std_JJA_outside','-dpng')
%% END WVEL STD

% %% THETA
% cm = acc_colormap('thermal');
% cm = [Color(:,46)';cm;Color(:,46)'];
% lb = -3.5;
% ub = 28;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,THETA_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,THETA_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,THETA_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,THETA_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('THETA_AVG_JJASON','-dpng')
% close all
% %% END THETA
% 
% %% SALT
% close all
% cm = acc_colormap('haline');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = 32.2;
% ub = 36.7;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,SALT_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean SSS','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,SALT_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean SSS','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,SALT_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean SSS','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,SALT_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean SSS','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('SALT_AVG_JJASON','-dpng')
% %% END SALT
% 
% %% ETAN
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,46)';cm;Color(:,46)'];
% lb = -2;
% ub = 2;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% ETAN_mu = mean(ETAN_BSOSE_JN_avg(ETAN_BSOSE_JN_avg<1000));
% ETAN_BSOSE_JN_avg = ETAN_BSOSE_JN_avg - ETAN_mu;
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,ETAN_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,ETAN_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,ETAN_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,ETAN_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('ETAN_AVG_JJASON','-dpng')
% %% END ETAN
% 
% %% TFLUX
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,46)';cm;Color(:,46)'];
% lb = -310;
% ub = 310;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,TFLUX_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean heat flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,TFLUX_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean heat flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,TFLUX_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean heat flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,TFLUX_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean heat flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('TFLUX_AVG_JJASON','-dpng')
% %% END TFLUX
% 
% %% SFLUX
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -0.0025;
% ub = 0.0025;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,SFLUX_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean salt flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,SFLUX_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean salt flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,SFLUX_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean salt flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,SFLUX_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean salt flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('SFLUX_AVG_JJASON','-dpng')
% %% END SFLUX
% 
% %% CFLUX
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -8e-7;
% ub = 8e-7;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,CFLUX_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,CFLUX_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,CFLUX_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,CFLUX_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('CFLUX_AVG_JJASON','-dpng')
% %% END CFLUX
% 
% %% OFLUX
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -2e-6;
% ub = 2e-6;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,OFLUX_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,OFLUX_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,OFLUX_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,OFLUX_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('OFLUX_AVG_JJASON','-dpng')
% %% END OFLUX
% 
% %% WVEL
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -2e-7;
% ub = 2e-7;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,WVEL_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,WVEL_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,WVEL_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,WVEL_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('WVEL_AVG_JJASON','-dpng')
% %% END WVEL
% 
% %% WVEL STD
% close all
% cm = acc_colormap('fire');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = 0;
% ub = 3e-6;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,WVEL_BSOSE_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,WVEL_34_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,WVEL_64_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,WVEL_124_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('WVEL_std_JJASON','-dpng')
% %% END WVEL STD
% 
% %% ETAN STD
% close all
% cm = acc_colormap('fire');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = 0;
% ub = 0.5;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,ETAN_BSOSE_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,ETAN_34_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,ETAN_64_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,ETAN_124_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('ETAN_std_JJASON','-dpng')
% %% END ETAN STD
% 
% %% WVEL
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -2e-7;
% ub = 2e-7;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,WVEL_BSOSE_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,WVEL_34_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,WVEL_64_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,WVEL_124_JN_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('WVEL_AVG_JJASON_outside','-dpng')
% %% END WVEL
% 
% %% WVEL STD
% close all
% cm = acc_colormap('fire');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = 0;
% ub = 3e-6;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,WVEL_BSOSE_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE JJASON 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,WVEL_34_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING JJASON 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,WVEL_64_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING JJASON 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,WVEL_124_JN_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING JJASON 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('WVEL_std_JJASON_outside','-dpng')
% %% END WVEL STD

%% THETA
cm = acc_colormap('thermal');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -0.5;
ub = 26;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,THETA_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,THETA_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,THETA_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_DJF','-dpng')
close all
%% END THETA

%% SALT
close all
cm = acc_colormap('haline');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 31;
ub = 37;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,SALT_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,SALT_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,SALT_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('SALT_AVG_DJF','-dpng')
%% END SALT

%% ETAN
close all
cm = acc_colormap('balance');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -1.8;
ub = 1.8;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

ETAN_mu = mean(ETAN_BSOSE_DJF_avg(ETAN_BSOSE_DJF_avg<1000));
ETAN_BSOSE_DJF_avg = ETAN_BSOSE_DJF_avg - ETAN_mu;
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('ETAN_AVG_DJF','-dpng')
%% END ETAN

%% TFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -275;
ub = 275;
lbcb = -15;
ubcb = ub;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,TFLUX_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,TFLUX_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,TFLUX_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,TFLUX_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('TFLUX_AVG_DJF','-dpng')
%% END TFLUX

%% SFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -0.005;
ub = 0.005;
lbcb = lb;
ubcb = 0.002;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,SFLUX_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,SFLUX_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,SFLUX_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_DJF','-dpng')
%% END SFLUX

%% CFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -8e-7;
ub = 8e-7;
lbcb = -2e-7;
ubcb = ub;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

CFLUX_32_DJF_avg(CFLUX_32_DJF_avg<10000&CFLUX_32_DJF_avg>7.8e-7)=7.8e-7;
CFLUX_62_DJF_avg(CFLUX_62_DJF_avg<10000&CFLUX_62_DJF_avg>7.8e-7)=7.8e-7;
CFLUX_122_DJF_avg(CFLUX_122_DJF_avg<10000&CFLUX_122_DJF_avg>7.8e-7)=7.8e-7;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('CFLUX_AVG_DJF','-dpng')
%% END CFLUX

%% OFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -2.5e-6;
ub = 2.5e-6;
lbcb = lb;
ubcb = 5e-8;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,OFLUX_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,OFLUX_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,OFLUX_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,OFLUX_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('OFLUX_AVG_DJF','-dpng')
%% END OFLUX

%% WVEL
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -2e-7;
ub = 2e-7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_AVG_DJF','-dpng')
%% END WVEL

%% WVEL STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 3e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_32_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_62_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_122_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_std_DJF','-dpng')
%% END WVEL STD

%% ETAN STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 0.55;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('ETAN_std_DJF','-dpng')
%% END ETAN STD

%% WVEL
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -2e-7;
ub = 2e-7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_32_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_62_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_122_DJF_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_AVG_DJF_outside','-dpng')
%% END WVEL

%% WVEL STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 3e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_32_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_62_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_122_DJF_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_std_DJF_outside','-dpng')
%% END WVEL STD

%% THETA
cm = acc_colormap('thermal');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -1.5;
ub = 24;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,THETA_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,THETA_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,THETA_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_DD','-dpng')
close all
%% END THETA

%% SALT
close all
cm = acc_colormap('haline');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 31;
ub = 37;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,SALT_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,SALT_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,SALT_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('SALT_AVG_DD','-dpng')
%% END SALT

%% ETAN
close all
cm = acc_colormap('balance');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -1.7;
ub = 1.7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

ETAN_mu = mean(ETAN_BSOSE_DD_avg(ETAN_BSOSE_DD_avg<1000));
ETAN_BSOSE_DD_avg = ETAN_BSOSE_DD_avg - ETAN_mu;
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('ETAN_AVG_DD','-dpng')
%% END ETAN

%% TFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -185;
ub = 185;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,TFLUX_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,TFLUX_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,TFLUX_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,TFLUX_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('TFLUX_AVG_DD','-dpng')
%% END TFLUX

%% SFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -0.005;
ub = 0.005;
lbcb = lb;
ubcb = 0.002;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,SFLUX_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,SFLUX_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,SFLUX_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_DD','-dpng')
%% END SFLUX

%% CFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -7e-7;
ub = 7e-7;
lbcb = -3.5e-7;
ubcb = ub;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('CFLUX_AVG_DD','-dpng')
%% END CFLUX

%% OFLUX
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -9e-7;
ub = 9e-7;
lbcb = lb;
ubcb = ub;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,OFLUX_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,OFLUX_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,OFLUX_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,OFLUX_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('OFLUX_AVG_DD','-dpng')
%% END OFLUX

%% WVEL
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -6e-8;
ub = 6e-8;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_AVG_DD','-dpng')
%% END WVEL

%% WVEL STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 2.8e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_32_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_62_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_122_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_std_DD','-dpng')
%% END WVEL STD

%% ETAN STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 0.45;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('ETAN_std_DD','-dpng')
%% END ETAN STD

%% WVEL
close all
cm = acc_colormap('balance');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -6e-8;
ub = 6e-8;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_32_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_62_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_122_DD_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_AVG_DD_outside','-dpng')
%% END WVEL

%% WVEL STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 2.8e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL_32_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL_62_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL_122_DD_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_std_DD_outside','-dpng')
%% END WVEL STD

% %% THETA
% cm = acc_colormap('thermal');
% cm = [Color(:,46)';cm;Color(:,46)'];
% lb = -3.5;
% ub = 28;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,THETA_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,THETA_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,THETA_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,THETA_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('THETA_AVG_DM','-dpng')
% close all
% %% END THETA
% 
% %% SALT
% close all
% cm = acc_colormap('haline');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = 32.2;
% ub = 36.7;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,SALT_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,SALT_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,SALT_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,SALT_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('SALT_AVG_DM','-dpng')
% %% END SALT
% 
% %% ETAN
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,46)';cm;Color(:,46)'];
% lb = -2;
% ub = 2;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% ETAN_mu = mean(ETAN_BSOSE_DM_avg(ETAN_BSOSE_DM_avg<1000));
% ETAN_BSOSE_DM_avg = ETAN_BSOSE_DM_avg - ETAN_mu;
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,ETAN_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,ETAN_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,ETAN_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,ETAN_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('ETAN_AVG_DM','-dpng')
% %% END ETAN
% 
% %% TFLUX
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,46)';cm;Color(:,46)'];
% lb = -310;
% ub = 310;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,TFLUX_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean heat flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,TFLUX_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean heat flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,TFLUX_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean heat flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,TFLUX_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean heat flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('TFLUX_AVG_DM','-dpng')
% %% END TFLUX
% 
% %% SFLUX
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -0.0025;
% ub = 0.0025;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,SFLUX_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,SFLUX_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,SFLUX_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,SFLUX_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('SFLUX_AVG_DM','-dpng')
% %% END SFLUX
% 
% %% CFLUX
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -8e-7;
% ub = 8e-7;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,CFLUX_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,CFLUX_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,CFLUX_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,CFLUX_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('CFLUX_AVG_DM','-dpng')
% %% END CFLUX
% 
% %% OFLUX
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -2e-6;
% ub = 2e-6;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,OFLUX_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,OFLUX_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,OFLUX_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,OFLUX_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('OFLUX_AVG_DM','-dpng')
% %% END OFLUX
% 
% %% WVEL
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -2e-7;
% ub = 2e-7;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,WVEL_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,WVEL_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,WVEL_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,WVEL_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('WVEL_AVG_DM','-dpng')
% %% END WVEL
% 
% %% WVEL STD
% close all
% cm = acc_colormap('fire');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = 0;
% ub = 3e-6;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,WVEL_BSOSE_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,WVEL_32_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,WVEL_62_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,WVEL_122_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('WVEL_std_DM','-dpng')
% %% END WVEL STD
% 
% %% ETAN STD
% close all
% cm = acc_colormap('fire');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = 0;
% ub = 0.5;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,ETAN_BSOSE_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,ETAN_32_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,ETAN_62_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,ETAN_122_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('ETAN_std_DM','-dpng')
% %% END ETAN STD
% 
% %% WVEL
% close all
% cm = acc_colormap('balance');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = -2e-7;
% ub = 2e-7;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,WVEL_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,WVEL_32_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,WVEL_62_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,WVEL_122_DM_avg,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 mean surf wvel','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('WVEL_AVG_DM_outside','-dpng')
% %% END WVEL
% 
% %% WVEL STD
% close all
% cm = acc_colormap('fire');
% cm = [Color(:,13)';cm;Color(:,46)'];
% lb = 0;
% ub = 3e-6;
% nlvls = 126;
% z = linspace(lb,ub,nlvls);
% z = [-100000,z,9999998];
% 
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% ax1 = subplot(2,2,1);
% contourf(XCS,YCS,WVEL_BSOSE_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% ytickformat('degrees')
% title('1/6 B-SOSE DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v1
% hold off
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,WVEL_32_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/3 MITgcm+BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v2
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,WVEL_62_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/6 MITgcm+BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v3
% hold off
% 
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,WVEL_122_DM_std,'LineStyle','none','LevelList',z);
% cbar = colorbar('eastoutside');
% set(cbar,'XLim',[lb ub]);
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([lb ub])
% axis(outside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('1/12 MITgcm+BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v4
% hold off
% print('WVEL_std_DM_outside','-dpng')
% %% END WVEL STD










toc()