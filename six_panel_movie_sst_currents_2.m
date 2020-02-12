clear
close all
clc

tic()
acc_settings

%%
load ../2019_11_November_analysis/mask
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load SST_TS
load current
%%




%%
numdate = datenum('01012017','mmddyyyy');
option = 9;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str *DYG* *DXG* *DRF*

%%
numdate = datenum('01012017','mmddyyyy');

cm1 = acc_colormap('cmo_thermal');
lb1 = 0;
ub1 = 21;
nlvls = 101;
z1 = linspace(lb1,ub1,nlvls);
z1 = [-3,z1,24];

cm2 = flipud(acc_colormap('bc_fire'));
lb2 = 0;
ub2 = 1.1;
nlvls = 111;
z2 = linspace(lb2,ub2,nlvls);
z2 = [z2,2];



figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)

ax1 = subplot(2,3,1);
contourf(XC3,YC3,SST_TS_3(:,:,1),'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie_g
title('1/3 SST [deg C]','FontWeight','Normal','FontSize',22)
acc_6plots(1,ax1,cm1)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,SST_TS_6(:,:,1),'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie_g
title('1/6 SST [deg C]','FontWeight','Normal','FontSize',22)
acc_6plots(2,ax2,cm1)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,SST_TS_12(:,:,1),'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie_g
title('1/12 SST [deg C]','FontWeight','Normal','FontSize',22)
acc_6plots(3,ax3,cm1)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax4 = subplot(2,3,4);
contourf(XC3,YC3,current_3(:,:,1),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/3 surface currents [m/s]','FontWeight','Normal','FontSize',22)
acc_6plots(4,ax4,cm2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,current_6(:,:,1),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/6 surface currents [m/s]','FontWeight','Normal','FontSize',22)
acc_6plots(5,ax5,cm2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,current_12(:,:,1),'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie_g
title('1/12 surface currents [m/s]','FontWeight','Normal','FontSize',22)
acc_6plots(6,ax6,cm2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('SST_CURRENTS_2.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 13;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:365
    numdate = numdate + 1;
    
    ax1 = subplot(2,3,1);
    contourf(XC3,YC3,SST_TS_3(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie_g
    title('1/3 SST [deg C]','FontWeight','Normal','FontSize',22)
    acc_6plots(1,ax1,cm1)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax2 = subplot(2,3,2);
    contourf(XC6,YC6,SST_TS_6(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie_g
    title('1/6 SST [deg C]','FontWeight','Normal','FontSize',22)
    acc_6plots(2,ax2,cm1)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax3 = subplot(2,3,3);
    contourf(XC12,YC12,SST_TS_12(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie_g
    title('1/12 SST [deg C]','FontWeight','Normal','FontSize',22)
    acc_6plots(3,ax3,cm1)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax4 = subplot(2,3,4);
    contourf(XC3,YC3,current_3(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title('1/3 surface currents [m/s]','FontWeight','Normal','FontSize',22)
    acc_6plots(4,ax4,cm2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax5 = subplot(2,3,5);
    contourf(XC6,YC6,current_6(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title('1/6 surface currents [m/s]','FontWeight','Normal','FontSize',22)
    acc_6plots(5,ax5,cm2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax6 = subplot(2,3,6);
    contourf(XC12,YC12,current_12(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie_g
    title('1/12 surface currents [m/s]','FontWeight','Normal','FontSize',22)
    acc_6plots(6,ax6,cm2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end

close(vidObj);

toc()