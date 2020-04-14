clear
close all
clc
tic()

load wvel3 wvel3
load theta3 theta3
load dic3 dic3
RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');

eddyt3calc = wvel3.*theta3;
eddyc3calc = wvel3.*dic3;

clear wvel* dic* theta*

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
        if hFacC(ii,jj,21)<1
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

eddy3tv2 = zeros(52,1);
eddy3cv2 = zeros(52,1);

for ii=1:52
    eddy3tv2(ii) = sum(sum(eddyt3calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    eddy3cv2(ii) = sum(sum(eddyc3calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except eddy3tv2 eddy3cv2

load wvel6 wvel6
load theta6 theta6
load dic6 dic6
RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');

eddyt6calc = wvel6.*theta6;
eddyc6calc = wvel6.*dic6;

clear wvel* dic* theta*

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
        if hFacC(ii,jj,21)<1
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

eddy6tv2 = zeros(52,1);
eddy6cv2 = zeros(52,1);

for ii=1:52
    eddy6tv2(ii) = sum(sum(eddyt6calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    eddy6cv2(ii) = sum(sum(eddyc6calc(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except eddy6tv2 eddy6cv2 eddy3tv2 eddy3cv2


load wvel12 wvel12
load theta12 theta12
load dic12 dic12
RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

eddyt12calc = wvel12.*theta12;
eddyc12calc = wvel12.*dic12;

clear wvel* dic* theta*

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
        if hFacC(ii,jj,41)<1
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

eddy12tv2 = zeros(52,1);
eddy12cv2 = zeros(52,1);

for ii=1:52
    eddy12tv2(ii) = sum(sum(eddyt12calc(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
    eddy12cv2(ii) = sum(sum(eddyc12calc(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
end

clearvars -except eddy12tv2 eddy12cv2 eddy6tv2 eddy6cv2 eddy3tv2 eddy3cv2

save vert_eddy_2

toc()