clear
close all
clc
tic()

load SST_microwave
load ../AB_ELEV_DATA/Topo12
acc_colors
mask = Topo12;
clear Topo12
mask(mask>0) = 1;
mask(mask<0) = 0;

inside_coords = [290.5 350.2 -58.7 -32];
numdate = datenum('01012017','mmddyyyy');
cm = acc_colormap('cmo_thermal');
lb = 0;
ub = 26;
z = linspace(lb,ub,100);
z = [-3,z,30];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
contourf(XCsst,YCsst,SST_microwave(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask,'Color','k')
caxis([lb ub])
cbar = colorbar('eastoutside');
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
acc_movie
title('RSS OISST from TMI, AMSR-E, AMSR-2, WindSat, GMI [deg C]','FontWeight','Normal','FontSize',28)
acc_plots
text(291.7,-37,datestr(numdate,'yyyy mmm dd'),'FontSize',25,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('SST_microwave.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 18;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:365
    numdate = numdate + 1;
    
    contourf(XCsst,YCsst,SST_microwave(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XC12,YC12,mask,'Color','k')
    caxis([lb ub])
    cbar = colorbar('eastoutside');
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    acc_movie
    title('RSS OISST from TMI, AMSR-E, AMSR-2, WindSat, GMI [deg C]','FontWeight','Normal','FontSize',28)
    text(291.7,-37,datestr(numdate,'yyyy mmm dd'),'FontSize',25,'Color','w')
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end

close(vidObj);




cm = acc_colormap('cmo_thermal');
lb = 0;
ub = 26;
z = linspace(lb,ub,100);
z = [-3,z,30];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
contourf(XCsst,YCsst,SST_microwave(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XC12,YC12,mask,'Color','k')
caxis([lb ub])
cbar = colorbar('eastoutside');
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('RSS OISST [deg C]','FontWeight','Normal','FontSize',18)
acc_movie
acc_plots
text(291.7,-37,datestr(numdate,'yyyy mmm dd'),'FontSize',25,'Color','k')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('SST_microwave_2.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 18;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:365
    numdate = numdate + 1;
    
    contourf(XCsst,YCsst,SST_microwave(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XC12,YC12,mask,'Color','k')
    caxis([lb ub])
    cbar = colorbar('eastoutside');
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title('RSS OISST [deg C]','FontWeight','Normal','FontSize',18)
    acc_movie
    text(291.7,-37,datestr(numdate,'yyyy mmm dd'),'FontSize',25,'Color','k')
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end

close(vidObj);





toc()