tic()

%%
load mask
load BSOSE_surf_avgs XCS YCS ETAN*
load diff_avgs XC* YC* ETAN* 
%%

%%
option = 13;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
acc_colors
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_JJA_std,...
    ETAN_BSOSE_JJA_std,ETAN_BSOSE_JJA_std,ETAN_BSOSE_JJA_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JJA_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_34_JJA_std_diff,...
    ETAN_34_JJA_std_diff,ETAN_64_JJA_std_diff,ETAN_124_JJA_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_34_JJA_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJA 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_64_JJA_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJA 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_124_JJA_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_05JJA_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_JAS_std,...
    ETAN_BSOSE_JAS_std,ETAN_BSOSE_JAS_std,ETAN_BSOSE_JAS_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JAS_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_34_JAS_std_diff,...
    ETAN_34_JAS_std_diff,ETAN_64_JAS_std_diff,ETAN_124_JAS_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_34_JAS_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JAS 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_64_JAS_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JAS 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_124_JAS_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_06JAS_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_JASOND_std,...
    ETAN_BSOSE_JASOND_std,ETAN_BSOSE_JASOND_std,ETAN_BSOSE_JASOND_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JASOND_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_34_JASOND_std_diff,...
    ETAN_34_JASOND_std_diff,ETAN_64_JASOND_std_diff,ETAN_124_JASOND_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_34_JASOND_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JASOND 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_64_JASOND_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JASOND 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_124_JASOND_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_08JASOND_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_JJASON_std,...
    ETAN_BSOSE_JJASON_std,ETAN_BSOSE_JJASON_std,ETAN_BSOSE_JJASON_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JJASON_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_34_JJASON_std_diff,...
    ETAN_34_JJASON_std_diff,ETAN_64_JJASON_std_diff,ETAN_124_JJASON_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_34_JJASON_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JJASON 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_64_JJASON_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JJASON 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_124_JJASON_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_07JJASON_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_DJF_std,...
    ETAN_BSOSE_DJF_std,ETAN_BSOSE_DJF_std,ETAN_BSOSE_DJF_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DJF_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_32_DJF_std_diff,...
    ETAN_32_DJF_std_diff,ETAN_62_DJF_std_diff,ETAN_122_DJF_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_32_DJF_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJF 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_62_DJF_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJF 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_122_DJF_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_01DJF_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_JFM_std,...
    ETAN_BSOSE_JFM_std,ETAN_BSOSE_JFM_std,ETAN_BSOSE_JFM_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JFM_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_32_JFM_std_diff,...
    ETAN_32_JFM_std_diff,ETAN_62_JFM_std_diff,ETAN_122_JFM_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_32_JFM_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFM 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_62_JFM_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFM 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_122_JFM_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_02JFM_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_DJFMAM_std,...
    ETAN_BSOSE_DJFMAM_std,ETAN_BSOSE_DJFMAM_std,ETAN_BSOSE_DJFMAM_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DJFMAM_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_32_DJFMAM_std_diff,...
    ETAN_32_DJFMAM_std_diff,ETAN_62_DJFMAM_std_diff,ETAN_122_DJFMAM_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_32_DJFMAM_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DJFMAM 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_62_DJFMAM_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DJFMAM 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_122_DJFMAM_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_03DJFMAM_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_JFMAMJ_std,...
    ETAN_BSOSE_JFMAMJ_std,ETAN_BSOSE_JFMAMJ_std,ETAN_BSOSE_JFMAMJ_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JFMAMJ_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_32_JFMAMJ_std_diff,...
    ETAN_32_JFMAMJ_std_diff,ETAN_62_JFMAMJ_std_diff,ETAN_122_JFMAMJ_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_32_JFMAMJ_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_62_JFMAMJ_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_122_JFMAMJ_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_04JFMAMJ_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_DN_std,...
    ETAN_BSOSE_DN_std,ETAN_BSOSE_DN_std,ETAN_BSOSE_DN_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_DN_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_32_DN_std_diff,...
    ETAN_32_DN_std_diff,ETAN_62_DN_std_diff,ETAN_122_DN_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_32_DN_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE DN 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_62_DN_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE DN 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_122_DN_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_09DN_DIFF','-dpng')
close all
%% END ETAN

%% ETAN
option = 8;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_BSOSE_JD_std,...
    ETAN_BSOSE_JD_std,ETAN_BSOSE_JD_std,ETAN_BSOSE_JD_std,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCS,YCS,ETAN_BSOSE_JD_std,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(ETAN_32_JD_std_diff,...
    ETAN_32_JD_std_diff,ETAN_62_JD_std_diff,ETAN_122_JD_std_diff,option);
z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];

ax2 = subplot(2,2,2);
contourf(XCS,YCS,ETAN_32_JD_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING - BSOSE JD 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCS,YCS,ETAN_62_JD_std_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING - BSOSE JD 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCS,YCS,ETAN_122_JD_std_diff,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean SSH stdev','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_STD_10JD_DIFF','-dpng')
close all
%% END ETAN


toc()