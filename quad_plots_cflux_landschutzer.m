clear
close all
clc
tic()
acc_settings

%%
load mask
load monthly3 cflux3 XC3 YC3
load monthly6 cflux6 XC6 YC6
load monthly12 cflux12 XC12 YC12
load co2fluxm
%%

%%
option = 3;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XCL,YCL] = ndgrid(XCL,YCL);
syr = 60*60*24*365.25;
cflux3 = syr.*cflux3;
cflux6 = syr.*cflux6;
cflux12 = syr.*cflux12;
dates = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];
%%


%% CFLUX
cm = acc_colormap('cmo_balance');

lb = -7;
ub = 7;
lbcb = lb;
ubcb = ub;
nlvls = 100;
z = linspace(lb,ub,nlvls); 
z = [-10,-9,-8,-7,z,7,8,9,10];



for ii=1:12
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    ax1 = subplot(2,2,1);
    contourf(XCL,YCL,-co2flux_2017(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    ytickformat('degrees')
    title(['Landschutzer ',datestr(dates(ii),'mmm'),' CO2 flux [mol C/m^2/yr]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v1
    hold off
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,cflux3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 ',datestr(dates(ii),'mmm'),' CO2 flux [mol C/m^2/yr]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,cflux6(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 ',datestr(dates(ii),'mmm'),' CO2 flux [mol C/m^2/yr]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,cflux12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lbcb ubcb]);
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 ',datestr(dates(ii),'mmm'),' CO2 flux [mol C/m^2/yr]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['CFLUX/CFLUX_',num2str(ii,'%02.f'),'_',datestr(dates(ii),'mmm'),'_landschutzer'],'-dpng')
    close all
end


%% JFM

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCL,YCL,-mean(co2flux_2017(:,:,1:3),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('Landschutzer JFM CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,mean(cflux3(:,:,1:3),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 JFM CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,mean(cflux6(:,:,1:3),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 JFM CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,mean(cflux12(:,:,1:3),3),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 JFM CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','CFLUX/CFLUX_13_JFM_landschutzer','-dpng')
close all

%% AMJ

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCL,YCL,-mean(co2flux_2017(:,:,4:6),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('Landschutzer AMJ CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,mean(cflux3(:,:,4:6),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 AMJ CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,mean(cflux6(:,:,4:6),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 AMJ CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,mean(cflux12(:,:,4:6),3),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 AMJ CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','CFLUX/CFLUX_14_AMJ_landschutzer','-dpng')
close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCL,YCL,-mean(co2flux_2017(:,:,7:9),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('Landschutzer JAS CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,mean(cflux3(:,:,7:9),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 JAS CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,mean(cflux6(:,:,7:9),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 JAS CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,mean(cflux12(:,:,7:9),3),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 JAS CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','CFLUX/CFLUX_15_JAS_landschutzer','-dpng')
close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCL,YCL,-mean(co2flux_2017(:,:,10:12),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('Landschutzer OND CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,mean(cflux3(:,:,10:12),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 OND CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,mean(cflux6(:,:,10:12),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 OND CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,mean(cflux12(:,:,10:12),3),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 OND CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off');
print('-r200','CFLUX/CFLUX_16_OND_landschutzer','-dpng')
close all

toc()