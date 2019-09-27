clear
close all
clc
tic()

% load XY12 XC12 YC12 Depth12
% Depth12 = -Depth12;
% nn = length(XC12);
% mm = length(YC12);
% [XC12,YC12] = ndgrid(XC12,YC12);
% 
% str = '../AB_ELEV_DATA/elev.0.25-deg.nc';
% lat = flipud(ncread(str,'lat'))';
% lon = ncread(str,'lon');
% [lon,lat] = ndgrid(lon,lat);
% data = flipud(ncread(str,'data'));
% 
% Topo = zeros(size(Depth12));
% 
% F = griddedInterpolant(lon,lat,data,'linear');
% Topo = F(XC12,YC12);
% 
% counter = 0;
% 
% for ii=1:nn
%     for jj=1:mm
%         if Depth12(ii,jj)==0
%             counter = counter + 1;
%             if Topo(ii,jj)>100
%                 Topo(ii,jj) = Topo(ii,jj) - 100;
%             end
%             Depth12(ii,jj) = Topo(ii,jj)/2;   
%         end
%     end
% end
% 
% Topo12 = Depth12;
% 
% save Topo12 Topo12 XC12 YC12


str = '../AB_ELEV_DATA/elev.americas.5-min.nc';
lat = flipud(ncread(str,'lat'))';
lon = ncread(str,'lon');
[lon,lat] = ndgrid(lon,lat);
% [lat,lon] = ndgrid(lat,lon);
% data = flipud(ncread(str,'data'));
% data = ncread(str,'data');
data = fliplr(ncread(str,'data'));

load XY12 XC12 YC12 Depth12
Depth12 = -Depth12;
nn = length(XC12);
mm = length(YC12);
[XC12,YC12] = ndgrid(XC12,YC12);

Topo = zeros(size(Depth12));

F = griddedInterpolant(lon,lat,data,'linear');
Topo = F(XC12,YC12);

counter = 0;

for ii=1:(ceil(0.6*nn))
    for jj=1:mm
        if Depth12(ii,jj)==0
            counter = counter + 1;
%             if Topo(ii,jj)>100
%                 Topo(ii,jj) = Topo(ii,jj) - 100;
%             end
            Depth12(ii,jj) = Topo(ii,jj);   
        end
    end
end

Topo12 = Depth12;

save Topo12 Topo12 XC12 YC12




toc()