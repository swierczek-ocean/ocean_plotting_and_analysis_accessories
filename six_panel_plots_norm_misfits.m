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



load PROFILES/processed/theta_mfn_3
load PROFILES/processed/theta_mfn_6
load PROFILES/processed/theta_mfn_12
load PROFILES/processed/dic_mfn_3
load PROFILES/processed/dic_mfn_6
load PROFILES/processed/dic_mfn_12



cm1 = acc_colormap('es_coolwarm');
cm2 = cm1;

lb1 = -10;
ub1 = 10;
lb2 = -10;
ub2 = 10;
lbcb1 = lb1;
ubcb1 = ub1;
lbcb2 = lb2;
ubcb2 = ub2;
sz = 35;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(theta_mfn_3(1,:),theta_mfn_3(2,:),sz,theta_mfn_3(3,:),...
    'filled')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 theta 0-300m normalized misfit','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2bal(1,ax1,cm1,lbcb1,ubcb1,lbcb2,ubcb2)

hold off

ax2 = subplot(2,3,2);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(theta_mfn_6(1,:),theta_mfn_6(2,:),sz,theta_mfn_6(3,:),...
    'filled')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 theta 0-300m normalized misfit','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2bal(2,ax2,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

ax3 = subplot(2,3,3);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(theta_mfn_12(1,:),theta_mfn_12(2,:),sz,theta_mfn_12(3,:),...
    'filled')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 theta 0-300m normalized misfit','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2bal(3,ax3,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

% colormap(cm2)

ax4 = subplot(2,3,4);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(dic_mfn_3(1,:),dic_mfn_3(2,:),sz,dic_mfn_3(3,:),...
    'filled')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 DIC 0-300m normalized misfit','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2bal(4,ax4,cm2,lbcb1,ubcb1,lbcb2,ubcb2)

hold off

ax5 = subplot(2,3,5);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(dic_mfn_6(1,:),dic_mfn_6(2,:),sz,dic_mfn_6(3,:),...
    'filled')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 DIC 0-300m normalized misfit','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2bal(5,ax5,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

ax6 = subplot(2,3,6);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(dic_mfn_12(1,:),dic_mfn_12(2,:),sz,dic_mfn_12(3,:),...
    'filled')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 DIC 0-300m normalized misfit','FontWeight','Normal','FontSize',18)
acc_movie_2
acc_6plots_2bal(6,ax6,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r100','Argo_misfits_norm_bal','-dpng')
close all






toc()