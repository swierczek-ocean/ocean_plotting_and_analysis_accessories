clear
close all
clc
tic()

acc_settings

%% 
load mask
load MLD_mean
load ODA oda_mld XCt YCt
oda_mld = mean(oda_mld,3);
[XCt,YCt] = ndgrid(XCt,YCt);
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];

cm = acc_colormap('cmo_deep');
cm = cm.^2;
lb = 0;
ub = 150;

nlvls = 201;
z = linspace(lb,ub,nlvls);
z = [z,200];

temp3 = smoothdata(mld3,1,'movmean',5,'omitnan');
temp6 = smoothdata(mld6,1,'movmean',7,'omitnan');
temp12 = smoothdata(mld12,1,'movmean',13,'omitnan');
temp3 = smoothdata(temp3,2,'movmean',5,'omitnan');
temp6 = smoothdata(temp6,2,'movmean',7,'omitnan');
temp12 = smoothdata(temp12,2,'movmean',13,'omitnan');

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax1 = subplot(2,2,1);
contourf(XCt,YCt,oda_mld,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('GFDL ODA mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off


ax2 = subplot(2,2,2);
contourf(XC3,YC3,-temp3,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,-temp6,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,-temp12,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r100','MLD_smoothed_mean','-dpng')
close all


%% 


%%
load mask
load ../2020_03_March_analysis/theta3
load ../2020_03_March_analysis/theta6
load ../2020_03_March_analysis/theta12
clear theta*sd
load ODA oda_theta XCt YCt
oda_theta = squeeze(mean(oda_theta,4));
[XCt,YCt] = ndgrid(XCt,YCt);
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
nlvls = 100;
%%

%% 

cm = acc_colormap('cmo_thermal');

lb = -1;
ub = 20;
z = linspace(lb,ub,nlvls);
z = [-2,z,22];
RC3 = abs(RC3);

mlvl = [2,5:21,25,32,36,40,41,44];
olvl = [1,3:15,17,19,21,23,27,32,35,38,39,42];

for ii=1:1
    
    temp3 = smoothdata(theta3(:,:,mlvl(ii)),1,'movmean',5,'omitnan');
    temp6 = smoothdata(theta6(:,:,mlvl(ii)),1,'movmean',7,'omitnan');
    temp12 = smoothdata(theta12(:,:,mlvl(ii)),1,'movmean',13,'omitnan');
    temp3 = smoothdata(temp3,2,'movmean',5,'omitnan');
    temp6 = smoothdata(temp6,2,'movmean',7,'omitnan');
    temp12 = smoothdata(temp12,2,'movmean',13,'omitnan');
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XCt,YCt,oda_theta(:,:,olvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['GFDL ODA mean ',num2str(RC3(mlvl(ii))),'m theta [deg C]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v1
    hold off
    
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 mean ',num2str(RC3(mlvl(ii))),'m theta [deg C]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 mean ',num2str(RC3(mlvl(ii))),'m theta [deg C]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 mean ',num2str(RC3(mlvl(ii))),'m theta [deg C]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['THETA_PLOTS/mean_smoothed/THETA_',num2str(mlvl(ii),'%02.f'),'_',num2str(RC3(mlvl(ii))),'m_mean'],'-dpng')
    close all
    clear temp*
end


clear
close all
clc
tic()

acc_settings

%%
load mask
load ../2020_03_March_analysis/wvel3
load ../2020_03_March_analysis/wvel6
load ../2020_03_March_analysis/wvel12
clear wvel*sd
load ODA oda_wvel XCt YCt
oda_wvel = squeeze(mean(oda_wvel,4));
[XCt,YCt] = ndgrid(XCt,YCt);
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
nlvls = 100;
%%

%% 

cm = acc_colormap('cmo_balance');

% lb = -3e-5;
% ub = 3e-5;
% z = linspace(lb,ub,nlvls);
% 
% z = [-4e-4,-3e-4,-2e-4,-1e-4,-9e-5,-8e-5,-7e-5,-6e-5,-5e-5,-4e-5,z,...
%     4e-5,5e-5,6e-5,7e-5,8e-5,9e-5,1e-4,2e-4,3e-4,4e-4];

lb = -3e-4;
ub = 3e-4;
z = linspace(lb,ub,nlvls);

z = [-4e-4,z,4e-4];

RF3 = abs(RF3);

mlvl = [3,5:23,26,30,32,36,41,44];
olvl = [1:15,17,19,21,23,24,27,30,31,34,38,41];

for ii=1:26
    
    temp3 = smoothdata(wvel3(:,:,mlvl(ii)),1,'movmean',5,'omitnan');
    temp6 = smoothdata(wvel6(:,:,mlvl(ii)),1,'movmean',7,'omitnan');
    temp12 = smoothdata(wvel12(:,:,mlvl(ii)),1,'movmean',13,'omitnan');
    temp3 = smoothdata(temp3,2,'movmean',5,'omitnan');
    temp6 = smoothdata(temp6,2,'movmean',7,'omitnan');
    temp12 = smoothdata(temp12,2,'movmean',13,'omitnan');
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax1 = subplot(2,2,1);
    contourf(XCt,YCt,oda_wvel(:,:,olvl(ii)),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['GFDL ODA mean ',num2str(RF3(mlvl(ii))),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v1
    hold off
    
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 mean ',num2str(RF3(mlvl(ii))),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 mean ',num2str(RF3(mlvl(ii))),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,mlvl(ii)),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 mean ',num2str(RF3(mlvl(ii))),'m vertical velocity [m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['WVEL_PLOTS/mean_smoothed/WVEL_',num2str(mlvl(ii),'%02.f'),'_',num2str(RF3(mlvl(ii))),'m_mean'],'-dpng')
    close all
    clear temp*
end






toc()



toc()