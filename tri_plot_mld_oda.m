clear
close all
clc
tic()

acc_settings

%%
load mask
load MLD_mean
load ODA oda_mld XCt YCt
oda_mld = mean(oda_mld,3);
[XCt,YCt] = ndgrid(XCt,YCt);
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];

%%

%% 

cm = acc_colormap('cmo_deep');
cm = cm.^2;
lb = 0;
ub = 150;

nlvls = 201;
z = linspace(lb,ub,nlvls);
z = [z,200];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax1 = subplot(2,2,1);
contourf(XCt,YCt,oda_mld,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('GFDL ODA mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off


ax2 = subplot(2,2,2);
contourf(XC3,YC3,-mld3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,-mld6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,-mld12,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r100','MLD__mean','-dpng')
close all







toc()