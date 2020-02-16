clear
close all
clc
tic()

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

acc_colors

lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
cm = acc_colormap('cmo_balance');
lb = -1.4;
ub = 1.4;
nlvls = 100;
z = linspace(lb,ub,nlvls);
z = [-10,z,10];

set(gcf, 'Position', [1, 1, 1500, 900])

colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);

m_contourf(XCA-360,YCA,D_AVISO_JD_avg,'LineStyle','none','LevelList',z)
hold on
% m_contour(XCA-360,YCA,1.*isnan(D_AVISO_JD_avg),'k')
m_contour(XCm-360,YCm,mask(:,:,1),'Color','k')
% m_line(STF_X,STF_Y,'Color','k','LineWidth',lw)
[~,h2] = m_contour(XC3,YC3,SAF_3,'Color',Color(c3,:),'LineWidth',lw);
[~,h3] = m_contour(XC6,YC6,SAF_6,'Color',Color(c6,:),'LineWidth',lw);
[~,h4] = m_contour(XC12,YC12,SAF_12,'Color',Color(c12,:),'LineWidth',lw);

m_contour(XC3,YC3,PF_3,'Color',Color(c3,:),'LineWidth',lw)
m_contour(XC6,YC6,PF_6,'Color',Color(c6,:),'LineWidth',lw)
m_contour(XC12,YC12,PF_12,'Color',Color(c12,:),'LineWidth',lw)

h1 = m_line(SAF_X,SAF_Y,'Color','k','LineWidth',lw);
m_line(PF_X,PF_Y,'Color','k','LineWidth',lw)
% m_line(SBDY_X,SBDY_Y,'Color','k','LineWidth',lw)
% m_line(SACCF_X,SACCF_Y,'Color','k','LineWidth',lw)
m_grid('fontsize',16);
m_text(-9.3,-46.5,'Subantarctic','Color','k','FontSize',19)
% m_text(-7,-47,'Front','Color','k','FontSize',19)
m_text(-9.3,-50.5,'Polar','Color','k','FontSize',19)


title('front locations','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],'Orsi',' 1/3',' 1/6',' 1/12','Location','southeast','FontSize',16)

acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r100','front_locations','-dpng')
% close all



















toc()