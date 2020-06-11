clear
close all
clc
tic()

load ../2020_03_March_analysis/dic3
dic3 = dic3.*1000000./1035;
dic3(isnan(dic3)==1) = 0;
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

dic3v = zeros(52,1);

for ii=1:52
    dic3v(ii) = sum(sum(dic3(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end


load ../2020_03_March_analysis/dic6
dic6 = dic6.*1000000./1035;
dic6(isnan(dic6)==1) = 0;
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

dic6v = zeros(52,1);

for ii=1:52
    dic6v(ii) = sum(sum(dic6(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end



load ../2020_03_March_analysis/dic12
dic12 = dic12.*1000000./1035;
dic12(isnan(dic12)==1) = 0;
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

dic12v = zeros(52,1);

for ii=1:52
    dic12v(ii) = sum(sum(dic12(x,y,ii).*areaTop(:,:,(2*ii-1))))./areaBox((2*ii-1));
end

save DIC_vert dic*v RC3

clear

toc()