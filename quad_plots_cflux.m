tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12 
load BSOSE_surf_avgs XCS YCS CFLUX*
load AB34_output CFLUX*
load AB64_output CFLUX*
load AB124_output CFLUX*
load AB32_output CFLUX*
load AB62_output CFLUX*
load AB122_output CFLUX*
%%

%%
option = 3;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% CFLUX
cm = acc_colormap('cmo_balance');
%
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_JJA_avg,...
    CFLUX_34_JJA_avg,CFLUX_64_JJA_avg,CFLUX_124_JJA_avg,option);

CFLUX_BSOSE_JJA_avg(CFLUX_BSOSE_JJA_avg==99999999999) = NaN;
CFLUX_34_JJA_avg(CFLUX_34_JJA_avg==99999999999) = NaN;
CFLUX_124_JJA_avg(CFLUX_124_JJA_avg==99999999999) = NaN;
CFLUX_64_JJA_avg(CFLUX_64_JJA_avg==99999999999) = NaN;

z = linspace(lb,ub,nlvls);
% 

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','-r300','CFLUX_AVG_05JJA','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_JAS_avg,...
    CFLUX_34_JAS_avg,CFLUX_64_JAS_avg,CFLUX_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_06JAS','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_JJASON_avg,...
    CFLUX_34_JJASON_avg,CFLUX_64_JJASON_avg,CFLUX_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_07JJASON','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_JASOND_avg,...
    CFLUX_34_JASOND_avg,CFLUX_64_JASOND_avg,CFLUX_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_08JASOND','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_DN_avg,...
    CFLUX_32_DN_avg,CFLUX_62_DN_avg,CFLUX_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_09DN','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_JD_avg,...
    CFLUX_32_JD_avg,CFLUX_62_JD_avg,CFLUX_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_10JD','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_DJF_avg,...
    CFLUX_32_DJF_avg,CFLUX_62_DJF_avg,CFLUX_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_01DJF','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_JFM_avg,...
    CFLUX_32_JFM_avg,CFLUX_62_JFM_avg,CFLUX_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_02JFM','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_JFMAMJ_avg,...
    CFLUX_32_JFMAMJ_avg,CFLUX_62_JFMAMJ_avg,CFLUX_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_04JFMAMJ','-dpng')
close all
%% END CFLUX

%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_BSOSE_DJFMAM_avg,...
    CFLUX_32_DJFMAM_avg,CFLUX_62_DJFMAM_avg,CFLUX_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,CFLUX_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean CO2 flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); set(gcf,'InvertHardCopy','off'); print('-r300','-r300','CFLUX_AVG_03DJFMAM','-dpng')
close all
%% END CFLUX


toc()