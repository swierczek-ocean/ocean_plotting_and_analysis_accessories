clear
close all
clc
tic()

load ../AB_ELEV_DATA/Topo12
XCt = XC12;
YCt = YC12;
load XY3 XC3 YC3
[XC3,YC3] = ndgrid(XC3,YC3);
load XY6 XC6 YC6
[XC6,YC6] = ndgrid(XC6,YC6);
load XY12 XC12 YC12
[XC12,YC12] = ndgrid(XC12,YC12);
load mask
mask = permute(mask,[2,1,3]);

load XY3i
load XY6i
load XY12i

XCm = XCm - 360;

acc_colors

lw = 3;
c3 = 55;
c6 = 56;
c12 = 57;

z = -6000:25:5000;
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);


set(gcf, 'Position', [1, 1, 1600, 900])

colormap(cm)

m_proj('albers','longitudes',[-71 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XCt-360,YCt,Topo12+2,'LineStyle','none','LevelList',z)
hold on
m_contour(XCm,YCm,mask(:,:,1),'Color','k','LineWidth',lw-2)

m_contour(XC3i-360,YC3i,hFacC3,'Color','w','LineWidth',lw+2);
m_contour(XC12i-360,YC12i,hFacC12,'Color','w','LineWidth',lw+2);
m_contour(XC6i-360,YC6i,hFacC6,'Color','w','LineWidth',lw+2);

[~,h1] = m_contour(XC3i-360,YC3i,hFacC3,'Color',Color(c3,:),'LineWidth',lw);
[~,h2] = m_contour(XC6i-360,YC6i,hFacC6,'Color',Color(c6,:),'LineWidth',lw);
[~,h3] = m_contour(XC12i-360,YC12i,hFacC12,'Color',Color(c12,:),'LineWidth',lw);

m_grid('fontsize',20);
title('budget boxes','FontWeight','Normal','FontSize',28)
legend([h1(1),h2(1),h3(1)],'1/3','1/6','1/12',...
    'Location','southeast','FontSize',24,'Color',Color(91,:))
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','budget_boxes','-dpng')
close all