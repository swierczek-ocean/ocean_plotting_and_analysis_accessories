clear
close all
clc
tic()


str1 = 'ECCO/THETA_2017_01.nc';

ncdisp(str1);

elat = ncread(str1,'latitude');
elon = ncread(str1,'longitude');
ecdepth = -ncread(str1,'Z');
ecdepth = double(ecdepth);

str1 = 'ECCO/WVELMASS_2017_01.nc';

elon = elon(211:350) + 360;
elat = elat(51:130);

eccotheta = zeros(140,80,50,12);
eccosalt = zeros(140,80,50,12);
eccouvel = zeros(140,80,50,12);
eccovvel = zeros(140,80,50,12);


for ii=1:12
    str1 = ['ECCO/THETA_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'THETA'));
    eccotheta(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/UVEL_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'UVEL'));
    eccouvel(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/VVEL_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'VVEL'));
    eccovvel(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
    
    str1 = ['ECCO/SALT_2017_',num2str(ii,'%02.f'),'.nc'];
    temp = squeeze(ncread(str1,'SALT'));
    eccosalt(:,:,:,ii) = temp(211:350,51:130,:);
    clear temp
end

clear str1 ii

eccothetae = squeeze(eccotheta(134,11:69,:,:));
eccothetaw = squeeze(eccotheta(8,11:69,:,:));
eccothetas = squeeze(eccotheta(8:134,11,:,:));
eccothetan = squeeze(eccotheta(8:134,69,:,:));

eccosalte = squeeze(eccosalt(134,11:69,:,:));
eccosaltw = squeeze(eccosalt(8,11:69,:,:));
eccosalts = squeeze(eccosalt(8:134,11,:,:));
eccosaltn = squeeze(eccosalt(8:134,69,:,:));

eccouvele = squeeze(eccouvel(134,11:69,:,:));
eccouvelw = squeeze(eccouvel(8,11:69,:,:));
eccouvels = squeeze(eccouvel(8:134,11,:,:));
eccouveln = squeeze(eccouvel(8:134,69,:,:));

eccovvele = squeeze(eccovvel(134,11:69,:,:));
eccovvelw = squeeze(eccovvel(8,11:69,:,:));
eccovvels = squeeze(eccovvel(8:134,11,:,:));
eccovveln = squeeze(eccovvel(8:134,69,:,:));

elon = elon(8:134);
elat = elat(11:69);

[exts,edts] = ndgrid(elon,ecdepth);
[eyte,edte] = ndgrid(elat,ecdepth);

clear eccotheta eccosalt eccouvel eccovvel

load BCs/VVEL12BC VVEL*
load BCs/UVEL12BC UVEL*
load BCs/THETA12BC *C12 THETA*
load BCs/SALT12BC SALT*
XC12 = double(XC12);
YC12 = double(YC12);
RC12 = -RC12;
[YC12e,RC12e] = ndgrid(YC12,RC12);
[XC12s,RC12s] = ndgrid(XC12,RC12);
clear *C12 

eccothetade = zeros(512,104,12);
eccothetadw = zeros(512,104,12);
eccothetads = zeros(756,104,12);
eccothetadn = zeros(756,104,12);

eccosaltde = zeros(512,104,12);
eccosaltdw = zeros(512,104,12);
eccosaltds = zeros(756,104,12);
eccosaltdn = zeros(756,104,12);

eccouvelde = zeros(512,104,12);
eccouveldw = zeros(512,104,12);
eccouvelds = zeros(756,104,12);
eccouveldn = zeros(756,104,12);

eccovvelde = zeros(512,104,12);
eccovveldw = zeros(512,104,12);
eccovvelds = zeros(756,104,12);
eccovveldn = zeros(756,104,12);

for ii=1:12
    
    F = griddedInterpolant(eyte,edte,eccothetae(:,:,ii),'linear');
    eccothetade(:,:,ii) = F(YC12e,RC12e) - THETA12E(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,eccothetaw(:,:,ii),'linear');
    eccothetadw(:,:,ii) = F(YC12e,RC12e) - THETA12W(:,:,ii);
    
    F = griddedInterpolant(exts,edts,eccothetas(:,:,ii),'linear');
    eccothetads(:,:,ii) = F(XC12s,RC12s) - THETA12S(:,:,ii);
    
    F = griddedInterpolant(exts,edts,eccothetan(:,:,ii),'linear');
    eccothetadn(:,:,ii) = F(XC12s,RC12s) - THETA12N(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,eccosalte(:,:,ii),'linear');
    eccosaltde(:,:,ii) = F(YC12e,RC12e) - SALT12E(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,eccosaltw(:,:,ii),'linear');
    eccosaltdw(:,:,ii) = F(YC12e,RC12e) - SALT12W(:,:,ii);
    
    F = griddedInterpolant(exts,edts,eccosalts(:,:,ii),'linear');
    eccosaltds(:,:,ii) = F(XC12s,RC12s) - SALT12S(:,:,ii);
    
    F = griddedInterpolant(exts,edts,eccosaltn(:,:,ii),'linear');
    eccosaltdn(:,:,ii) = F(XC12s,RC12s) - SALT12N(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,eccouvele(:,:,ii),'linear');
    eccouvelde(:,:,ii) = F(YC12e,RC12e) - UVEL12E(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,eccouvelw(:,:,ii),'linear');
    eccouveldw(:,:,ii) = F(YC12e,RC12e) - UVEL12W(:,:,ii);
    
    F = griddedInterpolant(exts,edts,eccouvels(:,:,ii),'linear');
    eccouvelds(:,:,ii) = F(XC12s,RC12s) - UVEL12S(:,:,ii);
    
    F = griddedInterpolant(exts,edts,eccouveln(:,:,ii),'linear');
    eccouveldn(:,:,ii) = F(XC12s,RC12s) - UVEL12N(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,eccovvele(:,:,ii),'linear');
    eccovvelde(:,:,ii) = F(YC12e,RC12e) - VVEL12E(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,eccovvelw(:,:,ii),'linear');
    eccovveldw(:,:,ii) = F(YC12e,RC12e) - VVEL12W(:,:,ii);
    
    F = griddedInterpolant(exts,edts,eccovvels(:,:,ii),'linear');
    eccovvelds(:,:,ii) = F(XC12s,RC12s) - VVEL12S(:,:,ii);
    
    F = griddedInterpolant(exts,edts,eccovveln(:,:,ii),'linear');
    eccovveldn(:,:,ii) = F(XC12s,RC12s) - VVEL12N(:,:,ii);
end

clear eccodepc

save ECCOdiffs XC12s RC12s YC12e RC12e ecco*d*

clear

load ECCOdiffs


toc()






