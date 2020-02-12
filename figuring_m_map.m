clear
close all
clc
tic()

nn = 200;
x1 = linspace(-70.15,-15.15,nn);
y1 = -55.*ones(1,nn);
y2 = -34.*ones(1,nn);
x3 = -15.*ones(1,nn);
x2 = linspace(-70,-15.1,nn);
y3 = linspace(-55,-34,nn);
y4 = linspace(-55.15,-33.85,nn);
x4 = -70.*ones(1,nn);
lw = 2.9;

load Topo12
z = -6000:50:5000;
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);




% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% m_proj('albers','longitudes',[-71 -10], ...
%            'latitudes',[-60 -30]);
% m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
% hold on
% % m_contour(conx,cony,cont200,'LineWidth',lw+3,'Color','k')
% % m_contour(conx,cony,cont200,'LineWidth',lw,'Color','w')
% m_line(x4,y3,'Color','k','LineWidth',lw+3)
% m_line(x1,y1,'Color','k','LineWidth',lw+3)
% m_line(x1,y2,'Color','k','LineWidth',lw+3)
% m_line(x3,y4,'Color','k','LineWidth',lw+3)
% 
% m_line(x4,y3,'Color','w','LineWidth',lw)
% m_line(x2,y1,'Color','w','LineWidth',lw)
% m_line(x2,y2,'Color','w','LineWidth',lw)
% m_line(x3,y3,'Color','w','LineWidth',lw)
% 
% m_grid('fontsize',16);
% cbar = colorbar('eastoutside');
% cbar.FontSize = 16;
% title('topography of Argentine Basin and surrounding area with budget box shown','FontWeight','Normal','FontSize',18)
% acc_mplots
% set(gcf,'InvertHardCopy','off');
% print('-r200','AB_map_w_box','-dpng')



x1 = linspace(-64,-15.15,nn);
x5 = linspace(-64.15,-15.15,nn);
x6 = linspace(-51.5,-15.15,nn);
x7 = linspace(-51.65,-15.15,nn);
y1 = -55.*ones(1,nn);
y2 = -34.*ones(1,nn);
x3 = -15.*ones(1,nn);
x2 = linspace(-70,-15.1,nn);
y3 = linspace(-55,-34,nn);
y4 = linspace(-55.15,-33.85,nn);
x4 = -70.*ones(1,nn);


cont200 = zeros(size(Topo12));
cont200(Topo12>-200) = 1;
conx = XC12-360;
conx = conx(:,1);
cony = YC12(1,:);
ind1 = find(conx<-48);
ind2 = find(cony>-55);
ind3 = find(cony<-34);
ind4 = intersect(ind2,ind3);

conx = conx(ind1);
cony = cony(ind4);
[conx,cony] = ndgrid(conx,cony);
cont200 = cont200(ind1,ind4);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-71 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on
m_contour(conx,cony,cont200,'LineWidth',lw+3,'Color','k')
m_contour(conx,cony,cont200,'LineWidth',lw,'Color','w')
% m_line(x4,y3,'Color','k','LineWidth',lw+3)
m_line(x1,y1,'Color','k','LineWidth',lw+3)
m_line(x6,y2,'Color','k','LineWidth',lw+3)
m_line(x3,y4,'Color','k','LineWidth',lw+3)

% m_line(x4,y3,'Color','w','LineWidth',lw)
m_line(x5,y1,'Color','w','LineWidth',lw)
m_line(x7,y2,'Color','w','LineWidth',lw)
m_line(x3,y3,'Color','w','LineWidth',lw)

m_grid('fontsize',16);
cbar = colorbar('eastoutside');
cbar.FontSize = 16;
title('topography of Argentine Basin and surrounding area with modified budget box shown','FontWeight','Normal','FontSize',18)
acc_mplots
set(gcf,'InvertHardCopy','off');
print('-r200','AB_map_w_box_200m','-dpng')


% [M,c] = contour(XC12-360,YC12,cont200,'Color','k');
% 
% [contourTable, contourArray] = getContourLineCoordinates(M);
% A = contourTable{1:134290,1:4};
% % save A A
% load A
% 
% X = A(:,3);
% Y = A(:,4);
% ind1 = find(X<-70);
% ind2 = find(X<-48);
% ind3 = find(Y<-34);
% ind4 = find(Y>-55);
% ind5 = intersect(ind1,ind2);
% ind6 = intersect(ind3,ind4);
% ind = intersect(ind5,ind6);
% X = X(ind);
% Y = Y(ind);


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