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
lb1 = 0.55;
ub1 = 0.95;
nlvls = 100;
z1 = linspace(lb1,ub1,nlvls);

cm2 = acc_colormap('cmo_deep');

lb2 = 0;
ub2 = 120;
numdate = datenum('12012016','mmddyyyy');

nlvls = 201;
z2 = linspace(lb2,ub2,nlvls);
z2 = [z2,2000];
for ii=32:396
    scale32 = max(max(AGE65_Series32(:,:,ii)));
    scale62 = max(max(AGE65_Series62(:,:,ii)));
    scale122 = max(max(AGE65_Series122(:,:,ii)));
    
    AGE65_Series32(:,:,ii) = AGE65_Series32(:,:,ii)./scale32;
    AGE65_Series62(:,:,ii) = AGE65_Series62(:,:,ii)./scale62;
    AGE65_Series122(:,:,ii) = AGE65_Series122(:,:,ii)./scale122;
end

temp32 = mean(AGE65_Series32(:,:,32:396),3);
temp62 = mean(AGE65_Series62(:,:,32:396),3);
temp122 = mean(AGE65_Series122(:,:,32:396),3);

temp122(temp122==0) = NaN;

mld3 = -nanmean(MLD_Series32(:,:,32:396),3);
mld6 = -nanmean(MLD_Series62(:,:,32:396),3);
mld12 = -nanmean(MLD_Series122(:,:,32:396),3);



figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)

ax1 = subplot(2,3,1);
contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/3 mean 65m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_6plots(1,ax1,cm1)
hold off

ax2 = subplot(2,3,2);
contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/6 mean 65m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_6plots(2,ax2,cm1)
hold off

ax3 = subplot(2,3,3);
contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z1);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(inside_coords)
title('1/12 mean 65m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_6plots(3,ax3,cm1)
hold off

ax4 = subplot(2,3,4);
contourf(XC3,YC3,mld3,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/3 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_6plots(4,ax4,cm2)
hold off

ax5 = subplot(2,3,5);
contourf(XC6,YC6,mld6,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/6 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_6plots(5,ax5,cm2)
hold off

ax6 = subplot(2,3,6);
contourf(XC12,YC12,mld12,'LineStyle','none','LevelList',z2);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(inside_coords)
title('1/12 mean MLD [m]','FontWeight','Normal','FontSize',16)
acc_movie
acc_6plots(6,ax6,cm2)
hold off


set(gcf,'InvertHardCopy','off');
print('-r300','mean_age_mld','-dpng')








toc()