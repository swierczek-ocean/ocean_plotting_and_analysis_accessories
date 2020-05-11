clear
close all
clc
tic()

name = 'RG_ArgoClim_Salinity_2019.nc';

ncdisp(name);

long = ncread(name,'LONGITUDE');
lat = ncread(name,'LATITUDE');
pres = ncread(name,'PRESSURE');
time = ncread(name,'TIME');
saltm = ncread(name,'ARGO_SALINITY_MEAN');
salta = ncread(name,'ARGO_SALINITY_ANOMALY');
bmask = ncread(name,'BATHYMETRY_MASK');
mmask = ncread(name,'MAPPING_MASK');
long = long(271:325);
lat = lat(11:31);
bmask = bmask(271:325,11:31,:);
bmask(isnan(bmask)==1) = 0;
saltm = saltm(271:325,11:31,:);
salta = salta(271:325,11:31,:,157:168);

salt2017 = zeros(55,21,58,12);

for ii=1:12
    salt2017(:,:,:,ii) = saltm + salta(:,:,:,ii);
end

salt2017(isnan(salt2017)==1) = 0;
area = zeros(55,21,58);
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

rgs = zeros(58,12);

for jj=1:12
    for kk=1:58
        total_area(kk) = sum(area(:,:,kk),[1,2]);
        rgs(kk,jj) = sum(salt2017(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
    end
end

rgsm = mean(rgs,2);
save rgs rgs depthrg rgsm


toc()