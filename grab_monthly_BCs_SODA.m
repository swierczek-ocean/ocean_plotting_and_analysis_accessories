clear
close all
clc
tic()

strs = 'soda3.4.2_mn_ocean_reg_2017.nc';
ncdisp(strs)
XCS = ncread(strs,'xt_ocean');
YCS = ncread(strs,'yt_ocean');
XGS = ncread(strs,'xu_ocean');
YGS = ncread(strs,'yu_ocean');
sodatemp = ncread(strs,'temp');
sodasalt = ncread(strs,'salt');
sodau = ncread(strs,'u');
sodav = ncread(strs,'v');
sodadepc = ncread(strs,'st_ocean');

XCS = XCS(571:710);
XGS = XGS(570:709);
YCS = YCS(21:100);
YGS = YGS(20:99);

sodatemp = sodatemp(571:710,21:100,:,:);
sodasalt = sodasalt(571:710,21:100,:,:);
sodau = sodau(570:709,20:99,:,:);
sodav = sodav(570:709,20:99,:,:);

sodathetae = squeeze(sodatemp(134,11:69,:,:));
sodathetaw = squeeze(sodatemp(8,11:69,:,:));
sodathetas = squeeze(sodatemp(8:134,11,:,:));
sodathetan = squeeze(sodatemp(8:134,69,:,:));

sodasalte = squeeze(sodasalt(134,11:69,:,:));
sodasaltw = squeeze(sodasalt(8,11:69,:,:));
sodasalts = squeeze(sodasalt(8:134,11,:,:));
sodasaltn = squeeze(sodasalt(8:134,69,:,:));

sodauvele = squeeze(sodau(135,11:70,:,:));
sodauvelw = squeeze(sodau(8,11:70,:,:));
sodauvels = squeeze(sodau(8:135,11,:,:));
sodauveln = squeeze(sodau(8:135,70,:,:));

sodavvele = squeeze(sodav(135,11:70,:,:));
sodavvelw = squeeze(sodav(8,11:70,:,:));
sodavvels = squeeze(sodav(8:135,11,:,:));
sodavveln = squeeze(sodav(8:135,70,:,:));

XCS = XCS(8:134);
XGS = XGS(8:135);
YCS = YCS(11:69);
YGS = YGS(11:70);

[sxts,sdts] = ndgrid(XCS,sodadepc);
[syte,sdte] = ndgrid(YCS,sodadepc);
[sxus,sdus] = ndgrid(XGS,sodadepc);
[syue,sdue] = ndgrid(YGS,sodadepc);

clear sodatemp sodasalt sodau sodav

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

sodathetade = zeros(512,104,12);
sodathetadw = zeros(512,104,12);
sodathetads = zeros(756,104,12);
sodathetadn = zeros(756,104,12);

sodasaltde = zeros(512,104,12);
sodasaltdw = zeros(512,104,12);
sodasaltds = zeros(756,104,12);
sodasaltdn = zeros(756,104,12);

sodauvelde = zeros(512,104,12);
sodauveldw = zeros(512,104,12);
sodauvelds = zeros(756,104,12);
sodauveldn = zeros(756,104,12);

sodavvelde = zeros(512,104,12);
sodavveldw = zeros(512,104,12);
sodavvelds = zeros(756,104,12);
sodavveldn = zeros(756,104,12);

for ii=1:12
    
    F = griddedInterpolant(syte,sdte,sodathetae(:,:,ii),'linear');
    sodathetade(:,:,ii) = F(YC12e,RC12e) - THETA12E(:,:,ii);
    
    F = griddedInterpolant(syte,sdte,sodathetaw(:,:,ii),'linear');
    sodathetadw(:,:,ii) = F(YC12e,RC12e) - THETA12W(:,:,ii);
    
    F = griddedInterpolant(sxts,sdts,sodathetas(:,:,ii),'linear');
    sodathetads(:,:,ii) = F(XC12s,RC12s) - THETA12S(:,:,ii);
    
    F = griddedInterpolant(sxts,sdts,sodathetan(:,:,ii),'linear');
    sodathetadn(:,:,ii) = F(XC12s,RC12s) - THETA12N(:,:,ii);
    
    F = griddedInterpolant(syte,sdte,sodasalte(:,:,ii),'linear');
    sodasaltde(:,:,ii) = F(YC12e,RC12e) - SALT12E(:,:,ii);
    
    F = griddedInterpolant(syte,sdte,sodasaltw(:,:,ii),'linear');
    sodasaltdw(:,:,ii) = F(YC12e,RC12e) - SALT12W(:,:,ii);
    
    F = griddedInterpolant(sxts,sdts,sodasalts(:,:,ii),'linear');
    sodasaltds(:,:,ii) = F(XC12s,RC12s) - SALT12S(:,:,ii);
    
    F = griddedInterpolant(sxts,sdts,sodasaltn(:,:,ii),'linear');
    sodasaltdn(:,:,ii) = F(XC12s,RC12s) - SALT12N(:,:,ii);
    
    F = griddedInterpolant(syue,sdue,sodauvele(:,:,ii),'linear');
    sodauvelde(:,:,ii) = F(YC12e,RC12e) - UVEL12E(:,:,ii);
    
    F = griddedInterpolant(syue,sdue,sodauvelw(:,:,ii),'linear');
    sodauveldw(:,:,ii) = F(YC12e,RC12e) - UVEL12W(:,:,ii);
    
    F = griddedInterpolant(sxus,sdus,sodauvels(:,:,ii),'linear');
    sodauvelds(:,:,ii) = F(XC12s,RC12s) - UVEL12S(:,:,ii);
    
    F = griddedInterpolant(sxus,sdus,sodauveln(:,:,ii),'linear');
    sodauveldn(:,:,ii) = F(XC12s,RC12s) - UVEL12N(:,:,ii);
    
    F = griddedInterpolant(syue,sdue,sodavvele(:,:,ii),'linear');
    sodavvelde(:,:,ii) = F(YC12e,RC12e) - VVEL12E(:,:,ii);
    
    F = griddedInterpolant(syue,sdue,sodavvelw(:,:,ii),'linear');
    sodavveldw(:,:,ii) = F(YC12e,RC12e) - VVEL12W(:,:,ii);
    
    F = griddedInterpolant(sxus,sdus,sodavvels(:,:,ii),'linear');
    sodavvelds(:,:,ii) = F(XC12s,RC12s) - VVEL12S(:,:,ii);
    
    F = griddedInterpolant(sxus,sdus,sodavveln(:,:,ii),'linear');
    sodavveldn(:,:,ii) = F(XC12s,RC12s) - VVEL12N(:,:,ii);
end

clear sodadepc

save SODAdiffs XC12s RC12s YC12e RC12e soda*d*

clear

load SODAdiffs


toc()