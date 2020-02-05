clear all

%WHICH GRID
SO3  = 0
SO6  = 0 
SO12 = 1
% Read 921-rivers runoff climatology
%t = ncread('coastal-stns-Vol-monthly.updated-Aug2014.nc','time');%1380
x = ncread('coastal-stns-Vol-monthly.updated-Aug2014.nc','lon_mou');%925
y = ncread('coastal-stns-Vol-monthly.updated-Aug2014.nc','lat_mou');%925
F = ncread('coastal-stns-Vol-monthly.updated-Aug2014.nc','FLOW');%925 x 1380
x(x<0)=x(x<0)+360;
F(isnan(F))=0;
%MAKE CLIM OUT OF LAST 30 YEARS
C = F(:,1:12)*0;
for t = 1:30
  for m = 1:12
    C(:,m) = C(:,m) + F(:,1380-12*t+m);
  end
end
C = C/30;

nmon = 12;   % number of months
%MAP
if SO3
  fld_out = 'runoff_clim921rivers_DJ_so3_ms_V1.bin';
  load /data/soccom/GRID_3/grid hFacC XG YG RAC XC YC
  OBC = 10;
elseif SO6
  fld_out = 'runoff_clim921rivers_DJ_so6_ms_V1.bin';
  load /data/soccom/GRID_6/grid hFacC XG YG RAC XC YC
  OBC = 10;
elseif SO12
  fld_out = 'runoff_clim921rivers_DJ_so12_ms_V1.bin';
  load /data/soccom/GRID_12/grid hFacC XG YG RAC XC YC
  OBC = 20;
end
[NX NY NZ] = size(hFacC);
xi = XC(:,1);yi = YC(1,:);
runoff_clim_so3 = zeros(NX,NY,12);
lon = XG(:,1);lat = YG(1,:); mask = hFacC(:,:,1);clear hFacC
lon(NX+1) = lon(NX)+(lon(NX)-lon(NX-1));
lat(NY+1) = lat(NY)+(lat(NY)-lat(NY-1));
FLOW_clim_921=zeros(NX,NY,12);
m = zeros(50,1);
pm = 0
for i = 1:NX
  for j = 1:NY-OBC %DONT CARE ABOUT OBCS
    clear I
    I = find(x>=lon(i) & x<lon(i+1) & y>=lat(j) & y<lat(j+1));
    if length(I)>0
      pm = pm + 1;%WE HAVE A POINT - NOW MAKE SURE OCEAN
      w = 0;ic = i;jc=j;mvd = 0;
      w = mask(ic,jc);
      while w == 0;
        mvd = mvd + 1;
        if mask(i-mvd,j)==1;w = 1;ic = i-mvd;jc = j;
        elseif mask(i+mvd,j)==1;w = 1;ic = i+mvd;jc = j;
        elseif mask(i,j-mvd)==1;w = 1;ic = i;jc = j-mvd;
        elseif mask(i,j+mvd)==1;w = 1;ic = i;jc = j+mvd;
        elseif mask(i-mvd,j-mvd)==1;w = 1;ic = i-mvd; jc = j-mvd;
        elseif mask(i+mvd,j-mvd)==1;w = 1;ic = i+mvd; jc = j-mvd;
        elseif mask(i-mvd,j+mvd)==1;w = 1;ic = i-mvd; jc = j+mvd;
        elseif mask(i+mvd,j+mvd)==1;w = 1;ic = i+mvd; jc = j+mvd;
        end
      end
      val = sum(C(I,:));
      FLOW_clim_921(ic,jc,:) = val;m(mvd+1)=m(mvd+1)+1;
    end
  end
end
%PUT IN UNITS M/S FOR MITGCM
for t = 1:12
  FLOW_clim_921(:,:,t) = FLOW_clim_921(:,:,t)./RAC;
end
FLOW_clim_921(isnan(FLOW_clim_921))=0;
max(FLOW_clim_921(:))  %want less than 1e-6

if 1 %SOUTHERN OCEAN ONLY!
  %NOW ADD IN DAN JONES' PRODUCT FOR ANTARCTICA
  fid = fopen('runoff_NVND.bin','r','b');
  DR = fread(fid,2160*320*1,'single');
  fclose(fid);
  DR = reshape(DR,2160,320,1);
  %RESCALE TO M/S
  DR = DR*3.170979198E-8;
  load /data/SOSE/SOSE/DATA/grid XC YC
%SMOOTH THIS TO ZERO
  for j = 90:121; DR(:,j)=DR(:,j)*exp(-((j-89)/20).^2);end
  DR(:,121:320)=0;
  %THIS IS SMOOTH FILE SO WE WILL JUST USE INTERP
  %INTERP TO NEW GRID
  x6 = XC(:,1); y6 = YC(1,:);
  %BUILD OVERLAP
  x6 = [-1/3:1/6:360.3]+1/12;
  DRO = DR([end-1 end 1:end 1 2],:);
  DR3 = interp2(YC(1,:),x6,DRO,yi,xi,'spline');
  DR3(isnan(DR3))=0;
  runoff_clim_so3 = FLOW_clim_921;
  for i = 1:12
    runoff_clim_so3(:,:,i) = runoff_clim_so3(:,:,i) + DR3;
  end
end
%CHECK NO NANS
sum(runoff_clim_so3(:))
runoff_clim_so3(isnan(runoff_clim_so3))=0;


figure(2);clf; 
imagescnan(xi,yi,sum(runoff_clim_so3,3)');axis xy
caxis([0 1e-7]); colorbar
  
fid=fopen([fld_out],'w','b');
fwrite(fid,runoff_clim_so3,'single');
fclose(fid);

