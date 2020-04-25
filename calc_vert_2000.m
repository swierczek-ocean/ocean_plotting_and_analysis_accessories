clear
close all
clc
tic()

load ../2020_03_March_analysis/eddyt3calc eddy*
load ../2020_03_March_analysis/eddyc3calc eddy*
RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');
XC3i = rdmds('../Grids/3/XC');
YC3i = rdmds('../Grids/3/YC');

eddyt3calc(isnan(eddyt3calc)==1) = 0;
eddyc3calc(isnan(eddyc3calc)==1) = 0;

x = 6:170;
y = 29:119;
z = 1:52; 

% XC3i = XC3i(x,y);
% YC3i = YC3i(x,y);

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

eddy3tv = zeros(52,1);
eddy3cv = zeros(52,1);

for ii=1:52
    eddy3tv(ii) = sum(sum(eddyt3calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    eddy3cv(ii) = sum(sum(eddyc3calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

hFacC3 = zeros(192,132);
hFacC3(x,y) = hFacC_ind(:,:,1);
save XY3i XC3i YC3i hFacC3

clearvars -except eddy3tv eddy3cv

load ../2020_03_March_analysis/eddyt6calc eddy*
load ../2020_03_March_analysis/eddyc6calc eddy*
RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');
XC6i = rdmds('../Grids/6/XC');
YC6i = rdmds('../Grids/6/YC');

eddyt6calc(isnan(eddyt6calc)==1) = 0;
eddyc6calc(isnan(eddyc6calc)==1) = 0;

x = 11:340;
y = 54:235;
z = 1:52; 

% XC6i = XC6i(x,y);
% YC6i = YC6i(x,y);

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

eddy6tv = zeros(52,1);
eddy6cv = zeros(52,1);

for ii=1:52
    eddy6tv(ii) = sum(sum(eddyt6calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    eddy6cv(ii) = sum(sum(eddyc6calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

hFacC6 = zeros(384,260);
hFacC6(x,y) = hFacC_ind(:,:,1);
save XY6i XC6i YC6i hFacC6

clearvars -except eddy6tv eddy6cv eddy3tv eddy3cv

load ../2020_03_March_analysis/eddyt12calc eddy*
load ../2020_03_March_analysis/eddyc12calc eddy*
RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');
XC12i = rdmds('../Grids/12/XC');
YC12i = rdmds('../Grids/12/YC');

eddyt12calc(isnan(eddyt12calc)==1) = 0;
eddyc12calc(isnan(eddyc12calc)==1) = 0;

x = 17:676;
y = 106:467;
z = 1:104; 

% XC12i = XC12i(x,y);
% YC12i = YC12i(x,y);

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

eddy12tv = zeros(52,1);
eddy12cv = zeros(52,1);

for ii=1:52
    eddy12tv(ii) = sum(sum(eddyt12calc(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
    eddy12cv(ii) = sum(sum(eddyc12calc(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
end

hFacC12 = zeros(756,512);
hFacC12(x,y) = hFacC_ind(:,:,1);
save XY12i XC12i YC12i hFacC12

clearvars -except eddy12tv eddy12cv eddy6tv eddy6cv eddy3tv eddy3cv

save vert_eddy_2000

toc()