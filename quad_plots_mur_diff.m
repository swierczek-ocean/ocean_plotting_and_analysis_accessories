clear
close all
clc
tic()

%%
load mask
load mur_diffs
%%

%%

mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
acc_colors
text = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];
%%

%% THETA

for ii=1:16
    cm = acc_colormap('cmo_thermal');
    lb = -2;
    ub = 28;
    nlvls = 100;
    z = linspace(lb,ub,nlvls);
    z = [z,29];
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    ax1 = subplot(2,2,1);
    contourf(murlon,murlat,murmonth(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    ytickformat('degrees')
    title(['MUR ',text(ii,:),' 2017 SST [deg C]'],'FontWeight','Normal','FontSize',24)
    acc_movie
    acc_quad_plots_v5
    hold off
    
    
    cm = acc_colormap('cmo_balance');
    lb = -5;
    ub = 5;
    nlvls = 100;
    z = linspace(lb,ub,nlvls);
    z = [-10,-8,-7,-6,z,6,7,8,10];
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,SST3diff(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 - MUR ',text(ii,:),' 2017 SST difference [deg C]'],'FontWeight','Normal','FontSize',24)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,SST6diff(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 - MUR ',text(ii,:),' 2017 SST difference [deg C]'],'FontWeight','Normal','FontSize',24)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,SST12diff(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb+1 ub-1]);
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 - MUR ',text(ii,:),' 2017 SST difference [deg C]'],'FontWeight','Normal','FontSize',24)
    acc_movie
    acc_quad_plots_v8
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r300',['SST_diff/SSTdiff_',num2str(ii,'%02.f'),'_',text(ii,:)],'-dpng')
    close all
    
end

%% END THETA

cm = acc_colormap('cmo_thermal');
lb = -2;
ub = 28;
nlvls = 100;
z = linspace(lb,ub,nlvls);
z = [z,29];
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(murlon,murlat,mean(murmonth(:,:,1:12),3),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('MUR 2017 SST [deg C]','FontWeight','Normal','FontSize',24)
acc_movie
acc_quad_plots_v5
hold off


cm = acc_colormap('cmo_balance');
lb = -5;
ub = 5;
nlvls = 100;
z = linspace(lb,ub,nlvls);
z = [-10,-8,-7,-6,z,6,7,8,10];

ax2 = subplot(2,2,2);
contourf(XC3,YC3,mean(SST3diff(:,:,1:12),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 - MUR 2017 SST difference [deg C]','FontWeight','Normal','FontSize',24)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,mean(SST6diff(:,:,1:12),3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - MUR 2017 SST difference [deg C]','FontWeight','Normal','FontSize',24)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,mean(SST12diff(:,:,1:12),3),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb+1 ub-1]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - MUR 2017 SST difference [deg C]','FontWeight','Normal','FontSize',24)
acc_movie
acc_quad_plots_v8
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SST_diff/SSTdiff_00_2017','-dpng')
close all


toc()