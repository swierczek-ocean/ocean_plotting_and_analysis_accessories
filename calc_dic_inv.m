clear
close all
clc
tic()

load DIC_vert

dic3v = 1035.*dic3v./1000000;
dic6v = 1035.*dic6v./1000000;
dic12v = 1035.*dic12v./1000000;


RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');
DRF = squeeze(rdmds('../Grids/6/DRF'));

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
        if hFacC(ii,jj,84)<1
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

volume = areaBox(1:2:104)'.*DRF;

dic_inv3 = 12*sum(dic3v(1:35).*volume(1:35))/(1e15);
dic_inv6 = 12*sum(dic6v(1:35).*volume(1:35))/(1e15);
dic_inv12 = 12*sum(dic12v(1:35).*volume(1:35))/(1e15);


toc()