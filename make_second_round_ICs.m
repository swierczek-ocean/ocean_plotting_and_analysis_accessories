clear

char = '../MITgcm/verification/SO3_20190510/diag/diag_state.0000000288';
temp = rdmds(char);

%% THETA
THETA = temp(:,:,:,1);
fid = fopen('THETA_AB3_IC_20161201.bin','w','b');
fwrite(fid,THETA,'single');
fclose(fid);
fprintf('finished THETA \n')
%%

%% SALT
SALT = temp(:,:,:,2);
fid = fopen('SALT_AB3_IC_20161201.bin','w','b');
fwrite(fid,SALT,'single');
fclose(fid);
fprintf('finished SALT \n')
%%

%% UVEL
UVEL = temp(:,:,:,3);
fid = fopen('UVEL_AB3_IC_20161201.bin','w','b');
fwrite(fid,UVEL,'single');
fclose(fid);
fprintf('finished UVEL \n')
%%

%% VVEL
VVEL = temp(:,:,:,4);
fid = fopen('VVEL_AB3_IC_20161201.bin','w','b');
fwrite(fid,VVEL,'single');
fclose(fid);
fprintf('finished VVEL \n')
%%

char = '../MITgcm/verification/SO3_20190510/diag/diag_bgc.0000000288';
temp = rdmds(char);

%% DIC
DIC = temp(:,:,:,1);
fid = fopen('DIC_AB3_IC_20161201.bin','w','b');
fwrite(fid,DIC,'single');
fclose(fid);
fprintf('finished DIC \n')
%%

%% Alk
Alk = temp(:,:,:,2);
fid = fopen('Alk_AB3_IC_20161201.bin','w','b');
fwrite(fid,Alk,'single');
fclose(fid);
fprintf('finished Alk \n')
%%

%% O2
O2 = temp(:,:,:,3);
fid = fopen('O2_AB3_IC_20161201.bin','w','b');
fwrite(fid,O2,'single');
fclose(fid);
fprintf('finished O2 \n')
%%

%% NO3
NO3 = temp(:,:,:,4);
fid = fopen('NO3_AB3_IC_20161201.bin','w','b');
fwrite(fid,NO3,'single');
fclose(fid);
fprintf('finished NO3 \n')
%%

%% PO4
PO4 = temp(:,:,:,5);
fid = fopen('PO4_AB3_IC_20161201.bin','w','b');
fwrite(fid,PO4,'single');
fclose(fid);
fprintf('finished PO4 \n')
%%

%% Fe
Fe = temp(:,:,:,6);
fid = fopen('Fe_AB3_IC_20161201.bin','w','b');
fwrite(fid,Fe,'single');
fclose(fid);
fprintf('finished Fe \n')
%%

%% DON
DON = temp(:,:,:,7);
fid = fopen('DON_AB3_IC_20161201.bin','w','b');
fwrite(fid,DON,'single');
fclose(fid);
fprintf('finished DON \n')
%%

%% DOP
DOP = temp(:,:,:,8);
fid = fopen('DOP_AB3_IC_20161201.bin','w','b');
fwrite(fid,DOP,'single');
fclose(fid);
fprintf('finished DOP \n')
%%

%% PHYTO_SM
PHYTO_SM = temp(:,:,:,9);
fid = fopen('PHYTO_SM_AB3_IC_20161201.bin','w','b');
fwrite(fid,PHYTO_SM,'single');
fclose(fid);
fprintf('finished PHYTO_SM \n')
%%

char = '../MITgcm/verification/SO3_20190514/diag/diag_state.0000000288';
temp = rdmds(char);

%% THETA
THETA = temp(:,:,:,1);
fid = fopen('THETA_AB3_IC_20170601.bin','w','b');
fwrite(fid,THETA,'single');
fclose(fid);
fprintf('finished THETA \n')
%%

%% SALT
SALT = temp(:,:,:,2);
fid = fopen('SALT_AB3_IC_20170601.bin','w','b');
fwrite(fid,SALT,'single');
fclose(fid);
fprintf('finished SALT \n')
%%

