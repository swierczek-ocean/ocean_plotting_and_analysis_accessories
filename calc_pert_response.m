clear
close all
clc
tic()

%% SST

load SST3

fprintf('1/3 SST \n')
[lin_sst3,nonlin_sst3] = pert_response(sst3c(36:140,18:100,:),...
    sst3p(36:140,18:100,:),sst3n(36:140,18:100,:));

clear sst3*

load SST12

fprintf('1/12 SST \n')
[lin_sst12,nonlin_sst12] = pert_response(sst12c(137:556,63:391,:),...
    sst12p(137:556,63:391,:),sst12n(137:556,63:391,:));

clear sst12*

%% SSH

load SSH3

fprintf('1/3 SSH \n')
[lin_ssh3,nonlin_ssh3] = pert_response(ssh3c(36:140,18:100,:),...
    ssh3p(36:140,18:100,:),ssh3n(36:140,18:100,:));

clear ssh3*

load SSH12

fprintf('1/12 SSH \n')
[lin_ssh12,nonlin_ssh12] = pert_response(ssh12c(137:556,63:391,:),...
    ssh12p(137:556,63:391,:),ssh12n(137:556,63:391,:));

clear ssh12*

%% TF

load TF3

fprintf('1/3 TF \n')
[lin_tf3,nonlin_tf3] = pert_response(tf3c(36:140,18:100,:),...
    tf3p(36:140,18:100,:),tf3n(36:140,18:100,:));

clear tf3*

load TF12

fprintf('1/12 TF \n')
[lin_tf12,nonlin_tf12] = pert_response(tf12c(137:556,63:391,:),...
    tf12p(137:556,63:391,:),tf12n(137:556,63:391,:));

clear tf12*

%% CF

load CF3

fprintf('1/3 CF \n')
[lin_cf3,nonlin_cf3] = pert_response(cf3c(36:140,18:100,:),...
    cf3p(36:140,18:100,:),cf3n(36:140,18:100,:));

clear cf3*

load CF12

fprintf('1/12 CF \n')
[lin_cf12,nonlin_cf12] = pert_response(cf12c(137:556,63:391,:),...
    cf12p(137:556,63:391,:),cf12n(137:556,63:391,:));

clear cf12*

%% DIC

load DIC3

fprintf('1/3 DIC \n')
[lin_dic3,nonlin_dic3] = pert_response(dic3c(36:140,18:100,:),...
    dic3p(36:140,18:100,:),dic3n(36:140,18:100,:));

clear dic3*

load DIC12

fprintf('1/12 DIC \n')
[lin_dic12,nonlin_dic12] = pert_response(dic12c(137:556,63:391,:),...
    dic12p(137:556,63:391,:),dic12n(137:556,63:391,:));

clear dic12*

%% MLD

load MLD3

fprintf('1/3 MLD \n')
[lin_mld3,nonlin_mld3] = pert_response(mld3c(36:140,18:100,:),...
    mld3p(36:140,18:100,:),mld3n(36:140,18:100,:));

clear mld3*

load MLD12

fprintf('1/12 MLD \n')
[lin_mld12,nonlin_mld12] = pert_response(mld12c(137:556,63:391,:),...
    mld12p(137:556,63:391,:),mld12n(137:556,63:391,:));

clear mld12*

%% DO

load DO3

fprintf('1/3 DO \n')
[lin_do3,nonlin_do3] = pert_response(do3c(36:140,18:100,:),...
    do3p(36:140,18:100,:),do3n(36:140,18:100,:));

clear do3*

load DO12

fprintf('1/12 DO \n')
[lin_do12,nonlin_do12] = pert_response(do12c(137:556,63:391,:),...
    do12p(137:556,63:391,:),do12n(137:556,63:391,:));

clear do12*

%% NO

load NO3

fprintf('1/3 NO \n')
[lin_no3,nonlin_no3] = pert_response(no3c(36:140,18:100,:),...
    no3p(36:140,18:100,:),no3n(36:140,18:100,:));

clear no3*

load NO12

fprintf('1/12 NO \n')
[lin_no12,nonlin_no12] = pert_response(no12c(137:556,63:391,:),...
    no12p(137:556,63:391,:),no12n(137:556,63:391,:));

clear no12*

%% Date and Save

x = datenum('01012017','mmddyyyy');
y = datenum('05032017','mmddyyyy');

six_hours = x:0.25:y;
six_hours = six_hours(1:(end-1));

save PERT_RESPONSE lin* nonlin* six_hours

toc()