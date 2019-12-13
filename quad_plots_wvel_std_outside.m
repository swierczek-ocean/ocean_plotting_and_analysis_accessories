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
option = 9;
mask = permute(mask,[2,1,3]);
outside_coords = [288.8 351.6 -59.6 -30.6];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JJA_std,...
    WVEL100_34_JJA_std,WVEL100_64_JJA_std,WVEL100_124_JJA_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_34_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_64_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_124_JJA_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_05JJA_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JAS_std,...
    WVEL100_34_JAS_std,WVEL100_64_JAS_std,WVEL100_124_JAS_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_34_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_64_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_124_JAS_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_06JAS_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JJASON_std,...
    WVEL100_34_JJASON_std,WVEL100_64_JJASON_std,WVEL100_124_JJASON_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_34_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_64_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_124_JJASON_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_07JJASON_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JASOND_std,...
    WVEL100_34_JASOND_std,WVEL100_64_JASOND_std,WVEL100_124_JASOND_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_34_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_64_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_124_JASOND_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_08JASOND_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_DN_std,...
    WVEL100_32_DN_std,WVEL100_62_DN_std,WVEL100_122_DN_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_DN_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_09DN_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JD_std,...
    WVEL100_32_JD_std,WVEL100_62_JD_std,WVEL100_122_JD_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_JD_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_10JD_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_DJF_std,...
    WVEL100_32_DJF_std,WVEL100_62_DJF_std,WVEL100_122_DJF_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_DJF_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_01DJF_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JFM_std,...
    WVEL100_32_JFM_std,WVEL100_62_JFM_std,WVEL100_122_JFM_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_JFM_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_02JFM_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JFMAMJ_std,...
    WVEL100_32_JFMAMJ_std,WVEL100_62_JFMAMJ_std,WVEL100_122_JFMAMJ_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_04JFMAMJ_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_DJFMAM_std,...
    WVEL100_32_DJFMAM_std,WVEL100_62_DJFMAM_std,WVEL100_122_DJFMAM_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL100_32_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL100_62_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL100_122_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL100_STD_03DJFMAM_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JJA_std,...
    WVEL190_34_JJA_std,WVEL190_64_JJA_std,WVEL190_124_JJA_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_34_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_64_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_124_JJA_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_05JJA_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JAS_std,...
    WVEL190_34_JAS_std,WVEL190_64_JAS_std,WVEL190_124_JAS_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_34_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_64_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_124_JAS_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_06JAS_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JJASON_std,...
    WVEL190_34_JJASON_std,WVEL190_64_JJASON_std,WVEL190_124_JJASON_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_34_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_64_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_124_JJASON_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_07JJASON_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JASOND_std,...
    WVEL190_34_JASOND_std,WVEL190_64_JASOND_std,WVEL190_124_JASOND_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_34_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_64_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_124_JASOND_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_08JASOND_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_DN_std,...
    WVEL190_32_DN_std,WVEL190_62_DN_std,WVEL190_122_DN_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_DN_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_09DN_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JD_std,...
    WVEL190_32_JD_std,WVEL190_62_JD_std,WVEL190_122_JD_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_JD_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_10JD_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_DJF_std,...
    WVEL190_32_DJF_std,WVEL190_62_DJF_std,WVEL190_122_DJF_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_DJF_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_01DJF_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JFM_std,...
    WVEL190_32_JFM_std,WVEL190_62_JFM_std,WVEL190_122_JFM_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_JFM_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_02JFM_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JFMAMJ_std,...
    WVEL190_32_JFMAMJ_std,WVEL190_62_JFMAMJ_std,WVEL190_122_JFMAMJ_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_04JFMAMJ_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_DJFMAM_std,...
    WVEL190_32_DJFMAM_std,WVEL190_62_DJFMAM_std,WVEL190_122_DJFMAM_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL190_32_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL190_62_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL190_122_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL190_STD_03DJFMAM_outside','-dpng')
close all
%% END WVEL




%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JJA_std,...
    WVEL290_34_JJA_std,WVEL290_64_JJA_std,WVEL290_124_JJA_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_34_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_64_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_124_JJA_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_05JJA_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JAS_std,...
    WVEL290_34_JAS_std,WVEL290_64_JAS_std,WVEL290_124_JAS_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_34_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_64_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_124_JAS_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_06JAS_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JJASON_std,...
    WVEL290_34_JJASON_std,WVEL290_64_JJASON_std,WVEL290_124_JJASON_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_34_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_64_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_124_JJASON_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_07JJASON_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JASOND_std,...
    WVEL290_34_JASOND_std,WVEL290_64_JASOND_std,WVEL290_124_JASOND_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_34_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_64_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_124_JASOND_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_08JASOND_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_DN_std,...
    WVEL290_32_DN_std,WVEL290_62_DN_std,WVEL290_122_DN_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_DN_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_09DN_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JD_std,...
    WVEL290_32_JD_std,WVEL290_62_JD_std,WVEL290_122_JD_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_JD_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_10JD_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_DJF_std,...
    WVEL290_32_DJF_std,WVEL290_62_DJF_std,WVEL290_122_DJF_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_DJF_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_01DJF_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JFM_std,...
    WVEL290_32_JFM_std,WVEL290_62_JFM_std,WVEL290_122_JFM_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_JFM_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_02JFM_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JFMAMJ_std,...
    WVEL290_32_JFMAMJ_std,WVEL290_62_JFMAMJ_std,WVEL290_122_JFMAMJ_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_04JFMAMJ_outside','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_DJFMAM_std,...
    WVEL290_32_DJFMAM_std,WVEL290_62_DJFMAM_std,WVEL290_122_DJFMAM_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,WVEL290_32_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,WVEL290_62_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,WVEL290_122_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(outside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','WVEL290_STD_03DJFMAM_outside','-dpng')
close all
%% END WVEL



toc()