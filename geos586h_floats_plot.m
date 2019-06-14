clear
close all
clc

tic()
acc_settings

load profiles
load mask12
coords = [0 360 -78 -30];

cm1 = [cm;Color(:,8)';Color(:,36)'];
lb = -2;
ub = 14.5;
nlvls = 133;
z = linspace(lb,ub,nlvls);
z = [z,15.5];



figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profiles(:,3),profiles(:,2),30,profiles(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 14.2]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('Argo + BGC-Argo average temperature of top 20m, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('Argo_temp','-dpng')
% 
% % by year
% 
profiles(:,1) = floor(profiles(:,1)./10000);
% 
% profiles2005 = profiles(profiles(:,1)==2005,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2005(:,3),profiles2005(:,2),50,profiles2005(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2005','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2005','-dpng')
% 
% 
% profiles2006 = profiles(profiles(:,1)==2006,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2006(:,3),profiles2006(:,2),50,profiles2006(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2006','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2006','-dpng')
% 
% 
% profiles2007 = profiles(profiles(:,1)==2007,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2007(:,3),profiles2007(:,2),50,profiles2007(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2007','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2007','-dpng')
% 
% 
% profiles2008 = profiles(profiles(:,1)==2008,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2008(:,3),profiles2008(:,2),50,profiles2008(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2008','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2008','-dpng')
% 
% 
% profiles2009 = profiles(profiles(:,1)==2009,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2009(:,3),profiles2009(:,2),50,profiles2009(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2009','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2009','-dpng')
% 
% profiles2010 = profiles(profiles(:,1)==2010,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2010(:,3),profiles2010(:,2),50,profiles2010(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2010','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2010','-dpng')
% 
% profiles2011 = profiles(profiles(:,1)==2011,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2011(:,3),profiles2011(:,2),50,profiles2011(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2011','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2011','-dpng')
% 
% profiles2012 = profiles(profiles(:,1)==2012,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2012(:,3),profiles2012(:,2),50,profiles2012(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2012','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2012','-dpng')
% 
% profiles2013 = profiles(profiles(:,1)==2013,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2013(:,3),profiles2013(:,2),50,profiles2013(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2013','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2013','-dpng')
% 
% 
% profiles2014 = profiles(profiles(:,1)==2014,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2014(:,3),profiles2014(:,2),50,profiles2014(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2014','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2014','-dpng')
% 
% profiles2015 = profiles(profiles(:,1)==2015,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2015(:,3),profiles2015(:,2),50,profiles2015(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2015','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2015','-dpng')
% 
% profiles2016 = profiles(profiles(:,1)==2016,:);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1900, 900])
% colormap(cm1)
% contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
% hold on
% contour(XC12,YC12,mask12,'k')
% scatter(profiles2016(:,3),profiles2016(:,2),50,profiles2016(:,4),'filled')
% cbar = colorbar('southoutside');
% set(cbar,'XLim',[lb 14.2]);
% axis(coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('Argo + BGC-Argo average temperature of top 20m in 2016','FontWeight','Normal')
% acc_movie
% acc_plots
% print('Argo_temp_2016','-dpng')

profiles2017 = profiles(profiles(:,1)==2017,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profiles2017(:,3),profiles2017(:,2),50,profiles2017(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 14.2]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('Argo + BGC-Argo average temperature of top 20m in 2017','FontWeight','Normal')
acc_movie
acc_plots
print('Argo_temp_2017','-dpng')

profiles2018 = profiles(profiles(:,1)==2018,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profiles2018(:,3),profiles2018(:,2),50,profiles2018(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 14.2]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('Argo + BGC-Argo average temperature of top 20m in 2018','FontWeight','Normal')
acc_movie
acc_plots
print('Argo_temp_2018','-dpng')


clear profiles20*
load profiles


profiles(:,1) = mod(floor(profiles(:,1)./100),100);

profilesJFM = profiles(profiles(:,1)<4,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesJFM(:,3),profilesJFM(:,2),50,profilesJFM(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 14.2]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('Argo + BGC-Argo average temperature of top 20m in JFM, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('Argo_temp_01_JFM','-dpng')

profilesAMJ = profiles(profiles(:,1)>3&profiles(:,1)<7,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesAMJ(:,3),profilesAMJ(:,2),50,profilesAMJ(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 14.2]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('Argo + BGC-Argo average temperature of top 20m in AMJ, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('Argo_temp_02_AMJ','-dpng')

profilesJAS = profiles(profiles(:,1)>6&profiles(:,1)<10,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesJAS(:,3),profilesJAS(:,2),50,profilesJAS(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 14.2]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('Argo + BGC-Argo average temperature of top 20m in JAS, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('Argo_temp_03_JAS','-dpng')

profilesOND = profiles(profiles(:,1)>9,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12+14.4,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesOND(:,3),profilesOND(:,2),50,profilesOND(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 14.2]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('Argo + BGC-Argo average temperature of top 20m in OND, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('Argo_temp_04_OND','-dpng')





toc()