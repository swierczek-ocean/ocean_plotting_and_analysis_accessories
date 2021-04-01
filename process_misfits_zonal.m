clear
close all
clc
tic()

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_3

nn = length(prof_lat);

[~,I] = sort(prof_lon);
prof_lat = prof_lat(I);
prof_Tdif = prof_Tdif(I,:);

prof_depth = prof_depth';
theta_zonal_3 = zeros(3334,97);
prof_lat_3 = zeros(3334,1);
counter = 1;

for ii=1:nn
    temp = prof_Tdif(ii,:);
    if sum(isnan(temp))<97
        theta_zonal_3(counter,:) = temp;
        prof_lat_3(counter) = prof_lat(ii);
        counter = counter + 1;
    end
end

save PROFILES/processed/theta_zonal_3 theta_zonal_3 prof_lat_3 prof_depth

clear

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_6

nn = length(prof_lat);

[~,I] = sort(prof_lon);
prof_lat = prof_lat(I);
prof_Tdif = prof_Tdif(I,:);

prof_depth = prof_depth';
theta_zonal_6 = zeros(3288,97);
prof_lat_6 = zeros(3288,1);
counter = 1;

for ii=1:nn
    temp = prof_Tdif(ii,:);
    if sum(isnan(temp))<97
        theta_zonal_6(counter,:) = temp;
        prof_lat_6(counter) = prof_lat(ii);
        counter = counter + 1;
    end
end

save PROFILES/processed/theta_zonal_6 theta_zonal_6 prof_lat_6 prof_depth

clear

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_12

nn = length(prof_lat);

[~,I] = sort(prof_lon);
prof_lat = prof_lat(I);
prof_Tdif = prof_Tdif(I,:);

prof_depth = prof_depth';
theta_zonal_12 = zeros(3008,97);
prof_lat_12 = zeros(3008,1);
counter = 1;

for ii=1:nn
    temp = prof_Tdif(ii,:);
    if sum(isnan(temp))<97
        theta_zonal_12(counter,:) = temp;
        prof_lat_12(counter) = prof_lat(ii);
        counter = counter + 1;
    end
end

save PROFILES/processed/theta_zonal_12 theta_zonal_12 prof_lat_12 prof_depth

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_3
ufac=1e6/1024.5;
nn = length(prof_lat);

[~,I] = sort(prof_lon);
prof_lat = prof_lat(I);
prof_DICdif = prof_DICdif(I,:);

prof_depth = prof_depth';
dic_zonal_3 = zeros(325,97);
prof_lat_3c = zeros(325,1);
counter = 1;

for ii=1:nn
    temp = prof_DICdif(ii,:);
    if sum(isnan(temp))<97
        dic_zonal_3(counter,:) = ufac.*temp;
        prof_lat_3c(counter) = prof_lat(ii);
        counter = counter + 1;
    end
end

save PROFILES/processed/dic_zonal_3 dic_zonal_3 prof_lat_3c prof_depth

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_6
ufac=1e6/1024.5;
nn = length(prof_lat);

[~,I] = sort(prof_lon);
prof_lat = prof_lat(I);
prof_DICdif = prof_DICdif(I,:);

prof_depth = prof_depth';
dic_zonal_6 = zeros(321,97);
prof_lat_6c = zeros(321,1);
counter = 1;

for ii=1:nn
    temp = prof_DICdif(ii,:);
    if sum(isnan(temp))<97
        dic_zonal_6(counter,:) = ufac.*temp;
        prof_lat_6c(counter) = prof_lat(ii);
        counter = counter + 1;
    end
end

save PROFILES/processed/dic_zonal_6 dic_zonal_6 prof_lat_6c prof_depth

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_12
ufac=1e6/1024.5;
nn = length(prof_lat);

[~,I] = sort(prof_lon);
prof_lat = prof_lat(I);
prof_DICdif = prof_DICdif(I,:);

prof_depth = prof_depth';
dic_zonal_12 = zeros(300,97);
prof_lat_12c = zeros(300,1);
counter = 1;

for ii=1:nn
    temp = prof_DICdif(ii,:);
    if sum(isnan(temp))<97
        dic_zonal_12(counter,:) = ufac.*temp;
        prof_lat_12c(counter) = prof_lat(ii);
        counter = counter + 1;
    end
end

save PROFILES/processed/dic_zonal_12 dic_zonal_12 prof_lat_12c prof_depth

clear








toc()