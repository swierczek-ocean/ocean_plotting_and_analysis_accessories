clear
close all
clc
tic()

%% makes monthly horizontally averaged profiles for ECCO, SODA, WOA18, ODA

load ECCO_TSUVW eccotheta eccosalt elon elat ecdepth efdepth eccowvel

elon = elon(11:120);
elat = elat(21:63);

eccotheta = eccotheta(11:120,21:63,:,:);
eccosalt = eccosalt(11:120,21:63,:,:);
eccowvel = eccowvel(11:120,21:63,:,:);

mask = ones(110,43,50);
area = zeros(110,43,50);
total_area = zeros(50,1);

for ii=1:110
    for jj=1:43
        if eccotheta(ii,jj,38,1)==0
            mask(ii,jj,:) = 0;
        end
        for kk=1:50
            area(ii,jj,kk) = area_degree(elat(jj),0.5,0.5)*mask(ii,jj,kk);
        end
    end
end

eccoth12 = zeros(50,12);
eccosa12 = zeros(50,12);
eccow12 = zeros(50,12);

for jj=1:12
    for kk=1:50
        total_area(kk) = sum(area(:,:,kk),[1,2]);
        eccoth12(kk,jj) = sum(eccotheta(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
        eccosa12(kk,jj) = sum(eccosalt(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
        eccow12(kk,jj) = sum(eccowvel(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
    end
end

save ECCOvert ecdepth efdepth ecco*12

clear

load SODA3 X*S Y*S sodaw sodatemp sodasalt sodadepc sodadepf

XCS = XCS(11:120);
YCS = YCS(21:63);

sodatemp = sodatemp(11:120,21:63,:,:);
sodasalt = sodasalt(11:120,21:63,:,:);
sodaw = sodaw(11:120,21:63,:,:);

sodatemp(isnan(sodatemp)==1) = 0;
sodasalt(isnan(sodasalt)==1) = 0;
sodaw(isnan(sodaw)==1) = 0;

mask = ones(110,43,50);
area = zeros(110,43,50);
total_area = zeros(50,1);

for ii=1:110
    for jj=1:43
        if sodatemp(ii,jj,38,1)==0
            mask(ii,jj,:) = 0;
        end
        for kk=1:50
            area(ii,jj,kk) = area_degree(YCS(jj),0.5,0.5)*mask(ii,jj,kk);
        end
    end
end

sodath12 = zeros(50,12);
sodasa12 = zeros(50,12);
sodaw12 = zeros(50,12);

for jj=1:12
    for kk=1:50
        total_area(kk) = sum(area(:,:,kk),[1,2]);
        sodath12(kk,jj) = sum(sodatemp(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
        sodasa12(kk,jj) = sum(sodasalt(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
        sodaw12(kk,jj) = sum(sodaw(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
    end
end

save SODAvert soda*12 sodadep*

clear

name = 'WOA18/woa18_A5B7_t01_01.nc';

ncdisp(name)

wlat = ncread(name,'lat');
wlon = ncread(name,'lon');
wdepth = ncread(name,'depth');

wlon = wlon(110:165);
wlat = wlat(36:56);

wotheta = zeros(56,21,57,12);
wosalt = zeros(56,21,57,12);

for ii=1:12
    str1 = ['WOA18/woa18_A5B7_t',num2str(ii,'%02.f'),'_01.nc'];
    temp = squeeze(ncread(str1,'t_an'));
    wotheta(:,:,:,ii) = temp(110:165,36:56,:);
    clear temp
    
    str1 = ['WOA18/woa18_A5B7_s',num2str(ii,'%02.f'),'_01.nc'];
    temp = squeeze(ncread(str1,'s_an'));
    wosalt(:,:,:,ii) = temp(110:165,36:56,:);
    clear temp
end

save WOAmonthly wlon wlat wotheta wosalt wdepth

wotheta(isnan(wotheta)==1) = 0;
wosalt(isnan(wosalt)==1) = 0;

mask = ones(56,21,57);
area = zeros(56,21,57);
total_area = zeros(57,1);

for ii=1:56
    for jj=1:21
        if wotheta(ii,jj,57,1)==0
            mask(ii,jj,:) = 0;
        end
        for kk=1:57
            area(ii,jj,kk) = area_degree(wlat(jj),1,1)*mask(ii,jj,kk);
        end
    end
end

woth12 = zeros(57,12);
wosa12 = zeros(57,12);

for jj=1:12
    for kk=1:57
        total_area(kk) = sum(area(:,:,kk),[1,2]);
        woth12(kk,jj) = sum(wotheta(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
        wosa12(kk,jj) = sum(wosalt(:,:,kk,jj).*area(:,:,kk),[1,2])./total_area(kk);
    end
end

save WOAvert wdepth woth12 wosa12

clear


toc()