clear
close all
clc
tic()

RAC12 = rdmds('RAC12');
hFacC12 = rdmds('hFacC12');

mask12 = hFacC12(16:741,16:497,1);
RAC12 = RAC12(16:741,16:497);
clear hFacC12

RAC3 = rdmds('RAC3');
hFacC3 = rdmds('hFacC3');

mask3 = hFacC3(6:187,6:127,1);
RAC3 = RAC3(6:187,6:127);
clear hFacC3

%% SST

load SST3

fprintf('1/3 SST \n')
[lin_sst3,nonlin_sst3] = pert_response(sst3c(6:187,6:127,:),...
    sst3p(6:187,6:127,:),sst3n(6:187,6:127,:),mask3,RAC3);

clear sst3*

load SST12

fprintf('1/12 SST \n')
[lin_sst12,nonlin_sst12] = pert_response(sst12c(16:741,16:497,:),...
    sst12p(16:741,16:497,:),sst12n(16:741,16:497,:),mask12,RAC12);

clear sst12*

%% SSH

load SSH3

fprintf('1/3 SSH \n')
[lin_ssh3,nonlin_ssh3] = pert_response(ssh3c(6:187,6:127,:),...
    ssh3p(6:187,6:127,:),ssh3n(6:187,6:127,:),mask3,RAC3);

clear ssh3*

load SSH12

fprintf('1/12 SSH \n')
[lin_ssh12,nonlin_ssh12] = pert_response(ssh12c(16:741,16:497,:),...
    ssh12p(16:741,16:497,:),ssh12n(16:741,16:497,:),mask12,RAC12);

clear ssh12*

%% TF

load TF3

fprintf('1/3 TF \n')
[lin_tf3,nonlin_tf3] = pert_response(tf3c(6:187,6:127,:),...
    tf3p(6:187,6:127,:),tf3n(6:187,6:127,:),mask3,RAC3);

clear tf3*

load TF12

fprintf('1/12 TF \n')
[lin_tf12,nonlin_tf12] = pert_response(tf12c(16:741,16:497,:),...
    tf12p(16:741,16:497,:),tf12n(16:741,16:497,:),mask12,RAC12);

clear tf12*

%% CF

load CF3

fprintf('1/3 CF \n')
[lin_cf3,nonlin_cf3] = pert_response(cf3c(6:187,6:127,:),...
    cf3p(6:187,6:127,:),cf3n(6:187,6:127,:),mask3,RAC3);

clear cf3*

load CF12

fprintf('1/12 CF \n')
[lin_cf12,nonlin_cf12] = pert_response(cf12c(16:741,16:497,:),...
    cf12p(16:741,16:497,:),cf12n(16:741,16:497,:),mask12,RAC12);

clear cf12*

%% DIC

load DIC3

fprintf('1/3 DIC \n')
[lin_dic3,nonlin_dic3] = pert_response(dic3c(6:187,6:127,:),...
    dic3p(6:187,6:127,:),dic3n(6:187,6:127,:),mask3,RAC3);

clear dic3*

load DIC12

fprintf('1/12 DIC \n')
[lin_dic12,nonlin_dic12] = pert_response(dic12c(16:741,16:497,:),...
    dic12p(16:741,16:497,:),dic12n(16:741,16:497,:),mask12,RAC12);

clear dic12*

%% MLD

load MLD3

mld3c(isnan(mld3c)==1) = 0;
mld3p(isnan(mld3p)==1) = 0;
mld3n(isnan(mld3n)==1) = 0;

fprintf('1/3 MLD \n')
[lin_mld3,nonlin_mld3] = pert_response(mld3c(6:187,6:127,:),...
    mld3p(6:187,6:127,:),mld3n(6:187,6:127,:),mask3,RAC3);

clear mld3*

load MLD12

mld12c(isnan(mld12c)==1) = 0;
mld12p(isnan(mld12p)==1) = 0;
mld12n(isnan(mld12n)==1) = 0;

fprintf('1/12 MLD \n')
[lin_mld12,nonlin_mld12] = pert_response(mld12c(16:741,16:497,:),...
    mld12p(16:741,16:497,:),mld12n(16:741,16:497,:),mask12,RAC12);

clear mld12*

%% DO

load DO3

fprintf('1/3 DO \n')
[lin_do3,nonlin_do3] = pert_response(do3c(6:187,6:127,:),...
    do3p(6:187,6:127,:),do3n(6:187,6:127,:),mask3,RAC3);

clear do3*

load DO12

fprintf('1/12 DO \n')
[lin_do12,nonlin_do12] = pert_response(do12c(16:741,16:497,:),...
    do12p(16:741,16:497,:),do12n(16:741,16:497,:),mask12,RAC12);

clear do12*

%% NO

load NO3

fprintf('1/3 NO \n')
[lin_no3,nonlin_no3] = pert_response(no3c(6:187,6:127,:),...
    no3p(6:187,6:127,:),no3n(6:187,6:127,:),mask3,RAC3);

clear no3*

load NO12

fprintf('1/12 NO \n')
[lin_no12,nonlin_no12] = pert_response(no12c(16:741,16:497,:),...
    no12p(16:741,16:497,:),no12n(16:741,16:497,:),mask12,RAC12);

clear no12*

%% SSS

load SSS3

fprintf('1/3 SSS \n')
[lin_sss3,nonlin_sss3] = pert_response(sss3c(6:187,6:127,:),...
    sss3p(6:187,6:127,:),sss3n(6:187,6:127,:),mask3,RAC3);

clear sss3*

load SSS12

fprintf('1/12 SSS \n')
[lin_sss12,nonlin_sss12] = pert_response(sss12c(16:741,16:497,:),...
    sss12p(16:741,16:497,:),sss12n(16:741,16:497,:),mask12,RAC12);

clear sss12*

%% Date and Save

x = datenum('01012017','mmddyyyy');
y = datenum('05032017','mmddyyyy');

six_hours = x:0.25:y;
six_hours = six_hours(1:(end-1));

save PERT_RESPONSE lin* nonlin* six_hours

toc()