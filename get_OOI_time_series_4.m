clear
close all
clc

tic()
% acc_settings

str1 = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG047-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str2 = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG047-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str3 = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG047-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str4 = 'deployment0001_GA03FLMA-RIM01-02-CTDMOH049-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str5 = 'deployment0002_GA03FLMA-RIM01-02-CTDMOH049-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str6 = 'deployment0003_GA03FLMA-RIM01-02-CTDMOH049-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str7 = 'deployment0001_GA03FLMA-RIM01-02-CTDMOH050-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str8 = 'deployment0002_GA03FLMA-RIM01-02-CTDMOH050-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str9 = 'deployment0003_GA03FLMA-RIM01-02-CTDMOH050-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str10 = 'deployment0001_GA03FLMA-RIM01-02-CTDMOH051-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str11 = 'deployment0002_GA03FLMA-RIM01-02-CTDMOH051-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str12 = 'deployment0003_GA03FLMA-RIM01-02-CTDMOH051-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str13 = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG067-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str14 = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG067-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str15 = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG067-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T124501.nc';
str16 = 'deployment0001_GA03FLMB-RIM01-02-CTDMOH069-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str17 = 'deployment0002_GA03FLMB-RIM01-02-CTDMOH069-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str18 = 'deployment0003_GA03FLMB-RIM01-02-CTDMOH069-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str19 = 'deployment0001_GA03FLMB-RIM01-02-CTDMOH070-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str20 = 'deployment0002_GA03FLMB-RIM01-02-CTDMOH070-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str21 = 'deployment0003_GA03FLMB-RIM01-02-CTDMOH070-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str22 = 'deployment0001_GA03FLMB-RIM01-02-CTDMOH071-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str23 = 'deployment0002_GA03FLMB-RIM01-02-CTDMOH071-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str24 = 'deployment0003_GA03FLMB-RIM01-02-CTDMOH071-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';

strla = 'lat';
strlo = 'lon';
strsqcr = 'practical_salinity_qc_results';
strsqce = 'practical_salinity_qc_executed';
strdqcr = 'density_qc_results';
strdqce = 'density_qc_executed';
strcqcr = 'ctdmo_seawater_conductivity_qc_results';
strcqce = 'ctdmo_seawater_conductivity_qc_executed';
strtqcr = 'ctdmo_seawater_temperature_qc_results';
strtqce = 'ctdmo_seawater_temperature_qc_executed';
strpqcr = 'ctdmo_seawater_pressure_qc_results';
strpqce = 'ctdmo_seawater_pressure_qc_executed';
strd = 'density';
strps = 'practical_salinity';
strsc = 'ctdmo_seawater_conductivity';
strst = 'ctdmo_seawater_temperature';
strp = 'ctdmo_seawater_pressure';
strt = 'temperature';
strtime = 'ctd_time';

array_a = zeros(395980,19);
array_b = zeros(393787,19);

%% 1
ps_qc_e = double(ncread(str1,strsqce));
ps_qc_r = double(ncread(str1,strsqcr));
d_qc_e = double(ncread(str1,strdqce));
d_qc_r = double(ncread(str1,strdqcr));
st_qc_e = double(ncread(str1,strtqce));
st_qc_r = double(ncread(str1,strtqcr));
p_qc_e = double(ncread(str1,strpqce));
p_qc_r = double(ncread(str1,strpqcr));
c_qc_e = double(ncread(str1,strcqce));
c_qc_r = double(ncread(str1,strcqcr));

time = ncread(str1,strtime);
temp = ncread(str1,strst);
salt = ncread(str1,strps);
dens = ncread(str1,strd);
pres = ncread(str1,strp);
lat = ncread(str1,strla);
lon = ncread(str1,strlo);


QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);


len1 = length(QC);

max_lon_a = max(lon);
min_lon_a = min(lon);
max_lat_a = max(lat);
min_lat_a = min(lat);

depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

fprintf('%g total measurements \n \n',len1);

L1 = len1;

