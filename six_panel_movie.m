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
load AGE_Series32 AGE65*
load AGE_Series62 AGE65*
load AGE_Series122 AGE65*
load MLD_Series32 MLD*
load MLD_Series62 MLD*
load MLD_Series122 MLD*
%%


%%
numdate = datenum('12012016','mmddyyyy');
option = 9;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str *DYG* *DXG* *DRF*

atten = linspace(0.2,1,256);
atten = [atten',atten',atten'];
%%

cm1 = acc_colormap('cmo_tempo');
cm1 = cm1.^atten;
lb1 = 0.3;
ub1 = 1;
nlvls = 100;
z1 = linspace(lb1,ub1,nlvls);
z1 = [0,z1];

cm2 = acc_colormap('cmo_deep');

lb2 = 0;
ub2 = 150;
numdate = datenum('01012017','mmddyyyy');

nlvls = 201;
z2 = linspace(lb2,ub2,nlvls);
z2 = [z2,2000];

scale32 = max(max(AGE65_Series32(:,:,32)));
scale62 = max(max(AGE65_Series62(:,:,32)));
scale122 = max(max(AGE65_Series122(:,:,32)));

temp32 = AGE65_Series32(:,:,32)./scale32;
temp62 = AGE65_Series62(:,:,32)./scale62;
temp122 = AGE65_Series122(:,:,32)./scale122;

temp122(temp122==0) = NaN;

mld3 = -MLD_Series32(:,:,32);
mld6 = -MLD_Series62(:,:,32);
mld12 = -MLD_Series122(:,:,32);



figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)

ax1 = subplot(2,3,1);
contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie
title('1/3 65m age','FontWeight','Normal','FontSize',22)
acc_6plots(1,ax1,cm1)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie
title('1/6 65m age','FontWeight','Normal','FontSize',22)
acc_6plots(2,ax2,cm1)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
acc_movie
title('1/12 65m age','FontWeight','Normal','FontSize',22)
acc_6plots(3,ax3,cm1)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax4 = subplot(2,3,4);
contourf(XC3,YC3,mld3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie
title('1/3 MLD [m]','FontWeight','Normal','FontSize',22)
acc_6plots(4,ax4,cm2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,mld6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie
title('1/6 MLD [m]','FontWeight','Normal','FontSize',22)
acc_6plots(5,ax5,cm2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,mld12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
acc_movie
title('1/12 MLD [m]','FontWeight','Normal','FontSize',22)
acc_6plots(6,ax6,cm2)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('AGE65_MLD.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 15;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=33:396
    numdate = numdate + 1;
    
    scale32 = max(max(AGE65_Series32(:,:,ii)));
    scale62 = max(max(AGE65_Series62(:,:,ii)));
    scale122 = max(max(AGE65_Series122(:,:,ii)));
    
    temp32 = AGE65_Series32(:,:,ii)./scale32;
    temp62 = AGE65_Series62(:,:,ii)./scale62;
    temp122 = AGE65_Series122(:,:,ii)./scale122;
    
    temp122(temp122==0) = NaN;
    
    
    mld3 = -MLD_Series32(:,:,ii);
    mld6 = -MLD_Series62(:,:,ii);
    mld12 = -MLD_Series122(:,:,ii);
    
    mld3(mld3<0) = 0;
    mld6(mld6<0) = 0;
    mld12(mld12<0) = 0;
    %     mld3(isnan(mld3)==1) = 0;
    %     mld6(isnan(mld6)==1) = 0;
    %     mld12(isnan(mld12)==1) = 0;
    
    ax1 = subplot(2,3,1);
    contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie
    title('1/3 65m age','FontWeight','Normal','FontSize',22)
    acc_6plots(1,ax1,cm1)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax2 = subplot(2,3,2);
    contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie
    title('1/6 65m age','FontWeight','Normal','FontSize',22)
    acc_6plots(2,ax2,cm1)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax3 = subplot(2,3,3);
    contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z1);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(inside_coords)
    acc_movie
    title('1/12 65m age','FontWeight','Normal','FontSize',22)
    acc_6plots(3,ax3,cm1)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax4 = subplot(2,3,4);
    contourf(XC3,YC3,mld3,'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie
    title('1/3 MLD [m]','FontWeight','Normal','FontSize',22)
    acc_6plots(4,ax4,cm2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax5 = subplot(2,3,5);
    contourf(XC6,YC6,mld6,'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie
    title('1/6 MLD [m]','FontWeight','Normal','FontSize',22)
    acc_6plots(5,ax5,cm2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    ax6 = subplot(2,3,6);
    contourf(XC12,YC12,mld12,'LineStyle','none','LevelList',z2);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(inside_coords)
    acc_movie
    title('1/12 MLD [m]','FontWeight','Normal','FontSize',22)
    acc_6plots(6,ax6,cm2)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',20,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',20,'Color','w')
    hold off
    
    
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end

close(vidObj);

toc()