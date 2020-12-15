clear
close all
clc
tic()

sst3lin = zeros(192,132,5);
sst3nonlin = zeros(192,132,5);
sst3linsm = zeros(192,132,5);
sst3nonlinsm = zeros(192,132,5);

sst12lin = zeros(756,512,5);
sst12nonlin = zeros(756,512,5);
sst12linsm = zeros(756,512,5);
sst12nonlinsm = zeros(756,512,5);

load sSST3
load sSST12

sst3c(sst3c==0) = NaN;
sst3p(sst3p==0) = NaN;
sst3n(sst3n==0) = NaN;
sst12c(sst12c==0) = NaN;
sst12p(sst12p==0) = NaN;
sst12n(sst12n==0) = NaN;

dH1_3 = (sst3p - sst3c);
dH2_3 = (sst3n - sst3c);

dH1_12 = (sst12p - sst12c);
dH2_12 = (sst12n - sst12c);

clear sst3c sst3p sst3n sst12c sst12p sst12n

dh1_3sstsm = 0.5.*(dH1_3 - dH2_3);
dh2_3sstsm = 0.5.*(dH1_3 + dH2_3);

dh1_12sstsm = 0.5.*(dH1_12 - dH2_12);
dh2_12sstsm = 0.5.*(dH1_12 + dH2_12);

clear dH*

sst3linsm(:,:,1) = dh1_3sstsm(:,:,6);
sst3linsm(:,:,2) = dh1_3sstsm(:,:,33);
sst3linsm(:,:,3) = dh1_3sstsm(:,:,61);
sst3linsm(:,:,4) = dh1_3sstsm(:,:,185);
sst3linsm(:,:,5) = dh1_3sstsm(:,:,245);
sst3nonlinsm(:,:,1) = dh2_3sstsm(:,:,6);
sst3nonlinsm(:,:,2) = dh2_3sstsm(:,:,33);
sst3nonlinsm(:,:,3) = dh2_3sstsm(:,:,61);
sst3nonlinsm(:,:,4) = dh2_3sstsm(:,:,185);
sst3nonlinsm(:,:,5) = dh2_3sstsm(:,:,245);

sst12linsm(:,:,1) = dh1_12sstsm(:,:,6);
sst12linsm(:,:,2) = dh1_12sstsm(:,:,33);
sst12linsm(:,:,3) = dh1_12sstsm(:,:,61);
sst12linsm(:,:,4) = dh1_12sstsm(:,:,185);
sst12linsm(:,:,5) = dh1_12sstsm(:,:,245);
sst12nonlinsm(:,:,1) = dh2_12sstsm(:,:,6);
sst12nonlinsm(:,:,2) = dh2_12sstsm(:,:,33);
sst12nonlinsm(:,:,3) = dh2_12sstsm(:,:,61);
sst12nonlinsm(:,:,4) = dh2_12sstsm(:,:,185);
sst12nonlinsm(:,:,5) = dh2_12sstsm(:,:,245);

clear dh*

load SST3
load SST12

sst3c(sst3c==0) = NaN;
sst3p(sst3p==0) = NaN;
sst3n(sst3n==0) = NaN;
sst12c(sst12c==0) = NaN;
sst12p(sst12p==0) = NaN;
sst12n(sst12n==0) = NaN;

dH1_3 = (sst3p - sst3c);
dH2_3 = (sst3n - sst3c);

dH1_12 = (sst12p - sst12c);
dH2_12 = (sst12n - sst12c);

clear sst3c sst3p sst3n sst12c sst12p sst12n

dh1_3sst = 0.5.*(dH1_3 - dH2_3);
dh2_3sst = 0.5.*(dH1_3 + dH2_3);

dh1_12sst = 0.5.*(dH1_12 - dH2_12);
dh2_12sst = 0.5.*(dH1_12 + dH2_12);

clear dH*

sst3lin(:,:,1) = dh1_3sst(:,:,6);
sst3lin(:,:,2) = dh1_3sst(:,:,33);
sst3lin(:,:,3) = dh1_3sst(:,:,61);
sst3lin(:,:,4) = dh1_3sst(:,:,185);
sst3lin(:,:,5) = dh1_3sst(:,:,245);
sst3nonlin(:,:,1) = dh2_3sst(:,:,6);
sst3nonlin(:,:,2) = dh2_3sst(:,:,33);
sst3nonlin(:,:,3) = dh2_3sst(:,:,61);
sst3nonlin(:,:,4) = dh2_3sst(:,:,185);
sst3nonlin(:,:,5) = dh2_3sst(:,:,245);

sst12lin(:,:,1) = dh1_12sst(:,:,6);
sst12lin(:,:,2) = dh1_12sst(:,:,33);
sst12lin(:,:,3) = dh1_12sst(:,:,61);
sst12lin(:,:,4) = dh1_12sst(:,:,185);
sst12lin(:,:,5) = dh1_12sst(:,:,245);
sst12nonlin(:,:,1) = dh2_12sst(:,:,6);
sst12nonlin(:,:,2) = dh2_12sst(:,:,33);
sst12nonlin(:,:,3) = dh2_12sst(:,:,61);
sst12nonlin(:,:,4) = dh2_12sst(:,:,185);
sst12nonlin(:,:,5) = dh2_12sst(:,:,245);