array_a(1:L1,:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 2
ps_qc_e = double(ncread(str2,strsqce));
ps_qc_r = double(ncread(str2,strsqcr));
d_qc_e = double(ncread(str2,strdqce));
d_qc_r = double(ncread(str2,strdqcr));
st_qc_e = double(ncread(str2,strtqce));
st_qc_r = double(ncread(str2,strtqcr));
p_qc_e = double(ncread(str2,strpqce));
p_qc_r = double(ncread(str2,strpqcr));
c_qc_e = double(ncread(str2,strcqce));
c_qc_r = double(ncread(str2,strcqcr));

time = ncread(str2,strtime);
temp = ncread(str2,strst);
salt = ncread(str2,strps);
dens = ncread(str2,strd);
pres = ncread(str2,strp);
lat = ncread(str2,strla);
lon = ncread(str2,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);

depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L2 = len1 + L1;

array_a((L1+1):(L1+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 3
ps_qc_e = double(ncread(str3,strsqce));
ps_qc_r = double(ncread(str3,strsqcr));
d_qc_e = double(ncread(str3,strdqce));
d_qc_r = double(ncread(str3,strdqcr));
st_qc_e = double(ncread(str3,strtqce));
st_qc_r = double(ncread(str3,strtqcr));
p_qc_e = double(ncread(str3,strpqce));
p_qc_r = double(ncread(str3,strpqcr));
c_qc_e = double(ncread(str3,strcqce));
c_qc_r = double(ncread(str3,strcqcr));

time = ncread(str3,strtime);
temp = ncread(str3,strst);
salt = ncread(str3,strps);
dens = ncread(str3,strd);
pres = ncread(str3,strp);
lat = ncread(str3,strla);
lon = ncread(str3,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L3 = len1 + L2;

array_a((L2+1):(L2+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 4
ps_qc_e = double(ncread(str4,strsqce));
ps_qc_r = double(ncread(str4,strsqcr));
d_qc_e = double(ncread(str4,strdqce));
d_qc_r = double(ncread(str4,strdqcr));
st_qc_e = double(ncread(str4,strtqce));
st_qc_r = double(ncread(str4,strtqcr));
p_qc_e = double(ncread(str4,strpqce));
p_qc_r = double(ncread(str4,strpqcr));
c_qc_e = double(ncread(str4,strcqce));
c_qc_r = double(ncread(str4,strcqcr));

time = ncread(str4,strtime);
temp = ncread(str4,strst);
salt = ncread(str4,strps);
dens = ncread(str4,strd);
pres = ncread(str4,strp);
lat = ncread(str4,strla);
lon = ncread(str4,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L4 = len1 + L3;

array_a((L3+1):(L3+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 5
ps_qc_e = double(ncread(str5,strsqce));
ps_qc_r = double(ncread(str5,strsqcr));
d_qc_e = double(ncread(str5,strdqce));
d_qc_r = double(ncread(str5,strdqcr));
st_qc_e = double(ncread(str5,strtqce));
st_qc_r = double(ncread(str5,strtqcr));
p_qc_e = double(ncread(str5,strpqce));
p_qc_r = double(ncread(str5,strpqcr));
c_qc_e = double(ncread(str5,strcqce));
c_qc_r = double(ncread(str5,strcqcr));

time = ncread(str5,strtime);
temp = ncread(str5,strst);
salt = ncread(str5,strps);
dens = ncread(str5,strd);
pres = ncread(str5,strp);
lat = ncread(str5,strla);
lon = ncread(str5,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L5 = len1 + L4;

array_a((L4+1):(L4+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 6
ps_qc_e = double(ncread(str6,strsqce));
ps_qc_r = double(ncread(str6,strsqcr));
d_qc_e = double(ncread(str6,strdqce));
d_qc_r = double(ncread(str6,strdqcr));
st_qc_e = double(ncread(str6,strtqce));
st_qc_r = double(ncread(str6,strtqcr));
p_qc_e = double(ncread(str6,strpqce));
p_qc_r = double(ncread(str6,strpqcr));
c_qc_e = double(ncread(str6,strcqce));
c_qc_r = double(ncread(str6,strcqcr));

time = ncread(str6,strtime);
temp = ncread(str6,strst);
salt = ncread(str6,strps);
dens = ncread(str6,strd);
pres = ncread(str6,strp);
lat = ncread(str6,strla);
lon = ncread(str6,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L6 = len1 + L5;

array_a((L5+1):(L5+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 7
ps_qc_e = double(ncread(str7,strsqce));
ps_qc_r = double(ncread(str7,strsqcr));
d_qc_e = double(ncread(str7,strdqce));
d_qc_r = double(ncread(str7,strdqcr));
st_qc_e = double(ncread(str7,strtqce));
st_qc_r = double(ncread(str7,strtqcr));
p_qc_e = double(ncread(str7,strpqce));
p_qc_r = double(ncread(str7,strpqcr));
c_qc_e = double(ncread(str7,strcqce));
c_qc_r = double(ncread(str7,strcqcr));

time = ncread(str7,strtime);
temp = ncread(str7,strst);
salt = ncread(str7,strps);
dens = ncread(str7,strd);
pres = ncread(str7,strp);
lat = ncread(str7,strla);
lon = ncread(str7,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L7 = len1 + L6;

array_a((L6+1):(L6+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 8
ps_qc_e = double(ncread(str8,strsqce));
ps_qc_r = double(ncread(str8,strsqcr));
d_qc_e = double(ncread(str8,strdqce));
d_qc_r = double(ncread(str8,strdqcr));
st_qc_e = double(ncread(str8,strtqce));
st_qc_r = double(ncread(str8,strtqcr));
p_qc_e = double(ncread(str8,strpqce));
p_qc_r = double(ncread(str8,strpqcr));
c_qc_e = double(ncread(str8,strcqce));
c_qc_r = double(ncread(str8,strcqcr));

time = ncread(str8,strtime);
temp = ncread(str8,strst);
salt = ncread(str8,strps);
dens = ncread(str8,strd);
pres = ncread(str8,strp);
lat = ncread(str8,strla);
lon = ncread(str8,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L8 = len1 + L7;

array_a((L7+1):(L7+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 9
ps_qc_e = double(ncread(str9,strsqce));
ps_qc_r = double(ncread(str9,strsqcr));
d_qc_e = double(ncread(str9,strdqce));
d_qc_r = double(ncread(str9,strdqcr));
st_qc_e = double(ncread(str9,strtqce));
st_qc_r = double(ncread(str9,strtqcr));
p_qc_e = double(ncread(str9,strpqce));
p_qc_r = double(ncread(str9,strpqcr));
c_qc_e = double(ncread(str9,strcqce));
c_qc_r = double(ncread(str9,strcqcr));

time = ncread(str9,strtime);
temp = ncread(str9,strst);
salt = ncread(str9,strps);
dens = ncread(str9,strd);
pres = ncread(str9,strp);
lat = ncread(str9,strla);
lon = ncread(str9,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L9 = len1 + L8;

array_a((L8+1):(L8+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 10
ps_qc_e = double(ncread(str10,strsqce));
ps_qc_r = double(ncread(str10,strsqcr));
d_qc_e = double(ncread(str10,strdqce));
d_qc_r = double(ncread(str10,strdqcr));
st_qc_e = double(ncread(str10,strtqce));
st_qc_r = double(ncread(str10,strtqcr));
p_qc_e = double(ncread(str10,strpqce));
p_qc_r = double(ncread(str10,strpqcr));
c_qc_e = double(ncread(str10,strcqce));
c_qc_r = double(ncread(str10,strcqcr));

time = ncread(str10,strtime);
temp = ncread(str10,strst);
salt = ncread(str10,strps);
dens = ncread(str10,strd);
pres = ncread(str10,strp);
lat = ncread(str10,strla);
lon = ncread(str10,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L10 = len1 + L9;

array_a((L9+1):(L9+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 11
ps_qc_e = double(ncread(str11,strsqce));
ps_qc_r = double(ncread(str11,strsqcr));
d_qc_e = double(ncread(str11,strdqce));
d_qc_r = double(ncread(str11,strdqcr));
st_qc_e = double(ncread(str11,strtqce));
st_qc_r = double(ncread(str11,strtqcr));
p_qc_e = double(ncread(str11,strpqce));
p_qc_r = double(ncread(str11,strpqcr));
c_qc_e = double(ncread(str11,strcqce));
c_qc_r = double(ncread(str11,strcqcr));

time = ncread(str11,strtime);
temp = ncread(str11,strst);
salt = ncread(str11,strps);
dens = ncread(str11,strd);
pres = ncread(str11,strp);
lat = ncread(str11,strla);
lon = ncread(str11,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L11 = len1 + L10;

array_a((L10+1):(L10+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 12
ps_qc_e = double(ncread(str12,strsqce));
ps_qc_r = double(ncread(str12,strsqcr));
d_qc_e = double(ncread(str12,strdqce));
d_qc_r = double(ncread(str12,strdqcr));
st_qc_e = double(ncread(str12,strtqce));
st_qc_r = double(ncread(str12,strtqcr));
p_qc_e = double(ncread(str12,strpqce));
p_qc_r = double(ncread(str12,strpqcr));
c_qc_e = double(ncread(str12,strcqce));
c_qc_r = double(ncread(str12,strcqcr));

time = ncread(str12,strtime);
temp = ncread(str12,strst);
salt = ncread(str12,strps);
dens = ncread(str12,strd);
pres = ncread(str12,strp);
lat = ncread(str12,strla);
lon = ncread(str12,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_a
    max_lon_a = max(lon);
end
if min(lon)<min_lon_a
    min_lon_a = min(lon);
end
if max(lat)>max_lat_a
    max_lat_a = max(lat);
end
if min(lat)<min_lat_a
    min_lat_a = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L12 = len1 + L11;

array_a((L11+1):(L11+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

L12a = L12;


%% 1
ps_qc_e = double(ncread(str13,strsqce));
ps_qc_r = double(ncread(str13,strsqcr));
d_qc_e = double(ncread(str13,strdqce));
d_qc_r = double(ncread(str13,strdqcr));
st_qc_e = double(ncread(str13,strtqce));
st_qc_r = double(ncread(str13,strtqcr));
p_qc_e = double(ncread(str13,strpqce));
p_qc_r = double(ncread(str13,strpqcr));
c_qc_e = double(ncread(str13,strcqce));
c_qc_r = double(ncread(str13,strcqcr));

time = ncread(str13,strtime);
temp = ncread(str13,strst);
salt = ncread(str13,strps);
dens = ncread(str13,strd);
pres = ncread(str13,strp);
lat = ncread(str13,strla);
lon = ncread(str13,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
max_lon_b = max(lon);
min_lon_b = min(lon);
max_lat_b = max(lat);
min_lat_b = min(lat);

depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);
 


fprintf('%g total measurements \n \n',len1);

L1 = len1;

array_b(1:L1,:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 2
ps_qc_e = double(ncread(str14,strsqce));
ps_qc_r = double(ncread(str14,strsqcr));
d_qc_e = double(ncread(str14,strdqce));
d_qc_r = double(ncread(str14,strdqcr));
st_qc_e = double(ncread(str14,strtqce));
st_qc_r = double(ncread(str14,strtqcr));
p_qc_e = double(ncread(str14,strpqce));
p_qc_r = double(ncread(str14,strpqcr));
c_qc_e = double(ncread(str14,strcqce));
c_qc_r = double(ncread(str14,strcqcr));

time = ncread(str14,strtime);
temp = ncread(str14,strst);
salt = ncread(str14,strps);
dens = ncread(str14,strd);
pres = ncread(str14,strp);
lat = ncread(str14,strla);
lon = ncread(str14,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L2 = len1 + L1;

array_b((L1+1):(L1+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 3
ps_qc_e = double(ncread(str15,strsqce));
ps_qc_r = double(ncread(str15,strsqcr));
d_qc_e = double(ncread(str15,strdqce));
d_qc_r = double(ncread(str15,strdqcr));
st_qc_e = double(ncread(str15,strtqce));
st_qc_r = double(ncread(str15,strtqcr));
p_qc_e = double(ncread(str15,strpqce));
p_qc_r = double(ncread(str15,strpqcr));
c_qc_e = double(ncread(str15,strcqce));
c_qc_r = double(ncread(str15,strcqcr));

time = ncread(str15,strtime);
temp = ncread(str15,strst);
salt = ncread(str15,strps);
dens = ncread(str15,strd);
pres = ncread(str15,strp);
lat = ncread(str15,strla);
lon = ncread(str15,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L3 = len1 + L2;

array_b((L2+1):(L2+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 4
ps_qc_e = double(ncread(str16,strsqce));
ps_qc_r = double(ncread(str16,strsqcr));
d_qc_e = double(ncread(str16,strdqce));
d_qc_r = double(ncread(str16,strdqcr));
st_qc_e = double(ncread(str16,strtqce));
st_qc_r = double(ncread(str16,strtqcr));
p_qc_e = double(ncread(str16,strpqce));
p_qc_r = double(ncread(str16,strpqcr));
c_qc_e = double(ncread(str16,strcqce));
c_qc_r = double(ncread(str16,strcqcr));

time = ncread(str16,strtime);
temp = ncread(str16,strst);
salt = ncread(str16,strps);
dens = ncread(str16,strd);
pres = ncread(str16,strp);
lat = ncread(str16,strla);
lon = ncread(str16,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L4 = len1 + L3;

array_b((L3+1):(L3+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 5
ps_qc_e = double(ncread(str17,strsqce));
ps_qc_r = double(ncread(str17,strsqcr));
d_qc_e = double(ncread(str17,strdqce));
d_qc_r = double(ncread(str17,strdqcr));
st_qc_e = double(ncread(str17,strtqce));
st_qc_r = double(ncread(str17,strtqcr));
p_qc_e = double(ncread(str17,strpqce));
p_qc_r = double(ncread(str17,strpqcr));
c_qc_e = double(ncread(str17,strcqce));
c_qc_r = double(ncread(str17,strcqcr));

time = ncread(str17,strtime);
temp = ncread(str17,strst);
salt = ncread(str17,strps);
dens = ncread(str17,strd);
pres = ncread(str17,strp);
lat = ncread(str17,strla);
lon = ncread(str17,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L5 = len1 + L4;

array_b((L4+1):(L4+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 6
ps_qc_e = double(ncread(str18,strsqce));
ps_qc_r = double(ncread(str18,strsqcr));
d_qc_e = double(ncread(str18,strdqce));
d_qc_r = double(ncread(str18,strdqcr));
st_qc_e = double(ncread(str18,strtqce));
st_qc_r = double(ncread(str18,strtqcr));
p_qc_e = double(ncread(str18,strpqce));
p_qc_r = double(ncread(str18,strpqcr));
c_qc_e = double(ncread(str18,strcqce));
c_qc_r = double(ncread(str18,strcqcr));

time = ncread(str18,strtime);
temp = ncread(str18,strst);
salt = ncread(str18,strps);
dens = ncread(str18,strd);
pres = ncread(str18,strp);
lat = ncread(str18,strla);
lon = ncread(str18,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L6 = len1 + L5;

array_b((L5+1):(L5+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 7
ps_qc_e = double(ncread(str19,strsqce));
ps_qc_r = double(ncread(str19,strsqcr));
d_qc_e = double(ncread(str19,strdqce));
d_qc_r = double(ncread(str19,strdqcr));
st_qc_e = double(ncread(str19,strtqce));
st_qc_r = double(ncread(str19,strtqcr));
p_qc_e = double(ncread(str19,strpqce));
p_qc_r = double(ncread(str19,strpqcr));
c_qc_e = double(ncread(str19,strcqce));
c_qc_r = double(ncread(str19,strcqcr));

time = ncread(str19,strtime);
temp = ncread(str19,strst);
salt = ncread(str19,strps);
dens = ncread(str19,strd);
pres = ncread(str19,strp);
lat = ncread(str19,strla);
lon = ncread(str19,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L7 = len1 + L6;

array_b((L6+1):(L6+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 8
ps_qc_e = double(ncread(str20,strsqce));
ps_qc_r = double(ncread(str20,strsqcr));
d_qc_e = double(ncread(str20,strdqce));
d_qc_r = double(ncread(str20,strdqcr));
st_qc_e = double(ncread(str20,strtqce));
st_qc_r = double(ncread(str20,strtqcr));
p_qc_e = double(ncread(str20,strpqce));
p_qc_r = double(ncread(str20,strpqcr));
c_qc_e = double(ncread(str20,strcqce));
c_qc_r = double(ncread(str20,strcqcr));

time = ncread(str20,strtime);
temp = ncread(str20,strst);
salt = ncread(str20,strps);
dens = ncread(str20,strd);
pres = ncread(str20,strp);
lat = ncread(str20,strla);
lon = ncread(str20,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L8 = len1 + L7;

array_b((L7+1):(L7+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 9
ps_qc_e = double(ncread(str21,strsqce));
ps_qc_r = double(ncread(str21,strsqcr));
d_qc_e = double(ncread(str21,strdqce));
d_qc_r = double(ncread(str21,strdqcr));
st_qc_e = double(ncread(str21,strtqce));
st_qc_r = double(ncread(str21,strtqcr));
p_qc_e = double(ncread(str21,strpqce));
p_qc_r = double(ncread(str21,strpqcr));
c_qc_e = double(ncread(str21,strcqce));
c_qc_r = double(ncread(str21,strcqcr));

time = ncread(str21,strtime);
temp = ncread(str21,strst);
salt = ncread(str21,strps);
dens = ncread(str21,strd);
pres = ncread(str21,strp);
lat = ncread(str21,strla);
lon = ncread(str21,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L9 = len1 + L8;

array_b((L8+1):(L8+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 10
ps_qc_e = double(ncread(str22,strsqce));
ps_qc_r = double(ncread(str22,strsqcr));
d_qc_e = double(ncread(str22,strdqce));
d_qc_r = double(ncread(str22,strdqcr));
st_qc_e = double(ncread(str22,strtqce));
st_qc_r = double(ncread(str22,strtqcr));
p_qc_e = double(ncread(str22,strpqce));
p_qc_r = double(ncread(str22,strpqcr));
c_qc_e = double(ncread(str22,strcqce));
c_qc_r = double(ncread(str22,strcqcr));

time = ncread(str22,strtime);
temp = ncread(str22,strst);
salt = ncread(str22,strps);
dens = ncread(str22,strd);
pres = ncread(str22,strp);
lat = ncread(str22,strla);
lon = ncread(str22,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L10 = len1 + L9;

array_b((L9+1):(L9+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 11
ps_qc_e = double(ncread(str23,strsqce));
ps_qc_r = double(ncread(str23,strsqcr));
d_qc_e = double(ncread(str23,strdqce));
d_qc_r = double(ncread(str23,strdqcr));
st_qc_e = double(ncread(str23,strtqce));
st_qc_r = double(ncread(str23,strtqcr));
p_qc_e = double(ncread(str23,strpqce));
p_qc_r = double(ncread(str23,strpqcr));
c_qc_e = double(ncread(str23,strcqce));
c_qc_r = double(ncread(str23,strcqcr));

time = ncread(str23,strtime);
temp = ncread(str23,strst);
salt = ncread(str23,strps);
dens = ncread(str23,strd);
pres = ncread(str23,strp);
lat = ncread(str23,strla);
lon = ncread(str23,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L11 = len1 + L10;

array_b((L10+1):(L10+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

%% 12
ps_qc_e = double(ncread(str24,strsqce));
ps_qc_r = double(ncread(str24,strsqcr));
d_qc_e = double(ncread(str24,strdqce));
d_qc_r = double(ncread(str24,strdqcr));
st_qc_e = double(ncread(str24,strtqce));
st_qc_r = double(ncread(str24,strtqcr));
p_qc_e = double(ncread(str24,strpqce));
p_qc_r = double(ncread(str24,strpqcr));
c_qc_e = double(ncread(str24,strcqce));
c_qc_r = double(ncread(str24,strcqcr));

time = ncread(str24,strtime);
temp = ncread(str24,strst);
salt = ncread(str24,strps);
dens = ncread(str24,strd);
pres = ncread(str24,strp);
lat = ncread(str24,strla);
lon = ncread(str24,strlo);

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+...
    (c_qc_e-c_qc_r);

len1 = length(QC);
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

if max(lon)>max_lon_b
    max_lon_b = max(lon);
end
if min(lon)<min_lon_b
    min_lon_b = min(lon);
end
if max(lat)>max_lat_b
    max_lat_b = max(lat);
end
if min(lat)<min_lat_b
    min_lat_b = min(lat);
end



fprintf('%g total measurements \n \n',len1);

L12 = len1 + L11;

array_b((L11+1):(L11+len1),:) = [time,lat,lon,temp,salt,pres,dens,depth,st_qc_e,st_qc_r,...
    ps_qc_e,ps_qc_r,p_qc_e,p_qc_r,d_qc_e,d_qc_r,c_qc_e,c_qc_r,QC];
%% 

L12b = L12;

mean_lat_a = mean(array_a(:,2));
mean_lon_a = mean(array_a(:,3));
mean_lat_b = mean(array_b(:,2));
mean_lon_b = mean(array_b(:,3));

clearvars -except array_a array_b *_lon_* *_lat_*

save array_qc



toc()