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

xlon = xlon(xlo:xhi) + 360;
ylat = ylat(ylo:yhi);

ncdisp(str)

fco2_count_nobs = ncread(str,'fco2_count_nobs');

fco2_count_nobs = fco2_count_nobs(xlo:xhi,ylo:yhi,481:end);

fco2_ave_weighted = ncread(str,'fco2_ave_weighted');

fco2_ave_weighted = fco2_ave_weighted(xlo:xhi,ylo:yhi,481:end);

sst_ave_weighted = ncread(str,'sst_ave_weighted');

sst_ave_weighted = sst_ave_weighted(xlo:xhi,ylo:yhi,481:end);

nn = length(xlon);
mm = length(ylat);
tt = 108;

pco2_socat = zeros(nn,mm,tt);

for ii=1:nn
    for jj=1:mm
        for kk=1:tt
            if fco2_count_nobs(ii,jj,kk)>0
                pco2_socat(ii,jj,kk) = f2pCO2(sst_ave_weighted(ii,jj,kk),...
                    1,0,fco2_ave_weighted(ii,jj,kk));
            end
        end
    end
end

% load mask
% inside_coords = [290.5 350.2 -58.7 -32];
% mask = permute(mask,[2,1,3]);
% [xlon,ylat] = ndgrid(xlon,ylat);
% 
% cm = acc_colormap('es_coolwarm');
% figure()
% set(gcf, 'Position', [1, 1, 1400, 850])
% colormap(cm)
% pcolor(xlon,ylat,sst_ave_weighted(:,:,1))
% hold on
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% caxis([-2 20])
% cbar = colorbar('eastoutside');
% axis(inside_coords)
% ytickformat('degrees')
% xtickformat('degrees')
% title('SOCAT from 2010 to 2018','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_plots
% hold off
% % print('-r300','SOCAT_2010_2018','-dpng')

save pco2_socat pco2_socat xlon ylat

pco2_socat_clim = zeros(nn*mm,3,12);
pco2_socat_clim_2 = NaN.*ones(nn,mm,12);


for ii=1:12
    for jj=1:nn
        for kk=1:mm
            temp = pco2_socat(jj,kk,ii:12:end);
            temp = mean(temp(temp~=0));
            if isnan(temp)==0
                pco2_socat_clim(sub2ind([nn,mm],jj,kk),1,ii) = xlon(jj);
                pco2_socat_clim(sub2ind([nn,mm],jj,kk),2,ii) = ylat(kk);
                pco2_socat_clim(sub2ind([nn,mm],jj,kk),3,ii) = temp;
                pco2_socat_clim_2(jj,kk,ii) = temp;
            else
                pco2_socat_clim(sub2ind([nn,mm],jj,kk),1,ii) = NaN;
                pco2_socat_clim(sub2ind([nn,mm],jj,kk),2,ii) = NaN;
                pco2_socat_clim(sub2ind([nn,mm],jj,kk),3,ii) = NaN;
            end
        end
    end
end
save pco2_socat_clim_2 pco2_socat_clim_2 xlon ylat fco2_count_nobs
save pco2_socat_clim pco2_socat_clim*


toc()