clear
close all
clc
tic()

load ODA

XCt = XCt(6:60);
XGt = XGt(6:60);
YCt = YCt(11:32);
YGt = YGt(11:32);

oda_theta = oda_theta(6:60,11:32,:,:);
oda_wvel = oda_wvel(6:60,11:32,:,:);

oda_mwt = oda_theta.*oda_wvel;

oda_theta = mean(oda_theta,4);
oda_wvel = mean(oda_wvel,4);
oda_mwt = mean(oda_mwt,4);

mask = ones(size(oda_theta));
mask(isnan(oda_theta)==1) = 0;
oda_theta(isnan(oda_theta)==1) = 0;
oda_wvel(isnan(oda_wvel)==1) = 0;
oda_mwt(isnan(oda_mwt)==1) = 0;
oda_wt = oda_theta.*oda_wvel;

area = zeros(size(mask));
total_area = zeros(50,1);

for ii=1:55
    for jj=1:22
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

odat = zeros(50,1);
odaw = zeros(50,1);
odawt = zeros(50,1);
odamwt = zeros(50,1);

for ii=1:50
    odat(ii) = sum(oda_theta(:,:,ii).*area(:,:,ii),[1,2])./total_area(ii);
    odaw(ii) = sum(oda_wvel(:,:,ii).*area(:,:,ii),[1,2])./total_area(ii);
    odawt(ii) = sum(oda_wt(:,:,ii).*area(:,:,ii),[1,2])./total_area(ii);
    odamwt(ii) = sum(oda_mwt(:,:,ii).*area(:,:,ii),[1,2])./total_area(ii);
end

RFt = -RFt(1:50);
RCt = -RCt;

save ODA_wt odat odaw odawt odamwt RCt RFt




toc()