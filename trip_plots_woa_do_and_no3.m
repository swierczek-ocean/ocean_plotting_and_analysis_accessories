clear
close all
clc
tic()
acc_settings

%%
load mask
load XY3 XC3 YC3
load XY6  XC6 YC6
load XY12 XC12 YC12
load woa_do_no3_clim
load DO_monthly
load NO3_monthly
%%



%%
option = 2;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
sz = 100;
%%

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_01_JAN,...
%     DO_3_01_JAN,1e6.*DO_6_01_JAN,1e6.*DO_12_01_JAN,option);
lb = 0.21;
ub = 0.36;
nlvls = 76;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,1);
temp2 = woa_do_clim(:,2,1);
temp3 = woa_do_clim(:,3,1);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Jan surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Jan surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,1),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Jan surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_01_JAN','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_02_FEB,...
%     DO_3_02_FEB,1e6.*DO_6_02_FEB,1e6.*DO_12_02_FEB,option);
lb = 0.20;
ub = 0.35;
nlvls = 76;

z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,2);
temp2 = woa_do_clim(:,2,2);
temp3 = woa_do_clim(:,3,2);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,2),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Feb surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,2),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Feb surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,2),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Feb surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_02_FEB','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_03_MAR,...
%     DO_3_03_MAR,1e6.*DO_6_03_MAR,1e6.*DO_12_03_MAR,option);
lb = 0.21;
ub = 0.35;
nlvls = 71;

z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,3);
temp2 = woa_do_clim(:,2,3);
temp3 = woa_do_clim(:,3,3);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Mar surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Mar surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,3),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Mar surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_03_MAR','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_04_APR,...
%     DO_3_04_APR,1e6.*DO_6_04_APR,1e6.*DO_12_04_APR,option);
lb = 0.21;
ub = 0.354;
nlvls = 73;

z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,4);
temp2 = woa_do_clim(:,2,4);
temp3 = woa_do_clim(:,3,4);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,4),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Apr surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,4),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Apr surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,4),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Apr surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_04_APR','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_05_MAY,...
%     DO_3_05_MAY,1e6.*DO_6_05_MAY,1e6.*DO_12_05_MAY,option);

lb = 0.21;
ub = 0.36;
nlvls = 76;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,5);
temp2 = woa_do_clim(:,2,5);
temp3 = woa_do_clim(:,3,5);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,5),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 May surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,5),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 May surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,5),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 May surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_05_MAY','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_06_JUN,...
%     DO_3_06_JUN,1e6.*DO_6_06_JUN,1e6.*DO_12_06_JUN,option);

lb = 0.22;
ub = 0.364;
nlvls = 73;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,6);
temp2 = woa_do_clim(:,2,6);
temp3 = woa_do_clim(:,3,6);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,6),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 June surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,6),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 June surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,6),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 June surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_06_JUN','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_07_JUL,...
%     DO_3_07_JUL,1e6.*DO_6_07_JUL,1e6.*DO_12_07_JUL,option);

lb = 0.22;
ub = 0.37;
nlvls = 76;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,7);
temp2 = woa_do_clim(:,2,7);
temp3 = woa_do_clim(:,3,7);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,7),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 July surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,7),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 July surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,7),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 July surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_07_JUL','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_08_AUG,...
%     DO_3_08_AUG,1e6.*DO_6_08_AUG,1e6.*DO_12_08_AUG,option);

lb = 0.22;
ub = 0.37;
nlvls = 76;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,8);
temp2 = woa_do_clim(:,2,8);
temp3 = woa_do_clim(:,3,8);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,8),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Aug surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,8),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Aug surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,8),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Aug surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_08_AUG','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_09_SEP,...
%     DO_3_09_SEP,1e6.*DO_6_09_SEP,1e6.*DO_12_09_SEP,option);

lb = 0.22;
ub = 0.37;
nlvls = 76;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,9);
temp2 = woa_do_clim(:,2,9);
temp3 = woa_do_clim(:,3,9);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,9),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Sept surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,9),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Sept surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,9),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Sept surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_09_SEP','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_10_OCT,...
%     DO_3_10_OCT,1e6.*DO_6_10_OCT,1e6.*DO_12_10_OCT,option);

lb = 0.22;
ub = 0.38;
nlvls = 81;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,10);
temp2 = woa_do_clim(:,2,10);
temp3 = woa_do_clim(:,3,10);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,10),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Oct surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,10),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Oct surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,10),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Oct surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_10_OCT','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_11_NOV,...
%     DO_3_11_NOV,1e6.*DO_6_11_NOV,1e6.*DO_12_11_NOV,option);

lb = 0.22;
ub = 0.38;
nlvls = 81;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,11);
temp2 = woa_do_clim(:,2,11);
temp3 = woa_do_clim(:,3,11);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,11),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Nov surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,11),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Nov surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,11),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Nov surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_11_NOV','-dpng')
close all
%% END DO

%% DO
cm = acc_colormap('cmo_dense');

% [lb,ub,nlvls] = get_color_bounds_standard(DO_3_12_DEC,...
%     DO_3_12_DEC,1e6.*DO_6_12_DEC,1e6.*DO_12_12_DEC,option);

lb = 0.21;
ub = 0.38;
nlvls = 86;
z = linspace(lb,ub,nlvls);

