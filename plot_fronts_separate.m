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
load FRONTS
load fronts_mitgcm
load mask
mask = permute(mask,[2,1,3]);


load ../2019_07_July_analysis/AVISO_diff_avgs D_AVISO_JD_avg XCA YCA

XC3 = XC3 - 360;
XC6 = XC6 - 360;
XC12 = XC12 - 360;
XCm = XCm - 360;

acc_colors

lw = 3.4;
c3 = 55;
c6 = 56;
c12 = 57;

z = -6000:25:5000;
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);

set(gcf, 'Position', [1, 1, 1600, 900])

colormap(cm)
% m_proj('albers','longitudes',[-69.5 -9.8], ...
%            'latitudes',[-58.7 -31.1]);
m_proj('albers','longitudes',[-71 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XCt-360,YCt,Topo12+2,'LineStyle','none','LevelList',z)
hold on
m_contour(XCm,YCm,mask(:,:,1),'Color','k','LineWidth',lw-1)
m_line(PF_X,PF_Y,'Color','w','LineWidth',lw+3);
m_contour(XC3,YC3,PF_3,'Color','w','LineWidth',lw+3)
m_contour(XC6,YC6,PF_6,'Color','w','LineWidth',lw+3)
m_contour(XC12,YC12,PF_12,'Color','w','LineWidth',lw+3)
h1 = m_line(PF_X,PF_Y,'Color','k','LineWidth',lw);
m_contour(XC3,YC3,PF_3,'Color',Color(c3,:),'LineWidth',lw)
m_contour(XC6,YC6,PF_6,'Color',Color(c6,:),'LineWidth',lw)
m_contour(XC12,YC12,PF_12,'Color',Color(c12,:),'LineWidth',lw)

h2 = m_line(PF_X+100,PF_Y+60,'Color',Color(c3,:),'LineWidth',lw+3);
h3 = m_line(PF_X+100,PF_Y+60,'Color',Color(c6,:),'LineWidth',lw+3);
h4 = m_line(PF_X+100,PF_Y+60,'Color',Color(c12,:),'LineWidth',lw+3);

m_line(SAF_X,SAF_Y,'Color','w','LineWidth',lw+3);
m_contour(XC3,YC3,SAF_3,'Color','w','LineWidth',lw+3)
m_contour(XC6,YC6,SAF_6,'Color','w','LineWidth',lw+3)
m_contour(XC12,YC12,SAF_12,'Color','w','LineWidth',lw+3)
m_line(SAF_X,SAF_Y,'Color','k','LineWidth',lw);
m_contour(XC3,YC3,SAF_3,'Color',Color(c3,:),'LineWidth',lw)
m_contour(XC6,YC6,SAF_6,'Color',Color(c6,:),'LineWidth',lw)
m_contour(XC12,YC12,SAF_12,'Color',Color(c12,:),'LineWidth',lw)

% h1 = m_line(STF_X,STF_Y,'Color','k','LineWidth',lw);
% h1 = m_line(SBDY_X,SBDY_Y,'Color','k','LineWidth',lw);
% h1 = m_line(SACCF_X,SACCF_Y,'Color','k','LineWidth',lw);
m_grid('fontsize',20);
% m_text(-9.3,-50.5,'Polar','Color','k','FontSize',19)
title('front locations','FontWeight','Normal','FontSize',28)
legend([h1(1),h2(1),h3(1),h4(1)],'Orsi',' 1/3',' 1/6',...
    ' 1/12','Location','southeast','FontSize',24)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','front_locations_2','-dpng')
close all


set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
m_contourf(XCm,YCm,mask(:,:,1),'LineStyle','none') %,'LevelList',z)
hold on
m_contour(XCm,YCm,mask(:,:,1),'Color','k','LineWidth',lw-1)
m_line(SAF_X,SAF_Y,'Color','w','LineWidth',lw+3);
m_contour(XC3,YC3,SAF_3,'Color','w','LineWidth',lw+3)
m_contour(XC6,YC6,SAF_6,'Color','w','LineWidth',lw+3)
m_contour(XC12,YC12,SAF_12,'Color','w','LineWidth',lw+3)
h1 = m_line(SAF_X,SAF_Y,'Color','k','LineWidth',lw);
m_contour(XC3,YC3,SAF_3,'Color',Color(c3,:),'LineWidth',lw)
m_contour(XC6,YC6,SAF_6,'Color',Color(c6,:),'LineWidth',lw)
m_contour(XC12,YC12,SAF_12,'Color',Color(c12,:),'LineWidth',lw)
h2 = m_line(PF_X+100,PF_Y+60,'Color',Color(c3,:),'LineWidth',lw);
h3 = m_line(PF_X+100,PF_Y+60,'Color',Color(c6,:),'LineWidth',lw);
h4 = m_line(PF_X+100,PF_Y+60,'Color',Color(c12,:),'LineWidth',lw);
m_grid('fontsize',16);
% m_text(-9.3,-46.5,'Subantarctic','Color','k','FontSize',19)
title('subantarctic front locations','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],'Orsi',' 1/3',' 1/6',...
    ' 1/12','Location','southeast','FontSize',16)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r300','subantarctic_front_locations','-dpng')
