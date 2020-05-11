clear
close all
clc
tic()

acc_settings

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

for ii=1:24
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
    contourf(XC3,YC3,theta3(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
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
    contourf(XC6,YC6,theta6(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
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
    contourf(XC12,YC12,theta12(:,:,mlvl(ii)),'LineStyle','none','LevelList',z);
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
    set(gcf,'InvertHardCopy','off'); print('-r100',['THETA_PLOTS/mean/THETA_',num2str(mlvl(ii),'%02.f'),'_',num2str(RC3(mlvl(ii))),'m_mean'],'-dpng')
    close all
end






toc()