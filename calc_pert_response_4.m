clear
close all
clc
tic()

load PERT_RESPONSE

%% SSS

load SSS3

fprintf('1/3 SSS \n')
[lin_sss3,nonlin_sss3] = pert_response(sss3c(36:140,18:100,:),...
    sss3p(36:140,18:100,:),sss3n(36:140,18:100,:));

clear sss3*

load SSS12

fprintf('1/12 SSS \n')
[lin_sss12,nonlin_sss12] = pert_response(sss12c(137:556,63:391,:),...
    sss12p(137:556,63:391,:),sss12n(137:556,63:391,:));

clear sss12*

save PERT_RESPONSE lin* nonlin* six_hours

toc()