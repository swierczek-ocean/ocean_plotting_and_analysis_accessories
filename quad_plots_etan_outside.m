tic()
acc_settings

%%
load mask
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load BSOSE_surf_avgs XCS YCS ETAN* 
load AB34_output ETAN*
load AB64_output ETAN*
load AB124_output ETAN*
load AB32_output ETAN*
load AB62_output ETAN*
load AB122_output ETAN*
%%

%%
option = 2;
mask = permute(mask,[2,1,3]);
outside_coords = [288.8 351.6 -59.6 -30.6];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_JJA_avg,...
    ETAN_34_JJA_avg,ETAN_64_JJA_avg,ETAN_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_05JJA_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_JAS_avg,...
    ETAN_34_JAS_avg,ETAN_64_JAS_avg,ETAN_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_06JAS_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_JJASON_avg,...
    ETAN_34_JJASON_avg,ETAN_64_JJASON_avg,ETAN_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_07JJASON_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_JASOND_avg,...
    ETAN_34_JASOND_avg,ETAN_64_JASOND_avg,ETAN_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_08JASOND_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_DN_avg,...
    ETAN_32_DN_avg,ETAN_62_DN_avg,ETAN_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_09DN_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_JD_avg,...
    ETAN_32_JD_avg,ETAN_62_JD_avg,ETAN_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_10JD_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_DJF_avg,...
    ETAN_32_DJF_avg,ETAN_62_DJF_avg,ETAN_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_01DJF_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_JFM_avg,...
    ETAN_32_JFM_avg,ETAN_62_JFM_avg,ETAN_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_02JFM_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_JFMAMJ_avg,...
    ETAN_32_JFMAMJ_avg,ETAN_62_JFMAMJ_avg,ETAN_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_04JFMAMJ_outside','-dpng')
close all
%% END ETAN

%% ETAN
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(ETAN_BSOSE_DJFMAM_avg,...
    ETAN_32_DJFMAM_avg,ETAN_62_DJFMAM_avg,ETAN_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,ETAN_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,ETAN_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,ETAN_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_03DJFMAM_outside','-dpng')
close all
%% END ETAN


toc()