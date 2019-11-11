clear
close all
clc
tic()

%% make depth file
load grid_full_12 Depth XC YC hFacC

XC = XC(:,1);
YC = YC(1,:);


indxl = find(XC>250,1);
indxh = find(XC>350,1);
indyl = find(YC>-75,1);
indyh = find(YC>-20,1);

Depth12 = -Depth(indxl:indxh,indyl:indyh);
mask12 = hFacC(indxl:indxh,indyl:indyh,:);
XC = XC(indxl:indxh);
YC = YC(indyl:indyh);
nn = length(XC);
mm = length(YC);

[XC12,YC12] = ndgrid(XC,YC);

clear ind* XC YC Depth
%%

%% get land
str = '../AB_ELEV_DATA/elev.americas.5-min.nc';
lat = flipud(ncread(str,'lat'))';
lon = ncread(str,'lon');
[lon,lat] = ndgrid(lon,lat);
data = fliplr(ncread(str,'data'));

Topo = zeros(size(Depth12));

F = griddedInterpolant(lon,lat,data,'linear');
Topo = F(XC12,YC12);

counter = 0;

for ii=1:950
    for jj=1:mm
        if Depth12(ii,jj)==0
            counter = counter + 1;
            Depth12(ii,jj) = Topo(ii,jj);   
        end
    end
end

Topo12 = Depth12;

save Topo12 Topo12 XC12 YC12 mask12
%%






toc()