tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12 
load AB34_output AGE*
load AB64_output AGE*
load AB124_output AGE*
load AB32_output AGE*
load AB62_output AGE*
load AB122_output AGE*
%%

%%
option = 8;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_34_JJA_avg,...
    AGE_34_JJA_avg,AGE_64_JJA_avg,AGE_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_05JJA','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_34_JAS_avg,...
    AGE_34_JAS_avg,AGE_64_JAS_avg,AGE_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_06JAS','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_34_JJASON_avg,...
    AGE_34_JJASON_avg,AGE_64_JJASON_avg,AGE_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_07JJASON','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_34_JASOND_avg,...
    AGE_34_JASOND_avg,AGE_64_JASOND_avg,AGE_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_08JASOND','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_32_DN_avg,...
    AGE_32_DN_avg,AGE_62_DN_avg,AGE_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_09DN','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_32_JD_avg,...
    AGE_32_JD_avg,AGE_62_JD_avg,AGE_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_10JD','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_32_DJF_avg,...
    AGE_32_DJF_avg,AGE_62_DJF_avg,AGE_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_01DJF','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_32_JFM_avg,...
    AGE_32_JFM_avg,AGE_62_JFM_avg,AGE_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_02JFM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_32_JFMAMJ_avg,...
    AGE_32_JFMAMJ_avg,AGE_62_JFMAMJ_avg,AGE_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_04JFMAMJ','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE_32_DJFMAM_avg,...
    AGE_32_DJFMAM_avg,AGE_62_DJFMAM_avg,AGE_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean surf age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE_AVG_03DJFMAM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_34_JJA_avg,...
    AGE200_34_JJA_avg,AGE200_64_JJA_avg,AGE200_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_05JJA','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_34_JAS_avg,...
    AGE200_34_JAS_avg,AGE200_64_JAS_avg,AGE200_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_06JAS','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_34_JJASON_avg,...
    AGE200_34_JJASON_avg,AGE200_64_JJASON_avg,AGE200_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_07JJASON','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_34_JASOND_avg,...
    AGE200_34_JASOND_avg,AGE200_64_JASOND_avg,AGE200_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_08JASOND','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_32_DN_avg,...
    AGE200_32_DN_avg,AGE200_62_DN_avg,AGE200_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_09DN','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_32_JD_avg,...
    AGE200_32_JD_avg,AGE200_62_JD_avg,AGE200_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_10JD','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_32_DJF_avg,...
    AGE200_32_DJF_avg,AGE200_62_DJF_avg,AGE200_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_01DJF','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_32_JFM_avg,...
    AGE200_32_JFM_avg,AGE200_62_JFM_avg,AGE200_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_02JFM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_32_JFMAMJ_avg,...
    AGE200_32_JFMAMJ_avg,AGE200_62_JFMAMJ_avg,AGE200_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_04JFMAMJ','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE200_32_DJFMAM_avg,...
    AGE200_32_DJFMAM_avg,AGE200_62_DJFMAM_avg,AGE200_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE200_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE200_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE200_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,20),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 200m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE200_AVG_03DJFMAM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_34_JJA_avg,...
    AGE500_34_JJA_avg,AGE500_64_JJA_avg,AGE500_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_05JJA','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_34_JAS_avg,...
    AGE500_34_JAS_avg,AGE500_64_JAS_avg,AGE500_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_06JAS','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_34_JJASON_avg,...
    AGE500_34_JJASON_avg,AGE500_64_JJASON_avg,AGE500_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_07JJASON','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_34_JASOND_avg,...
    AGE500_34_JASOND_avg,AGE500_64_JASOND_avg,AGE500_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_08JASOND','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_32_DN_avg,...
    AGE500_32_DN_avg,AGE500_62_DN_avg,AGE500_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_09DN','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_32_JD_avg,...
    AGE500_32_JD_avg,AGE500_62_JD_avg,AGE500_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_10JD','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_32_DJF_avg,...
    AGE500_32_DJF_avg,AGE500_62_DJF_avg,AGE500_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_01DJF','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_32_JFM_avg,...
    AGE500_32_JFM_avg,AGE500_62_JFM_avg,AGE500_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_02JFM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_32_JFMAMJ_avg,...
    AGE500_32_JFMAMJ_avg,AGE500_62_JFMAMJ_avg,AGE500_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_04JFMAMJ','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE500_32_DJFMAM_avg,...
    AGE500_32_DJFMAM_avg,AGE500_62_DJFMAM_avg,AGE500_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE500_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE500_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE500_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,30),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 500m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE500_AVG_03DJFMAM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_34_JJA_avg,...
    AGE1000_34_JJA_avg,AGE1000_64_JJA_avg,AGE1000_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_05JJA','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_34_JAS_avg,...
    AGE1000_34_JAS_avg,AGE1000_64_JAS_avg,AGE1000_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_06JAS','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_34_JJASON_avg,...
    AGE1000_34_JJASON_avg,AGE1000_64_JJASON_avg,AGE1000_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_07JJASON','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_34_JASOND_avg,...
    AGE1000_34_JASOND_avg,AGE1000_64_JASOND_avg,AGE1000_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_08JASOND','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_32_DN_avg,...
    AGE1000_32_DN_avg,AGE1000_62_DN_avg,AGE1000_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_09DN','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_32_JD_avg,...
    AGE1000_32_JD_avg,AGE1000_62_JD_avg,AGE1000_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_10JD','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_32_DJF_avg,...
    AGE1000_32_DJF_avg,AGE1000_62_DJF_avg,AGE1000_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_01DJF','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_32_JFM_avg,...
    AGE1000_32_JFM_avg,AGE1000_62_JFM_avg,AGE1000_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_02JFM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_32_JFMAMJ_avg,...
    AGE1000_32_JFMAMJ_avg,AGE1000_62_JFMAMJ_avg,AGE1000_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_04JFMAMJ','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE1000_32_DJFMAM_avg,...
    AGE1000_32_DJFMAM_avg,AGE1000_62_DJFMAM_avg,AGE1000_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE1000_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE1000_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE1000_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,36),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 1000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE1000_AVG_03DJFMAM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_34_JJA_avg,...
    AGE2000_34_JJA_avg,AGE2000_64_JJA_avg,AGE2000_124_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_34_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJA 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_64_JJA_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJA 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_124_JJA_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJA 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_05JJA','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_34_JAS_avg,...
    AGE2000_34_JAS_avg,AGE2000_64_JAS_avg,AGE2000_124_JAS_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_34_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JAS 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_64_JAS_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JAS 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_124_JAS_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JAS 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_06JAS','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_34_JJASON_avg,...
    AGE2000_34_JJASON_avg,AGE2000_64_JJASON_avg,AGE2000_124_JJASON_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_34_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JJASON 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_64_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JJASON 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_124_JJASON_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JJASON 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_07JJASON','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_34_JASOND_avg,...
    AGE2000_34_JASOND_avg,AGE2000_64_JASOND_avg,AGE2000_124_JASOND_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_34_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JASOND 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_64_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JASOND 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_124_JASOND_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JASOND 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_08JASOND','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_32_DN_avg,...
    AGE2000_32_DN_avg,AGE2000_62_DN_avg,AGE2000_122_DN_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_32_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DN 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_62_DN_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DN 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_122_DN_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DN 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_09DN','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_32_JD_avg,...
    AGE2000_32_JD_avg,AGE2000_62_JD_avg,AGE2000_122_JD_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JD 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JD 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JD 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_10JD','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_32_DJF_avg,...
    AGE2000_32_DJF_avg,AGE2000_62_DJF_avg,AGE2000_122_DJF_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_32_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJF 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_62_DJF_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJF 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_122_DJF_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJF 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_01DJF','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_32_JFM_avg,...
    AGE2000_32_JFM_avg,AGE2000_62_JFM_avg,AGE2000_122_JFM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_32_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFM 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_62_JFM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFM 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_122_JFM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFM 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_02JFM','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_32_JFMAMJ_avg,...
    AGE2000_32_JFMAMJ_avg,AGE2000_62_JFMAMJ_avg,AGE2000_122_JFMAMJ_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_32_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING JFMAMJ 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_62_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING JFMAMJ 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_122_JFMAMJ_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING JFMAMJ 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_04JFMAMJ','-dpng')
close all
%% END AGE

%% AGE
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(AGE2000_32_DJFMAM_avg,...
    AGE2000_32_DJFMAM_avg,AGE2000_62_DJFMAM_avg,AGE2000_122_DJFMAM_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,AGE2000_32_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING DJFMAM 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,AGE2000_62_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING DJFMAM 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,AGE2000_122_DJFMAM_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,42),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING DJFMAM 2017 mean 2000m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','AGE2000_AVG_03DJFMAM','-dpng')
close all
%% END AGE


toc()