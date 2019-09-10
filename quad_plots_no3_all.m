tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12 
load NO3_BSOSE_vert
load MAT_files/AB122_output_NO3_slice_vert
load MAT_files/AB124_output_NO3_slice_vert
load MAT_files/AB62_output_NO3_slice_vert
load MAT_files/AB64_output_NO3_slice_vert
load MAT_files/AB32_output_NO3_slice_vert
load MAT_files/AB34_output_NO3_slice_vert
%%

%%
option = 1;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JJA_vert_avg,...
    NO3_34_JJA_vert_avg,NO3_64_JJA_vert_avg,NO3_124_JJA_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JJA_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JJA_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JJA_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JJA_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_05JJA_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JAS_vert_avg,...
    NO3_34_JAS_vert_avg,NO3_64_JAS_vert_avg,NO3_124_JAS_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JAS_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JAS_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JAS_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JAS_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_06JAS_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JJASON_vert_avg,...
    NO3_34_JJASON_vert_avg,NO3_64_JJASON_vert_avg,NO3_124_JJASON_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JJASON_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JJASON_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JJASON_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JJASON_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_07JJASON_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JASOND_vert_avg,...
    NO3_34_JASOND_vert_avg,NO3_64_JASOND_vert_avg,NO3_124_JASOND_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JASOND_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JASOND_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JASOND_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JASOND_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_08JASOND_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DN_vert_avg,...
    NO3_32_DN_vert_avg,NO3_62_DN_vert_avg,NO3_122_DN_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DN_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DN_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DN_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DN_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_09DN_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JD_vert_avg,...
    NO3_32_JD_vert_avg,NO3_62_JD_vert_avg,NO3_122_JD_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JD_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JD_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JD_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JD_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_10JD_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DJF_vert_avg,...
    NO3_32_DJF_vert_avg,NO3_62_DJF_vert_avg,NO3_122_DJF_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DJF_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DJF_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DJF_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DJF_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_01DJF_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JFM_vert_avg,...
    NO3_32_JFM_vert_avg,NO3_62_JFM_vert_avg,NO3_122_JFM_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JFM_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JFM_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JFM_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JFM_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_02JFM_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JFMAMJ_vert_avg,...
    NO3_32_JFMAMJ_vert_avg,NO3_62_JFMAMJ_vert_avg,NO3_122_JFMAMJ_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JFMAMJ_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JFMAMJ_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JFMAMJ_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JFMAMJ_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_04JFMAMJ_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DJFMAM_vert_avg,...
    NO3_32_DJFMAM_vert_avg,NO3_62_DJFMAM_vert_avg,NO3_122_DJFMAM_vert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DJFMAM_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DJFMAM_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DJFMAM_vert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DJFMAM_vert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_03DJFMAM_vert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JJA_tvert_avg,...
    NO3_34_JJA_tvert_avg,NO3_64_JJA_tvert_avg,NO3_124_JJA_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JJA_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JJA_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JJA_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JJA_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_05JJA_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JAS_tvert_avg,...
    NO3_34_JAS_tvert_avg,NO3_64_JAS_tvert_avg,NO3_124_JAS_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JAS_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JAS_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JAS_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JAS_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_06JAS_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JJASON_tvert_avg,...
    NO3_34_JJASON_tvert_avg,NO3_64_JJASON_tvert_avg,NO3_124_JJASON_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JJASON_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JJASON_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JJASON_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JJASON_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_07JJASON_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JASOND_tvert_avg,...
    NO3_34_JASOND_tvert_avg,NO3_64_JASOND_tvert_avg,NO3_124_JASOND_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JASOND_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JASOND_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JASOND_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JASOND_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_08JASOND_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DN_tvert_avg,...
    NO3_32_DN_tvert_avg,NO3_62_DN_tvert_avg,NO3_122_DN_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DN_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DN_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DN_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DN_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_09DN_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JD_tvert_avg,...
    NO3_32_JD_tvert_avg,NO3_62_JD_tvert_avg,NO3_122_JD_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JD_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JD_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JD_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JD_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_10JD_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DJF_tvert_avg,...
    NO3_32_DJF_tvert_avg,NO3_62_DJF_tvert_avg,NO3_122_DJF_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DJF_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DJF_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DJF_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DJF_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_01DJF_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JFM_tvert_avg,...
    NO3_32_JFM_tvert_avg,NO3_62_JFM_tvert_avg,NO3_122_JFM_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JFM_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JFM_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JFM_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JFM_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_02JFM_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JFMAMJ_tvert_avg,...
    NO3_32_JFMAMJ_tvert_avg,NO3_62_JFMAMJ_tvert_avg,NO3_122_JFMAMJ_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JFMAMJ_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JFMAMJ_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JFMAMJ_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JFMAMJ_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_04JFMAMJ_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DJFMAM_tvert_avg,...
    NO3_32_DJFMAM_tvert_avg,NO3_62_DJFMAM_tvert_avg,NO3_122_DJFMAM_tvert_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DJFMAM_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DJFMAM_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DJFMAM_tvert_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DJFMAM_tvert_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 total NO3 content','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_03DJFMAM_tvert','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JJA_vert100_avg,...
    NO3_34_JJA_vert100_avg,NO3_64_JJA_vert100_avg,NO3_124_JJA_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JJA_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JJA_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JJA_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JJA_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_05JJA_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JAS_vert100_avg,...
    NO3_34_JAS_vert100_avg,NO3_64_JAS_vert100_avg,NO3_124_JAS_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JAS_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JAS_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JAS_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JAS_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_06JAS_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JJASON_vert100_avg,...
    NO3_34_JJASON_vert100_avg,NO3_64_JJASON_vert100_avg,NO3_124_JJASON_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JJASON_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JJASON_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JJASON_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JJASON_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_07JJASON_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JASOND_vert100_avg,...
    NO3_34_JASOND_vert100_avg,NO3_64_JASOND_vert100_avg,NO3_124_JASOND_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JASOND_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_34_JASOND_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_64_JASOND_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_124_JASOND_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_08JASOND_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DN_vert100_avg,...
    NO3_32_DN_vert100_avg,NO3_62_DN_vert100_avg,NO3_122_DN_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DN_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DN_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DN_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DN_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_09DN_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JD_vert100_avg,...
    NO3_32_JD_vert100_avg,NO3_62_JD_vert100_avg,NO3_122_JD_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JD_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JD_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JD_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JD_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_10JD_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DJF_vert100_avg,...
    NO3_32_DJF_vert100_avg,NO3_62_DJF_vert100_avg,NO3_122_DJF_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DJF_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DJF_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DJF_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DJF_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_01DJF_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JFM_vert100_avg,...
    NO3_32_JFM_vert100_avg,NO3_62_JFM_vert100_avg,NO3_122_JFM_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JFM_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JFM_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JFM_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JFM_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_02JFM_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_JFMAMJ_vert100_avg,...
    NO3_32_JFMAMJ_vert100_avg,NO3_62_JFMAMJ_vert100_avg,NO3_122_JFMAMJ_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_JFMAMJ_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_JFMAMJ_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_JFMAMJ_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_JFMAMJ_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_04JFMAMJ_vert100','-dpng')
close all
%% END NO3

%% NO3
cm = flipud(acc_colormap_2('cmo_deep'));
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(NO3_BSOSE_DJFMAM_vert100_avg,...
    NO3_32_DJFMAM_vert100_avg,NO3_62_DJFMAM_vert100_avg,NO3_122_DJFMAM_vert100_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,NO3_BSOSE_DJFMAM_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_32_DJFMAM_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_62_DJFMAM_vert100_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_122_DJFMAM_vert100_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 upper 100m NO3','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('NO3_AVG_03DJFMAM_vert100','-dpng')
close all
%% END NO3



toc()