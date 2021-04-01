clear
close all
clc
tic()

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


load ../AB_ELEV_DATA/Topo12
acc_colors
mask = Topo12;
clear Topo12
mask(mask>0) = 1;
mask(mask<0) = 0;

inside_coords = [290.5 350.2 -58.7 -32];
numdate = datenum('01012017','mmddyyyy');
cm = flipud(acc_colormap('bc_fire'));
lb = 0;
ub = 1;
z = linspace(lb,ub,100);
z = [z,2];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
contourf(XA,YA,CUR(:,:,32)./f,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask,'Color','k')
caxis([lb ub])
cbar = colorbar('eastoutside');
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
acc_movie_s
title('surface currents from AVISO satellite altimetry [m/s]','FontWeight','Normal','FontSize',28)
acc_plots
text(291.3,-37,datestr(numdate,'yyyy mmm dd'),'FontSize',30,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('AVISO_currents.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 18;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:365
    numdate = numdate + 1;
    
    contourf(XA,YA,CUR(:,:,31+ii)./f,'LineStyle','none','LevelList',z);
    hold on
    contour(XC12,YC12,mask,'Color','k')
    caxis([lb ub])
    cbar = colorbar('eastoutside');
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    acc_movie_s
    title('surface currents from AVISO satellite altimetry [m/s]','FontWeight','Normal','FontSize',28)
    text(291.3,-37,datestr(numdate,'yyyy mmm dd'),'FontSize',30,'Color','w')
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end

close(vidObj);


cm = flipud(acc_colormap('cmo_tempo'));
lb = 0;
ub = 1;
z = linspace(lb,ub,100);
z = [z,2];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
contourf(XA,YA,CUR(:,:,32)./f,'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask,'Color','k')
caxis([lb ub])
cbar = colorbar('eastoutside');
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
acc_movie_s
title('surface currents from AVISO satellite altimetry [m/s]','FontWeight','Normal','FontSize',28)
acc_plots
text(291.3,-37,datestr(numdate,'yyyy mmm dd'),'FontSize',28,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('AVISO_currents_2.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 18;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:365
    numdate = numdate + 1;
    
    contourf(XA,YA,CUR(:,:,31+ii)./f,'LineStyle','none','LevelList',z);
    hold on
    contour(XC12,YC12,mask,'Color','k')
    caxis([lb ub])
    cbar = colorbar('eastoutside');
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    acc_movie_s
    title('surface currents from AVISO satellite altimetry [m/s]','FontWeight','Normal','FontSize',28)
    text(291.3,-37,datestr(numdate,'yyyy mmm dd'),'FontSize',28,'Color','w')
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end
close(vidObj);








toc()