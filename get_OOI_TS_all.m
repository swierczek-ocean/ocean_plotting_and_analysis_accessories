clear
close all
clc

tic()

str1a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG040-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str2a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG041-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str3a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG042-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str4a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG043-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str5a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG044-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str6a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG045-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str7a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG046-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str8a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG047-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str9a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOG048-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str10a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOH049-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str11a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOH050-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str12a = 'deployment0001_GA03FLMA-RIM01-02-CTDMOH051-recovered_inst-ctdmo_ghqr_instrument_recovered_20150317T194501-20151122T120001.nc';
str13a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG060-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str14a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG061-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str15a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG062-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str16a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG063-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str17a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG064-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str18a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG065-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str19a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG066-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str20a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG067-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str21a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOG068-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str22a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOH069-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str23a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOH070-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';
str24a = 'deployment0001_GA03FLMB-RIM01-02-CTDMOH071-recovered_inst-ctdmo_ghqr_instrument_recovered_20150321T023001-20151118T111501.nc';

str1b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG040-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str2b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG041-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str3b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG042-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str4b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG043-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str5b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG044-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str6b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG045-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str7b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG046-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str8b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG047-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str9b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOG048-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str10b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOH049-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str11b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOH050-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str12b = 'deployment0002_GA03FLMA-RIM01-02-CTDMOH051-recovered_inst-ctdmo_ghqr_instrument_recovered_20151125T193001-20161105T184501.nc';
str13b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG060-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str14b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG061-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str15b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG062-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str16b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG063-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str17b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG064-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str18b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG065-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str19b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG066-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str20b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG067-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str21b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOG068-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str22b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOH069-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str23b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOH070-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';
str24b = 'deployment0002_GA03FLMB-RIM01-02-CTDMOH071-recovered_inst-ctdmo_ghqr_instrument_recovered_20151121T220001-20161101T100001.nc';

str1c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG040-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str2c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG041-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str3c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG042-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str4c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG043-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str5c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG044-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str6c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG045-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str7c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG046-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str8c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG047-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str9c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOG048-recovered_inst-ctdmo_ghqr_instrument_recovered_20161101T061501-20180109T120001.nc';
str10c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOH049-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str11c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOH050-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str12c = 'deployment0003_GA03FLMA-RIM01-02-CTDMOH051-recovered_inst-ctdmo_ghqr_instrument_recovered_20161030T233001-20180109T120001.nc';
str13c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG060-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str14c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG061-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str15c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG062-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str16c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG063-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str17c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG064-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str18c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG065-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str19c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG066-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T124501.nc';
str20c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG067-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T124501.nc';
str21c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOG068-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str22c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOH069-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str23c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOH070-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';
str24c = 'deployment0003_GA03FLMB-RIM01-02-CTDMOH071-recovered_inst-ctdmo_ghqr_instrument_recovered_20161031T224501-20180112T130001.nc';





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

str_key = '[time,lat,lon,temp,salt,pres,dens,depth,QC]';

%% 1
ps_qc_e = [ncread(str1a,strsqce);ncread(str1b,strsqce);ncread(str1c,strsqce)];
ps_qc_r = [ncread(str1a,strsqcr);ncread(str1b,strsqcr);ncread(str1c,strsqcr)];
d_qc_e = [ncread(str1a,strdqce);ncread(str1b,strdqce);ncread(str1c,strdqce)];
d_qc_r = [ncread(str1a,strdqcr);ncread(str1b,strdqcr);ncread(str1c,strdqcr)];
st_qc_e = [ncread(str1a,strtqce);ncread(str1b,strtqce);ncread(str1c,strtqce)];
st_qc_r = [ncread(str1a,strtqcr);ncread(str1b,strtqcr);ncread(str1c,strtqcr)];
p_qc_e = [ncread(str1a,strpqce);ncread(str1b,strpqce);ncread(str1c,strpqce)];
p_qc_r = [ncread(str1a,strpqcr);ncread(str1b,strpqcr);ncread(str1c,strpqcr)];
c_qc_e = [ncread(str1a,strcqce);ncread(str1b,strcqce);ncread(str1c,strcqce)];
c_qc_r = [ncread(str1a,strcqcr);ncread(str1b,strcqcr);ncread(str1c,strcqcr)];

