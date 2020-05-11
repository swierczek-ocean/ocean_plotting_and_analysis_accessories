clear
close all
clc
tic()


Depth12 = rdmds('Depth');
load ../2020_04_April_analysis/fluxes
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);

for ii=1:17
    tflux3(:,:,ii) = fillmissingstan(tflux3(:,:,ii));
    tflux6(:,:,ii) = fillmissingstan(tflux6(:,:,ii));
    tflux12(:,:,ii) = fillmissingstan(tflux12(:,:,ii));
    tfluxsoda(:,:,ii) = fillmissingstan(tfluxsoda(:,:,ii));
end

tfluxera3 = zeros(192,132,17);
tfluxera6 = zeros(384,260,17);
tfluxera12 = zeros(756,512,17);
tfluxeccoera = zeros(281,161,17);
tfluxsodaera = zeros(281,161,17);

F = griddedInterpolant(XC12,YC12,Depth12,'linear');
eradepth = F(long,lat);


for ii=1:17
    F = griddedInterpolant(XCS,YCS,tfluxsoda(:,:,ii),'linear');
    sodaera = F(long,lat);
    tfluxsodaera(:,:,ii) = sodaera - tfluxera(:,:,ii);
    clear sodaera
    
    F = griddedInterpolant(long,lat,tfluxera(:,:,ii),'linear');
    era3 = F(XC3,YC3);
    tfluxera3(:,:,ii) = tflux3(:,:,ii) - era3;
    clear era3
    era6 = F(XC6,YC6);
    tfluxera6(:,:,ii) = tflux6(:,:,ii) - era6;
    clear era6    
    era12 = F(XC12,YC12);
    tfluxera12(:,:,ii) = tflux12(:,:,ii) - era12;
    clear era12 
    
    F = griddedInterpolant(elon,elat,tfluxecco(:,:,ii),'linear');
    eccoera = F(long,lat);
    tfluxeccoera(:,:,ii) = eccoera - tfluxera(:,:,ii);
    clear eccoera
end


eratflxrmse3 = zeros(12,1);
eratflxrmse6 = zeros(12,1);
eratflxrmse12 = zeros(12,1);
eccotflxrmseera = zeros(12,1);
sodatflxrmseera = zeros(12,1);

RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');

x = 6:170;
y = 29:119;
z = 1:52;

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC(:,:,1);
[nx,ny,~] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:1
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,42)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = hFacC_ind(:,:).*RAC(x,y);
areaBox = sum(sum(areaTop));
count = sum(sum(hFacC_ind));

for ii=1:12
    temp = tfluxera3(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxera3(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eratflxrmse3(ii) = sqrt(sum(temp.^2));%./sqrt(count);
end

RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');

x = 11:340;
y = 54:235;
z = 1:52; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC(:,:,1);
[nx,ny,~] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:1
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,42)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = hFacC_ind(:,:).*RAC(x,y);
areaBox = sum(sum(areaTop));
count = sum(sum(hFacC_ind));

for ii=1:12
    temp = tfluxera6(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxera6(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eratflxrmse6(ii) = sqrt(sum(temp.^2));%./sqrt(count);
end

RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

x = 17:676;
y = 106:467;
z = 1:104; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC(:,:,1);
[nx,ny,~] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:1
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,42)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = hFacC_ind(:,:).*RAC(x,y);
areaBox = sum(sum(areaTop));
count = sum(sum(hFacC_ind));

for ii=1:12
    temp = tfluxera12(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxera12(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eratflxrmse12(ii) = sqrt(sum(temp.^2));%./sqrt(count);
end

x = 22:240;
y = 42:121;

eradepth = eradepth(x,y);
[nn,mm] = size(eradepth);
eramask = zeros(nn,mm);

for ii=1:nn
    for jj=1:mm
        if eradepth(ii,jj)>2000
            eramask(ii,jj) = 1;
        end
    end
end

count = sum(sum(eramask));

for ii=1:12
    temp = tfluxsodaera(x,y,ii).*eramask;
    temp = temp(isnan(temp)==0);
    sodatflxrmseera(ii) = sqrt(sum(temp.^2))./sqrt(count);
    temp = tfluxeccoera(x,y,ii).*eramask;
    temp = temp(isnan(temp)==0);
    eccotflxrmseera(ii) = sqrt(sum(temp.^2))./sqrt(count);
end

save TFLX_RMSE_2 *tflxrmse*

load ../2020_04_April_analysis/fluxes tflux3 tflux6 tflux12
F = griddedInterpolant(XC12,YC12,Depth12,'linear');
eradepth = F(long,lat);

tfluxera3(isnan(tflux3)==1) = NaN;
tfluxera6(isnan(tflux6)==1) = NaN;
tfluxera12(isnan(tflux12)==1) = NaN;

for ii=1:17
    temp = tfluxeccoera(:,:,ii);
    temp(eradepth==0) = NaN;
    tfluxeccoera(:,:,ii) = temp;
    
    temp = tfluxsodaera(:,:,ii);
    temp(eradepth==0) = NaN;
    tfluxsodaera(:,:,ii) = temp;
end

save flux_diffs tfluxera* tfluxeccoera tfluxsodaera XC* YC* long lat


toc()