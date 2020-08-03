clear
close all
clc
tic()

acc_settings
load mask
mask = permute(mask,[2,1,3]);


% load XY12 Depth12 XC12 YC12
% Depth12 = Depth12';
% coords = [XC12(1) XC12(end) YC12(1) YC12(end)];
% 
% %% 1000m contour levels
% z = 0:1000:6000;
% z = z;
% 
% cm = acc_colormap('cmo_deep');
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Depth12,'LevelList',z)
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% cbar.Direction = 'reverse';
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_1000','-dpng')
% 
% %% 1000m levels
% 
% %% 500m contour levels
% z = 0:500:6500;
% z = z;
% 
% cm = acc_colormap('cmo_deep');
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Depth12,'LevelList',z)
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% cbar.Direction = 'reverse';
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_500','-dpng')
% 
% %% 500m levels
% 
% %% 500m contour levels w/ line
% z = 0:500:6500;
% z = z;
% 
% cm = acc_colormap('cmo_deep');
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Depth12,'LevelList',z)
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% line([307.25 307.25],[-60 -30],'Color',Color(4,:),'LineWidth',2)
% cbar = colorbar('eastoutside');
% cbar.Direction = 'reverse';
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_500_slice','-dpng')
% 
% %% 500m levels w/ line
% 
% %% 1000m contour levels
% z = 0:1000:6000;
% z = z;
% 
% cm = acc_colormap('cmo_deep');
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Depth12,'LevelList',z,'ShowText','on')
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% cbar.Direction = 'reverse';
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_1000_labels','-dpng')
% 
% %% 1000m levels
% 
% load XY6 Depth6 XC6 YC6
% Depth6 = Depth6';
% coords = [XC6(1) XC6(end) YC6(1) YC6(end)];
% 
% 
% %% 1000m contour levels
% z = 0:1000:6000;
% z = z;
% 
% cm = acc_colormap('cmo_deep');
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC6,YC6,Depth6,'LevelList',z,'ShowText','on')
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% cbar.Direction = 'reverse';
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_1000_labels_lo_res','-dpng')
% 
% %% 1000m levels

% load Topo12 Topo12 XC12 YC12
% load mask
% mask = permute(mask,[2,1,3]);
% % Topo12 = Topo12';
% coords = [XC12(1) XC12(end) YC12(1) YC12(end)];
% 
% %% 1000m contour levels
% z = -6000:1000:5000;
% cm = acc_colormap('cmo_topo');
% cm = cm(1:237,:);
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Topo12,'LevelList',z)
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_1000','-dpng')
% 
% %% 1000m levels
% 
% %% 500m contour levels
% z = -6000:500:5000;
% cm = acc_colormap('cmo_topo');
% cm = cm(1:237,:);
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Topo12,'LevelList',z)
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_500','-dpng')
% 
% %% 500m levels
% 
% %% 500m contour levels w/ line
% z = -6000:500:5000;
% 
% cm = acc_colormap('cmo_topo');
% cm = cm(1:237,:);
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Topo12,'LevelList',z)
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% line([307.25 307.25],[-60 -30],'Color',Color(4,:),'LineWidth',2)
% cbar = colorbar('eastoutside');
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_500_slice','-dpng')
% 
% %% 500m levels w/ line
% 
% %% 1000m contour levels
% z = -6000:1000:5000;
% 
% 
% cm = acc_colormap('cmo_topo');
% cm = cm(1:237,:);
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,Topo12,'LevelList',z,'ShowText','on')
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_1000_labels','-dpng')
% 
% %% 1000m levels
% 
% load Topo6 Topo6 XC6 YC6
% coords = [XC6(1) XC6(end) YC6(1) YC6(end)];
% 
% 
% %% 1000m contour levels
% z = -6000:1000:5000;
% 
% cm = acc_colormap('cmo_topo');
% cm = cm(1:237,:);
% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC6,YC6,Topo6,'LevelList',z,'ShowText','on')
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% cbar = colorbar('eastoutside');
% ytickformat('degrees')
% % ylabel('lat')
% xtickformat('degrees')
% % xlabel('lon')
% title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
% axis(coords)
% acc_movie
% acc_plots
% hold off
% print('AB_BATHY_contf_1000_labels_lo_res','-dpng')
% 
% %% 1000m levels

%% surf
load Topo12
coords = [XC12(350,1) XC12(end) YC12(1) YC12(end) -10000 10000];
XCL = XC12(223,:);
YCL = YC12(223,:);
ZCL = Topo12(223,:) + 10;

XCMA = (360 - 42.8917).*ones(1000,1);
YCMA = -42.4932.*ones(1000,1);
XCMB = (360 - 42.1371).*ones(1000,1);
YCMB = -42.4947.*ones(1000,1);
XCMP = (360 - 42.5083).*ones(1000,1);
YCMP = -42.9799.*ones(1000,1);


ZCM = linspace(-6000,0,1000);





cm = acc_colormap('cmo_topo');
cm = cm(1:248,:);
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
surf(XC12,YC12,Topo12,'EdgeColor','interp')
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% line([307.25 307.25],[-60 -30],'Color',Color(4,:),'LineWidth',2)
% plot3(XCL,YCL,ZCL,'Color',Color(4,:),'LineWidth',2)
% plot3(XCMA,YCMA,ZCM,'Color',Color(4,:),'LineWidth',1.5)
% plot3(XCMB,YCMB,ZCM,'Color',Color(4,:),'LineWidth',1.5)
% plot3(XCMP,YCMP,ZCM,'Color',Color(4,:),'LineWidth',1.5)
cbar = colorbar('eastoutside');
% cbar.Direction = 'reverse';
ytickformat('degrees')
ylabel('latitude')
xtickformat('degrees')
xlabel('longitude')
zticks([-6000 -4000 -2000 0 2000 4000])
zticklabels({'-6000','-4000','-2000','0','2000','4000'})
% zticks([-6000 -4000 -2000 0 2000 ])
% zticklabels({'-6000','-4000','-2000','0','4000'})
title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',18)
axis(coords)
acc_movie
acc_plots
hold off
% print('AB_BATHY_surf','-dpng')

%% surf




toc()