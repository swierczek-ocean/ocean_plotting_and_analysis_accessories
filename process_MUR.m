clear
close all
clc
tic()

dates = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd')];


strm = 'MUR/MUR-JPL-L4-GLOB-v4.1_Jan.nc';

ncdisp(strm)
murlat = ncread(strm,'lat');
murlon = ncread(strm,'lon');
strm = 'MUR/MUR-JPL-L4-GLOB-v4.1_';

murmonth = zeros(1401,801,12);
murlat = murlat(1:5:4001);
murlon = murlon(1:5:7001);
murlon = murlon + 360;

for ii=1:12
    ii
    str = [strm,datestr(dates(ii),'mmm'),'.nc'];
    temp = ncread(str,'analysed_sst');
    murmonth(:,:,ii) = mean(temp(1:5:7001,1:5:4001,:),3);
    clear temp
end

murmonth = murmonth - 273.15;

save MURm murlat murlon murmonth

clear murmonth

murday = zeros(701,401,365);
md = [0,31,28,31,30,31,30,31,31,30,31,30,31];
cmd = cumsum(md);

for ii=1:12
    ii
    str = [strm,datestr(dates(ii),'mmm'),'.nc'];
    temp = ncread(str,'analysed_sst');
    murday(:,:,(cmd(ii)+1):cmd(ii+1)) = temp(1:10:7001,1:10:4001,:);
    clear temp
end



murlat = murlat(1:10:4001);
murlon = murlon(1:10:7001);
murlon = murlon + 360;
murday = murday - 273.15;

save MURd murlatc murlonc murday

clear









toc()