close all

STF_X = STF_X(60:200);
STF_Y = STF_Y(60:200);

set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
m_contourf(XCm,YCm,mask(:,:,1),'LineStyle','none') %,'LevelList',z)
hold on
m_contour(XCm,YCm,mask(:,:,1),'Color','k','LineWidth',lw-1)
m_line(STF_X,STF_Y,'Color','w','LineWidth',lw+3);
% m_contour(XC3,YC3,STF_3,'Color','w','LineWidth',lw+3)
% m_contour(XC6,YC6,STF_6,'Color','w','LineWidth',lw+3)
% m_contour(XC12,YC12,STF_12,'Color','w','LineWidth',lw+3)
h1 = m_line(STF_X,STF_Y,'Color','k','LineWidth',lw);
% m_contour(XC3,YC3,STF_3,'Color',Color(c3,:),'LineWidth',lw)
% m_contour(XC6,YC6,STF_6,'Color',Color(c6,:),'LineWidth',lw)
% m_contour(XC12,YC12,STF_12,'Color',Color(c12,:),'LineWidth',lw)
h2 = m_line(PF_X+100,PF_Y+60,'Color',Color(c3,:),'LineWidth',lw);
h3 = m_line(PF_X+100,PF_Y+60,'Color',Color(c6,:),'LineWidth',lw);
h4 = m_line(PF_X+100,PF_Y+60,'Color',Color(c12,:),'LineWidth',lw);
m_grid('fontsize',16);
% m_text(-9.3,-40,'Subtropical','Color','k','FontSize',19)
title('subtropical front locations','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],'Orsi',' 1/3',' 1/6',...
    ' 1/12','Location','southeast','FontSize',16)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r300','subtropical_front_locations','-dpng')
close all

SACCF_X = SACCF_X(200:700);
SACCF_Y = SACCF_Y(200:700);


set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
m_contourf(XCm,YCm,mask(:,:,1),'LineStyle','none') %,'LevelList',z)
hold on
m_contour(XCm,YCm,mask(:,:,1),'Color','k','LineWidth',lw-1)
m_line(STF_X,STF_Y,'Color','w','LineWidth',lw+4);
m_line(SAF_X,SAF_Y,'Color','w','LineWidth',lw+4);
m_line(PF_X,PF_Y,'Color','w','LineWidth',lw+4);
m_line(SACCF_X,SACCF_Y,'Color','w','LineWidth',lw+4);
m_line(SBDY_X,SBDY_Y,'Color','w','LineWidth',lw+4);
h1 = m_line(STF_X,STF_Y,'Color',Color(85,:),'LineWidth',lw);
h2 = m_line(SAF_X,SAF_Y,'Color',Color(86,:),'LineWidth',lw);
h3 = m_line(PF_X,PF_Y,'Color',Color(87,:),'LineWidth',lw);
h4 = m_line(SACCF_X,SACCF_Y,'Color',Color(88,:),'LineWidth',lw);
h5 = m_line(SBDY_X,SBDY_Y,'Color',Color(89,:),'LineWidth',lw);

m_grid('fontsize',16);
title('Orsi front locations','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1),h5(1)],'STF','SAF','PF',...
    'SACCF','SBDY','Location','southeast','FontSize',16)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r300','orsi_front_locations','-dpng')
close all






toc()