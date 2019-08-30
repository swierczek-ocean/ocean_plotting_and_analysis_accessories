
%% 124

tfield124 = 1;
sfield124 = 2;
wfield124 = 3;
tffield124 = 1;
sffield124 = 2;
cfield124 = 3;
ofield124 = 4;
efield124 = 1;
mfield124 = 4;
dfield124 = 1;
afield124 = 2;
agfield124 = 9;

THETA_Series124 = zeros(756,512,7);
THETA105_Series124 = zeros(756,512,7);
THETA200_Series124 = zeros(756,512,7);
THETA300_Series124 = zeros(756,512,7);
SALT_Series124 = zeros(756,512,7);
SALT105_Series124 = zeros(756,512,7);
SALT200_Series124 = zeros(756,512,7);
SALT300_Series124 = zeros(756,512,7);
AGE_Series124 = zeros(756,512,7);
AGE200_Series124 = zeros(756,512,7);
AGE500_Series124 = zeros(756,512,7);
AGE1000_Series124 = zeros(756,512,7);
AGE2000_Series124 = zeros(756,512,7);
WVEL100_Series124 = zeros(756,512,213);
WVEL190_Series124 = zeros(756,512,213);
WVEL290_Series124 = zeros(756,512,213);
DIC_Series124 = zeros(756,512,7);
ALK_Series124 = zeros(756,512,7);
TFLUX_Series124 = zeros(756,512,7);
SFLUX_Series124 = zeros(756,512,7);
CFLUX_Series124 = zeros(756,512,7);
OFLUX_Series124 = zeros(756,512,7);
ETAN_Series124 = zeros(756,512,213);
MLD_Series124 = zeros(756,512,213);

HC = rdmds('../MITgcm/verification/SO12_20190515/run/hFacC');
depth124 = 1;
str = '../MITgcm/verification/SO12_20190515/diag/';

