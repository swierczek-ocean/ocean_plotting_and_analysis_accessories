clear
close all
clc
tic()

load ../2020_06_June_analysis/MURd

ss = 172;
ws = 355;

sst_mur_ss = murday(:,:,ss);
sst_mur_ws = murday(:,:,ws);
sst_mur_5ss = mean(murday(:,:,170:174),3);
sst_mur_5ws = mean(murday(:,:,353:357),3);

clear ../2020_06_June_analysis/murday

load ../2020_06_June_analysis/SST_TS

sst_3_ss = SST_TS_3(:,:,ss);
sst_3_ws = SST_TS_3(:,:,ws);
sst_3_5ss = mean(SST_TS_3(:,:,170:174),3);
sst_3_5ws = mean(SST_TS_3(:,:,353:357),3);

clear ../2020_06_June_analysis/SST_TS_3

sst_6_ss = SST_TS_6(:,:,ss);
sst_6_ws = SST_TS_6(:,:,ws);
sst_6_5ss = mean(SST_TS_6(:,:,170:174),3);
sst_6_5ws = mean(SST_TS_6(:,:,353:357),3);

clear ../2020_06_June_analysis/SST_TS_6

sst_12_ss = SST_TS_12(:,:,ss);
sst_12_ws = SST_TS_12(:,:,ws);
sst_12_5ss = mean(SST_TS_12(:,:,170:174),3);
sst_12_5ws = mean(SST_TS_12(:,:,353:357),3);

clear ../2020_06_June_analysis/SST_TS_12

sst_3_ss(sst_3_ss==0) = NaN;
sst_6_ss(sst_6_ss==0) = NaN;
sst_12_ss(sst_12_ss==0) = NaN;
sst_3_ws(sst_3_ws==0) = NaN;
sst_6_ws(sst_6_ws==0) = NaN;
sst_12_ws(sst_12_ws==0) = NaN;
sst_3_5ss(sst_3_5ss==0) = NaN;
sst_6_5ss(sst_6_5ss==0) = NaN;
sst_12_5ss(sst_12_5ss==0) = NaN;
sst_3_5ws(sst_3_5ws==0) = NaN;
sst_6_5ws(sst_6_5ws==0) = NaN;
sst_12_5ws(sst_12_5ws==0) = NaN;

load mask
mask = permute(mask,[2,1,3]);
load ../2020_06_June_analysis/XY3 XC3 YC3
load ../2020_06_June_analysis/XY6 XC6 YC6
load ../2020_06_June_analysis/XY12 XC12 YC12
acc_colors

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
[murlon,murlat] = ndgrid(murlon,murlat);

inside_coords = [290.5 350.2 -58.7 -32];

load ../2020_02_February_analysis/FRONTS
load ../2020_02_February_analysis/fronts_mitgcm
load ../2020_02_February_analysis/mask
mask = permute(mask,[2,1,3]);


load subtropABC
stf1212(680:end,400:end) = 1;





acc_colors



cm = inferno();

lb = -1;
ub = 21;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-2,-1.75,-1.5,-1.25,z,21.25,21.5,21.75,22,...
    22.25,22.5,22.75,23,23.25,23.5,23.75,24];
lw = 2.7;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,sst_mur_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
line(SAF_X+360,SAF_Y,'Color','w','LineWidth',lw+1)
line(PF_X+360,PF_Y,'Color','w','LineWidth',lw+1)
line(STF_X+360,STF_Y,'Color','w','LineWidth',lw+1)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,sst_3_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
contour(XC3,YC3,SAF_3,'Color','w','LineWidth',lw)
contour(XC3,YC3,PF_3,'Color','w','LineWidth',lw)
contour(XC3,YC3,stf312,'Color','w','LineWidth',lw)
%plot(st_front3_x,st_front3_y,'Color','w','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,sst_6_ss,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
contour(XC6,YC6,PF_6,'Color','w','LineWidth',lw)
contour(XC6,YC6,SAF_6,'Color','w','LineWidth',lw)
contour(XC6,YC6,stf612,'Color','w','LineWidth',lw)
% plot(st_front6_x,st_front6_y,'Color','w','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,sst_12_ss,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
contour(XC12,YC12,PF_12,'Color','w','LineWidth',lw)
contour(XC12,YC12,SAF_12,'Color','w','LineWidth',lw)
contour(XC12,YC12,stf1212,'Color','w','LineWidth',lw)
% plot(st_front12_x,st_front12_y,'Color','w','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 June 21 2017 SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','sst_with_fronts','-dpng')
close all


% line(SAF_X,SAF_Y,'Color','w','LineWidth',lw)
% line(PF_X,PF_Y,'Color','w','LineWidth',lw)
% line(STF_X,STF_Y,'Color','w','LineWidth',lw)
% contour(XC3,YC3,SAF_3,'Color','w','LineWidth',lw)
% contour(XC3,YC3,PF_3,'Color','w','LineWidth',lw)
% contour(XC6,YC6,PF_6,'Color','w','LineWidth',lw)
% contour(XC6,YC6,SAF_6,'Color','w','LineWidth',lw)
% contour(XC12,YC12,PF_12,'Color','w','LineWidth',lw)
% contour(XC12,YC12,SAF_12,'Color','w','LineWidth',lw)
















