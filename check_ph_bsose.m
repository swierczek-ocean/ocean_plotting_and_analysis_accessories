clear
close all
clc
tic()

str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_pH.nc';
sd = 49;
nd = 12;
XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288,1)-1;
hix = find(X>352,1)+1;
loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
HC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

ph_temp = squeeze(ncread(str,'BLGPH3D',[lox,loy,1,sd],[nn,mm,1,nd]));
ph_bsose_surf = mean(ph_temp,3);

ph_temp = squeeze(ncread(str,'BLGPH3D',[lox,loy,13,sd],[nn,mm,1,nd]));
ph_bsose_105m = mean(ph_temp,3);

clear ph_temp

[nn,mm,~] = size(HC);

for ii=1:nn
    for jj=1:mm
        if HC(ii,jj,1)==0
            ph_bsose_surf(ii,jj) = NaN;
        end
        if HC(ii,jj,13)==0
            ph_bsose_105m(ii,jj) = NaN;
        end        
    end
end

save ph_bsose ph* XCS YCS


toc()