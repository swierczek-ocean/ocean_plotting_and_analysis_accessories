clear
close all
clc
tic()

acc_colors
lwc = 1.9;

load BCs/SALT12BC
load XY12 Depth12
load RGdiffs *salt* XC* YC* RC*
load WOAdiffs *salt*
load ODAdiffs *salt*
load ECCOdiffs *salt*
load SODAdiffs *salt*

[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);


coords1 = [-59.6 -30.6 -4000 0];
coords2 = [-59.6 -54 -4000 0];
coords3 = [288.3 351.6 -4000 0];




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
contourf(XC12s,RC12s,mean(SALT12N,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgsaltdn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(woasaltdn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(sodasaltdn,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/SALT/SALTNB_1','-dpng')
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
contourf(XC12s,RC12s,mean(SALT12S,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgsaltds,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(woasaltds,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(sodasaltds,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/SALT/SALTSB_1','-dpng')
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
contourf(YC12e,RC12e,mean(SALT12E,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgsaltde,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(woasaltde,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(sodasaltde,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/SALT/SALTEB_1','-dpng')
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
contourf(YC12e,RC12e,mean(SALT12W,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgsaltdw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(woasaltdw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(sodasaltdw,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/SALT/SALTWB_1','-dpng')
close all


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


coords1 = [-59.6 -30.6 -4000 0];
coords2 = [-59.6 -54 -4000 0];
coords3 = [288.3 351.6 -4000 0];



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
contourf(XC12s,RC12s,mean(THETA12N,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgthetadn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(woathetadn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(sodathetadn,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/THETA/THETANB_1','-dpng')
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
contourf(XC12s,RC12s,mean(THETA12S,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgthetads,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(woathetads,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(sodathetads,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/THETA/THETASB_1','-dpng')
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
contourf(YC12e,RC12e,mean(THETA12E,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgthetade,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(woathetade,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(sodathetade,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/THETA/THETAEB_1','-dpng')
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
contourf(YC12e,RC12e,mean(THETA12W,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off


ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgthetadw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(woathetadw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(sodathetadw,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/THETA/THETAWB_1','-dpng')
close all


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


coords1 = [-59.6 -30.6 -4000 0];
coords2 = [-59.6 -54 -4000 0];
coords3 = [288.3 351.6 -4000 0];



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
contourf(XC12s,RC12s,mean(SALT12N,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgsaltdn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(eccosaltdn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(odasaltdn,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/SALT/SALTNB_2','-dpng')
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
contourf(XC12s,RC12s,mean(SALT12S,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgsaltds,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(eccosaltds,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(odasaltds,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/SALT/SALTSB_2','-dpng')
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
contourf(YC12e,RC12e,mean(SALT12E,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgsaltde,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(eccosaltde,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(odasaltde,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/SALT/SALTEB_2','-dpng')
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
contourf(YC12e,RC12e,mean(SALT12W,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgsaltdw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(eccosaltdw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(odasaltdw,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/SALT/SALTWB_2','-dpng')
close all


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


coords1 = [-59.6 -30.6 -4000 0];
coords2 = [-59.6 -54 -4000 0];
coords3 = [288.3 351.6 -4000 0];



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
contourf(XC12s,RC12s,mean(THETA12N,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgthetadn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(eccothetadn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(odathetadn,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/THETA/THETANB_2','-dpng')
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
contourf(XC12s,RC12s,mean(THETA12S,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgthetads,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(eccothetads,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(odathetads,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/THETA/THETASB_2','-dpng')
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
contourf(YC12e,RC12e,mean(THETA12E,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgthetade,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(eccothetade,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(odathetade,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/THETA/THETAEB_2','-dpng')
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
contourf(YC12e,RC12e,mean(THETA12W,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off


ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgthetadw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(eccothetadw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(odathetadw,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/THETA/THETAWB_2','-dpng')
close all


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


coords1 = [-59.6 -30.6 -2000 0];
coords2 = [-59.6 -54 -2000 0];
coords3 = [288.3 351.6 -2000 0];




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
contourf(XC12s,RC12s,mean(SALT12N,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgsaltdn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(woasaltdn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(sodasaltdn,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/SALT/SALTNB_1_shallow','-dpng')
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
contourf(XC12s,RC12s,mean(SALT12S,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgsaltds,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(woasaltds,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(sodasaltds,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/SALT/SALTSB_1_shallow','-dpng')
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
contourf(YC12e,RC12e,mean(SALT12E,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgsaltde,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(woasaltde,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(sodasaltde,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/SALT/SALTEB_1_shallow','-dpng')
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
contourf(YC12e,RC12e,mean(SALT12W,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgsaltdw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(woasaltdw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(sodasaltdw,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/SALT/SALTWB_1_shallow','-dpng')
close all


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


coords1 = [-59.6 -30.6 -2000 0];
coords2 = [-59.6 -54 -2000 0];
coords3 = [288.3 351.6 -2000 0];



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
contourf(XC12s,RC12s,mean(THETA12N,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgthetadn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(woathetadn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(sodathetadn,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/THETA/THETANB_1_shallow','-dpng')
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
contourf(XC12s,RC12s,mean(THETA12S,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgthetads,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(woathetads,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(sodathetads,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/THETA/THETASB_1_shallow','-dpng')
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
contourf(YC12e,RC12e,mean(THETA12E,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgthetade,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(woathetade,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(sodathetade,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/THETA/THETAEB_1_shallow','-dpng')
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
contourf(YC12e,RC12e,mean(THETA12W,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off


ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgthetadw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(woathetadw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('WOA18 - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(sodathetadw,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('SODA3 - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/THETA/THETAWB_1_shallow','-dpng')
close all


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


coords1 = [-59.6 -30.6 -2000 0];
coords2 = [-59.6 -54 -2000 0];
coords3 = [288.3 351.6 -2000 0];




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
contourf(XC12s,RC12s,mean(SALT12N,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgsaltdn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(eccosaltdn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(odasaltdn,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 30S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/SALT/SALTNB_2_shallow','-dpng')
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
contourf(XC12s,RC12s,mean(SALT12S,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgsaltds,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(eccosaltds,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(odasaltds,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 60S salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/SALT/SALTSB_2_shallow','-dpng')
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
contourf(YC12e,RC12e,mean(SALT12E,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgsaltde,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(eccosaltde,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(odasaltde,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 8W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/SALT/SALTEB_2_shallow','-dpng')
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
contourf(YC12e,RC12e,mean(SALT12W,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgsaltdw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(eccosaltdw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(odasaltdw,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 71W salinity [psu]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/SALT/SALTWB_2_shallow','-dpng')
close all


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


coords1 = [-59.6 -30.6 -2000 0];
coords2 = [-59.6 -54 -2000 0];
coords3 = [288.3 351.6 -2000 0];



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
contourf(XC12s,RC12s,mean(THETA12N,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgthetadn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(eccothetadn,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(odathetadn,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,512),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 30S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/THETA/THETANB_2_shallow','-dpng')
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
contourf(XC12s,RC12s,mean(THETA12S,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(XC12ss,RC12ss,mean(rgthetads,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(XC12s,RC12s,mean(eccothetads,3),'LineStyle','none','LevelList',z2);
hold on
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(XC12s,RC12s,mean(odathetads,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(XC12,-Depth12(:,1),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords3)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 60S potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/THETA/THETASB_2_shallow','-dpng')
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
contourf(YC12e,RC12e,mean(THETA12E,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgthetade,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(eccothetade,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(odathetade,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(756,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords1)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 8W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/THETA/THETAEB_2_shallow','-dpng')
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
contourf(YC12e,RC12e,mean(THETA12W,3),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb1 ub1])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off


ax2 = subplot(4,1,2);
contourf(YC12es,RC12es,mean(rgthetadw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('R&G - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
acc_movie
acc_quad_plots_stack(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(4,1,3);
contourf(YC12e,RC12e,mean(eccothetadw,3),'LineStyle','none','LevelList',z2);
hold on
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECCO4 - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(4,1,4);
contourf(YC12e,RC12e,mean(odathetadw,3),'LineStyle','none','LevelList',z2);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb2 ub2]);
plot(YC12,-Depth12(1,:),'Color','k','LineWidth',lwc)
caxis([lb2 ub2])
axis(coords2)
yticks([-1600 -1200 -800 -400 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('ECDA3.1 - BSOSE 2017 71W potential temperature [deg C]',...
    'FontWeight','Normal','FontSize',18)
xtickformat('degrees')
acc_movie
acc_quad_plots_stack(5,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','BCplots_4/BCshallow/THETA/THETAWB_2_shallow','-dpng')
close all


clear



toc()