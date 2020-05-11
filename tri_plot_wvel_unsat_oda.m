clear
close all
clc
tic()

acc_settings

%%
load mask
load ../2020_03_March_analysis/wvel3
load ../2020_03_March_analysis/wvel6
load ../2020_03_March_analysis/wvel12
clear wvel*sd
load ODA oda_wvel XCt YCt
oda_wvel = squeeze(mean(oda_wvel,4));
[XCt,YCt] = ndgrid(XCt,YCt);
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
nlvls = 100;
%%

%% 

cm = acc_colormap('cmo_balance');
lb = -3e-4;
ub = 3e-4;
z = linspace(lb,ub,nlvls);

z = [-4e-4,z,4e-4];

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
    contourf(XC3,YC3,wvel3(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
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
    contourf(XC6,YC6,wvel6(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
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
    contourf(XC12,YC12,wvel12(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
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
    set(gcf,'InvertHardCopy','off'); print('-r100',['WVEL_PLOTS/mean/WVEL_',num2str(mlvl(ii),'%02.f'),'_',num2str(RF3(mlvl(ii))),'m_mean'],'-dpng')
    close all
end






toc()