clear
close all
clc
tic()

load MURd

ss = 172;
ws = 355;

sst_mur_ss = murday(:,:,ss);
sst_mur_ws = murday(:,:,ws);
sst_mur_5ss = mean(murday(:,:,170:174),3);
sst_mur_5ws = mean(murday(:,:,353:357),3);

clear murday

load SST_TS

sst_3_ss = SST_TS_3(:,:,ss);
sst_3_ws = SST_TS_3(:,:,ws);
sst_3_5ss = mean(SST_TS_3(:,:,170:174),3);
sst_3_5ws = mean(SST_TS_3(:,:,353:357),3);

clear SST_TS_3

sst_6_ss = SST_TS_6(:,:,ss);
sst_6_ws = SST_TS_6(:,:,ws);
sst_6_5ss = mean(SST_TS_6(:,:,170:174),3);
sst_6_5ws = mean(SST_TS_6(:,:,353:357),3);

clear SST_TS_6

sst_12_ss = SST_TS_12(:,:,ss);
sst_12_ws = SST_TS_12(:,:,ws);
sst_12_5ss = mean(SST_TS_12(:,:,170:174),3);
sst_12_5ws = mean(SST_TS_12(:,:,353:357),3);

clear SST_TS_12

sst_3_ss(sst_3_ss==0) = NaN;
sst_6_ss(sst_6_ss==0) = NaN;
sst_12_ss(sst_12_ss==0) = NaN;
sst_3_ws(sst_3_ws==0) = NaN;
sst_6_ws(sst_6_ws==0) = NaN;
sst_12_ws(sst_12_ws==0) = NaN;
sst_3_5ss(sst_3_5ss==0) = NaN;
sst_6_5ss(sst_6_5ss==0) = NaN;
sst_12_5ss(sst_12_5ss==0) = NaN;
sst_3_5ws(sst_3_5ws==0) = NaN;
sst_6_5ws(sst_6_5ws==0) = NaN;
sst_12_5ws(sst_12_5ws==0) = NaN;

load mask
mask = permute(mask,[2,1,3]);
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
acc_colors

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
[murlon,murlat] = ndgrid(murlon,murlat);

inside_coords = [290.5 350.2 -58.7 -32];

cm = acc_colormap('es_coolwarm');

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/cSST_01_SS','-dpng')
close all


cm = acc_colormap('es_coolwarm');

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/cSST_02_SS5','-dpng')
close all

cm = acc_colormap('es_coolwarm');

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/cSST_03_WS','-dpng')
close all


cm = acc_colormap('es_coolwarm');

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/cSST_04_WS5','-dpng')
close all

cm = acc_colormap('cmo_thermal');

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/tSST_01_SS','-dpng')
close all


cm = acc_colormap('cmo_thermal');

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/tSST_02_SS5','-dpng')
close all

cm = acc_colormap('cmo_thermal');

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/tSST_03_WS','-dpng')
close all


cm = acc_colormap('cmo_thermal');

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/tSST_04_WS5','-dpng')
close all

cm = magma();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/rSST_01_SS','-dpng')
close all


cm = magma();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/rSST_02_SS5','-dpng')
close all

cm = magma();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/rSST_03_WS','-dpng')
close all


cm = magma();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/rSST_04_WS5','-dpng')
close all

cm = plasma();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/gSST_01_SS','-dpng')
close all


cm = plasma();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/gSST_02_SS5','-dpng')
close all

cm = plasma();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/gSST_03_WS','-dpng')
close all


cm = plasma();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/gSST_04_WS5','-dpng')
close all

cm = inferno();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/pSST_01_SS','-dpng')
close all


cm = inferno();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/pSST_02_SS5','-dpng')
close all

cm = inferno();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/pSST_03_WS','-dpng')
close all


cm = inferno();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/pSST_04_WS5','-dpng')
close all


cm = viridis();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/jSST_01_SS','-dpng')
close all


cm = viridis();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/jSST_02_SS5','-dpng')
close all

cm = viridis();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/jSST_03_WS','-dpng')
close all


cm = viridis();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/jSST_04_WS5','-dpng')
close all

cm = fake_parula();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/hSST_01_SS','-dpng')
close all


cm = fake_parula();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/hSST_02_SS5','-dpng')
close all

cm = fake_parula();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/hSST_03_WS','-dpng')
close all


cm = fake_parula();

lb = 0;
ub = 23;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-1,-0.5,z,23,23.25,23.5,23.75,24,24.5,25,26];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_5ws,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_5ws,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 December 19-23 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST/hSST_04_WS5','-dpng')
close all





toc()