clear dh*

load sDIC3
load sDIC12

dic3c(dic3c==0) = NaN;
dic3p(dic3p==0) = NaN;
dic3n(dic3n==0) = NaN;
dic12c(dic12c==0) = NaN;
dic12p(dic12p==0) = NaN;
dic12n(dic12n==0) = NaN;

dH1_3 = 1000000.*(dic3p - dic3c);
dH2_3 = 1000000.*(dic3n - dic3c);

dH1_12 = 1000000.*(dic12p - dic12c);
dH2_12 = 1000000.*(dic12n - dic12c);

clear dic3c dic3p dic3n dic12c dic12p dic12n

dh1_3dicsm = 0.5.*(dH1_3 - dH2_3);
dh2_3dicsm = 0.5.*(dH1_3 + dH2_3);

dh1_12dicsm = 0.5.*(dH1_12 - dH2_12);
dh2_12dicsm = 0.5.*(dH1_12 + dH2_12);

clear dH*

dic3linsm(:,:,1) = dh1_3dicsm(:,:,6);
dic3linsm(:,:,2) = dh1_3dicsm(:,:,33);
dic3linsm(:,:,3) = dh1_3dicsm(:,:,61);
dic3linsm(:,:,4) = dh1_3dicsm(:,:,185);
dic3linsm(:,:,5) = dh1_3dicsm(:,:,245);
dic3nonlinsm(:,:,1) = dh2_3dicsm(:,:,6);
dic3nonlinsm(:,:,2) = dh2_3dicsm(:,:,33);
dic3nonlinsm(:,:,3) = dh2_3dicsm(:,:,61);
dic3nonlinsm(:,:,4) = dh2_3dicsm(:,:,185);
dic3nonlinsm(:,:,5) = dh2_3dicsm(:,:,245);

dic12linsm(:,:,1) = dh1_12dicsm(:,:,6);
dic12linsm(:,:,2) = dh1_12dicsm(:,:,33);
dic12linsm(:,:,3) = dh1_12dicsm(:,:,61);
dic12linsm(:,:,4) = dh1_12dicsm(:,:,185);
dic12linsm(:,:,5) = dh1_12dicsm(:,:,245);
dic12nonlinsm(:,:,1) = dh2_12dicsm(:,:,6);
dic12nonlinsm(:,:,2) = dh2_12dicsm(:,:,33);
dic12nonlinsm(:,:,3) = dh2_12dicsm(:,:,61);
dic12nonlinsm(:,:,4) = dh2_12dicsm(:,:,185);
dic12nonlinsm(:,:,5) = dh2_12dicsm(:,:,245);

clear dh*

load DIC3
load DIC12

dic3c(dic3c==0) = NaN;
dic3p(dic3p==0) = NaN;
dic3n(dic3n==0) = NaN;
dic12c(dic12c==0) = NaN;
dic12p(dic12p==0) = NaN;
dic12n(dic12n==0) = NaN;

dH1_3 = 1000000.*(dic3p - dic3c);
dH2_3 = 1000000.*(dic3n - dic3c);

dH1_12 = 1000000.*(dic12p - dic12c);
dH2_12 = 1000000.*(dic12n - dic12c);

clear dic3c dic3p dic3n dic12c dic12p dic12n

dh1_3dic = 0.5.*(dH1_3 - dH2_3);
dh2_3dic = 0.5.*(dH1_3 + dH2_3);

dh1_12dic = 0.5.*(dH1_12 - dH2_12);
dh2_12dic = 0.5.*(dH1_12 + dH2_12);

clear dH*

dic3lin(:,:,1) = dh1_3dic(:,:,6);
dic3lin(:,:,2) = dh1_3dic(:,:,33);
dic3lin(:,:,3) = dh1_3dic(:,:,61);
dic3lin(:,:,4) = dh1_3dic(:,:,185);
dic3lin(:,:,5) = dh1_3dic(:,:,245);
dic3nonlin(:,:,1) = dh2_3dic(:,:,6);
dic3nonlin(:,:,2) = dh2_3dic(:,:,33);
dic3nonlin(:,:,3) = dh2_3dic(:,:,61);
dic3nonlin(:,:,4) = dh2_3dic(:,:,185);
dic3nonlin(:,:,5) = dh2_3dic(:,:,245);

dic12lin(:,:,1) = dh1_12dic(:,:,6);
dic12lin(:,:,2) = dh1_12dic(:,:,33);
dic12lin(:,:,3) = dh1_12dic(:,:,61);
dic12lin(:,:,4) = dh1_12dic(:,:,185);
dic12lin(:,:,5) = dh1_12dic(:,:,245);
dic12nonlin(:,:,1) = dh2_12dic(:,:,6);
dic12nonlin(:,:,2) = dh2_12dic(:,:,33);
dic12nonlin(:,:,3) = dh2_12dic(:,:,61);
dic12nonlin(:,:,4) = dh2_12dic(:,:,185);
dic12nonlin(:,:,5) = dh2_12dic(:,:,245);

clear dh*

save SST_DIC_panels sst* dic*

toc()