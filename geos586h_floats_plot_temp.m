figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_mean','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profiles(:,3),profiles(:,2),30,profiles(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE average temperature of top 20m, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp','-dpng')


load profiles


profiles(:,1) = mod(floor(profiles(:,1)./100),100);

profilesJFM = profiles(profiles(:,1)<4,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JFM','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesJFM(:,3),profilesJFM(:,2),50,profilesJFM(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE average temperature of top 20m in JFM, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_01_JFM','-dpng')

profilesAMJ = profiles(profiles(:,1)>3&profiles(:,1)<7,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_AMJ','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesAMJ(:,3),profilesAMJ(:,2),50,profilesAMJ(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE average temperature of top 20m in AMJ, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_02_AMJ','-dpng')

profilesJAS = profiles(profiles(:,1)>6&profiles(:,1)<10,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_JAS','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesJAS(:,3),profilesJAS(:,2),50,profilesJAS(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE average temperature of top 20m in JAS, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_03_JAS','-dpng')

profilesOND = profiles(profiles(:,1)>9,:);

figure()
set(gcf, 'Position', [1, 1, 1900, 900])
colormap(cm1)
contourf(XCS,YCS,THETA_OND','LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask12,'k')
scatter(profilesOND(:,3),profilesOND(:,2),50,profilesOND(:,4),'filled')
cbar = colorbar('southoutside');
set(cbar,'XLim',[lb 25]);
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
title('BSOSE average temperature of top 20m in OND, 2005 - 2018','FontWeight','Normal')
acc_movie
acc_plots
print('BSOSE_Argo_temp_04_OND','-dpng')