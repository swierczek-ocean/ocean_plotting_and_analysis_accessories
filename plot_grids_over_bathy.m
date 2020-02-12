clear
close all
clc
tic()

acc_colors
load Topo12
z = -6000:50:5000;
cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);
load ../2020_02_February_analysis/XY3 XG3 YG3
load ../2020_02_February_analysis/XY6 XG6 YG6
load ../2020_02_February_analysis/XY12 XG12 YG12

XG3 = XG3 - 360;
XG6 = XG6 - 360;
XG12 = XG12 - 360;
lw = 0.3;

%% all grids
z = -6000:25:5000;
coords = [290 350 -60 -30];

cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-71 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on
for jj=68:78
    m_line(XG3(85:95),YG3(jj).*ones(1,11),'LineWidth',lw,'Color','w')
end
for ii=85:95
    m_line([XG3(ii) XG3(ii)],[YG3(68) YG3(78)],'LineWidth',lw,'Color','w')
end

for jj=142:152
    m_line(XG6(140:150),YG6(jj).*ones(1,11),'LineWidth',lw,'Color','w')
end
for ii=140:150
    m_line([XG6(ii) XG6(ii)],[YG6(142) YG6(152)],'LineWidth',lw,'Color','w')
end

for jj=289:299
    m_line(XG12(230:240),YG12(jj).*ones(1,11),'LineWidth',lw,'Color','w')
end
for ii=230:240
    m_line([XG12(ii) XG12(ii)],[YG12(289) YG12(299)],'LineWidth',lw,'Color','w')
end

m_grid('fontsize',22);
title('Argentine Basin with 3 grids shown','FontWeight','Normal','FontSize',28)
acc_mplots
m_text(-53.5,-43,'1/12','FontSize',20,'Color','w')
m_text(-49,-43,'1/6','FontSize',20,'Color','w')
m_text(-43.2,-43,'1/3','FontSize',20,'Color','w')
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','AB_BATHY_GRIDS','-dpng')
close all
%% all grids

%% 50m contour levels
z = -6000:25:5000;
coords = [290 350 -60 -30];
nn = length(XG3);
mm = length(YG3);

cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-71 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on
for jj=67:77
    m_line(XG3,YG3(jj).*ones(1,nn),'LineWidth',lw,'Color','w')
end
for ii=75:85
    m_line([XG3(ii) XG3(ii)],[YG3(1) YG3(132)],'LineWidth',lw,'Color','w')
end

m_grid('fontsize',18);
title('Argentine Basin with 1/3 grid','FontWeight','Normal','FontSize',20)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off');
print('-r100','AB_BATHY_GRID_3','-dpng')
close all
%% 

%% 
nn = length(XG6);
mm = length(YG6);

cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-71 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on
for jj=138:148
    m_line(XG6,YG6(jj).*ones(1,nn),'LineWidth',lw,'Color','w')
end
for ii=150:160
    m_line([XG6(ii) XG6(ii)],[YG6(1) YG6(260)],'LineWidth',lw,'Color','w')
end

m_grid('fontsize',18);
title('Argentine Basin with 1/6 grid','FontWeight','Normal','FontSize',20)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','AB_BATHY_GRID_6','-dpng')
close all
%% 

%%
nn = length(XG12);
mm = length(YG12);

cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
m_proj('albers','longitudes',[-71 -10], ...
           'latitudes',[-60 -30]);
m_contourf(XC12-360,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on
for jj=280:290
    m_line(XG12,YG12(jj).*ones(1,nn),'LineWidth',lw,'Color','w')
end
for ii=300:310
    m_line([XG12(ii) XG12(ii)],[YG12(1) YG12(512)],'LineWidth',lw,'Color','w')
end

m_grid('fontsize',18);
title('Argentine Basin with 1/12 grid','FontWeight','Normal','FontSize',20)
acc_mplots
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','AB_BATHY_GRID_12','-dpng')
close all
%% 









toc()