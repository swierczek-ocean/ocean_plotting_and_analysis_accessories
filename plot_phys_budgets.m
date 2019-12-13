clear
close all
clc
tic()

load Budgets3
load Budgets6
load Budgets12
load 3_surf_avgs
% load 6_surf_avgs
% load 12_surf_avgs
load Topo12
TXC12 = XC12;
TYC12 = YC12;

load XY3 XC3 YC3
[XC3,YC3] = ndgrid(XC3,YC3);
load XY6 XC6 YC6
[XC6,YC6] = ndgrid(XC6,YC6);
load XY12 XC12 YC12
[XC12,YC12] = ndgrid(XC12,YC12);

XC3 = XC3 - 360;
XC6 = XC6 - 360;
XC12 = XC12 - 360;

acc_colors
c1 = 61;
c2 = 13;
cs = 61;
lw = 2.9;
ms = 20;
cb = 85;
cbd = 36;
c3 = 86;
c6 = 87;
c12 = 88;
qw = 7;
j3 = 3;

% cm = acc_colormap('cmo_topo');
% cm = cm(1:237,:);
% z = -6000:50:5000;
% 
% set(gcf, 'Position', [1, 1, 1300, 850])
% 
% colormap(cm)
% m_proj('albers','longitudes',[-70 -10], ...
%            'latitudes',[-60 -30]);
% m_contourf(TXC12-360,TYC12,Topo12,'LineStyle','none','LevelList',z)
% hold on
% m_quiver(XC3(1:j3:end,1:j3:end)-360,YC3(1:j3:end,1:j3:end),...
%     uvel3_2017(1:j3:end,1:j3:end),vvel3_2017(1:j3:end,1:j3:end),3,'Color','r')
% m_grid('fontsize',14);
% 
% title('1/3 avg surface currents','FontWeight','Normal','FontSize',14)
% acc_mplots
% hold off


%print('-r300','AB_PHYS_BUDGETS','-dpng')


cm = flipud(acc_colormap('cmo_tempo'));
z = 0:0.02:1.2;

set(gcf, 'Position', [1, 1, 1300, 850])

colormap(cm)
m_proj('albers','longitudes',[-70 -10], ...
           'latitudes',[-60 -30]);

m_contourf(XC3,YC3,speed3_2017,'LineStyle','none','LevelList',z)
hold on

% m_quiver(XC3(1:j3:end,1:j3:end),YC3(1:j3:end,1:j3:end),...
%     uvel3_2017(1:j3:end,1:j3:end),vvel3_2017(1:j3:end,1:j3:end),3,'Color','r')
m_grid('fontsize',14);

title('1/3 avg surface currents','FontWeight','Normal','FontSize',14)
acc_mplots
hold off







% cbar = colorbar('eastoutside');
% cbar.FontSize = 16;

toc()