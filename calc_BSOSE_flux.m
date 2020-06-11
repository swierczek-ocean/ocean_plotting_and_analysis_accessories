clear
close all
clc
tic()


load BSOSE_FLX
RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');

mask = zeros(384,260);

x = 11:340;
y = 54:235;
z = 1:52; 

hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        if hFacC(ii,jj,1)>0
            mask(ii,jj) = 1;
        end
        if hFacC(ii,jj,42)<1
            mask(ii,jj) = 0;
        end
    end
end

areaTop = mask(x,y).*RAC(x,y);
areaBox = sum(areaTop,[1,2]);

bsose_hfds_m = zeros(72,1);
bsose_fgco2_m = zeros(72,1);

for ii=1:72
    bsose_hfds_m(ii) = sum(TFLUXB(x,y,ii).*areaTop,[1,2])./areaBox;
    bsose_fgco2_m(ii) = sum(CFLUXB(x,y,ii).*areaTop,[1,2])./areaBox;
end

A = [1:12:61;2:12:62;3:12:63;4:12:64;5:12:65;6:12:66;...
    7:12:67;8:12:68;9:12:69;10:12:70;11:12:71;12:12:72];

molkg = 12.0107/1000;
syr = 60*60*24*365.25;

bsose_hfds_clim = zeros(12,1);
bsose_fgco2_clim = zeros(12,1);
bsose_hfds_34 = zeros(12,1);
bsose_fgco2_34 = zeros(12,1);

bsose_hfds_7 = bsose_hfds_m(49:60);
bsose_fgco2_7 = syr*molkg.*bsose_fgco2_m(49:60);

for ii=1:12
    bsose_hfds_clim(ii) = mean(bsose_hfds_m(A(ii,:)));
    bsose_fgco2_clim(ii) = syr*molkg.*mean(bsose_fgco2_m(A(ii,:)));
    bsose_hfds_34(ii) = mean(bsose_hfds_m(A(ii,1:2)));
    bsose_fgco2_34(ii) = syr*molkg.*mean(bsose_fgco2_m(A(ii,1:2)));
end

save BSOSE_m_flx *_clim *_7 *_34




toc()