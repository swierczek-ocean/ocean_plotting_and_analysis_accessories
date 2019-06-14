clear
close all
clc

tic()

load grid
load XY12

[n,m] = size(XC);

[XC12,YC12] = ndgrid(XC12,YC12);

fid = fopen('atm_pco2_capegrim_SO6_2016','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[n,m,12]);
fclose(fid);

fesx = zeros(756,512,12);


for jj=1:12
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC12,YC12);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB12_2016','w','b');
fwrite(fid,fesx,'single');
fclose(fid);

fid = fopen('atm_pco2_capegrim_SO6_2017','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[n,m,12]);
fclose(fid);

fesx = zeros(756,512,12);


for jj=1:12
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC12,YC12);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB12_2017','w','b');
fwrite(fid,fesx,'single');
fclose(fid);


fid = fopen('atm_pco2_capegrim_SO6_2018','r','b');
U = fread(fid,inf,'single');
NZ = length(U)/n/m;
U = reshape(U,[n,m,NZ]);
fclose(fid);

fesx = zeros(756,512,12);


for jj=1:NZ
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC12,YC12);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB12_2018','w','b');
fwrite(fid,fesx,'single');
fclose(fid);




toc()