tic()

%%
load mask
load BSOSE_surf_avgs XCS YCS SFLUX*
load diff_avgs XC* YC* SFLUX*
%%

%%
option = 10;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
acc_colors
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_JJA_avg,...
    SFLUX_BSOSE_JJA_avg,SFLUX_BSOSE_JJA_avg,SFLUX_BSOSE_JJA_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_34_JJA_avg_diff,...
    SFLUX_34_JJA_avg_diff,SFLUX_64_JJA_avg_diff,SFLUX_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_64_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_124_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_05JJA_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_JAS_avg,...
    SFLUX_BSOSE_JAS_avg,SFLUX_BSOSE_JAS_avg,SFLUX_BSOSE_JAS_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_34_JAS_avg_diff,...
    SFLUX_34_JAS_avg_diff,SFLUX_64_JAS_avg_diff,SFLUX_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_64_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_124_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_06JAS_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_JASOND_avg,...
    SFLUX_BSOSE_JASOND_avg,SFLUX_BSOSE_JASOND_avg,SFLUX_BSOSE_JASOND_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_34_JASOND_avg_diff,...
    SFLUX_34_JASOND_avg_diff,SFLUX_64_JASOND_avg_diff,SFLUX_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_64_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_124_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_08JASOND_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_JJASON_avg,...
    SFLUX_BSOSE_JJASON_avg,SFLUX_BSOSE_JJASON_avg,SFLUX_BSOSE_JJASON_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_34_JJASON_avg_diff,...
    SFLUX_34_JJASON_avg_diff,SFLUX_64_JJASON_avg_diff,SFLUX_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_64_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_124_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_07JJASON_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_DJF_avg,...
    SFLUX_BSOSE_DJF_avg,SFLUX_BSOSE_DJF_avg,SFLUX_BSOSE_DJF_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_32_DJF_avg_diff,...
    SFLUX_32_DJF_avg_diff,SFLUX_62_DJF_avg_diff,SFLUX_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_62_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_122_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_01DJF_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_JFM_avg,...
    SFLUX_BSOSE_JFM_avg,SFLUX_BSOSE_JFM_avg,SFLUX_BSOSE_JFM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_32_JFM_avg_diff,...
    SFLUX_32_JFM_avg_diff,SFLUX_62_JFM_avg_diff,SFLUX_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_62_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_122_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_02JFM_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_DJFMAM_avg,...
    SFLUX_BSOSE_DJFMAM_avg,SFLUX_BSOSE_DJFMAM_avg,SFLUX_BSOSE_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_32_DJFMAM_avg_diff,...
    SFLUX_32_DJFMAM_avg_diff,SFLUX_62_DJFMAM_avg_diff,SFLUX_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_62_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_122_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_03DJFMAM_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_JFMAMJ_avg,...
    SFLUX_BSOSE_JFMAMJ_avg,SFLUX_BSOSE_JFMAMJ_avg,SFLUX_BSOSE_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_32_JFMAMJ_avg_diff,...
    SFLUX_32_JFMAMJ_avg_diff,SFLUX_62_JFMAMJ_avg_diff,SFLUX_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_62_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_122_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_04JFMAMJ_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_DN_avg,...
    SFLUX_BSOSE_DN_avg,SFLUX_BSOSE_DN_avg,SFLUX_BSOSE_DN_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_32_DN_avg_diff,...
    SFLUX_32_DN_avg_diff,SFLUX_62_DN_avg_diff,SFLUX_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_62_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_122_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_09DN_DIFF','-dpng')
close all
%% END SFLUX

%% SFLUX
option = 10;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(SFLUX_BSOSE_JD_avg,...
    SFLUX_BSOSE_JD_avg,SFLUX_BSOSE_JD_avg,SFLUX_BSOSE_JD_avg,option);

z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,SFLUX_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('cmo_balance');
cm = [Color(48,:);cm;Color(46,:)];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(SFLUX_32_JD_avg_diff,...
    SFLUX_32_JD_avg_diff,SFLUX_62_JD_avg_diff,SFLUX_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,SFLUX_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,SFLUX_62_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,SFLUX_122_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean salt flux','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('SFLUX_AVG_10JD_DIFF','-dpng')
close all
%% END SFLUX


toc()