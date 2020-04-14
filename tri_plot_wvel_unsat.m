clear
close all
clc
tic()

acc_settings

%%
load mask
load wvel3
load wvel6
load wvel12
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


for ii=1:52
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,wvel3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 mean ',num2str(RF3(ii)),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,wvel6(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 mean ',num2str(RF3(ii)),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,wvel12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 mean ',num2str(RF3(ii)),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['WVEL_PLOTS/mean_unsat/WVEL_',num2str(ii,'%02.f'),'_',num2str(RF3(ii)),'m_mean'],'-dpng')
    close all
end





toc()