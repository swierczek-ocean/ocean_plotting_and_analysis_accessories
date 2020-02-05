clear
close all
clc
tic()

%% 1/12
XC12 = rdmds('../Grids/12/XC');
YC12 = rdmds('../Grids/12/YC');
load grid12 XC YC

temp = XC(:,1);
xmin = find(temp>285,1);
xmax = find(temp>355,1);
temp = YC(1,:);
ymin = find(temp>-62,1);
ymax = find(temp>-28,1);
clear temp

XC = XC(xmin:xmax,ymin:ymax);
YC = YC(xmin:xmax,ymin:ymax);

% [XC,YC] = latlon_to_meters(XC,YC);
% [XC12,YC12] = latlon_to_meters(XC12,YC12);

fid = fopen('runoff_Core_cnyf2p0_DJ_so12_ms_V1.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[4320,1260]);
fclose(fid);

U = U(xmin:xmax,ymin:ymax);

F = griddedInterpolant(XC,YC,U,'linear');
U = F(XC12,YC12);


fid = fopen('runoff_Core_cnyf2p0_DJ_ab12_ms_V1.bin','w','b');
fwrite(fid,U,'single');
fclose(fid);

%% 1/12

%% 1/6
XC6 = rdmds('../Grids/6/XC');
YC6 = rdmds('../Grids/6/YC');
load grid6 XC YC

temp = XC(:,1);
xmin = find(temp>285,1);
xmax = find(temp>355,1);
temp = YC(1,:);
ymin = find(temp>-62,1);
ymax = find(temp>-28,1);
clear temp

XC = XC(xmin:xmax,ymin:ymax);
YC = YC(xmin:xmax,ymin:ymax);

% [XC,YC] = latlon_to_meters(XC,YC);
% [XC6,YC6] = latlon_to_meters(XC6,YC6);

fid = fopen('runoff_Core_cnyf2p0_DJ_so6_ms_V1.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[2160,630]);
fclose(fid);

U = U(xmin:xmax,ymin:ymax);

F = griddedInterpolant(XC,YC,U,'linear');
U = F(XC6,YC6);


fid = fopen('runoff_Core_cnyf2p0_DJ_ab6_ms_V1.bin','w','b');
fwrite(fid,U,'single');
fclose(fid);

%% 1/6

%% 1/3
XC3 = rdmds('../Grids/3/XC');
YC3 = rdmds('../Grids/3/YC');
load grid3 XC YC

temp = XC(:,1);
xmin = find(temp>285,1);
xmax = find(temp>355,1);
temp = YC(1,:);
ymin = find(temp>-62,1);
ymax = find(temp>-28,1);
clear temp

XC = XC(xmin:xmax,ymin:ymax);
YC = YC(xmin:xmax,ymin:ymax);

% [XC,YC] = latlon_to_meters(XC,YC);
% [XC3,YC3] = latlon_to_meters(XC3,YC3);

fid = fopen('runoff_Core_cnyf2p0_DJ_so3_ms_V1.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[1080,315]);
fclose(fid);

U = U(xmin:xmax,ymin:ymax);

F = griddedInterpolant(XC,YC,U,'linear');
U = F(XC3,YC3);


fid = fopen('runoff_Core_cnyf2p0_DJ_ab3_ms_V1.bin','w','b');
fwrite(fid,U,'single');
fclose(fid);

%% 1/3







toc()