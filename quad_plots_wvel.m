tic()
acc_settings

%%
load mask
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load BSOSE_surf_avgs XCS YCS WVEL*
load AB34_output WVEL*
load AB64_output WVEL*
load AB124_output WVEL*
load AB32_output WVEL*
load AB62_output WVEL*
load AB122_output WVEL*
%%

%%
option = 2;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_JJA_avg,...
    WVEL100_34_JJA_avg,WVEL100_64_JJA_avg,WVEL100_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_05JJA','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_JAS_avg,...
    WVEL100_34_JAS_avg,WVEL100_64_JAS_avg,WVEL100_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_06JAS','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_JJASON_avg,...
    WVEL100_34_JJASON_avg,WVEL100_64_JJASON_avg,WVEL100_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_07JJASON','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_JASOND_avg,...
    WVEL100_34_JASOND_avg,WVEL100_64_JASOND_avg,WVEL100_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_08JASOND','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_DN_avg,...
    WVEL100_32_DN_avg,WVEL100_62_DN_avg,WVEL100_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_09DN','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_JD_avg,...
    WVEL100_32_JD_avg,WVEL100_62_JD_avg,WVEL100_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_10JD','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_DJF_avg,...
    WVEL100_32_DJF_avg,WVEL100_62_DJF_avg,WVEL100_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_01DJF','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_JFM_avg,...
    WVEL100_32_JFM_avg,WVEL100_62_JFM_avg,WVEL100_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_02JFM','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_JFMAMJ_avg,...
    WVEL100_32_JFMAMJ_avg,WVEL100_62_JFMAMJ_avg,WVEL100_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_04JFMAMJ','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL100_BSOSE_DJFMAM_avg,...
    WVEL100_32_DJFMAM_avg,WVEL100_62_DJFMAM_avg,WVEL100_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 100m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_AVG_03DJFMAM','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_JJA_avg,...
    WVEL190_34_JJA_avg,WVEL190_64_JJA_avg,WVEL190_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_05JJA','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_JAS_avg,...
    WVEL190_34_JAS_avg,WVEL190_64_JAS_avg,WVEL190_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_06JAS','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_JJASON_avg,...
    WVEL190_34_JJASON_avg,WVEL190_64_JJASON_avg,WVEL190_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_07JJASON','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_JASOND_avg,...
    WVEL190_34_JASOND_avg,WVEL190_64_JASOND_avg,WVEL190_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_08JASOND','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_DN_avg,...
    WVEL190_32_DN_avg,WVEL190_62_DN_avg,WVEL190_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_09DN','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_JD_avg,...
    WVEL190_32_JD_avg,WVEL190_62_JD_avg,WVEL190_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_10JD','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_DJF_avg,...
    WVEL190_32_DJF_avg,WVEL190_62_DJF_avg,WVEL190_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_01DJF','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_JFM_avg,...
    WVEL190_32_JFM_avg,WVEL190_62_JFM_avg,WVEL190_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_02JFM','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_JFMAMJ_avg,...
    WVEL190_32_JFMAMJ_avg,WVEL190_62_JFMAMJ_avg,WVEL190_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_04JFMAMJ','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL190_BSOSE_DJFMAM_avg,...
    WVEL190_32_DJFMAM_avg,WVEL190_62_DJFMAM_avg,WVEL190_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 190m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_AVG_03DJFMAM','-dpng')
close all
%% END WVEL




%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_JJA_avg,...
    WVEL290_34_JJA_avg,WVEL290_64_JJA_avg,WVEL290_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_05JJA','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_JAS_avg,...
    WVEL290_34_JAS_avg,WVEL290_64_JAS_avg,WVEL290_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_06JAS','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_JJASON_avg,...
    WVEL290_34_JJASON_avg,WVEL290_64_JJASON_avg,WVEL290_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_07JJASON','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_JASOND_avg,...
    WVEL290_34_JASOND_avg,WVEL290_64_JASOND_avg,WVEL290_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_08JASOND','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_DN_avg,...
    WVEL290_32_DN_avg,WVEL290_62_DN_avg,WVEL290_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_09DN','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_JD_avg,...
    WVEL290_32_JD_avg,WVEL290_62_JD_avg,WVEL290_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_10JD','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_DJF_avg,...
    WVEL290_32_DJF_avg,WVEL290_62_DJF_avg,WVEL290_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_01DJF','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_JFM_avg,...
    WVEL290_32_JFM_avg,WVEL290_62_JFM_avg,WVEL290_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_02JFM','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_JFMAMJ_avg,...
    WVEL290_32_JFMAMJ_avg,WVEL290_62_JFMAMJ_avg,WVEL290_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_04JFMAMJ','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(WVEL290_BSOSE_DJFMAM_avg,...
    WVEL290_32_DJFMAM_avg,WVEL290_62_DJFMAM_avg,WVEL290_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 290m Wvel','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_AVG_03DJFMAM','-dpng')
close all
%% END WVEL



toc()