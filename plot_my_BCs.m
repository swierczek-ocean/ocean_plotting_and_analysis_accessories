
clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/VVEL3BC
load BCs/VVEL6BC
load BCs/VVEL12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    
    nlvls = 11;
    lb = -0.15;
    ub = 0.15;
    z = linspace(lb,ub,nlvls);
    z = [-0.3,z,0.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,VVEL3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,VVEL6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/VVEL/VVELNB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    nlvls = 17;
    lb = -0.4;
    ub = 0.4;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,VVEL3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,VVEL6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/VVEL/VVELSB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    nlvls = 17;
    lb = -0.32;
    ub = 0.32;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,VVEL3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,VVEL6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/VVEL/VVELWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    nlvls = 19;
    lb = -0.3;
    ub = 0.3;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,VVEL3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,VVEL6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/VVEL/VVELEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end


clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/UVEL3BC
load BCs/UVEL6BC
load BCs/UVEL12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    
    nlvls = 17;
    lb = -0.2;
    ub = 0.2;
    z = linspace(lb,ub,nlvls);
    z = [-0.3,z,0.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,UVEL3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,UVEL6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/UVEL/UVELNB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    nlvls = 21;
    lb = -0.5;
    ub = 0.5;
    z = linspace(lb,ub,nlvls);
    z = [-0.65,z,0.65];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,UVEL3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,UVEL6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/UVEL/UVELSB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    nlvls = 21;
    lb = -0.5;
    ub = 0.5;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,UVEL3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,UVEL6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/UVEL/UVELWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    nlvls = 19;
    lb = -0.4;
    ub = 0.4;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,UVEL3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,UVEL6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/UVEL/UVELEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/SALT3BC
load BCs/SALT6BC
load BCs/SALT12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_haline');


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    
    nlvls = 8;
    lb = 34.2;
    ub = 37;
    z = linspace(lb,ub,nlvls);
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,SALT3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,SALT6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,SALT12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/SALT/SALTNB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    nlvls = 6;
    lb = 33;
    ub = 35;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,SALT3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,SALT6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,SALT12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/SALT/SALTSB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    nlvls = 7;
    lb = 33.6;
    ub = 34.8;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,SALT3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,SALT6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,SALT12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/SALT/SALTWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    nlvls = 11;
    lb = 33;
    ub = 36;
    z = linspace(lb,ub,nlvls);
    z = [32,z,37];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,SALT3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,SALT6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,SALT12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/SALT/SALTEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end


clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/THETA3BC
load BCs/THETA6BC
load BCs/THETA12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_thermal');


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    
    nlvls = 27;
    lb = 0;
    ub = 26;
    z = linspace(lb,ub,nlvls);
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,THETA3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,THETA6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,THETA12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/THETA/THETANB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    nlvls = 10;
    lb = -2;
    ub = 7;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,THETA3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,THETA6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,THETA12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/THETA/THETASB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    nlvls = 11;
    lb = 0;
    ub = 10;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,THETA3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,THETA6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,THETA12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/THETA/THETAWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    nlvls = 23;
    lb = -2;
    ub = 20;
    z = linspace(lb,ub,nlvls);
    z = [z,25];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,THETA3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,THETA6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,THETA12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/THETA/THETAEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end




clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/DIC3BC
load BCs/DIC6BC
load BCs/DIC12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_tempo');

nlvls = 7;
lb = 2.10;
ub = 2.34;
z = linspace(lb,ub,nlvls);
% z = [0,0.5,1,1.5,1.6,1.7,1.8,1.9,2,2.1,z];
z = [1,z];
coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,DIC3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,DIC6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,DIC12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/DIC/DICNB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,DIC3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,DIC6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,DIC12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/DIC/DICSB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,DIC3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,DIC6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,DIC12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/DIC/DICWB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,DIC3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,DIC6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,DIC12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/BCshallow/DIC/DICEB_',num2str(ii,'%02.f'),'_',names(ii,:),'_shallow'],'-dpng')
    close all
end




clear
close all
clc

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/VVEL3BC
load BCs/VVEL6BC
load BCs/VVEL12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    
    nlvls = 11;
    lb = -0.15;
    ub = 0.15;
    z = linspace(lb,ub,nlvls);
    z = [-0.3,z,0.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,VVEL3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,VVEL6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/VVEL/VVELNB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    nlvls = 17;
    lb = -0.4;
    ub = 0.4;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,VVEL3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,VVEL6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/VVEL/VVELSB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    nlvls = 17;
    lb = -0.32;
    ub = 0.32;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,VVEL3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,VVEL6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/VVEL/VVELWB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    nlvls = 19;
    lb = -0.3;
    ub = 0.3;
    z = linspace(lb,ub,nlvls);
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,VVEL3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,VVEL6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W meridional velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/VVEL/VVELEB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
end


clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/UVEL3BC
load BCs/UVEL6BC
load BCs/UVEL12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    
    nlvls = 17;
    lb = -0.2;
    ub = 0.2;
    z = linspace(lb,ub,nlvls);
    z = [-0.3,z,0.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,UVEL3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,UVEL6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/UVEL/UVELNB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    nlvls = 21;
    lb = -0.5;
    ub = 0.5;
    z = linspace(lb,ub,nlvls);
    z = [-0.65,z,0.65];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,UVEL3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,UVEL6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/UVEL/UVELSB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    nlvls = 21;
    lb = -0.5;
    ub = 0.5;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,UVEL3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,UVEL6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/UVEL/UVELWB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    nlvls = 19;
    lb = -0.4;
    ub = 0.4;
    z = linspace(lb,ub,nlvls);
    z = [-0.5,z,0.5];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,UVEL3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,UVEL6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W zonal velocity [m/s]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
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
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/UVEL/UVELEB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
end

clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/SALT3BC
load BCs/SALT6BC
load BCs/SALT12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_haline');


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    
    nlvls = 8;
    lb = 34.2;
    ub = 37;
    z = linspace(lb,ub,nlvls);
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,SALT3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,SALT6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,SALT12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/SALT/SALTNB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    nlvls = 6;
    lb = 33;
    ub = 35;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,SALT3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,SALT6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,SALT12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/SALT/SALTSB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    nlvls = 7;
    lb = 33.6;
    ub = 34.8;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,SALT3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,SALT6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,SALT12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/SALT/SALTWB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    nlvls = 11;
    lb = 33;
    ub = 36;
    z = linspace(lb,ub,nlvls);
    z = [32,z,37];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,SALT3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,SALT6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,SALT12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/SALT/SALTEB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
end


clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/THETA3BC
load BCs/THETA6BC
load BCs/THETA12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_thermal');


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    
    nlvls = 27;
    lb = 0;
    ub = 26;
    z = linspace(lb,ub,nlvls);
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,THETA3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,THETA6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,THETA12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/THETA/THETANB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    nlvls = 10;
    lb = -2;
    ub = 7;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,THETA3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,THETA6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,THETA12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/THETA/THETASB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    nlvls = 11;
    lb = 0;
    ub = 10;
    z = linspace(lb,ub,nlvls);
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,THETA3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,THETA6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,THETA12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/THETA/THETAWB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    nlvls = 23;
    lb = -2;
    ub = 20;
    z = linspace(lb,ub,nlvls);
    z = [z,25];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,THETA3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,THETA6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,THETA12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/THETA/THETAEB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
end




clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/DIC3BC
load BCs/DIC6BC
load BCs/DIC12BC
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3

[YC3e,RC3e] = ndgrid(YC3,RC3);
[YC6e,RC6e] = ndgrid(YC6,RC6);
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC3s,RC3s] = ndgrid(XC3,RC3);
[XC6s,RC6s] = ndgrid(XC6,RC6);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm = acc_colormap('cmo_tempo');

nlvls = 7;
lb = 2.10;
ub = 2.34;
z = linspace(lb,ub,nlvls);
% z = [0,0.5,1,1.5,1.6,1.7,1.8,1.9,2,2.1,z];
z = [1,z];
coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,DIC3N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,132),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 30S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,DIC6N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,260),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 30S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,DIC12N(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/DIC/DICNB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(XC3s,RC3s,DIC3S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC3,-Depth3(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 60S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(XC6s,RC6s,DIC6S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(XC6,-Depth6(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 60S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(XC12s,RC12s,DIC12S(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/DIC/DICSB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,DIC3W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 71W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,DIC6W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 71W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,DIC12W(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s4
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/DIC/DICWB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
    
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(3,1,1);
    contourf(YC3e,RC3e,DIC3E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC3,-Depth3(192,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/3 ',names(ii,:),' 2017 8W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s1
    hold off
    
    ax3 = subplot(3,1,2);
    contourf(YC6e,RC6e,DIC6E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    plot(YC6,-Depth6(384,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/6 ',names(ii,:),' 2017 8W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_tri_plots_s2
    hold off
    
    ax4 = subplot(3,1,3);
    contourf(YC12e,RC12e,DIC12E(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb ub])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W DIC concentration [mol C/m^3]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_tri_plots_s3
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_1/DIC/DICEB_',num2str(ii,'%02.f'),'_',names(ii,:)],'-dpng')
    close all
end



toc()