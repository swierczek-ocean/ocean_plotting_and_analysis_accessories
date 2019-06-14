clear
close all
clc

tic()

load grid
load XY3

[n,m] = size(XC);

[XC3,YC3] = ndgrid(XC3,YC3);

fid = fopen('atm_pco2_capegrim_SO6_2016','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[n,m,12]);
fclose(fid);

fesx = zeros(192,132,12);


for jj=1:12
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC3,YC3);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB3_2016','w','b');
fwrite(fid,fesx,'single');
fclose(fid);

fid = fopen('atm_pco2_capegrim_SO6_2017','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[n,m,12]);
fclose(fid);

fesx = zeros(192,132,12);


for jj=1:12
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC3,YC3);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB3_2017','w','b');
fwrite(fid,fesx,'single');
fclose(fid);


fid = fopen('atm_pco2_capegrim_SO6_2018','r','b');
U = fread(fid,inf,'single');
NZ = length(U)/n/m;
U = reshape(U,[n,m,NZ]);
fclose(fid);

fesx = zeros(192,132,12);


for jj=1:NZ
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC3,YC3);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB3_2018','w','b');
fwrite(fid,fesx,'single');
fclose(fid);




toc()