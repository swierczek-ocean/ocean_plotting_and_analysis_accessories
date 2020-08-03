clear
close all
clc
tic()

coords = [-85 -1 -65 -22];
acc_colors
lw = 3.8;
load new_depth
z = -6000:50:5000;
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);


% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% m_proj('albers','longitudes',[-79 -1], ...
%            'latitudes',[-68 -20]);
% m_contourf(XC-360,YC,Depth,'LineStyle','none','LevelList',z)
% hold on
% m_line([-8 -8],[-60 -30],'Color','w','LineWidth',lw+2);
% m_grid('fontsize',20);
% acc_mplots
% set(gcf,'InvertHardCopy','off');
% print('-r100','AB_bathy_w_slice','-dpng')
% close all

% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(Depth','LineStyle','none','LevelList',z)
% hold on
% contour(Domain','--','Color','w','LineWidth',lw)
% contour(Budget','Color','w','LineWidth',lw)
% cbar = colorbar('eastoutside');
% cbar.FontSize = 27;
% % axis(coords)
% title('Argentine Basin and surrounding area','FontWeight','Normal','FontSize',28)
% acc_plots
% set(gcf,'InvertHardCopy','off');
% 
% close all


x = linspace(100,110,50);
y = linspace(50,60,50);






set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-79 -1], ...
           'latitudes',[-68 -20]);
m_contourf(XC-360,YC,Depth,'LineStyle','none','LevelList',z)
hold on
m_contour(XC-360,YC,Domain,'--','Color','w','LineWidth',lw)
m_contour(XC-360,YC,Budget,'Color','w','LineWidth',lw)
h1 = m_line(x,y,'LineStyle','--','Color','w','LineWidth',lw);
h2 = m_line(x,y,'Color','w','LineWidth',lw);
m_grid('fontsize',23);
cbar = colorbar('eastoutside');
cbar.FontSize = 27;
title('Argentine Basin and surrounding area','FontWeight','Normal','FontSize',28)
acc_mplots
set(gcf,'InvertHardCopy','off');
print('-r200','AB_bathy_large_w_boxes','-dpng')
close all


for ii=129:237
    cm(ii,:) = Color(17,:);
end

set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-79 -1], ...
           'latitudes',[-68 -20]);
m_contourf(XC-360,YC,Depth,'LineStyle','none','LevelList',z)
hold on
m_coast('color','k');
m_contour(XC-360,YC,Domain,'--','Color','w','LineWidth',lw)
m_contour(XC-360,YC,Budget,'Color','w','LineWidth',lw)
h1 = m_line(x,y,'LineStyle','--','Color','w','LineWidth',lw);
h2 = m_line(x,y,'Color','w','LineWidth',lw);
m_grid('fontsize',23);
cbar = colorbar('eastoutside');
cbar.FontSize = 23;
title('Argentine Basin and surrounding area','FontWeight','Normal','FontSize',28)
acc_mplots
set(gcf,'InvertHardCopy','off');
print('-r200','AB_bathy_large_w_boxes_gray','-dpng')
close all



for ii=129:237
    cm(ii,:) = Color(36,:);
end

set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-79 -1], ...
           'latitudes',[-68 -20]);
m_contourf(XC-360,YC,Depth,'LineStyle','none','LevelList',z)
hold on
m_coast('color','k');
m_contour(XC-360,YC,Domain,'--','Color','w','LineWidth',lw)
m_contour(XC-360,YC,Budget,'Color','w','LineWidth',lw)
h1 = m_line(x,y,'LineStyle','--','Color','w','LineWidth',lw);
h2 = m_line(x,y,'Color','w','LineWidth',lw);
m_grid('fontsize',23);
cbar = colorbar('eastoutside');
cbar.FontSize = 27;
title('Argentine Basin and surrounding area','FontWeight','Normal','FontSize',28)
acc_mplots
set(gcf,'InvertHardCopy','off');
print('-r200','AB_bathy_large_w_boxes_gray_coast','-dpng')
close all

toc()