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
numdate = datenum('01012017','mmddyyyy');
option = 2;

cm1 = acc_colormap('cmo_balance');
cm2 = acc_colormap('cmo_balance');
load flux


[lb1,ub1,lbcb1,ubcb1,~] = get_color_bounds_balance(tflux_3,...
    tflux_3,tflux_6,tflux_12,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls);
z1 = [z(1)-250,z,z(end)+250];

[lb2,ub2,lbcb2,ubcb2,~] = get_color_bounds_balance(cflux_3,...
    cflux_3,cflux_6,cflux_12,option);
nlvls = 100;
z = linspace(lb2,ub2,nlvls);
z2 = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1610, 900])
colormap(cm1)
ax1 = subplot(2,3,1);
contourf(XC3,YC3,tflux_3(:,:,1),'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie_g
title('1/3 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots_2bal(1,ax1,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,tflux_6(:,:,1),'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie_g
title('1/6 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots_2bal(2,ax2,cm1,lbcb1,ubcb1)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,tflux_12(:,:,1),'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie_g
title('1/12 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
acc_6plots_2bal(3,ax3,cm1,lbcb1,ubcb1)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax4 = subplot(2,3,4);
contourf(XC3,YC3,cflux_3(:,:,1),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/3 carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',22)
acc_6plots_2bal(4,ax4,cm2,lbcb2,ubcb2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,cflux_6(:,:,1),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/6 carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',22)
acc_6plots_2bal(5,ax5,cm2,lbcb2,ubcb2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,cflux_12(:,:,1),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/12 carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',22)
acc_6plots_2bal(6,ax6,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off


set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('FLUXES.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 10;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:365
    numdate = numdate + 1;
    
    ax1 = subplot(2,3,1);
    contourf(XC3,YC3,tflux_3(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie_g
    title('1/3 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
    acc_6plots_2bal(1,ax1,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax2 = subplot(2,3,2);
    contourf(XC6,YC6,tflux_6(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie_g
    title('1/6 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
    acc_6plots_2bal(2,ax2,cm1,lbcb1,ubcb1)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax3 = subplot(2,3,3);
    contourf(XC12,YC12,tflux_12(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie_g
    title('1/12 heat flux [W/m^2]','FontWeight','Normal','FontSize',22)
    acc_6plots_2bal(3,ax3,cm1,lbcb1,ubcb1)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax4 = subplot(2,3,4);
    contourf(XC3,YC3,cflux_3(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title('1/3 carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',22)
    acc_6plots_2bal(4,ax4,cm2,lbcb2,ubcb2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax5 = subplot(2,3,5);
    contourf(XC6,YC6,cflux_6(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title('1/6 carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',22)
    acc_6plots_2bal(5,ax5,cm2,lbcb2,ubcb2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax6 = subplot(2,3,6);
    contourf(XC12,YC12,cflux_12(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title('1/12 carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',22)
    acc_6plots_2bal(6,ax6,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end

close(vidObj);






toc()