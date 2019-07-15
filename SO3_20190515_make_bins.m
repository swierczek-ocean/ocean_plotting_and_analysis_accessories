
%% 34

tfield34 = 1;
sfield34 = 2;
wfield34 = 3;
tffield34 = 1;
sffield34 = 2;
cfield34 = 3;
ofield34 = 4;
efield34 = 1;
mfield34 = 4;
dfield34 = 1;
afield34 = 2;
agfield34 = 9;

THETA_Series34 = zeros(192,132,7);
THETA105_Series34 = zeros(192,132,7);
THETA200_Series34 = zeros(192,132,7);
THETA300_Series34 = zeros(192,132,7);
SALT_Series34 = zeros(192,132,7);
SALT105_Series34 = zeros(192,132,7);
SALT200_Series34 = zeros(192,132,7);
SALT300_Series34 = zeros(192,132,7);
AGE_Series34 = zeros(192,132,7);
AGE200_Series34 = zeros(192,132,7);
AGE500_Series34 = zeros(192,132,7);
AGE1000_Series34 = zeros(192,132,7);
AGE2000_Series34 = zeros(192,132,7);
WVEL100_Series34 = zeros(192,132,213);
WVEL190_Series34 = zeros(192,132,213);
WVEL290_Series34 = zeros(192,132,213);
DIC_Series34 = zeros(192,132,7);
ALK_Series34 = zeros(192,132,7);
TFLUX_Series34 = zeros(192,132,7);
SFLUX_Series34 = zeros(192,132,7);
CFLUX_Series34 = zeros(192,132,7);
OFLUX_Series34 = zeros(192,132,7);
ETAN_Series34 = zeros(192,132,213);
MLD_Series34 = zeros(192,132,213);

HC = rdmds('../MITgcm/verification/SO3_20190515/run/hFacC');
depth34 = 1;
str = '../MITgcm/verification/SO3_20190515/diag/';

