%% THETA
cm = acc_colormap('bluered');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -3;
ub = 22;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,THETA_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,THETA_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,THETA_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_DM','-dpng')
close all
%% END THETA

%% SALT
close all
cm = flipud(acc_colormap('haline'));
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 32.2;
ub = 36.7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,SALT_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,SALT_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,SALT_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('SALT_AVG_DM','-dpng')
%% END SALT

%% ETAN
close all
cm = acc_colormap('bluered');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -2;
ub = 2;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

ETAN_mu = mean(ETAN_BSOSE_DM_avg(ETAN_BSOSE_DM_avg<1000));
ETAN_BSOSE_DM_avg = ETAN_BSOSE_DM_avg - ETAN_mu;
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,ETAN_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,ETAN_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,ETAN_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('ETAN_AVG_DM','-dpng')
%% END ETAN

%% TFLUX
close all
cm = acc_colormap('bluered');
cm = [Color(:,46)';cm;Color(:,46)'];
lb = -310;
ub = 310;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,TFLUX_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,TFLUX_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,TFLUX_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,TFLUX_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean heat flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('TFLUX_AVG_DM','-dpng')
%% END TFLUX

%% SFLUX
close all
cm = acc_colormap('bluered');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -0.0025;
ub = 0.0025;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,SFLUX_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,SFLUX_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,SFLUX_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('SFLUX_AVG_DM','-dpng')
%% END SFLUX

%% CFLUX
close all
cm = acc_colormap('bluered');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -7e-7;
ub = 7e-7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,CFLUX_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,CFLUX_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,CFLUX_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('CFLUX_AVG_DM','-dpng')
%% END CFLUX

%% OFLUX
close all
cm = acc_colormap('bluered');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -2e-6;
ub = 2e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,OFLUX_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,OFLUX_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,OFLUX_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,OFLUX_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean O2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('OFLUX_AVG_DM','-dpng')
%% END OFLUX

%% WVEL
close all
cm = acc_colormap('bluered');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -2e-7;
ub = 2e-7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean vertical velocity','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,WVEL_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean vertical velocity','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,WVEL_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean vertical velocity','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,WVEL_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean vertical velocity','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_AVG_DM','-dpng')
%% END WVEL

%% WVEL STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 3e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,WVEL_34_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,WVEL_64_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,WVEL_124_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_std_DM','-dpng')
%% END WVEL STD

%% ETAN STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 0.5;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,ETAN_34_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,ETAN_64_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,ETAN_124_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 SSH anomaly stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('ETAN_std_DM','-dpng')
%% END ETAN STD

%% WVEL
close all
cm = acc_colormap('bluered');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = -2e-7;
ub = 2e-7;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean vertical velocity','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,WVEL_34_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 mean vertical velocity','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,WVEL_64_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 mean vertical velocity','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,WVEL_124_DM_avg,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 mean vertical velocity','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_AVG_DM_outside','-dpng')
%% END WVEL


%% WVEL STD
close all
cm = acc_colormap('fire');
cm = [Color(:,13)';cm;Color(:,46)'];
lb = 0;
ub = 3e-6;
nlvls = 126;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
subplot(2,2,1);
contourf(XCS,YCS,WVEL_BSOSE_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

subplot(2,2,2);
contourf(XC3,YC3,WVEL_34_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm + BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

subplot(2,2,3);
contourf(XC6,YC6,WVEL_64_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm + BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off


subplot(2,2,4);
contourf(XC12,YC12,WVEL_124_DM_std,'LineStyle','none','LevelList',z);
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm + BLING DJFMAM 2017 vertical velocity stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL_std_DM_outside','-dpng')
%% END WVEL STD

