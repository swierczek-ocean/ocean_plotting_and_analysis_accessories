clear
close all
clc
tic()

str = 'SOCATv2019_tracks_gridded_monthly.nc';

tmnth = ncread(str,'tmnth');
xlon = ncread(str,'xlon');
ylat = ncread(str,'ylat');

xlo = find(xlon>-70,1)-1;
xhi = find(xlon>-10,1);
ylo = find(ylat>-60,1)-1;
yhi = find(ylat>-30,1);

xlon = xlon(xlo:xhi) + 360;;
ylat = ylat(ylo:yhi);

ncdisp(str)

fco2_count_nobs = ncread(str,'fco2_count_nobs');

fco2_count_nobs = fco2_count_nobs(xlo:xhi,ylo:yhi,:);

max(max(max(fco2_count_nobs)))

load mask
inside_coords = [290.5 350.2 -58.7 -32];
mask = permute(mask,[2,1,3]);
[xlon,ylat] = ndgrid(xlon,ylat);

cm = acc_colormap('cmo_tempo');
figure()
set(gcf, 'Position', [1, 1, 1400, 850])
colormap(cm)
pcolor(xlon,ylat,sum(fco2_count_nobs(:,:,481:end),3))
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% image(xlon,ylat,fco2_count_nobs(:,:,1),'CDataMapping','scaled')
% contourf(xlon,ylat,fco2_count_nobs(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% scatter(xlon(temp>0),ylat(temp>0),temp(temp>0)+50,Color(:,13),'filled')
caxis([0 250])
cbar = colorbar('eastoutside');
axis(inside_coords)
ytickformat('degrees')
xtickformat('degrees')
title('# of fCO_2 obs [SOCAT] from 2010 to 2018','FontWeight','Normal','FontSize',16)
acc_movie
acc_plots
hold off
print('-r300','SOCAT_2010_2018','-dpng')



toc()