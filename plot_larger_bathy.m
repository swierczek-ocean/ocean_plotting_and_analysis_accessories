clear
close all
clc
tic()

acc_settings
load Topo12

% %% 50m contour levels
z = -6000:50:5000;
% coords = [250 350 -75 -22.5];
% 
% 
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Topo12,'LineStyle','none','LevelList',z)
% hold on
% % contour(XC12,YC12,mask12(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% ytickformat('degrees')
% xtickformat('degrees')
% title('Argentine Basin and surrounding area','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('-r300','AB_BATHY_50','-dpng')
% close all
%% 
coords = [250 350 -75 -22.5];

set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-110 -10], ...
           'latitudes',[-75 -22]);
m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on

m_grid('fontsize',20);
cbar = colorbar('eastoutside');
cbar.FontSize = 20;
title('Argentine Basin and surrounding area','FontWeight','Normal','FontSize',28)
acc_mplots
set(gcf,'InvertHardCopy','off');
print('-r200','AB_bathy_large_a','-dpng')
close all


set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)
m_proj('lambert','longitudes',[-110 -10], ...
           'latitudes',[-75 -22.5]);
m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on

m_grid('fontsize',18);
cbar = colorbar('eastoutside');
cbar.FontSize = 18;
title('Argentine Basin and surrounding area','FontWeight','Normal','FontSize',28)
acc_mplots
set(gcf,'InvertHardCopy','off');
print('-r200','AB_bathy_large_l','-dpng')

toc()