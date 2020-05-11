clear
close all
clc
tic()

load ../2020_04_April_analysis/fluxes
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);

tfluxsoda3 = zeros(192,132,12);
tfluxera3 = zeros(192,132,12);
tfluxecco3 = zeros(192,132,12);
tfluxsoda6 = zeros(384,260,12);
tfluxera6 = zeros(384,260,12);
tfluxecco6 = zeros(384,260,12);
tfluxsoda12 = zeros(756,512,12);
tfluxera12 = zeros(756,512,12);
tfluxecco12 = zeros(756,512,12);


for ii=1:12
    F = griddedInterpolant(XCS,YCS,tfluxsoda(:,:,ii),'linear');
    soda3 = F(XC3,YC3);
    tfluxsoda3(:,:,ii) = tflux3(:,:,ii) - soda3;
    clear soda3
    soda6 = F(XC6,YC6);
    tfluxsoda6(:,:,ii) = tflux6(:,:,ii) - soda6;
    clear soda6    
    soda12 = F(XC12,YC12);
    tfluxsoda12(:,:,ii) = tflux12(:,:,ii) - soda12;
    clear soda12 
    
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
    ecco3 = F(XC3,YC3);
    tfluxecco3(:,:,ii) = tflux3(:,:,ii) - ecco3;
    clear ecco3
    ecco6 = F(XC6,YC6);
    tfluxecco6(:,:,ii) = tflux6(:,:,ii) - ecco6;
    clear ecco6    
    ecco12 = F(XC12,YC12);
    tfluxecco12(:,:,ii) = tflux12(:,:,ii) - ecco12;
    clear ecco12 
end


eratflxrmse3 = zeros(12,1);
eccotflxrmse3 = zeros(12,1);
sodatflxrmse3 = zeros(12,1);
eratflxrmse6 = zeros(12,1);
eccotflxrmse6 = zeros(12,1);
sodatflxrmse6 = zeros(12,1);
eratflxrmse12 = zeros(12,1);
eccotflxrmse12 = zeros(12,1);
sodatflxrmse12 = zeros(12,1);

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
    temp = tfluxsoda3(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxsoda3(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    sodatflxrmse3(ii) = sqrt(sum(temp.^2));%./sqrt(count);
    temp = tfluxera3(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxera3(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eratflxrmse3(ii) = sqrt(sum(temp.^2));%./sqrt(count);
    temp = tfluxecco3(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxecco3(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eccotflxrmse3(ii) = sqrt(sum(temp.^2));%./sqrt(count);
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
    temp = tfluxsoda6(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxsoda6(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    sodatflxrmse6(ii) = sqrt(sum(temp.^2));%./sqrt(count);
    temp = tfluxera6(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxera6(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eratflxrmse6(ii) = sqrt(sum(temp.^2));%./sqrt(count);
    temp = tfluxecco6(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxecco6(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eccotflxrmse6(ii) = sqrt(sum(temp.^2));%./sqrt(count);
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
    temp = tfluxsoda12(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxsoda12(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    sodatflxrmse12(ii) = sqrt(sum(temp.^2));%./sqrt(count);
    temp = tfluxera12(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxera12(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eratflxrmse12(ii) = sqrt(sum(temp.^2));%./sqrt(count);
    temp = tfluxecco12(x,y,ii).*sqrt(areaTop./areaBox);
%     temp = tfluxecco12(x,y,ii).*hFacC_ind;
    temp = temp(isnan(temp)==0);
    eccotflxrmse12(ii) = sqrt(sum(temp.^2));%./sqrt(count);
end

save TFLX_RMSE *tflxrmse*

toc()