temp1 = woa_do_clim(:,1,12);
temp2 = woa_do_clim(:,2,12);
temp3 = woa_do_clim(:,3,12);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,DO_Series32(:,:,12),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Dec surf O2 climatology over 1/3 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,DO_Series62(:,:,12),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Dec surf O2 climatology over 1/6 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,DO_Series122(:,:,12),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Dec surf O2 climatology over 1/12 [mol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','DO_12_DEC','-dpng')
close all
%% END DO

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_01_JAN,...
%     NO3_3_01_JAN,1e6.*NO3_6_01_JAN,1e6.*NO3_12_01_JAN,option);
lb = 0;
ub = 0.029;
nlvls = 88;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,1);
temp2 = woa_no3_clim(:,2,1);
temp3 = woa_no3_clim(:,3,1);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Jan 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Jan 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,1),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Jan 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_01_JAN','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_02_FEB,...
%     NO3_3_02_FEB,1e6.*NO3_6_02_FEB,1e6.*NO3_12_02_FEB,option);
lb = 0;
ub = 0.027;
nlvls = 82;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,2);
temp2 = woa_no3_clim(:,2,2);
temp3 = woa_no3_clim(:,3,2);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,2),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Feb 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,2),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Feb 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,2),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Feb 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_02_FEB','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_03_MAR,...
%     NO3_3_03_MAR,1e6.*NO3_6_03_MAR,1e6.*NO3_12_03_MAR,option);
lb = 0;
ub = 0.028;
nlvls = 85;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,3);
temp2 = woa_no3_clim(:,2,3);
temp3 = woa_no3_clim(:,3,3);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Mar 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Mar 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,3),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Mar 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_03_MAR','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_04_APR,...
%     NO3_3_04_APR,1e6.*NO3_6_04_APR,1e6.*NO3_12_04_APR,option);
lb = 0;
ub = 0.029;
nlvls = 88;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,4);
temp2 = woa_no3_clim(:,2,4);
temp3 = woa_no3_clim(:,3,4);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,4),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Apr 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,4),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Apr 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,4),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Apr 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_04_APR','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_05_MAY,...
%     NO3_3_05_MAY,1e6.*NO3_6_05_MAY,1e6.*NO3_12_05_MAY,option);

lb = 0;
ub = 0.030;
nlvls = 91;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,5);
temp2 = woa_no3_clim(:,2,5);
temp3 = woa_no3_clim(:,3,5);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,5),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 May 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,5),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 May 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,5),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 May 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_05_MAY','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_06_JUN,...
%     NO3_3_06_JUN,1e6.*NO3_6_06_JUN,1e6.*NO3_12_06_JUN,option);

lb = 0;
ub = 0.032;
nlvls = 97;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,6);
temp2 = woa_no3_clim(:,2,6);
temp3 = woa_no3_clim(:,3,6);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,6),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 June 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,6),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 June 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,6),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 June 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_06_JUN','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_07_JUL,...
%     NO3_3_07_JUL,1e6.*NO3_6_07_JUL,1e6.*NO3_12_07_JUL,option);

lb = 0;
ub = 0.032;
nlvls = 97;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,7);
temp2 = woa_no3_clim(:,2,7);
temp3 = woa_no3_clim(:,3,7);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,7),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 July 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,7),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 July 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,7),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 July 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_07_JUL','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_08_AUG,...
%     NO3_3_08_AUG,1e6.*NO3_6_08_AUG,1e6.*NO3_12_08_AUG,option);

lb = 0;
ub = 0.032;
nlvls = 97;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,8);
temp2 = woa_no3_clim(:,2,8);
temp3 = woa_no3_clim(:,3,8);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,8),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Aug 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,8),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Aug 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,8),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Aug 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_08_AUG','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_09_SEP,...
%     NO3_3_09_SEP,1e6.*NO3_6_09_SEP,1e6.*NO3_12_09_SEP,option);

lb = 0;
ub = 0.032;
nlvls = 97;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,9);
temp2 = woa_no3_clim(:,2,9);
temp3 = woa_no3_clim(:,3,9);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,9),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Sept 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,9),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Sept 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,9),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Sept 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_09_SEP','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_10_OCT,...
%     NO3_3_10_OCT,1e6.*NO3_6_10_OCT,1e6.*NO3_12_10_OCT,option);

lb = 0;
ub = 0.032;
nlvls = 97;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,10);
temp2 = woa_no3_clim(:,2,10);
temp3 = woa_no3_clim(:,3,10);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,10),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Oct 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,10),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Oct 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,10),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Oct 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_10_OCT','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_11_NOV,...
%     NO3_3_11_NOV,1e6.*NO3_6_11_NOV,1e6.*NO3_12_11_NOV,option);

lb = 0;
ub = 0.032;
nlvls = 97;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,11);
temp2 = woa_no3_clim(:,2,11);
temp3 = woa_no3_clim(:,3,11);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,11),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Nov 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,11),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Nov 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,11),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Nov 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_11_NOV','-dpng')
close all
%% END NO3

%% NO3
cm = acc_colormap('cmo_speed');

% [lb,ub,nlvls] = get_color_bounds_standard(NO3_3_12_DEC,...
%     NO3_3_12_DEC,1e6.*NO3_6_12_DEC,1e6.*NO3_12_12_DEC,option);

lb = 0;
ub = 0.03;
nlvls = 91;
z = linspace(lb,ub,nlvls);

temp1 = woa_no3_clim(:,1,12);
temp2 = woa_no3_clim(:,2,12);
temp3 = woa_no3_clim(:,3,12);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,NO3_Series32(:,:,12),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Dec 20m NO3 climatology over 1/3 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,NO3_Series62(:,:,12),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Dec 20m NO3 climatology over 1/6 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,NO3_Series122(:,:,12),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('WOA18 Dec 20m NO3 climatology over 1/12 [mol N/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','NO3_12_DEC','-dpng')
close all
%% END NO3


toc()