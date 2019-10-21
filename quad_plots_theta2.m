tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12 
load BSOSE_surf_avgs XCS YCS 
load AB34_output
load AB64_output
load AB124_output
load AB32_output
load AB62_output
load AB122_output
%%

%%
option = 1;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
% [XC3,YC3] = ndgrid(XC3,YC3);
% [XC6,YC6] = ndgrid(XC6,YC6);
% [XC12,YC12] = ndgrid(XC12,YC12);

% [XC3,YC3] = meshgrid(XC3,YC3);
% [XC6,YC6] = meshgrid(XC6,YC6);
% [XC12,YC12] = meshgrid(XC12,YC12);

X3 = [XC3(1) YC3(end)];
Y3 = [XC3(end) YC3(1)];
X6 = [XC6(1) YC6(end)];
Y6 = [XC6(end) YC6(1)];
X12 = [XC12(1) YC12(end)];
Y12 = [XC12(end) YC12(1)];
Xb = [XCS(1,1) YCS(end,end)];
Yb = [XCS(end,end) YCS(1,1)];


clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JJA_avg,...
    THETA_34_JJA_avg,THETA_64_JJA_avg,THETA_124_JJA_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

THETA_BSOSE_JJA_avg(THETA_BSOSE_JJA_avg==99999999999) = NaN;
THETA_34_JJA_avg(THETA_34_JJA_avg==99999999999) = NaN;
THETA_64_JJA_avg(THETA_64_JJA_avg==99999999999) = NaN;
THETA_124_JJA_avg(THETA_124_JJA_avg==99999999999) = NaN;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(Xb,Yb,THETA_BSOSE_JJA_avg');
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
set(gca,'YDir','normal')
hold off

ax2 = subplot(2,2,2);
imagesc(X3,Y3,THETA_34_JJA_avg');
hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
set(gca,'YDir','normal')
hold off

ax3 = subplot(2,2,3);
imagesc(X6,Y6,THETA_64_JJA_avg');
hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
set(gca,'YDir','normal')
hold off

ax4 = subplot(2,2,4);
imagesc(X12,Y12,THETA_124_JJA_avg');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
% contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
set(gca,'YDir','normal')
hold off
print('THETA_AVG_05JJA','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JAS_avg,...
    THETA_34_JAS_avg,THETA_64_JAS_avg,THETA_124_JAS_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_06JAS','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JJASON_avg,...
    THETA_34_JJASON_avg,THETA_64_JJASON_avg,THETA_124_JJASON_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_07JJASON','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JASOND_avg,...
    THETA_34_JASOND_avg,THETA_64_JASOND_avg,THETA_124_JASOND_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_08JASOND','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_DN_avg,...
    THETA_32_DN_avg,THETA_62_DN_avg,THETA_122_DN_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_09DN','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JD_avg,...
    THETA_32_JD_avg,THETA_62_JD_avg,THETA_122_JD_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_10JD','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_DJF_avg,...
    THETA_32_DJF_avg,THETA_62_DJF_avg,THETA_122_DJF_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_01DJF','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JFM_avg,...
    THETA_32_JFM_avg,THETA_62_JFM_avg,THETA_122_JFM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_02JFM','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_JFMAMJ_avg,...
    THETA_32_JFMAMJ_avg,THETA_62_JFMAMJ_avg,THETA_122_JFMAMJ_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_04JFMAMJ','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA_BSOSE_DJFMAM_avg,...
    THETA_32_DJFMAM_avg,THETA_62_DJFMAM_avg,THETA_122_DJFMAM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean SST','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA_AVG_03DJFMAM','-dpng')
close all
%% END THETA


%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JJA_avg,...
    THETA105_34_JJA_avg,THETA105_64_JJA_avg,THETA105_124_JJA_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_05JJA','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JAS_avg,...
    THETA105_34_JAS_avg,THETA105_64_JAS_avg,THETA105_124_JAS_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_06JAS','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JJASON_avg,...
    THETA105_34_JJASON_avg,THETA105_64_JJASON_avg,THETA105_124_JJASON_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_07JJASON','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JASOND_avg,...
    THETA105_34_JASOND_avg,THETA105_64_JASOND_avg,THETA105_124_JASOND_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_08JASOND','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_DN_avg,...
    THETA105_32_DN_avg,THETA105_62_DN_avg,THETA105_122_DN_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_09DN','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JD_avg,...
    THETA105_32_JD_avg,THETA105_62_JD_avg,THETA105_122_JD_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_10JD','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_DJF_avg,...
    THETA105_32_DJF_avg,THETA105_62_DJF_avg,THETA105_122_DJF_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_01DJF','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JFM_avg,...
    THETA105_32_JFM_avg,THETA105_62_JFM_avg,THETA105_122_JFM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_02JFM','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_JFMAMJ_avg,...
    THETA105_32_JFMAMJ_avg,THETA105_62_JFMAMJ_avg,THETA105_122_JFMAMJ_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_04JFMAMJ','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA105_BSOSE_DJFMAM_avg,...
    THETA105_32_DJFMAM_avg,THETA105_62_DJFMAM_avg,THETA105_122_DJFMAM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA105_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA105_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA105_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA105_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,13),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 105m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA105_AVG_03DJFMAM','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JJA_avg,...
    THETA200_34_JJA_avg,THETA200_64_JJA_avg,THETA200_124_JJA_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_05JJA','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JAS_avg,...
    THETA200_34_JAS_avg,THETA200_64_JAS_avg,THETA200_124_JAS_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_06JAS','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JJASON_avg,...
    THETA200_34_JJASON_avg,THETA200_64_JJASON_avg,THETA200_124_JJASON_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_07JJASON','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JASOND_avg,...
    THETA200_34_JASOND_avg,THETA200_64_JASOND_avg,THETA200_124_JASOND_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_08JASOND','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_DN_avg,...
    THETA200_32_DN_avg,THETA200_62_DN_avg,THETA200_122_DN_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_09DN','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JD_avg,...
    THETA200_32_JD_avg,THETA200_62_JD_avg,THETA200_122_JD_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_10JD','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_DJF_avg,...
    THETA200_32_DJF_avg,THETA200_62_DJF_avg,THETA200_122_DJF_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_01DJF','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JFM_avg,...
    THETA200_32_JFM_avg,THETA200_62_JFM_avg,THETA200_122_JFM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_02JFM','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_JFMAMJ_avg,...
    THETA200_32_JFMAMJ_avg,THETA200_62_JFMAMJ_avg,THETA200_122_JFMAMJ_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_04JFMAMJ','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA200_BSOSE_DJFMAM_avg,...
    THETA200_32_DJFMAM_avg,THETA200_62_DJFMAM_avg,THETA200_122_DJFMAM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA200_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA200_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA200_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA200_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 200m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA200_AVG_03DJFMAM','-dpng')
close all
%% END THETA




%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JJA_avg,...
    THETA300_34_JJA_avg,THETA300_64_JJA_avg,THETA300_124_JJA_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_05JJA','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JAS_avg,...
    THETA300_34_JAS_avg,THETA300_64_JAS_avg,THETA300_124_JAS_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_06JAS','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JJASON_avg,...
    THETA300_34_JJASON_avg,THETA300_64_JJASON_avg,THETA300_124_JJASON_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_07JJASON','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JASOND_avg,...
    THETA300_34_JASOND_avg,THETA300_64_JASOND_avg,THETA300_124_JASOND_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_08JASOND','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_DN_avg,...
    THETA300_32_DN_avg,THETA300_62_DN_avg,THETA300_122_DN_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_09DN','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JD_avg,...
    THETA300_32_JD_avg,THETA300_62_JD_avg,THETA300_122_JD_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_10JD','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_DJF_avg,...
    THETA300_32_DJF_avg,THETA300_62_DJF_avg,THETA300_122_DJF_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_01DJF','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JFM_avg,...
    THETA300_32_JFM_avg,THETA300_62_JFM_avg,THETA300_122_JFM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_02JFM','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_JFMAMJ_avg,...
    THETA300_32_JFMAMJ_avg,THETA300_62_JFMAMJ_avg,THETA300_122_JFMAMJ_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_04JFMAMJ','-dpng')
close all
%% END THETA

%% THETA
cm = acc_colormap('thermal');
cm = [cm;Color(:,46)'];
[lb,ub,nlvls] = get_color_bounds_standard(THETA300_BSOSE_DJFMAM_avg,...
    THETA300_32_DJFMAM_avg,THETA300_62_DJFMAM_avg,THETA300_122_DJFMAM_avg,option);
lb = lb - 1;
z = linspace(lb,ub,nlvls+1);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
imagesc(XCS,YCS,THETA300_BSOSE_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/6 B-SOSE DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
imagesc(XC3,YC3,THETA300_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
imagesc(XC6,YC6,THETA300_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
imagesc(XC12,YC12,THETA300_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,25),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 300m T','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
print('THETA300_AVG_03DJFMAM','-dpng')
close all
%% END THETA



toc()