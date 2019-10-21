tic()

%%
load mask
load BSOSE_surf_avgs XCS YCS THETA*
load diff_avgs XC* YC* THETA*
%%

%%
option = 1;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
acc_colors
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JJA_avg,...
    THETA_BSOSE_JJA_avg,THETA_BSOSE_JJA_avg,THETA_BSOSE_JJA_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_34_JJA_avg_diff,...
    THETA_34_JJA_avg_diff,THETA_64_JJA_avg_diff,THETA_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_05JJA_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JAS_avg,...
    THETA_BSOSE_JAS_avg,THETA_BSOSE_JAS_avg,THETA_BSOSE_JAS_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_34_JAS_avg_diff,...
    THETA_34_JAS_avg_diff,THETA_64_JAS_avg_diff,THETA_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_06JAS_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JASOND_avg,...
    THETA_BSOSE_JASOND_avg,THETA_BSOSE_JASOND_avg,THETA_BSOSE_JASOND_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_34_JASOND_avg_diff,...
    THETA_34_JASOND_avg_diff,THETA_64_JASOND_avg_diff,THETA_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_08JASOND_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JJASON_avg,...
    THETA_BSOSE_JJASON_avg,THETA_BSOSE_JJASON_avg,THETA_BSOSE_JJASON_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_34_JJASON_avg_diff,...
    THETA_34_JJASON_avg_diff,THETA_64_JJASON_avg_diff,THETA_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_07JJASON_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_DJF_avg,...
    THETA_BSOSE_DJF_avg,THETA_BSOSE_DJF_avg,THETA_BSOSE_DJF_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_32_DJF_avg_diff,...
    THETA_32_DJF_avg_diff,THETA_62_DJF_avg_diff,THETA_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_01DJF_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JFM_avg,...
    THETA_BSOSE_JFM_avg,THETA_BSOSE_JFM_avg,THETA_BSOSE_JFM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_32_JFM_avg_diff,...
    THETA_32_JFM_avg_diff,THETA_62_JFM_avg_diff,THETA_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_02JFM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_DJFMAM_avg,...
    THETA_BSOSE_DJFMAM_avg,THETA_BSOSE_DJFMAM_avg,THETA_BSOSE_DJFMAM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_32_DJFMAM_avg_diff,...
    THETA_32_DJFMAM_avg_diff,THETA_62_DJFMAM_avg_diff,THETA_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JFMAMJ_avg,...
    THETA_BSOSE_JFMAMJ_avg,THETA_BSOSE_JFMAMJ_avg,THETA_BSOSE_JFMAMJ_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_32_JFMAMJ_avg_diff,...
    THETA_32_JFMAMJ_avg_diff,THETA_62_JFMAMJ_avg_diff,THETA_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_DN_avg,...
    THETA_BSOSE_DN_avg,THETA_BSOSE_DN_avg,THETA_BSOSE_DN_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_32_DN_avg_diff,...
    THETA_32_DN_avg_diff,THETA_62_DN_avg_diff,THETA_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_09DN_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JD_avg,...
    THETA_BSOSE_JD_avg,THETA_BSOSE_JD_avg,THETA_BSOSE_JD_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 11;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA_32_JD_avg_diff,...
    THETA_32_JD_avg_diff,THETA_62_JD_avg_diff,THETA_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA_AVG_10JD_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JJA_avg,...
    THETA105_BSOSE_JJA_avg,THETA105_BSOSE_JJA_avg,THETA105_BSOSE_JJA_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_34_JJA_avg_diff,...
    THETA105_34_JJA_avg_diff,THETA105_64_JJA_avg_diff,THETA105_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_05JJA_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JAS_avg,...
    THETA105_BSOSE_JAS_avg,THETA105_BSOSE_JAS_avg,THETA105_BSOSE_JAS_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_34_JAS_avg_diff,...
    THETA105_34_JAS_avg_diff,THETA105_64_JAS_avg_diff,THETA105_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_06JAS_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JASOND_avg,...
    THETA105_BSOSE_JASOND_avg,THETA105_BSOSE_JASOND_avg,THETA105_BSOSE_JASOND_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_34_JASOND_avg_diff,...
    THETA105_34_JASOND_avg_diff,THETA105_64_JASOND_avg_diff,THETA105_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_08JASOND_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JJASON_avg,...
    THETA105_BSOSE_JJASON_avg,THETA105_BSOSE_JJASON_avg,THETA105_BSOSE_JJASON_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_34_JJASON_avg_diff,...
    THETA105_34_JJASON_avg_diff,THETA105_64_JJASON_avg_diff,THETA105_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_07JJASON_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_DJF_avg,...
    THETA105_BSOSE_DJF_avg,THETA105_BSOSE_DJF_avg,THETA105_BSOSE_DJF_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_32_DJF_avg_diff,...
    THETA105_32_DJF_avg_diff,THETA105_62_DJF_avg_diff,THETA105_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_01DJF_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JFM_avg,...
    THETA105_BSOSE_JFM_avg,THETA105_BSOSE_JFM_avg,THETA105_BSOSE_JFM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_32_JFM_avg_diff,...
    THETA105_32_JFM_avg_diff,THETA105_62_JFM_avg_diff,THETA105_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_02JFM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_DJFMAM_avg,...
    THETA105_BSOSE_DJFMAM_avg,THETA105_BSOSE_DJFMAM_avg,THETA105_BSOSE_DJFMAM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_32_DJFMAM_avg_diff,...
    THETA105_32_DJFMAM_avg_diff,THETA105_62_DJFMAM_avg_diff,THETA105_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JFMAMJ_avg,...
    THETA105_BSOSE_JFMAMJ_avg,THETA105_BSOSE_JFMAMJ_avg,THETA105_BSOSE_JFMAMJ_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_32_JFMAMJ_avg_diff,...
    THETA105_32_JFMAMJ_avg_diff,THETA105_62_JFMAMJ_avg_diff,THETA105_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_DN_avg,...
    THETA105_BSOSE_DN_avg,THETA105_BSOSE_DN_avg,THETA105_BSOSE_DN_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_32_DN_avg_diff,...
    THETA105_32_DN_avg_diff,THETA105_62_DN_avg_diff,THETA105_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_09DN_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JD_avg,...
    THETA105_BSOSE_JD_avg,THETA105_BSOSE_JD_avg,THETA105_BSOSE_JD_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA105_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA105_32_JD_avg_diff,...
    THETA105_32_JD_avg_diff,THETA105_62_JD_avg_diff,THETA105_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA105_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA105_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA105_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA105_AVG_10JD_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JJA_avg,...
    THETA200_BSOSE_JJA_avg,THETA200_BSOSE_JJA_avg,THETA200_BSOSE_JJA_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_34_JJA_avg_diff,...
    THETA200_34_JJA_avg_diff,THETA200_64_JJA_avg_diff,THETA200_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_05JJA_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JAS_avg,...
    THETA200_BSOSE_JAS_avg,THETA200_BSOSE_JAS_avg,THETA200_BSOSE_JAS_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_34_JAS_avg_diff,...
    THETA200_34_JAS_avg_diff,THETA200_64_JAS_avg_diff,THETA200_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_06JAS_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JASOND_avg,...
    THETA200_BSOSE_JASOND_avg,THETA200_BSOSE_JASOND_avg,THETA200_BSOSE_JASOND_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_34_JASOND_avg_diff,...
    THETA200_34_JASOND_avg_diff,THETA200_64_JASOND_avg_diff,THETA200_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_08JASOND_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JJASON_avg,...
    THETA200_BSOSE_JJASON_avg,THETA200_BSOSE_JJASON_avg,THETA200_BSOSE_JJASON_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_34_JJASON_avg_diff,...
    THETA200_34_JJASON_avg_diff,THETA200_64_JJASON_avg_diff,THETA200_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_07JJASON_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_DJF_avg,...
    THETA200_BSOSE_DJF_avg,THETA200_BSOSE_DJF_avg,THETA200_BSOSE_DJF_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_32_DJF_avg_diff,...
    THETA200_32_DJF_avg_diff,THETA200_62_DJF_avg_diff,THETA200_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_01DJF_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JFM_avg,...
    THETA200_BSOSE_JFM_avg,THETA200_BSOSE_JFM_avg,THETA200_BSOSE_JFM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_32_JFM_avg_diff,...
    THETA200_32_JFM_avg_diff,THETA200_62_JFM_avg_diff,THETA200_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_02JFM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_DJFMAM_avg,...
    THETA200_BSOSE_DJFMAM_avg,THETA200_BSOSE_DJFMAM_avg,THETA200_BSOSE_DJFMAM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_32_DJFMAM_avg_diff,...
    THETA200_32_DJFMAM_avg_diff,THETA200_62_DJFMAM_avg_diff,THETA200_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JFMAMJ_avg,...
    THETA200_BSOSE_JFMAMJ_avg,THETA200_BSOSE_JFMAMJ_avg,THETA200_BSOSE_JFMAMJ_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_32_JFMAMJ_avg_diff,...
    THETA200_32_JFMAMJ_avg_diff,THETA200_62_JFMAMJ_avg_diff,THETA200_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_DN_avg,...
    THETA200_BSOSE_DN_avg,THETA200_BSOSE_DN_avg,THETA200_BSOSE_DN_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_32_DN_avg_diff,...
    THETA200_32_DN_avg_diff,THETA200_62_DN_avg_diff,THETA200_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_09DN_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JD_avg,...
    THETA200_BSOSE_JD_avg,THETA200_BSOSE_JD_avg,THETA200_BSOSE_JD_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA200_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA200_32_JD_avg_diff,...
    THETA200_32_JD_avg_diff,THETA200_62_JD_avg_diff,THETA200_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA200_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA200_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA200_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA200_AVG_10JD_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JJA_avg,...
    THETA300_BSOSE_JJA_avg,THETA300_BSOSE_JJA_avg,THETA300_BSOSE_JJA_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_34_JJA_avg_diff,...
    THETA300_34_JJA_avg_diff,THETA300_64_JJA_avg_diff,THETA300_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_05JJA_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JAS_avg,...
    THETA300_BSOSE_JAS_avg,THETA300_BSOSE_JAS_avg,THETA300_BSOSE_JAS_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_34_JAS_avg_diff,...
    THETA300_34_JAS_avg_diff,THETA300_64_JAS_avg_diff,THETA300_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_06JAS_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JASOND_avg,...
    THETA300_BSOSE_JASOND_avg,THETA300_BSOSE_JASOND_avg,THETA300_BSOSE_JASOND_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_34_JASOND_avg_diff,...
    THETA300_34_JASOND_avg_diff,THETA300_64_JASOND_avg_diff,THETA300_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_08JASOND_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JJASON_avg,...
    THETA300_BSOSE_JJASON_avg,THETA300_BSOSE_JJASON_avg,THETA300_BSOSE_JJASON_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_34_JJASON_avg_diff,...
    THETA300_34_JJASON_avg_diff,THETA300_64_JJASON_avg_diff,THETA300_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_07JJASON_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_DJF_avg,...
    THETA300_BSOSE_DJF_avg,THETA300_BSOSE_DJF_avg,THETA300_BSOSE_DJF_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_DJF_avg_diff,...
    THETA300_32_DJF_avg_diff,THETA300_62_DJF_avg_diff,THETA300_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_01DJF_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JFM_avg,...
    THETA300_BSOSE_JFM_avg,THETA300_BSOSE_JFM_avg,THETA300_BSOSE_JFM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_JFM_avg_diff,...
    THETA300_32_JFM_avg_diff,THETA300_62_JFM_avg_diff,THETA300_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_02JFM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_DJFMAM_avg,...
    THETA300_BSOSE_DJFMAM_avg,THETA300_BSOSE_DJFMAM_avg,THETA300_BSOSE_DJFMAM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_DJFMAM_avg_diff,...
    THETA300_32_DJFMAM_avg_diff,THETA300_62_DJFMAM_avg_diff,THETA300_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JFMAMJ_avg,...
    THETA300_BSOSE_JFMAMJ_avg,THETA300_BSOSE_JFMAMJ_avg,THETA300_BSOSE_JFMAMJ_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_JFMAMJ_avg_diff,...
    THETA300_32_JFMAMJ_avg_diff,THETA300_62_JFMAMJ_avg_diff,THETA300_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_DN_avg,...
    THETA300_BSOSE_DN_avg,THETA300_BSOSE_DN_avg,THETA300_BSOSE_DN_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_DN_avg_diff,...
    THETA300_32_DN_avg_diff,THETA300_62_DN_avg_diff,THETA300_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_09DN_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('es_coolwarm');
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JD_avg,...
    THETA300_BSOSE_JD_avg,THETA300_BSOSE_JD_avg,THETA300_BSOSE_JD_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,THETA300_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_JD_avg_diff,...
    THETA300_32_JD_avg_diff,THETA300_62_JD_avg_diff,THETA300_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,THETA300_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,THETA300_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_10JD_DIFF','-dpng')
close all
%% END THETA


toc()