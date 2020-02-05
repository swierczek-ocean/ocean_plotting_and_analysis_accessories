clear all

%WHICH GRID
SO3  = 0
SO6  = 1 
SO12 = 0
x = ncread('DATA/runoff.15JUNE2009.nc','lon');
y = ncread('DATA/runoff.15JUNE2009.nc','lat');
F = ncread('DATA/runoff.15JUNE2009.nc','Foxx_o_roff');%(kg/s)/m^2
F = F./1000; %m/s
x(x<0)=x(x<0)+360;
F(F>9999)=0;
F(isnan(F))=0;
%MAKE CLIM OUT OF LAST 30 YEARS
%MAP
if SO3
  fld_out = 'runoff_Core_cnyf2p0_DJ_so3_ms_V1.bin';
  load /data/soccom/GRID_3/grid hFacC XG YG RAC XC YC
  OBC = 10;
elseif SO6
  fld_out = 'runoff_Core_cnyf2p0_DJ_so6_ms_V1.bin';
  load /data/soccom/GRID_6/grid hFacC XG YG RAC XC YC
  OBC = 10;
elseif SO12
  fld_out = 'runoff_Core_cnyf2p0_DJ_so12_ms_V1.bin';
  load /data/soccom/GRID_12/grid hFacC XG YG RAC XC YC
  OBC = 20;
end
[NX NY NZ] = size(hFacC);
xi = XC(:,1);yi = YC(1,:);
FLOW=zeros(NX,NY);
%IS SMOOTH FILE SO WE WILL JUST USE INTERP
%BUILD OVERLAP
xo = single([-1.5:1:361.5]);
FO = F([end-1 end 1:end 1 2],:);
FLOW = interp2(y,xo,FO,yi,xi,'spline');
%BLANK OUT OBC
FLOW(:,NY-OBC+1:NY) = 0;
FLOW(isnan(FLOW))=0;
max(FLOW(:))  %want less than 1e-6

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
  FLOW = FLOW + DR3;
end
%CHECK NO NANS
sum(FLOW(:))
FLOW(isnan(FLOW))=0;

figure(2);clf; 
imagescnan(xi,yi,FLOW');axis xy
caxis([0 1e-7]); colorbar
  
fid=fopen([fld_out],'w','b');
fwrite(fid,FLOW,'single');
fclose(fid);

