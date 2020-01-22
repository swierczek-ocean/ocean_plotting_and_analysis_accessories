clear
close all
clc
tic()

load Budgets3
load Budgets6
load Budgets12
load 3_surf_avgs
load 6_surf_avgs
load 12_surf_avgs
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

lw = 2.9;
ms = 20;
cb = 85;
cbd = 36;
c3 = 86;
c6 = 87;
c12 = 88;
c3 = 55;
c6 = 56;
c12 = 57;
c1 = 61;
c2 = 13;
cs = 61;
elw = 4;
j3 = 3;
qw = 7;
oas = 17;
ias = 14;
oase = 17;
iase = 14;
cbsose = 37;


%
nn = 200;
x1 = linspace(-70,-15.15,nn);
y1 = -55.*ones(1,nn);
y2 = -34.*ones(1,nn);
x3 = -15.*ones(1,nn);
x2 = linspace(-70,-15.1,nn);
y3 = linspace(-55,-34,nn);
y4 = linspace(-55.15,-33.85,nn);
x4 = -70.*ones(1,nn);

cm = flipud(acc_colormap('cmo_tempo'));
z = 0:0.02:1.12;

set(gcf, 'Position', [1, 1, 1300, 850])

colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);

m_contourf(XC12,YC12,speed12_2017,'LineStyle','none','LevelList',z)
hold on
m_contour(XC12,YC12,1.*isnan(speed12_2017),'k')
m_grid('fontsize',16);

m_line(x4,y3,'Color','k','LineWidth',lw+3)
m_line(x1,y1,'Color','k','LineWidth',lw+3)
m_line(x1,y2,'Color','k','LineWidth',lw+3)
m_line(x3,y4,'Color','k','LineWidth',lw+3)

m_line(x4,y3,'Color','w','LineWidth',lw)
m_line(x2,y1,'Color','w','LineWidth',lw)
m_line(x2,y2,'Color','w','LineWidth',lw)
m_line(x3,y3,'Color','w','LineWidth',lw)

