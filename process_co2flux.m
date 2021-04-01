clear
close all
clc
tic()

% load landschutzer2018_sose_grid6 co2flux_interp time_land
% 
% co2flux_cmip = co2flux_interp(:,:,337:396);
% clear co2flux_interp
% 
% datestr(time_land(337),'mmm dd yyyy')
% datestr(time_land(396),'mmm dd yyyy')
% 
% save co2flux_2010_4 co2flux_cmip
% 
% load co2flux_2010_4
% 
% co2flux_cmip = co2flux_cmip(1711:end,179:608,:);
% 
% save co2flux_2010_4 co2flux_cmip

load co2flux_2010_4

co2flux_cmip = -12.*co2flux_cmip;

load ../PhaseII/input6/6grid/grid XC YC

XCB = XC(1711:end,179:608);
YCB = YC(1711:end,179:608);

str = 'JMA_co2map_2010.nc';
% ncdisp(str)

jflux = zeros(360,180,60);

jlon = ncread(str,'lon');
jlat = ncread(str,'lat');
jflux(:,:,1:12) = ncread(str,'flux');

str = 'JMA_co2map_2011.nc';
jflux(:,:,13:24) = ncread(str,'flux');

str = 'JMA_co2map_2012.nc';
jflux(:,:,25:36) = ncread(str,'flux');

str = 'JMA_co2map_2013.nc';
jflux(:,:,37:48) = ncread(str,'flux');

str = 'JMA_co2map_2014.nc';
jflux(:,:,49:60) = ncread(str,'flux');

jflux = -12.*jflux;

str = 'dataset-carbon-rep-monthly_1616733622647.nc';

clon = ncread(str,'longitude');
clat = ncread(str,'latitude');
cfgco2 = ncread(str,'fgco2');

cfgco2 = 1000*60*60*24*365.*cfgco2;

[jlon,jlat] = ndgrid(jlon,jlat');
[clon,clat] = ndgrid(clon,clat');

load XY12 XC12 YC12
[XC12,YC12] = ndgrid(XC12,YC12);

landinterp = zeros(756,512,60);
jinterp = zeros(756,512,60);
cinterp = zeros(756,512,60);

for ii=1:60
    F = griddedInterpolant(XCB,YCB,co2flux_cmip(:,:,ii),'linear');
    landinterp(:,:,ii) = F(XC12,YC12);
    F = griddedInterpolant(jlon,jlat,jflux(:,:,ii),'linear');
    jinterp(:,:,ii) = F(XC12,YC12);
    F = griddedInterpolant(clon,clat,cfgco2(:,:,ii),'linear');
    cinterp(:,:,ii) = F(XC12,YC12);
end

landinterp(isnan(landinterp)==1) = 0;
jinterp(isnan(jinterp)==1) = 0;
cinterp(isnan(cinterp)==1) = 0;


RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

x = 17:676;
y = 106:467;
z = 1:104; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC(:,:,1);
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:1
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,85)<1
            hFacC_ind(ii,jj) = 0;
        end
    end
end

areaTop = hFacC_ind.*RAC(x,y);
areaBox = sum(sum(areaTop));
landflux = zeros(60,1);
jmflux = zeros(60,1);
cmflux = zeros(60,1);

for ii=1:60
    landflux(ii) = sum(sum(landinterp(x,y,ii).*areaTop))./areaBox;
    jmflux(ii) = sum(sum(jinterp(x,y,ii).*areaTop))./areaBox;
    cmflux(ii) = sum(sum(cinterp(x,y,ii).*areaTop))./areaBox;
end

fprintf('land co2 flux over AB in 2010-2014 has mean %g +/- %g g/m^2/yr \n',...
    mean(landflux),std(landflux,0))
fprintf('jma co2 flux over AB in 2010-2014 has mean %g +/- %g g/m^2/yr \n',...
    mean(jmflux),std(jmflux,0))
fprintf('cmems co2 flux over AB in 2010-2014 has mean %g +/- %g g/m^2/yr \n',...
    mean(cmflux),std(cmflux,0))

A = landflux;
B = jmflux;
C = cmflux;
A = A - mean(A);
B = B - mean(B);
C = C - mean(C);
D = [A;B;C];
mean(D)
std(D,0)

toc()