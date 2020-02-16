clear
close all
clc
tic()

load ../AB_ELEV_DATA/Topo12
acc_colors
mask = Topo12;
clear Topo12
mask(mask>0) = 1;
mask(mask<0) = 0;

coords = [290 350 -64.5 -30];
numdate = datenum('01012017','mmddyyyy');

load BSOSE_surfflxs
option = 2;
A = [];
cm1 = acc_colormap('cmo_balance');
cm2 = acc_colormap('cmo_balance');
[lb1,ub1,lbcb1,ubcb1,~] = get_color_bounds_balance(TFLX_BSOSE,...
    A,A,A,option);
nlvls = 100;
z = linspace(lb1,ub1,nlvls);
z1 = [z(1)-350,z,z(end)+350];

CFLX_BSOSE = CFLX_BSOSE.*1e6;

[lb2,ub2,lbcb2,ubcb2,~] = get_color_bounds_balance(CFLX_BSOSE,...
    A,A,A,option);
nlvls = 100;
z = linspace(lb2,ub2,nlvls);
z2 = [z(1)-100,z,z(end)+100];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

ax1 = subplot(1,2,1);
contourf(XCS,YCS,TFLX_BSOSE(:,:,1),'LineStyle','none','LevelList',z1);
hold on
contour(XC12,YC12,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(coords)
title('BSOSE heat flux [W/m^2]','FontWeight','Normal','FontSize',28)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',24,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',24,'Color','w')
acc_movie_g
acc_2mplots(1,ax1,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

ax2 = subplot(1,2,2);
contourf(XCS,YCS,CFLX_BSOSE(:,:,1),'LineStyle','none','LevelList',z2);
hold on
contour(XC12,YC12,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(coords)
title('BSOSE CO2 flux [\mumol C/m^2/sec]','FontWeight','Normal','FontSize',28)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',24,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',24,'Color','w')
acc_movie_g
acc_2mplots(2,ax2,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('BSOSE_FLUXES.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 10;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:365
    numdate = numdate + 1;
    
    ax1 = subplot(1,2,1);
    contourf(XCS,YCS,TFLX_BSOSE(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XC12,YC12,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(coords)
    title('BSOSE heat flux [W/m^2]','FontWeight','Normal','FontSize',28)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',24,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',24,'Color','w')
    acc_movie_g
    acc_2mplots(1,ax1,cm1,lbcb1,ubcb1,lbcb2,ubcb2)
    hold off
    
    ax2 = subplot(1,2,2);
    contourf(XCS,YCS,CFLX_BSOSE(:,:,ii),'LineStyle','none','LevelList',z2);
    hold on
    contour(XC12,YC12,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(coords)
    title('BSOSE CO2 flux [\mumol C/m^2/sec]','FontWeight','Normal','FontSize',28)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',24,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',24,'Color','w')
    acc_movie_g
    acc_2mplots(2,ax2,cm2,lbcb1,ubcb1,lbcb2,ubcb2)
    hold off
    
    
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end

close(vidObj);

toc()