clear
close all
clc
tic()

acc_settings

%%
load ../2020_03_March_analysis/wvel3 RF3
load mask
load smooth_fields
load ODA oda_mld oda_wvel oda_theta XCt YCt
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
contourf(XCt,YCt,-mld3int,'LineStyle','none','LevelList',z);
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
contourf(XCt,YCt,-mld6int,'LineStyle','none','LevelList',z);
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
contourf(XCt,YCt,-mld12int,'LineStyle','none','LevelList',z);
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
set(gcf,'InvertHardCopy','off'); print('-r100','MLD_smooth_mean','-dpng')
close all


%% 

cm = acc_colormap('cmo_balance');

lb = -3e-5;
ub = 3e-5;
z = linspace(lb,ub,nlvls);

z = [-4e-4,-3e-4,-2e-4,-1e-4,-9e-5,-8e-5,-7e-5,-6e-5,-5e-5,-4e-5,z,...
    4e-5,5e-5,6e-5,7e-5,8e-5,9e-5,1e-4,2e-4,3e-4,4e-4];

RF3 = abs(RF3);

mlvl = [3,5:23,26,30,32,36,41,44];
olvl = [1:15,17,19,21,23,24,27,30,31,34,38,41];

for ii=1:26
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XCt,YCt,oda_wvel(:,:,olvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['GFDL ODA mean ',num2str(RF3(mlvl(ii))),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v1
    hold off
    
    
    ax2 = subplot(2,2,2);
    contourf(XCt,YCt,wvel3int(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 mean ',num2str(RF3(mlvl(ii))),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XCt,YCt,wvel6int(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 mean ',num2str(RF3(mlvl(ii))),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XCt,YCt,wvel12int(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 mean ',num2str(RF3(mlvl(ii))),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['WVEL_PLOTS/mean_smooth/WVEL_',num2str(mlvl(ii),'%02.f'),'_',num2str(RF3(mlvl(ii))),'m_smooth_mean'],'-dpng')
    close all
end


%% 

cm = acc_colormap('cmo_thermal');

lb = -1;
ub = 20;
z = linspace(lb,ub,nlvls);
z = [-2,z,22];
RC3 = abs(RC3);

mlvl = [2,5:21,25,32,36,40,41,44];
olvl = [1,3:15,17,19,21,23,27,32,35,38,39,42];

for ii=1:24
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XCt,YCt,oda_theta(:,:,olvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['GFDL ODA mean ',num2str(RC3(mlvl(ii))),'m theta [deg C]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v1
    hold off
    
    
    ax2 = subplot(2,2,2);
    contourf(XCt,YCt,theta3int(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 mean ',num2str(RC3(mlvl(ii))),'m theta [deg C]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XCt,YCt,theta6int(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 mean ',num2str(RC3(mlvl(ii))),'m theta [deg C]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XCt,YCt,theta12int(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 mean ',num2str(RC3(mlvl(ii))),'m theta [deg C]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['THETA_PLOTS/mean_smooth/THETA_',num2str(mlvl(ii),'%02.f'),'_',num2str(RC3(mlvl(ii))),'m_smooth_mean'],'-dpng')
    close all
end




toc()