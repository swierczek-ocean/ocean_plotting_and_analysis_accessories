tic()
acc_settings

%%
load mask
load XY3 XC3 YC3
load XY6  XC6 YC6
load XY12 XC12 YC12
load pco2_socat_clim
load PCO2_monthly
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

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_01_JAN,...
%     PCO2_3_01_JAN,1e6.*PCO2_6_01_JAN,1e6.*PCO2_12_01_JAN,option);
lb = 270;
ub = 480;
nlvls = 106;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,1);
temp2 = pco2_socat_clim(:,2,1);
temp3 = pco2_socat_clim(:,3,1);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_01_JAN,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Jan pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_01_JAN,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Jan pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_01_JAN,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Jan pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_01_JAN','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_02_FEB,...
%     PCO2_3_02_FEB,1e6.*PCO2_6_02_FEB,1e6.*PCO2_12_02_FEB,option);
lb = 270;
ub = 480;
nlvls = 106;

z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,2);
temp2 = pco2_socat_clim(:,2,2);
temp3 = pco2_socat_clim(:,3,2);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_02_FEB,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Feb pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_02_FEB,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Feb pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_02_FEB,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Feb pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_02_FEB','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_03_MAR,...
%     PCO2_3_03_MAR,1e6.*PCO2_6_03_MAR,1e6.*PCO2_12_03_MAR,option);
lb = 290;
ub = 470;
nlvls = 91;

z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,3);
temp2 = pco2_socat_clim(:,2,3);
temp3 = pco2_socat_clim(:,3,3);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_03_MAR,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Mar pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_03_MAR,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Mar pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_03_MAR,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Mar pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_03_MAR','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_04_APR,...
%     PCO2_3_04_APR,1e6.*PCO2_6_04_APR,1e6.*PCO2_12_04_APR,option);
lb = 300;
ub = 450;
nlvls = 76;

z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,4);
temp2 = pco2_socat_clim(:,2,4);
temp3 = pco2_socat_clim(:,3,4);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_04_APR,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Apr pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_04_APR,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Apr pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_04_APR,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Apr pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_04_APR','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_05_MAY,...
%     PCO2_3_05_MAY,1e6.*PCO2_6_05_MAY,1e6.*PCO2_12_05_MAY,option);

lb = 340;
ub = 430;
nlvls = 46;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,5);
temp2 = pco2_socat_clim(:,2,5);
temp3 = pco2_socat_clim(:,3,5);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_05_MAY,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT May pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_05_MAY,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT May pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_05_MAY,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT May pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_05_MAY','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_06_JUN,...
%     PCO2_3_06_JUN,1e6.*PCO2_6_06_JUN,1e6.*PCO2_12_06_JUN,option);

lb = 340;
ub = 420;
nlvls = 41;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,6);
temp2 = pco2_socat_clim(:,2,6);
temp3 = pco2_socat_clim(:,3,6);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_06_JUN,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT June pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_06_JUN,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT June pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_06_JUN,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT June pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_06_JUN','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_07_JUL,...
%     PCO2_3_07_JUL,1e6.*PCO2_6_07_JUL,1e6.*PCO2_12_07_JUL,option);

lb = 340;
ub = 430;
nlvls = 46;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,7);
temp2 = pco2_socat_clim(:,2,7);
temp3 = pco2_socat_clim(:,3,7);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_07_JUL,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT July pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_07_JUL,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT July pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_07_JUL,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT July pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_07_JUL','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_08_AUG,...
%     PCO2_3_08_AUG,1e6.*PCO2_6_08_AUG,1e6.*PCO2_12_08_AUG,option);

lb = 340;
ub = 430;
nlvls = 46;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,8);
temp2 = pco2_socat_clim(:,2,8);
temp3 = pco2_socat_clim(:,3,8);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_08_AUG,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Aug pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_08_AUG,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Aug pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_08_AUG,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Aug pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_08_AUG','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_09_SEP,...
%     PCO2_3_09_SEP,1e6.*PCO2_6_09_SEP,1e6.*PCO2_12_09_SEP,option);

lb = 334;
ub = 430;
nlvls = 49;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,9);
temp2 = pco2_socat_clim(:,2,9);
temp3 = pco2_socat_clim(:,3,9);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_09_SEP,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Sept pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_09_SEP,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Sept pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_09_SEP,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Sept pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_09_SEP','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_10_OCT,...
%     PCO2_3_10_OCT,1e6.*PCO2_6_10_OCT,1e6.*PCO2_12_10_OCT,option);

lb = 300;
ub = 420;
nlvls = 61;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,10);
temp2 = pco2_socat_clim(:,2,10);
temp3 = pco2_socat_clim(:,3,10);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_10_OCT,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Oct pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_10_OCT,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Oct pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_10_OCT,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Oct pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_10_OCT','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_11_NOV,...
%     PCO2_3_11_NOV,1e6.*PCO2_6_11_NOV,1e6.*PCO2_12_11_NOV,option);

lb = 270;
ub = 410;
nlvls = 71;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,11);
temp2 = pco2_socat_clim(:,2,11);
temp3 = pco2_socat_clim(:,3,11);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_11_NOV,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Nov pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_11_NOV,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Nov pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_11_NOV,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Nov pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_11_NOV','-dpng')
close all
%% END PCO2

%% PCO2
cm = flipud(acc_colormap('cmo_deep'));

% [lb,ub,nlvls] = get_color_bounds_standard(PCO2_3_12_DEC,...
%     PCO2_3_12_DEC,1e6.*PCO2_6_12_DEC,1e6.*PCO2_12_12_DEC,option);

lb = 260;
ub = 440;
nlvls = 91;
z = linspace(lb,ub,nlvls);

temp1 = pco2_socat_clim(:,1,12);
temp2 = pco2_socat_clim(:,2,12);
temp3 = pco2_socat_clim(:,3,12);
temp1 = temp1(isnan(temp1)==0);
temp2 = temp2(isnan(temp2)==0);
temp3 = temp3(isnan(temp3)==0);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,1e6.*PCO2_3_12_DEC,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Dec pCO2 climatology over 1/3 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,1e6.*PCO2_6_12_DEC,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Dec pCO2 climatology over 1/6 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,1e6.*PCO2_12_12_DEC,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter(temp1,temp2,sz,temp3,'filled','MarkerEdgeColor',[1 1 1],'LineWidth',0.2)
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('SOCAT Dec pCO2 climatology over 1/12 [\muatm]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','PCO2_12_DEC','-dpng')
close all
%% END PCO2




toc()