clear
close all
clc
tic()

name = 'RG_ArgoClim_Temperature_2019.nc';

ncdisp(name);

long = ncread(name,'LONGITUDE');
lat = ncread(name,'LATITUDE');
pres = ncread(name,'PRESSURE');
time = ncread(name,'TIME');
tempm = ncread(name,'ARGO_TEMPERATURE_MEAN');
tempa = ncread(name,'ARGO_TEMPERATURE_ANOMALY');
bmask = ncread(name,'BATHYMETRY_MASK');
mmask = ncread(name,'MAPPING_MASK');
long = long(271:325);
lat = lat(11:31);
bmask = bmask(271:325,11:31,:);
bmask(isnan(bmask)==1) = 0;
tempm = tempm(271:325,11:31,:);
tempa = tempa(271:325,11:31,:,157:168);

temp2017 = zeros(55,21,58,12);

for ii=1:12
    temp2017(:,:,:,ii) = tempm + tempa(:,:,:,ii);
end

temp2017m = mean(temp2017,4);
temp2017m(isnan(temp2017m)==1) = 0;
area = zeros(size(temp2017m));
total_area = zeros(58,1);
z = gsw_z_from_p(pres,-50);
depthrg = -z;

for ii=1:55
    for jj=1:21
        if bmask(ii,jj,58)==0
            bmask(ii,jj,:) = 0;
        end
        for kk=1:58
            area(ii,jj,kk) = area_degree(lat(jj),1,1)*bmask(ii,jj,kk);
        end
    end
end

rgt = zeros(58,1);

for kk=1:58
    total_area(kk) = sum(area(:,:,kk),[1,2]);
    rgt(kk) = sum(temp2017m(:,:,kk).*area(:,:,kk),[1,2])./total_area(kk);
end

save rgt rgt depthrg


toc()