%% UVEL
UVEL = temp(:,:,:,3);
fid = fopen('UVEL_AB3_IC_20170601.bin','w','b');
fwrite(fid,UVEL,'single');
fclose(fid);
fprintf('finished UVEL \n')
%%

%% VVEL
VVEL = temp(:,:,:,4);
fid = fopen('VVEL_AB3_IC_20170601.bin','w','b');
fwrite(fid,VVEL,'single');
fclose(fid);
fprintf('finished VVEL \n')
%%

char = '../MITgcm/verification/SO3_20190514/diag/diag_bgc.0000000288';
temp = rdmds(char);

%% DIC
DIC = temp(:,:,:,1);
fid = fopen('DIC_AB3_IC_20170601.bin','w','b');
fwrite(fid,DIC,'single');
fclose(fid);
fprintf('finished DIC \n')
%%

%% Alk
Alk = temp(:,:,:,2);
fid = fopen('Alk_AB3_IC_20170601.bin','w','b');
fwrite(fid,Alk,'single');
fclose(fid);
fprintf('finished Alk \n')
%%

%% O2
O2 = temp(:,:,:,3);
fid = fopen('O2_AB3_IC_20170601.bin','w','b');
fwrite(fid,O2,'single');
fclose(fid);
fprintf('finished O2 \n')
%%

%% NO3
NO3 = temp(:,:,:,4);
fid = fopen('NO3_AB3_IC_20170601.bin','w','b');
fwrite(fid,NO3,'single');
fclose(fid);
fprintf('finished NO3 \n')
%%

%% PO4
PO4 = temp(:,:,:,5);
fid = fopen('PO4_AB3_IC_20170601.bin','w','b');
fwrite(fid,PO4,'single');
fclose(fid);
fprintf('finished PO4 \n')
%%

%% Fe
Fe = temp(:,:,:,6);
fid = fopen('Fe_AB3_IC_20170601.bin','w','b');
fwrite(fid,Fe,'single');
fclose(fid);
fprintf('finished Fe \n')
%%

%% DON
DON = temp(:,:,:,7);
fid = fopen('DON_AB3_IC_20170601.bin','w','b');
fwrite(fid,DON,'single');
fclose(fid);
fprintf('finished DON \n')
%%

%% DOP
DOP = temp(:,:,:,8);
fid = fopen('DOP_AB3_IC_20170601.bin','w','b');
fwrite(fid,DOP,'single');
fclose(fid);
fprintf('finished DOP \n')
%%

%% PHYTO_SM
PHYTO_SM = temp(:,:,:,9);
fid = fopen('PHYTO_SM_AB3_IC_20170601.bin','w','b');
fwrite(fid,PHYTO_SM,'single');
fclose(fid);
fprintf('finished PHYTO_SM \n')
%%

char = '../MITgcm/verification/SO6_20190510/diag/diag_state.0000000432';
temp = rdmds(char);

%% THETA
THETA = temp(:,:,:,1);
fid = fopen('THETA_AB6_IC_20161201.bin','w','b');
fwrite(fid,THETA,'single');
fclose(fid);
fprintf('finished THETA \n')
%%

%% SALT
SALT = temp(:,:,:,2);
fid = fopen('SALT_AB6_IC_20161201.bin','w','b');
fwrite(fid,SALT,'single');
fclose(fid);
fprintf('finished SALT \n')
%%

%% UVEL
UVEL = temp(:,:,:,3);
fid = fopen('UVEL_AB6_IC_20161201.bin','w','b');
fwrite(fid,UVEL,'single');
fclose(fid);
fprintf('finished UVEL \n')
%%

%% VVEL
VVEL = temp(:,:,:,4);
fid = fopen('VVEL_AB6_IC_20161201.bin','w','b');
fwrite(fid,VVEL,'single');
fclose(fid);
fprintf('finished VVEL \n')
%%

char = '../MITgcm/verification/SO6_20190510/diag/diag_bgc.0000000432';
temp = rdmds(char);

