clear
close all
clc
tic()

str3c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_02_ctrl/';
str3p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_03_pert/';
str3n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_04_npert/';

sst3c = zeros(192,132,488);
sst3p = zeros(192,132,488);
sst3n = zeros(192,132,488);
sss3c = zeros(192,132,488);
sss3p = zeros(192,132,488);
sss3n = zeros(192,132,488);
ssh3c = zeros(192,132,488);
ssh3p = zeros(192,132,488);
ssh3n = zeros(192,132,488);
tf3c = zeros(192,132,488);
tf3p = zeros(192,132,488);
tf3n = zeros(192,132,488);
cf3c = zeros(192,132,488);
cf3p = zeros(192,132,488);
cf3n = zeros(192,132,488);
dic3c = zeros(192,132,488);
dic3p = zeros(192,132,488);
dic3n = zeros(192,132,488);
do3c = zeros(192,132,488);
do3p = zeros(192,132,488);
do3n = zeros(192,132,488);
no3c = zeros(192,132,488);
no3p = zeros(192,132,488);
no3n = zeros(192,132,488);
mld3c = zeros(192,132,488);
mld3p = zeros(192,132,488);
mld3n = zeros(192,132,488);

for ii=1:488
    charstate = [str3c,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3c(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3c(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3p,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3p(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3p(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3n,'diag_state/diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3n(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',2);
    sss3n(:,:,ii) = temp(:,:,1);
    clear temp
    
    charstate = [str3c,'diag_surf/diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3c(:,:,ii) = temp;
    clear temp
    temp = rdmds(charstate,'rec',4);
    mld3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_surf/diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3p(:,:,ii) = temp;
    clear temp
    temp = rdmds(charstate,'rec',4);
    mld3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_surf/diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3n(:,:,ii) = temp;
    clear temp
    temp = rdmds(charstate,'rec',4);
    mld3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_airsea/diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3c(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3c(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3n(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3p,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3p(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3p(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3n(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3n,'diag_bgc/diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3n(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',3);
    do3n(:,:,ii) = temp(:,:,1);
    clear temp
    temp = rdmds(charstate,'rec',4);
    no3n(:,:,ii) = temp(:,:,1);
    clear temp
end

save SST3 sst3*
save SSS3 sss3*
save SSH3 ssh3*
save TF3 tf3*
save CF3 cf3*
save DIC3 dic3*
save DO3 do3*
save NO3 no3*
save MLD3 mld3*

clear

str3c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_02_ctrl/';
str3p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_03_pert/';
str3n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_04_npert/';

chl3c = zeros(192,132,122);
chl3p = zeros(192,132,122);
chl3n = zeros(192,132,122);
poc3c = zeros(192,132,122);
poc3p = zeros(192,132,122);
poc3n = zeros(192,132,122);
ncp3c = zeros(192,132,122);
ncp3p = zeros(192,132,122);
ncp3n = zeros(192,132,122);
npp3c = zeros(192,132,122);
npp3p = zeros(192,132,122);
npp3n = zeros(192,132,122);

dd = 1;

for ii=1:122
    charstate = [str3c,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3c(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3c(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3c(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',4);
    poc3c(:,:,ii) = temp(:,:,dd);
    clear temp
    charstate = [str3p,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3p(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3p(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3p(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',4);
    ncp3p(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',1);
    poc3p(:,:,ii) = temp(:,:,dd);
    clear temp
    charstate = [str3n,'diag_bio/diag_bio.',num2str(48*ii+1440,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ncp3n(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',2);
    npp3n(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',3);
    chl3n(:,:,ii) = temp(:,:,dd);
    clear temp
    temp = rdmds(charstate,'rec',4);
    poc3n(:,:,ii) = temp(:,:,dd);
    clear temp
end

save CHL3 chl3*
save NCP3 ncp3*
save NPP3 npp3*
save POC3 poc3*

clear

fprintf('finished 1/3 outputs \n')

toc()