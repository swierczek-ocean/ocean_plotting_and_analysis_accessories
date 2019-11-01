tic()

%%
load mask
load AVISO_diff_avgs
load ETAN_DIFF_std
%%

%%
option = 2;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
acc_colors
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
%%

%% ETAN
option = 2;
cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(D_AVISO_JJA_avg,...
    D_AVISO_JJA_avg,D_AVISO_JJA_avg,D_AVISO_JJA_avg,option);

z = linspace(lb,ub,nlvls);


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XCA,YCA,D_AVISO_JD_avg,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/4 AVISO 2017 mean SSH anomaly','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v5
hold off

option = 13;
cm = acc_colormap('cmo_amp');

[lb,ub,nlvls] = get_color_bounds_standard(ETAN_34_JJA_avg_diff,...
    ETAN_34_JJA_avg_diff,ETAN_64_JJA_avg_diff,ETAN_124_JJA_avg_diff,option);
lb = 0;
z = linspace(lb,ub,nlvls);

ax2 = subplot(2,2,2);
contourf(XCA,YCA,ETAN32DIFFstd,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 MITgcm+BLING st dev of difference from AVISO','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XCA,YCA,ETAN62DIFFstd,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 MITgcm+BLING st dev of difference from AVISO','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XCA,YCA,ETAN122DIFFstd,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 MITgcm+BLING st dev of difference from AVISO','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off'); print('-r300','ETAN_AVG_AVISO_STD_DIFF','-dpng')
close all
%% END ETAN



toc()