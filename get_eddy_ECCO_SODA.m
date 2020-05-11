clear
close all
clc
tic()

load ECCO_TSUVW elat elon eccoadvrth eccowvel eccotheta ecdepth efdepth


eccoeddy = mean(eccoadvrth,4);
eccotheta = mean(eccotheta,4);
eccowvel = mean(eccowvel,4);
eccomwt = eccotheta.*eccowvel;
clear eccotheta eccowvel
eccoarea = zeros(size(eccoeddy,1),size(eccoeddy,2));

% elon = elon(11:120);
% elat = elat(21:63);

eccomwt = eccomwt(11:120,21:63,:);
eccoeddy = eccoeddy(11:120,21:63,:);

mask = ones(110,43,50);
area = zeros(110,43,50);
total_area = zeros(50,1);

for ii=1:110
    for jj=1:43
        if eccomwt(ii,jj,38,1)==0
            mask(ii,jj,:) = 0;
        end
        for kk=1:50
            area(ii,jj,kk) = area_degree(elat(jj),0.5,0.5);
        end
    end
end

for jj=1:50
    eccoeddy(:,:,jj) = eccoeddy(:,:,jj)./area(:,:,jj);
end

area = area.*mask;

eccoarea(11:120,21:63) = mask(:,:,1);
eccoeddy(isnan(eccoeddy)==1) = 0;

eccotwt = eccoeddy - eccomwt;

eccotwtv = zeros(50,1);
eccomwtv = zeros(50,1);
eccoedv = zeros(50,1);


for kk=1:50
    total_area(kk) = sum(area(:,:,kk),[1,2]);
    eccotwtv(kk) = sum(eccotwt(:,:,kk).*area(:,:,kk),[1,2])./total_area(kk);
    eccomwtv(kk) = sum(eccomwt(:,:,kk).*area(:,:,kk),[1,2])./total_area(kk);
    eccoedv(kk) = sum(eccoeddy(:,:,kk).*area(:,:,kk),[1,2])./total_area(kk);
end

save eccomask eccoarea elon elat
save ECCOeddy efdepth ecco*wtv eccoedv

clear



load SODA3 sodaw sodatemp sodadepc sodadepf X*S Y*S

sodatemp = mean(sodatemp,4);
sodaw = mean(sodaw,4);
sodawt = sodatemp.*sodaw;
clear sodatemp sodaw
sodaarea = zeros(size(sodawt,1),size(sodawt,2));

% XCS = XCS(11:120);
% YCS = YCS(21:63);

sodawt = sodawt(11:120,21:63,:,:);

sodawt(isnan(sodawt)==1) = 0;

mask = ones(110,43,50);
area = zeros(110,43,50);
total_area = zeros(50,1);

for ii=1:110
    for jj=1:43
        if sodawt(ii,jj,38,1)==0
            mask(ii,jj,:) = 0;
        end
        for kk=1:50
            area(ii,jj,kk) = area_degree(YCS(jj),0.5,0.5)*mask(ii,jj,kk);
        end
    end
end
sodaarea(11:120,21:63) = mask(:,:,1);
sodawtv = zeros(50,1);


for kk=1:50
    total_area(kk) = sum(area(:,:,kk),[1,2]);
    sodawtv(kk) = sum(sodawt(:,:,kk).*area(:,:,kk),[1,2])./total_area(kk);
end

save sodamask sodaarea XCS YCS
save SODAvert sodawtv sodadepf

clear














toc()