clear
close all
clc
tic()

load grid XC YC
XC = XC(:,1);
YC = YC(1,:);

xlo = find(XC>280,1);
xhi = find(XC>355,1);
ylo = find(YC>-61,1);
yhi = find(YC>-28,1);

fid = fopen('RSS_OISST_MWfusion_SO6.bin_2017','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[2160,630,365]);
fclose(fid);

U = U(xlo:xhi,ylo:yhi,:);
% U = permute(U,[2,1,3]);

U(U==-9999) = NaN;

SST_microwave = U;
XCsst = XC(xlo:xhi);
YCsst = YC(ylo:yhi);
[XCsst,YCsst] = ndgrid(XCsst,YCsst);

save SST_microwave SST_microwave XCsst YCsst

% contourf(U(:,:,1)')






toc()