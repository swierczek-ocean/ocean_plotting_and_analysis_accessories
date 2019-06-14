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
% cm1 = cm;
lb = -6;
ub = 6;
nlvls = 133;
z = linspace(lb,ub,nlvls);
z = [z,6.05];


BSOSE_samp = interp2(XCS,YCS,THETA_mean',profiles(:,3),profiles(:,2),'makima');
err = BSOSE_samp - profiles(:,4);


mask12_mod = -6.1*(mask12-1);






figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profiles(:,3),profiles(:,2),30,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[0.95*lb 0.95*ub]);
caxis([0.95*lb 0.95*ub])
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m, 2013 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_err','-dpng')


load profiles


profiles(:,1) = mod(floor(profiles(:,1)./100),100);

profilesJFM = profiles(profiles(:,1)<4,:);
BSOSE_samp_JFM = interp2(XCS,YCS,THETA_JFM',profilesJFM(:,3),profilesJFM(:,2),'makima');
err = BSOSE_samp_JFM - profilesJFM(:,4);
err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesJFM(:,3),profilesJFM(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[0.95*lb 0.95*ub]);
caxis([0.95*lb 0.95*ub])
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JFM, 2013 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_err_01_JFM','-dpng')

profilesAMJ = profiles(profiles(:,1)>3&profiles(:,1)<7,:);
BSOSE_samp_AMJ = interp2(XCS,YCS,THETA_AMJ',profilesAMJ(:,3),profilesAMJ(:,2),'makima');
err = BSOSE_samp_AMJ - profilesAMJ(:,4);
err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesAMJ(:,3),profilesAMJ(:,2),50,err,'filled')
cbar = colorbar('southoutside');
caxis([0.95*lb 0.95*ub])
set(cbar,'XLim',[0.95*lb 0.95*ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in AMJ, 2013 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_err_02_AMJ','-dpng')

profilesJAS = profiles(profiles(:,1)>6&profiles(:,1)<10,:);
BSOSE_samp_JAS = interp2(XCS,YCS,THETA_JAS',profilesJAS(:,3),profilesJAS(:,2),'makima');
err = BSOSE_samp_JAS - profilesJAS(:,4);
err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
caxis([0.95*lb 0.95*ub])
scatter(profilesJAS(:,3),profilesJAS(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[0.95*lb 0.95*ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in JAS, 2013 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_err_03_JAS','-dpng')

profilesOND = profiles(profiles(:,1)>9,:);
BSOSE_samp_OND = interp2(XCS,YCS,THETA_OND',profilesOND(:,3),profilesOND(:,2),'makima');
err = BSOSE_samp_OND - profilesOND(:,4);
err(err<lb)=0.98*lb;
err(err>ub)=0.98*ub;

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XC12,YC12,mask12_mod,'LineStyle','none','LevelList',z);
hold on
caxis([0.95*lb 0.95*ub])
contour(XC12,YC12,mask12,'k')
scatter(profilesOND(:,3),profilesOND(:,2),50,err,'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[0.95*lb 0.95*ub]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE - Argo average temperature of top 20m in OND, 2013 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_err_04_OND','-dpng')


toc()