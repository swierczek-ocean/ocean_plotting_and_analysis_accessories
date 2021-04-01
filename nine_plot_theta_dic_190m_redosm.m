clear
close all
clc
tic()

acc_settings

%%
load mask
load eddy_TSCO12_190m_sm
load eddy_TSCO6_190m_sm
load eddy_TSCO3_190m_sm


mask = permute(mask,[2,1,3]);
mask = mask(:,:,20);
inside_coords = [290.2 344.8 -54.85 -33.9];
nlvls = 200;
%%

%%


cm = acc_colormap('cmo_balance');

lb = -3.5e-5;
ub = 3.5e-5;
z = linspace(lb,ub,nlvls);


z = [-20,z,20];

cmd = 86400;
z = cmd.*z;
ub = cmd*ub;
lb = cmd*lb;

figure()
set(gcf, 'Position', [1, 1, 1600, 1050])
colormap(cm)

ax1 = subplot(3,3,1);
contourf(XC3,YC3,cmd.*wsalt3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(1,ax1,cm)
hold off

ax2 = subplot(3,3,2);
contourf(XC6,YC6,cmd.*wsalt6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/6 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(2,ax2,cm)
hold off

ax3 = subplot(3,3,3);
contourf(XC12,YC12,cmd.*wsalt12,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/12 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(3,ax3,cm)
hold off

ax4 = subplot(3,3,4);
contourf(XC3,YC3,cmd.*mwsalt3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(4,ax4,cm)
hold off

ax5 = subplot(3,3,5);
contourf(XC6,YC6,cmd.*mwsalt6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/6 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(5,ax5,cm)
hold off

ax6 = subplot(3,3,6);
contourf(XC12,YC12,cmd.*mwsalt12,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/12 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(6,ax6,cm)
hold off

ax7 = subplot(3,3,7);
contourf(XC3,YC3,cmd.*esalt3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(7,ax7,cm)
hold off

ax8 = subplot(3,3,8);
contourf(XC6,YC6,cmd.*esalt6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
title('1/6 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(8,ax8,cm)
hold off

ax9 = subplot(3,3,9);
contourf(XC12,YC12,cmd.*esalt12,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
title('1/12 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(9,ax9,cm)
hold off


set(gcf,'InvertHardCopy','off'); 
print('-r100','nine_plots_3/lr_salt','-dpng')
close all




%%

cm = acc_colormap('cmo_balance');

lb = -1.8e-6;
ub = 1.8e-6;
z = linspace(lb,ub,nlvls);


z = [-20,z,20];

cmd = 15.9994*86400/1000;
z = cmd.*z;
ub = cmd*ub;
lb = cmd*lb;

figure()
set(gcf, 'Position', [1, 1, 1600, 1050])
colormap(cm)

ax1 = subplot(3,3,1);
contourf(XC3,YC3,cmd.*wdo3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(1,ax1,cm)
hold off

ax2 = subplot(3,3,2);
contourf(XC6,YC6,cmd.*wdo6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/6 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(2,ax2,cm)
hold off

ax3 = subplot(3,3,3);
contourf(XC12,YC12,cmd.*wdo12,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/12 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(3,ax3,cm)
hold off

ax4 = subplot(3,3,4);
contourf(XC3,YC3,cmd.*mwdo3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(4,ax4,cm)
hold off

ax5 = subplot(3,3,5);
contourf(XC6,YC6,cmd.*mwdo6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/6 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(5,ax5,cm)
hold off

ax6 = subplot(3,3,6);
contourf(XC12,YC12,cmd.*mwdo12,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/12 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(6,ax6,cm)
hold off

ax7 = subplot(3,3,7);
contourf(XC3,YC3,cmd.*edo3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(7,ax7,cm)
hold off

ax8 = subplot(3,3,8);
contourf(XC6,YC6,cmd.*edo6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
title('1/6 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(8,ax8,cm)
hold off

ax9 = subplot(3,3,9);
contourf(XC12,YC12,cmd.*edo12,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
title('1/12 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(9,ax9,cm)
hold off


set(gcf,'InvertHardCopy','off'); 
print('-r100','nine_plots_3/lr_do','-dpng')
close all





%%

cm = acc_colormap('cmo_balance');

lb = -1.8e-6;
ub = 1.8e-6;
z = linspace(lb,ub,nlvls);

z = [-20,z,20];

cmd = 12.0107*86400/1000;
z = cmd.*z;
ub = cmd*ub;
lb = cmd*lb;

figure()
set(gcf, 'Position', [1, 1, 1600, 1050])
colormap(cm)

ax1 = subplot(3,3,1);
contourf(XC3,YC3,cmd.*wdic3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(1,ax1,cm)
hold off

ax2 = subplot(3,3,2);
contourf(XC6,YC6,cmd.*wdic6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/6 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(2,ax2,cm)
hold off

ax3 = subplot(3,3,3);
contourf(XC12,YC12,cmd.*wdic12,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/12 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(3,ax3,cm)
hold off

ax4 = subplot(3,3,4);
contourf(XC3,YC3,cmd.*mwdic3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(4,ax4,cm)
hold off

ax5 = subplot(3,3,5);
contourf(XC6,YC6,cmd.*mwdic6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/6 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(5,ax5,cm)
hold off

ax6 = subplot(3,3,6);
contourf(XC12,YC12,cmd.*mwdic12,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/12 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(6,ax6,cm)
hold off

ax7 = subplot(3,3,7);
contourf(XC3,YC3,cmd.*edic3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(7,ax7,cm)
hold off

ax8 = subplot(3,3,8);
contourf(XC6,YC6,cmd.*edic6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
title('1/6 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(8,ax8,cm)
hold off

ax9 = subplot(3,3,9);
contourf(XC12,YC12,cmd.*edic12,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
title('1/12 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(9,ax9,cm)
hold off


set(gcf,'InvertHardCopy','off'); 
print('-r100','nine_plots_3/lr_dic','-dpng')
close all

%% 
cm = acc_colormap('cmo_balance');

lb = -2.5e-4;
ub = 2.5e-4;
z = linspace(lb,ub,nlvls);


z = [-20,z,20];

cmd = 86400;
z = cmd.*z;
ub = cmd*ub;
lb = cmd*lb;

figure()
set(gcf, 'Position', [1, 1, 1600, 1050])
colormap(cm)

ax1 = subplot(3,3,1);
contourf(XC3,YC3,cmd.*wtheta3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(1,ax1,cm)
hold off

ax2 = subplot(3,3,2);
contourf(XC6,YC6,cmd.*wtheta6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/6 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(2,ax2,cm)
hold off

ax3 = subplot(3,3,3);
contourf(XC12,YC12,cmd.*wtheta12,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/12 total','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(3,ax3,cm)
hold off

ax4 = subplot(3,3,4);
contourf(XC3,YC3,cmd.*mwtheta3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(4,ax4,cm)
hold off

ax5 = subplot(3,3,5);
contourf(XC6,YC6,cmd.*mwtheta6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/6 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(5,ax5,cm)
hold off

ax6 = subplot(3,3,6);
contourf(XC12,YC12,cmd.*mwtheta12,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
title('1/12 mean','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(6,ax6,cm)
hold off

ax7 = subplot(3,3,7);
contourf(XC3,YC3,cmd.*etheta3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(7,ax7,cm)
hold off

ax8 = subplot(3,3,8);
contourf(XC6,YC6,cmd.*etheta6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
title('1/6 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(8,ax8,cm)
hold off

ax9 = subplot(3,3,9);
contourf(XC12,YC12,cmd.*etheta12,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
title('1/12 eddy','FontWeight','Normal','FontSize',18)
acc_movie_9
acc_9plots(9,ax9,cm)
hold off


set(gcf,'InvertHardCopy','off'); 
print('-r100','nine_plots_3/lr_theta','-dpng')
close all

%%



toc()