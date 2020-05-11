clear
close all
clc
tic()

load ../2020_03_March_analysis/eddyt3 wtheta3
load ../2020_03_March_analysis/eddyc3 wdic3
RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');

mask3 = zeros(192,132);

eddyt3calc = wtheta3;
eddyc3calc = wdic3;

clear wtheta3 wdic3

eddyt3calc(isnan(eddyt3calc)==1) = 0;
eddyc3calc(isnan(eddyc3calc)==1) = 0;

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

mask3(x,y) = hFacC_ind(:,:,1);
save mask3 mask3

areaTop = zeros(nx,ny,nz);
areaBox = zeros(1,nz);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

w3tv = zeros(52,1);
w3cv = zeros(52,1);

for ii=1:52
    w3tv(ii) = sum(sum(eddyt3calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    w3cv(ii) = sum(sum(eddyc3calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except w3tv w3cv

load ../2020_03_March_analysis/eddyt6 wtheta6
load ../2020_03_March_analysis/eddyc6 wdic6
RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');
mask6 = zeros(384,260);

eddyt6calc = wtheta6;
eddyc6calc = wdic6;

clear wtheta6 wdic6

eddyt6calc(isnan(eddyt6calc)==1) = 0;
eddyc6calc(isnan(eddyc6calc)==1) = 0;

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

mask6(x,y) = hFacC_ind(:,:,1);
save mask6 mask6

areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

w6tv = zeros(52,1);
w6cv = zeros(52,1);

for ii=1:52
    w6tv(ii) = sum(sum(eddyt6calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    w6cv(ii) = sum(sum(eddyc6calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except w6tv w6cv w3tv w3cv

load ../2020_03_March_analysis/eddyt12 wtheta12
load ../2020_03_March_analysis/eddyc12 wdic12
RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');
mask12 = zeros(756,512);

eddyt12calc = wtheta12;
eddyc12calc = wdic12;

clear wtheta12 wdic12

eddyt12calc(isnan(eddyt12calc)==1) = 0;
eddyc12calc(isnan(eddyc12calc)==1) = 0;

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
mask12(x,y) = hFacC_ind(:,:,1);
save mask12 mask12

areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

w12tv = zeros(52,1);
w12cv = zeros(52,1);

for ii=1:52
    w12tv(ii) = sum(sum(eddyt12calc(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
    w12cv(ii) = sum(sum(eddyc12calc(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
end

clearvars -except w12tv w12cv w6tv w6cv w3tv w3cv

save vert_stuff_2000

toc()