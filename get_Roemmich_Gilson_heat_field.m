clear
close all
clc
tic()

name = 'RG_ArgoClim_Temperature_2019.nc';
names = 'RG_ArgoClim_Salinity_2019.nc';

ncdisp(name);

saltm = ncread(names,'ARGO_SALINITY_MEAN');
salta = ncread(names,'ARGO_SALINITY_ANOMALY');
longrg = ncread(name,'LONGITUDE');
latrg = ncread(name,'LATITUDE');
pres = ncread(name,'PRESSURE');
time = ncread(name,'TIME');
tempm = ncread(name,'ARGO_TEMPERATURE_MEAN');
tempa = ncread(name,'ARGO_TEMPERATURE_ANOMALY');
longrg = longrg(266:335);
latrg = latrg(1:40);
tempm = tempm(266:335,1:40,:);
tempa = tempa(266:335,1:40,:,157:168);
saltm = saltm(266:335,1:40,:);
salta = salta(266:335,1:40,:,157:168);

temp2017 = zeros(70,40,58,12);
temp2017 = zeros(70,40,58,12);

for ii=1:12
    temp2017(:,:,:,ii) = tempm + tempa(:,:,:,ii);
    salt2017(:,:,:,ii) = saltm + salta(:,:,:,ii);
end

z = gsw_z_from_p(pres,-50);
depthrg = -z;

save RGTS temp2017 salt2017 latrg longrg depthrg


toc()