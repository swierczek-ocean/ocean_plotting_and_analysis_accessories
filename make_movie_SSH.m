clear
close all
clc
tic()

load SSH3
load SSH12

ssh3c(ssh3c==-10) = NaN;
ssh3p(ssh3p==-10) = NaN;
ssh3n(ssh3n==-10) = NaN;
ssh12c(ssh12c==-10) = NaN;
ssh12p(ssh12p==-10) = NaN;
ssh12n(ssh12n==-10) = NaN;

dH1_3 = (ssh3p - ssh3c);
dH2_3 = (ssh3n - ssh3c);

dH1_12 = (ssh12p - ssh12c);
dH2_12 = (ssh12n - ssh12c);

clear ssh*

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

%% SSH
cm = acc_colormap('cmo_balance');
ub = 0.0035;
lb = -ub;
nlvls = 40;
z = linspace(lb,ub,nlvls);
z = [-2,-.08,-.06,-.04,-.021,-.016,-.011,-.009,-.007,-.005,-.0045,-.0041,-.0037,...
    z,.0037,.0041,.0045,.005,.007,.009,.011,.016,.021,.04,.06,.08,2];
z = 0.5.*z;

figure()
set(gcf, 'Position', [1, 1, 1600, 901])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(XC3,YC3,dh1_3(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([0.5*lb 0.5*ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 LIN RESPONSE SSH [m]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_quad_movies(1)
text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax2 = subplot(2,2,2);
contourf(XC3,YC3,dh2_3(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([0.5*lb 0.5*ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 NONLIN RESPONSE SSH [m]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_quad_movies(2)
text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax3 = subplot(2,2,3);
contourf(XC12,YC12,dh1_12(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([0.5*lb 0.5*ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 LIN RESPONSE SSH [m]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_quad_movies(3)
text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,dh2_12(:,:,1),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([0.5*lb 0.5*ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 NONLIN RESPONSE SSH [m]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_quad_movies(4)
text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('movie_SSH_pert.avi');
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
    caxis([0.5*lb 0.5*ub])
    axis(inside_coords)
    ytickformat('degrees')
    title('1/3 LIN RESPONSE SSH [m]','FontWeight','Normal','FontSize',16)
    acc_movie_w
    acc_quad_movies(1)
    text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,dh2_3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([0.5*lb 0.5*ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/3 NONLIN RESPONSE SSH [m]','FontWeight','Normal','FontSize',16)
    acc_movie_w
    acc_quad_movies(2)
    text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC12,YC12,dh1_12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([0.5*lb 0.5*ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/12 LIN RESPONSE SSH [m]','FontWeight','Normal','FontSize',16)
    acc_movie_w
    acc_quad_movies(3)
    text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,dh2_12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    contour(XCm,YCm,mask(:,:,1),'Color','k')
    caxis([0.5*lb 0.5*ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('1/12 NONLIN RESPONSE SSH [m]','FontWeight','Normal','FontSize',16)
    acc_movie_w
    acc_quad_movies(4)
    text(291,-33.7,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end



close(vidObj);

%% END SSH

close all

toc()