for ii=1:2
    char124state = [str,'diag_vel.0000000',num2str(360*ii)];
    temp124state = rdmds(char124state);
    WVEL100_Series124(:,:,ii) = temp124state(:,:,2,wfield124);
    WVEL190_Series124(:,:,ii) = temp124state(:,:,3,wfield124);
    WVEL290_Series124(:,:,ii) = temp124state(:,:,4,wfield124);
    clear temp124state
    char124surf = [str,'diag_surf.0000000',num2str(360*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series124(:,:,ii) = temp124surf(:,:,efield124); 
    MLD_Series124(:,:,ii) = temp124surf(:,:,mfield124);
    clear temp124surf
end

for ii=3:27
    char124state = [str,'diag_vel.000000',num2str(360*ii)];
    temp124state = rdmds(char124state);
    WVEL100_Series124(:,:,ii) = temp124state(:,:,2,wfield124);
    WVEL190_Series124(:,:,ii) = temp124state(:,:,3,wfield124);
    WVEL290_Series124(:,:,ii) = temp124state(:,:,4,wfield124);
    clear temp124state
    char124surf = [str,'diag_surf.000000',num2str(360*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series124(:,:,ii) = temp124surf(:,:,efield124); 
    MLD_Series124(:,:,ii) = temp124surf(:,:,mfield124);
    clear temp124surf
end

for ii=28:213
    char124state = [str,'diag_vel.00000',num2str(360*ii)];
    temp124state = rdmds(char124state);
    WVEL100_Series124(:,:,ii) = temp124state(:,:,2,wfield124);
    WVEL190_Series124(:,:,ii) = temp124state(:,:,3,wfield124);
    WVEL290_Series124(:,:,ii) = temp124state(:,:,4,wfield124);
    clear temp124state
    char124surf = [str,'diag_surf.00000',num2str(360*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series124(:,:,ii) = temp124surf(:,:,efield124); 
    MLD_Series124(:,:,ii) = temp124surf(:,:,mfield124);
    clear temp124surf
end

for ii=1:7
    char124state = [str,'diag_state.00000',num2str(10950*ii)];
    temp124state = rdmds(char124state);
    THETA_Series124(:,:,ii) = temp124state(:,:,depth124,tfield124);
    SALT_Series124(:,:,ii) = temp124state(:,:,depth124,sfield124);
    THETA105_Series124(:,:,ii) = temp124state(:,:,26,tfield124);
    SALT105_Series124(:,:,ii) = temp124state(:,:,26,sfield124);
    THETA200_Series124(:,:,ii) = temp124state(:,:,40,tfield124);
    SALT200_Series124(:,:,ii) = temp124state(:,:,40,sfield124);
    THETA300_Series124(:,:,ii) = temp124state(:,:,50,tfield124);
    SALT300_Series124(:,:,ii) = temp124state(:,:,50,sfield124);
    clear temp124state
    char124airsea = [str,'diag_airsea.00000',num2str(10950*ii)];
    temp124airsea = rdmds(char124airsea); 
    TFLUX_Series124(:,:,ii) = temp124airsea(:,:,tffield124);
    SFLUX_Series124(:,:,ii) = temp124airsea(:,:,sffield124);
    CFLUX_Series124(:,:,ii) = temp124airsea(:,:,cfield124);
    OFLUX_Series124(:,:,ii) = temp124airsea(:,:,ofield124);
    clear temp124airsea
    char124bgc = [str,'diag_bgc.00000',num2str(10950*ii)];
    temp124bgc = rdmds(char124bgc); 
    DIC_Series124(:,:,ii) = temp124bgc(:,:,1,dfield124);
    ALK_Series124(:,:,ii) = temp124bgc(:,:,1,afield124);
    AGE_Series124(:,:,ii) = temp124bgc(:,:,depth124,agfield124);
    AGE200_Series124(:,:,ii) = temp124bgc(:,:,40,agfield124);
    AGE500_Series124(:,:,ii) = temp124bgc(:,:,60,agfield124);
    AGE1000_Series124(:,:,ii) = temp124bgc(:,:,72,agfield124);
    AGE2000_Series124(:,:,ii) = temp124bgc(:,:,84,agfield124);
    clear temp124bgc
end

THETA_124_JJA_avg = mean(THETA_Series124(:,:,1:3),3);
SALT_124_JJA_avg = mean(SALT_Series124(:,:,1:3),3);
THETA105_124_JJA_avg = mean(THETA105_Series124(:,:,1:3),3);
SALT105_124_JJA_avg = mean(SALT105_Series124(:,:,1:3),3);
THETA200_124_JJA_avg = mean(THETA200_Series124(:,:,1:3),3);
SALT200_124_JJA_avg = mean(SALT200_Series124(:,:,1:3),3);
THETA300_124_JJA_avg = mean(THETA300_Series124(:,:,1:3),3);
SALT300_124_JJA_avg = mean(SALT300_Series124(:,:,1:3),3);
AGE_124_JJA_avg = mean(AGE_Series124(:,:,1:3),3);
AGE200_124_JJA_avg = mean(AGE200_Series124(:,:,1:3),3);
AGE500_124_JJA_avg = mean(AGE500_Series124(:,:,1:3),3);
AGE1000_124_JJA_avg = mean(AGE1000_Series124(:,:,1:3),3);
AGE2000_124_JJA_avg = mean(AGE2000_Series124(:,:,1:3),3);
WVEL100_124_JJA_avg = mean(WVEL100_Series124(:,:,1:91),3);
WVEL100_124_JJA_std = std(WVEL100_Series124(:,:,1:91),0,3);
WVEL190_124_JJA_avg = mean(WVEL190_Series124(:,:,1:91),3);
WVEL190_124_JJA_std = std(WVEL190_Series124(:,:,1:91),0,3);
WVEL290_124_JJA_avg = mean(WVEL290_Series124(:,:,1:91),3);
WVEL290_124_JJA_std = std(WVEL290_Series124(:,:,1:91),0,3);
TFLUX_124_JJA_avg = mean(TFLUX_Series124(:,:,1:3),3);
SFLUX_124_JJA_avg = mean(SFLUX_Series124(:,:,1:3),3);
ETAN_124_JJA_avg = mean(ETAN_Series124(:,:,1:91),3);
ETAN_124_JJA_std = std(ETAN_Series124(:,:,1:91),0,3);
CFLUX_124_JJA_avg = mean(CFLUX_Series124(:,:,1:3),3);
OFLUX_124_JJA_avg = mean(OFLUX_Series124(:,:,1:3),3);
MLD_124_JJA_avg = mean(MLD_Series124(:,:,1:91),3);
MLD_124_JJA_std = std(MLD_Series124(:,:,1:91),0,3);
DIC_124_JJA_avg = mean(DIC_Series124(:,:,1:3),3);
ALK_124_JJA_avg = mean(ALK_Series124(:,:,1:3),3);

THETA_124_JAS_avg = mean(THETA_Series124(:,:,2:4),3);
SALT_124_JAS_avg = mean(SALT_Series124(:,:,2:4),3);
THETA105_124_JAS_avg = mean(THETA105_Series124(:,:,2:4),3);
SALT105_124_JAS_avg = mean(SALT105_Series124(:,:,2:4),3);
THETA200_124_JAS_avg = mean(THETA200_Series124(:,:,2:4),3);
SALT200_124_JAS_avg = mean(SALT200_Series124(:,:,2:4),3);
THETA300_124_JAS_avg = mean(THETA300_Series124(:,:,2:4),3);
SALT300_124_JAS_avg = mean(SALT300_Series124(:,:,2:4),3);
AGE_124_JAS_avg = mean(AGE_Series124(:,:,2:4),3);
AGE200_124_JAS_avg = mean(AGE200_Series124(:,:,2:4),3);
AGE500_124_JAS_avg = mean(AGE500_Series124(:,:,2:4),3);
AGE1000_124_JAS_avg = mean(AGE1000_Series124(:,:,2:4),3);
AGE2000_124_JAS_avg = mean(AGE2000_Series124(:,:,2:4),3);
WVEL100_124_JAS_avg = mean(WVEL100_Series124(:,:,32:124),3);
WVEL100_124_JAS_std = std(WVEL100_Series124(:,:,32:124),0,3);
WVEL190_124_JAS_avg = mean(WVEL190_Series124(:,:,32:124),3);
WVEL190_124_JAS_std = std(WVEL190_Series124(:,:,32:124),0,3);
WVEL290_124_JAS_avg = mean(WVEL290_Series124(:,:,32:124),3);
WVEL290_124_JAS_std = std(WVEL290_Series124(:,:,32:124),0,3);
TFLUX_124_JAS_avg = mean(TFLUX_Series124(:,:,2:4),3);
SFLUX_124_JAS_avg = mean(SFLUX_Series124(:,:,2:4),3);
ETAN_124_JAS_avg = mean(ETAN_Series124(:,:,32:124),3);
ETAN_124_JAS_std = std(ETAN_Series124(:,:,32:124),0,3);
CFLUX_124_JAS_avg = mean(CFLUX_Series124(:,:,2:4),3);
OFLUX_124_JAS_avg = mean(OFLUX_Series124(:,:,2:4),3);
MLD_124_JAS_avg = mean(MLD_Series124(:,:,32:124),3);
MLD_124_JAS_std = std(MLD_Series124(:,:,32:124),0,3);
DIC_124_JAS_avg = mean(DIC_Series124(:,:,2:4),3);
ALK_124_JAS_avg = mean(ALK_Series124(:,:,2:4),3);

THETA_124_JJASON_avg = mean(THETA_Series124(:,:,1:6),3);
SALT_124_JJASON_avg = mean(SALT_Series124(:,:,1:6),3);
THETA105_124_JJASON_avg = mean(THETA105_Series124(:,:,1:6),3);
SALT105_124_JJASON_avg = mean(SALT105_Series124(:,:,1:6),3);
THETA200_124_JJASON_avg = mean(THETA200_Series124(:,:,1:6),3);
SALT200_124_JJASON_avg = mean(SALT200_Series124(:,:,1:6),3);
THETA300_124_JJASON_avg = mean(THETA300_Series124(:,:,1:6),3);
SALT300_124_JJASON_avg = mean(SALT300_Series124(:,:,1:6),3);
AGE_124_JJASON_avg = mean(AGE_Series124(:,:,1:6),3);
AGE200_124_JJASON_avg = mean(AGE200_Series124(:,:,1:6),3);
AGE500_124_JJASON_avg = mean(AGE500_Series124(:,:,1:6),3);
AGE1000_124_JJASON_avg = mean(AGE1000_Series124(:,:,1:6),3);
AGE2000_124_JJASON_avg = mean(AGE2000_Series124(:,:,1:6),3);
WVEL100_124_JJASON_avg = mean(WVEL100_Series124(:,:,1:182),3);
WVEL100_124_JJASON_std = std(WVEL100_Series124(:,:,1:182),0,3);
WVEL190_124_JJASON_avg = mean(WVEL190_Series124(:,:,1:182),3);
WVEL190_124_JJASON_std = std(WVEL190_Series124(:,:,1:182),0,3);
WVEL290_124_JJASON_avg = mean(WVEL290_Series124(:,:,1:182),3);
WVEL290_124_JJASON_std = std(WVEL290_Series124(:,:,1:182),0,3);
TFLUX_124_JJASON_avg = mean(TFLUX_Series124(:,:,1:6),3);
SFLUX_124_JJASON_avg = mean(SFLUX_Series124(:,:,1:6),3);
ETAN_124_JJASON_avg = mean(ETAN_Series124(:,:,1:182),3);
ETAN_124_JJASON_std = std(ETAN_Series124(:,:,1:182),0,3);
CFLUX_124_JJASON_avg = mean(CFLUX_Series124(:,:,1:6),3);
OFLUX_124_JJASON_avg = mean(OFLUX_Series124(:,:,1:6),3);
MLD_124_JJASON_avg = mean(MLD_Series124(:,:,1:182),3);
MLD_124_JJASON_std = std(MLD_Series124(:,:,1:182),0,3);
DIC_124_JJASON_avg = mean(DIC_Series124(:,:,1:6),3);
ALK_124_JJASON_avg = mean(ALK_Series124(:,:,1:6),3);

THETA_124_JASOND_avg = mean(THETA_Series124(:,:,2:7),3);
SALT_124_JASOND_avg = mean(SALT_Series124(:,:,2:7),3);
THETA105_124_JASOND_avg = mean(THETA105_Series124(:,:,2:7),3);
SALT105_124_JASOND_avg = mean(SALT105_Series124(:,:,2:7),3);
THETA200_124_JASOND_avg = mean(THETA200_Series124(:,:,2:7),3);
SALT200_124_JASOND_avg = mean(SALT200_Series124(:,:,2:7),3);
THETA300_124_JASOND_avg = mean(THETA300_Series124(:,:,2:7),3);
SALT300_124_JASOND_avg = mean(SALT300_Series124(:,:,2:7),3);
AGE_124_JASOND_avg = mean(AGE_Series124(:,:,2:7),3);
AGE200_124_JASOND_avg = mean(AGE200_Series124(:,:,2:7),3);
AGE500_124_JASOND_avg = mean(AGE500_Series124(:,:,2:7),3);
AGE1000_124_JASOND_avg = mean(AGE1000_Series124(:,:,2:7),3);
AGE2000_124_JASOND_avg = mean(AGE2000_Series124(:,:,2:7),3);
WVEL100_124_JASOND_avg = mean(WVEL100_Series124(:,:,32:213),3);
WVEL100_124_JASOND_std = std(WVEL100_Series124(:,:,32:213),0,3);
WVEL190_124_JASOND_avg = mean(WVEL190_Series124(:,:,32:213),3);
WVEL190_124_JASOND_std = std(WVEL190_Series124(:,:,32:213),0,3);
WVEL290_124_JASOND_avg = mean(WVEL290_Series124(:,:,32:213),3);
WVEL290_124_JASOND_std = std(WVEL290_Series124(:,:,32:213),0,3);
TFLUX_124_JASOND_avg = mean(TFLUX_Series124(:,:,2:7),3);
SFLUX_124_JASOND_avg = mean(SFLUX_Series124(:,:,2:7),3);
ETAN_124_JASOND_avg = mean(ETAN_Series124(:,:,32:213),3);
ETAN_124_JASOND_std = std(ETAN_Series124(:,:,32:213),0,3);
CFLUX_124_JASOND_avg = mean(CFLUX_Series124(:,:,2:7),3);
OFLUX_124_JASOND_avg = mean(OFLUX_Series124(:,:,2:7),3);
MLD_124_JASOND_avg = mean(MLD_Series124(:,:,32:213),3);
MLD_124_JASOND_std = std(MLD_Series124(:,:,32:213),0,3);
DIC_124_JASOND_avg = mean(DIC_Series124(:,:,2:7),3);
ALK_124_JASOND_avg = mean(ALK_Series124(:,:,2:7),3);


[m124,n124] = size(THETA_124_JJA_avg);

parfor ii=1:m124
    for jj=1:n124
        if (HC(ii,jj,1)==0)
            THETA_124_JJA_avg(ii,jj) = 99999999999;
            SALT_124_JJA_avg(ii,jj) = 99999999999;
            AGE_124_JJA_avg(ii,jj) = 99999999999;
            TFLUX_124_JJA_avg(ii,jj) = 99999999999;
            SFLUX_124_JJA_avg(ii,jj) = 99999999999;
            ETAN_124_JJA_avg(ii,jj) = 99999999999;
            ETAN_124_JJA_std(ii,jj) = 99999999999;
            CFLUX_124_JJA_avg(ii,jj) = 99999999999;
            OFLUX_124_JJA_avg(ii,jj) = 99999999999;
            MLD_124_JJA_avg(ii,jj) = 99999999999;
            MLD_124_JJA_std(ii,jj) = 99999999999;
            DIC_124_JJA_avg(ii,jj) = 99999999999;
            ALK_124_JJA_avg(ii,jj) = 99999999999;
            THETA_124_JAS_avg(ii,jj) = 99999999999;
            SALT_124_JAS_avg(ii,jj) = 99999999999;
            AGE_124_JAS_avg(ii,jj) = 99999999999;
            TFLUX_124_JAS_avg(ii,jj) = 99999999999;
            SFLUX_124_JAS_avg(ii,jj) = 99999999999;
            ETAN_124_JAS_avg(ii,jj) = 99999999999;
            ETAN_124_JAS_std(ii,jj) = 99999999999;
            CFLUX_124_JAS_avg(ii,jj) = 99999999999;
            OFLUX_124_JAS_avg(ii,jj) = 99999999999;
            MLD_124_JAS_avg(ii,jj) = 99999999999;
            MLD_124_JAS_std(ii,jj) = 99999999999;
            DIC_124_JAS_avg(ii,jj) = 99999999999;
            ALK_124_JAS_avg(ii,jj) = 99999999999;
            THETA_124_JJASON_avg(ii,jj) = 99999999999;
            SALT_124_JJASON_avg(ii,jj) = 99999999999;
            AGE_124_JJASON_avg(ii,jj) = 99999999999;
            TFLUX_124_JJASON_avg(ii,jj) = 99999999999;
            SFLUX_124_JJASON_avg(ii,jj) = 99999999999;
            ETAN_124_JJASON_avg(ii,jj) = 99999999999;
            ETAN_124_JJASON_std(ii,jj) = 99999999999;
            CFLUX_124_JJASON_avg(ii,jj) = 99999999999;
            OFLUX_124_JJASON_avg(ii,jj) = 99999999999;
            MLD_124_JJASON_avg(ii,jj) = 99999999999;
            MLD_124_JJASON_std(ii,jj) = 99999999999;
            DIC_124_JJASON_avg(ii,jj) = 99999999999;
            ALK_124_JJASON_avg(ii,jj) = 99999999999;
            THETA_124_JASOND_avg(ii,jj) = 99999999999;
            SALT_124_JASOND_avg(ii,jj) = 99999999999;
            AGE_124_JASOND_avg(ii,jj) = 99999999999;
            TFLUX_124_JASOND_avg(ii,jj) = 99999999999;
            SFLUX_124_JASOND_avg(ii,jj) = 99999999999;
            ETAN_124_JASOND_avg(ii,jj) = 99999999999;
            ETAN_124_JASOND_std(ii,jj) = 99999999999;
            CFLUX_124_JASOND_avg(ii,jj) = 99999999999;
            OFLUX_124_JASOND_avg(ii,jj) = 99999999999;
            MLD_124_JASOND_avg(ii,jj) = 99999999999;
            MLD_124_JASOND_std(ii,jj) = 99999999999;
            DIC_124_JASOND_avg(ii,jj) = 99999999999;
            ALK_124_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,26)==0)
            THETA105_124_JJA_avg(ii,jj) = 99999999999;
            SALT105_124_JJA_avg(ii,jj) = 99999999999;
            WVEL100_124_JJA_avg(ii,jj) = 99999999999;
            WVEL100_124_JJA_std(ii,jj) = 99999999999;
            THETA105_124_JAS_avg(ii,jj) = 99999999999;
            SALT105_124_JAS_avg(ii,jj) = 99999999999;
            WVEL100_124_JAS_avg(ii,jj) = 99999999999;
            WVEL100_124_JAS_std(ii,jj) = 99999999999;
            THETA105_124_JJASON_avg(ii,jj) = 99999999999;
            SALT105_124_JJASON_avg(ii,jj) = 99999999999;
            WVEL100_124_JJASON_avg(ii,jj) = 99999999999;
            WVEL100_124_JJASON_std(ii,jj) = 99999999999;
            THETA105_124_JASOND_avg(ii,jj) = 99999999999;
            SALT105_124_JASOND_avg(ii,jj) = 99999999999;
            WVEL100_124_JASOND_avg(ii,jj) = 99999999999;
            WVEL100_124_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,40)==0)
            THETA200_124_JJA_avg(ii,jj) = 99999999999;
            SALT200_124_JJA_avg(ii,jj) = 99999999999;
            AGE200_124_JJA_avg(ii,jj) = 99999999999;
            WVEL190_124_JJA_avg(ii,jj) = 99999999999;
            WVEL190_124_JJA_std(ii,jj) = 99999999999;
            THETA200_124_JAS_avg(ii,jj) = 99999999999;
            SALT200_124_JAS_avg(ii,jj) = 99999999999;
            AGE200_124_JAS_avg(ii,jj) = 99999999999;
            WVEL190_124_JAS_avg(ii,jj) = 99999999999;
            WVEL190_124_JAS_std(ii,jj) = 99999999999;
            THETA200_124_JJASON_avg(ii,jj) = 99999999999;
            SALT200_124_JJASON_avg(ii,jj) = 99999999999;
            AGE200_124_JJASON_avg(ii,jj) = 99999999999;
            WVEL190_124_JJASON_avg(ii,jj) = 99999999999;
            WVEL190_124_JJASON_std(ii,jj) = 99999999999;
            THETA200_124_JASOND_avg(ii,jj) = 99999999999;
            SALT200_124_JASOND_avg(ii,jj) = 99999999999;
            AGE200_124_JASOND_avg(ii,jj) = 99999999999;
            WVEL190_124_JASOND_avg(ii,jj) = 99999999999;
            WVEL190_124_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,50)==0)
            THETA300_124_JJA_avg(ii,jj) = 99999999999;
            SALT300_124_JJA_avg(ii,jj) = 99999999999;
            WVEL290_124_JJA_avg(ii,jj) = 99999999999;
            WVEL290_124_JJA_std(ii,jj) = 99999999999;
            THETA300_124_JAS_avg(ii,jj) = 99999999999;
            SALT300_124_JAS_avg(ii,jj) = 99999999999;
            WVEL290_124_JAS_avg(ii,jj) = 99999999999;
            WVEL290_124_JAS_std(ii,jj) = 99999999999;
            THETA300_124_JJASON_avg(ii,jj) = 99999999999;
            SALT300_124_JJASON_avg(ii,jj) = 99999999999;
            WVEL290_124_JJASON_avg(ii,jj) = 99999999999;
            WVEL290_124_JJASON_std(ii,jj) = 99999999999;
            THETA300_124_JASOND_avg(ii,jj) = 99999999999;
            SALT300_124_JASOND_avg(ii,jj) = 99999999999;
            WVEL290_124_JASOND_avg(ii,jj) = 99999999999;
            WVEL290_124_JASOND_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,60)==0)
            AGE500_124_JJA_avg(ii,jj) = 99999999999;
            AGE500_124_JAS_avg(ii,jj) = 99999999999;
            AGE500_124_JJASON_avg(ii,jj) = 99999999999;
            AGE500_124_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,72)==0)
            AGE1000_124_JJA_avg(ii,jj) = 99999999999;
            AGE1000_124_JAS_avg(ii,jj) = 99999999999;
            AGE1000_124_JJASON_avg(ii,jj) = 99999999999;
            AGE1000_124_JASOND_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,84)==0)
            AGE2000_124_JJA_avg(ii,jj) = 99999999999;
            AGE2000_124_JAS_avg(ii,jj) = 99999999999;
            AGE2000_124_JJASON_avg(ii,jj) = 99999999999;
            AGE2000_124_JASOND_avg(ii,jj) = 99999999999;
        end
    end
end


clear char124* temp124* *Series124 n124 m124 *field124 ii
save AB124_output

fprintf('finished 124 \n')

%% end 124


