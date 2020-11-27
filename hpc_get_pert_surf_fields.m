clear
close all
clc
tic()

str3c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_02_ctrl/diag/';
str3p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_03_pert/diag/';
str3n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB3_04_npert/diag/';

sst3c = zeros(192,132,488);
sst3p = zeros(192,132,488);
sst3n = zeros(192,132,488);
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


for ii=1:488
    charstate = [str3c,'diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3c(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3p,'diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3p(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3n,'diag_state.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst3n(:,:,ii) = temp(:,:,1);
    clear temp
    
    charstate = [str3c,'diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_surf.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    ssh3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    tf3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3c(:,:,ii) = temp;
    clear temp
    charstate = [str3p,'diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3p(:,:,ii) = temp;
    clear temp
    charstate = [str3n,'diag_airsea.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',3);
    cf3n(:,:,ii) = temp;
    clear temp
    
    charstate = [str3c,'diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3c(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3p,'diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3p(:,:,ii) = temp(:,:,1);
    clear temp
    charstate = [str3n,'diag_bgc.',num2str(12*ii+1452,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    dic3n(:,:,ii) = temp(:,:,1);
    clear temp
end

save SST3 sst3*
save SSH3 ssh3*
save TF3 tf3*
save CF3 cf3*
save DIC3 dic3*

clear

fprintf('finished 1/3 outputs \n')


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_surf/';

ssh12c = zeros(756,512,488);


parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 control SSH iteration %g \n',ii)
    ssh12c(:,:,ii) = rdmds([str12c,'diag_surf.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

save SSH12C ssh12*

clear


str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_surf/';

ssh12p = zeros(756,512,488);


parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 pert SSH iteration %g \n',ii)
    ssh12p(:,:,ii) = rdmds([str12p,'diag_surf.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

save SSH12P ssh12*

clear

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_surf/';

ssh12n = zeros(756,512,488);


parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 negative pert SSH iteration %g \n',ii)
    ssh12n(:,:,ii) = rdmds([str12n,'diag_surf.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

save SSH12P ssh12*

clear


str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_airsea/';

tf12c = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 control TF iteration %g \n',ii)
    tf12c(:,:,ii) = rdmds([str12c,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

save TF12C tf12*

clear

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_airsea/';

tf12p = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 pert TF iteration %g \n',ii)
    tf12p(:,:,ii) = rdmds([str12p,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

save TF12P tf12*

clear

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_airsea/';

tf12n = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 negative pert TF iteration %g \n',ii)
    tf12n(:,:,ii) = rdmds([str12n,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',1);
end

save TF12P tf12*

clear



str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_airsea/';

cf12c = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprincf('1/12 control CF iteration %g \n',ii)
    cf12c(:,:,ii) = rdmds([str12c,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',3);
end

save CF12C cf12*

clear

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_airsea/';

cf12p = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprincf('1/12 pert CF iteration %g \n',ii)
    cf12p(:,:,ii) = rdmds([str12p,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',3);
end

save CF12P cf12*

clear

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_airsea/';

cf12n = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprincf('1/12 negative pert CF iteration %g \n',ii)
    cf12n(:,:,ii) = rdmds([str12n,'diag_airsea.',num2str(180*ii+21780,'%010.f')],'rec',3);
end

save CF12P cf12*

clear




str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_state/';

sst12c = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 control SST iteration %g \n',ii) 
    charstate = [str12c,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12c(:,:,ii) = temp(:,:,1);
end

save SST12C sst12*

clear

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_state/';

sst12p = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 pert SST iteration %g \n',ii) 
    charstate = [str12p,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12p(:,:,ii) = temp(:,:,1);
end

save SST12P sst12*

clear

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_state/';

sst12n = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprintf('1/12 negative pert SST iteration %g \n',ii)
    charstate = [str12n,'diag_state.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    sst12n(:,:,ii) = temp(:,:,1);
end

save SST12P sst12*

clear




str12c = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_bgc/';

dic12c = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprindic('1/12 control DIC iteration %g \n',ii) 
    charbgc = [str12c,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12c(:,:,ii) = temp(:,:,1);
end

save DIC12C dic12*

clear

str12p = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_bgc/';

dic12p = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprindic('1/12 pert DIC iteration %g \n',ii) 
    charbgc = [str12p,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12p(:,:,ii) = temp(:,:,1);
end

save DIC12P dic12*

clear

str12n = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_bgc/';

dic12n = zeros(756,512,488);

parpool('local',36)
parfor (ii=1:488,36)
    fprindic('1/12 negative pert DIC iteration %g \n',ii)
    charbgc = [str12n,'diag_bgc.',num2str(180*ii+21780,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12n(:,:,ii) = temp(:,:,1);
end

save DIC12P dic12*

clear


toc()