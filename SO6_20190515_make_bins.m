
%% 64

tfield64 = 1;
sfield64 = 2;
wfield64 = 3;
tffield64 = 1;
sffield64 = 2;
cfield64 = 3;
ofield64 = 4;
efield64 = 1;
mfield64 = 4;
dfield64 = 1;
afield64 = 2;
agfield64 = 10;

THETA_Series64 = zeros(384,260,7);
THETA105_Series64 = zeros(384,260,7);
THETA200_Series64 = zeros(384,260,7);
THETA300_Series64 = zeros(384,260,7);
SALT_Series64 = zeros(384,260,7);
SALT105_Series64 = zeros(384,260,7);
SALT200_Series64 = zeros(384,260,7);
SALT300_Series64 = zeros(384,260,7);
AGE_Series64 = zeros(384,260,7);
AGE200_Series64 = zeros(384,260,7);
AGE500_Series64 = zeros(384,260,7);
AGE1000_Series64 = zeros(384,260,7);
AGE2000_Series64 = zeros(384,260,7);
WVEL100_Series64 = zeros(384,260,213);
WVEL190_Series64 = zeros(384,260,213);
WVEL290_Series64 = zeros(384,260,213);
DIC_Series64 = zeros(384,260,7);
ALK_Series64 = zeros(384,260,7);
TFLUX_Series64 = zeros(384,260,7);
SFLUX_Series64 = zeros(384,260,7);
CFLUX_Series64 = zeros(384,260,7);
OFLUX_Series64 = zeros(384,260,7);
ETAN_Series64 = zeros(384,260,213);
MLD_Series64 = zeros(384,260,213);

HC = rdmds('../MITgcm/verification/SO6_20190515/run/hFacC');
depth64 = 1;
str = '../MITgcm/verification/SO6_20190515/diag/';

