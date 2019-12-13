clear
close all
clc
tic()

load Topo12
z = -6000:50:5000;
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);

set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-70 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
m_grid('fontsize',16);
cbar = colorbar('eastoutside');
cbar.FontSize = 16;
title('topography of Argentine Basin and surrounding area','FontWeight','Normal','FontSize',18)
acc_mplots
print('-r200','AB_map_try_6','-dpng')





% %% 50m contour levels
% z = -6000:50:5000;
% coords = [290 350 -60 -30];
% 
% 
% cm = acc_colormap('cmo_topo');
% cm = cm(1:237,:);
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
% %% 











toc()