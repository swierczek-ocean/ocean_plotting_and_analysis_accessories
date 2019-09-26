clear
close all
clc

tic()

strdate = '20161201:00:00';
numdate_start = datenum(strdate,'yyyymmdd:HH:MM')
enddate = '20171231:10:00';
numdate_end = datenum(enddate,'yyyymmdd:HH:MM')
time = numdate_start:(1/24):numdate_end;

%% 1/3 degree
load OOI_Sampling/THETA_OOI_32
load OOI_Sampling/SALT_OOI_32
%%

%%
MITgcm3_OOI_CTD_30m = [time',theta_ooia_32(6,:)',salt_ooia_32(6,:)',...
    theta_ooib_32(6,:)',salt_ooib_32(6,:)'];
str_exp = '[time,thetaA,saltA,thetaB,saltB]';

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_30m MITgcm3_OOI_CTD_30m str_exp
%%

%%
MITgcm3_OOI_CTD_40m = [time',theta_ooia_32(7,:)',salt_ooia_32(7,:)',...
    theta_ooib_32(7,:)',salt_ooib_32(7,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_40m MITgcm3_OOI_CTD_40m str_exp
%%

%%
MITgcm3_OOI_CTD_60m = [time',theta_ooia_32(9,:)',salt_ooia_32(9,:)',...
    theta_ooib_32(9,:)',salt_ooib_32(9,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_60m MITgcm3_OOI_CTD_60m str_exp
%%

%%
MITgcm3_OOI_CTD_90m = [time',theta_ooia_32(12,:)',salt_ooia_32(12,:)',...
    theta_ooib_32(12,:)',salt_ooib_32(12,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_90m MITgcm3_OOI_CTD_90m str_exp
%%

%%
MITgcm3_OOI_CTD_130m = [time',theta_ooia_32(16,:)',salt_ooia_32(16,:)',...
    theta_ooib_32(16,:)',salt_ooib_32(16,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_130m MITgcm3_OOI_CTD_130m str_exp
%%

%%
MITgcm3_OOI_CTD_180m = [time',theta_ooia_32(19,:)',salt_ooia_32(19,:)',...
    theta_ooib_32(19,:)',salt_ooib_32(19,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_180m MITgcm3_OOI_CTD_180m str_exp
%%

%%
MITgcm3_OOI_CTD_250m = [time',theta_ooia_32(23,:)',salt_ooia_32(23,:)',...
    theta_ooib_32(23,:)',salt_ooib_32(23,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_250m MITgcm3_OOI_CTD_250m str_exp
%%

%%
MITgcm3_OOI_CTD_350m = [time',theta_ooia_32(27,:)',salt_ooia_32(27,:)',...
    theta_ooib_32(27,:)',salt_ooib_32(27,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_350m MITgcm3_OOI_CTD_350m str_exp
%%

%%
MITgcm3_OOI_CTD_500m = [time',theta_ooia_32(30,:)',salt_ooia_32(30,:)',...
    theta_ooib_32(30,:)',salt_ooib_32(30,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_500m MITgcm3_OOI_CTD_500m str_exp
%%

%%
MITgcm3_OOI_CTD_750m = [time',theta_ooia_32(34,:)',salt_ooia_32(34,:)',...
    theta_ooib_32(34,:)',salt_ooib_32(34,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_750m MITgcm3_OOI_CTD_750m str_exp
%%

%%
MITgcm3_OOI_CTD_1000m = [time',theta_ooia_32(36,:)',salt_ooia_32(36,:)',...
    theta_ooib_32(36,:)',salt_ooib_32(36,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_1000m MITgcm3_OOI_CTD_1000m str_exp
%%

%%
MITgcm3_OOI_CTD_1500m = [time',theta_ooia_32(40,:)',salt_ooia_32(40,:)',...
    theta_ooib_32(40,:)',salt_ooib_32(40,:)'];

save MITgcm_OOI_equiv/MITgcm3_OOI_CTD_1500m MITgcm3_OOI_CTD_1500m str_exp
%%

%% 1/6 degree
load OOI_Sampling/THETA_OOI_62
load OOI_Sampling/SALT_OOI_62
%%

%%
MITgcm6_OOI_CTD_30m = [time',theta_ooia_62(6,:)',salt_ooia_62(6,:)',...
    theta_ooib_62(6,:)',salt_ooib_62(6,:)'];
str_exp = '[time,thetaA,saltA,thetaB,saltB]';

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_30m MITgcm6_OOI_CTD_30m str_exp
%%

%%
MITgcm6_OOI_CTD_40m = [time',theta_ooia_62(7,:)',salt_ooia_62(7,:)',...
    theta_ooib_62(7,:)',salt_ooib_62(7,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_40m MITgcm6_OOI_CTD_40m str_exp
%%

%%
MITgcm6_OOI_CTD_60m = [time',theta_ooia_62(9,:)',salt_ooia_62(9,:)',...
    theta_ooib_62(9,:)',salt_ooib_62(9,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_60m MITgcm6_OOI_CTD_60m str_exp
%%

%%
MITgcm6_OOI_CTD_90m = [time',theta_ooia_62(12,:)',salt_ooia_62(12,:)',...
    theta_ooib_62(12,:)',salt_ooib_62(12,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_90m MITgcm6_OOI_CTD_90m str_exp
%%

%%
MITgcm6_OOI_CTD_130m = [time',theta_ooia_62(16,:)',salt_ooia_62(16,:)',...
    theta_ooib_62(16,:)',salt_ooib_62(16,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_130m MITgcm6_OOI_CTD_130m str_exp
%%

%%
MITgcm6_OOI_CTD_180m = [time',theta_ooia_62(19,:)',salt_ooia_62(19,:)',...
    theta_ooib_62(19,:)',salt_ooib_62(19,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_180m MITgcm6_OOI_CTD_180m str_exp
%%

%%
MITgcm6_OOI_CTD_250m = [time',theta_ooia_62(23,:)',salt_ooia_62(23,:)',...
    theta_ooib_62(23,:)',salt_ooib_62(23,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_250m MITgcm6_OOI_CTD_250m str_exp
%%

%%
MITgcm6_OOI_CTD_350m = [time',theta_ooia_62(27,:)',salt_ooia_62(27,:)',...
    theta_ooib_62(27,:)',salt_ooib_62(27,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_350m MITgcm6_OOI_CTD_350m str_exp
%%

%%
MITgcm6_OOI_CTD_500m = [time',theta_ooia_62(30,:)',salt_ooia_62(30,:)',...
    theta_ooib_62(30,:)',salt_ooib_62(30,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_500m MITgcm6_OOI_CTD_500m str_exp
%%

%%
MITgcm6_OOI_CTD_750m = [time',theta_ooia_62(34,:)',salt_ooia_62(34,:)',...
    theta_ooib_62(34,:)',salt_ooib_62(34,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_750m MITgcm6_OOI_CTD_750m str_exp
%%

%%
MITgcm6_OOI_CTD_1000m = [time',theta_ooia_62(36,:)',salt_ooia_62(36,:)',...
    theta_ooib_62(36,:)',salt_ooib_62(36,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_1000m MITgcm6_OOI_CTD_1000m str_exp
%%

%%
MITgcm6_OOI_CTD_1500m = [time',theta_ooia_62(40,:)',salt_ooia_62(40,:)',...
    theta_ooib_62(40,:)',salt_ooib_62(40,:)'];

save MITgcm_OOI_equiv/MITgcm6_OOI_CTD_1500m MITgcm6_OOI_CTD_1500m str_exp
%%

%% 1/12 degree
load OOI_Sampling/THETA_OOI_122
load OOI_Sampling/SALT_OOI_122
%%

%%
MITgcm12_OOI_CTD_30m = [time',theta_ooia_122(12,:)',salt_ooia_122(12,:)',...
    theta_ooib_122(12,:)',salt_ooib_122(12,:)'];
str_exp = '[time,thetaA,saltA,thetaB,saltB]';

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_30m MITgcm12_OOI_CTD_30m str_exp
%%

%%
MITgcm12_OOI_CTD_40m = [time',((theta_ooia_122(14,:)+theta_ooia_122(13,:))./2)',...
    ((salt_ooia_122(14,:)+salt_ooia_122(13,:))./2)',...
    ((theta_ooib_122(14,:)+theta_ooib_122(13,:))./2)',...
    ((salt_ooib_122(14,:)+salt_ooib_122(13,:))./2)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_40m MITgcm12_OOI_CTD_40m str_exp
%%

%%
MITgcm12_OOI_CTD_60m = [time',((theta_ooia_122(18,:)+theta_ooia_122(17,:))./2)',...
    ((salt_ooia_122(18,:)+salt_ooia_122(17,:))./2)',...
    ((theta_ooib_122(18,:)+theta_ooib_122(17,:))./2)',...
    ((salt_ooib_122(18,:)+salt_ooib_122(17,:))./2)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_60m MITgcm12_OOI_CTD_60m str_exp
%%

%%
MITgcm12_OOI_CTD_90m = [time',((theta_ooia_122(24,:)+theta_ooia_122(23,:))./2)',...
    ((salt_ooia_122(24,:)+salt_ooia_122(23,:))./2)',...
    ((theta_ooib_122(24,:)+theta_ooib_122(23,:))./2)',...
    ((salt_ooib_122(24,:)+salt_ooib_122(23,:))./2)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_90m MITgcm12_OOI_CTD_90m str_exp
%%

%%
MITgcm12_OOI_CTD_130m = [time',((theta_ooia_122(32,:)+theta_ooia_122(31,:))./2)',...
    ((salt_ooia_122(32,:)+salt_ooia_122(31,:))./2)',...
    ((theta_ooib_122(32,:)+theta_ooib_122(31,:))./2)',...
    ((salt_ooib_122(32,:)+salt_ooib_122(31,:))./2)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_130m MITgcm12_OOI_CTD_130m str_exp
%%

%%
MITgcm12_OOI_CTD_180m = [time',theta_ooia_122(38,:)',salt_ooia_122(38,:)',...
    theta_ooib_122(38,:)',salt_ooib_122(38,:)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_180m MITgcm12_OOI_CTD_180m str_exp
%%

%%
MITgcm12_OOI_CTD_250m = [time',theta_ooia_122(45,:)',salt_ooia_122(45,:)',...
    theta_ooib_122(45,:)',salt_ooib_122(45,:)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_250m MITgcm12_OOI_CTD_250m str_exp
%%

%%
MITgcm12_OOI_CTD_350m = [time',theta_ooia_122(53,:)',salt_ooia_122(53,:)',...
    theta_ooib_122(53,:)',salt_ooib_122(53,:)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_350m MITgcm12_OOI_CTD_350m str_exp
%%

%%
MITgcm12_OOI_CTD_500m = [time',theta_ooia_122(60,:)',salt_ooia_122(60,:)',...
    theta_ooib_122(60,:)',salt_ooib_122(60,:)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_500m MITgcm12_OOI_CTD_500m str_exp
%%

%%
MITgcm12_OOI_CTD_750m = [time',theta_ooia_122(67,:)',salt_ooia_122(67,:)',...
    theta_ooib_122(67,:)',salt_ooib_122(67,:)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_750m MITgcm12_OOI_CTD_750m str_exp
%%

%%
MITgcm12_OOI_CTD_1000m = [time',theta_ooia_122(72,:)',salt_ooia_122(72,:)',...
    theta_ooib_122(72,:)',salt_ooib_122(72,:)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_1000m MITgcm12_OOI_CTD_1000m str_exp
%%

%%
MITgcm12_OOI_CTD_1500m = [time',theta_ooia_122(79,:)',salt_ooia_122(79,:)',...
    theta_ooib_122(79,:)',salt_ooib_122(79,:)'];

save MITgcm_OOI_equiv/MITgcm12_OOI_CTD_1500m MITgcm12_OOI_CTD_1500m str_exp
%%


toc()