%% DIC
DIC = temp(:,:,:,1);
fid = fopen('DIC_AB6_IC_20161201.bin','w','b');
fwrite(fid,DIC,'single');
fclose(fid);
fprintf('finished DIC \n')
%%

%% Alk
Alk = temp(:,:,:,2);
fid = fopen('Alk_AB6_IC_20161201.bin','w','b');
fwrite(fid,Alk,'single');
fclose(fid);
fprintf('finished Alk \n')
%%

%% O2
O2 = temp(:,:,:,3);
fid = fopen('O2_AB6_IC_20161201.bin','w','b');
fwrite(fid,O2,'single');
fclose(fid);
fprintf('finished O2 \n')
%%

%% NO3
NO3 = temp(:,:,:,4);
fid = fopen('NO3_AB6_IC_20161201.bin','w','b');
fwrite(fid,NO3,'single');
fclose(fid);
fprintf('finished NO3 \n')
%%

%% PO4
PO4 = temp(:,:,:,5);
fid = fopen('PO4_AB6_IC_20161201.bin','w','b');
fwrite(fid,PO4,'single');
fclose(fid);
fprintf('finished PO4 \n')
%%

%% Fe
Fe = temp(:,:,:,6);
fid = fopen('Fe_AB6_IC_20161201.bin','w','b');
fwrite(fid,Fe,'single');
fclose(fid);
fprintf('finished Fe \n')
%%

%% DON
DON = temp(:,:,:,7);
fid = fopen('DON_AB6_IC_20161201.bin','w','b');
fwrite(fid,DON,'single');
fclose(fid);
fprintf('finished DON \n')
%%

%% DOP
DOP = temp(:,:,:,8);
fid = fopen('DOP_AB6_IC_20161201.bin','w','b');
fwrite(fid,DOP,'single');
fclose(fid);
fprintf('finished DOP \n')
%%

%% PHYTO_SM
PHYTO_SM = temp(:,:,:,9);
fid = fopen('PHYTO_SM_AB6_IC_20161201.bin','w','b');
fwrite(fid,PHYTO_SM,'single');
fclose(fid);
fprintf('finished PHYTO_SM \n')
%%

char = '../MITgcm/verification/SO6_20190514/diag/diag_state.0000000432';
temp = rdmds(char);

%% THETA
THETA = temp(:,:,:,1);
fid = fopen('THETA_AB6_IC_20170601.bin','w','b');
fwrite(fid,THETA,'single');
fclose(fid);
fprintf('finished THETA \n')
%%

%% SALT
SALT = temp(:,:,:,2);
fid = fopen('SALT_AB6_IC_20170601.bin','w','b');
fwrite(fid,SALT,'single');
fclose(fid);
fprintf('finished SALT \n')
%%

%% UVEL
UVEL = temp(:,:,:,3);
fid = fopen('UVEL_AB6_IC_20170601.bin','w','b');
fwrite(fid,UVEL,'single');
fclose(fid);
fprintf('finished UVEL \n')
%%

%% VVEL
VVEL = temp(:,:,:,4);
fid = fopen('VVEL_AB6_IC_20170601.bin','w','b');
fwrite(fid,VVEL,'single');
fclose(fid);
fprintf('finished VVEL \n')
%%

char = '../MITgcm/verification/SO6_20190514/diag/diag_bgc.0000000432';
temp = rdmds(char);

%% DIC
DIC = temp(:,:,:,1);
fid = fopen('DIC_AB6_IC_20170601.bin','w','b');
fwrite(fid,DIC,'single');
fclose(fid);
fprintf('finished DIC \n')
%%

%% Alk
Alk = temp(:,:,:,2);
fid = fopen('Alk_AB6_IC_20170601.bin','w','b');
fwrite(fid,Alk,'single');
fclose(fid);
fprintf('finished Alk \n')
%%

%% O2
O2 = temp(:,:,:,3);
fid = fopen('O2_AB6_IC_20170601.bin','w','b');
fwrite(fid,O2,'single');
fclose(fid);
fprintf('finished O2 \n')
%%

