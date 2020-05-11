clear
close all
clc
tic()

load wmask
load mask3 
load mask6
load mask12
load RGmask
load eccomask
load sodamask

mlong = mlong - 360;
XCS = XCS - 360;


load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12

XC3 = XC3 - 360;
XC6 = XC6 - 360;
XC12 = XC12 - 360;

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12m,YC12m] = ndgrid(XC12,YC12);

[mlong,mlat] = ndgrid(mlong,mlat);
[XCS,YCS] = ndgrid(XCS,YCS);
[elon,elat] = ndgrid(elon,elat);
[mlonw,mlatw] = ndgrid(mlonw,mlatw);

acc_colors
c3 = 55;
c6 = 56;
c12 = 57;
lw = 2.9;
lwg = 0.5;
load ../AB_ELEV_DATA/Topo12 XC12 YC12 Topo12
z = -6000:50:5000;
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);

XC12 = XC12 - 360;


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-71 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XC12,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on
m_contour(XC3,YC3,mask3,'LineWidth',lw+3,'Color','w')
m_contour(XC6,YC6,mask6,'LineWidth',lw+3,'Color','w')
m_contour(XC12m,YC12m,mask12,'LineWidth',lw+3,'Color','w')
m_contour(XCS,YCS,sodaarea,'LineWidth',lw+3,'Color','w')
m_contour(mlonw,mlatw,wmask,'LineWidth',lw+3,'Color','w')
m_contour(mlong,mlat,RGmask,'LineWidth',lw+3,'Color','w')
m_contour(elon,elat,eccoarea,'LineWidth',lw+3,'Color','w')

[~,h4] = m_contour(XCS,YCS,sodaarea,'LineWidth',lw,'Color',Color(10,:));
[~,h7] = m_contour(elon,elat,eccoarea,'LineWidth',lw,'Color',Color(52,:));
[~,h5] = m_contour(mlonw,mlatw,wmask,'LineWidth',lw,'Color',Color(9,:));
[~,h6] = m_contour(mlong,mlat,RGmask,'LineWidth',lw,'Color',Color(84,:));
[~,h1] = m_contour(XC3,YC3,mask3,'LineWidth',lw,'Color',Color(c3,:));
[~,h2] = m_contour(XC6,YC6,mask6,'LineWidth',lw,'Color',Color(c6,:));
[~,h3] = m_contour(XC12m,YC12m,mask12,'LineWidth',lw,'Color',Color(c12,:));

m_grid('fontsize',22);
cbar = colorbar('eastoutside');
cbar.FontSize = 20;
title('Argentine Basin budget boxes','FontWeight','Normal','FontSize',28)
acc_mplots
set(gcf,'InvertHardCopy','off');
print('-r200','AB_map_w_boxes_2000m','-dpng')





toc()