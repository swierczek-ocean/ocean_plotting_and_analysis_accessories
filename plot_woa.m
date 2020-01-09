clear
close all
clc
tic()

load WOA_O_N

contourf(lon,lat,DO_clim_count(:,:,1,1)',500)
DO_clim_count(isnan(DO_clim_count)==1) = 0;
NO3_clim_count(isnan(NO3_clim_count)==1) = 0;

for ii=1:57
    temp = DO_clim_count(:,:,ii,1);
    fprintf('%g DO obs at depth %g in January \n',sum(sum(temp)),woa_depth_o(ii))
end

for ii=1:43
    temp = NO3_clim_count(:,:,ii,1);
    fprintf('%g NO3 obs at depth %g in January \n',sum(sum(temp)),woa_depth_n(ii))
end


for ii=1:43
    contourf(lon,lat,NO3_clim_count(:,:,ii,1)',500)
end





toc()