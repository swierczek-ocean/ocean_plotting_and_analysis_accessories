clear
close all
clc
tic()

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_3

nn = length(prof_lat);

theta_mf_3_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_Tdif(ii,61:63);
    theta_mf_3_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(theta_mf_3_temp)==0);
prof_lat = prof_lat(isnan(theta_mf_3_temp)==0);
theta_mf_3_temp = theta_mf_3_temp(isnan(theta_mf_3_temp)==0);

theta_mf_3 = [prof_lon;prof_lat;theta_mf_3_temp];

save MIST_PROFILES/Misfits/processed_2/theta_mf_3 theta_mf_3

clear

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_6

nn = length(prof_lat);

theta_mf_6_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_Tdif(ii,61:63);
    theta_mf_6_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(theta_mf_6_temp)==0);
prof_lat = prof_lat(isnan(theta_mf_6_temp)==0);
theta_mf_6_temp = theta_mf_6_temp(isnan(theta_mf_6_temp)==0);

theta_mf_6 = [prof_lon;prof_lat;theta_mf_6_temp];

save MIST_PROFILES/Misfits/processed_2/theta_mf_6 theta_mf_6

clear

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_12

nn = length(prof_lat);

theta_mf_12_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_Tdif(ii,61:63);
    theta_mf_12_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(theta_mf_12_temp)==0);
prof_lat = prof_lat(isnan(theta_mf_12_temp)==0);
theta_mf_12_temp = theta_mf_12_temp(isnan(theta_mf_12_temp)==0);

theta_mf_12 = [prof_lon;prof_lat;theta_mf_12_temp];

save MIST_PROFILES/Misfits/processed_2/theta_mf_12 theta_mf_12

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_3
ufac=1e6/1035;
nn = length(prof_lat);

dic_mf_3_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_DICdif(ii,61:63);
    dic_mf_3_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(dic_mf_3_temp)==0);
prof_lat = prof_lat(isnan(dic_mf_3_temp)==0);
dic_mf_3_temp = ufac.*dic_mf_3_temp(isnan(dic_mf_3_temp)==0);

dic_mf_3 = [prof_lon;prof_lat;dic_mf_3_temp];

save MIST_PROFILES/Misfits/processed_2/dic_mf_3 dic_mf_3

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_6
ufac=1e6/1035;
nn = length(prof_lat);

dic_mf_6_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_DICdif(ii,61:63);
    dic_mf_6_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(dic_mf_6_temp)==0);
prof_lat = prof_lat(isnan(dic_mf_6_temp)==0);
dic_mf_6_temp = ufac.*dic_mf_6_temp(isnan(dic_mf_6_temp)==0);

dic_mf_6 = [prof_lon;prof_lat;dic_mf_6_temp];

save MIST_PROFILES/Misfits/processed_2/dic_mf_6 dic_mf_6

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_12
ufac=1e6/1035;
nn = length(prof_lat);

dic_mf_12_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_DICdif(ii,61:63);
    dic_mf_12_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(dic_mf_12_temp)==0);
prof_lat = prof_lat(isnan(dic_mf_12_temp)==0);
dic_mf_12_temp = ufac.*dic_mf_12_temp(isnan(dic_mf_12_temp)==0);

dic_mf_12 = [prof_lon;prof_lat;dic_mf_12_temp];

save MIST_PROFILES/Misfits/processed_2/dic_mf_12 dic_mf_12

clear

% load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_3
% numT = zeros(97,1);
% for jj=1:97
%     temp = prof_Tdif(:,jj);
%     temp = temp(isnan(temp)==0);
%     numT(jj) = length(temp);
% end
% 
% [prof_depth,numT]

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_3

nn = length(prof_lat);

theta_mfn_3_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_Tdifn(ii,61:63);
    theta_mfn_3_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(theta_mfn_3_temp)==0);
prof_lat = prof_lat(isnan(theta_mfn_3_temp)==0);
theta_mfn_3_temp = theta_mfn_3_temp(isnan(theta_mfn_3_temp)==0);

theta_mfn_3 = [prof_lon;prof_lat;theta_mfn_3_temp];

save MIST_PROFILES/Misfits/processed_2/theta_mfn_3 theta_mfn_3

clear

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_6

nn = length(prof_lat);

theta_mfn_6_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_Tdifn(ii,61:63);
    theta_mfn_6_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(theta_mfn_6_temp)==0);
prof_lat = prof_lat(isnan(theta_mfn_6_temp)==0);
theta_mfn_6_temp = theta_mfn_6_temp(isnan(theta_mfn_6_temp)==0);

theta_mfn_6 = [prof_lon;prof_lat;theta_mfn_6_temp];

save MIST_PROFILES/Misfits/processed_2/theta_mfn_6 theta_mfn_6

clear

load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_12

nn = length(prof_lat);

theta_mfn_12_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_Tdifn(ii,61:63);
    theta_mfn_12_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(theta_mfn_12_temp)==0);
prof_lat = prof_lat(isnan(theta_mfn_12_temp)==0);
theta_mfn_12_temp = theta_mfn_12_temp(isnan(theta_mfn_12_temp)==0);

theta_mfn_12 = [prof_lon;prof_lat;theta_mfn_12_temp];

save MIST_PROFILES/Misfits/processed_2/theta_mfn_12 theta_mfn_12

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_3
ufac=1e6/1035;
nn = length(prof_lat);

dic_mfn_3_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_DICdifn(ii,61:63);
    dic_mfn_3_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(dic_mfn_3_temp)==0);
prof_lat = prof_lat(isnan(dic_mfn_3_temp)==0);
dic_mfn_3_temp = dic_mfn_3_temp(isnan(dic_mfn_3_temp)==0);

dic_mfn_3 = [prof_lon;prof_lat;dic_mfn_3_temp];

save MIST_PROFILES/Misfits/processed_2/dic_mfn_3 dic_mfn_3

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_6
ufac=1e6/1035;
nn = length(prof_lat);

dic_mfn_6_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_DICdifn(ii,61:63);
    dic_mfn_6_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(dic_mfn_6_temp)==0);
prof_lat = prof_lat(isnan(dic_mfn_6_temp)==0);
dic_mfn_6_temp = dic_mfn_6_temp(isnan(dic_mfn_6_temp)==0);

dic_mfn_6 = [prof_lon;prof_lat;dic_mfn_6_temp];

save MIST_PROFILES/Misfits/processed_2/dic_mfn_6 dic_mfn_6

clear

load MIST_PROFILES/Misfits/DIC_VIZ_SO_2017_PFL_12
ufac=1e6/1035;
nn = length(prof_lat);

dic_mfn_12_temp = zeros(1,nn);

for ii=1:nn
    temp = prof_DICdifn(ii,61:63);
    dic_mfn_12_temp(ii) = mean(temp(isnan(temp)==0));
end

prof_lon = prof_lon(isnan(dic_mfn_12_temp)==0);
prof_lat = prof_lat(isnan(dic_mfn_12_temp)==0);
dic_mfn_12_temp = dic_mfn_12_temp(isnan(dic_mfn_12_temp)==0);

dic_mfn_12 = [prof_lon;prof_lat;dic_mfn_12_temp];

save MIST_PROFILES/Misfits/processed_2/dic_mfn_12 dic_mfn_12

clear

% load MIST_PROFILES/Misfits/THETA_USGO_WO_2017_PFL_D_3
% numT = zeros(97,1);
% for jj=1:97
%     temp = prof_Tdifn(:,jj);
%     temp = temp(isnan(temp)==0);
%     numT(jj) = length(temp);
% end
% 
% [prof_depth,numT]







toc()