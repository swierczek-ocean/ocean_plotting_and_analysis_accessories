clear
close all
clc
tic()

load ODA

XCt = XCt(4:67);
YCt = YCt(6:35);

oda_salt = oda_salt(4:67,6:35,:,:);
oda_theta = oda_theta(4:67,6:35,:,:);

XGt = XGt(5:68);
YGt = YGt(6:35);

oda_uvel = oda_uvel(5:68,6:35,:,:);
oda_vvel = oda_vvel(5:68,6:35,:,:);

THETAODAE = squeeze(oda_theta(64,:,:,:));
THETAODAW = squeeze(oda_theta(1,:,:,:));
THETAODAN = squeeze(oda_theta(:,30,:,:));
THETAODAS = squeeze(oda_theta(:,1,:,:));

SALTODAE = squeeze(oda_salt(64,:,:,:));
SALTODAW = squeeze(oda_salt(1,:,:,:));
SALTODAN = squeeze(oda_salt(:,30,:,:));
SALTODAS = squeeze(oda_salt(:,1,:,:));

UVELODAE = squeeze(oda_uvel(64,:,:,:));
UVELODAW = squeeze(oda_uvel(1,:,:,:));
UVELODAN = squeeze(oda_uvel(:,30,:,:));
UVELODAS = squeeze(oda_uvel(:,1,:,:));

VVELODAE = squeeze(oda_vvel(64,:,:,:));
VVELODAW = squeeze(oda_vvel(1,:,:,:));
VVELODAN = squeeze(oda_vvel(:,30,:,:));
VVELODAS = squeeze(oda_vvel(:,1,:,:));;

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

[sxts,sdts] = ndgrid(XCt,RCt);
[syte,sdte] = ndgrid(YCt,RCt);
[sxus,sdus] = ndgrid(XGt,RCt);
[syue,sdue] = ndgrid(YGt,RCt);


odathetade = zeros(512,104,12);
odathetadw = zeros(512,104,12);
odathetads = zeros(756,104,12);
odathetadn = zeros(756,104,12);

odasaltde = zeros(512,104,12);
odasaltdw = zeros(512,104,12);
odasaltds = zeros(756,104,12);
odasaltdn = zeros(756,104,12);

odauvelde = zeros(512,104,12);
odauveldw = zeros(512,104,12);
odauvelds = zeros(756,104,12);
odauveldn = zeros(756,104,12);

odavvelde = zeros(512,104,12);
odavveldw = zeros(512,104,12);
odavvelds = zeros(756,104,12);
odavveldn = zeros(756,104,12);

for ii=1:12
    F = griddedInterpolant(syte,sdte,THETAODAE(:,:,ii),'linear');
    odathetade(:,:,ii) = F(YC12e,RC12e) - THETA12E(:,:,ii);
    
    F = griddedInterpolant(syte,sdte,THETAODAW(:,:,ii),'linear');
    odathetadw(:,:,ii) = F(YC12e,RC12e) - THETA12W(:,:,ii);
    
    F = griddedInterpolant(sxts,sdts,THETAODAS(:,:,ii),'linear');
    odathetads(:,:,ii) = F(XC12s,RC12s) - THETA12S(:,:,ii);
    
    F = griddedInterpolant(sxts,sdts,THETAODAN(:,:,ii),'linear');
    odathetadn(:,:,ii) = F(XC12s,RC12s) - THETA12N(:,:,ii);
    
    F = griddedInterpolant(syte,sdte,SALTODAE(:,:,ii),'linear');
    odasaltde(:,:,ii) = F(YC12e,RC12e) - SALT12E(:,:,ii);
    
    F = griddedInterpolant(syte,sdte,SALTODAW(:,:,ii),'linear');
    odasaltdw(:,:,ii) = F(YC12e,RC12e) - SALT12W(:,:,ii);
    
    F = griddedInterpolant(sxts,sdts,SALTODAS(:,:,ii),'linear');
    odasaltds(:,:,ii) = F(XC12s,RC12s) - SALT12S(:,:,ii);
    
    F = griddedInterpolant(sxts,sdts,SALTODAN(:,:,ii),'linear');
    odasaltdn(:,:,ii) = F(XC12s,RC12s) - SALT12N(:,:,ii);
    
    F = griddedInterpolant(syue,sdue,UVELODAE(:,:,ii),'linear');
    odauvelde(:,:,ii) = F(YC12e,RC12e) - UVEL12E(:,:,ii);
    
    F = griddedInterpolant(syue,sdue,UVELODAW(:,:,ii),'linear');
    odauveldw(:,:,ii) = F(YC12e,RC12e) - UVEL12W(:,:,ii);
    
    F = griddedInterpolant(sxus,sdus,UVELODAS(:,:,ii),'linear');
    odauvelds(:,:,ii) = F(XC12s,RC12s) - UVEL12S(:,:,ii);
    
    F = griddedInterpolant(sxus,sdus,UVELODAN(:,:,ii),'linear');
    odauveldn(:,:,ii) = F(XC12s,RC12s) - UVEL12N(:,:,ii);
    
    F = griddedInterpolant(syue,sdue,VVELODAE(:,:,ii),'linear');
    odavvelde(:,:,ii) = F(YC12e,RC12e) - VVEL12E(:,:,ii);
    
    F = griddedInterpolant(syue,sdue,VVELODAW(:,:,ii),'linear');
    odavveldw(:,:,ii) = F(YC12e,RC12e) - VVEL12W(:,:,ii);
    
    F = griddedInterpolant(sxus,sdus,VVELODAS(:,:,ii),'linear');
    odavvelds(:,:,ii) = F(XC12s,RC12s) - VVEL12S(:,:,ii);
    
    F = griddedInterpolant(sxus,sdus,VVELODAN(:,:,ii),'linear');
    odavveldn(:,:,ii) = F(XC12s,RC12s) - VVEL12N(:,:,ii);
end

clear oda_mld
save ODAdiffs XC12s RC12s YC12e RC12e oda*d*

clear

load ODAdiffs








toc()