clear
close all
clc
tic()

%%
load flux_diffs
load mask
acc_colors
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
text = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND';'J-D'];
%%

cm1 = acc_colormap('cmo_balance');
lb1 = -280;
ub1 = 280;
nlvls = 100;
z1 = linspace(lb1,ub1,nlvls);
z1 = [-410,-370,-340,-310,z1,310,340,370,410];

cm2 = acc_colormap('cmo_balance');
lb2 = -100;
ub2 = 100;
nlvls = 100;
z2 = linspace(lb2,ub2,nlvls);
z2 = [-200,-160,-140,-120,z2,120,140,160,200];

figure()
set(gcf, 'Position', [1, 1, 1610, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(long,lat,tfluxera(:,:,17),'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie_g
title('ERA5 2017 heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
acc_6plots_diff(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax2 = subplot(2,3,2);
contourf(long,lat,tfluxeccoera(:,:,17),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('ECCO4 - ERA5 [W/m^2]','FontWeight','Normal','FontSize',18)
acc_6plots_diff(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax3 = subplot(2,3,3);
contourf(long,lat,tfluxsodaera(:,:,17),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('SODA3 - ERA5 [W/m^2]','FontWeight','Normal','FontSize',18)
acc_6plots_diff(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax4 = subplot(2,3,4);
contourf(XC3,YC3,tfluxera3(:,:,17),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/3 - ERA5 [W/m^2]','FontWeight','Normal','FontSize',18)
acc_6plots_diff(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,tfluxera6(:,:,17),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/6 - ERA5 [W/m^2]','FontWeight','Normal','FontSize',18)
acc_6plots_diff(5,ax5,cm1,cm2,ub1,lb1,ub2,lb2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,tfluxera12(:,:,17),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/12 - ERA5 [W/m^2]','FontWeight','Normal','FontSize',18)
acc_6plots_diff(6,ax6,cm1,cm2,ub1,lb1,ub2,lb2)
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','TFLUXDIFFS/TFLUXDIFF_17_2017','-dpng')
close all




cm1 = acc_colormap('cmo_balance');
lb1 = -340;
ub1 = 340;
nlvls = 100;
z1 = linspace(lb1,ub1,nlvls);
z1 = [-430,-380,-365,-350,z1,350,365,380,430];

cm2 = acc_colormap('cmo_balance');
lb2 = -200;
ub2 = 200;
nlvls = 100;
z2 = linspace(lb2,ub2,nlvls);
z2 = [-330,-280,-265,-220,z2,220,265,280,330];

for ii=1:16    
    figure()
    set(gcf, 'Position', [1, 1, 1610, 900])
    colormap(cm1)
    ax1 = subplot(2,3,1);
    contourf(long,lat,tfluxera(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie_g
    title(['ERA5 ',text(ii,:),' heat flux [W/m^2]'],'FontWeight','Normal','FontSize',18)
    acc_6plots_diff(1,ax1,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax2 = subplot(2,3,2);
    contourf(long,lat,tfluxeccoera(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title(['ECCO4 - ERA5 ',text(ii,:),' [W/m^2]'],'FontWeight','Normal','FontSize',18)
    acc_6plots_diff(2,ax2,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax3 = subplot(2,3,3);
    contourf(long,lat,tfluxsodaera(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title(['SODA3 - ERA5 ',text(ii,:),' [W/m^2]'],'FontWeight','Normal','FontSize',18)
    acc_6plots_diff(3,ax3,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax4 = subplot(2,3,4);
    contourf(XC3,YC3,tfluxera3(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title(['1/3 - ERA5 ',text(ii,:),' [W/m^2]'],'FontWeight','Normal','FontSize',18)
    acc_6plots_diff(4,ax4,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax5 = subplot(2,3,5);
    contourf(XC6,YC6,tfluxera6(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title(['1/6 - ERA5 ',text(ii,:),' [W/m^2]'],'FontWeight','Normal','FontSize',18)
    acc_6plots_diff(5,ax5,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    
    ax6 = subplot(2,3,6);
    contourf(XC12,YC12,tfluxera12(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title(['1/12 - ERA5 ',text(ii,:),' [W/m^2]'],'FontWeight','Normal','FontSize',18)
    acc_6plots_diff(6,ax6,cm1,cm2,ub1,lb1,ub2,lb2)
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r300',['TFLUXDIFFS/TFLUXDIFF_',num2str(ii,'%02.f'),'_',text(ii,:)],'-dpng')
    close all
end








toc()