time = [ncread(str1a,strtime);ncread(str1b,strtime);ncread(str1c,strtime)];
temp = [ncread(str1a,strst);ncread(str1b,strst);ncread(str1c,strst)];
salt = [ncread(str1a,strps);ncread(str1b,strps);ncread(str1c,strps)];
dens = [ncread(str1a,strd);ncread(str1b,strd);ncread(str1c,strd)];
pres = [ncread(str1a,strp);ncread(str1b,strp);ncread(str1c,strp)];
lat = [ncread(str1a,strla);ncread(str1b,strla);ncread(str1c,strla)];
lon = [ncread(str1a,strlo);ncread(str1b,strlo);ncread(str1c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_30mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_30mA_dep123 = sortrows(GA_OOI_CTD_30mA_dep123,1);

save GA_OOI_CTD_30mA_dep123 GA_OOI_CTD_30mA_dep123 str_key str1a
%% 

%% 2
ps_qc_e = [ncread(str2a,strsqce);ncread(str2b,strsqce);ncread(str2c,strsqce)];
ps_qc_r = [ncread(str2a,strsqcr);ncread(str2b,strsqcr);ncread(str2c,strsqcr)];
d_qc_e = [ncread(str2a,strdqce);ncread(str2b,strdqce);ncread(str2c,strdqce)];
d_qc_r = [ncread(str2a,strdqcr);ncread(str2b,strdqcr);ncread(str2c,strdqcr)];
st_qc_e = [ncread(str2a,strtqce);ncread(str2b,strtqce);ncread(str2c,strtqce)];
st_qc_r = [ncread(str2a,strtqcr);ncread(str2b,strtqcr);ncread(str2c,strtqcr)];
p_qc_e = [ncread(str2a,strpqce);ncread(str2b,strpqce);ncread(str2c,strpqce)];
p_qc_r = [ncread(str2a,strpqcr);ncread(str2b,strpqcr);ncread(str2c,strpqcr)];
c_qc_e = [ncread(str2a,strcqce);ncread(str2b,strcqce);ncread(str2c,strcqce)];
c_qc_r = [ncread(str2a,strcqcr);ncread(str2b,strcqcr);ncread(str2c,strcqcr)];

time = [ncread(str2a,strtime);ncread(str2b,strtime);ncread(str2c,strtime)];
temp = [ncread(str2a,strst);ncread(str2b,strst);ncread(str2c,strst)];
salt = [ncread(str2a,strps);ncread(str2b,strps);ncread(str2c,strps)];
dens = [ncread(str2a,strd);ncread(str2b,strd);ncread(str2c,strd)];
pres = [ncread(str2a,strp);ncread(str2b,strp);ncread(str2c,strp)];
lat = [ncread(str2a,strla);ncread(str2b,strla);ncread(str2c,strla)];
lon = [ncread(str2a,strlo);ncread(str2b,strlo);ncread(str2c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_40mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_40mA_dep123 = sortrows(GA_OOI_CTD_40mA_dep123,1);

save GA_OOI_CTD_40mA_dep123 GA_OOI_CTD_40mA_dep123 str_key str2a
%% 

%% 3
ps_qc_e = [ncread(str3a,strsqce);ncread(str3b,strsqce);ncread(str3c,strsqce)];
ps_qc_r = [ncread(str3a,strsqcr);ncread(str3b,strsqcr);ncread(str3c,strsqcr)];
d_qc_e = [ncread(str3a,strdqce);ncread(str3b,strdqce);ncread(str3c,strdqce)];
d_qc_r = [ncread(str3a,strdqcr);ncread(str3b,strdqcr);ncread(str3c,strdqcr)];
st_qc_e = [ncread(str3a,strtqce);ncread(str3b,strtqce);ncread(str3c,strtqce)];
st_qc_r = [ncread(str3a,strtqcr);ncread(str3b,strtqcr);ncread(str3c,strtqcr)];
p_qc_e = [ncread(str3a,strpqce);ncread(str3b,strpqce);ncread(str3c,strpqce)];
p_qc_r = [ncread(str3a,strpqcr);ncread(str3b,strpqcr);ncread(str3c,strpqcr)];
c_qc_e = [ncread(str3a,strcqce);ncread(str3b,strcqce);ncread(str3c,strcqce)];
c_qc_r = [ncread(str3a,strcqcr);ncread(str3b,strcqcr);ncread(str3c,strcqcr)];

time = [ncread(str3a,strtime);ncread(str3b,strtime);ncread(str3c,strtime)];
temp = [ncread(str3a,strst);ncread(str3b,strst);ncread(str3c,strst)];
salt = [ncread(str3a,strps);ncread(str3b,strps);ncread(str3c,strps)];
dens = [ncread(str3a,strd);ncread(str3b,strd);ncread(str3c,strd)];
pres = [ncread(str3a,strp);ncread(str3b,strp);ncread(str3c,strp)];
lat = [ncread(str3a,strla);ncread(str3b,strla);ncread(str3c,strla)];
lon = [ncread(str3a,strlo);ncread(str3b,strlo);ncread(str3c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_60mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_60mA_dep123 = sortrows(GA_OOI_CTD_60mA_dep123,1);


save GA_OOI_CTD_60mA_dep123 GA_OOI_CTD_60mA_dep123 str_key str3a
%% 

%% 4
ps_qc_e = [ncread(str4a,strsqce);ncread(str4b,strsqce);ncread(str4c,strsqce)];
ps_qc_r = [ncread(str4a,strsqcr);ncread(str4b,strsqcr);ncread(str4c,strsqcr)];
d_qc_e = [ncread(str4a,strdqce);ncread(str4b,strdqce);ncread(str4c,strdqce)];
d_qc_r = [ncread(str4a,strdqcr);ncread(str4b,strdqcr);ncread(str4c,strdqcr)];
st_qc_e = [ncread(str4a,strtqce);ncread(str4b,strtqce);ncread(str4c,strtqce)];
st_qc_r = [ncread(str4a,strtqcr);ncread(str4b,strtqcr);ncread(str4c,strtqcr)];
p_qc_e = [ncread(str4a,strpqce);ncread(str4b,strpqce);ncread(str4c,strpqce)];
p_qc_r = [ncread(str4a,strpqcr);ncread(str4b,strpqcr);ncread(str4c,strpqcr)];
c_qc_e = [ncread(str4a,strcqce);ncread(str4b,strcqce);ncread(str4c,strcqce)];
c_qc_r = [ncread(str4a,strcqcr);ncread(str4b,strcqcr);ncread(str4c,strcqcr)];

time = [ncread(str4a,strtime);ncread(str4b,strtime);ncread(str4c,strtime)];
temp = [ncread(str4a,strst);ncread(str4b,strst);ncread(str4c,strst)];
salt = [ncread(str4a,strps);ncread(str4b,strps);ncread(str4c,strps)];
dens = [ncread(str4a,strd);ncread(str4b,strd);ncread(str4c,strd)];
pres = [ncread(str4a,strp);ncread(str4b,strp);ncread(str4c,strp)];
lat = [ncread(str4a,strla);ncread(str4b,strla);ncread(str4c,strla)];
lon = [ncread(str4a,strlo);ncread(str4b,strlo);ncread(str4c,strlo)];
QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_90mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_90mA_dep123 = sortrows(GA_OOI_CTD_90mA_dep123,1);

save GA_OOI_CTD_90mA_dep123 GA_OOI_CTD_90mA_dep123 str_key str4a
%% 

%% 5
ps_qc_e = [ncread(str5a,strsqce);ncread(str5b,strsqce);ncread(str5c,strsqce)];
ps_qc_r = [ncread(str5a,strsqcr);ncread(str5b,strsqcr);ncread(str5c,strsqcr)];
d_qc_e = [ncread(str5a,strdqce);ncread(str5b,strdqce);ncread(str5c,strdqce)];
d_qc_r = [ncread(str5a,strdqcr);ncread(str5b,strdqcr);ncread(str5c,strdqcr)];
st_qc_e = [ncread(str5a,strtqce);ncread(str5b,strtqce);ncread(str5c,strtqce)];
st_qc_r = [ncread(str5a,strtqcr);ncread(str5b,strtqcr);ncread(str5c,strtqcr)];
p_qc_e = [ncread(str5a,strpqce);ncread(str5b,strpqce);ncread(str5c,strpqce)];
p_qc_r = [ncread(str5a,strpqcr);ncread(str5b,strpqcr);ncread(str5c,strpqcr)];
c_qc_e = [ncread(str5a,strcqce);ncread(str5b,strcqce);ncread(str5c,strcqce)];
c_qc_r = [ncread(str5a,strcqcr);ncread(str5b,strcqcr);ncread(str5c,strcqcr)];

time = [ncread(str5a,strtime);ncread(str5b,strtime);ncread(str5c,strtime)];
temp = [ncread(str5a,strst);ncread(str5b,strst);ncread(str5c,strst)];
salt = [ncread(str5a,strps);ncread(str5b,strps);ncread(str5c,strps)];
dens = [ncread(str5a,strd);ncread(str5b,strd);ncread(str5c,strd)];
pres = [ncread(str5a,strp);ncread(str5b,strp);ncread(str5c,strp)];
lat = [ncread(str5a,strla);ncread(str5b,strla);ncread(str5c,strla)];
lon = [ncread(str5a,strlo);ncread(str5b,strlo);ncread(str5c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_130mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_130mA_dep123 = sortrows(GA_OOI_CTD_130mA_dep123,1);

save GA_OOI_CTD_130mA_dep123 GA_OOI_CTD_130mA_dep123 str_key str5a
%% 

%% 6
ps_qc_e = [ncread(str6a,strsqce);ncread(str6b,strsqce);ncread(str6c,strsqce)];
ps_qc_r = [ncread(str6a,strsqcr);ncread(str6b,strsqcr);ncread(str6c,strsqcr)];
d_qc_e = [ncread(str6a,strdqce);ncread(str6b,strdqce);ncread(str6c,strdqce)];
d_qc_r = [ncread(str6a,strdqcr);ncread(str6b,strdqcr);ncread(str6c,strdqcr)];
st_qc_e = [ncread(str6a,strtqce);ncread(str6b,strtqce);ncread(str6c,strtqce)];
st_qc_r = [ncread(str6a,strtqcr);ncread(str6b,strtqcr);ncread(str6c,strtqcr)];
p_qc_e = [ncread(str6a,strpqce);ncread(str6b,strpqce);ncread(str6c,strpqce)];
p_qc_r = [ncread(str6a,strpqcr);ncread(str6b,strpqcr);ncread(str6c,strpqcr)];
c_qc_e = [ncread(str6a,strcqce);ncread(str6b,strcqce);ncread(str6c,strcqce)];
c_qc_r = [ncread(str6a,strcqcr);ncread(str6b,strcqcr);ncread(str6c,strcqcr)];

time = [ncread(str6a,strtime);ncread(str6b,strtime);ncread(str6c,strtime)];
temp = [ncread(str6a,strst);ncread(str6b,strst);ncread(str6c,strst)];
salt = [ncread(str6a,strps);ncread(str6b,strps);ncread(str6c,strps)];
dens = [ncread(str6a,strd);ncread(str6b,strd);ncread(str6c,strd)];
pres = [ncread(str6a,strp);ncread(str6b,strp);ncread(str6c,strp)];
lat = [ncread(str6a,strla);ncread(str6b,strla);ncread(str6c,strla)];
lon = [ncread(str6a,strlo);ncread(str6b,strlo);ncread(str6c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_180mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_180mA_dep123 = sortrows(GA_OOI_CTD_180mA_dep123,1);

save GA_OOI_CTD_180mA_dep123 GA_OOI_CTD_180mA_dep123 str_key str6a
%% 

%% 7
ps_qc_e = [ncread(str7a,strsqce);ncread(str7b,strsqce);ncread(str7c,strsqce)];
ps_qc_r = [ncread(str7a,strsqcr);ncread(str7b,strsqcr);ncread(str7c,strsqcr)];
d_qc_e = [ncread(str7a,strdqce);ncread(str7b,strdqce);ncread(str7c,strdqce)];
d_qc_r = [ncread(str7a,strdqcr);ncread(str7b,strdqcr);ncread(str7c,strdqcr)];
st_qc_e = [ncread(str7a,strtqce);ncread(str7b,strtqce);ncread(str7c,strtqce)];
st_qc_r = [ncread(str7a,strtqcr);ncread(str7b,strtqcr);ncread(str7c,strtqcr)];
p_qc_e = [ncread(str7a,strpqce);ncread(str7b,strpqce);ncread(str7c,strpqce)];
p_qc_r = [ncread(str7a,strpqcr);ncread(str7b,strpqcr);ncread(str7c,strpqcr)];
c_qc_e = [ncread(str7a,strcqce);ncread(str7b,strcqce);ncread(str7c,strcqce)];
c_qc_r = [ncread(str7a,strcqcr);ncread(str7b,strcqcr);ncread(str7c,strcqcr)];

time = [ncread(str7a,strtime);ncread(str7b,strtime);ncread(str7c,strtime)];
temp = [ncread(str7a,strst);ncread(str7b,strst);ncread(str7c,strst)];
salt = [ncread(str7a,strps);ncread(str7b,strps);ncread(str7c,strps)];
dens = [ncread(str7a,strd);ncread(str7b,strd);ncread(str7c,strd)];
pres = [ncread(str7a,strp);ncread(str7b,strp);ncread(str7c,strp)];
lat = [ncread(str7a,strla);ncread(str7b,strla);ncread(str7c,strla)];
lon = [ncread(str7a,strlo);ncread(str7b,strlo);ncread(str7c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_250mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_250mA_dep123 = sortrows(GA_OOI_CTD_250mA_dep123,1);

save GA_OOI_CTD_250mA_dep123 GA_OOI_CTD_250mA_dep123 str_key str7a
%% 

%% 8
ps_qc_e = [ncread(str8a,strsqce);ncread(str8b,strsqce);ncread(str8c,strsqce)];
ps_qc_r = [ncread(str8a,strsqcr);ncread(str8b,strsqcr);ncread(str8c,strsqcr)];
d_qc_e = [ncread(str8a,strdqce);ncread(str8b,strdqce);ncread(str8c,strdqce)];
d_qc_r = [ncread(str8a,strdqcr);ncread(str8b,strdqcr);ncread(str8c,strdqcr)];
st_qc_e = [ncread(str8a,strtqce);ncread(str8b,strtqce);ncread(str8c,strtqce)];
st_qc_r = [ncread(str8a,strtqcr);ncread(str8b,strtqcr);ncread(str8c,strtqcr)];
p_qc_e = [ncread(str8a,strpqce);ncread(str8b,strpqce);ncread(str8c,strpqce)];
p_qc_r = [ncread(str8a,strpqcr);ncread(str8b,strpqcr);ncread(str8c,strpqcr)];
c_qc_e = [ncread(str8a,strcqce);ncread(str8b,strcqce);ncread(str8c,strcqce)];
c_qc_r = [ncread(str8a,strcqcr);ncread(str8b,strcqcr);ncread(str8c,strcqcr)];

time = [ncread(str8a,strtime);ncread(str8b,strtime);ncread(str8c,strtime)];
temp = [ncread(str8a,strst);ncread(str8b,strst);ncread(str8c,strst)];
salt = [ncread(str8a,strps);ncread(str8b,strps);ncread(str8c,strps)];
dens = [ncread(str8a,strd);ncread(str8b,strd);ncread(str8c,strd)];
pres = [ncread(str8a,strp);ncread(str8b,strp);ncread(str8c,strp)];
lat = [ncread(str8a,strla);ncread(str8b,strla);ncread(str8c,strla)];
lon = [ncread(str8a,strlo);ncread(str8b,strlo);ncread(str8c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);
 
len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_350mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_350mA_dep123 = sortrows(GA_OOI_CTD_350mA_dep123,1);

save GA_OOI_CTD_350mA_dep123 GA_OOI_CTD_350mA_dep123 str_key str8a
%% 

%% 9
ps_qc_e = [ncread(str9a,strsqce);ncread(str9b,strsqce);ncread(str9c,strsqce)];
ps_qc_r = [ncread(str9a,strsqcr);ncread(str9b,strsqcr);ncread(str9c,strsqcr)];
d_qc_e = [ncread(str9a,strdqce);ncread(str9b,strdqce);ncread(str9c,strdqce)];
d_qc_r = [ncread(str9a,strdqcr);ncread(str9b,strdqcr);ncread(str9c,strdqcr)];
st_qc_e = [ncread(str9a,strtqce);ncread(str9b,strtqce);ncread(str9c,strtqce)];
st_qc_r = [ncread(str9a,strtqcr);ncread(str9b,strtqcr);ncread(str9c,strtqcr)];
p_qc_e = [ncread(str9a,strpqce);ncread(str9b,strpqce);ncread(str9c,strpqce)];
p_qc_r = [ncread(str9a,strpqcr);ncread(str9b,strpqcr);ncread(str9c,strpqcr)];
c_qc_e = [ncread(str9a,strcqce);ncread(str9b,strcqce);ncread(str9c,strcqce)];
c_qc_r = [ncread(str9a,strcqcr);ncread(str9b,strcqcr);ncread(str9c,strcqcr)];

time = [ncread(str9a,strtime);ncread(str9b,strtime);ncread(str9c,strtime)];
temp = [ncread(str9a,strst);ncread(str9b,strst);ncread(str9c,strst)];
salt = [ncread(str9a,strps);ncread(str9b,strps);ncread(str9c,strps)];
dens = [ncread(str9a,strd);ncread(str9b,strd);ncread(str9c,strd)];
pres = [ncread(str9a,strp);ncread(str9b,strp);ncread(str9c,strp)];
lat = [-42.493*ones(23970,1);-42.4946*ones(33214,1);ncread(str9c,strla)];
lon = [-42.8707*ones(23970,1);-42.9211*ones(33214,1);ncread(str9c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_500mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_500mA_dep123 = sortrows(GA_OOI_CTD_500mA_dep123,1);

save GA_OOI_CTD_500mA_dep123 GA_OOI_CTD_500mA_dep123 str_key str9a
%% 

%% 10
ps_qc_e = [ncread(str10a,strsqce);ncread(str10b,strsqce);ncread(str10c,strsqce)];
ps_qc_r = [ncread(str10a,strsqcr);ncread(str10b,strsqcr);ncread(str10c,strsqcr)];
d_qc_e = [ncread(str10a,strdqce);ncread(str10b,strdqce);ncread(str10c,strdqce)];
d_qc_r = [ncread(str10a,strdqcr);ncread(str10b,strdqcr);ncread(str10c,strdqcr)];
st_qc_e = [ncread(str10a,strtqce);ncread(str10b,strtqce);ncread(str10c,strtqce)];
st_qc_r = [ncread(str10a,strtqcr);ncread(str10b,strtqcr);ncread(str10c,strtqcr)];
p_qc_e = [ncread(str10a,strpqce);ncread(str10b,strpqce);ncread(str10c,strpqce)];
p_qc_r = [ncread(str10a,strpqcr);ncread(str10b,strpqcr);ncread(str10c,strpqcr)];
c_qc_e = [ncread(str10a,strcqce);ncread(str10b,strcqce);ncread(str10c,strcqce)];
c_qc_r = [ncread(str10a,strcqcr);ncread(str10b,strcqcr);ncread(str10c,strcqcr)];

time = [ncread(str10a,strtime);ncread(str10b,strtime);ncread(str10c,strtime)];
temp = [ncread(str10a,strst);ncread(str10b,strst);ncread(str10c,strst)];
salt = [ncread(str10a,strps);ncread(str10b,strps);ncread(str10c,strps)];
dens = [ncread(str10a,strd);ncread(str10b,strd);ncread(str10c,strd)];
pres = [ncread(str10a,strp);ncread(str10b,strp);ncread(str10c,strp)];
lat = [ncread(str10a,strla);ncread(str10b,strla);ncread(str10c,strla)];
lon = [ncread(str10a,strlo);ncread(str10b,strlo);ncread(str10c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_750mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_750mA_dep123 = sortrows(GA_OOI_CTD_750mA_dep123,1);

save GA_OOI_CTD_750mA_dep123 GA_OOI_CTD_750mA_dep123 str_key str10a
%% 


%% 11
ps_qc_e = [ncread(str11a,strsqce);ncread(str11b,strsqce);ncread(str11c,strsqce)];
ps_qc_r = [ncread(str11a,strsqcr);ncread(str11b,strsqcr);ncread(str11c,strsqcr)];
d_qc_e = [ncread(str11a,strdqce);ncread(str11b,strdqce);ncread(str11c,strdqce)];
d_qc_r = [ncread(str11a,strdqcr);ncread(str11b,strdqcr);ncread(str11c,strdqcr)];
st_qc_e = [ncread(str11a,strtqce);ncread(str11b,strtqce);ncread(str11c,strtqce)];
st_qc_r = [ncread(str11a,strtqcr);ncread(str11b,strtqcr);ncread(str11c,strtqcr)];
p_qc_e = [ncread(str11a,strpqce);ncread(str11b,strpqce);ncread(str11c,strpqce)];
p_qc_r = [ncread(str11a,strpqcr);ncread(str11b,strpqcr);ncread(str11c,strpqcr)];
c_qc_e = [ncread(str11a,strcqce);ncread(str11b,strcqce);ncread(str11c,strcqce)];
c_qc_r = [ncread(str11a,strcqcr);ncread(str11b,strcqcr);ncread(str11c,strcqcr)];

time = [ncread(str11a,strtime);ncread(str11b,strtime);ncread(str11c,strtime)];
temp = [ncread(str11a,strst);ncread(str11b,strst);ncread(str11c,strst)];
salt = [ncread(str11a,strps);ncread(str11b,strps);ncread(str11c,strps)];
dens = [ncread(str11a,strd);ncread(str11b,strd);ncread(str11c,strd)];
pres = [ncread(str11a,strp);ncread(str11b,strp);ncread(str11c,strp)];
lat = [ncread(str11a,strla);ncread(str11b,strla);ncread(str11c,strla)];
lon = [ncread(str11a,strlo);ncread(str11b,strlo);ncread(str11c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_1000mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_1000mA_dep123 = sortrows(GA_OOI_CTD_1000mA_dep123,1);

save GA_OOI_CTD_1000mA_dep123 GA_OOI_CTD_1000mA_dep123 str_key str11a
%% 

%% 12
ps_qc_e = [ncread(str12a,strsqce);ncread(str12b,strsqce);ncread(str12c,strsqce)];
ps_qc_r = [ncread(str12a,strsqcr);ncread(str12b,strsqcr);ncread(str12c,strsqcr)];
d_qc_e = [ncread(str12a,strdqce);ncread(str12b,strdqce);ncread(str12c,strdqce)];
d_qc_r = [ncread(str12a,strdqcr);ncread(str12b,strdqcr);ncread(str12c,strdqcr)];
st_qc_e = [ncread(str12a,strtqce);ncread(str12b,strtqce);ncread(str12c,strtqce)];
st_qc_r = [ncread(str12a,strtqcr);ncread(str12b,strtqcr);ncread(str12c,strtqcr)];
p_qc_e = [ncread(str12a,strpqce);ncread(str12b,strpqce);ncread(str12c,strpqce)];
p_qc_r = [ncread(str12a,strpqcr);ncread(str12b,strpqcr);ncread(str12c,strpqcr)];
c_qc_e = [ncread(str12a,strcqce);ncread(str12b,strcqce);ncread(str12c,strcqce)];
c_qc_r = [ncread(str12a,strcqcr);ncread(str12b,strcqcr);ncread(str12c,strcqcr)];

time = [ncread(str12a,strtime);ncread(str12b,strtime);ncread(str12c,strtime)];
temp = [ncread(str12a,strst);ncread(str12b,strst);ncread(str12c,strst)];
salt = [ncread(str12a,strps);ncread(str12b,strps);ncread(str12c,strps)];
dens = [ncread(str12a,strd);ncread(str12b,strd);ncread(str12c,strd)];
pres = [ncread(str12a,strp);ncread(str12b,strp);ncread(str12c,strp)];
lat = [ncread(str12a,strla);ncread(str12b,strla);ncread(str12c,strla)];
lon = [ncread(str12a,strlo);ncread(str12b,strlo);ncread(str12c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_1500mA_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_1500mA_dep123 = sortrows(GA_OOI_CTD_1500mA_dep123,1);

save GA_OOI_CTD_1500mA_dep123 GA_OOI_CTD_1500mA_dep123 str_key str12a
%% 

%% 13
ps_qc_e = [ncread(str13a,strsqce);ncread(str13b,strsqce);ncread(str13c,strsqce)];
ps_qc_r = [ncread(str13a,strsqcr);ncread(str13b,strsqcr);ncread(str13c,strsqcr)];
d_qc_e = [ncread(str13a,strdqce);ncread(str13b,strdqce);ncread(str13c,strdqce)];
d_qc_r = [ncread(str13a,strdqcr);ncread(str13b,strdqcr);ncread(str13c,strdqcr)];
st_qc_e = [ncread(str13a,strtqce);ncread(str13b,strtqce);ncread(str13c,strtqce)];
st_qc_r = [ncread(str13a,strtqcr);ncread(str13b,strtqcr);ncread(str13c,strtqcr)];
p_qc_e = [ncread(str13a,strpqce);ncread(str13b,strpqce);ncread(str13c,strpqce)];
p_qc_r = [ncread(str13a,strpqcr);ncread(str13b,strpqcr);ncread(str13c,strpqcr)];
c_qc_e = [ncread(str13a,strcqce);ncread(str13b,strcqce);ncread(str13c,strcqce)];
c_qc_r = [ncread(str13a,strcqcr);ncread(str13b,strcqcr);ncread(str13c,strcqcr)];

time = [ncread(str13a,strtime);ncread(str13b,strtime);ncread(str13c,strtime)];
temp = [ncread(str13a,strst);ncread(str13b,strst);ncread(str13c,strst)];
salt = [ncread(str13a,strps);ncread(str13b,strps);ncread(str13c,strps)];
dens = [ncread(str13a,strd);ncread(str13b,strd);ncread(str13c,strd)];
pres = [ncread(str13a,strp);ncread(str13b,strp);ncread(str13c,strp)];
lat = [ncread(str13a,strla);ncread(str13b,strla);ncread(str13c,strla)];
lon = [ncread(str13a,strlo);ncread(str13b,strlo);ncread(str13c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_30mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_30mB_dep123 = sortrows(GA_OOI_CTD_30mB_dep123,1);

save GA_OOI_CTD_30mB_dep123 GA_OOI_CTD_30mB_dep123 str_key str13a
%% 

%% 14
ps_qc_e = [ncread(str14a,strsqce);ncread(str14b,strsqce);ncread(str14c,strsqce)];
ps_qc_r = [ncread(str14a,strsqcr);ncread(str14b,strsqcr);ncread(str14c,strsqcr)];
d_qc_e = [ncread(str14a,strdqce);ncread(str14b,strdqce);ncread(str14c,strdqce)];
d_qc_r = [ncread(str14a,strdqcr);ncread(str14b,strdqcr);ncread(str14c,strdqcr)];
st_qc_e = [ncread(str14a,strtqce);ncread(str14b,strtqce);ncread(str14c,strtqce)];
st_qc_r = [ncread(str14a,strtqcr);ncread(str14b,strtqcr);ncread(str14c,strtqcr)];
p_qc_e = [ncread(str14a,strpqce);ncread(str14b,strpqce);ncread(str14c,strpqce)];
p_qc_r = [ncread(str14a,strpqcr);ncread(str14b,strpqcr);ncread(str14c,strpqcr)];
c_qc_e = [ncread(str14a,strcqce);ncread(str14b,strcqce);ncread(str14c,strcqce)];
c_qc_r = [ncread(str14a,strcqcr);ncread(str14b,strcqcr);ncread(str14c,strcqcr)];

time = [ncread(str14a,strtime);ncread(str14b,strtime);ncread(str14c,strtime)];
temp = [ncread(str14a,strst);ncread(str14b,strst);ncread(str14c,strst)];
salt = [ncread(str14a,strps);ncread(str14b,strps);ncread(str14c,strps)];
dens = [ncread(str14a,strd);ncread(str14b,strd);ncread(str14c,strd)];
pres = [ncread(str14a,strp);ncread(str14b,strp);ncread(str14c,strp)];
lat = [-42.4957*ones(23268,1);-42.4924*ones(33169,1);ncread(str14c,strla)];
lon = [-42.122*ones(23268,1);-42.1626*ones(33169,1);ncread(str14c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_40mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_40mB_dep123 = sortrows(GA_OOI_CTD_40mB_dep123,1);

save GA_OOI_CTD_40mB_dep123 GA_OOI_CTD_40mB_dep123 str_key str14a
%% 

%% 15
ps_qc_e = [ncread(str15a,strsqce);ncread(str15b,strsqce);ncread(str15c,strsqce)];
ps_qc_r = [ncread(str15a,strsqcr);ncread(str15b,strsqcr);ncread(str15c,strsqcr)];
d_qc_e = [ncread(str15a,strdqce);ncread(str15b,strdqce);ncread(str15c,strdqce)];
d_qc_r = [ncread(str15a,strdqcr);ncread(str15b,strdqcr);ncread(str15c,strdqcr)];
st_qc_e = [ncread(str15a,strtqce);ncread(str15b,strtqce);ncread(str15c,strtqce)];
st_qc_r = [ncread(str15a,strtqcr);ncread(str15b,strtqcr);ncread(str15c,strtqcr)];
p_qc_e = [ncread(str15a,strpqce);ncread(str15b,strpqce);ncread(str15c,strpqce)];
p_qc_r = [ncread(str15a,strpqcr);ncread(str15b,strpqcr);ncread(str15c,strpqcr)];
c_qc_e = [ncread(str15a,strcqce);ncread(str15b,strcqce);ncread(str15c,strcqce)];
c_qc_r = [ncread(str15a,strcqcr);ncread(str15b,strcqcr);ncread(str15c,strcqcr)];

time = [ncread(str15a,strtime);ncread(str15b,strtime);ncread(str15c,strtime)];
temp = [ncread(str15a,strst);ncread(str15b,strst);ncread(str15c,strst)];
salt = [ncread(str15a,strps);ncread(str15b,strps);ncread(str15c,strps)];
dens = [ncread(str15a,strd);ncread(str15b,strd);ncread(str15c,strd)];
pres = [ncread(str15a,strp);ncread(str15b,strp);ncread(str15c,strp)];
lat = [ncread(str15a,strla);ncread(str15b,strla);ncread(str15c,strla)];
lon = [ncread(str15a,strlo);ncread(str15b,strlo);ncread(str15c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_60mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_60mB_dep123 = sortrows(GA_OOI_CTD_60mB_dep123,1);

save GA_OOI_CTD_60mB_dep123 GA_OOI_CTD_60mB_dep123 str_key str15a
%% 

%% 16
ps_qc_e = [ncread(str16a,strsqce);ncread(str16b,strsqce);ncread(str16c,strsqce)];
ps_qc_r = [ncread(str16a,strsqcr);ncread(str16b,strsqcr);ncread(str16c,strsqcr)];
d_qc_e = [ncread(str16a,strdqce);ncread(str16b,strdqce);ncread(str16c,strdqce)];
d_qc_r = [ncread(str16a,strdqcr);ncread(str16b,strdqcr);ncread(str16c,strdqcr)];
st_qc_e = [ncread(str16a,strtqce);ncread(str16b,strtqce);ncread(str16c,strtqce)];
st_qc_r = [ncread(str16a,strtqcr);ncread(str16b,strtqcr);ncread(str16c,strtqcr)];
p_qc_e = [ncread(str16a,strpqce);ncread(str16b,strpqce);ncread(str16c,strpqce)];
p_qc_r = [ncread(str16a,strpqcr);ncread(str16b,strpqcr);ncread(str16c,strpqcr)];
c_qc_e = [ncread(str16a,strcqce);ncread(str16b,strcqce);ncread(str16c,strcqce)];
c_qc_r = [ncread(str16a,strcqcr);ncread(str16b,strcqcr);ncread(str16c,strcqcr)];

time = [ncread(str16a,strtime);ncread(str16b,strtime);ncread(str16c,strtime)];
temp = [ncread(str16a,strst);ncread(str16b,strst);ncread(str16c,strst)];
salt = [ncread(str16a,strps);ncread(str16b,strps);ncread(str16c,strps)];
dens = [ncread(str16a,strd);ncread(str16b,strd);ncread(str16c,strd)];
pres = [ncread(str16a,strp);ncread(str16b,strp);ncread(str16c,strp)];
lat = [ncread(str16a,strla);ncread(str16b,strla);ncread(str16c,strla)];
lon = [ncread(str16a,strlo);ncread(str16b,strlo);ncread(str16c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_90mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_90mB_dep123 = sortrows(GA_OOI_CTD_90mB_dep123,1);

save GA_OOI_CTD_90mB_dep123 GA_OOI_CTD_90mB_dep123 str_key str16a
%% 

%% 17
ps_qc_e = [ncread(str17a,strsqce);ncread(str17b,strsqce);ncread(str17c,strsqce)];
ps_qc_r = [ncread(str17a,strsqcr);ncread(str17b,strsqcr);ncread(str17c,strsqcr)];
d_qc_e = [ncread(str17a,strdqce);ncread(str17b,strdqce);ncread(str17c,strdqce)];
d_qc_r = [ncread(str17a,strdqcr);ncread(str17b,strdqcr);ncread(str17c,strdqcr)];
st_qc_e = [ncread(str17a,strtqce);ncread(str17b,strtqce);ncread(str17c,strtqce)];
st_qc_r = [ncread(str17a,strtqcr);ncread(str17b,strtqcr);ncread(str17c,strtqcr)];
p_qc_e = [ncread(str17a,strpqce);ncread(str17b,strpqce);ncread(str17c,strpqce)];
p_qc_r = [ncread(str17a,strpqcr);ncread(str17b,strpqcr);ncread(str17c,strpqcr)];
c_qc_e = [ncread(str17a,strcqce);ncread(str17b,strcqce);ncread(str17c,strcqce)];
c_qc_r = [ncread(str17a,strcqcr);ncread(str17b,strcqcr);ncread(str17c,strcqcr)];

time = [ncread(str17a,strtime);ncread(str17b,strtime);ncread(str17c,strtime)];
temp = [ncread(str17a,strst);ncread(str17b,strst);ncread(str17c,strst)];
salt = [ncread(str17a,strps);ncread(str17b,strps);ncread(str17c,strps)];
dens = [ncread(str17a,strd);ncread(str17b,strd);ncread(str17c,strd)];
pres = [ncread(str17a,strp);ncread(str17b,strp);ncread(str17c,strp)];
lat = [ncread(str17a,strla);ncread(str17b,strla);ncread(str17c,strla)];
lon = [ncread(str17a,strlo);ncread(str17b,strlo);ncread(str17c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_130mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_130mB_dep123 = sortrows(GA_OOI_CTD_130mB_dep123,1);

save GA_OOI_CTD_130mB_dep123 GA_OOI_CTD_130mB_dep123 str_key str17a
%% 

%% 18
ps_qc_e = [ncread(str18a,strsqce);ncread(str18b,strsqce);ncread(str18c,strsqce)];
ps_qc_r = [ncread(str18a,strsqcr);ncread(str18b,strsqcr);ncread(str18c,strsqcr)];
d_qc_e = [ncread(str18a,strdqce);ncread(str18b,strdqce);ncread(str18c,strdqce)];
d_qc_r = [ncread(str18a,strdqcr);ncread(str18b,strdqcr);ncread(str18c,strdqcr)];
st_qc_e = [ncread(str18a,strtqce);ncread(str18b,strtqce);ncread(str18c,strtqce)];
st_qc_r = [ncread(str18a,strtqcr);ncread(str18b,strtqcr);ncread(str18c,strtqcr)];
p_qc_e = [ncread(str18a,strpqce);ncread(str18b,strpqce);ncread(str18c,strpqce)];
p_qc_r = [ncread(str18a,strpqcr);ncread(str18b,strpqcr);ncread(str18c,strpqcr)];
c_qc_e = [ncread(str18a,strcqce);ncread(str18b,strcqce);ncread(str18c,strcqce)];
c_qc_r = [ncread(str18a,strcqcr);ncread(str18b,strcqcr);ncread(str18c,strcqcr)];

time = [ncread(str18a,strtime);ncread(str18b,strtime);ncread(str18c,strtime)];
temp = [ncread(str18a,strst);ncread(str18b,strst);ncread(str18c,strst)];
salt = [ncread(str18a,strps);ncread(str18b,strps);ncread(str18c,strps)];
dens = [ncread(str18a,strd);ncread(str18b,strd);ncread(str18c,strd)];
pres = [ncread(str18a,strp);ncread(str18b,strp);ncread(str18c,strp)];
lat = [ncread(str18a,strla);ncread(str18b,strla);ncread(str18c,strla)];
lon = [ncread(str18a,strlo);ncread(str18b,strlo);ncread(str18c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_180mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_180mB_dep123 = sortrows(GA_OOI_CTD_180mB_dep123,1);

save GA_OOI_CTD_180mB_dep123 GA_OOI_CTD_180mB_dep123 str_key str18a
%% 

%% 19
ps_qc_e = [ncread(str19a,strsqce);ncread(str19b,strsqce);ncread(str19c,strsqce)];
ps_qc_r = [ncread(str19a,strsqcr);ncread(str19b,strsqcr);ncread(str19c,strsqcr)];
d_qc_e = [ncread(str19a,strdqce);ncread(str19b,strdqce);ncread(str19c,strdqce)];
d_qc_r = [ncread(str19a,strdqcr);ncread(str19b,strdqcr);ncread(str19c,strdqcr)];
st_qc_e = [ncread(str19a,strtqce);ncread(str19b,strtqce);ncread(str19c,strtqce)];
st_qc_r = [ncread(str19a,strtqcr);ncread(str19b,strtqcr);ncread(str19c,strtqcr)];
p_qc_e = [ncread(str19a,strpqce);ncread(str19b,strpqce);ncread(str19c,strpqce)];
p_qc_r = [ncread(str19a,strpqcr);ncread(str19b,strpqcr);ncread(str19c,strpqcr)];
c_qc_e = [ncread(str19a,strcqce);ncread(str19b,strcqce);ncread(str19c,strcqce)];
c_qc_r = [ncread(str19a,strcqcr);ncread(str19b,strcqcr);ncread(str19c,strcqcr)];

time = [ncread(str19a,strtime);ncread(str19b,strtime);ncread(str19c,strtime)];
temp = [ncread(str19a,strst);ncread(str19b,strst);ncread(str19c,strst)];
salt = [ncread(str19a,strps);ncread(str19b,strps);ncread(str19c,strps)];
dens = [ncread(str19a,strd);ncread(str19b,strd);ncread(str19c,strd)];
pres = [ncread(str19a,strp);ncread(str19b,strp);ncread(str19c,strp)];
lat = [ncread(str19a,strla);ncread(str19b,strla);ncread(str19c,strla)];
lon = [ncread(str19a,strlo);ncread(str19b,strlo);ncread(str19c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_250mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_250mB_dep123 = sortrows(GA_OOI_CTD_250mB_dep123,1);

save GA_OOI_CTD_250mB_dep123 GA_OOI_CTD_250mB_dep123 str_key str19a
%% 

%% 20
ps_qc_e = [ncread(str20a,strsqce);ncread(str20b,strsqce);ncread(str20c,strsqce)];
ps_qc_r = [ncread(str20a,strsqcr);ncread(str20b,strsqcr);ncread(str20c,strsqcr)];
d_qc_e = [ncread(str20a,strdqce);ncread(str20b,strdqce);ncread(str20c,strdqce)];
d_qc_r = [ncread(str20a,strdqcr);ncread(str20b,strdqcr);ncread(str20c,strdqcr)];
st_qc_e = [ncread(str20a,strtqce);ncread(str20b,strtqce);ncread(str20c,strtqce)];
st_qc_r = [ncread(str20a,strtqcr);ncread(str20b,strtqcr);ncread(str20c,strtqcr)];
p_qc_e = [ncread(str20a,strpqce);ncread(str20b,strpqce);ncread(str20c,strpqce)];
p_qc_r = [ncread(str20a,strpqcr);ncread(str20b,strpqcr);ncread(str20c,strpqcr)];
c_qc_e = [ncread(str20a,strcqce);ncread(str20b,strcqce);ncread(str20c,strcqce)];
c_qc_r = [ncread(str20a,strcqcr);ncread(str20b,strcqcr);ncread(str20c,strcqcr)];

time = [ncread(str20a,strtime);ncread(str20b,strtime);ncread(str20c,strtime)];
temp = [ncread(str20a,strst);ncread(str20b,strst);ncread(str20c,strst)];
salt = [ncread(str20a,strps);ncread(str20b,strps);ncread(str20c,strps)];
dens = [ncread(str20a,strd);ncread(str20b,strd);ncread(str20c,strd)];
pres = [ncread(str20a,strp);ncread(str20b,strp);ncread(str20c,strp)];
lat = [ncread(str20a,strla);ncread(str20b,strla);ncread(str20c,strla)];
lon = [ncread(str20a,strlo);ncread(str20b,strlo);ncread(str20c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_350mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_350mB_dep123 = sortrows(GA_OOI_CTD_350mB_dep123,1);

save GA_OOI_CTD_350mB_dep123 GA_OOI_CTD_350mB_dep123 str_key str20a
%% 

%% 21
ps_qc_e = [ncread(str21a,strsqce);ncread(str21b,strsqce);ncread(str21c,strsqce)];
ps_qc_r = [ncread(str21a,strsqcr);ncread(str21b,strsqcr);ncread(str21c,strsqcr)];
d_qc_e = [ncread(str21a,strdqce);ncread(str21b,strdqce);ncread(str21c,strdqce)];
d_qc_r = [ncread(str21a,strdqcr);ncread(str21b,strdqcr);ncread(str21c,strdqcr)];
st_qc_e = [ncread(str21a,strtqce);ncread(str21b,strtqce);ncread(str21c,strtqce)];
st_qc_r = [ncread(str21a,strtqcr);ncread(str21b,strtqcr);ncread(str21c,strtqcr)];
p_qc_e = [ncread(str21a,strpqce);ncread(str21b,strpqce);ncread(str21c,strpqce)];
p_qc_r = [ncread(str21a,strpqcr);ncread(str21b,strpqcr);ncread(str21c,strpqcr)];
c_qc_e = [ncread(str21a,strcqce);ncread(str21b,strcqce);ncread(str21c,strcqce)];
c_qc_r = [ncread(str21a,strcqcr);ncread(str21b,strcqcr);ncread(str21c,strcqcr)];

time = [ncread(str21a,strtime);ncread(str21b,strtime);ncread(str21c,strtime)];
temp = [ncread(str21a,strst);ncread(str21b,strst);ncread(str21c,strst)];
salt = [ncread(str21a,strps);ncread(str21b,strps);ncread(str21c,strps)];
dens = [ncread(str21a,strd);ncread(str21b,strd);ncread(str21c,strd)];
pres = [ncread(str21a,strp);ncread(str21b,strp);ncread(str21c,strp)];
lat = [ncread(str21a,strla);ncread(str21b,strla);ncread(str21c,strla)];
lon = [ncread(str21a,strlo);ncread(str21b,strlo);ncread(str21c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_500mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_500mB_dep123 = sortrows(GA_OOI_CTD_500mB_dep123,1);

save GA_OOI_CTD_500mB_dep123 GA_OOI_CTD_500mB_dep123 str_key str21a
%% 

%% 22
ps_qc_e = [ncread(str22a,strsqce);ncread(str22b,strsqce);ncread(str22c,strsqce)];
ps_qc_r = [ncread(str22a,strsqcr);ncread(str22b,strsqcr);ncread(str22c,strsqcr)];
d_qc_e = [ncread(str22a,strdqce);ncread(str22b,strdqce);ncread(str22c,strdqce)];
d_qc_r = [ncread(str22a,strdqcr);ncread(str22b,strdqcr);ncread(str22c,strdqcr)];
st_qc_e = [ncread(str22a,strtqce);ncread(str22b,strtqce);ncread(str22c,strtqce)];
st_qc_r = [ncread(str22a,strtqcr);ncread(str22b,strtqcr);ncread(str22c,strtqcr)];
p_qc_e = [ncread(str22a,strpqce);ncread(str22b,strpqce);ncread(str22c,strpqce)];
p_qc_r = [ncread(str22a,strpqcr);ncread(str22b,strpqcr);ncread(str22c,strpqcr)];
c_qc_e = [ncread(str22a,strcqce);ncread(str22b,strcqce);ncread(str22c,strcqce)];
c_qc_r = [ncread(str22a,strcqcr);ncread(str22b,strcqcr);ncread(str22c,strcqcr)];

time = [ncread(str22a,strtime);ncread(str22b,strtime);ncread(str22c,strtime)];
temp = [ncread(str22a,strst);ncread(str22b,strst);ncread(str22c,strst)];
salt = [ncread(str22a,strps);ncread(str22b,strps);ncread(str22c,strps)];
dens = [ncread(str22a,strd);ncread(str22b,strd);ncread(str22c,strd)];
pres = [ncread(str22a,strp);ncread(str22b,strp);ncread(str22c,strp)];
lat = [ncread(str22a,strla);ncread(str22b,strla);ncread(str22c,strla)];
lon = [ncread(str22a,strlo);ncread(str22b,strlo);ncread(str22c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_750mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_750mB_dep123 = sortrows(GA_OOI_CTD_750mB_dep123,1);

save GA_OOI_CTD_750mB_dep123 GA_OOI_CTD_750mB_dep123 str_key str22a
%% 

%% 23
ps_qc_e = [ncread(str23a,strsqce);ncread(str23b,strsqce);ncread(str23c,strsqce)];
ps_qc_r = [ncread(str23a,strsqcr);ncread(str23b,strsqcr);ncread(str23c,strsqcr)];
d_qc_e = [ncread(str23a,strdqce);ncread(str23b,strdqce);ncread(str23c,strdqce)];
d_qc_r = [ncread(str23a,strdqcr);ncread(str23b,strdqcr);ncread(str23c,strdqcr)];
st_qc_e = [ncread(str23a,strtqce);ncread(str23b,strtqce);ncread(str23c,strtqce)];
st_qc_r = [ncread(str23a,strtqcr);ncread(str23b,strtqcr);ncread(str23c,strtqcr)];
p_qc_e = [ncread(str23a,strpqce);ncread(str23b,strpqce);ncread(str23c,strpqce)];
p_qc_r = [ncread(str23a,strpqcr);ncread(str23b,strpqcr);ncread(str23c,strpqcr)];
c_qc_e = [ncread(str23a,strcqce);ncread(str23b,strcqce);ncread(str23c,strcqce)];
c_qc_r = [ncread(str23a,strcqcr);ncread(str23b,strcqcr);ncread(str23c,strcqcr)];

time = [ncread(str23a,strtime);ncread(str23b,strtime);ncread(str23c,strtime)];
temp = [ncread(str23a,strst);ncread(str23b,strst);ncread(str23c,strst)];
salt = [ncread(str23a,strps);ncread(str23b,strps);ncread(str23c,strps)];
dens = [ncread(str23a,strd);ncread(str23b,strd);ncread(str23c,strd)];
pres = [ncread(str23a,strp);ncread(str23b,strp);ncread(str23c,strp)];
lat = [ncread(str23a,strla);ncread(str23b,strla);ncread(str23c,strla)];
lon = [ncread(str23a,strlo);ncread(str23b,strlo);ncread(str23c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_1000mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_1000mB_dep123 = sortrows(GA_OOI_CTD_1000mB_dep123,1);

save GA_OOI_CTD_1000mB_dep123 GA_OOI_CTD_1000mB_dep123 str_key str23a
%% 

%% 24
ps_qc_e = [ncread(str24a,strsqce);ncread(str24b,strsqce);ncread(str24c,strsqce)];
ps_qc_r = [ncread(str24a,strsqcr);ncread(str24b,strsqcr);ncread(str24c,strsqcr)];
d_qc_e = [ncread(str24a,strdqce);ncread(str24b,strdqce);ncread(str24c,strdqce)];
d_qc_r = [ncread(str24a,strdqcr);ncread(str24b,strdqcr);ncread(str24c,strdqcr)];
st_qc_e = [ncread(str24a,strtqce);ncread(str24b,strtqce);ncread(str24c,strtqce)];
st_qc_r = [ncread(str24a,strtqcr);ncread(str24b,strtqcr);ncread(str24c,strtqcr)];
p_qc_e = [ncread(str24a,strpqce);ncread(str24b,strpqce);ncread(str24c,strpqce)];
p_qc_r = [ncread(str24a,strpqcr);ncread(str24b,strpqcr);ncread(str24c,strpqcr)];
c_qc_e = [ncread(str24a,strcqce);ncread(str24b,strcqce);ncread(str24c,strcqce)];
c_qc_r = [ncread(str24a,strcqcr);ncread(str24b,strcqcr);ncread(str24c,strcqcr)];

time = [ncread(str24a,strtime);ncread(str24b,strtime);ncread(str24c,strtime)];
temp = [ncread(str24a,strst);ncread(str24b,strst);ncread(str24c,strst)];
salt = [ncread(str24a,strps);ncread(str24b,strps);ncread(str24c,strps)];
dens = [ncread(str24a,strd);ncread(str24b,strd);ncread(str24c,strd)];
pres = [ncread(str24a,strp);ncread(str24b,strp);ncread(str24c,strp)];
lat = [ncread(str24a,strla);ncread(str24b,strla);ncread(str24c,strla)];
lon = [ncread(str24a,strlo);ncread(str24b,strlo);ncread(str24c,strlo)];

QC = (ps_qc_e-ps_qc_r)+(d_qc_e-d_qc_r)+(st_qc_e-st_qc_r)+(p_qc_e-p_qc_r)+(c_qc_e-c_qc_r); 


len1 = length(QC);

time = time(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
temp = temp(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
salt = salt(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
dens = dens(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
pres = pres(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lat = lat(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
lon = lon(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80);
QC = double(QC(QC==0|QC==16|QC==32|QC==48|QC==64|QC==80));
depth = gsw_z_from_p(pres,lat);
time = acc_convert_time_20000101(time);

len2 = length(lon);
len_keep = len2 +len_keep;

fprintf('QC disqualified %g of %g total measurements \n \n',len1-len2,len1);

GA_OOI_CTD_1500mB_dep123 = [time,lat,lon,temp,salt,pres,dens,depth,QC];
GA_OOI_CTD_1500mB_dep123 = sortrows(GA_OOI_CTD_1500mB_dep123,1);

save GA_OOI_CTD_1500mB_dep123 GA_OOI_CTD_1500mB_dep123 str_key str24a
%% 

fprintf('Total number of measurements to pass QC: %g \n \n',len_keep)

toc()