for ii=1:1
    char64state = [str,'diag_vel.00000000',num2str(72*ii)];
    temp64state = rdmds(char64state);
    WVEL100_Series64(:,:,ii) = temp64state(:,:,2,wfield64);
    WVEL190_Series64(:,:,ii) = temp64state(:,:,3,wfield64);
    WVEL290_Series64(:,:,ii) = temp64state(:,:,4,wfield64);
    clear temp64state
    char64surf = [str,'diag_surf.00000000',num2str(72*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series64(:,:,ii) = temp64surf(:,:,efield64); 
    MLD_Series64(:,:,ii) = temp64surf(:,:,mfield64);
    clear temp64surf
end

for ii=2:13
    char64state = [str,'diag_vel.0000000',num2str(72*ii)];
    temp64state = rdmds(char64state);
    WVEL100_Series64(:,:,ii) = temp64state(:,:,2,wfield64);
    WVEL190_Series64(:,:,ii) = temp64state(:,:,3,wfield64);
    WVEL290_Series64(:,:,ii) = temp64state(:,:,4,wfield64);
    clear temp64state
    char64surf = [str,'diag_surf.0000000',num2str(72*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series64(:,:,ii) = temp64surf(:,:,efield64); 
    MLD_Series64(:,:,ii) = temp64surf(:,:,mfield64);
    clear temp64surf
end

for ii=14:138
    char64state = [str,'diag_vel.000000',num2str(72*ii)];
    temp64state = rdmds(char64state);
    WVEL100_Series64(:,:,ii) = temp64state(:,:,2,wfield64);
    WVEL190_Series64(:,:,ii) = temp64state(:,:,3,wfield64);
    WVEL290_Series64(:,:,ii) = temp64state(:,:,4,wfield64);
    clear temp64state
    char64surf = [str,'diag_surf.000000',num2str(72*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series64(:,:,ii) = temp64surf(:,:,efield64); 
    MLD_Series64(:,:,ii) = temp64surf(:,:,mfield64);
    clear temp64surf
end

for ii=139:213
    char64state = [str,'diag_vel.00000',num2str(72*ii)];
    temp64state = rdmds(char64state);
    WVEL100_Series64(:,:,ii) = temp64state(:,:,2,wfield64);
    WVEL190_Series64(:,:,ii) = temp64state(:,:,3,wfield64);
    WVEL290_Series64(:,:,ii) = temp64state(:,:,4,wfield64);
    clear temp64state
    char64surf = [str,'diag_surf.00000',num2str(72*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series64(:,:,ii) = temp64surf(:,:,efield64); 
    MLD_Series64(:,:,ii) = temp64surf(:,:,mfield64);
    clear temp64surf
end

for ii=1:4
    char64state = [str,'diag_state.000000',num2str(2190*ii)];
    temp64state = rdmds(char64state);
    THETA_Series64(:,:,ii) = temp64state(:,:,depth64,tfield64);
    SALT_Series64(:,:,ii) = temp64state(:,:,depth64,sfield64);
    THETA105_Series64(:,:,ii) = temp64state(:,:,13,tfield64);
    SALT105_Series64(:,:,ii) = temp64state(:,:,13,sfield64);
    THETA200_Series64(:,:,ii) = temp64state(:,:,20,tfield64);
    SALT200_Series64(:,:,ii) = temp64state(:,:,20,sfield64);
    THETA300_Series64(:,:,ii) = temp64state(:,:,25,tfield64);
    SALT300_Series64(:,:,ii) = temp64state(:,:,25,sfield64);
    clear temp64state
    char64airsea = [str,'diag_airsea.000000',num2str(2190*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series64(:,:,ii) = temp64airsea(:,:,tffield64);
    SFLUX_Series64(:,:,ii) = temp64airsea(:,:,sffield64);
    CFLUX_Series64(:,:,ii) = temp64airsea(:,:,cfield64);
    OFLUX_Series64(:,:,ii) = temp64airsea(:,:,ofield64);
    clear temp64airsea
    char64bgc = [str,'diag_bgc.000000',num2str(2190*ii)];
    temp64bgc = rdmds(char64bgc); 
    DIC_Series64(:,:,ii) = temp64bgc(:,:,1,dfield64);
    ALK_Series64(:,:,ii) = temp64bgc(:,:,1,afield64);
    AGE_Series64(:,:,ii) = temp64bgc(:,:,depth64,agfield64);
    AGE200_Series64(:,:,ii) = temp64bgc(:,:,20,agfield64);
    AGE500_Series64(:,:,ii) = temp64bgc(:,:,30,agfield64);
    AGE1000_Series64(:,:,ii) = temp64bgc(:,:,36,agfield64);
    AGE2000_Series64(:,:,ii) = temp64bgc(:,:,42,agfield64);
    clear temp64bgc
end

for ii=5:7
    char64state = [str,'diag_state.00000',num2str(2190*ii)];
    temp64state = rdmds(char64state);
    THETA_Series64(:,:,ii) = temp64state(:,:,depth64,tfield64);
    SALT_Series64(:,:,ii) = temp64state(:,:,depth64,sfield64);
    THETA105_Series64(:,:,ii) = temp64state(:,:,13,tfield64);
    SALT105_Series64(:,:,ii) = temp64state(:,:,13,sfield64);
    THETA200_Series64(:,:,ii) = temp64state(:,:,20,tfield64);
    SALT200_Series64(:,:,ii) = temp64state(:,:,20,sfield64);
    THETA300_Series64(:,:,ii) = temp64state(:,:,25,tfield64);
    SALT300_Series64(:,:,ii) = temp64state(:,:,25,sfield64);
    clear temp64state
    char64airsea = [str,'diag_airsea.00000',num2str(2190*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series64(:,:,ii) = temp64airsea(:,:,tffield64);
    SFLUX_Series64(:,:,ii) = temp64airsea(:,:,sffield64);
    CFLUX_Series64(:,:,ii) = temp64airsea(:,:,cfield64);
    OFLUX_Series64(:,:,ii) = temp64airsea(:,:,ofield64);
    clear temp64airsea
    char64bgc = [str,'diag_bgc.00000',num2str(2190*ii)];
    temp64bgc = rdmds(char64bgc); 
    DIC_Series64(:,:,ii) = temp64bgc(:,:,1,dfield64);
    ALK_Series64(:,:,ii) = temp64bgc(:,:,1,afield64);
    AGE_Series64(:,:,ii) = temp64bgc(:,:,depth64,agfield64);
    AGE200_Series64(:,:,ii) = temp64bgc(:,:,20,agfield64);
    AGE500_Series64(:,:,ii) = temp64bgc(:,:,30,agfield64);
    AGE1000_Series64(:,:,ii) = temp64bgc(:,:,36,agfield64);
    AGE2000_Series64(:,:,ii) = temp64bgc(:,:,42,agfield64);
    clear temp64bgc
end

THETA_64_JJA_avg = mean(THETA_Series64(:,:,1:3),3);
SALT_64_JJA_avg = mean(SALT_Series64(:,:,1:3),3);
THETA105_64_JJA_avg = mean(THETA105_Series64(:,:,1:3),3);
SALT105_64_JJA_avg = mean(SALT105_Series64(:,:,1:3),3);
THETA200_64_JJA_avg = mean(THETA200_Series64(:,:,1:3),3);
SALT200_64_JJA_avg = mean(SALT200_Series64(:,:,1:3),3);
THETA300_64_JJA_avg = mean(THETA300_Series64(:,:,1:3),3);
SALT300_64_JJA_avg = mean(SALT300_Series64(:,:,1:3),3);
AGE_64_JJA_avg = mean(AGE_Series64(:,:,1:3),3);
AGE200_64_JJA_avg = mean(AGE200_Series64(:,:,1:3),3);
AGE500_64_JJA_avg = mean(AGE500_Series64(:,:,1:3),3);
AGE1000_64_JJA_avg = mean(AGE1000_Series64(:,:,1:3),3);
AGE2000_64_JJA_avg = mean(AGE2000_Series64(:,:,1:3),3);
WVEL100_64_JJA_avg = mean(WVEL100_Series64(:,:,1:91),3);
WVEL100_64_JJA_std = std(WVEL100_Series64(:,:,1:91),0,3);
WVEL190_64_JJA_avg = mean(WVEL190_Series64(:,:,1:91),3);
WVEL190_64_JJA_std = std(WVEL190_Series64(:,:,1:91),0,3);
WVEL290_64_JJA_avg = mean(WVEL290_Series64(:,:,1:91),3);
WVEL290_64_JJA_std = std(WVEL290_Series64(:,:,1:91),0,3);
TFLUX_64_JJA_avg = mean(TFLUX_Series64(:,:,1:3),3);
SFLUX_64_JJA_avg = mean(SFLUX_Series64(:,:,1:3),3);
ETAN_64_JJA_avg = mean(ETAN_Series64(:,:,1:91),3);
ETAN_64_JJA_std = std(ETAN_Series64(:,:,1:91),0,3);
CFLUX_64_JJA_avg = mean(CFLUX_Series64(:,:,1:3),3);
OFLUX_64_JJA_avg = mean(OFLUX_Series64(:,:,1:3),3);
MLD_64_JJA_avg = mean(MLD_Series64(:,:,1:91),3);
MLD_64_JJA_std = std(MLD_Series64(:,:,1:91),0,3);
DIC_64_JJA_avg = mean(DIC_Series64(:,:,1:3),3);
ALK_64_JJA_avg = mean(ALK_Series64(:,:,1:3),3);

THETA_64_JAS_avg = mean(THETA_Series64(:,:,2:4),3);
SALT_64_JAS_avg = mean(SALT_Series64(:,:,2:4),3);
THETA105_64_JAS_avg = mean(THETA105_Series64(:,:,2:4),3);
SALT105_64_JAS_avg = mean(SALT105_Series64(:,:,2:4),3);
THETA200_64_JAS_avg = mean(THETA200_Series64(:,:,2:4),3);
SALT200_64_JAS_avg = mean(SALT200_Series64(:,:,2:4),3);
THETA300_64_JAS_avg = mean(THETA300_Series64(:,:,2:4),3);
SALT300_64_JAS_avg = mean(SALT300_Series64(:,:,2:4),3);
AGE_64_JAS_avg = mean(AGE_Series64(:,:,2:4),3);
AGE200_64_JAS_avg = mean(AGE200_Series64(:,:,2:4),3);
AGE500_64_JAS_avg = mean(AGE500_Series64(:,:,2:4),3);
AGE1000_64_JAS_avg = mean(AGE1000_Series64(:,:,2:4),3);
AGE2000_64_JAS_avg = mean(AGE2000_Series64(:,:,2:4),3);
WVEL100_64_JAS_avg = mean(WVEL100_Series64(:,:,32:122),3);
WVEL100_64_JAS_std = std(WVEL100_Series64(:,:,32:122),0,3);
WVEL190_64_JAS_avg = mean(WVEL190_Series64(:,:,32:122),3);
WVEL190_64_JAS_std = std(WVEL190_Series64(:,:,32:122),0,3);
WVEL290_64_JAS_avg = mean(WVEL290_Series64(:,:,32:122),3);
WVEL290_64_JAS_std = std(WVEL290_Series64(:,:,32:122),0,3);
TFLUX_64_JAS_avg = mean(TFLUX_Series64(:,:,2:4),3);
SFLUX_64_JAS_avg = mean(SFLUX_Series64(:,:,2:4),3);
ETAN_64_JAS_avg = mean(ETAN_Series64(:,:,32:122),3);
ETAN_64_JAS_std = std(ETAN_Series64(:,:,32:122),0,3);
CFLUX_64_JAS_avg = mean(CFLUX_Series64(:,:,2:4),3);
OFLUX_64_JAS_avg = mean(OFLUX_Series64(:,:,2:4),3);
MLD_64_JAS_avg = mean(MLD_Series64(:,:,32:122),3);
MLD_64_JAS_std = std(MLD_Series64(:,:,32:122),0,3);
DIC_64_JAS_avg = mean(DIC_Series64(:,:,2:4),3);
ALK_64_JAS_avg = mean(ALK_Series64(:,:,2:4),3);

THETA_64_JJASON_avg = mean(THETA_Series64(:,:,1:6),3);
SALT_64_JJASON_avg = mean(SALT_Series64(:,:,1:6),3);
THETA105_64_JJASON_avg = mean(THETA105_Series64(:,:,1:6),3);
SALT105_64_JJASON_avg = mean(SALT105_Series64(:,:,1:6),3);
THETA200_64_JJASON_avg = mean(THETA200_Series64(:,:,1:6),3);
SALT200_64_JJASON_avg = mean(SALT200_Series64(:,:,1:6),3);
THETA300_64_JJASON_avg = mean(THETA300_Series64(:,:,1:6),3);
SALT300_64_JJASON_avg = mean(SALT300_Series64(:,:,1:6),3);
AGE_64_JJASON_avg = mean(AGE_Series64(:,:,1:6),3);
AGE200_64_JJASON_avg = mean(AGE200_Series64(:,:,1:6),3);
AGE500_64_JJASON_avg = mean(AGE500_Series64(:,:,1:6),3);
AGE1000_64_JJASON_avg = mean(AGE1000_Series64(:,:,1:6),3);
AGE2000_64_JJASON_avg = mean(AGE2000_Series64(:,:,1:6),3);
WVEL100_64_JJASON_avg = mean(WVEL100_Series64(:,:,1:182),3);
WVEL100_64_JJASON_std = std(WVEL100_Series64(:,:,1:182),0,3);
WVEL190_64_JJASON_avg = mean(WVEL190_Series64(:,:,1:182),3);
WVEL190_64_JJASON_std = std(WVEL190_Series64(:,:,1:182),0,3);
WVEL290_64_JJASON_avg = mean(WVEL290_Series64(:,:,1:182),3);
WVEL290_64_JJASON_std = std(WVEL290_Series64(:,:,1:182),0,3);
TFLUX_64_JJASON_avg = mean(TFLUX_Series64(:,:,1:6),3);
SFLUX_64_JJASON_avg = mean(SFLUX_Series64(:,:,1:6),3);
ETAN_64_JJASON_avg = mean(ETAN_Series64(:,:,1:182),3);
ETAN_64_JJASON_std = std(ETAN_Series64(:,:,1:182),0,3);
CFLUX_64_JJASON_avg = mean(CFLUX_Series64(:,:,1:6),3);
OFLUX_64_JJASON_avg = mean(OFLUX_Series64(:,:,1:6),3);
MLD_64_JJASON_avg = mean(MLD_Series64(:,:,1:182),3);
MLD_64_JJASON_std = std(MLD_Series64(:,:,1:182),0,3);
DIC_64_JJASON_avg = mean(DIC_Series64(:,:,1:6),3);
ALK_64_JJASON_avg = mean(ALK_Series64(:,:,1:6),3);

THETA_64_JASOND_avg = mean(THETA_Series64(:,:,2:7),3);
SALT_64_JASOND_avg = mean(SALT_Series64(:,:,2:7),3);
THETA105_64_JASOND_avg = mean(THETA105_Series64(:,:,2:7),3);
SALT105_64_JASOND_avg = mean(SALT105_Series64(:,:,2:7),3);
THETA200_64_JASOND_avg = mean(THETA200_Series64(:,:,2:7),3);
SALT200_64_JASOND_avg = mean(SALT200_Series64(:,:,2:7),3);
THETA300_64_JASOND_avg = mean(THETA300_Series64(:,:,2:7),3);
SALT300_64_JASOND_avg = mean(SALT300_Series64(:,:,2:7),3);
AGE_64_JASOND_avg = mean(AGE_Series64(:,:,2:7),3);
AGE200_64_JASOND_avg = mean(AGE200_Series64(:,:,2:7),3);
AGE500_64_JASOND_avg = mean(AGE500_Series64(:,:,2:7),3);
AGE1000_64_JASOND_avg = mean(AGE1000_Series64(:,:,2:7),3);
AGE2000_64_JASOND_avg = mean(AGE2000_Series64(:,:,2:7),3);
WVEL100_64_JASOND_avg = mean(WVEL100_Series64(:,:,32:213),3);
WVEL100_64_JASOND_std = std(WVEL100_Series64(:,:,32:213),0,3);
WVEL190_64_JASOND_avg = mean(WVEL190_Series64(:,:,32:213),3);
WVEL190_64_JASOND_std = std(WVEL190_Series64(:,:,32:213),0,3);
WVEL290_64_JASOND_avg = mean(WVEL290_Series64(:,:,32:213),3);
WVEL290_64_JASOND_std = std(WVEL290_Series64(:,:,32:213),0,3);
TFLUX_64_JASOND_avg = mean(TFLUX_Series64(:,:,2:7),3);
SFLUX_64_JASOND_avg = mean(SFLUX_Series64(:,:,2:7),3);
ETAN_64_JASOND_avg = mean(ETAN_Series64(:,:,32:213),3);
ETAN_64_JASOND_std = std(ETAN_Series64(:,:,32:213),0,3);
CFLUX_64_JASOND_avg = mean(CFLUX_Series64(:,:,2:7),3);
OFLUX_64_JASOND_avg = mean(OFLUX_Series64(:,:,2:7),3);
MLD_64_JASOND_avg = mean(MLD_Series64(:,:,32:213),3);
MLD_64_JASOND_std = std(MLD_Series64(:,:,32:213),0,3);
DIC_64_JASOND_avg = mean(DIC_Series64(:,:,2:7),3);
ALK_64_JASOND_avg = mean(ALK_Series64(:,:,2:7),3);



[m64,n64] = size(THETA_64_JJA_avg);

parfor ii=1:m64
    for jj=1:n64
        if (HC(ii,jj,1)==0)
            THETA_64_JJA_avg(ii,jj) = 99999999999;
            SALT_64_JJA_avg(ii,jj) = 99999999999;
            AGE_64_JJA_avg(ii,jj) = 99999999999;
            TFLUX_64_JJA_avg(ii,jj) = 99999999999;
            SFLUX_64_JJA_avg(ii,jj) = 99999999999;
            ETAN_64_JJA_avg(ii,jj) = 99999999999;
            ETAN_64_JJA_std(ii,jj) = 99999999999;
            CFLUX_64_JJA_avg(ii,jj) = 99999999999;
            OFLUX_64_JJA_avg(ii,jj) = 99999999999;
            MLD_64_JJA_avg(ii,jj) = 99999999999;
            MLD_64_JJA_std(ii,jj) = 99999999999;
            DIC_64_JJA_avg(ii,jj) = 99999999999;
            ALK_64_JJA_avg(ii,jj) = 99999999999;
            THETA_64_JAS_avg(ii,jj) = 99999999999;
            SALT_64_JAS_avg(ii,jj) = 99999999999;
            AGE_64_JAS_avg(ii,jj) = 99999999999;
            TFLUX_64_JAS_avg(ii,jj) = 99999999999;
            SFLUX_64_JAS_avg(ii,jj) = 99999999999;
            ETAN_64_JAS_avg(ii,jj) = 99999999999;
            ETAN_64_JAS_std(ii,jj) = 99999999999;
            CFLUX_64_JAS_avg(ii,jj) = 99999999999;
            OFLUX_64_JAS_avg(ii,jj) = 99999999999;
            MLD_64_JAS_avg(ii,jj) = 99999999999;
            MLD_64_JAS_std(ii,jj) = 99999999999;
            DIC_64_JAS_avg(ii,jj) = 99999999999;
            ALK_64_JAS_avg(ii,jj) = 99999999999;
            THETA_64_JJASON_avg(ii,jj) = 99999999999;
            SALT_64_JJASON_avg(ii,jj) = 99999999999;
            AGE_64_JJASON_avg(ii,jj) = 99999999999;
            TFLUX_64_JJASON_avg(ii,jj) = 99999999999;
            SFLUX_64_JJASON_avg(ii,jj) = 99999999999;
            ETAN_64_JJASON_avg(ii,jj) = 99999999999;
            ETAN_64_JJASON_std(ii,jj) = 99999999999;
            CFLUX_64_JJASON_avg(ii,jj) = 99999999999;
            OFLUX_64_JJASON_avg(ii,jj) = 99999999999;
            MLD_64_JJASON_avg(ii,jj) = 99999999999;
            MLD_64_JJASON_std(ii,jj) = 99999999999;
            DIC_64_JJASON_avg(ii,jj) = 99999999999;
            ALK_64_JJASON_avg(ii,jj) = 99999999999;
            THETA_64_JASOND_avg(ii,jj) = 99999999999;
            SALT_64_JASOND_avg(ii,jj) = 99999999999;
            AGE_64_JASOND_avg(ii,jj) = 99999999999;
            TFLUX_64_JASOND_avg(ii,jj) = 99999999999;
            SFLUX_64_JASOND_avg(ii,jj) = 99999999999;
            ETAN_64_JASOND_avg(ii,jj) = 99999999999;
            ETAN_64_JASOND_std(ii,jj) = 99999999999;
            CFLUX_64_JASOND_avg(ii,jj) = 99999999999;
            OFLUX_64_JASOND_avg(ii,jj) = 99999999999;
            MLD_64_JASOND_avg(ii,jj) = 99999999999;
            MLD_64_JASOND_std(ii,jj) = 99999999999;
            DIC_64_JASOND_avg(ii,jj) = 99999999999;
            ALK_64_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,13)==0)
            THETA105_64_JJA_avg(ii,jj) = 99999999999;
            SALT105_64_JJA_avg(ii,jj) = 99999999999;
            WVEL100_64_JJA_avg(ii,jj) = 99999999999;
            WVEL100_64_JJA_std(ii,jj) = 99999999999;
            THETA105_64_JAS_avg(ii,jj) = 99999999999;
            SALT105_64_JAS_avg(ii,jj) = 99999999999;
            WVEL100_64_JAS_avg(ii,jj) = 99999999999;
            WVEL100_64_JAS_std(ii,jj) = 99999999999;
            THETA105_64_JJASON_avg(ii,jj) = 99999999999;
            SALT105_64_JJASON_avg(ii,jj) = 99999999999;
            WVEL100_64_JJASON_avg(ii,jj) = 99999999999;
            WVEL100_64_JJASON_std(ii,jj) = 99999999999;
            THETA105_64_JASOND_avg(ii,jj) = 99999999999;
            SALT105_64_JASOND_avg(ii,jj) = 99999999999;
            WVEL100_64_JASOND_avg(ii,jj) = 99999999999;
            WVEL100_64_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,20)==0)
            THETA200_64_JJA_avg(ii,jj) = 99999999999;
            SALT200_64_JJA_avg(ii,jj) = 99999999999;
            AGE200_64_JJA_avg(ii,jj) = 99999999999;
            WVEL190_64_JJA_avg(ii,jj) = 99999999999;
            WVEL190_64_JJA_std(ii,jj) = 99999999999;
            THETA200_64_JAS_avg(ii,jj) = 99999999999;
            SALT200_64_JAS_avg(ii,jj) = 99999999999;
            AGE200_64_JAS_avg(ii,jj) = 99999999999;
            WVEL190_64_JAS_avg(ii,jj) = 99999999999;
            WVEL190_64_JAS_std(ii,jj) = 99999999999;
            THETA200_64_JJASON_avg(ii,jj) = 99999999999;
            SALT200_64_JJASON_avg(ii,jj) = 99999999999;
            AGE200_64_JJASON_avg(ii,jj) = 99999999999;
            WVEL190_64_JJASON_avg(ii,jj) = 99999999999;
            WVEL190_64_JJASON_std(ii,jj) = 99999999999;
            THETA200_64_JASOND_avg(ii,jj) = 99999999999;
            SALT200_64_JASOND_avg(ii,jj) = 99999999999;
            AGE200_64_JASOND_avg(ii,jj) = 99999999999;
            WVEL190_64_JASOND_avg(ii,jj) = 99999999999;
            WVEL190_64_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,25)==0)
            THETA300_64_JJA_avg(ii,jj) = 99999999999;
            SALT300_64_JJA_avg(ii,jj) = 99999999999;
            WVEL290_64_JJA_avg(ii,jj) = 99999999999;
            WVEL290_64_JJA_std(ii,jj) = 99999999999;
            THETA300_64_JAS_avg(ii,jj) = 99999999999;
            SALT300_64_JAS_avg(ii,jj) = 99999999999;
            WVEL290_64_JAS_avg(ii,jj) = 99999999999;
            WVEL290_64_JAS_std(ii,jj) = 99999999999;
            THETA300_64_JJASON_avg(ii,jj) = 99999999999;
            SALT300_64_JJASON_avg(ii,jj) = 99999999999;
            WVEL290_64_JJASON_avg(ii,jj) = 99999999999;
            WVEL290_64_JJASON_std(ii,jj) = 99999999999;
            THETA300_64_JASOND_avg(ii,jj) = 99999999999;
            SALT300_64_JASOND_avg(ii,jj) = 99999999999;
            WVEL290_64_JASOND_avg(ii,jj) = 99999999999;
            WVEL290_64_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,30)==0)
            AGE500_64_JJA_avg(ii,jj) = 99999999999;
            AGE500_64_JAS_avg(ii,jj) = 99999999999;
            AGE500_64_JJASON_avg(ii,jj) = 99999999999;
            AGE500_64_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,36)==0)
            AGE1000_64_JJA_avg(ii,jj) = 99999999999;
            AGE1000_64_JAS_avg(ii,jj) = 99999999999;
            AGE1000_64_JJASON_avg(ii,jj) = 99999999999;
            AGE1000_64_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,42)==0)
            AGE2000_64_JJA_avg(ii,jj) = 99999999999;
            AGE2000_64_JAS_avg(ii,jj) = 99999999999;
            AGE2000_64_JJASON_avg(ii,jj) = 99999999999;
            AGE2000_64_JASOND_avg(ii,jj) = 99999999999;
        end
    end
end


clear char64* temp64* *Series64 n64 m64 *field64 ii
save AB64_output

fprintf('finished 64 \n')

%% end 64


