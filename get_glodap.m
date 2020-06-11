clear
close all
clc
tic()


name = 'GLODAPv2.2016b_MappedClimatologies/GLODAPv2.2016b.TCO2.nc';

ncdisp(name)

lon = ncread(name,'lon');
lat = ncread(name,'lat');
TCO2 = ncread(name,'TCO2');
Depth = ncread(name,'Depth');

lon = lon(271:325);
lat = lat(36:57);
TCO2 = TCO2(271:325,36:57,:);

% [lon,lat] = ndgrid(lon,lat);

hFacC = double(isnan(TCO2));
TCO2(isnan(TCO2)==1) = 0;

hFacC = hFacC - 1;
hFacC = abs(hFacC);

area = zeros(size(hFacC));
total_area = zeros(33,1);

for ii=1:55
    for jj=1:22
        if hFacC(ii,jj,26)==0
            hFacC(ii,jj,:) = 0;
        end
        for kk=1:33
            area(ii,jj,kk) = area_degree(lat(jj),1,1)*hFacC(ii,jj,kk);
        end
    end
end

for ii=1:33
    total_area(ii) = sum(area(:,:,ii),[1,2]);
end

glodapdic = zeros(33,1);

for ii=1:33
    glodapdic(ii) = sum(TCO2(:,:,ii).*area(:,:,ii),[1,2])./total_area(ii);
end

save glodapdic glodapdic Depth



toc()