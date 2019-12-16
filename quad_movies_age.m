clear
close all
clc

tic()
acc_settings

%%
load ../2019_11_November_analysis/mask
load XY3 
load XY6 
load XY12
load AGE_Series32 AGE65*
load AGE_Series62 AGE65*
load AGE_Series122 AGE65*
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
%%

%% AGE 65
cm = acc_colormap('cmo_amp');

lb = 0;
ub = 1;


nlvls = 100;
z = linspace(lb,ub,nlvls);

scale32 = max(max(AGE65_Series32(:,:,1)));
scale62 = max(max(AGE65_Series62(:,:,1)));
scale122 = max(max(AGE65_Series122(:,:,1)));

temp32 = AGE65_Series32(:,:,1)./scale32;
temp62 = AGE65_Series62(:,:,1)./scale62;
temp122 = AGE65_Series122(:,:,1)./scale122;

figure()
set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)

subplot(2,2,1)
text(0.05,0.5,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k')
axis off


ax2 = subplot(2,2,2);
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
m_contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z);
hold on
m_contour(XCm,YCm,mask(:,:,9),'Color','k')
m_grid('fontsize',16);
caxis([lb ub])
title('1/3 65m age','FontWeight','Normal','FontSize',16)
acc_movie_w
hold off

ax3 = subplot(2,2,3);
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
m_contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z);
hold on
m_contour(XCm,YCm,mask(:,:,9),'Color','k')
m_grid('fontsize',16);
caxis([lb ub])
title('1/6 65m age','FontWeight','Normal','FontSize',16)
acc_movie_w
hold off

ax4 = subplot(2,2,4);
m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
m_contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z);
hold on
m_contour(XCm,YCm,mask(:,:,9),'Color','k')
m_grid('fontsize',16);
caxis([lb ub])
title('1/12 65m age','FontWeight','Normal','FontSize',16)
acc_movie_w
hold off
set(gcf,'InvertHardCopy','off');

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('AGE65.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 18;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:396
    numdate = numdate + 1;
    
    scale32 = max(max(AGE65_Series32(:,:,ii)));
    scale62 = max(max(AGE65_Series62(:,:,ii)));
    scale122 = max(max(AGE65_Series122(:,:,ii)));
    
    temp32 = AGE65_Series32(:,:,ii)./scale32;
    temp62 = AGE65_Series62(:,:,ii)./scale62;
    temp122 = AGE65_Series122(:,:,ii)./scale122;
    
    subplot(2,2,1)
    text(0.05,0.5,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k')
    axis off
    
    ax2 = subplot(2,2,2);
    m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
    m_contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z);
    hold on
    m_contour(XCm,YCm,mask(:,:,9),'Color','k')
    m_grid('fontsize',16);
    caxis([lb ub])
    title('1/3 65m age','FontWeight','Normal','FontSize',16)
    acc_movie_w
    hold off
    
    ax3 = subplot(2,2,3);
    m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
    m_contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z);
    hold on
    m_contour(XCm,YCm,mask(:,:,9),'Color','k')
    m_grid('fontsize',16);
    caxis([lb ub])
    title('1/6 65m age','FontWeight','Normal','FontSize',16)
    acc_movie_w
    hold off
    
    ax4 = subplot(2,2,4);
    m_proj('albers','longitudes',[-69.5 -9.8], ...
           'latitudes',[-58.7 -31.1]);
    m_contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z);
    hold on
    m_contour(XCm,YCm,mask(:,:,9),'Color','k')
    m_grid('fontsize',16);
    caxis([lb ub])
    title('1/12 65m age','FontWeight','Normal','FontSize',16)
    acc_movie_w
    hold off
    set(gcf,'InvertHardCopy','off');
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
    
    
end
close(vidObj);

%% END AGE 65