clear
close all
clc
tic()

%%
acc_colors

load XY3 XC3 YC3
[XC3,YC3] = ndgrid(XC3,YC3);
load XY6 XC6 YC6
[XC6,YC6] = ndgrid(XC6,YC6);
load XY12 XC12 YC12
[XC12,YC12] = ndgrid(XC12,YC12);
load mask
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
option = 2;

cm1 = flipud(acc_colormap('cmo_deep'));
cm2 = acc_colormap('cmo_amp');
load Carbon_60m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Carbon_60m_mean_3,...
    Carbon_60m_mean_3,Carbon_60m_mean_6,Carbon_60m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Carbon_60m_std_3,...
    Carbon_60m_std_3,Carbon_60m_std_6,Carbon_60m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Carbon_60m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean DIC of upper 60m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Carbon_60m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean DIC of upper 60m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Carbon_60m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean DIC of upper 60m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Carbon_60m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std of upper 60m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Carbon_60m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std of upper 60m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Carbon_60m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std of upper 60m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_carbon_60m','-dpng')

clear Carbon*
close all

cm1 = flipud(acc_colormap('cmo_deep'));
cm2 = acc_colormap('cmo_amp');
load Carbon_100m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Carbon_100m_mean_3,...
    Carbon_100m_mean_3,Carbon_100m_mean_6,Carbon_100m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Carbon_100m_std_3,...
    Carbon_100m_std_3,Carbon_100m_std_6,Carbon_100m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Carbon_100m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean DIC of upper 100m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Carbon_100m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean DIC of upper 100m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Carbon_100m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean DIC of upper 100m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Carbon_100m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std of upper 100m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Carbon_100m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std of upper 100m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Carbon_100m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std of upper 100m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_carbon_100m','-dpng')

clear Carbon*

cm1 = flipud(acc_colormap('cmo_deep'));
cm2 = acc_colormap('cmo_amp');
load Carbon_190m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Carbon_190m_mean_3,...
    Carbon_190m_mean_3,Carbon_190m_mean_6,Carbon_190m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Carbon_190m_std_3,...
    Carbon_190m_std_3,Carbon_190m_std_6,Carbon_190m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Carbon_190m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean DIC of upper 190m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Carbon_190m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean DIC of upper 190m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Carbon_190m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean DIC of upper 190m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Carbon_190m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std of upper 190m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Carbon_190m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std of upper 190m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Carbon_190m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std of upper 190m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_carbon_190m','-dpng')

clear Carbon*
close all

