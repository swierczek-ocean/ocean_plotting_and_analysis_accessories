clear
close all
clc
tic()

load ../2020_03_March_analysis/wvel3 wvel3
load ../2020_03_March_analysis/theta3 theta3
load ../2020_03_March_analysis/dic3 dic3
RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');

wvel3(isnan(wvel3)==1) = 0;
theta3(isnan(theta3)==1) = 0;
dic3(isnan(dic3)==1) = 0;

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

wvel320 = zeros(52,1);
theta320 = zeros(52,1);
dic320 = zeros(52,1);

for ii=1:52
    wvel320(ii) = sum(sum(wvel3(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    theta320(ii) = sum(sum(theta3(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    dic320(ii) = sum(sum(dic3(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except wvel320 theta320 dic320

load ../2020_03_March_analysis/wvel6 wvel6
load ../2020_03_March_analysis/theta6 theta6
load ../2020_03_March_analysis/dic6 dic6
RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');

theta6(isnan(theta6)==1) = 0;
wvel6(isnan(wvel6)==1) = 0;
dic6(isnan(dic6)==1) = 0;

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
areaBox = zeros(nz,1);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

theta620 = zeros(52,1);
wvel620 = zeros(52,1);
dic620 = zeros(52,1);

for ii=1:52
    theta620(ii) = sum(sum(theta6(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    wvel620(ii) = sum(sum(wvel6(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    dic620(ii) = sum(sum(dic6(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except theta*20 wvel*20 dic*20


load ../2020_03_March_analysis/wvel12 wvel12
load ../2020_03_March_analysis/theta12 theta12
load ../2020_03_March_analysis/dic12 dic12
RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

theta12(isnan(theta12)==1) = 0;
wvel12(isnan(wvel12)==1) = 0;
dic12(isnan(dic12)==1) = 0;

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
areaBox = zeros(nz,1);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

theta1220 = zeros(52,1);
wvel1220 = zeros(52,1);
dic1220 = zeros(52,1);

for ii=1:52
    theta1220(ii) = sum(sum(theta12(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
    wvel1220(ii) = sum(sum(wvel12(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
    dic1220(ii) = sum(sum(dic12(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
end

clearvars -except theta*20 wvel*20 dic*20

RC3 = squeeze(rdmds('../Grids/3/RC'));
RF3 = squeeze(rdmds('../Grids/3/RF'));
RF3 = RF3(1:52);

save vert_wvel_theta_dic

toc()