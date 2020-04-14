clear
close all
clc
tic()

load ../2020_01_January_analysis/Budgets_surf


RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');

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

area3 = areaBox(1);


RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');

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

area6 = areaBox(1);

RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

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

area12 = areaBox(1);

save areas area3 area6 area12










toc()