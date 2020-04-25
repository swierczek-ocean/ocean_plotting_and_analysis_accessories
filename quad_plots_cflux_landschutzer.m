tic()
acc_settings

%%
load mask
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load ../2019_06_June_analysis/AB32_output CFLUX*_JD_avg
load ../2019_06_June_analysis/AB62_output CFLUX*_JD_avg
load ../2019_06_June_analysis/AB122_output CFLUX*_JD_avg
load co2flux_2017m
%%

%%
option = 3;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC,YC] = ndgrid(XC,YC);
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
syr = 60*60*24*365.25;
CFLUX_32_JD_avg = syr.*CFLUX_32_JD_avg;
CFLUX_62_JD_avg = syr.*CFLUX_62_JD_avg;
CFLUX_122_JD_avg = syr.*CFLUX_122_JD_avg;
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%


%% CFLUX
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(CFLUX_32_JD_avg,...
    CFLUX_32_JD_avg,CFLUX_62_JD_avg,CFLUX_122_JD_avg,option);

z = linspace(lb,ub,nlvls); z = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XC,YC,-co2flux_2017,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('Landschutzer 2017 mean CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v1
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,CFLUX_32_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 2017 mean CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,CFLUX_62_JD_avg,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 2017 mean CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,CFLUX_122_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 2017 mean CO2 flux [mol C/m^2/yr]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','-r300','CFLUX_AVG_2017_landschutzer','-dpng')
close all
%% END CFLUX


toc()