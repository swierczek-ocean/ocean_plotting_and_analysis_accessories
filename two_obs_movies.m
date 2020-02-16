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

coords = [290 340 -59.5 -30];
numdate = datenum('01012017','mmddyyyy');
load SST_microwave
load AB_AVISO_adj
U = D_AVISO(2:254,:,:) - D_AVISO(1:253,:,:);
V = D_AVISO(:,2:121,:) - D_AVISO(:,1:120,:);
[XCm,YCm] = latlon_to_meters(XCA,YCA);
dx = XCm(2:254,:,:) - XCm(1:253,:,:);
dy = YCm(:,2:121,:) - YCm(:,1:120,:);
U = U./dx;
V = V./dy;

V = (V(1:253,:,:) + V(2:254,:,:))./2;
U = (U(:,1:120,:) + U(:,2:121,:))./2;
XA = (XCA(1:253,:) + XCA(2:254,:))./2;
YA = (YCA(:,1:120) + YCA(:,2:121))./2;
XA = XA(:,1:120);
YA = YA(1:253,:);
f = -coriolisf(YA);
g = 9.80665;

CUR = g.*sqrt(U.^2 + V.^2);

cm1 = acc_colormap('cmo_thermal');
cm2 = flipud(acc_colormap('bc_fire'));
lb1 = 0;
ub1 = 26;
z = linspace(lb1,ub1,100);
z1 = [-3,z,30];

lb2 = 0;
ub2 = 1;
z = linspace(lb2,ub2,100);
z2 = [z,2];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

ax1 = subplot(1,2,1);
contourf(XCsst,YCsst,SST_microwave(:,:,1),'LineStyle','none','LevelList',z1);
hold on
contour(XC12,YC12,mask(:,:,1),'Color','k')
caxis([lb1 ub1])
axis(coords)
title('RSS OISST [deg C]','FontWeight','Normal','FontSize',28)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',24,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',24,'Color','w')
acc_movie_g
acc_2mplots(1,ax1,cm1,lb1,ub1,lb2,ub2)
hold off

ax2 = subplot(1,2,2);
contourf(XA,YA,CUR(:,:,32)./f,'LineStyle','none','LevelList',z2);
hold on
contour(XC12,YC12,mask(:,:,1),'Color','k')
caxis([lb2 ub2])
axis(coords)
title('surface currents from AVISO [m/s]','FontWeight','Normal','FontSize',28)
text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',24,'Color','w')
text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',24,'Color','w')
acc_movie_g
acc_2mplots(2,ax2,cm2,lb1,ub1,lb2,ub2)
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('OBS_SAT.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 17;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:365
    numdate = numdate + 1;
    
    ax1 = subplot(1,2,1);
    contourf(XCsst,YCsst,SST_microwave(:,:,ii),'LineStyle','none','LevelList',z1);
    hold on
    contour(XC12,YC12,mask(:,:,1),'Color','k')
    caxis([lb1 ub1])
    axis(coords)
    title('RSS OISST [deg C]','FontWeight','Normal','FontSize',28)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',24,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',24,'Color','w')
    acc_movie_g
    acc_2mplots(1,ax1,cm1,lb1,ub1,lb2,ub2)
    hold off
    
    ax2 = subplot(1,2,2);
    contourf(XA,YA,CUR(:,:,31+ii)./f,'LineStyle','none','LevelList',z2);
    hold on
    contour(XC12,YC12,mask(:,:,1),'Color','k')
    caxis([lb2 ub2])
    axis(coords)
    title('surface currents from AVISO [m/s]','FontWeight','Normal','FontSize',28)
    text(291.4,-33.7,datestr(numdate,'yyyy'),'FontSize',24,'Color','w')
    text(291.4,-35.9,datestr(numdate,'mmm dd'),'FontSize',24,'Color','w')
    acc_movie_g
    acc_2mplots(2,ax2,cm2,lb1,ub1,lb2,ub2)
    hold off
    
    
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end

close(vidObj);

toc()