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

%% Date and Save

x = datenum('01012017','mmddyyyy');
y = datenum('05032017','mmddyyyy');

six_hours = x:0.25:y;
six_hours = six_hours(1:(end-1));

save PERT_RESPONSE lin* nonlin* six_hours

toc()