%% NO3
NO3 = temp(:,:,:,4);
fid = fopen('NO3_AB6_IC_20170601.bin','w','b');
fwrite(fid,NO3,'single');
fclose(fid);
fprintf('finished NO3 \n')
%%

%% PO4
PO4 = temp(:,:,:,5);
fid = fopen('PO4_AB6_IC_20170601.bin','w','b');
fwrite(fid,PO4,'single');
fclose(fid);
fprintf('finished PO4 \n')
%%

%% Fe
Fe = temp(:,:,:,6);
fid = fopen('Fe_AB6_IC_20170601.bin','w','b');
fwrite(fid,Fe,'single');
fclose(fid);
fprintf('finished Fe \n')
%%

%% DON
DON = temp(:,:,:,7);
fid = fopen('DON_AB6_IC_20170601.bin','w','b');
fwrite(fid,DON,'single');
fclose(fid);
fprintf('finished DON \n')
%%

%% DOP
DOP = temp(:,:,:,8);
fid = fopen('DOP_AB6_IC_20170601.bin','w','b');
fwrite(fid,DOP,'single');
fclose(fid);
fprintf('finished DOP \n')
%%

%% PHYTO_SM
PHYTO_SM = temp(:,:,:,9);
fid = fopen('PHYTO_SM_AB6_IC_20170601.bin','w','b');
fwrite(fid,PHYTO_SM,'single');
fclose(fid);
fprintf('finished PHYTO_SM \n')
%%

char = '../MITgcm/verification/SO12_20190510/diag/diag_state.0000001080';
temp = rdmds(char);

%% THETA
THETA = temp(:,:,:,1);
fid = fopen('THETA_AB12_IC_20161201.bin','w','b');
fwrite(fid,THETA,'single');
fclose(fid);
fprintf('finished THETA \n')
%%

%% SALT
SALT = temp(:,:,:,2);
fid = fopen('SALT_AB12_IC_20161201.bin','w','b');
fwrite(fid,SALT,'single');
fclose(fid);
fprintf('finished SALT \n')
%%

%% UVEL
UVEL = temp(:,:,:,3);
fid = fopen('UVEL_AB12_IC_20161201.bin','w','b');
fwrite(fid,UVEL,'single');
fclose(fid);
fprintf('finished UVEL \n')
%%

%% VVEL
VVEL = temp(:,:,:,4);
fid = fopen('VVEL_AB12_IC_20161201.bin','w','b');
fwrite(fid,VVEL,'single');
fclose(fid);
fprintf('finished VVEL \n')
%%

char = '../MITgcm/verification/SO12_20190510/diag/diag_bgc.0000001080';
temp = rdmds(char);

%% DIC
DIC = temp(:,:,:,1);
fid = fopen('DIC_AB12_IC_20161201.bin','w','b');
fwrite(fid,DIC,'single');
fclose(fid);
fprintf('finished DIC \n')
%%

%% Alk
Alk = temp(:,:,:,2);
fid = fopen('Alk_AB12_IC_20161201.bin','w','b');
fwrite(fid,Alk,'single');
fclose(fid);
fprintf('finished Alk \n')
%%

%% O2
O2 = temp(:,:,:,3);
fid = fopen('O2_AB12_IC_20161201.bin','w','b');
fwrite(fid,O2,'single');
fclose(fid);
fprintf('finished O2 \n')
%%

%% NO3
NO3 = temp(:,:,:,4);
fid = fopen('NO3_AB12_IC_20161201.bin','w','b');
fwrite(fid,NO3,'single');
fclose(fid);
fprintf('finished NO3 \n')
%%

%% PO4
PO4 = temp(:,:,:,5);
fid = fopen('PO4_AB12_IC_20161201.bin','w','b');
fwrite(fid,PO4,'single');
fclose(fid);
fprintf('finished PO4 \n')
%%

%% Fe
Fe = temp(:,:,:,6);
fid = fopen('Fe_AB12_IC_20161201.bin','w','b');
fwrite(fid,Fe,'single');
fclose(fid);
fprintf('finished Fe \n')
%%

