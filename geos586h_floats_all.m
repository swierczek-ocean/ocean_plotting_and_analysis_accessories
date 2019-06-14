clear 
close all
clc

tic()

latbound = -50;

str0 = 'USGO_SO_200';
str1 = 'USGO_SO_20';
str1w = 'USGO_WO_20';
str2 = 'VIZ_SO_20';
str3 = '_PFL_D.nc';
str4 = '_PFL.nc';

sd = 'prof_depth';
ss = 'prof_S';
st = 'prof_T';
slo = 'prof_lon';
sla = 'prof_lat';
sdt = 'prof_YYYYMMDD';
stf = 'prof_Tflag';

counter = 0;
profiles_temp = [];


for ii=5:18
    if ii<10
        time = ncread([str0,num2str(ii),str3],sdt);
        lat = ncread([str0,num2str(ii),str3],sla);
        lon = ncread([str0,num2str(ii),str3],slo);
        temp = ncread([str0,num2str(ii),str3],st);
        % time = time(lat<latbound);
        % lat = lat(lat<latbound);
        % lon = lon(lat<latbound);
        % temp = temp(1:7,lat<latbound)';
        temp = temp(1:7,:)';
        profiles_temp = [profiles_temp;time,lat,lon,temp];
        counter = counter+length(lat);
    elseif (ii>11)&&(ii<17)
        time = ncread([str1,num2str(ii),str3],sdt);
        lat = ncread([str1,num2str(ii),str3],sla);
        lon = ncread([str1,num2str(ii),str3],slo);
        temp = ncread([str1,num2str(ii),str3],st);
        % lat = lat(lat<latbound);
        % lon = lon(lat<latbound);
        % time = time(lat<latbound);
        % temp = temp(1:7,lat<latbound)';
        temp = temp(1:7,:)';
        profiles_temp = [profiles_temp;time,lat,lon,temp];        
        counter = counter+length(lat);
        time = ncread([str2,num2str(ii),str4],sdt);
        lat = ncread([str2,num2str(ii),str4],sla);
        lon = ncread([str2,num2str(ii),str4],slo);
        temp = ncread([str2,num2str(ii),str4],st);
        % lat = lat(lat<latbound);
        % lon = lon(lat<latbound);
        % time = time(lat<latbound);
        % temp = temp(1:7,lat<latbound)';
        temp = temp(1:7,:)';
        profiles_temp = [profiles_temp;time,lat,lon,temp];        
        counter = counter+length(lat);
    elseif ii==17
        time = ncread([str1w,num2str(ii),str3],sdt);
        lat = ncread([str1w,num2str(ii),str3],sla);
        lon = ncread([str1w,num2str(ii),str3],slo);
        temp = ncread([str1w,num2str(ii),str3],st);
        % lat = lat(lat<latbound);
        % lon = lon(lat<latbound);
        % time = time(lat<latbound);
        % temp = temp(1:7,lat<latbound)';
        temp = temp(1:7,:)';
        profiles_temp = [profiles_temp;time,lat,lon,temp];        
        counter = counter+length(lat);
        time = ncread([str2,num2str(ii),str4],sdt);
        lat = ncread([str2,num2str(ii),str4],sla);
        lon = ncread([str2,num2str(ii),str4],slo);
        temp = ncread([str2,num2str(ii),str4],st);
        % lat = lat(lat<latbound);
        % lon = lon(lat<latbound);
        % time = time(lat<latbound);
        % temp = temp(1:7,lat<latbound)';
        temp = temp(1:7,:)';
        profiles_temp = [profiles_temp;time,lat,lon,temp];        
        counter = counter+length(lat);   
    elseif ii==18
        time = ncread([str2,num2str(ii),str4],sdt);
        lat = ncread([str2,num2str(ii),str4],sla);
        lon = ncread([str2,num2str(ii),str4],slo);
        temp = ncread([str2,num2str(ii),str4],st);
        % lat = lat(lat<latbound);
        % lon = lon(lat<latbound);
        % time = time(lat<latbound);
        % temp = temp(1:7,lat<latbound)';
        temp = temp(1:7,:)';
        profiles_temp = [profiles_temp;time,lat,lon,temp];        
        counter = counter+length(lat);
    else
        time = ncread([str1,num2str(ii),str3],sdt);
        lat = ncread([str1,num2str(ii),str3],sla);
        lon = ncread([str1,num2str(ii),str3],slo);
        temp = ncread([str1,num2str(ii),str3],st);
        % lat = lat(lat<latbound);
        % lon = lon(lat<latbound);
        % time = time(lat<latbound);
        % temp = temp(1:7,lat<latbound)';
        temp = temp(1:7,:)';
        profiles_temp = [profiles_temp;time,lat,lon,temp];        
        counter = counter+length(lat);
    end    
    
end

profiles_temp = sortrows(profiles_temp,1);

[n,m] = size(profiles_temp);
profiles = [profiles_temp(:,1:3),zeros(n,1)];

for ii=1:n
    temp = profiles_temp(ii,4:10);
    profiles(ii,4) = mean(temp(temp~=-9999));  
end

profiles = profiles(isnan(profiles(:,4))==0,:);


clearvars -except profiles

save profiles











toc()