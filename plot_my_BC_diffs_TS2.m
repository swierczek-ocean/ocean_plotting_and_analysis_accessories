clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/SALT12BC
load XY12 Depth12
load RGdiffs *salt* XC* YC* RC*
load WOAdiffs *salt*
load ODAdiffs *salt*
load ECCOdiffs *salt*
load SODAdiffs *salt*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 8;
    lb1 = 34.2;
    ub1 = 37;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -1;
    ub2 = 1;
    nlvls = 17;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1.2,z,1.2];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,SALT12N(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgsaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,woasaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,sodasaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/SALT/SALTNB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 7;
    lb1 = 33;
    ub1 = 35;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.6;
    ub2 = 0.6;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1,-0.8,z,0.8,1];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,SALT12S(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgsaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,woasaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,sodasaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/SALT/SALTSB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 11;
    lb1 = 33;
    ub1 = 36;
    z1 = linspace(lb1,ub1,nlvls);
    z1 = [32,z1,37];
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.9;
    ub2 = 0.9;
    nlvls = 19;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1.3,-1.1,z,1.1,1.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,SALT12E(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgsaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,woasaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,sodasaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/SALT/SALTEB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 7;
    lb1 = 33.6;
    ub1 = 34.8;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.4;
    ub2 = 0.4;
    nlvls = 9;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-0.6,-0.5,z,0.5,0.6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,SALT12W(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgsaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,woasaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,sodasaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/SALT/SALTWB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/THETA12BC
load XY12 Depth12
load RGdiffs *theta* XC* YC* RC*
load WOAdiffs *theta*
load ODAdiffs *theta*
load ECCOdiffs *theta*
load SODAdiffs *theta*
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm1 = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 27;
    lb1 = 0;
    ub1 = 26;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -4;
    ub2 = 4;
    nlvls = 17;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-5,z,5];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,THETA12N(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgthetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,woathetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,sodathetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/THETA/THETANB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 10;
    lb1 = -2;
    ub1 = 7;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -3;
    ub2 = 3;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-4,z,4];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,THETA12S(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgthetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,woathetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,sodathetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/THETA/THETASB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 23;
    lb1 = -2;
    ub1 = 20;
    z1 = linspace(lb1,ub1,nlvls);
    z1 = [z1,25];
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -4.5;
    ub2 = 4.5;
    nlvls = 19;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-6,-5,z,5,6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,THETA12E(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgthetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,woathetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,sodathetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/THETA/THETAEB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 11;
    lb1 = 0;
    ub1 = 10;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -3;
    ub2 = 3;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-6,-4,z,4,6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,THETA12W(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgthetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,woathetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,sodathetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/THETA/THETAWB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/SALT12BC
load XY12 Depth12
load RGdiffs *salt* XC* YC* RC*
load ECCOdiffs *salt*
load ODAdiffs *salt*
load ECCOdiffs *salt*
load SODAdiffs *salt*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 8;
    lb1 = 34.2;
    ub1 = 37;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -1;
    ub2 = 1;
    nlvls = 17;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1.2,z,1.2];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,SALT12N(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgsaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,eccosaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,odasaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/SALT/SALTNB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 7;
    lb1 = 33;
    ub1 = 35;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.6;
    ub2 = 0.6;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1,-0.8,z,0.8,1];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,SALT12S(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgsaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,eccosaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,odasaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/SALT/SALTSB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 11;
    lb1 = 33;
    ub1 = 36;
    z1 = linspace(lb1,ub1,nlvls);
    z1 = [32,z1,37];
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.9;
    ub2 = 0.9;
    nlvls = 19;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1.3,-1.1,z,1.1,1.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,SALT12E(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgsaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,eccosaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,odasaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/SALT/SALTEB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 7;
    lb1 = 33.6;
    ub1 = 34.8;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.4;
    ub2 = 0.4;
    nlvls = 9;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-0.6,-0.5,z,0.5,0.6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,SALT12W(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgsaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,eccosaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,odasaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/SALT/SALTWB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/THETA12BC
load XY12 Depth12
load RGdiffs *theta* XC* YC* RC*
load ECCOdiffs *theta*
load ODAdiffs *theta*
load ECCOdiffs *theta*
load SODAdiffs *theta*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm1 = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -5000 0];
coords2 = [-59.6 -54 -5000 0];
coords3 = [288.3 351.6 -5000 0];


for ii=1:12
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 27;
    lb1 = 0;
    ub1 = 26;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -4;
    ub2 = 4;
    nlvls = 17;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-5,z,5];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,THETA12N(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgthetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,eccothetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,odathetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/THETA/THETANB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 10;
    lb1 = -2;
    ub1 = 7;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -3;
    ub2 = 3;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-4,z,4];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,THETA12S(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgthetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,eccothetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,odathetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/THETA/THETASB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 23;
    lb1 = -2;
    ub1 = 20;
    z1 = linspace(lb1,ub1,nlvls);
    z1 = [z1,25];
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -4.5;
    ub2 = 4.5;
    nlvls = 19;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-6,-5,z,5,6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,THETA12E(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgthetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,eccothetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,odathetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/THETA/THETAEB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 11;
    lb1 = 0;
    ub1 = 10;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -3;
    ub2 = 3;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-6,-4,z,4,6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,THETA12W(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgthetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,eccothetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,odathetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-4000 -3000 -2000 -1000 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/THETA/THETAWB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/SALT12BC
load XY12 Depth12
load RGdiffs *salt* XC* YC* RC*
load WOAdiffs *salt*
load ODAdiffs *salt*
load ECCOdiffs *salt*
load SODAdiffs *salt*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 8;
    lb1 = 34.2;
    ub1 = 37;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -1;
    ub2 = 1;
    nlvls = 17;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1.2,z,1.2];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,SALT12N(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgsaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,woasaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,sodasaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/SALT/SALTNB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 7;
    lb1 = 33;
    ub1 = 35;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.6;
    ub2 = 0.6;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1,-0.8,z,0.8,1];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,SALT12S(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgsaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,woasaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,sodasaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/SALT/SALTSB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 11;
    lb1 = 33;
    ub1 = 36;
    z1 = linspace(lb1,ub1,nlvls);
    z1 = [32,z1,37];
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.9;
    ub2 = 0.9;
    nlvls = 19;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1.3,-1.1,z,1.1,1.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,SALT12E(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgsaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,woasaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,sodasaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/SALT/SALTEB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 7;
    lb1 = 33.6;
    ub1 = 34.8;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.4;
    ub2 = 0.4;
    nlvls = 9;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-0.6,-0.5,z,0.5,0.6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,SALT12W(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgsaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,woasaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,sodasaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/SALT/SALTWB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/THETA12BC
load XY12 Depth12
load RGdiffs *theta* XC* YC* RC*
load WOAdiffs *theta*
load ODAdiffs *theta*
load ECCOdiffs *theta*
load SODAdiffs *theta*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm1 = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 27;
    lb1 = 0;
    ub1 = 26;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -4;
    ub2 = 4;
    nlvls = 17;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-5,z,5];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,THETA12N(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgthetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,woathetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,sodathetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/THETA/THETANB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 10;
    lb1 = -2;
    ub1 = 7;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -3;
    ub2 = 3;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-4,z,4];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,THETA12S(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgthetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,woathetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,sodathetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/THETA/THETASB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 23;
    lb1 = -2;
    ub1 = 20;
    z1 = linspace(lb1,ub1,nlvls);
    z1 = [z1,25];
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -4.5;
    ub2 = 4.5;
    nlvls = 19;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-6,-5,z,5,6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,THETA12E(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgthetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,woathetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,sodathetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/THETA/THETAEB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 11;
    lb1 = 0;
    ub1 = 10;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -3;
    ub2 = 3;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-6,-4,z,4,6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,THETA12W(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgthetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,woathetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['WOA18 - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,sodathetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['SODA3 - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/THETA/THETAWB_',num2str(ii,'%02.f'),'_1_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

clear
close all
clc
tic()

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/SALT12BC
load XY12 Depth12
load RGdiffs *salt* XC* YC* RC*
load ECCOdiffs *salt*
load ODAdiffs *salt*
load ECCOdiffs *salt*
load SODAdiffs *salt*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 8;
    lb1 = 34.2;
    ub1 = 37;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -1;
    ub2 = 1;
    nlvls = 17;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1.2,z,1.2];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,SALT12N(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgsaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,eccosaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,odasaltdn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 30S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/SALT/SALTNB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 7;
    lb1 = 33;
    ub1 = 35;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.6;
    ub2 = 0.6;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1,-0.8,z,0.8,1];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,SALT12S(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgsaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,eccosaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,odasaltds(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 60S salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/SALT/SALTSB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 11;
    lb1 = 33;
    ub1 = 36;
    z1 = linspace(lb1,ub1,nlvls);
    z1 = [32,z1,37];
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.9;
    ub2 = 0.9;
    nlvls = 19;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-1.3,-1.1,z,1.1,1.3];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,SALT12E(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgsaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,eccosaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,odasaltde(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 8W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/SALT/SALTEB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm1 = acc_colormap('cmo_haline');
    nlvls = 7;
    lb1 = 33.6;
    ub1 = 34.8;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -0.4;
    ub2 = 0.4;
    nlvls = 9;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-0.6,-0.5,z,0.5,0.6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,SALT12W(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgsaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,eccosaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,odasaltdw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 71W salinity [psu]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/SALT/SALTWB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear

acc_colors
lwc = 1.9;

names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];

load BCs/THETA12BC
load XY12 Depth12
load RGdiffs *theta* XC* YC* RC*
load ECCOdiffs *theta*
load ODAdiffs *theta*
load ECCOdiffs *theta*
load SODAdiffs *theta*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);



cm1 = acc_colormap('cmo_balance');


coords1 = [-59.6 -30.6 -1000 0];
coords2 = [-59.6 -54 -1000 0];
coords3 = [288.3 351.6 -1000 0];


for ii=1:12
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 27;
    lb1 = 0;
    ub1 = 26;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -4;
    ub2 = 4;
    nlvls = 17;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-5,z,5];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,THETA12N(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgthetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,eccothetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,odathetadn(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 30S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/THETA/THETANB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 10;
    lb1 = -2;
    ub1 = 7;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -3;
    ub2 = 3;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-4,z,4];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(XC12s,RC12s,THETA12S(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(XC12ss,RC12ss,rgthetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(XC12s,RC12s,eccothetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(XC12s,RC12s,odathetads(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords3)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 60S potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/THETA/THETASB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 23;
    lb1 = -2;
    ub1 = 20;
    z1 = linspace(lb1,ub1,nlvls);
    z1 = [z1,25];
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -4.5;
    ub2 = 4.5;
    nlvls = 19;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-6,-5,z,5,6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,THETA12E(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgthetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,eccothetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,odathetade(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords1)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 8W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/THETA/THETAEB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
    
    cm1 = acc_colormap('cmo_thermal');
    nlvls = 11;
    lb1 = 0;
    ub1 = 10;
    z1 = linspace(lb1,ub1,nlvls);
    
    cm2 = acc_colormap('cmo_balance');
    lb2 = -3;
    ub2 = 3;
    nlvls = 13;
    z = linspace(lb2,ub2,nlvls);
    z2 = [-6,-4,z,4,6];
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm1)
    
    ax1 = subplot(4,1,1);
    contourf(YC12e,RC12e,THETA12W(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb1 ub1])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    
    ax2 = subplot(4,1,2);
    contourf(YC12es,RC12es,rgthetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['R&G - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    acc_movie
    acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(4,1,3);
    contourf(YC12e,RC12e,eccothetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECCO4 - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(4,1,4);
    contourf(YC12e,RC12e,odathetadw(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb2 ub2]);
    plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
    caxis([lb2 ub2])
    axis(coords2)
    yticks([-800 -600 -400 -200 0])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    title(['ECDA3.1 - 1/12 ',names(ii,:),' 2017 71W potential temperature [deg C]'],...
        'FontWeight','Normal','FontSize',18)
    xtickformat('degrees')
    acc_movie
    acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['BCplots_3/BCshallow/THETA/THETAWB_',num2str(ii,'%02.f'),'_2_',names(ii,:),'_shallow'],'-dpng')
    close all
end

clear



toc()