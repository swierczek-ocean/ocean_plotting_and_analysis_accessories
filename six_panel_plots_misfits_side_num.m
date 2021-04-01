clear
close all
clc
tic()

%%
acc_colors

inside_coords = [-58.9 -31.8 -2030 0];



load contour_misfit
[lat,depth] = ndgrid(lat_grd,-depth_grd);
clear *_grd

cm1 = acc_colormap('cmo_amp');
cm2 = cm1;

lb1 = 0;
ub1 = 400;
lb2 = 0;
ub2 = 150;
lbcb1 = lb1;
ubcb1 = ub1;
lbcb2 = lb2;
ubcb2 = ub2;
z1 = linspace(lb1,ub1,41);
z2 = linspace(lb2,ub2,16);
z1 = [z1,1000];
z2 = [z2,500];
sz = 35;
lw = 2;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(lat,depth,theta_zonal_3n,'LineStyle','none','LevelList',z1)
hold on
caxis([lb1 ub1])
axis(inside_coords)
set(gca,'xdir','reverse')
title('1/3  theta # profiles','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2balznum(1,ax1,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

ax2 = subplot(2,3,2);
contourf(lat,depth,theta_zonal_6n,'LineStyle','none','LevelList',z1)
hold on
caxis([lb1 ub1])
axis(inside_coords)
set(gca,'xdir','reverse')
title('1/6  theta # profiles','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2balznum(2,ax2,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

ax3 = subplot(2,3,3);
contourf(lat,depth,theta_zonal_12n,'LineStyle','none','LevelList',z1)
hold on
caxis([lb1 ub1])
axis(inside_coords)
set(gca,'xdir','reverse')
title('1/12  theta # profiles','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2balznum(3,ax3,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contourf(lat,depth,dic_zonal_3n,'LineStyle','none','LevelList',z2)
hold on
caxis([lb2 ub2])
axis(inside_coords)
set(gca,'xdir','reverse')
title('1/3  DIC # profiles','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2balznum(4,ax4,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

ax5 = subplot(2,3,5);
contourf(lat,depth,dic_zonal_6n,'LineStyle','none','LevelList',z2)
hold on
caxis([lb2 ub2])
axis(inside_coords)
set(gca,'xdir','reverse')
title('1/6  DIC # profiles','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2balznum(5,ax5,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

ax6 = subplot(2,3,6);
contourf(lat,depth,dic_zonal_12n,'LineStyle','none','LevelList',z2)
hold on
caxis([lb2 ub2])
axis(inside_coords)
set(gca,'xdir','reverse')
title('1/12  DIC # profiles','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2balznum(6,ax6,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r100','Argo_misfits_zonal_3n','-dtiff')
close all







toc()


