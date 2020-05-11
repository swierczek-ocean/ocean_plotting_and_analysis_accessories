clear
close all
clc
tic()

%%
acc_colors
load XY3 XC3 YC3
[XC3,YC3] = ndgrid(XC3,YC3);
load XY6 XC6 YC6
[XC6,YC6] = ndgrid(XC6,YC6);
load XY12 XC12 YC12
[XC12,YC12] = ndgrid(XC12,YC12);
load mask
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
text = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND';'J-D'];
load ../2020_04_April_analysis/fluxes
tfluxecco(tfluxecco==0) = NaN;
%%

cm = acc_colormap('cmo_balance');
lb = -340;
ub = 340;
nlvls = 100;
z = linspace(lb,ub,nlvls);
z = [-430,-380,-365,-350,z,350,365,380,430];

for ii=1:16
    figure()
    set(gcf, 'Position', [1, 1, 1610, 900])
    colormap(cm)
    ax1 = subplot(2,3,1);
    contourf(long,lat,tfluxera(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    acc_movie_g
    title(['ERA5 ',text(ii,:),' heat flux [W/m^2]'],'FontWeight','Normal','FontSize',22)
    acc_6plots(1,ax1,cm)
    hold off
    
    ax2 = subplot(2,3,2);
    contourf(elon,elat,tfluxecco(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    acc_movie_g
    title(['ECCO4v4 ',text(ii,:),' heat flux [W/m^2]'],'FontWeight','Normal','FontSize',22)
    acc_6plots(2,ax2,cm)
    hold off
    
    ax3 = subplot(2,3,3);
    contourf(XCS,YCS,tfluxsoda(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    acc_movie_g
    title(['SODA3.4.2 ',text(ii,:),' heat flux [W/m^2]'],'FontWeight','Normal','FontSize',22)
    acc_6plots(3,ax3,cm)
    hold off
    
    ax4 = subplot(2,3,4);
    contourf(XC3,YC3,tflux3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    acc_movie_g
    title(['1/3 ',text(ii,:),' heat flux [W/m^2]'],'FontWeight','Normal','FontSize',22)
    acc_6plots(4,ax4,cm)
    hold off
    
    ax5 = subplot(2,3,5);
    contourf(XC6,YC6,tflux6(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    acc_movie_g
    title(['1/6 ',text(ii,:),' heat flux [W/m^2]'],'FontWeight','Normal','FontSize',22)
    acc_6plots(5,ax5,cm)
    hold off
    
    ax6 = subplot(2,3,6);
    contourf(XC12,YC12,tflux12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    acc_movie_g
    title(['1/12 ',text(ii,:),' heat flux [W/m^2]'],'FontWeight','Normal','FontSize',22)
    acc_6plots(6,ax6,cm)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r300',['TFLUX/TFLUX_',num2str(ii,'%02.f'),'_',text(ii,:)],'-dpng')
    close all
end


cm = acc_colormap('cmo_balance');
lb = -280;
ub = 280;
nlvls = 100;
z = linspace(lb,ub,nlvls);
z = [-410,-370,-340,-310,z,310,340,370,410];

figure()
set(gcf, 'Position', [1, 1, 1610, 900])
colormap(cm)
ax1 = subplot(2,3,1);
contourf(long,lat,tfluxera(:,:,17),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
acc_movie_g
title('ERA5 2017 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots(1,ax1,cm)
hold off

ax2 = subplot(2,3,2);
contourf(elon,elat,tfluxecco(:,:,17),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
acc_movie_g
title('ECCO4v4 2017 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots(2,ax2,cm)
hold off

ax3 = subplot(2,3,3);
contourf(XCS,YCS,tfluxsoda(:,:,17),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
acc_movie_g
title('SODA3.4.2 2017 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots(3,ax3,cm)
hold off

ax4 = subplot(2,3,4);
contourf(XC3,YC3,tflux3(:,:,17),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
acc_movie_g
title('1/3 2017 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots(4,ax4,cm)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,tflux6(:,:,17),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
acc_movie_g
title('1/6 2017 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots(5,ax5,cm)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,tflux12(:,:,17),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
acc_movie_g
title('1/12 2017 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots(6,ax6,cm)
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','TFLUX/TFLUX_17_2017','-dpng')
close all





toc()