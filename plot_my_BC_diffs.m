
clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/VVEL12BC
load XY12 Depth12
load ECCOdiffs *vvel*
load SODAdiffs *vvel*
load ODAdiffs *vvel*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    cm = acc_colormap('cmo_balance');
    nlvls = 11;
    lb = -0.15;
    ub = 0.15;
    z = linspace(lb,ub,nlvls);
    z = [-0.3,z,0.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XC12s,RC12s,VVEL12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.15;
    ub = 0.15;
    nlvls = 16;
    z = linspace(lb,ub,nlvls);
    z = [-0.25,-0.20,z,0.20,0.25];
    
    ax2 = subplot(2,2,2);
    contourf(XC12s,RC12s,eccovveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12s,RC12s,sodavveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12s,RC12s,odavveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/BCshallow/VVEL/VVELNB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm = acc_colormap('cmo_balance');
    nlvls = 17;
    lb = -0.4;
    ub = 0.4;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XC12s,RC12s,VVEL12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.30;
    ub = 0.30;
    nlvls = 16;
    z = linspace(lb,ub,nlvls);
    z = [-0.45,-0.35,z,0.35,0.45];
    
    ax2 = subplot(2,2,2);
    contourf(XC12s,RC12s,eccovvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12s,RC12s,sodavvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12s,RC12s,odavvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/BCshallow/VVEL/VVELSB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm = acc_colormap('cmo_balance');
    nlvls = 19;
    lb = -0.3;
    ub = 0.3;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(YC12e,RC12e,VVEL12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.3;
    ub = 0.3;
    nlvls = 19;
    z = linspace(lb,ub,nlvls);
    z = [-0.45,-0.35,z,0.35,0.45];
    
    ax2 = subplot(2,2,2);
    contourf(YC12e,RC12e,eccovvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC12e,RC12e,sodavvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12e,RC12e,odavvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/BCshallow/VVEL/VVELEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm = acc_colormap('cmo_balance');
    nlvls = 17;
    lb = -0.32;
    ub = 0.32;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(YC12e,RC12e,VVEL12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.45;
    ub = 0.45;
    nlvls = 16;
    z = linspace(lb,ub,nlvls);
    z = [-0.55,-0.50,z,0.50,0.55];
    
    ax2 = subplot(2,2,2);
    contourf(YC12e,RC12e,eccovveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC12e,RC12e,sodavveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12e,RC12e,odavveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/BCshallow/VVEL/VVELWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/UVEL12BC
load XY12 Depth12
load ECCOdiffs *uvel*
load SODAdiffs *uvel*
load ODAdiffs *uvel*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    cm = acc_colormap('cmo_balance');
    nlvls = 17;
    lb = -0.2;
    ub = 0.2;
    z = linspace(lb,ub,nlvls);
    z = [-0.3,z,0.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XC12s,RC12s,UVEL12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.25;
    ub = 0.25;
    nlvls = 16;
    z = linspace(lb,ub,nlvls);
    z = [-0.35,-0.30,z,0.30,0.35];
    
    ax2 = subplot(2,2,2);
    contourf(XC12s,RC12s,eccouveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12s,RC12s,sodauveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12s,RC12s,odauveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/BCshallow/UVEL/UVELNB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm = acc_colormap('cmo_balance');
    nlvls = 21;
    lb = -0.5;
    ub = 0.5;
    z = linspace(lb,ub,nlvls);
    z = [-0.65,z,0.65];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XC12s,RC12s,UVEL12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.50;
    ub = 0.50;
    nlvls = 21;
    z = linspace(lb,ub,nlvls);
    z = [-0.65,-0.55,z,0.55,0.65];
    
    ax2 = subplot(2,2,2);
    contourf(XC12s,RC12s,eccouvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12s,RC12s,sodauvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12s,RC12s,odauvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/BCshallow/UVEL/UVELSB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm = acc_colormap('cmo_balance');
    nlvls = 19;
    lb = -0.3;
    ub = 0.3;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(YC12e,RC12e,UVEL12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    nlvls = 19;
    lb = -0.3;
    ub = 0.3;
    z = linspace(lb,ub,nlvls);
    z = [-0.4,z,0.4];
    
    ax2 = subplot(2,2,2);
    contourf(YC12e,RC12e,eccouvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC12e,RC12e,sodauvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12e,RC12e,odauvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/BCshallow/UVEL/UVELEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm = acc_colormap('cmo_balance');
    nlvls = 21;
    lb = -0.5;
    ub = 0.5;
    z = linspace(lb,ub,nlvls);
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(YC12e,RC12e,UVEL12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.45;
    ub = 0.45;
    nlvls = 19;
    z = linspace(lb,ub,nlvls);
    z = [-0.6,-0.50,z,0.50,0.6];
    
    ax2 = subplot(2,2,2);
    contourf(YC12e,RC12e,eccouveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC12e,RC12e,sodauveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12e,RC12e,odauveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/BCshallow/UVEL/UVELWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear



acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/VVEL12BC
load XY12 Depth12
load ECCOdiffs *vvel*
load SODAdiffs *vvel*
load ODAdiffs *vvel*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    cm = acc_colormap('cmo_balance');
    nlvls = 11;
    lb = -0.15;
    ub = 0.15;
    z = linspace(lb,ub,nlvls);
    z = [-0.3,z,0.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XC12s,RC12s,VVEL12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.15;
    ub = 0.15;
    nlvls = 16;
    z = linspace(lb,ub,nlvls);
    z = [-0.25,-0.20,z,0.20,0.25];
    
    ax2 = subplot(2,2,2);
    contourf(XC12s,RC12s,eccovveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12s,RC12s,sodavveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12s,RC12s,odavveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/VVEL/VVELNB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm = acc_colormap('cmo_balance');
    nlvls = 17;
    lb = -0.4;
    ub = 0.4;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XC12s,RC12s,VVEL12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.30;
    ub = 0.30;
    nlvls = 16;
    z = linspace(lb,ub,nlvls);
    z = [-0.45,-0.35,z,0.35,0.45];
    
    ax2 = subplot(2,2,2);
    contourf(XC12s,RC12s,eccovvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12s,RC12s,sodavvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12s,RC12s,odavvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/VVEL/VVELSB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm = acc_colormap('cmo_balance');
    nlvls = 19;
    lb = -0.3;
    ub = 0.3;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(YC12e,RC12e,VVEL12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.3;
    ub = 0.3;
    nlvls = 19;
    z = linspace(lb,ub,nlvls);
    z = [-0.45,-0.35,z,0.35,0.45];
    
    ax2 = subplot(2,2,2);
    contourf(YC12e,RC12e,eccovvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC12e,RC12e,sodavvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12e,RC12e,odavvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/VVEL/VVELEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm = acc_colormap('cmo_balance');
    nlvls = 17;
    lb = -0.32;
    ub = 0.32;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(YC12e,RC12e,VVEL12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.45;
    ub = 0.45;
    nlvls = 16;
    z = linspace(lb,ub,nlvls);
    z = [-0.55,-0.50,z,0.50,0.55];
    
    ax2 = subplot(2,2,2);
    contourf(YC12e,RC12e,eccovveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC12e,RC12e,sodavveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12e,RC12e,odavveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/VVEL/VVELWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/UVEL12BC
load XY12 Depth12
load ECCOdiffs *uvel*
load SODAdiffs *uvel*
load ODAdiffs *uvel*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    cm = acc_colormap('cmo_balance');
    nlvls = 17;
    lb = -0.2;
    ub = 0.2;
    z = linspace(lb,ub,nlvls);
    z = [-0.3,z,0.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XC12s,RC12s,UVEL12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.25;
    ub = 0.25;
    nlvls = 16;
    z = linspace(lb,ub,nlvls);
    z = [-0.35,-0.30,z,0.30,0.35];
    
    ax2 = subplot(2,2,2);
    contourf(XC12s,RC12s,eccouveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12s,RC12s,sodauveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12s,RC12s,odauveldn(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/UVEL/UVELNB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm = acc_colormap('cmo_balance');
    nlvls = 21;
    lb = -0.5;
    ub = 0.5;
    z = linspace(lb,ub,nlvls);
    z = [-0.65,z,0.65];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XC12s,RC12s,UVEL12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.50;
    ub = 0.50;
    nlvls = 21;
    z = linspace(lb,ub,nlvls);
    z = [-0.65,-0.55,z,0.55,0.65];
    
    ax2 = subplot(2,2,2);
    contourf(XC12s,RC12s,eccouvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12s,RC12s,sodauvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12s,RC12s,odauvelds(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/UVEL/UVELSB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm = acc_colormap('cmo_balance');
    nlvls = 19;
    lb = -0.3;
    ub = 0.3;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(YC12e,RC12e,UVEL12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    nlvls = 19;
    lb = -0.3;
    ub = 0.3;
    z = linspace(lb,ub,nlvls);
    z = [-0.4,z,0.4];
    
    ax2 = subplot(2,2,2);
    contourf(YC12e,RC12e,eccouvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC12e,RC12e,sodauvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12e,RC12e,odauvelde(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/UVEL/UVELEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm = acc_colormap('cmo_balance');
    nlvls = 21;
    lb = -0.5;
    ub = 0.5;
    z = linspace(lb,ub,nlvls);
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(YC12e,RC12e,UVEL12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    cm = acc_colormap('cmo_balance');
    lb = -0.45;
    ub = 0.45;
    nlvls = 19;
    z = linspace(lb,ub,nlvls);
    z = [-0.6,-0.50,z,0.50,0.6];
    
    ax2 = subplot(2,2,2);
    contourf(YC12e,RC12e,eccouveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO - 1/12 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC12e,RC12e,sodauveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA - 1/12 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12e,RC12e,odauveldw(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA - 1/12 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_2/UVEL/UVELWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear





toc()