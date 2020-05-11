clear
close all
clc

tic()
acc_settings

%%
load mask
load MUR_movie_diffs
%%

%%
numdate = datenum('01012017','mmddyyyy');
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
%%

%% ETAN

cm1 = acc_colormap('cmo_thermal');
lb1 = -2;
ub1 = 28;
nlvls = 100;
z1 = linspace(lb1,ub1,nlvls);
z1 = [z1,29];
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,murday(:,:,1),'LineStyle','none','LevelList',z1);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb1 ub1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
ytickformat('degrees')
title('MUR SST [deg C]','FontWeight','Normal','FontSize',24)
acc_movie
acc_quad_plots_v5
text(291,-33.1,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

cm = acc_colormap('cmo_balance');
lb = -5;
ub = 5;
nlvls = 100;
z = linspace(lb,ub,nlvls);
z = [-10,-8,-7,-6,z,6,7,8,10];

ax2 = subplot(2,2,2);
contourf(XC3,YC3,SST_TS_3(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 - MUR SST difference [deg C]','FontWeight','Normal','FontSize',24)
acc_movie
acc_quad_plots_v2
text(291,-33.1,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,SST_TS_6(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - MUR SST difference [deg C]','FontWeight','Normal','FontSize',24)
acc_movie
acc_quad_plots_v3
text(291,-33.1,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,SST_TS_12(:,:,1),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - MUR SST difference [deg C]','FontWeight','Normal','FontSize',24)
acc_movie
acc_quad_plots_v8
text(291,-33.1,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('MUR_SST_DIFF.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 15;
open(vidObj);
writeVideo(vidObj, getframe(gcf));


for ii=2:365
    numdate = numdate + 1;
    
    ax1 = subplot(2,2,1);
    contourf(murlon,murlat,murday(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    ytickformat('degrees')
    title('MUR SST [deg C]','FontWeight','Normal','FontSize',24)
    acc_movie
    acc_quad_plots_v5
    text(291,-33.1,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,SST_TS_3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/3 - MUR SST difference [deg C]','FontWeight','Normal','FontSize',24)
    acc_movie
    acc_quad_plots_v2
    text(291,-33.1,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,SST_TS_6(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/6 - MUR SST difference [deg C]','FontWeight','Normal','FontSize',24)
    acc_movie
    acc_quad_plots_v3
    text(291,-33.1,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,SST_TS_12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/12 - MUR SST difference [deg C]','FontWeight','Normal','FontSize',24)
    acc_movie
    acc_quad_plots_v8
    text(291,-33.1,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end
close(vidObj);

%% END ETAN