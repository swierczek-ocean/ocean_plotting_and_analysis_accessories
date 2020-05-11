clear
close all
clc
tic()

name = 'woa18_A5B7_s00_04.nc';

ncdisp(name)

latw = ncread(name,'lat');
lonw = ncread(name,'lon');
depth = ncread(name,'depth');
s_an = ncread(name,'s_an');
latw = latw(141:226);
lonw = lonw(441:660);
s_an = s_an(441:660,141:226,:);
woa_mask = ones(size(s_an));
woa_mask(isnan(s_an)==1) = 0;
s_an(isnan(s_an)==1) = 0;


area = zeros(220,86,102);
total_area = zeros(102,1);

for ii=1:220
    for jj=1:86
        if woa_mask(ii,jj,67)==0
            woa_mask(ii,jj,:) = 0;
        end
        for kk=1:102
            area(ii,jj,kk) = area_degree(latw(jj),0.25,0.25)*woa_mask(ii,jj,kk);
        end
    end
end

for ii=1:102
    total_area(ii) = sum(area(:,:,ii),[1,2]);
end

woa_s = zeros(102,1);

for ii=1:102
    woa_s(ii) = sum(s_an(:,:,ii).*area(:,:,ii),[1,2])./total_area(ii);
end

save woa_s woa_s depth


toc()