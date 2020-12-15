clear
close all
clc
tic()

load sDO3
load sDO12

do3c(do3c==0) = NaN;
do3p(do3p==0) = NaN;
do3n(do3n==0) = NaN;
do12c(do12c==0) = NaN;
do12p(do12p==0) = NaN;
do12n(do12n==0) = NaN;

dH1_3 = 1000000.*(do3p - do3c);
dH2_3 = 1000000.*(do3n - do3c);

dH1_12 = 1000000.*(do12p - do12c);
dH2_12 = 1000000.*(do12n - do12c);

clear do*

dh1_3 = 0.5.*(dH1_3 - dH2_3);
dh2_3 = 0.5.*(dH1_3 + dH2_3);

dh1_12 = 0.5.*(dH1_12 - dH2_12);
dh2_12 = 0.5.*(dH1_12 + dH2_12);

clear dH*

%%
load mask
load XY3 XC3 YC3
load XY12 XC12 YC12

acc_colors
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);
numdate = datenum('01012017','mmddyyyy');
%% 

%% DO
cm = acc_colormap('cmo_balance');
ub = 400;
lb = -ub;
nlvls = 40;
z = linspace(lb,ub,nlvls);
z = [-10000,-1000,-800,-600,-550,-500,-470,-440,-420,...
    z,420,440,470,500,550,600,800,1000,10000];
z = 0.25.*z;

figure()
set(gcf, 'Position', [1, 1, 1600, 901])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XC3,YC3,dh1_3(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([0.25*lb 0.25*ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 LIN RESPONSE OXYGEN [\mumol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_quad_movies(1)
text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,dh2_3(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([0.25*lb 0.25*ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 NONLIN RESPONSE OXYGEN [\mumol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_quad_movies(2)
text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax3 = subplot(2,2,3);
contourf(XC12,YC12,dh1_12(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([0.25*lb 0.25*ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 LIN RESPONSE OXYGEN [\mumol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_quad_movies(3)
text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,dh2_12(:,:,1),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([0.25*lb 0.25*ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 NONLIN RESPONSE OXYGEN [\mumol O/m^3]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_quad_movies(4)
text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('sm_movie_DO_pert.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 10;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:488
    numdate = numdate + 0.25;
    
    ax1 = subplot(2,2,1);
    contourf(XC3,YC3,dh1_3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([0.25*lb 0.25*ub])
    axis(inside_coords)
    ytickformat('degrees')
    title('1/3 LIN RESPONSE OXYGEN [\mumol O/m^3]','FontWeight','Normal','FontSize',16)
    acc_movie_w
    acc_quad_movies(1)
    text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,dh2_3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([0.25*lb 0.25*ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/3 NONLIN RESPONSE OXYGEN [\mumol O/m^3]','FontWeight','Normal','FontSize',16)
    acc_movie_w
    acc_quad_movies(2)
    text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12,YC12,dh1_12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([0.25*lb 0.25*ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/12 LIN RESPONSE OXYGEN [\mumol O/m^3]','FontWeight','Normal','FontSize',16)
    acc_movie_w
    acc_quad_movies(3)
    text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,dh2_12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([0.25*lb 0.25*ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/12 NONLIN RESPONSE OXYGEN [\mumol O/m^3]','FontWeight','Normal','FontSize',16)
    acc_movie_w
    acc_quad_movies(4)
    text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end



close(vidObj);

%% END DO

close all
toc()