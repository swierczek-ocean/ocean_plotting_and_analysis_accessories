clear
close all
clc
tic()

load ODA

XCt = XCt(6:60);
XGt = XGt(6:60);
YCt = XCt(6:33);
YGt = XGt(6:33);

oda_theta = oda_theta(6:60,6:31,:,:);
oda_salt = oda_salt(6:60,6:31,:,:);
oda_wvel = oda_wvel(6:60,6:31,:,:);

oda_mwt = oda_theta.*oda_wvel;
mask = ones(size(oda_theta));
mask(isnan(oda_theta)==1) = 0;
oda_theta(isnan(oda_theta)==1) = 0;
oda_wvel(isnan(oda_wvel)==1) = 0;
oda_salt(isnan(oda_salt)==1) = 0;
oda_mwt(isnan(oda_mwt)==1) = 0;
oda_wt = oda_theta.*oda_wvel;

area = zeros(size(mask));
total_area = zeros(50,1);

for ii=1:55
    for jj=1:26
        if mask(ii,jj,40)==0
            mask(ii,jj,:) = 0;
        end
        for kk=1:50
            area(ii,jj,kk) = area_degree(YGt(jj),1,1)*mask(ii,jj,kk);
        end
    end
end

for ii=1:50
    total_area(ii) = sum(area(:,:,ii),[1,2]);
end

odat = zeros(50,12);
odaw = zeros(50,12);
odawt = zeros(50,12);
odamwt = zeros(50,12);
odas = zeros(50,12);

for jj=1:12
    for ii=1:50
        odas(ii,jj) = sum(oda_salt(:,:,ii,jj).*area(:,:,ii),[1,2])./total_area(ii);
        odat(ii,jj) = sum(oda_theta(:,:,ii,jj).*area(:,:,ii),[1,2])./total_area(ii);
        odaw(ii,jj) = sum(oda_wvel(:,:,ii,jj).*area(:,:,ii),[1,2])./total_area(ii);
        odawt(ii,jj) = sum(oda_wt(:,:,ii,jj).*area(:,:,ii),[1,2])./total_area(ii);
        odamwt(ii,jj) = sum(oda_mwt(:,:,ii,jj).*area(:,:,ii),[1,2])./total_area(ii);
    end
end

RFt = -RFt(1:50);
RCt = -RCt;

save ODAmonthly odat odas odaw odawt odamwt RCt RFt




toc()