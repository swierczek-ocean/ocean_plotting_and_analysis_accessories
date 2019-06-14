clear
close all
clc

tic()
acc_settings

load profiles
load BSOSE_avgs
load mask12
coords = [0 360 -78 -30];

cm1 = [Color(:,36)';cm;Color(:,8)'];
% cm1 = cm;
lb = -6;
ub = 6;
nlvls = 133;
z = linspace(lb,ub,nlvls);
z = [-6.1,z,6.1];
mask12_mod = -12.2*(mask12-0.5)+0.01;
error_vec = zeros(20,2);

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

BSOSE_samp_temp = interp2(XCS,YCS,THETA_JFM_2013',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(1,1) = norm(err,2)/sqrt(length(err));
error_vec(1,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JFM 2013 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(1,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(1,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_01_JFM_2013','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([z(1) z(end)]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JFM 2013','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_01_JFM_2013','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1401|profiles(:,1)==1402|profiles(:,1)==1403,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JFM_2014',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(5,1) = norm(err,2)/sqrt(length(err));
error_vec(5,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JFM 2014 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(5,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(5,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_05_JFM_2014','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JFM 2014','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_05_JFM_2014','-dpng')
hold off

close all

profilestemp = profiles(profiles(:,1)==1501|profiles(:,1)==1502|profiles(:,1)==1503,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JFM_2015',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(9,1) = norm(err,2)/sqrt(length(err));
error_vec(9,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JFM 2015 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(9,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(9,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_09_JFM_2015','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JFM 2015','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_09_JFM_2015','-dpng')
hold off


profilestemp = profiles(profiles(:,1)==1601|profiles(:,1)==1602|profiles(:,1)==1603,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JFM_2016',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(13,1) = norm(err,2)/sqrt(length(err));
error_vec(13,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JFM 2016 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(13,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(13,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_13_JFM_2016','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JFM 2016','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_13_JFM_2016','-dpng')
hold off

close all

profilestemp = profiles(profiles(:,1)==1701|profiles(:,1)==1702|profiles(:,1)==1703,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JFM_2017',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(17,1) = norm(err,2)/sqrt(length(err));
error_vec(17,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JFM 2017 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(17,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(17,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_17_JFM_2017','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JFM 2017','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_17_JFM_2017','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1304|profiles(:,1)==1305|profiles(:,1)==1306,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_AMJ_2013',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(2,1) = norm(err,2)/sqrt(length(err));
error_vec(2,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in AMJ 2013 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(2,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(2,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_02_AMJ_2013','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in AMJ 2013','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_02_AMJ_2013','-dpng')
hold off

close all

profilestemp = profiles(profiles(:,1)==1404|profiles(:,1)==1405|profiles(:,1)==1406,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_AMJ_2014',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(6,1) = norm(err,2)/sqrt(length(err));
error_vec(6,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in AMJ 2014 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(6,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(6,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_06_AMJ_2014','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in AMJ 2014','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_06_AMJ_2014','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1504|profiles(:,1)==1505|profiles(:,1)==1506,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_AMJ_2015',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(10,1) = norm(err,2)/sqrt(length(err));
error_vec(10,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in AMJ 2015 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(10,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(10,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_10_AMJ_2015','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in AMJ 2015','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_10_AMJ_2015','-dpng')
hold off

close all


profilestemp = profiles(profiles(:,1)==1604|profiles(:,1)==1605|profiles(:,1)==1606,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_AMJ_2016',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(14,1) = norm(err,2)/sqrt(length(err));
error_vec(14,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in AMJ 2016 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(14,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(14,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_14_AMJ_2016','-dpng')


err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in AMJ 2016','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_14_AMJ_2016','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1704|profiles(:,1)==1705|profiles(:,1)==1706,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_AMJ_2017',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(18,1) = norm(err,2)/sqrt(length(err));
error_vec(18,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in AMJ 2017 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(18,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(18,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_18_AMJ_2017','-dpng')


err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in AMJ 2017','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_18_AMJ_2017','-dpng')
hold off

close all

profilestemp = profiles(profiles(:,1)==1307|profiles(:,1)==1308|profiles(:,1)==1309,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JAS_2013',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(3,1) = norm(err,2)/sqrt(length(err));
error_vec(3,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JAS 2013 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(3,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(3,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_03_JAS_2013','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JAS 2013','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_03_JAS_2013','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1407|profiles(:,1)==1408|profiles(:,1)==1409,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JAS_2014',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(7,1) = norm(err,2)/sqrt(length(err));
error_vec(7,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JAS 2014 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(7,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(7,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_07_JAS_2014','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JAS 2014','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_07_JAS_2014','-dpng')
hold off

close all

profilestemp = profiles(profiles(:,1)==1507|profiles(:,1)==1508|profiles(:,1)==1509,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JAS_2015',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(11,1) = norm(err,2)/sqrt(length(err));
error_vec(11,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JAS 2015 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(11,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(11,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_11_JAS_2015','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JAS 2015','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_11_JAS_2015','-dpng')
hold off


profilestemp = profiles(profiles(:,1)==1607|profiles(:,1)==1608|profiles(:,1)==1609,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JAS_2016',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(15,1) = norm(err,2)/sqrt(length(err));
error_vec(15,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JAS 2016 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(15,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(15,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_15_JAS_2016','-dpng')


err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JAS 2016','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_15_JAS_2016','-dpng')
hold off

close all

profilestemp = profiles(profiles(:,1)==1707|profiles(:,1)==1708|profiles(:,1)==1709,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_JAS_2017',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(19,1) = norm(err,2)/sqrt(length(err));
error_vec(19,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in JAS 2017 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(19,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(19,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_19_JAS_2017','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JAS 2017','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_19_JAS_2017','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1310|profiles(:,1)==1311|profiles(:,1)==1312,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_OND_2013',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(4,1) = norm(err,2)/sqrt(length(err));
error_vec(4,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in OND 2013 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(4,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(4,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_04_OND_2013','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in OND 2013','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_04_OND_2013','-dpng')
hold off

close all

profilestemp = profiles(profiles(:,1)==1410|profiles(:,1)==1411|profiles(:,1)==1412,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_OND_2014',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(8,1) = norm(err,2)/sqrt(length(err));
error_vec(8,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in OND 2014 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(8,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(8,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_08_OND_2014','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in OND 2014','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_08_OND_2014','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1510|profiles(:,1)==1511|profiles(:,1)==1512,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_OND_2015',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(12,1) = norm(err,2)/sqrt(length(err));
error_vec(12,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in OND 2015 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(12,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(12,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_12_OND_2015','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in OND 2015','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_12_OND_2015','-dpng')
hold off

close all


profilestemp = profiles(profiles(:,1)==1610|profiles(:,1)==1611|profiles(:,1)==1612,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_OND_2016',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(16,1) = norm(err,2)/sqrt(length(err));
error_vec(16,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in OND 2016 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(16,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(16,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_16_OND_2016','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in OND 2016','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_16_OND_2016','-dpng')
hold off

profilestemp = profiles(profiles(:,1)==1710|profiles(:,1)==1711|profiles(:,1)==1712,:);
BSOSE_samp_temp = interp2(XCS,YCS,THETA_OND_2017',profilestemp(:,3),profilestemp(:,2),'makima');
err = BSOSE_samp_temp - profilestemp(:,4);
error_vec(20,1) = norm(err,2)/sqrt(length(err));
error_vec(20,2) = mean(err);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
h = histogram(err,'FaceColor','r','LineWidth',1);
c = h.BinWidth;
h.BinWidth = 0.25;
xlim([-6 6])
title('BSOSE - Argo average temperature of top 20m in OND 2017 distribution','FontWeight','Normal')
acc_movie
acc_plots
xticks(-6:6)
text(0.8,0.85,['number of obs: ',num2str(length(err))],'Units','normalized','FontSize',20)
text(0.8,0.8,['mean misfit: ',num2str(error_vec(20,2))],'Units','normalized','FontSize',20)
text(0.8,0.75,['RMSE: ',num2str(error_vec(20,1))],'Units','normalized','FontSize',20)
print('BSOSE_Argo_error_dist_temp_20_OND_2017','-dpng')

err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilestemp(:,3),profilestemp(:,2),65,'w','filled')
scatter(profilestemp(:,3),profilestemp(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in OND 2017','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_error_temp_20_OND_2017','-dpng')
hold off

close all

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
plot(1:20,error_vec(:,2),'LineWidth',3,'Color',Color(:,9))
title('BSOSE - Argo mean difference by season, 2013 - 2017','FontWeight','Normal')
xticks(1:20)
xticklabels({'JFM13','AMJ13','JAS13','OND13','JFM14','AMJ14','JAS14','OND14','JFM15','AMJ15','JAS15','OND15','JFM16','AMJ16','JAS16','OND16','JFM17','AMJ17','JAS17','OND17',})
acc_movie
acc_plots
print('BSOSE_Argo_mean_difference_time_series','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
plot(1:20,error_vec(:,1),'LineWidth',3,'Color',Color(:,12))
title('BSOSE - Argo RMSE by season, 2013 - 2017','FontWeight','Normal')
xticks(1:20)
xticklabels({'JFM13','AMJ13','JAS13','OND13','JFM14','AMJ14','JAS14','OND14','JFM15','AMJ15','JAS15','OND15','JFM16','AMJ16','JAS16','OND16','JFM17','AMJ17','JAS17','OND17',})
acc_movie
acc_plots
print('BSOSE_Argo_RMSE_time_series','-dpng')

toc()