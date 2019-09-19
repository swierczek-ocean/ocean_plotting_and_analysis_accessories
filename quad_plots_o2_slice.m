clear
close all
clc

tic()
acc_settings

%%
load XY3 
load XY6 
load XY12
load BSOSE_slice_avgs O2_BSOSE* YCS
load MAT_files/AB122_output_O2_slice_vert O2_122*
load MAT_files/AB62_output_O2_slice_vert O2_62*
load MAT_files/AB32_output_O2_slice_vert O2_32*
load MAT_files/AB124_output_O2_slice_vert O2_124*
load MAT_files/AB64_output_O2_slice_vert O2_64*
load MAT_files/AB34_output_O2_slice_vert O2_34*

RC3 = -cumsum(DRF3);
RC6 = -cumsum(DRF6);
RC12 = -cumsum(DRF12);
RCS = RC6;
RCm = -cumsum(DRF12);

%%


%%
numdate = datenum('12012016','mmddyyyy');
option = 1;
inside_coords = [-58.7 -32 -6000 0];
YCm = YC12';
[YC3,RC3] = ndgrid(YC3,RC3);
[YC6,RC6] = ndgrid(YC6,RC6);
[YC12,RC12] = ndgrid(YC12,RC12);
[YCS,RCS] = ndgrid(YCS,RCS);
clear *field* *MASK* mm nn ii jj hix hiy lox loy str *DYG* *DXG* *DRF*

slice_mask = squeeze(hFacC12(223,:,:));
[YCm,RCm] = ndgrid(YCm,RCm);
%%

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_JJA_slice_avg,...
    O2_34_JJA_slice_avg,O2_64_JJA_slice_avg,O2_124_JJA_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_JJA_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_34_JJA_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_64_JJA_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_124_JJA_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_05JJA_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_JAS_slice_avg,...
    O2_34_JAS_slice_avg,O2_64_JAS_slice_avg,O2_124_JAS_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_JAS_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_34_JAS_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_64_JAS_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_124_JAS_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_06JAS_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_JJASON_slice_avg,...
    O2_34_JJASON_slice_avg,O2_64_JJASON_slice_avg,O2_124_JJASON_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_JJASON_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_34_JJASON_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_64_JJASON_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_124_JJASON_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_07JJASON_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_JASOND_slice_avg,...
    O2_34_JASOND_slice_avg,O2_64_JASOND_slice_avg,O2_124_JASOND_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_JASOND_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_34_JASOND_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_64_JASOND_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_124_JASOND_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_08JASOND_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_DN_slice_avg,...
    O2_32_DN_slice_avg,O2_62_DN_slice_avg,O2_122_DN_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_DN_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_32_DN_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_62_DN_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_122_DN_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_09DN_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_JD_slice_avg,...
    O2_32_JD_slice_avg,O2_62_JD_slice_avg,O2_122_JD_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_JD_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_32_JD_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_62_JD_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_122_JD_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_10JD_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_DJF_slice_avg,...
    O2_32_DJF_slice_avg,O2_62_DJF_slice_avg,O2_122_DJF_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_DJF_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_32_DJF_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_62_DJF_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_122_DJF_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_01DJF_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_JFM_slice_avg,...
    O2_32_JFM_slice_avg,O2_62_JFM_slice_avg,O2_122_JFM_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_JFM_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_32_JFM_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_62_JFM_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_122_JFM_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_02JFM_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_JFMAMJ_slice_avg,...
    O2_32_JFMAMJ_slice_avg,O2_62_JFMAMJ_slice_avg,O2_122_JFMAMJ_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_JFMAMJ_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_32_JFMAMJ_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_62_JFMAMJ_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_122_JFMAMJ_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_04JFMAMJ_slice','-dpng')
close all
%% END O2

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_BSOSE_DJFMAM_slice_avg,...
    O2_32_DJFMAM_slice_avg,O2_62_DJFMAM_slice_avg,O2_122_DJFMAM_slice_avg,option);
% lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_BSOSE_DJFMAM_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_32_DJFMAM_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_62_DJFMAM_slice_avg,'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_122_DJFMAM_slice_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
hold off
print('O2_AVG_03DJFMAM_slice','-dpng')
close all
%% END O2




toc()