for ii=1:2
    char34state = [str,'diag_vel.00000000',num2str(48*ii)];
    temp34state = rdmds(char34state);
    WVEL100_Series34(:,:,ii) = temp34state(:,:,2,wfield34);
    WVEL190_Series34(:,:,ii) = temp34state(:,:,3,wfield34);
    WVEL290_Series34(:,:,ii) = temp34state(:,:,4,wfield34);
    clear temp34state
    char34surf = [str,'diag_surf.00000000',num2str(48*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series34(:,:,ii) = temp34surf(:,:,efield34); 
    MLD_Series34(:,:,ii) = temp34surf(:,:,mfield34);
    clear temp34surf
end

for ii=3:20
    char34state = [str,'diag_vel.0000000',num2str(48*ii)];
    temp34state = rdmds(char34state);
    WVEL100_Series34(:,:,ii) = temp34state(:,:,2,wfield34);
    WVEL190_Series34(:,:,ii) = temp34state(:,:,3,wfield34);
    WVEL290_Series34(:,:,ii) = temp34state(:,:,4,wfield34);
    clear temp34state
    char34surf = [str,'diag_surf.0000000',num2str(48*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series34(:,:,ii) = temp34surf(:,:,efield34); 
    MLD_Series34(:,:,ii) = temp34surf(:,:,mfield34);
    clear temp34surf
end

for ii=21:208
    char34state = [str,'diag_vel.000000',num2str(48*ii)];
    temp34state = rdmds(char34state);
    WVEL100_Series34(:,:,ii) = temp34state(:,:,2,wfield34);
    WVEL190_Series34(:,:,ii) = temp34state(:,:,3,wfield34);
    WVEL290_Series34(:,:,ii) = temp34state(:,:,4,wfield34);
    clear temp34state
    char34surf = [str,'diag_surf.000000',num2str(48*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series34(:,:,ii) = temp34surf(:,:,efield34); 
    MLD_Series34(:,:,ii) = temp34surf(:,:,mfield34);
    clear temp34surf
end

for ii=209:213
    char34state = [str,'diag_vel.00000',num2str(48*ii)];
    temp34state = rdmds(char34state);
    WVEL100_Series34(:,:,ii) = temp34state(:,:,2,wfield34);
    WVEL190_Series34(:,:,ii) = temp34state(:,:,3,wfield34);
    WVEL290_Series34(:,:,ii) = temp34state(:,:,4,wfield34);
    clear temp34state
    char34surf = [str,'diag_surf.00000',num2str(48*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series34(:,:,ii) = temp34surf(:,:,efield34); 
    MLD_Series34(:,:,ii) = temp34surf(:,:,mfield34);
    clear temp34surf
end

for ii=1:6
    char34state = [str,'diag_state.000000',num2str(1460*ii)];
    temp34state = rdmds(char34state);
    THETA_Series34(:,:,ii) = temp34state(:,:,depth34,tfield34);
    SALT_Series34(:,:,ii) = temp34state(:,:,depth34,sfield34);
    THETA105_Series34(:,:,ii) = temp34state(:,:,13,tfield34);
    SALT105_Series34(:,:,ii) = temp34state(:,:,13,sfield34);
    THETA200_Series34(:,:,ii) = temp34state(:,:,20,tfield34);
    SALT200_Series34(:,:,ii) = temp34state(:,:,20,sfield34);
    THETA300_Series34(:,:,ii) = temp34state(:,:,25,tfield34);
    SALT300_Series34(:,:,ii) = temp34state(:,:,25,sfield34);
    clear temp34state
    char34airsea = [str,'diag_airsea.000000',num2str(1460*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series34(:,:,ii) = temp34airsea(:,:,tffield34);
    SFLUX_Series34(:,:,ii) = temp34airsea(:,:,sffield34);
    CFLUX_Series34(:,:,ii) = temp34airsea(:,:,cfield34);
    OFLUX_Series34(:,:,ii) = temp34airsea(:,:,ofield34);
    clear temp34airsea
    char34bgc = [str,'diag_bgc.000000',num2str(1460*ii)];
    temp34bgc = rdmds(char34bgc); 
    DIC_Series34(:,:,ii) = temp34bgc(:,:,1,dfield34);
    ALK_Series34(:,:,ii) = temp34bgc(:,:,1,afield34);
    AGE_Series34(:,:,ii) = temp34bgc(:,:,depth34,agfield34);
    AGE200_Series34(:,:,ii) = temp34bgc(:,:,20,agfield34);
    AGE500_Series34(:,:,ii) = temp34bgc(:,:,30,agfield34);
    AGE1000_Series34(:,:,ii) = temp34bgc(:,:,36,agfield34);
    AGE2000_Series34(:,:,ii) = temp34bgc(:,:,42,agfield34);
    clear temp34bgc
end

for ii=7:7
    char34state = [str,'diag_state.00000',num2str(1460*ii)];
    temp34state = rdmds(char34state);
    THETA_Series34(:,:,ii) = temp34state(:,:,depth34,tfield34);
    SALT_Series34(:,:,ii) = temp34state(:,:,depth34,sfield34);
    THETA105_Series34(:,:,ii) = temp34state(:,:,13,tfield34);
    SALT105_Series34(:,:,ii) = temp34state(:,:,13,sfield34);
    THETA200_Series34(:,:,ii) = temp34state(:,:,20,tfield34);
    SALT200_Series34(:,:,ii) = temp34state(:,:,20,sfield34);
    THETA300_Series34(:,:,ii) = temp34state(:,:,25,tfield34);
    SALT300_Series34(:,:,ii) = temp34state(:,:,25,sfield34);
    clear temp34state
    char34airsea = [str,'diag_airsea.00000',num2str(1460*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series34(:,:,ii) = temp34airsea(:,:,tffield34);
    SFLUX_Series34(:,:,ii) = temp34airsea(:,:,sffield34);
    CFLUX_Series34(:,:,ii) = temp34airsea(:,:,cfield34);
    OFLUX_Series34(:,:,ii) = temp34airsea(:,:,ofield34);
    clear temp34airsea
    char34bgc = [str,'diag_bgc.00000',num2str(1460*ii)];
    temp34bgc = rdmds(char34bgc); 
    DIC_Series34(:,:,ii) = temp34bgc(:,:,1,dfield34);
    ALK_Series34(:,:,ii) = temp34bgc(:,:,1,afield34);
    AGE_Series34(:,:,ii) = temp34bgc(:,:,depth34,agfield34);
    AGE200_Series34(:,:,ii) = temp34bgc(:,:,20,agfield34);
    AGE500_Series34(:,:,ii) = temp34bgc(:,:,30,agfield34);
    AGE1000_Series34(:,:,ii) = temp34bgc(:,:,36,agfield34);
    AGE2000_Series34(:,:,ii) = temp34bgc(:,:,42,agfield34);
    clear temp34bgc
end

THETA_34_JJA_avg = mean(THETA_Series34(:,:,1:3),3);
SALT_34_JJA_avg = mean(SALT_Series34(:,:,1:3),3);
THETA105_34_JJA_avg = mean(THETA105_Series34(:,:,1:3),3);
SALT105_34_JJA_avg = mean(SALT105_Series34(:,:,1:3),3);
THETA200_34_JJA_avg = mean(THETA200_Series34(:,:,1:3),3);
SALT200_34_JJA_avg = mean(SALT200_Series34(:,:,1:3),3);
THETA300_34_JJA_avg = mean(THETA300_Series34(:,:,1:3),3);
SALT300_34_JJA_avg = mean(SALT300_Series34(:,:,1:3),3);
AGE_34_JJA_avg = mean(AGE_Series34(:,:,1:3),3);
AGE200_34_JJA_avg = mean(AGE200_Series34(:,:,1:3),3);
AGE500_34_JJA_avg = mean(AGE500_Series34(:,:,1:3),3);
AGE1000_34_JJA_avg = mean(AGE1000_Series34(:,:,1:3),3);
AGE2000_34_JJA_avg = mean(AGE2000_Series34(:,:,1:3),3);
WVEL100_34_JJA_avg = mean(WVEL100_Series34(:,:,1:91),3);
WVEL100_34_JJA_std = std(WVEL100_Series34(:,:,1:91),0,3);
WVEL190_34_JJA_avg = mean(WVEL190_Series34(:,:,1:91),3);
WVEL190_34_JJA_std = std(WVEL190_Series34(:,:,1:91),0,3);
WVEL290_34_JJA_avg = mean(WVEL290_Series34(:,:,1:91),3);
WVEL290_34_JJA_std = std(WVEL290_Series34(:,:,1:91),0,3);
TFLUX_34_JJA_avg = mean(TFLUX_Series34(:,:,1:3),3);
SFLUX_34_JJA_avg = mean(SFLUX_Series34(:,:,1:3),3);
ETAN_34_JJA_avg = mean(ETAN_Series34(:,:,1:91),3);
ETAN_34_JJA_std = std(ETAN_Series34(:,:,1:91),0,3);
CFLUX_34_JJA_avg = mean(CFLUX_Series34(:,:,1:3),3);
OFLUX_34_JJA_avg = mean(OFLUX_Series34(:,:,1:3),3);
MLD_34_JJA_avg = mean(MLD_Series34(:,:,1:91),3);
MLD_34_JJA_std = std(MLD_Series34(:,:,1:91),0,3);
DIC_34_JJA_avg = mean(DIC_Series34(:,:,1:3),3);
ALK_34_JJA_avg = mean(ALK_Series34(:,:,1:3),3);

THETA_34_JAS_avg = mean(THETA_Series34(:,:,2:4),3);
SALT_34_JAS_avg = mean(SALT_Series34(:,:,2:4),3);
THETA105_34_JAS_avg = mean(THETA105_Series34(:,:,2:4),3);
SALT105_34_JAS_avg = mean(SALT105_Series34(:,:,2:4),3);
THETA200_34_JAS_avg = mean(THETA200_Series34(:,:,2:4),3);
SALT200_34_JAS_avg = mean(SALT200_Series34(:,:,2:4),3);
THETA300_34_JAS_avg = mean(THETA300_Series34(:,:,2:4),3);
SALT300_34_JAS_avg = mean(SALT300_Series34(:,:,2:4),3);
AGE_34_JAS_avg = mean(AGE_Series34(:,:,2:4),3);
AGE200_34_JAS_avg = mean(AGE200_Series34(:,:,2:4),3);
AGE500_34_JAS_avg = mean(AGE500_Series34(:,:,2:4),3);
AGE1000_34_JAS_avg = mean(AGE1000_Series34(:,:,2:4),3);
AGE2000_34_JAS_avg = mean(AGE2000_Series34(:,:,2:4),3);
WVEL100_34_JAS_avg = mean(WVEL100_Series34(:,:,32:122),3);
WVEL100_34_JAS_std = std(WVEL100_Series34(:,:,32:122),0,3);
WVEL190_34_JAS_avg = mean(WVEL190_Series34(:,:,32:122),3);
WVEL190_34_JAS_std = std(WVEL190_Series34(:,:,32:122),0,3);
WVEL290_34_JAS_avg = mean(WVEL290_Series34(:,:,32:122),3);
WVEL290_34_JAS_std = std(WVEL290_Series34(:,:,32:122),0,3);
TFLUX_34_JAS_avg = mean(TFLUX_Series34(:,:,2:4),3);
SFLUX_34_JAS_avg = mean(SFLUX_Series34(:,:,2:4),3);
ETAN_34_JAS_avg = mean(ETAN_Series34(:,:,32:122),3);
ETAN_34_JAS_std = std(ETAN_Series34(:,:,32:122),0,3);
CFLUX_34_JAS_avg = mean(CFLUX_Series34(:,:,2:4),3);
OFLUX_34_JAS_avg = mean(OFLUX_Series34(:,:,2:4),3);
MLD_34_JAS_avg = mean(MLD_Series34(:,:,32:122),3);
MLD_34_JAS_std = std(MLD_Series34(:,:,32:122),0,3);
DIC_34_JAS_avg = mean(DIC_Series34(:,:,2:4),3);
ALK_34_JAS_avg = mean(ALK_Series34(:,:,2:4),3);

THETA_34_JJASON_avg = mean(THETA_Series34(:,:,1:6),3);
SALT_34_JJASON_avg = mean(SALT_Series34(:,:,1:6),3);
THETA105_34_JJASON_avg = mean(THETA105_Series34(:,:,1:6),3);
SALT105_34_JJASON_avg = mean(SALT105_Series34(:,:,1:6),3);
THETA200_34_JJASON_avg = mean(THETA200_Series34(:,:,1:6),3);
SALT200_34_JJASON_avg = mean(SALT200_Series34(:,:,1:6),3);
THETA300_34_JJASON_avg = mean(THETA300_Series34(:,:,1:6),3);
SALT300_34_JJASON_avg = mean(SALT300_Series34(:,:,1:6),3);
AGE_34_JJASON_avg = mean(AGE_Series34(:,:,1:6),3);
AGE200_34_JJASON_avg = mean(AGE200_Series34(:,:,1:6),3);
AGE500_34_JJASON_avg = mean(AGE500_Series34(:,:,1:6),3);
AGE1000_34_JJASON_avg = mean(AGE1000_Series34(:,:,1:6),3);
AGE2000_34_JJASON_avg = mean(AGE2000_Series34(:,:,1:6),3);
WVEL100_34_JJASON_avg = mean(WVEL100_Series34(:,:,1:182),3);
WVEL100_34_JJASON_std = std(WVEL100_Series34(:,:,1:182),0,3);
WVEL190_34_JJASON_avg = mean(WVEL190_Series34(:,:,1:182),3);
WVEL190_34_JJASON_std = std(WVEL190_Series34(:,:,1:182),0,3);
WVEL290_34_JJASON_avg = mean(WVEL290_Series34(:,:,1:182),3);
WVEL290_34_JJASON_std = std(WVEL290_Series34(:,:,1:182),0,3);
TFLUX_34_JJASON_avg = mean(TFLUX_Series34(:,:,1:6),3);
SFLUX_34_JJASON_avg = mean(SFLUX_Series34(:,:,1:6),3);
ETAN_34_JJASON_avg = mean(ETAN_Series34(:,:,1:182),3);
ETAN_34_JJASON_std = std(ETAN_Series34(:,:,1:182),0,3);
CFLUX_34_JJASON_avg = mean(CFLUX_Series34(:,:,1:6),3);
OFLUX_34_JJASON_avg = mean(OFLUX_Series34(:,:,1:6),3);
MLD_34_JJASON_avg = mean(MLD_Series34(:,:,1:182),3);
MLD_34_JJASON_std = std(MLD_Series34(:,:,1:182),0,3);
DIC_34_JJASON_avg = mean(DIC_Series34(:,:,1:6),3);
ALK_34_JJASON_avg = mean(ALK_Series34(:,:,1:6),3);

THETA_34_JASOND_avg = mean(THETA_Series34(:,:,2:7),3);
SALT_34_JASOND_avg = mean(SALT_Series34(:,:,2:7),3);
THETA105_34_JASOND_avg = mean(THETA105_Series34(:,:,2:7),3);
SALT105_34_JASOND_avg = mean(SALT105_Series34(:,:,2:7),3);
THETA200_34_JASOND_avg = mean(THETA200_Series34(:,:,2:7),3);
SALT200_34_JASOND_avg = mean(SALT200_Series34(:,:,2:7),3);
THETA300_34_JASOND_avg = mean(THETA300_Series34(:,:,2:7),3);
SALT300_34_JASOND_avg = mean(SALT300_Series34(:,:,2:7),3);
AGE_34_JASOND_avg = mean(AGE_Series34(:,:,2:7),3);
AGE200_34_JASOND_avg = mean(AGE200_Series34(:,:,2:7),3);
AGE500_34_JASOND_avg = mean(AGE500_Series34(:,:,2:7),3);
AGE1000_34_JASOND_avg = mean(AGE1000_Series34(:,:,2:7),3);
AGE2000_34_JASOND_avg = mean(AGE2000_Series34(:,:,2:7),3);
WVEL100_34_JASOND_avg = mean(WVEL100_Series34(:,:,32:213),3);
WVEL100_34_JASOND_std = std(WVEL100_Series34(:,:,32:213),0,3);
WVEL190_34_JASOND_avg = mean(WVEL190_Series34(:,:,32:213),3);
WVEL190_34_JASOND_std = std(WVEL190_Series34(:,:,32:213),0,3);
WVEL290_34_JASOND_avg = mean(WVEL290_Series34(:,:,32:213),3);
WVEL290_34_JASOND_std = std(WVEL290_Series34(:,:,32:213),0,3);
TFLUX_34_JASOND_avg = mean(TFLUX_Series34(:,:,2:7),3);
SFLUX_34_JASOND_avg = mean(SFLUX_Series34(:,:,2:7),3);
ETAN_34_JASOND_avg = mean(ETAN_Series34(:,:,32:213),3);
ETAN_34_JASOND_std = std(ETAN_Series34(:,:,32:213),0,3);
CFLUX_34_JASOND_avg = mean(CFLUX_Series34(:,:,2:7),3);
OFLUX_34_JASOND_avg = mean(OFLUX_Series34(:,:,2:7),3);
MLD_34_JASOND_avg = mean(MLD_Series34(:,:,32:213),3);
MLD_34_JASOND_std = std(MLD_Series34(:,:,32:213),0,3);
DIC_34_JASOND_avg = mean(DIC_Series34(:,:,2:7),3);
ALK_34_JASOND_avg = mean(ALK_Series34(:,:,2:7),3);



[m34,n34] = size(THETA_34_JJA_avg);

parfor ii=1:m34
    for jj=1:n34
        if (HC(ii,jj,1)==0)
            THETA_34_JJA_avg(ii,jj) = 99999999999;
            SALT_34_JJA_avg(ii,jj) = 99999999999;
            AGE_34_JJA_avg(ii,jj) = 99999999999;
            TFLUX_34_JJA_avg(ii,jj) = 99999999999;
            SFLUX_34_JJA_avg(ii,jj) = 99999999999;
            ETAN_34_JJA_avg(ii,jj) = 99999999999;
            ETAN_34_JJA_std(ii,jj) = 99999999999;
            CFLUX_34_JJA_avg(ii,jj) = 99999999999;
            OFLUX_34_JJA_avg(ii,jj) = 99999999999;
            MLD_34_JJA_avg(ii,jj) = 99999999999;
            MLD_34_JJA_std(ii,jj) = 99999999999;
            DIC_34_JJA_avg(ii,jj) = 99999999999;
            ALK_34_JJA_avg(ii,jj) = 99999999999;
            THETA_34_JAS_avg(ii,jj) = 99999999999;
            SALT_34_JAS_avg(ii,jj) = 99999999999;
            AGE_34_JAS_avg(ii,jj) = 99999999999;
            TFLUX_34_JAS_avg(ii,jj) = 99999999999;
            SFLUX_34_JAS_avg(ii,jj) = 99999999999;
            ETAN_34_JAS_avg(ii,jj) = 99999999999;
            ETAN_34_JAS_std(ii,jj) = 99999999999;
            CFLUX_34_JAS_avg(ii,jj) = 99999999999;
            OFLUX_34_JAS_avg(ii,jj) = 99999999999;
            MLD_34_JAS_avg(ii,jj) = 99999999999;
            MLD_34_JAS_std(ii,jj) = 99999999999;
            DIC_34_JAS_avg(ii,jj) = 99999999999;
            ALK_34_JAS_avg(ii,jj) = 99999999999;
            THETA_34_JJASON_avg(ii,jj) = 99999999999;
            SALT_34_JJASON_avg(ii,jj) = 99999999999;
            AGE_34_JJASON_avg(ii,jj) = 99999999999;
            TFLUX_34_JJASON_avg(ii,jj) = 99999999999;
            SFLUX_34_JJASON_avg(ii,jj) = 99999999999;
            ETAN_34_JJASON_avg(ii,jj) = 99999999999;
            ETAN_34_JJASON_std(ii,jj) = 99999999999;
            CFLUX_34_JJASON_avg(ii,jj) = 99999999999;
            OFLUX_34_JJASON_avg(ii,jj) = 99999999999;
            MLD_34_JJASON_avg(ii,jj) = 99999999999;
            MLD_34_JJASON_std(ii,jj) = 99999999999;
            DIC_34_JJASON_avg(ii,jj) = 99999999999;
            ALK_34_JJASON_avg(ii,jj) = 99999999999;
            THETA_34_JASOND_avg(ii,jj) = 99999999999;
            SALT_34_JASOND_avg(ii,jj) = 99999999999;
            AGE_34_JASOND_avg(ii,jj) = 99999999999;
            TFLUX_34_JASOND_avg(ii,jj) = 99999999999;
            SFLUX_34_JASOND_avg(ii,jj) = 99999999999;
            ETAN_34_JASOND_avg(ii,jj) = 99999999999;
            ETAN_34_JASOND_std(ii,jj) = 99999999999;
            CFLUX_34_JASOND_avg(ii,jj) = 99999999999;
            OFLUX_34_JASOND_avg(ii,jj) = 99999999999;
            MLD_34_JASOND_avg(ii,jj) = 99999999999;
            MLD_34_JASOND_std(ii,jj) = 99999999999;
            DIC_34_JASOND_avg(ii,jj) = 99999999999;
            ALK_34_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,13)==0)
            THETA105_34_JJA_avg(ii,jj) = 99999999999;
            SALT105_34_JJA_avg(ii,jj) = 99999999999;
            WVEL100_34_JJA_avg(ii,jj) = 99999999999;
            WVEL100_34_JJA_std(ii,jj) = 99999999999;
            THETA105_34_JAS_avg(ii,jj) = 99999999999;
            SALT105_34_JAS_avg(ii,jj) = 99999999999;
            WVEL100_34_JAS_avg(ii,jj) = 99999999999;
            WVEL100_34_JAS_std(ii,jj) = 99999999999;
            THETA105_34_JJASON_avg(ii,jj) = 99999999999;
            SALT105_34_JJASON_avg(ii,jj) = 99999999999;
            WVEL100_34_JJASON_avg(ii,jj) = 99999999999;
            WVEL100_34_JJASON_std(ii,jj) = 99999999999;
            THETA105_34_JASOND_avg(ii,jj) = 99999999999;
            SALT105_34_JASOND_avg(ii,jj) = 99999999999;
            WVEL100_34_JASOND_avg(ii,jj) = 99999999999;
            WVEL100_34_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,20)==0)
            THETA200_34_JJA_avg(ii,jj) = 99999999999;
            SALT200_34_JJA_avg(ii,jj) = 99999999999;
            AGE200_34_JJA_avg(ii,jj) = 99999999999;
            WVEL190_34_JJA_avg(ii,jj) = 99999999999;
            WVEL190_34_JJA_std(ii,jj) = 99999999999;
            THETA200_34_JAS_avg(ii,jj) = 99999999999;
            SALT200_34_JAS_avg(ii,jj) = 99999999999;
            AGE200_34_JAS_avg(ii,jj) = 99999999999;
            WVEL190_34_JAS_avg(ii,jj) = 99999999999;
            WVEL190_34_JAS_std(ii,jj) = 99999999999;
            THETA200_34_JJASON_avg(ii,jj) = 99999999999;
            SALT200_34_JJASON_avg(ii,jj) = 99999999999;
            AGE200_34_JJASON_avg(ii,jj) = 99999999999;
            WVEL190_34_JJASON_avg(ii,jj) = 99999999999;
            WVEL190_34_JJASON_std(ii,jj) = 99999999999;
            THETA200_34_JASOND_avg(ii,jj) = 99999999999;
            SALT200_34_JASOND_avg(ii,jj) = 99999999999;
            AGE200_34_JASOND_avg(ii,jj) = 99999999999;
            WVEL190_34_JASOND_avg(ii,jj) = 99999999999;
            WVEL190_34_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,25)==0)
            THETA300_34_JJA_avg(ii,jj) = 99999999999;
            SALT300_34_JJA_avg(ii,jj) = 99999999999;
            WVEL290_34_JJA_avg(ii,jj) = 99999999999;
            WVEL290_34_JJA_std(ii,jj) = 99999999999;
            THETA300_34_JAS_avg(ii,jj) = 99999999999;
            SALT300_34_JAS_avg(ii,jj) = 99999999999;
            WVEL290_34_JAS_avg(ii,jj) = 99999999999;
            WVEL290_34_JAS_std(ii,jj) = 99999999999;
            THETA300_34_JJASON_avg(ii,jj) = 99999999999;
            SALT300_34_JJASON_avg(ii,jj) = 99999999999;
            WVEL290_34_JJASON_avg(ii,jj) = 99999999999;
            WVEL290_34_JJASON_std(ii,jj) = 99999999999;
            THETA300_34_JASOND_avg(ii,jj) = 99999999999;
            SALT300_34_JASOND_avg(ii,jj) = 99999999999;
            WVEL290_34_JASOND_avg(ii,jj) = 99999999999;
            WVEL290_34_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,30)==0)
            AGE500_34_JJA_avg(ii,jj) = 99999999999;
            AGE500_34_JAS_avg(ii,jj) = 99999999999;
            AGE500_34_JJASON_avg(ii,jj) = 99999999999;
            AGE500_34_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,36)==0)
            AGE1000_34_JJA_avg(ii,jj) = 99999999999;
            AGE1000_34_JAS_avg(ii,jj) = 99999999999;
            AGE1000_34_JJASON_avg(ii,jj) = 99999999999;
            AGE1000_34_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,42)==0)
            AGE2000_34_JJA_avg(ii,jj) = 99999999999;
            AGE2000_34_JAS_avg(ii,jj) = 99999999999;
            AGE2000_34_JJASON_avg(ii,jj) = 99999999999;
            AGE2000_34_JASOND_avg(ii,jj) = 99999999999;
        end
    end
end


clear char34* temp34* *Series34 n34 m34 *field34 ii
save AB34_output

fprintf('finished 34 \n')

%% end 34