%% top of AB
m_vec(1,-43.75,-34.2,0,-0.454,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h1 = m_vec(1,-43.75,-34.2,0,-0.419,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-41.25,-34.2,0,-0.428,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h2 = m_vec(1,-41.25,-34.2,0,-0.393,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-38.75,-34.2,0,-0.4445,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h3 = m_vec(1,-38.75,-34.2,0,-0.41,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-36.25,-34.2,0,-0.339,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h4 = m_vec(1,-36.25,-34.2,0,-0.304,Color(cbsose,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-32.65,'41.9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-34.5,'39.3','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-36.35,'41.0','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-38.2,'30.4','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% bottom of AB
m_vec(1,-43,-54,0,.9846,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-43,-54,0,.9496,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-54,0,1.072,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-40,-54,0,1.037,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-54,0,1.105,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-37,-54,0,1.07,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-51.75,'102.9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-53.6,'112.4','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-55.45,'116.0','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-57.3,'123.8','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% east of AB
m_vec(1,-16,-43,1.371,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-43,1.336,0,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-45,1.436,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-45,1.401,0,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-47,1.484,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-47,1.449,0,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-17,-35.15,'144.7','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-17,-37,'151.7','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-17,-38.85,'157.0','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-17,-40.7,'154.2','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 
m_grid('fontsize',16);
title('volume budgets [Sv]','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],' 1/3',' 1/6',' 1/12','B-SOSE','Location','southeast','FontSize',16)
% c = colorbar('southoutside','FontSize',16);
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','AB_BUDGETS_BSOSE_1_VOL','-dpng')
close all
%% volume

%% heat
cm = acc_colormap('es_coolwarm');
z = -1.05:0.05:22.7;

set(gcf, 'Position', [1, 1, 1300, 850])

colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);

m_contourf(XC12,YC12,theta12_2017,'LineStyle','none','LevelList',z)
hold on
m_contour(XC12,YC12,1.*isnan(speed12_2017),'k')
m_grid('fontsize',16);

m_line(x4,y3,'Color','k','LineWidth',lw+3)
m_line(x1,y1,'Color','k','LineWidth',lw+3)
m_line(x1,y2,'Color','k','LineWidth',lw+3)
m_line(x3,y4,'Color','k','LineWidth',lw+3)

m_line(x4,y3,'Color','w','LineWidth',lw)
m_line(x2,y1,'Color','w','LineWidth',lw)
m_line(x2,y2,'Color','w','LineWidth',lw)
m_line(x3,y3,'Color','w','LineWidth',lw)

%% top of AB
m_vec(1,-43,-36,0,-1.408,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h1 = m_vec(1,-43,-36,0,-1.373,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-36,0,-1.351,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h2 = m_vec(1,-40,-36,0,-1.316,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-36,0,-1.444,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h3 = m_vec(1,-37,-36,0,-1.409,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-32.65,'1.49','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-34.5,'1.43','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-36.35,'1.53','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-38.2,'1.10','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% bottom of AB
m_vec(1,-43,-54,0,1.212,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-43,-54,0,1.177,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-54,0,1.320,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-40,-54,0,1.285,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-54,0,1.337,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-37,-54,0,1.302,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-51.75,'1.27','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-53.6,'1.39','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-55.45,'1.41','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-57.3,'1.57','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% east of AB
m_vec(1,-16,-43,2.305,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-43,2.27,0,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-45,2.37,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-45,2.335,0,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-47,2.49,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-47,2.455,0,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-17,-37.15,'2.46','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-17,-39,'2.53','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-17,-40.85,'2.66','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 

%% surf
m_vec(1,-46,-42,0.093,-0.093,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-1,'headlength',qw-1)
m_vec(1,-46,-42,0.066,-0.066,Color(c3,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-3,'headlength',qw-3);
m_vec(1,-46,-44,0.092,-0.092,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-1,'headlength',qw-1)
m_vec(1,-46,-44,0.065,-0.065,Color(c6,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-3,'headlength',qw-3);
m_vec(1,-46,-46,0.053,-0.053,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-3,'headlength',qw-3)
m_vec(1,-46,-46,0.04,-0.04,Color(c12,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-4,'headlength',qw-4);
m_text(-45,-42.15,'0.067','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-45,-44,'0.065','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-45,-45.85,'0.025','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 


m_grid('fontsize',16);
title('heat budgets [PW]','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],' 1/3',' 1/6',' 1/12','B-SOSE','Location','southeast','FontSize',16)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','AB_BUDGETS_BSOSE_2_HEAT','-dpng')
close all
%% heat

%% salt
cm = acc_colormap('cmo_haline');
z = 32.8:0.05:36.8;
z = [20,z];

set(gcf, 'Position', [1, 1, 1300, 850])

colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);

m_contourf(XC12,YC12,salt12_2017,'LineStyle','none','LevelList',z)
hold on
caxis([z(2) z(end)])
m_contour(XC12,YC12,1.*isnan(speed12_2017),'k')
m_grid('fontsize',16);

m_line(x4,y3,'Color','k','LineWidth',lw+3)
m_line(x1,y1,'Color','k','LineWidth',lw+3)
m_line(x1,y2,'Color','k','LineWidth',lw+3)
m_line(x3,y4,'Color','k','LineWidth',lw+3)

m_line(x4,y3,'Color','w','LineWidth',lw)
m_line(x2,y1,'Color','w','LineWidth',lw)
m_line(x2,y2,'Color','w','LineWidth',lw)
m_line(x3,y3,'Color','w','LineWidth',lw)

%% top of AB
m_vec(1,-43,-34,0,-(0.5)*1.47,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h1 = m_vec(1,-43,-34,0,-(0.5)*1.4,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-34,0,-(0.5)*1.389,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h2 = m_vec(1,-40,-34,0,-(0.5)*1.319,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-34,0,-(0.5)*1.446,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h3 = m_vec(1,-37,-34,0,-(0.5)*1.376,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-32.65,'1.52e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-34.5,'1.43e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-36.35,'1.49e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-38.2,'1.10e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% bottom of AB
m_vec(1,-43,-54,0,(0.5)*3.44,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-43,-54,0,(0.5)*3.37,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-54,0,(0.5)*3.76,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-40,-54,0,(0.5)*3.69,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-54,0,(0.5)*3.87,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-37,-54,0,(0.5)*3.8,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-51.75,'3.65e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-53.6,'3.99e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-55.45,'4.12e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-57.3,'4.40e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% east of AB
m_vec(1,-16,-43,(0.5)*4.84,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-43,(0.5)*4.77,0,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-45,(0.5)*5.07,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-45,(0.5)*5,0,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-47,(0.5)*5.25,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-47,(0.5)*5.18,0,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-17,-37.15,'5.17e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-17,-39,'5.42e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-17,-40.85,'5.61e9','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 

%% surf
m_vec(1,-46,-42,0.093,0.093,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-1,'headlength',qw-1)
m_vec(1,-46,-42,0.066,0.066,Color(c3,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-3,'headlength',qw-3);
m_vec(1,-46,-44,0.092,0.092,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-1,'headlength',qw-1)
m_vec(1,-46,-44,0.065,0.065,Color(c6,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-3,'headlength',qw-3);
m_vec(1,-46,-46,0.08,0.08,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-3,'headlength',qw-3)
m_vec(1,-46,-46,0.055,0.055,Color(c12,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-4,'headlength',qw-4);
m_text(-45,-42.15,'3.52e6','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-45,-44,'3.52e6','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-45,-45.85,'3.14e6','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 


m_grid('fontsize',16);
title('salt budgets [kg/s]','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],' 1/3',' 1/6',' 1/12','B-SOSE','Location','southeast','FontSize',16)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','AB_BUDGETS_BSOSE_3_SALT','-dpng')
close all
%% salt

%% dic
cm = flipud(acc_colormap('cmo_deep'));
z = 2.1:0.002:2.27;
z = [1.5,z];

set(gcf, 'Position', [1, 1, 1300, 850])

colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);

m_contourf(XC12,YC12,dic12_2017,'LineStyle','none','LevelList',z)
hold on
caxis([z(2) z(end)])
m_contour(XC12,YC12,1.*isnan(speed12_2017),'k')
m_grid('fontsize',16);

m_line(x4,y3,'Color','k','LineWidth',lw+3)
m_line(x1,y1,'Color','k','LineWidth',lw+3)
m_line(x1,y2,'Color','k','LineWidth',lw+3)
m_line(x3,y4,'Color','k','LineWidth',lw+3)

m_line(x4,y3,'Color','w','LineWidth',lw)
m_line(x2,y1,'Color','w','LineWidth',lw)
m_line(x2,y2,'Color','w','LineWidth',lw)
m_line(x3,y3,'Color','w','LineWidth',lw)

%% top of AB
m_vec(1,-43,-34,0,-.683,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h1 = m_vec(1,-43,-34,0,-.648,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-34,0,-.644,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h2 = m_vec(1,-40,-34,0,-.609,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-34,0,-.669,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h3 = m_vec(1,-37,-34,0,-.634,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-32.65,'35.08','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-34.5,'32.97','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-36.35,'34.34','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-38.2,'25.46','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% bottom of AB
m_vec(1,-43,-54,0,1.665,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-43,-54,0,1.63,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-54,0,1.815,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-40,-54,0,1.78,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-54,0,1.865,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-37,-54,0,1.83,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-51.75,'88.03','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-53.6,'96.21','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-55.45,'99.27','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-57.3,'106.09','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% east of AB
m_vec(1,-16,-43,2.315,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-43,2.28,0,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-45,2.425,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-45,2.39,0,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-47,2.495,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-47,2.46,0,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-18,-37.15,'123.68','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-18,-39,'129.71','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-18,-40.85,'134.15','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 

%% surf
m_vec(1,-46,-42,0.092,0.092,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-1,'headlength',qw-1)
m_vec(1,-46,-42,0.065,0.065,Color(c3,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-3,'headlength',qw-3);
m_vec(1,-46,-44,0.093,0.093,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-1,'headlength',qw-1)
m_vec(1,-46,-44,0.066,0.066,Color(c6,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-3,'headlength',qw-3);
m_vec(1,-46,-46,0.094,0.094,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-3,'headlength',qw-3)
m_vec(1,-46,-46,0.067,0.067,Color(c12,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-4,'headlength',qw-4);

m_text(-45,-42.15,'0.225','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-45,-44,'0.226','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-45,-45.85,'0.229','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 


m_grid('fontsize',16);
title('DIC budgets [Gt C/yr]','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],' 1/3',' 1/6',' 1/12','B-SOSE','Location','southeast','FontSize',16)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','AB_BUDGETS_BSOSE_4_DIC','-dpng')
close all
%% dic

%% o2
cm = acc_colormap('cmo_dense');
z = 0.21:0.001:0.36;

set(gcf, 'Position', [1, 1, 1300, 850])

colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);

m_contourf(XC12,YC12,o212_2017,'LineStyle','none','LevelList',z)
hold on
caxis([z(2) z(end)])
m_contour(XC12,YC12,1.*isnan(speed12_2017),'k')
m_grid('fontsize',16);

m_line(x4,y3,'Color','k','LineWidth',lw+3)
m_line(x1,y1,'Color','k','LineWidth',lw+3)
m_line(x1,y2,'Color','k','LineWidth',lw+3)
m_line(x3,y4,'Color','k','LineWidth',lw+3)

m_line(x4,y3,'Color','w','LineWidth',lw)
m_line(x2,y1,'Color','w','LineWidth',lw)
m_line(x2,y2,'Color','w','LineWidth',lw)
m_line(x3,y3,'Color','w','LineWidth',lw)

%% top of AB
m_vec(1,-43,-34,0,-.901,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h1 = m_vec(1,-43,-34,0,-.866,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-34,0,-.847,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h2 = m_vec(1,-40,-34,0,-.812,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-34,0,-.879,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h3 = m_vec(1,-37,-34,0,-.844,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-32.65,'4.69','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-34.5,'4.40','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-36.35,'4.57','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-38.2,'3.37','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% bottom of AB
m_vec(1,-43,-54,0,2.315,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-43,-54,0,2.28,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-54,0,2.515,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-40,-54,0,2.48,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-54,0,2.585,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-37,-54,0,2.55,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-51.75,'12.35','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-53.6,'13.42','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-55.45,'13.91','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-57.3,'14.80','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% east of AB
m_vec(1,-16,-43,3.095,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-43,3.06,0,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-45,3.245,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-45,3.21,0,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-47,3.365,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-47,3.33,0,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-17,-37.15,'16.59','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-17,-39,'17.40','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-17,-40.85,'18.04','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 

%% surf
m_vec(1,-46,-42,0.093,0.093,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-1,'headlength',qw-1)
m_vec(1,-46,-42,0.066,0.066,Color(c3,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-3,'headlength',qw-3);
m_vec(1,-46,-44,0.093,0.093,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-1,'headlength',qw-1)
m_vec(1,-46,-44,0.066,0.066,Color(c6,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-3,'headlength',qw-3);
m_vec(1,-46,-46,0.090,0.090,'w','centered', 'yes','shaftwidth',qw-4,...
    'headwidth',qw-3,'headlength',qw-3)
m_vec(1,-46,-46,0.060,0.060,Color(c12,:),'centered', 'yes','shaftwidth',qw-5,...
    'headwidth',qw-4,'headlength',qw-4);

m_text(-45,-42.15,'0.588','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-45,-44,'0.591','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-45,-45.85,'0.555','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 


m_grid('fontsize',16);
title('O2 budgets [Gt O/yr]','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],' 1/3',' 1/6',' 1/12','B-SOSE','Location','southeast','FontSize',16)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','AB_BUDGETS_BSOSE_5_O2','-dpng')
close all
%% o2

%% no3
cm = acc_colormap('cmo_speed');
z = 0:0.0001:0.03;

set(gcf, 'Position', [1, 1, 1300, 850])

colormap(cm)
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);

m_contourf(XC12,YC12,no312_2017,'LineStyle','none','LevelList',z)
hold on
caxis([z(2) z(end)])
m_contour(XC12,YC12,1.*isnan(speed12_2017),'k')
m_grid('fontsize',16);

m_line(x4,y3,'Color','k','LineWidth',lw+3)
m_line(x1,y1,'Color','k','LineWidth',lw+3)
m_line(x1,y2,'Color','k','LineWidth',lw+3)
m_line(x3,y4,'Color','k','LineWidth',lw+3)

m_line(x4,y3,'Color','w','LineWidth',lw)
m_line(x2,y1,'Color','w','LineWidth',lw)
m_line(x2,y2,'Color','w','LineWidth',lw)
m_line(x3,y3,'Color','w','LineWidth',lw)

%% top of AB
m_vec(1,-43,-34,0,-.385,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h1 = m_vec(1,-43,-34,0,-.35,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-34,0,-.365,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h2 = m_vec(1,-40,-34,0,-.33,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-34,0,-.375,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
h3 = m_vec(1,-37,-34,0,-.34,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-32.65,'0.352','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-34.5,'0.328','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-36.35,'0.337','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-38.2,'0.255','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% bottom of AB
m_vec(1,-43,-54,0,1.375,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-43,-54,0,1.34,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-40,-54,0,1.505,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-40,-54,0,1.47,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-37,-54,0,1.555,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-37,-54,0,1.52,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-33,-51.75,'1.34','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-33,-53.6,'1.47','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-33,-55.45,'1.52','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
m_text(-33,-57.3,'1.60','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(cbsose,:),'LineWidth',elw)
%% 

%% east of AB
m_vec(1,-16,-43,1.785,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-43,1.75,0,Color(c3,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-45,1.885,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-45,1.85,0,Color(c6,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);
m_vec(1,-16,-47,1.945,0,'w','centered', 'yes','shaftwidth',qw,...
    'headwidth',qw+7,'headlength',qw+7)
m_vec(1,-16,-47,1.91,0,Color(c12,:),'centered', 'yes','shaftwidth',qw-2,...
    'headwidth',qw+4,'headlength',qw+5);

m_text(-17,-37.15,'1.75','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
m_text(-17,-39,'1.85','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
m_text(-17,-40.85,'1.91','Color','k','FontSize',19,...
    'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
%% 


m_grid('fontsize',16);
title('NO3 budgets [Gt N/yr]','FontWeight','Normal','FontSize',19)
legend([h1(1),h2(1),h3(1),h4(1)],' 1/3',' 1/6',' 1/12','B-SOSE','Location','southeast','FontSize',16)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','AB_BUDGETS_BSOSE_6_NO3','-dpng')
close all
%% no3

toc()