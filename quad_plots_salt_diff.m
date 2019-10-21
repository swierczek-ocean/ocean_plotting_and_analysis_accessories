tic()

%%
load mask
load BSOSE_surf_avgs XCS YCS SALT*
load diff_avgs XC* YC* SALT*
%%

%%
option = 3;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
acc_colors
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_JJA_avg,...
    SALT_BSOSE_JJA_avg,SALT_BSOSE_JJA_avg,SALT_BSOSE_JJA_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_34_JJA_avg_diff,...
    SALT_34_JJA_avg_diff,SALT_64_JJA_avg_diff,SALT_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_05JJA_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_JAS_avg,...
    SALT_BSOSE_JAS_avg,SALT_BSOSE_JAS_avg,SALT_BSOSE_JAS_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_34_JAS_avg_diff,...
    SALT_34_JAS_avg_diff,SALT_64_JAS_avg_diff,SALT_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_06JAS_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_JASOND_avg,...
    SALT_BSOSE_JASOND_avg,SALT_BSOSE_JASOND_avg,SALT_BSOSE_JASOND_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_34_JASOND_avg_diff,...
    SALT_34_JASOND_avg_diff,SALT_64_JASOND_avg_diff,SALT_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_08JASOND_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_JJASON_avg,...
    SALT_BSOSE_JJASON_avg,SALT_BSOSE_JJASON_avg,SALT_BSOSE_JJASON_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_34_JJASON_avg_diff,...
    SALT_34_JJASON_avg_diff,SALT_64_JJASON_avg_diff,SALT_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_07JJASON_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_DJF_avg,...
    SALT_BSOSE_DJF_avg,SALT_BSOSE_DJF_avg,SALT_BSOSE_DJF_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_32_DJF_avg_diff,...
    SALT_32_DJF_avg_diff,SALT_62_DJF_avg_diff,SALT_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_01DJF_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_JFM_avg,...
    SALT_BSOSE_JFM_avg,SALT_BSOSE_JFM_avg,SALT_BSOSE_JFM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_32_JFM_avg_diff,...
    SALT_32_JFM_avg_diff,SALT_62_JFM_avg_diff,SALT_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_02JFM_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_DJFMAM_avg,...
    SALT_BSOSE_DJFMAM_avg,SALT_BSOSE_DJFMAM_avg,SALT_BSOSE_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_32_DJFMAM_avg_diff,...
    SALT_32_DJFMAM_avg_diff,SALT_62_DJFMAM_avg_diff,SALT_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_JFMAMJ_avg,...
    SALT_BSOSE_JFMAMJ_avg,SALT_BSOSE_JFMAMJ_avg,SALT_BSOSE_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_32_JFMAMJ_avg_diff,...
    SALT_32_JFMAMJ_avg_diff,SALT_62_JFMAMJ_avg_diff,SALT_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_DN_avg,...
    SALT_BSOSE_DN_avg,SALT_BSOSE_DN_avg,SALT_BSOSE_DN_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_32_DN_avg_diff,...
    SALT_32_DN_avg_diff,SALT_62_DN_avg_diff,SALT_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_09DN_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT_BSOSE_JD_avg,...
    SALT_BSOSE_JD_avg,SALT_BSOSE_JD_avg,SALT_BSOSE_JD_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT_32_JD_avg_diff,...
    SALT_32_JD_avg_diff,SALT_62_JD_avg_diff,SALT_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean SSS','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT_AVG_10JD_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_JJA_avg,...
    SALT105_BSOSE_JJA_avg,SALT105_BSOSE_JJA_avg,SALT105_BSOSE_JJA_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_34_JJA_avg_diff,...
    SALT105_34_JJA_avg_diff,SALT105_64_JJA_avg_diff,SALT105_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_05JJA_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_JAS_avg,...
    SALT105_BSOSE_JAS_avg,SALT105_BSOSE_JAS_avg,SALT105_BSOSE_JAS_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_34_JAS_avg_diff,...
    SALT105_34_JAS_avg_diff,SALT105_64_JAS_avg_diff,SALT105_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_06JAS_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_JASOND_avg,...
    SALT105_BSOSE_JASOND_avg,SALT105_BSOSE_JASOND_avg,SALT105_BSOSE_JASOND_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_34_JASOND_avg_diff,...
    SALT105_34_JASOND_avg_diff,SALT105_64_JASOND_avg_diff,SALT105_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_08JASOND_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_JJASON_avg,...
    SALT105_BSOSE_JJASON_avg,SALT105_BSOSE_JJASON_avg,SALT105_BSOSE_JJASON_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_34_JJASON_avg_diff,...
    SALT105_34_JJASON_avg_diff,SALT105_64_JJASON_avg_diff,SALT105_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_07JJASON_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_DJF_avg,...
    SALT105_BSOSE_DJF_avg,SALT105_BSOSE_DJF_avg,SALT105_BSOSE_DJF_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_32_DJF_avg_diff,...
    SALT105_32_DJF_avg_diff,SALT105_62_DJF_avg_diff,SALT105_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_01DJF_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_JFM_avg,...
    SALT105_BSOSE_JFM_avg,SALT105_BSOSE_JFM_avg,SALT105_BSOSE_JFM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_32_JFM_avg_diff,...
    SALT105_32_JFM_avg_diff,SALT105_62_JFM_avg_diff,SALT105_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_02JFM_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_DJFMAM_avg,...
    SALT105_BSOSE_DJFMAM_avg,SALT105_BSOSE_DJFMAM_avg,SALT105_BSOSE_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_32_DJFMAM_avg_diff,...
    SALT105_32_DJFMAM_avg_diff,SALT105_62_DJFMAM_avg_diff,SALT105_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_JFMAMJ_avg,...
    SALT105_BSOSE_JFMAMJ_avg,SALT105_BSOSE_JFMAMJ_avg,SALT105_BSOSE_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_32_JFMAMJ_avg_diff,...
    SALT105_32_JFMAMJ_avg_diff,SALT105_62_JFMAMJ_avg_diff,SALT105_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_DN_avg,...
    SALT105_BSOSE_DN_avg,SALT105_BSOSE_DN_avg,SALT105_BSOSE_DN_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_32_DN_avg_diff,...
    SALT105_32_DN_avg_diff,SALT105_62_DN_avg_diff,SALT105_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_09DN_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT105_BSOSE_JD_avg,...
    SALT105_BSOSE_JD_avg,SALT105_BSOSE_JD_avg,SALT105_BSOSE_JD_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT105_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT105_32_JD_avg_diff,...
    SALT105_32_JD_avg_diff,SALT105_62_JD_avg_diff,SALT105_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT105_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT105_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT105_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean 105m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT105_AVG_10JD_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_JJA_avg,...
    SALT200_BSOSE_JJA_avg,SALT200_BSOSE_JJA_avg,SALT200_BSOSE_JJA_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_34_JJA_avg_diff,...
    SALT200_34_JJA_avg_diff,SALT200_64_JJA_avg_diff,SALT200_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_05JJA_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_JAS_avg,...
    SALT200_BSOSE_JAS_avg,SALT200_BSOSE_JAS_avg,SALT200_BSOSE_JAS_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_34_JAS_avg_diff,...
    SALT200_34_JAS_avg_diff,SALT200_64_JAS_avg_diff,SALT200_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_06JAS_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_JASOND_avg,...
    SALT200_BSOSE_JASOND_avg,SALT200_BSOSE_JASOND_avg,SALT200_BSOSE_JASOND_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_34_JASOND_avg_diff,...
    SALT200_34_JASOND_avg_diff,SALT200_64_JASOND_avg_diff,SALT200_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_08JASOND_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_JJASON_avg,...
    SALT200_BSOSE_JJASON_avg,SALT200_BSOSE_JJASON_avg,SALT200_BSOSE_JJASON_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_34_JJASON_avg_diff,...
    SALT200_34_JJASON_avg_diff,SALT200_64_JJASON_avg_diff,SALT200_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_07JJASON_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_DJF_avg,...
    SALT200_BSOSE_DJF_avg,SALT200_BSOSE_DJF_avg,SALT200_BSOSE_DJF_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_32_DJF_avg_diff,...
    SALT200_32_DJF_avg_diff,SALT200_62_DJF_avg_diff,SALT200_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_01DJF_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_JFM_avg,...
    SALT200_BSOSE_JFM_avg,SALT200_BSOSE_JFM_avg,SALT200_BSOSE_JFM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_32_JFM_avg_diff,...
    SALT200_32_JFM_avg_diff,SALT200_62_JFM_avg_diff,SALT200_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_02JFM_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_DJFMAM_avg,...
    SALT200_BSOSE_DJFMAM_avg,SALT200_BSOSE_DJFMAM_avg,SALT200_BSOSE_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_32_DJFMAM_avg_diff,...
    SALT200_32_DJFMAM_avg_diff,SALT200_62_DJFMAM_avg_diff,SALT200_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_JFMAMJ_avg,...
    SALT200_BSOSE_JFMAMJ_avg,SALT200_BSOSE_JFMAMJ_avg,SALT200_BSOSE_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_32_JFMAMJ_avg_diff,...
    SALT200_32_JFMAMJ_avg_diff,SALT200_62_JFMAMJ_avg_diff,SALT200_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_DN_avg,...
    SALT200_BSOSE_DN_avg,SALT200_BSOSE_DN_avg,SALT200_BSOSE_DN_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_32_DN_avg_diff,...
    SALT200_32_DN_avg_diff,SALT200_62_DN_avg_diff,SALT200_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_09DN_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT200_BSOSE_JD_avg,...
    SALT200_BSOSE_JD_avg,SALT200_BSOSE_JD_avg,SALT200_BSOSE_JD_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT200_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT200_32_JD_avg_diff,...
    SALT200_32_JD_avg_diff,SALT200_62_JD_avg_diff,SALT200_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT200_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT200_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT200_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean 200m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT200_AVG_10JD_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_JJA_avg,...
    SALT300_BSOSE_JJA_avg,SALT300_BSOSE_JJA_avg,SALT300_BSOSE_JJA_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_34_JJA_avg_diff,...
    SALT300_34_JJA_avg_diff,SALT300_64_JJA_avg_diff,SALT300_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_05JJA_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_JAS_avg,...
    SALT300_BSOSE_JAS_avg,SALT300_BSOSE_JAS_avg,SALT300_BSOSE_JAS_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_34_JAS_avg_diff,...
    SALT300_34_JAS_avg_diff,SALT300_64_JAS_avg_diff,SALT300_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_06JAS_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_JASOND_avg,...
    SALT300_BSOSE_JASOND_avg,SALT300_BSOSE_JASOND_avg,SALT300_BSOSE_JASOND_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_34_JASOND_avg_diff,...
    SALT300_34_JASOND_avg_diff,SALT300_64_JASOND_avg_diff,SALT300_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_08JASOND_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_JJASON_avg,...
    SALT300_BSOSE_JJASON_avg,SALT300_BSOSE_JJASON_avg,SALT300_BSOSE_JJASON_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_34_JJASON_avg_diff,...
    SALT300_34_JJASON_avg_diff,SALT300_64_JJASON_avg_diff,SALT300_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_07JJASON_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_DJF_avg,...
    SALT300_BSOSE_DJF_avg,SALT300_BSOSE_DJF_avg,SALT300_BSOSE_DJF_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_32_DJF_avg_diff,...
    SALT300_32_DJF_avg_diff,SALT300_62_DJF_avg_diff,SALT300_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_01DJF_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_JFM_avg,...
    SALT300_BSOSE_JFM_avg,SALT300_BSOSE_JFM_avg,SALT300_BSOSE_JFM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_32_JFM_avg_diff,...
    SALT300_32_JFM_avg_diff,SALT300_62_JFM_avg_diff,SALT300_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_02JFM_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_DJFMAM_avg,...
    SALT300_BSOSE_DJFMAM_avg,SALT300_BSOSE_DJFMAM_avg,SALT300_BSOSE_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_32_DJFMAM_avg_diff,...
    SALT300_32_DJFMAM_avg_diff,SALT300_62_DJFMAM_avg_diff,SALT300_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_JFMAMJ_avg,...
    SALT300_BSOSE_JFMAMJ_avg,SALT300_BSOSE_JFMAMJ_avg,SALT300_BSOSE_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_32_JFMAMJ_avg_diff,...
    SALT300_32_JFMAMJ_avg_diff,SALT300_62_JFMAMJ_avg_diff,SALT300_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_DN_avg,...
    SALT300_BSOSE_DN_avg,SALT300_BSOSE_DN_avg,SALT300_BSOSE_DN_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_32_DN_avg_diff,...
    SALT300_32_DN_avg_diff,SALT300_62_DN_avg_diff,SALT300_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_09DN_DIFF','-dpng')
close all
%% END SALT

%% SALT
option = 3;
cm = acc_colormap('cmo_haline');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(SALT300_BSOSE_JD_avg,...
    SALT300_BSOSE_JD_avg,SALT300_BSOSE_JD_avg,SALT300_BSOSE_JD_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SALT300_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SALT300_32_JD_avg_diff,...
    SALT300_32_JD_avg_diff,SALT300_62_JD_avg_diff,SALT300_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SALT300_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SALT300_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SALT300_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean 300m S','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SALT300_AVG_10JD_DIFF','-dpng')
close all
%% END SALT


toc()