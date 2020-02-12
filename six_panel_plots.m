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

cm1 = acc_colormap('cmo_balance');
cm2 = acc_colormap('cmo_amp');
load flux

cflux_3std = std(cflux_3,0,3);
cflux_6std = std(cflux_6,0,3);
cflux_12std = std(cflux_12,0,3);

tflux_3std = std(tflux_3,0,3);
tflux_6std = std(tflux_6,0,3);
tflux_12std = std(tflux_12,0,3);

cflux_3 = mean(cflux_3,3);
cflux_6 = mean(cflux_6,3);
cflux_12 = mean(cflux_12,3);

tflux_3 = mean(tflux_3,3);
tflux_6 = mean(tflux_6,3);
tflux_12 = mean(tflux_12,3);


[lb1,ub1,lbcb1,ubcb1,~] = get_color_bounds_balance(tflux_3,...
    tflux_3,tflux_6,tflux_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[lb2,ub2,~] = get_color_bounds_standard(tflux_3std,...
    tflux_3std,tflux_6std,tflux_12std,option);
% lb2 = 0;
nlvls = 100;
z = linspace(lb2,ub2,nlvls); 
z2 = [0,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,tflux_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(1,ax1,cm1,lbcb1,ubcb1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,tflux_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(2,ax2,cm1,lbcb1,ubcb1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,tflux_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(3,ax3,cm1,lbcb1,ubcb1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,tflux_3std,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 st dev of heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(4,ax4,cm2,lbcb1,ubcb1)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,tflux_6std,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 st dev of heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(5,ax5,cm2,lbcb1,ubcb1)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,tflux_12std,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 st dev of heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(6,ax6,cm2,lbcb1,ubcb1)
hold off

set(gcf,'InvertHardCopy','off');
print('-r100','heat_fluxes','-dpng')
close all

[lb1,ub1,lbcb1,ubcb1,~] = get_color_bounds_balance(cflux_3,...
    cflux_3,cflux_6,cflux_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls); 
z1 = [z(1)-100,z,z(end)+100];

[lb2,ub2,~] = get_color_bounds_standard(cflux_3std,...
    cflux_3std,cflux_6std,cflux_12std,option);
nlvls = 100;
% lb2 = 0;
z = linspace(0,ub2,nlvls); 
z2 = [0,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1610, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,cflux_3,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(1,ax1,cm1,lbcb1,ubcb1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,cflux_6,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(2,ax2,cm1,lbcb1,ubcb1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,cflux_12,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(3,ax3,cm1,lbcb1,ubcb1)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(XC3,YC3,cflux_3std,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 std of carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(4,ax4,cm2,lbcb1,ubcb1)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,cflux_6std,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 std of carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(5,ax5,cm2,lbcb1,ubcb1)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,cflux_12std,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 std of carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_bal(6,ax6,cm2,lbcb1,ubcb1)
hold off

set(gcf,'InvertHardCopy','off');
print('-r100','carbon_fluxes','-dpng')






















toc()