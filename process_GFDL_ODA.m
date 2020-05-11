clear
close all
clc
tic()

strm = 'ocean.196101-201912.mld.nc';

ncdisp(strm)

XCt = ncread(strm,'xt_ocean');
YCt = ncread(strm,'yt_ocean');
XGt = ncread(strm,'xu_ocean');
YGt = ncread(strm,'yu_ocean');

XCt = XCt(206:275)+360;
YCt = YCt(18:57);
XGt = XGt(205:275)+360;
YGt = YGt(17:57);

time = ncread(strm,'time');
start_time = ncread(strm,'average_T1');
start_date = datenum('1891 01 01','yyyy mm dd');

% datestr(start_date+time(684),'yyyy mm dd')

oda_mld = ncread(strm,'mld',[206,18,673],[70,40,12]);
oda_mld(oda_mld<-1000) = NaN;

strt = 'ocean.196101-201912.temp.nc';

ncdisp(strt);

oda_theta = ncread(strt,'temp',[206,18,1,673],[70,40,50,12]);
oda_theta(oda_theta<-1000) = NaN;
strw = 'ocean.196101-201912.wt.nc';

ncdisp(strw);

oda_wvel = ncread(strw,'wt',[206,18,1,673],[70,40,50,12]);
oda_wvel(oda_wvel<-1000) = NaN;

RCt = ncread(strt,'st_ocean');
RFt = ncread(strt,'st_edges_ocean');

RCWt = ncread(strw,'sw_ocean');
RFWt = ncread(strw,'sw_edges_ocean');

save ODA XCt YCt XGt YGt oda_mld oda_theta oda_wvel RC* RF*

clear


toc()