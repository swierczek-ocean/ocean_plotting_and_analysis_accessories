clear
close all
clc

tic()
acc_settings

str1 = 'deployment0001_GA02HYPM-WFP02-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_instrument_recovered_20150317T090900.048125-20151114T231726.999240.nc';
str1m = 'deployment0001_GA02HYPM-WFP02-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_metadata_recovered_20150318T040002-20151114T200002.nc';

str2 = 'deployment0002_GA02HYPM-WFP02-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_instrument_recovered_20151117T000003-20161104T161207.990278.nc';
str2m = 'deployment0002_GA02HYPM-WFP02-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_metadata_recovered_20151117T000003-20161104T160002.nc';

str3 = 'deployment0003_GA02HYPM-WFP02-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_instrument_recovered_20161030T000003-20171003T185844.999253.nc';
str3m = 'deployment0003_GA02HYPM-WFP02-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_metadata_recovered_20161030T000003-20171003T160002.nc';

str4 = 'deployment0001_GA02HYPM-WFP03-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_instrument_recovered_20150316T230003-20151115T143356.999133.nc';
str4m = 'deployment0001_GA02HYPM-WFP03-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_metadata_recovered_20150316T230003-20151115T120002.nc';

str5 = 'deployment0002_GA02HYPM-WFP03-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_instrument_recovered_20151117T040003-20161104T201210.987517.nc';
str5m = 'deployment0002_GA02HYPM-WFP03-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_metadata_recovered_20151117T040003-20161104T200002.nc';

str6 = 'deployment0003_GA02HYPM-WFP03-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_instrument_recovered_20161030T040003-20171225T093012.998520.nc';
str6m = 'deployment0003_GA02HYPM-WFP03-04-CTDPFL000-recovered_wfp-ctdpf_ckl_wfp_metadata_recovered_20161030T040003-20171225T080002.nc';

% ncdisp(str3);

str7 = 'ctdpf_ckl_seawater_pressure';
str8 = 'ctdpf_ckl_seawater_pressure_qc_executed';
str9 = 'ctdpf_ckl_seawater_pressure_qc_results';

str10 = 'ctdpf_ckl_seawater_temperature';
str11 = 'ctdpf_ckl_seawater_temperature_qc_executed';
str12 = 'ctdpf_ckl_seawater_temperature_qc_results';

str13 = 'practical_salinity';
str14 = 'practical_salinity_qc_executed';
str15 = 'practical_salinity_qc_results';

str16 = 'preferred_timestamp';

% QC_type = ncread(str1,str8);
% QC_type(1:20)
% 
% dec2bin(QC_type(1:20))
% 
% QC_result = ncread(str1,str8);
% QC_result(1:20)

Full_Array = zeros(18931402,5);

%% file 1
P_QC_ex = ncread(str1,str8);
P_QC_res = ncread(str1,str9);
T_QC_ex = ncread(str1,str11);
T_QC_res = ncread(str1,str12);
S_QC_ex = ncread(str1,str14);
S_QC_res = ncread(str1,str15);
P = ncread(str1,str7);
T = ncread(str1,str10);
S = ncread(str1,str13);
lat = ncread(str1,'lat');
lon = ncread(str1,'lon');
my_time = ncread(str1,'time');

QC = (P_QC_ex-P_QC_res)+(S_QC_ex-S_QC_res)+(T_QC_ex-T_QC_res);

length(QC)
lat = lat(QC==0);
lon = lon(QC==0);
max_lon = max(lon);
min_lon = min(lon);
max_lat = max(lat);
min_lat = min(lat);
P = P(QC==0);
T = T(QC==0);
S = S(QC==0);
my_time = my_time(QC==0);
my_time = acc_convert_time_19000101(my_time);
L1 = length(S);
depth = gsw_z_from_p(P,lat);

Full_Array(1:L1,:) = [my_time,T,S,P,depth];
%% end file 1

%% file 2
P_QC_ex = ncread(str2,str8);
P_QC_res = ncread(str2,str9);
T_QC_ex = ncread(str2,str11);
T_QC_res = ncread(str2,str12);
S_QC_ex = ncread(str2,str14);
S_QC_res = ncread(str2,str15);
P = ncread(str2,str7);
T = ncread(str2,str10);
S = ncread(str2,str13);
lat = ncread(str2,'lat');
lon = ncread(str2,'lon');
my_time = ncread(str2,'time');

QC = (P_QC_ex-P_QC_res)+(S_QC_ex-S_QC_res)+(T_QC_ex-T_QC_res);

length(QC)
lat = lat(QC==0);
lon = lon(QC==0);
if max(lon)>max_lon
    max_lon = max(lon);
end
if min(lon)<min_lon
    min_lon = min(lon);
end
if max(lat)>max_lat
    max_lat = max(lat);
