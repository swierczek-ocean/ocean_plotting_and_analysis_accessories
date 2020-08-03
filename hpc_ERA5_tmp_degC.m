clear
close all
clc
tic()

y(1) = -89.7848850;
dy = [0.2786766,0.2803199,0.2806917,0.2808328,0.2809011,0.2809392,0.2809626,0.2809781, ...
      0.2809888,0.2809965,0.2810023,0.2810067,0.2810102,0.2810129,0.2810151,...
      ones(1,33)*0.2810258,ones(1,543)*0.2810302,ones(1,33)*0.2810258,...
      0.2810151,0.2810129,0.2810102,0.2810067,0.2810023,0.2809965,0.2809888,0.2809781,...
      0.2809626,0.2809392,0.2809011,0.2808328,0.2806917,0.2803199,0.2786766];
NY = length(dy)+1;
for i = 2:NY
  y(i) = y(i-1) + dy(i-1);
end
NX = 1280;
x(1) = 0;
for i = 2:NX
  x(i) = x(i-1) + 0.2812500;
end

ii = find(x>(360-42.45),1)-1;
jj = find(y>-42.92,1);


fid = fopen('/xdisk/jrussell/mig2020/rsgrps/jrussell/SOSE/SO6/ERA5/ERA5_tmp2m_degC_2015','r','b');
Q = single(fread(fid,inf,'single'));
fclose(fid);
NT = length(Q)/NX/NY
Q = reshape(Q,[NX,NY,NT]);

ERA5_tmp2m_degC_2015 = squeeze(Q(ii,jj,:));

clear Q

fid = fopen('/xdisk/jrussell/mig2020/rsgrps/jrussell/SOSE/SO6/ERA5/ERA5_tmp2m_degC_2016','r','b');
Q = single(fread(fid,inf,'single'));
fclose(fid);
NT = length(Q)/NX/NY
Q = reshape(Q,[NX,NY,NT]);

ERA5_tmp2m_degC_2016 = squeeze(Q(ii,jj,:));

clear Q

fid = fopen('/xdisk/jrussell/mig2020/rsgrps/jrussell/SOSE/SO6/ERA5/ERA5_tmp2m_degC_2017','r','b');
Q = single(fread(fid,inf,'single'));
fclose(fid);
NT = length(Q)/NX/NY
Q = reshape(Q,[NX,NY,NT]);

ERA5_tmp2m_degC_2017 = squeeze(Q(ii,jj,:));

clear Q

ERA5_tmp2m_degC = [ERA5_tmp2m_degC_2015;ERA5_tmp2m_degC_2016;ERA5_tmp2m_degC_2017];

lat = y(jj);
lon = x(ii);
str_exp = 'hourly data from 2015 through 2017';

save ERA5_tmp2m_degC ERA5_tmp2m_degC lat lon

toc()