%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_34_JJA_avg_diff,...
    THETA300_34_JJA_avg_diff,THETA300_64_JJA_avg_diff,THETA300_124_JJA_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_34_JJA_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_JJA_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_34_JAS_avg_diff,...
    THETA300_34_JAS_avg_diff,THETA300_64_JAS_avg_diff,THETA300_124_JAS_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_34_JAS_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_JAS_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_34_JASOND_avg_diff,...
    THETA300_34_JASOND_avg_diff,THETA300_64_JASOND_avg_diff,THETA300_124_JASOND_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_34_JASOND_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_JASOND_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_34_JJASON_avg_diff,...
    THETA300_34_JJASON_avg_diff,THETA300_64_JJASON_avg_diff,THETA300_124_JJASON_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_34_JJASON_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_JJASON_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_DJF_avg_diff,...
    THETA300_32_DJF_avg_diff,THETA300_62_DJF_avg_diff,THETA300_122_DJF_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_DJF_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_DJF_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_JFM_avg_diff,...
    THETA300_32_JFM_avg_diff,THETA300_62_JFM_avg_diff,THETA300_122_JFM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_JFM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_JFM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_DJFMAM_avg_diff,...
    THETA300_32_DJFMAM_avg_diff,THETA300_62_DJFMAM_avg_diff,THETA300_122_DJFMAM_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_DJFMAM_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_DJFMAM_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_JFMAMJ_avg_diff,...
    THETA300_32_JFMAMJ_avg_diff,THETA300_62_JFMAMJ_avg_diff,THETA300_122_JFMAMJ_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_JFMAMJ_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_JFMAMJ_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_DN_avg_diff,...
    THETA300_32_DN_avg_diff,THETA300_62_DN_avg_diff,THETA300_122_DN_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_DN_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_DN_DIFF','-dpng')
close all
%% END THETA

%% THETA
option = 1;
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 3;
cm = acc_colormap('balance');
cm = [Color(:,48)';cm;Color(:,46)'];
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA300_32_JD_avg_diff,...
    THETA300_32_JD_avg_diff,THETA300_62_JD_avg_diff,THETA300_122_JD_avg_diff,option);
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];
ax2 = subplot(2,2,2);
contourf(XCS,YCS,THETA300_32_JD_avg_diff,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
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
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING - BSOSE JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
print('THETA300_AVG_JD_DIFF','-dpng')
close all
%% END THETA