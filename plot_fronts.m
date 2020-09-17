clear
close all
clc
tic()

coords = [-85 -1 -65 -22];
load ../2020_06_June_analysis/XY3 XC3 YC3
load ../2020_06_June_analysis/XY6 XC6 YC6
load ../2020_06_June_analysis/XY12 XC12 YC12
acc_colors
c3 = 55;
c6 = 56;
c12 = 57;
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
lw = 3.8;
load ../AB_ELEV_DATA/new_depth

load subtropABC2
stf3 = round((stf310+stf311+stf312+stf31s+stf32s)./5);
stf6 = round((stf610+stf611+stf612+stf61s+stf62s)./5);
stf12 = round((stf1210+stf1211+stf1212+stf121s+stf122s)./5);

stf6(116:135,120:148) = 0;
stf6(116,66) = 0;
stf12(703:713,412:423) = 1;
stf12(224:250,255:292) = 0;
stf12(228:243,280:294) = 0;
stf12(246:252,296:303) = 0;

load ../2020_02_February_analysis/FRONTS
load ../2020_02_February_analysis/fronts_mitgcm


set(gcf, 'Position', [1, 1, 1600, 900])
m_proj('albers','longitudes',[-70 -8.5], ...
           'latitudes',[-63 -32]);

hold on
m_coast('patch',[.7 .7 .7],'edgecolor','k');

h1 = m_line(SAF_X,SAF_Y,'Color','k','LineWidth',lw+1);
m_line(PF_X,PF_Y,'Color','k','LineWidth',lw+1)
m_line(STF_X,STF_Y,'Color','k','LineWidth',lw+1)

h2 = m_line(SAF_X,SAF_Y+90,'Color',Color(c3,:),'LineWidth',lw+1);
h3 = m_line(SAF_X,SAF_Y+90,'Color',Color(c6,:),'LineWidth',lw+1);
h4 = m_line(SAF_X,SAF_Y+90,'Color',Color(c12,:),'LineWidth',lw+1);

m_contour(XC3-360,YC3,SAF_3,'Color',Color(c3,:),'LineWidth',lw)
m_contour(XC3-360,YC3,PF_3,'Color',Color(c3,:),'LineWidth',lw)
m_contour(XC3-360,YC3,stf3,'Color',Color(c3,:),'LineWidth',lw)

m_contour(XC6-360,YC6,PF_6,'Color',Color(c6,:),'LineWidth',lw)
m_contour(XC6-360,YC6,SAF_6,'Color',Color(c6,:),'LineWidth',lw)
m_contour(XC6-360,YC6,stf6,'Color',Color(c6,:),'LineWidth',lw)

m_contour(XC12-360,YC12,PF_12,'Color',Color(c12,:),'LineWidth',lw)
m_contour(XC12-360,YC12,SAF_12,'Color',Color(c12,:),'LineWidth',lw)
m_contour(XC12-360,YC12,stf12,'Color',Color(c12,:),'LineWidth',lw)

m_grid('fontsize',23);
acc_mplots
legend([h1(1),h2(1),h3(1),h4(1)],'Orsi','1/3','1/6','1/12',...
    'Location','southeast','FontSize',23)
set(gcf,'InvertHardCopy','off');
print('-r200','AB_fronts','-dpng')
close all