cm1 = flipud(acc_colormap('cmo_deep'));
cm2 = acc_colormap('cmo_amp');
load Carbon_250m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Carbon_250m_mean_3,...
    Carbon_250m_mean_3,Carbon_250m_mean_6,Carbon_250m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Carbon_250m_std_3,...
    Carbon_250m_std_3,Carbon_250m_std_6,Carbon_250m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Carbon_250m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean DIC of upper 250m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Carbon_250m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean DIC of upper 250m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Carbon_250m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean DIC of upper 250m [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Carbon_250m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std of upper 250m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Carbon_250m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std of upper 250m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Carbon_250m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std of upper 250m DIC [mol C/m^3]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_carbon_250m','-dpng')

clear Carbon*
close all


cm1 = acc_colormap('cmo_thermal');
cm2 = acc_colormap('cmo_amp');
load Heat_60m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Heat_60m_mean_3,...
    Heat_60m_mean_3,Heat_60m_mean_6,Heat_60m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Heat_60m_std_3,...
    Heat_60m_std_3,Heat_60m_std_6,Heat_60m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Heat_60m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean theta of upper 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Heat_60m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean theta of upper 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Heat_60m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean theta of upper 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Heat_60m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std heat 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Heat_60m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std heat 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Heat_60m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std heat 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_heat_60m','-dpng')

clear Heat*
close all

cm1 = acc_colormap('cmo_thermal');
cm2 = acc_colormap('cmo_amp');
load Heat_100m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Heat_100m_mean_3,...
    Heat_100m_mean_3,Heat_100m_mean_6,Heat_100m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Heat_100m_std_3,...
    Heat_100m_std_3,Heat_100m_std_6,Heat_100m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Heat_100m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean theta of upper 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Heat_100m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean theta of upper 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Heat_100m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean theta of upper 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Heat_100m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std heat 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Heat_100m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std heat 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Heat_100m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std heat 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_heat_100m','-dpng')

clear Heat*
close all

cm1 = acc_colormap('cmo_thermal');
cm2 = acc_colormap('cmo_amp');
load Heat_190m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Heat_190m_mean_3,...
    Heat_190m_mean_3,Heat_190m_mean_6,Heat_190m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Heat_190m_std_3,...
    Heat_190m_std_3,Heat_190m_std_6,Heat_190m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Heat_190m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean theta of upper 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Heat_190m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean theta of upper 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Heat_190m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean theta of upper 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Heat_190m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std heat 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Heat_190m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std heat 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Heat_190m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std heat 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_heat_190m','-dpng')

clear Heat*
close all

cm1 = acc_colormap('cmo_thermal');
cm2 = acc_colormap('cmo_amp');
load Heat_250m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Heat_250m_mean_3,...
    Heat_250m_mean_3,Heat_250m_mean_6,Heat_250m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Heat_250m_std_3,...
    Heat_250m_std_3,Heat_250m_std_6,Heat_250m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Heat_250m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean theta of upper 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Heat_250m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean theta of upper 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Heat_250m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean theta of upper 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Heat_250m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std heat 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Heat_250m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std heat 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Heat_250m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std heat 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_heat_250m','-dpng')

clear Heat*
close all

cm1 = acc_colormap('es_coolwarm');
cm2 = acc_colormap('cmo_amp');
load Heat_60m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Heat_60m_mean_3,...
    Heat_60m_mean_3,Heat_60m_mean_6,Heat_60m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Heat_60m_std_3,...
    Heat_60m_std_3,Heat_60m_std_6,Heat_60m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Heat_60m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean theta of upper 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Heat_60m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean theta of upper 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Heat_60m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean theta of upper 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Heat_60m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std heat 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Heat_60m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std heat 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Heat_60m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std heat 60m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_heat_2_60m','-dpng')

clear Heat*
close all

cm1 = acc_colormap('es_coolwarm');
cm2 = acc_colormap('cmo_amp');
load Heat_100m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Heat_100m_mean_3,...
    Heat_100m_mean_3,Heat_100m_mean_6,Heat_100m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Heat_100m_std_3,...
    Heat_100m_std_3,Heat_100m_std_6,Heat_100m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Heat_100m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean theta of upper 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Heat_100m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean theta of upper 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Heat_100m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean theta of upper 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Heat_100m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std heat 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Heat_100m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std heat 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Heat_100m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std heat 100m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_heat_2_100m','-dpng')

clear Heat*
close all

cm1 = acc_colormap('es_coolwarm');
cm2 = acc_colormap('cmo_amp');
load Heat_190m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Heat_190m_mean_3,...
    Heat_190m_mean_3,Heat_190m_mean_6,Heat_190m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Heat_190m_std_3,...
    Heat_190m_std_3,Heat_190m_std_6,Heat_190m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Heat_190m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean theta of upper 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Heat_190m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean theta of upper 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Heat_190m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean theta of upper 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Heat_190m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std heat 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Heat_190m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std heat 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Heat_190m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std heat 190m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_heat_2_190m','-dpng')

clear Heat*
close all

cm1 = acc_colormap('es_coolwarm');
cm2 = acc_colormap('cmo_amp');
load Heat_250m_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(Heat_250m_mean_3,...
    Heat_250m_mean_3,Heat_250m_mean_6,Heat_250m_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(Heat_250m_std_3,...
    Heat_250m_std_3,Heat_250m_std_6,Heat_250m_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,Heat_250m_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean theta of upper 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,Heat_250m_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean theta of upper 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,Heat_250m_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean theta of upper 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,Heat_250m_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std heat 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,Heat_250m_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std heat 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,Heat_250m_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std heat 250m [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_heat_2_250m','-dpng')

clear Heat*
close all

cm1 = acc_colormap('es_coolwarm');
cm2 = acc_colormap('cmo_amp');
load SST_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(SST_mean_3,...
    SST_mean_3,SST_mean_6,SST_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(SST_std_3,...
    SST_std_3,SST_std_6,SST_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,SST_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,SST_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,SST_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,SST_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,SST_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,SST_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_SST_2','-dpng')

cm1 = acc_colormap('cmo_thermal');
cm2 = acc_colormap('cmo_amp');
load SST_mean_std

[lb1,ub1,nlvls] = get_color_bounds_standard(SST_mean_3,...
    SST_mean_3,SST_mean_6,SST_mean_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[~,ub2,nlvls] = get_color_bounds_standard(SST_std_3,...
    SST_std_3,SST_std_6,SST_std_12,option);
nlvls = 100;
z = linspace(0,ub2,nlvls); 
z2 = [z,z(end)+100];
lb2 = 0;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,SST_mean_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,SST_mean_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,SST_mean_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,SST_std_3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,SST_std_6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,SST_std_12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std SST [deg C]','FontWeight','Normal','FontSize',14)
acc_movie
acc_6plots(6,ax6,cm2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','int_plots/mean_std_SST_1','-dpng')

close all

toc()