clear
close all
clc
tic()

str = 'adaptor.mars.internal-1616704907.2759042-7741-17-4db63667-d0b0-4b4f-b035-0ec24bab086f.nc'; 

ncdisp(str);

long = ncread(str,'longitude');
long = long + 360;
lat = ncread(str,'latitude');
lat = lat';
lat = fliplr(lat);

[long,lat] = ndgrid(long,lat);

slhf = ncread(str,'slhf');
ssr = ncread(str,'ssrdc');
sshf = ncread(str,'sshf');
str = ncread(str,'strdc');

syr = 60*60*24*365.25/12;

slhf(slhf==-32767) = NaN;
str(str==-32767) = NaN;
sshf(sshf==-32767) = NaN;
ssr(ssr==-32767) = NaN;

slhf = slhf./syr;
str = str./syr;
sshf = sshf./syr;
ssr = ssr./syr;

thf = sshf + slhf + ssr + str;
thf = fliplr(thf);

load XY12 XC12 YC12
[XC12,YC12] = ndgrid(XC12,YC12);

thfinterp = zeros(756,512,60);

for ii=1:60
    F = griddedInterpolant(long,lat,thf(:,:,ii),'linear');
    thfinterp(:,:,ii) = F(XC12,YC12);
end


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
eratflux = zeros(60,1);

for ii=1:60
    eratflux(ii) = sum(sum(thfinterp(x,y,ii).*areaTop))./areaBox;
end

fprintf('ERA5 heat flux over AB in 2010-2014 has mean %g +/- %g W/m^2 \n',...
    mean(eratflux),std(eratflux,0))

toc()