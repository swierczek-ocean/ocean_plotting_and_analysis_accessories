clear
close all
clc
tic()

load PERT_RESPONSE

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

save PERT_RESPONSE lin* nonlin* six_hours

toc()