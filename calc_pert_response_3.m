clear
close all
clc
tic()

load PERT_RESPONSE

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