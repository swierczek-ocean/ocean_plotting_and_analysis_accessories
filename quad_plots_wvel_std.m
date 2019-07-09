tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12 
load BSOSE_surf_avgs
load AB34_output
load AB64_output
load AB124_output
load AB32_output
load AB62_output
load AB122_output
%%

%%
option = 9;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JJA_std,...
    WVEL100_34_JJA_std,WVEL100_64_JJA_std,WVEL100_124_JJA_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_05JJA','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JAS_std,...
    WVEL100_34_JAS_std,WVEL100_64_JAS_std,WVEL100_124_JAS_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_06JAS','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JJASON_std,...
    WVEL100_34_JJASON_std,WVEL100_64_JJASON_std,WVEL100_124_JJASON_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_07JJASON','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JASOND_std,...
    WVEL100_34_JASOND_std,WVEL100_64_JASOND_std,WVEL100_124_JASOND_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_08JASOND','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_DN_std,...
    WVEL100_32_DN_std,WVEL100_62_DN_std,WVEL100_122_DN_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_09DN','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JD_std,...
    WVEL100_32_JD_std,WVEL100_62_JD_std,WVEL100_122_JD_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_10JD','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_DJF_std,...
    WVEL100_32_DJF_std,WVEL100_62_DJF_std,WVEL100_122_DJF_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_01DJF','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JFM_std,...
    WVEL100_32_JFM_std,WVEL100_62_JFM_std,WVEL100_122_JFM_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_02JFM','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_JFMAMJ_std,...
    WVEL100_32_JFMAMJ_std,WVEL100_62_JFMAMJ_std,WVEL100_122_JFMAMJ_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_04DJFMAMJ','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL100_BSOSE_DJFMAM_std,...
    WVEL100_32_DJFMAM_std,WVEL100_62_DJFMAM_std,WVEL100_122_DJFMAM_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL100_BSOSE_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 100m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL100_STD_03DJFMAM','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JJA_std,...
    WVEL190_34_JJA_std,WVEL190_64_JJA_std,WVEL190_124_JJA_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_05JJA','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JAS_std,...
    WVEL190_34_JAS_std,WVEL190_64_JAS_std,WVEL190_124_JAS_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_06JAS','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JJASON_std,...
    WVEL190_34_JJASON_std,WVEL190_64_JJASON_std,WVEL190_124_JJASON_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_07JJASON','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JASOND_std,...
    WVEL190_34_JASOND_std,WVEL190_64_JASOND_std,WVEL190_124_JASOND_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_08JASOND','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_DN_std,...
    WVEL190_32_DN_std,WVEL190_62_DN_std,WVEL190_122_DN_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_09DN','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JD_std,...
    WVEL190_32_JD_std,WVEL190_62_JD_std,WVEL190_122_JD_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_10JD','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_DJF_std,...
    WVEL190_32_DJF_std,WVEL190_62_DJF_std,WVEL190_122_DJF_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_01DJF','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JFM_std,...
    WVEL190_32_JFM_std,WVEL190_62_JFM_std,WVEL190_122_JFM_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_02JFM','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_JFMAMJ_std,...
    WVEL190_32_JFMAMJ_std,WVEL190_62_JFMAMJ_std,WVEL190_122_JFMAMJ_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_04DJFMAMJ','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL190_BSOSE_DJFMAM_std,...
    WVEL190_32_DJFMAM_std,WVEL190_62_DJFMAM_std,WVEL190_122_DJFMAM_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL190_BSOSE_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 190m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL190_STD_03DJFMAM','-dpng')
close all
%% END WVEL




%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JJA_std,...
    WVEL290_34_JJA_std,WVEL290_64_JJA_std,WVEL290_124_JJA_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_05JJA','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JAS_std,...
    WVEL290_34_JAS_std,WVEL290_64_JAS_std,WVEL290_124_JAS_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JAS_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_06JAS','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JJASON_std,...
    WVEL290_34_JJASON_std,WVEL290_64_JJASON_std,WVEL290_124_JJASON_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JJASON_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_07JJASON','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JASOND_std,...
    WVEL290_34_JASOND_std,WVEL290_64_JASOND_std,WVEL290_124_JASOND_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JASOND_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_08JASOND','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_DN_std,...
    WVEL290_32_DN_std,WVEL290_62_DN_std,WVEL290_122_DN_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DN_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_09DN','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JD_std,...
    WVEL290_32_JD_std,WVEL290_62_JD_std,WVEL290_122_JD_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JD_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_10JD','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_DJF_std,...
    WVEL290_32_DJF_std,WVEL290_62_DJF_std,WVEL290_122_DJF_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_01DJF','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JFM_std,...
    WVEL290_32_JFM_std,WVEL290_62_JFM_std,WVEL290_122_JFM_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JFM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_02JFM','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_JFMAMJ_std,...
    WVEL290_32_JFMAMJ_std,WVEL290_62_JFMAMJ_std,WVEL290_122_JFMAMJ_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_04DJFMAMJ','-dpng')
close all
%% END WVEL

%% WVEL
cm = acc_colormap('fire');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(WVEL290_BSOSE_DJFMAM_std,...
    WVEL290_32_DJFMAM_std,WVEL290_62_DJFMAM_std,WVEL290_122_DJFMAM_std,option);

z = linspace(lb,ub,nlvls);
z = [z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,WVEL290_BSOSE_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
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
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 290m Wvel stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('WVEL290_STD_03DJFMAM','-dpng')
close all
%% END WVEL



toc()