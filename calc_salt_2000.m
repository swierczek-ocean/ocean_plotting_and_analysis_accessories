clear
close all
clc
tic()

load monthly3 salt3 wvel3 theta3 XC3 YC3 RC3 RF3
RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');

salt3(isnan(salt3)==1) = 0;
theta3(isnan(theta3)==1) = 0;
wvel3(isnan(wvel3)==1) = 0;

x = 6:170;
y = 29:119;
z = 1:52; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,42)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = zeros(nx,ny,nz);
areaBox = zeros(1,nz);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

salt312 = zeros(52,12);
theta312 = zeros(52,12);
wvel312 = zeros(52,12);

for jj=1:12
    for ii=1:52
        salt312(ii,jj) = sum(sum(salt3(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
        theta312(ii,jj) = sum(sum(theta3(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
        wvel312(ii,jj) = sum(sum(wvel3(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
    end
end

save month_3 salt312 theta312 wvel312 RF3 RC3

clear

load monthly6 salt6 wvel6 theta6 XC6 YC6 RC6 RF6
RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');

salt6(isnan(salt6)==1) = 0;
theta6(isnan(theta6)==1) = 0;
wvel6(isnan(wvel6)==1) = 0;

x = 11:340;
y = 54:235;
z = 1:52; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,42)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = zeros(nx,ny,nz);
areaBox = zeros(1,nz);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

salt612 = zeros(52,12);
theta612 = zeros(52,12);
wvel612 = zeros(52,12);

for jj=1:12
    for ii=1:52
        salt612(ii,jj) = sum(sum(salt6(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
        theta612(ii,jj) = sum(sum(theta6(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
        wvel612(ii,jj) = sum(sum(wvel6(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
    end
end

save month_6 salt612 theta612 wvel612 RF6 RC6

clear

load monthly12 salt12 wvel12 theta12 XC12 YC12 RC12 RF12
RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

salt12(isnan(salt12)==1) = 0;
theta12(isnan(theta12)==1) = 0;
wvel12(isnan(wvel12)==1) = 0;

x = 17:676;
y = 106:467;
z = 1:104; 

hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,85)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = zeros(nx,ny,nz);
areaBox = zeros(1,nz);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

salt1212 = zeros(52,12);
theta1212 = zeros(52,12);
wvel1212 = zeros(52,12);

for jj=1:12
    for ii=1:52
        salt1212(ii,jj) = sum(sum(salt12(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
        theta1212(ii,jj) = sum(sum(theta12(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
        wvel1212(ii,jj) = sum(sum(wvel12(x,y,ii,jj).*areaTop(:,:,ii)))./areaBox(ii);
    end
end

save month_12 salt1212 theta1212 wvel1212 RF12 RC12

clear



toc()