
% Read 921-rivers runoff climatology
%t = ncread('coastal-stns-Vol-monthly.updated-Aug2014.nc','time');%1380
fname = '/data/soccom/SO3input/RUNOFF/coastal-stns-Vol-monthly.updated-Aug2014.nc'
x = ncread(fname,'lon_mou');%925
y = ncread(fname,'lat_mou');%925
F = ncread(fname,'FLOW');%925 x 1380
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
load /data/soccom/GRID_3/grid hFacC XG YG
[NX NY NZ] = size(hFacC);
runoff_clim_so3 = zeros(NX,NY,12);
lon = XG(:,1);lat = YG(1,:); mask = hFacC(:,:,1);clear hFacC
lon(NX+1) = lon(NX)+(lon(NX)-lon(NX-1));
lat(NY+1) = lat(NY)+(lat(NY)-lat(NY-1));
FLOW_clim_921=zeros(NX,NY,12);
m = zeros(13,1);
for i = 1:NX
  for j = 1:NY-10 %DONT CARE ABOUT OBCS
    clear I
    I = find(x>=lon(i) & x<lon(i+1) & y>=lat(j) & y<lat(j+1));
    if length(I)>0
      %WE HAVE A POINT - NOW MAKE SURE OCEAN
      if mask(i,j)==1; FLOW_clim_921(i,j,:) = sum(C(I,:));m(1)=m(1)+1;
      elseif mask(i-1,j)==1; FLOW_clim_921(i-1,j,:) = sum(C(I,:));m(2)=m(2)+1;
      elseif mask(i+1,j)==1; FLOW_clim_921(i+1,j,:) = sum(C(I,:));m(3)=m(3)+1;
      elseif mask(i-1,j-1)==1; FLOW_clim_921(i-1,j-1,:) = sum(C(I,:));m(4)=m(4)+1;
      elseif mask(i+1,j-1)==1; FLOW_clim_921(i+1,j-1,:) = sum(C(I,:));m(5)=m(5)+1;
      elseif mask(i-1,j+1)==1; FLOW_clim_921(i-1,j+1,:) = sum(C(I,:));m(6)=m(6)+1;
      elseif mask(i+1,j+1)==1; FLOW_clim_921(i+1,j+1,:) = sum(C(I,:));m(7)=m(7)+1;
      elseif mask(i-2,j)==1; FLOW_clim_921(i-2,j,:) = sum(C(I,:));m(8)=m(8)+1;
      elseif mask(i+2,j)==1; FLOW_clim_921(i+2,j,:) = sum(C(I,:));m(9)=m(9)+1;
      elseif mask(i-2,j-1)==1; FLOW_clim_921(i-2,j-1,:) = sum(C(I,:));m(10)=m(10)+1;
      elseif mask(i+2,j-1)==1; FLOW_clim_921(i+2,j-1,:) = sum(C(I,:));m(11)=m(11)+1;
      elseif mask(i-2,j+1)==1; FLOW_clim_921(i-2,j+1,:) = sum(C(I,:));m(12)=m(12)+1;
      elseif mask(i+2,j+1)==1; FLOW_clim_921(i+2,j+1,:) = sum(C(I,:));m(13)=m(13)+1;
      end
    end
  end
end

break

lon = (0.5:1:359.5)'; % for 1-deg grid 
lat = (-89.5:1:89.5); % for 1-deg grid 
nlon = length(lon) ;
nlat = length(lat) ;
FLOW_clim_921 = zeros(nlon,nlat,nmon);
%BIN TO LAT LON
for i = 0:359
  for j = -90:89
    clear I
    I = find(x>=i & x<i+1 & y>=j & y<j+1);
    if length(I)>0
      FLOW_clim_921(i+1,j+91,:) = sum(C(I,:));
    end
  end
end
if 0 %CHECK AND COMPARE WITH 
  file = 'runoff-2d-921River-1deg-mon.bin'; 
  A = nan(nlat,nlon,nmon);
  fid = fopen(file,'r','b'); % 'b'==big_endian
  for i = 1:nmon
    as = fread(fid,1,'int') / 4 ;  % read the length at start of record
    B = fread(fid,as,'real*4','b');  
    A(:,:,i) = (reshape(B,[nlon nlat]))'; 
    ae = fread(fid,1,'int') / 4;  % read the length at end of record
    clear B;
  end
  fclose(fid);
  A = A*1e6;% these are in Sv units% convert to m3/s
  A = permute(A,[2 1 3]);A = repmat(A,[2 1 1]); A = A(181:540,:,:);
  FLOW_clim_921_ORIG = A; 
  clear A
end

%CROP TO A REGION IF DESIRED
lat = lat(lat>=-78 & lat<=0);
%lon = lon(lon>=104 & lon<=292);

% MAP
load /data/soccom/GRID_3/grid hFacC XC YC RAC
[NX NY NZ] = size(hFacC);
runoff_clim_so3 = zeros(NX,NY,12);

count = 0;
for t=1:12
  for i=1:length(lon)
    for j=1:length(lat)
    
  if FLOW_clim_921(i,j,t) > 0;

    [~,lon_ind] = min((lon(i)-(XC(:,1))).^2);
    [~,lat_ind] = min((lat(j)-YC(1,:)).^2);
    
