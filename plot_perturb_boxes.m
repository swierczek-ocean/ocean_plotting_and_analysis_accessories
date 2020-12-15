clear
close all
clc
tic()

load ../2020_06_June_analysis/XY3 XC3 YC3
load ../2020_06_June_analysis/XY12 XC12 YC12
load ../2020_07_July_Analysis/new_depth


[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
p3 = zeros(size(XC3));
p32 = zeros(size(XC3));
p12 = zeros(size(XC12));
p122 = zeros(size(XC12));

p3(36:140,18:100) = 1;
p32(102:107,80:87) = 1;
p12(137:556,63:391) = 1;
p122(401:424,310:342) = 1;


coords = [-85 -1 -65 -22];
acc_colors
lw = 4;
z = -6000:50:5000;
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);

set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-79 -1], ...
           'latitudes',[-68 -20]);
m_contourf(XC-360,YC,Depth,'LineStyle','none','LevelList',z)
hold on
m_contour(XC-360,YC,Domain,'Color','w','LineWidth',lw)
% m_contour(XC-360,YC,Budget,'--','Color','w','LineWidth',lw)
% m_contour(XC3-360,YC3,p3,'Color','r','LineWidth',lw)
m_contour(XC12-360,YC12,p12,'Color','k','LineWidth',lw)
m_contour(XC12-360,YC12,p12,'--','Color','w','LineWidth',lw-1.8)
% m_contour(XC3-360,YC3,p32,'Color','r','LineWidth',lw)
m_contour(XC12-360,YC12,p122,'Color','k','LineWidth',lw)
m_contour(XC12-360,YC12,p122,'--','Color','w','LineWidth',lw-1.8)
m_grid('fontsize',21);
title('Argentine Basin with wind stress perturbation windows','FontWeight','Normal','FontSize',28)
acc_mplots
set(gcf,'InvertHardCopy','off');
print('-r200','AB_bathy_w_perturb_2','-dpng')
close all











toc()