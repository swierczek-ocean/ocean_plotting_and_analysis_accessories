clear
close all
clc

tic()
acc_settings

load profiles
load BSOSE_avgs
load mask12
coords = [0 360 -78 -30];

cm1 = [cm;Color(:,10)'];
lb = -2;
ub = 27.05;
nlvls = 133;
z = linspace(lb,ub,nlvls);
z = [z,27.1];


THETA_JFM_2013(hFacC==0)=27.2;
THETA_JFM_2014(hFacC==0)=27.2;
THETA_JFM_2015(hFacC==0)=27.2;
THETA_JFM_2016(hFacC==0)=27.2;
THETA_JFM_2017(hFacC==0)=27.2;
THETA_AMJ_2013(hFacC==0)=27.2;
THETA_AMJ_2014(hFacC==0)=27.2;
THETA_AMJ_2015(hFacC==0)=27.2;
THETA_AMJ_2016(hFacC==0)=27.2;
THETA_AMJ_2017(hFacC==0)=27.2;
THETA_JAS_2013(hFacC==0)=27.2;
THETA_JAS_2014(hFacC==0)=27.2;
THETA_JAS_2015(hFacC==0)=27.2;
THETA_JAS_2016(hFacC==0)=27.2;
THETA_JAS_2017(hFacC==0)=27.2;
THETA_OND_2013(hFacC==0)=27.2;
THETA_OND_2014(hFacC==0)=27.2;
THETA_OND_2015(hFacC==0)=27.2;
THETA_OND_2016(hFacC==0)=27.2;
THETA_OND_2017(hFacC==0)=27.2;


profiles(:,1) = mod(floor(profiles(:,1)./100),10000);

profilestemp = profiles(profiles(:,1)==1301|profiles(:,1)==1302|profiles(:,1)==1303,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JFM_2013','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JFM 2013','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_01_JFM_2013','-dpng')
hold off


profilestemp = profiles(profiles(:,1)==1401|profiles(:,1)==1402|profiles(:,1)==1403,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JFM_2014','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JFM 2014','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_05_JFM_2014','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1501|profiles(:,1)==1502|profiles(:,1)==1503,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JFM_2015','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JFM 2015','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_09_JFM_2015','-dpng')
hold off


profilestemp = profiles(profiles(:,1)==1601|profiles(:,1)==1602|profiles(:,1)==1603,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JFM_2016','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JFM 2016','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_13_JFM_2016','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1701|profiles(:,1)==1702|profiles(:,1)==1703,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JFM_2017','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JFM 2017','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_17_JFM_2017','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1304|profiles(:,1)==1305|profiles(:,1)==1306,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_AMJ_2013','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in AMJ 2013','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_02_AMJ_2013','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1404|profiles(:,1)==1405|profiles(:,1)==1406,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_AMJ_2014','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in AMJ 2014','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_06_AMJ_2014','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1504|profiles(:,1)==1505|profiles(:,1)==1506,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_AMJ_2015','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in AMJ 2015','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_10_AMJ_2015','-dpng')
hold off


profilestemp = profiles(profiles(:,1)==1604|profiles(:,1)==1605|profiles(:,1)==1606,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_AMJ_2016','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in AMJ 2016','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_14_AMJ_2016','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1704|profiles(:,1)==1705|profiles(:,1)==1706,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_AMJ_2017','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in AMJ 2017','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_18_AMJ_2017','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1307|profiles(:,1)==1308|profiles(:,1)==1309,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JAS_2013','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JAS 2013','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_03_JAS_2013','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1407|profiles(:,1)==1408|profiles(:,1)==1409,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JAS_2014','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JAS 2014','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_07_JAS_2014','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1507|profiles(:,1)==1508|profiles(:,1)==1509,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JAS_2015','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JAS 2015','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_11_JAS_2015','-dpng')
hold off


profilestemp = profiles(profiles(:,1)==1607|profiles(:,1)==1608|profiles(:,1)==1609,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JAS_2016','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JAS 2016','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_15_JAS_2016','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1707|profiles(:,1)==1708|profiles(:,1)==1709,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JAS_2017','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in JAS 2017','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_19_JAS_2017','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1310|profiles(:,1)==1311|profiles(:,1)==1312,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_OND_2013','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in OND 2013','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_04_OND_2013','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1410|profiles(:,1)==1411|profiles(:,1)==1412,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_OND_2014','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in OND 2014','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_08_OND_2014','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1510|profiles(:,1)==1511|profiles(:,1)==1512,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_OND_2015','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in OND 2015','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_12_OND_2015','-dpng')
hold off


profilestemp = profiles(profiles(:,1)==1610|profiles(:,1)==1611|profiles(:,1)==1612,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_OND_2016','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in OND 2016','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_16_OND_2016','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1710|profiles(:,1)==1711|profiles(:,1)==1712,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_OND_2017','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,profilestemp(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
caxis([lb 27]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE vs Argo average temperature of top 20m in OND 2017','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_20_OND_2017','-dpng')
hold off


toc()