%% DON
DON = temp(:,:,:,7);
fid = fopen('DON_AB12_IC_20161201.bin','w','b');
fwrite(fid,DON,'single');
fclose(fid);
fprintf('finished DON \n')
%%

%% DOP
DOP = temp(:,:,:,8);
fid = fopen('DOP_AB12_IC_20161201.bin','w','b');
fwrite(fid,DOP,'single');
fclose(fid);
fprintf('finished DOP \n')
%%

%% PHYTO_SM
PHYTO_SM = temp(:,:,:,9);
fid = fopen('PHYTO_SM_AB12_IC_20161201.bin','w','b');
fwrite(fid,PHYTO_SM,'single');
fclose(fid);
fprintf('finished PHYTO_SM \n')
%%

char = '../MITgcm/verification/SO12_20190514/diag/diag_state.0000001080';
temp = rdmds(char);

%% THETA
THETA = temp(:,:,:,1);
fid = fopen('THETA_AB12_IC_20170601.bin','w','b');
fwrite(fid,THETA,'single');
fclose(fid);
fprintf('finished THETA \n')
%%

%% SALT
SALT = temp(:,:,:,2);
fid = fopen('SALT_AB12_IC_20170601.bin','w','b');
fwrite(fid,SALT,'single');
fclose(fid);
fprintf('finished SALT \n')
%%

%% UVEL
UVEL = temp(:,:,:,3);
fid = fopen('UVEL_AB12_IC_20170601.bin','w','b');
fwrite(fid,UVEL,'single');
fclose(fid);
fprintf('finished UVEL \n')
%%

%% VVEL
VVEL = temp(:,:,:,4);
fid = fopen('VVEL_AB12_IC_20170601.bin','w','b');
fwrite(fid,VVEL,'single');
fclose(fid);
fprintf('finished VVEL \n')
%%

char = '../MITgcm/verification/SO12_20190514/diag/diag_bgc.0000001080';
temp = rdmds(char);

%% DIC
DIC = temp(:,:,:,1);
fid = fopen('DIC_AB12_IC_20170601.bin','w','b');
fwrite(fid,DIC,'single');
fclose(fid);
fprintf('finished DIC \n')
%%

%% Alk
Alk = temp(:,:,:,2);
fid = fopen('Alk_AB12_IC_20170601.bin','w','b');
fwrite(fid,Alk,'single');
fclose(fid);
fprintf('finished Alk \n')
%%

%% O2
O2 = temp(:,:,:,3);
fid = fopen('O2_AB12_IC_20170601.bin','w','b');
fwrite(fid,O2,'single');
fclose(fid);
fprintf('finished O2 \n')
%%

%% NO3
NO3 = temp(:,:,:,4);
fid = fopen('NO3_AB12_IC_20170601.bin','w','b');
fwrite(fid,NO3,'single');
fclose(fid);
fprintf('finished NO3 \n')
%%

%% PO4
PO4 = temp(:,:,:,5);
fid = fopen('PO4_AB12_IC_20170601.bin','w','b');
fwrite(fid,PO4,'single');
fclose(fid);
fprintf('finished PO4 \n')
%%

%% Fe
Fe = temp(:,:,:,6);
fid = fopen('Fe_AB12_IC_20170601.bin','w','b');
fwrite(fid,Fe,'single');
fclose(fid);
fprintf('finished Fe \n')
%%

%% DON
DON = temp(:,:,:,7);
fid = fopen('DON_AB12_IC_20170601.bin','w','b');
fwrite(fid,DON,'single');
fclose(fid);
fprintf('finished DON \n')
%%

%% DOP
DOP = temp(:,:,:,8);
fid = fopen('DOP_AB12_IC_20170601.bin','w','b');
fwrite(fid,DOP,'single');
fclose(fid);
fprintf('finished DOP \n')
%%

%% PHYTO_SM
PHYTO_SM = temp(:,:,:,9);
fid = fopen('PHYTO_SM_AB12_IC_20170601.bin','w','b');
fwrite(fid,PHYTO_SM,'single');
fclose(fid);
fprintf('finished PHYTO_SM \n')
%%

clear