%   if lat_ind > NY-8; lat_ind = NY-8; end %benign -- just for processing

    %check land/water
    rv = 9999; 
    r = 0;
    while rv > 3e-7
       r = r + 1;
       jmx = min([NY lat_ind+r]);
       mu = hFacC(lon_ind-r:lon_ind+r,lat_ind-r:jmx,1);
       if sum(mu(:))==0; rv = 9999;
       else %we have a wet spot
          denom = sum(sum((RAC(lon_ind-r:lon_ind+r,lat_ind-r:jmx).*mu)));
          rv = FLOW_clim_921(i,j,t)/denom;
       end
       if r > 12 
         rv = 0;
         count = count + 1; %check whats missing
         i_blank(count) = lon_ind;
         j_blank(count) = lat_ind;
       end
    end        
      
    runoff_clim_so3(lon_ind-r:lon_ind+r,lat_ind-r:jmx,t) = ...
            runoff_clim_so3(lon_ind-r:lon_ind+r,lat_ind-r:jmx,t) + rv;
  end
    
end
end
end

for t = 1:12
runoff_clim_so3(:,:,t) = hFacC(:,:,1).*runoff_clim_so3(:,:,t);
end

%CHECK NO NANS
sum(runoff_clim_so3(:))
 
max(runoff_clim_so3(:))   
%want less than 1e-6

%NOW ADD IN DAN JONES' PRODUCT FOR ANTARCTICA
fid = fopen('/data/soccom/runoff_NVND.bin','r','b');
DR = fread(fid,2160*320*1,'single');
fclose(fid);
DR = reshape(DR,2160,320,1);
%RESCALE
DR = DR*3.170979198E-8;
%ONLY USE ANTARCTICA
DR(:,131:end) = 0;
%INTERP TO NEW GRID
load /data/soccom/GRID_3/grid hFacC XC YC RAC
x = XC(:,1); y = YC(1,:);
DR3 = interp2(y6,x6,DR,y,x);
DR3(isnan(DR3))=0;

for i = 1:12
runoff_clim_so3(:,:,i) = runoff_clim_so3(:,:,i) + DR3;
end

%CHECK NO NANS
sum(runoff_clim_so3(:))
runoff_clim_so3(isnan(runoff_clim_so3))=0;


figure(2);clf; 
pcolor(XC,YC,mean(runoff_clim_so3,3)); shading flat; 
caxis([0 1e-7]); colorbar
hold on
contour(XC,YC,hFacC(:,:,1), 'k-', 'linewidth', 1); 
plot(XC(i_blank,1),YC(1,j_blank),'wo')
plot(XC(i_blank,1),YC(1,j_blank),'k+')


if 0
  fid=fopen('runoff_clim921rivers_DJ_so3_ms_V0.bin','w','b');
  fwrite(fid,runoff_clim_so3,'single');
  fclose(fid);
end

if 1 
  %AND WHILE AT IT MAP TO 1/6
  load /data/soccom/GRID_6/grid XC YC
  [NX NY] = size(XC);
  x12 = XC(:,1); y12 = YC(1,:); clear XC YC
  runoff_clim_so6 = zeros(NX,NY,12,'single');
  if 1
    xp = x([1 1:1080 1080],1);
    xp(1) = xp(1)-1/3;xp(1082) = xp(1082)+1/3;
    for i = 1:12
      runoff_clim_so6(:,:,i) = interp2(y,xp,runoff_clim_so3([1080 1:1080 1],:,i),y12,x12);
    end
  end
end
  figure(6);clf
  imagescnan(x12,y12,mean(runoff_clim_so6,3)'); axis xy; colorbar

  sum(runoff_clim_so6(:))
  runoff_clim_so12(isnan(runoff_clim_so6))=0;
  fid=fopen('runoff_clim921rivers_DJ_so6_ms_V0c.bin','w','b');
  fwrite(fid,runoff_clim_so6,'single');
  fclose(fid);


if 0 
  %AND WHILE AT IT MAP TO 1/12
  load /net/mdata9/soccom/GRID_12/grid XC YC
  [NX NY] = size(XC);
  x12 = XC(:,1); y12 = YC(1,:); clear XC YC
  runoff_clim_so12 = zeros(NX,NY,12,'single');
  if 1
    xp = x([1 1:1080 1080],1);
    xp(1) = xp(1)-1/3;xp(1082) = xp(1082)+1/3;
    for i = 1:12
      runoff_clim_so12(:,:,i) = interp2(y,xp,runoff_clim_so3([1080 1:1080 1],:,i),y12,x12);
    end
  end

  figure(12);clf
  imagescnan(x12,y12,mean(runoff_clim_so12,3)'); axis xy; colorbar

  sum(runoff_clim_so12(:))
  runoff_clim_so12(isnan(runoff_clim_so12))=0;

  fid=fopen('runoff_clim921rivers_DJ_so12_ms_V0.bin','w','b');
  fwrite(fid,runoff_clim_so12,'single');
  fclose(fid);
end