end
if min(lat)<min_lat
    min_lat = min(lat);
end
P = P(QC==0);
T = T(QC==0);
S = S(QC==0);
my_time = my_time(QC==0);
my_time = acc_convert_time_19000101(my_time);
L2 = length(S);
depth = gsw_z_from_p(P,lat);

Full_Array((L1+1):(L1+L2),:) = [my_time,T,S,P,depth];
L1 = L1 + L2;
%% end file 2

%% file 3
P_QC_ex = ncread(str3,str8);
P_QC_res = ncread(str3,str9);
T_QC_ex = ncread(str3,str11);
T_QC_res = ncread(str3,str12);
S_QC_ex = ncread(str3,str14);
S_QC_res = ncread(str3,str15);
P = ncread(str3,str7);
T = ncread(str3,str10);
S = ncread(str3,str13);
lat = ncread(str3,'lat');
lon = ncread(str3,'lon');
my_time = ncread(str3,'time');

QC = (P_QC_ex-P_QC_res)+(S_QC_ex-S_QC_res)+(T_QC_ex-T_QC_res);

length(QC)
lat = lat(QC==0);
lon = lon(QC==0);
if max(lon)>max_lon
    max_lon = max(lon);
end
if min(lon)<min_lon
    min_lon = min(lon);
end
if max(lat)>max_lat
    max_lat = max(lat);
end
if min(lat)<min_lat
    min_lat = min(lat);
end
P = P(QC==0);
T = T(QC==0);
S = S(QC==0);
my_time = my_time(QC==0);
my_time = acc_convert_time_19000101(my_time);
L3 = length(S);
depth = gsw_z_from_p(P,lat);

Full_Array((L1+1):(L1+L3),:) = [my_time,T,S,P,depth];
L1 = L1 + L3;
%% end file 3

%% file 4
P_QC_ex = ncread(str4,str8);
P_QC_res = ncread(str4,str9);
T_QC_ex = ncread(str4,str11);
T_QC_res = ncread(str4,str12);
S_QC_ex = ncread(str4,str14);
S_QC_res = ncread(str4,str15);
P = ncread(str4,str7);
T = ncread(str4,str10);
S = ncread(str4,str13);
lat = ncread(str4,'lat');
lon = ncread(str4,'lon');
my_time = ncread(str4,'time');

QC = (P_QC_ex-P_QC_res)+(S_QC_ex-S_QC_res)+(T_QC_ex-T_QC_res);

length(QC)
lat = lat(QC==0);
lon = lon(QC==0);
if max(lon)>max_lon
    max_lon = max(lon);
end
if min(lon)<min_lon
    min_lon = min(lon);
end
if max(lat)>max_lat
    max_lat = max(lat);
end
if min(lat)<min_lat
    min_lat = min(lat);
end
P = P(QC==0);
T = T(QC==0);
S = S(QC==0);
my_time = my_time(QC==0);
my_time = acc_convert_time_19000101(my_time);
L4 = length(S);
depth = gsw_z_from_p(P,lat);

Full_Array((L1+1):(L1+L4),:) = [my_time,T,S,P,depth];
L1 = L1 + L4;
%% end file 4

%% file 5
P_QC_ex = ncread(str5,str8);
P_QC_res = ncread(str5,str9);
T_QC_ex = ncread(str5,str11);
T_QC_res = ncread(str5,str12);
S_QC_ex = ncread(str5,str14);
S_QC_res = ncread(str5,str15);
P = ncread(str5,str7);
T = ncread(str5,str10);
S = ncread(str5,str13);
lat = ncread(str5,'lat');
lon = ncread(str5,'lon');
my_time = ncread(str5,'time');

QC = (P_QC_ex-P_QC_res)+(S_QC_ex-S_QC_res)+(T_QC_ex-T_QC_res);

length(QC)
lat = lat(QC==0);
lon = lon(QC==0);
if max(lon)>max_lon
    max_lon = max(lon);
end
if min(lon)<min_lon
    min_lon = min(lon);
end
if max(lat)>max_lat
    max_lat = max(lat);
end
if min(lat)<min_lat
    min_lat = min(lat);
end
P = P(QC==0);
T = T(QC==0);
S = S(QC==0);
my_time = my_time(QC==0);
my_time = acc_convert_time_19000101(my_time);
L5 = length(S);
depth = gsw_z_from_p(P,lat);

Full_Array((L1+1):(L1+L5),:) = [my_time,T,S,P,depth];
L1 = L1 + L5;
%% end file 5

%% file 6
P_QC_ex = ncread(str6,str8);
P_QC_res = ncread(str6,str9);
T_QC_ex = ncread(str6,str11);
T_QC_res = ncread(str6,str12);
S_QC_ex = ncread(str6,str14);
S_QC_res = ncread(str6,str15);
P = ncread(str6,str7);
T = ncread(str6,str10);
S = ncread(str6,str13);
lat = ncread(str6,'lat');
lon = ncread(str6,'lon');
my_time = ncread(str6,'time');

