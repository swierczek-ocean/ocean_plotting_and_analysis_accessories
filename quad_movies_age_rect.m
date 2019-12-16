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

temp122(temp122==0) = NaN;

figure()
set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)

subplot(2,2,1)
ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
axis off


ax2 = subplot(2,2,2);
contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,9),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/3 65m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v10
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,9),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/6 65m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v11
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,9),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/12 65m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v12
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
    
    temp122(temp122==0) = NaN;
    
    subplot(2,2,1)
    % text(0.2,0.45,datestr(numdate-1,'yyyy mmm dd'),'FontSize',21.2,'Color','w')
    delete(ht)
    ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
    axis off
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,9),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/3 65m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v10
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,9),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/6 65m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v11
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,9),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/12 65m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v12
    hold off
    set(gcf,'InvertHardCopy','off');
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
    
    
end
close(vidObj);

clear AGE65*

%% END AGE 65


load AGE_Series32 AGE135*
load AGE_Series62 AGE135*
load AGE_Series122 AGE135*

scale32 = max(max(AGE135_Series32(:,:,1)));
scale62 = max(max(AGE135_Series62(:,:,1)));
scale122 = max(max(AGE135_Series122(:,:,1)));

temp32 = AGE135_Series32(:,:,1)./scale32;
temp62 = AGE135_Series62(:,:,1)./scale62;
temp122 = AGE135_Series122(:,:,1)./scale122;

temp122(temp122==0) = NaN;

figure()
set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)

subplot(2,2,1)
ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
axis off


ax2 = subplot(2,2,2);
contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,16),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/3 135m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v10
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,16),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/6 135m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v11
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,16),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/12 135m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v12
hold off
set(gcf,'InvertHardCopy','off');

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('AGE135.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 18;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:396
    numdate = numdate + 1;
    
    scale32 = max(max(AGE135_Series32(:,:,ii)));
    scale62 = max(max(AGE135_Series62(:,:,ii)));
    scale122 = max(max(AGE135_Series122(:,:,ii)));
    
    temp32 = AGE135_Series32(:,:,ii)./scale32;
    temp62 = AGE135_Series62(:,:,ii)./scale62;
    temp122 = AGE135_Series122(:,:,ii)./scale122;
    
    temp122(temp122==0) = NaN;
    
    subplot(2,2,1)
    % text(0.2,0.45,datestr(numdate-1,'yyyy mmm dd'),'FontSize',21.2,'Color','w')
    delete(ht)
    ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
    axis off
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,16),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/3 135m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v10
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,16),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/6 135m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v11
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,16),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/12 135m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v12
    hold off
    set(gcf,'InvertHardCopy','off');
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
    
    
end
close(vidObj);

clear AGE135*

%% END AGE 135


load AGE_Series32 AGE105*
load AGE_Series62 AGE105*
load AGE_Series122 AGE105*

scale32 = max(max(AGE105_Series32(:,:,1)));
scale62 = max(max(AGE105_Series62(:,:,1)));
scale122 = max(max(AGE105_Series122(:,:,1)));

temp32 = AGE105_Series32(:,:,1)./scale32;
temp62 = AGE105_Series62(:,:,1)./scale62;
temp122 = AGE105_Series122(:,:,1)./scale122;

temp122(temp122==0) = NaN;

figure()
set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)

subplot(2,2,1)
ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
axis off


ax2 = subplot(2,2,2);
contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/3 105m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v10
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/6 105m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v11
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,13),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/12 105m age','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v12
hold off
set(gcf,'InvertHardCopy','off');

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('AGE105.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 18;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:396
    numdate = numdate + 1;
    
    scale32 = max(max(AGE105_Series32(:,:,ii)));
    scale62 = max(max(AGE105_Series62(:,:,ii)));
    scale122 = max(max(AGE105_Series122(:,:,ii)));
    
    temp32 = AGE105_Series32(:,:,ii)./scale32;
    temp62 = AGE105_Series62(:,:,ii)./scale62;
    temp122 = AGE105_Series122(:,:,ii)./scale122;
    
    temp122(temp122==0) = NaN;
    
    subplot(2,2,1)
    % text(0.2,0.45,datestr(numdate-1,'yyyy mmm dd'),'FontSize',21.2,'Color','w')
    delete(ht)
    ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
    axis off
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,temp32,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,13),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/3 105m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v10
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,temp62,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,13),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/6 105m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v11
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,temp122,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,13),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/12 105m age','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v12
    hold off
    set(gcf,'InvertHardCopy','off');
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
    
    
end
close(vidObj);

clear AGE105*

%% END AGE 105






toc()