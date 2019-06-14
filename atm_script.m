clear
close all
clc

tic()

load grid
load XY6

[n,m] = size(XC);

[XC6,YC6] = ndgrid(XC6,YC6);

fid = fopen('atm_pco2_capegrim_SO6_2016','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[n,m,12]);
fclose(fid);

fesx = zeros(384,260,12);


for jj=1:12
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC6,YC6);
end

for ii=1:10
    fesx(ii,:,:) = fesx(11,:,:);
    fesx(374+ii,:,:) = fesx(374,:,:);
    fesx(:,ii,:) = fesx(:,11,:);
    fesx(:,250+ii,:) = fesx(:,250,:);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB6_2016','w','b');
fwrite(fid,fesx,'single');
fclose(fid);

fid = fopen('atm_pco2_capegrim_SO6_2017','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[n,m,12]);
fclose(fid);

fesx = zeros(384,260,12);


for jj=1:12
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC6,YC6);
end

for ii=1:10
    fesx(ii,:,:) = fesx(11,:,:);
    fesx(374+ii,:,:) = fesx(374,:,:);
    fesx(:,ii,:) = fesx(:,11,:);
    fesx(:,250+ii,:) = fesx(:,250,:);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB6_2017','w','b');
fwrite(fid,fesx,'single');
fclose(fid);


fid = fopen('atm_pco2_capegrim_SO6_2018','r','b');
U = fread(fid,inf,'single');
NZ = length(U)/n/m;
U = reshape(U,[n,m,NZ]);
fclose(fid);

fesx = zeros(384,260,12);


for jj=1:NZ
    F = griddedInterpolant(XC,YC,U(:,:,jj),'linear');
    fesx(:,:,jj) = F(XC6,YC6);
end

for ii=1:10
    fesx(ii,:,:) = fesx(11,:,:);
    fesx(374+ii,:,:) = fesx(374,:,:);
    fesx(:,ii,:) = fesx(:,11,:);
    fesx(:,250+ii,:) = fesx(:,250,:);
end


contourf(fesx(:,:,1)',50)


fid = fopen('atm_pco2_capegrim_AB6_2018','w','b');
fwrite(fid,fesx,'single');
fclose(fid);




toc()