QC = (P_QC_ex-P_QC_res)+(S_QC_ex-S_QC_res)+(T_QC_ex-T_QC_res);

length(QC)
lat = lat(QC==0);
lon = lon(QC==0);
if max(lon)>max_lon
    max_lon = max(lon);
end
if min(lon)<min_lon
    min_lon = min(lon);
end
if max(lat)>max_lat
    max_lat = max(lat);
end
if min(lat)<min_lat
    min_lat = min(lat);
end
P = P(QC==0);
T = T(QC==0);
S = S(QC==0);
my_time = my_time(QC==0);
my_time = acc_convert_time_19000101(my_time);
L6 = length(S);
depth = gsw_z_from_p(P,lat);

Full_Array((L1+1):(L1+L6),:) = [my_time,T,S,P,depth];
L1 = L1 + L6;
%% end file 6

num_obs = L1;

fprintf('max latitude is %g \n',max_lat);
fprintf('min latitude is %g \n',min_lat);
fprintf('max longitude is %g \n',max_lon);
fprintf('min longitude is %g \n',min_lon);

clearvars -except Full_Array

Full_Array = sortrows(Full_Array,1);


time = Full_Array(:,1);
T = Full_Array(:,2);
S = Full_Array(:,3);
P = Full_Array(:,4);
D = Full_Array(:,5);

clear Full_Array

t_low = min(time);
t_high = max(time);
depth_low = min(D);
depth_high = max(D);

my_D = floor(depth_low):35:ceil(depth_high);
my_time = ceil(t_low):0.5:ceil(t_high);

nn = length(my_time)
mm = length(my_D)

my_time(1)
my_time(end)
my_D(1)
my_D(end)

New_Array3 = zeros(mm,nn,3);

for ii=1:nn
    for jj=1:mm
        if ii==nn&&jj<mm
            ind1 = find(time>my_time(ii));
            ind3 = find(D>my_D(jj));
            ind4 = find(D<my_D(jj+1));
            ind6 = intersect(ind3,ind4);
            ind = intersect(ind1,ind6);
            mean(T(ind))
            
            New_Array3(jj,ii,1) = ...
                mean(T(ind));
            New_Array3(jj,ii,2) = ...
                mean(S(ind));
            New_Array3(jj,ii,3) = ...
                mean(P(ind));
            
            fprintf('finished binning depth %g and day %g \n \n',my_D(jj),my_time(ii)-my_time(1));
            
        elseif jj==mm&&ii<nn
            ind1 = find(time>my_time(ii));
            ind2 = find(time<my_time(ii+1));
            ind3 = find(D>my_D(jj));
            ind5 = intersect(ind1,ind2);
            ind = intersect(ind5,ind3);
            mean(T(ind))
            
            New_Array3(jj,ii,1) = ...
                mean(T(ind));
            New_Array3(jj,ii,2) = ...
                mean(S(ind));
            New_Array3(jj,ii,3) = ...
                mean(P(ind));
            
            fprintf('finished binning depth %g and day %g \n \n',my_D(jj),my_time(ii)-my_time(1));
            
        elseif ii==nn&&jj==mm
            ind1 = find(time>my_time(ii));
            ind3 = find(D>my_D(jj));
            ind = intersect(ind1,ind3);
            mean(T(ind))
            
            New_Array3(jj,ii,1) = ...
                mean(T(ind));
            New_Array3(jj,ii,2) = ...
                mean(S(ind));
            New_Array3(jj,ii,3) = ...
                mean(P(ind));
            
            fprintf('finished binning depth %g and day %g \n \n',my_D(jj),my_time(ii)-my_time(1));
            
        else
            
            ind1 = find(time>my_time(ii+1),1)-1;
            ind2 = find(time(1:ind1)>my_time(ii),1);
            
            
            temp_time = time(ind2:ind1);
            temp_T = T(ind2:ind1);
            temp_S = S(ind2:ind1);
            temp_D = D(ind2:ind1);
            temp_P = P(ind2:ind1);
            
            ind3 = find(temp_D>my_D(jj));
            ind4 = find(temp_D<my_D(jj+1));
            
            ind = intersect(ind3,ind4);
            
            mean(temp_T(ind))
            
            New_Array3(jj,ii,1) = ...
                mean(temp_T(ind));
            New_Array3(jj,ii,2) = ...
                mean(temp_S(ind));
            New_Array3(jj,ii,3) = ...
                mean(temp_P(ind));
            
            fprintf('finished binning depth %g and day %g \n \n',my_D(jj),my_time(ii)-my_time(1));
            
        end
    end
end


clearvars -except my_D my_time New_Array3
save New_Array3




toc()