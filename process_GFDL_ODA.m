clear
close all
clc
tic()

strm = 'ocean.196101-201912.mld.nc';

% ncdisp(strm)

XCt = ncread(strm,'xt_ocean');
YCt = ncread(strm,'yt_ocean');
time = ncread(strm,'time');
start_time = ncread(strm,'average_T1');
start_date = datenum('1891 01 01','yyyy mm dd');

% datestr(start_date+time(684),'yyyy mm dd')

oda_mld = ncread(strm,'mld',[206,18,673],[70,40,12]);

strt = 'ocean.196101-201912.temp.nc';

% ncdisp(strt);

oda_theta = ncread(strt,'temp',[206,18,1,673],[70,40,50,12]);

strw = 'ocean.196101-201912.wt.nc';

ncdisp(strw);

oda_wvel = ncread(strw,'wt',[206,18,1,673],[70,40,50,12]);

save ODA XCt YCt oda_mld oda_theta oda_wvel

clear


toc()