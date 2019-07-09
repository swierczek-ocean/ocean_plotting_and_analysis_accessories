
%% 32

tfield32 = 1;
sfield32 = 2;
wfield32 = 3;
tffield32 = 1;
sffield32 = 2;
cfield32 = 3;
ofield32 = 4;
efield32 = 1;
mfield32 = 4;
dfield32 = 1;
afield32 = 2;
agfield32 = 9;


THETA_Series32 = zeros(192,132,13);
THETA105_Series32 = zeros(192,132,13);
THETA200_Series32 = zeros(192,132,13);
THETA300_Series32 = zeros(192,132,13);
SALT_Series32 = zeros(192,132,13);
SALT105_Series32 = zeros(192,132,13);
SALT200_Series32 = zeros(192,132,13);
SALT300_Series32 = zeros(192,132,13);
AGE_Series32 = zeros(192,132,13);
AGE200_Series32 = zeros(192,132,13);
AGE500_Series32 = zeros(192,132,13);
AGE1000_Series32 = zeros(192,132,13);
AGE2000_Series32 = zeros(192,132,13);
WVEL100_Series32 = zeros(192,132,395);
WVEL190_Series32 = zeros(192,132,395);
WVEL290_Series32 = zeros(192,132,395);
DIC_Series32 = zeros(192,132,13);
ALK_Series32 = zeros(192,132,13);
TFLUX_Series32 = zeros(192,132,13);
SFLUX_Series32 = zeros(192,132,13);
CFLUX_Series32 = zeros(192,132,13);
OFLUX_Series32 = zeros(192,132,13);
ETAN_Series32 = zeros(192,132,395);
MLD_Series32 = zeros(192,132,395);

HC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
depth32 = 1;
str = '../MITgcm/verification/SO3_20190513/diag/';

for ii=1:2
    char32state = [str,'diag_vel.00000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    WVEL100_Series32(:,:,ii) = temp32state(:,:,2,wfield32);
    WVEL190_Series32(:,:,ii) = temp32state(:,:,3,wfield32);
    WVEL290_Series32(:,:,ii) = temp32state(:,:,4,wfield32);
    clear temp32state
    char32surf = [str,'diag_surf.00000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    MLD_Series32(:,:,ii) = temp32surf(:,:,mfield32);
    clear temp32surf
end

for ii=3:20
    char32state = [str,'diag_vel.0000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    WVEL100_Series32(:,:,ii) = temp32state(:,:,2,wfield32);
    WVEL190_Series32(:,:,ii) = temp32state(:,:,3,wfield32);
    WVEL290_Series32(:,:,ii) = temp32state(:,:,4,wfield32);
    clear temp32state
    char32surf = [str,'diag_surf.0000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    MLD_Series32(:,:,ii) = temp32surf(:,:,mfield32);
    clear temp32surf
end

for ii=21:208
    char32state = [str,'diag_vel.000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    WVEL100_Series32(:,:,ii) = temp32state(:,:,2,wfield32);
    WVEL190_Series32(:,:,ii) = temp32state(:,:,3,wfield32);
    WVEL290_Series32(:,:,ii) = temp32state(:,:,4,wfield32);
    clear temp32state
    char32surf = [str,'diag_surf.000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    MLD_Series32(:,:,ii) = temp32surf(:,:,mfield32);
    clear temp32surf
end

for ii=209:395
    char32state = [str,'diag_vel.00000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    WVEL100_Series32(:,:,ii) = temp32state(:,:,2,wfield32);
    WVEL190_Series32(:,:,ii) = temp32state(:,:,3,wfield32);
    WVEL290_Series32(:,:,ii) = temp32state(:,:,4,wfield32);
    clear temp32state
    char32surf = [str,'diag_surf.00000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    MLD_Series32(:,:,ii) = temp32surf(:,:,mfield32);
    clear temp32surf
end

for ii=1:6
    char32state = [str,'diag_state.000000',num2str(1460*ii)];
    temp32state = rdmds(char32state);
    THETA_Series32(:,:,ii) = temp32state(:,:,depth32,tfield32);
    SALT_Series32(:,:,ii) = temp32state(:,:,depth32,sfield32);
    THETA105_Series32(:,:,ii) = temp32state(:,:,13,tfield32);
    SALT105_Series32(:,:,ii) = temp32state(:,:,13,sfield32);
    THETA200_Series32(:,:,ii) = temp32state(:,:,20,tfield32);
    SALT200_Series32(:,:,ii) = temp32state(:,:,20,sfield32);
    THETA300_Series32(:,:,ii) = temp32state(:,:,25,tfield32);
    SALT300_Series32(:,:,ii) = temp32state(:,:,25,sfield32);
    clear temp32state
    char32airsea = [str,'diag_airsea.000000',num2str(1460*ii)];
    temp32airsea = rdmds(char32airsea); 
    TFLUX_Series32(:,:,ii) = temp32airsea(:,:,tffield32);
    SFLUX_Series32(:,:,ii) = temp32airsea(:,:,sffield32);
    CFLUX_Series32(:,:,ii) = temp32airsea(:,:,cfield32);
    OFLUX_Series32(:,:,ii) = temp32airsea(:,:,ofield32);
    clear temp32airsea
    char32bgc = [str,'diag_bgc.000000',num2str(1460*ii)];
    temp32bgc = rdmds(char32bgc); 
    DIC_Series32(:,:,ii) = temp32bgc(:,:,1,dfield32);
    ALK_Series32(:,:,ii) = temp32bgc(:,:,1,afield32);
    AGE_Series32(:,:,ii) = temp32bgc(:,:,depth32,agfield32);
    AGE200_Series32(:,:,ii) = temp32bgc(:,:,20,agfield32);
    AGE500_Series32(:,:,ii) = temp32bgc(:,:,30,agfield32);
    AGE1000_Series32(:,:,ii) = temp32bgc(:,:,36,agfield32);
    AGE2000_Series32(:,:,ii) = temp32bgc(:,:,42,agfield32);
    clear temp32bgc
end

for ii=7:13
    char32state = [str,'diag_state.00000',num2str(1460*ii)];
    temp32state = rdmds(char32state);
    THETA_Series32(:,:,ii) = temp32state(:,:,depth32,tfield32);
    SALT_Series32(:,:,ii) = temp32state(:,:,depth32,sfield32);
    THETA105_Series32(:,:,ii) = temp32state(:,:,13,tfield32);
    SALT105_Series32(:,:,ii) = temp32state(:,:,13,sfield32);
    THETA200_Series32(:,:,ii) = temp32state(:,:,20,tfield32);
    SALT200_Series32(:,:,ii) = temp32state(:,:,20,sfield32);
    THETA300_Series32(:,:,ii) = temp32state(:,:,25,tfield32);
    SALT300_Series32(:,:,ii) = temp32state(:,:,25,sfield32);
    clear temp32state
    char32airsea = [str,'diag_airsea.00000',num2str(1460*ii)];
    temp32airsea = rdmds(char32airsea); 
    TFLUX_Series32(:,:,ii) = temp32airsea(:,:,tffield32);
    SFLUX_Series32(:,:,ii) = temp32airsea(:,:,sffield32);
    CFLUX_Series32(:,:,ii) = temp32airsea(:,:,cfield32);
    OFLUX_Series32(:,:,ii) = temp32airsea(:,:,ofield32);
    clear temp32airsea
    char32bgc = [str,'diag_bgc.00000',num2str(1460*ii)];
    temp32bgc = rdmds(char32bgc); 
    DIC_Series32(:,:,ii) = temp32bgc(:,:,1,dfield32);
    ALK_Series32(:,:,ii) = temp32bgc(:,:,1,afield32);
    AGE_Series32(:,:,ii) = temp32bgc(:,:,depth32,agfield32);
    AGE200_Series32(:,:,ii) = temp32bgc(:,:,20,agfield32);
    AGE500_Series32(:,:,ii) = temp32bgc(:,:,30,agfield32);
    AGE1000_Series32(:,:,ii) = temp32bgc(:,:,36,agfield32);
    AGE2000_Series32(:,:,ii) = temp32bgc(:,:,42,agfield32);
    clear temp32bgc
end

THETA_32_DJF_avg = mean(THETA_Series32(:,:,1:3),3);
SALT_32_DJF_avg = mean(SALT_Series32(:,:,1:3),3);
THETA105_32_DJF_avg = mean(THETA105_Series32(:,:,1:3),3);
SALT105_32_DJF_avg = mean(SALT105_Series32(:,:,1:3),3);
THETA200_32_DJF_avg = mean(THETA200_Series32(:,:,1:3),3);
SALT200_32_DJF_avg = mean(SALT200_Series32(:,:,1:3),3);
THETA300_32_DJF_avg = mean(THETA300_Series32(:,:,1:3),3);
SALT300_32_DJF_avg = mean(SALT300_Series32(:,:,1:3),3);
AGE_32_DJF_avg = mean(AGE_Series32(:,:,1:3),3);
AGE200_32_DJF_avg = mean(AGE200_Series32(:,:,1:3),3);
AGE500_32_DJF_avg = mean(AGE500_Series32(:,:,1:3),3);
AGE1000_32_DJF_avg = mean(AGE1000_Series32(:,:,1:3),3);
AGE2000_32_DJF_avg = mean(AGE2000_Series32(:,:,1:3),3);
WVEL100_32_DJF_avg = mean(WVEL100_Series32(:,:,1:91),3);
WVEL100_32_DJF_std = std(WVEL100_Series32(:,:,1:91),0,3);
WVEL190_32_DJF_avg = mean(WVEL190_Series32(:,:,1:91),3);
WVEL190_32_DJF_std = std(WVEL190_Series32(:,:,1:91),0,3);
WVEL290_32_DJF_avg = mean(WVEL290_Series32(:,:,1:91),3);
WVEL290_32_DJF_std = std(WVEL290_Series32(:,:,1:91),0,3);
TFLUX_32_DJF_avg = mean(TFLUX_Series32(:,:,1:3),3);
SFLUX_32_DJF_avg = mean(SFLUX_Series32(:,:,1:3),3);
ETAN_32_DJF_avg = mean(ETAN_Series32(:,:,1:91),3);
ETAN_32_DJF_std = std(ETAN_Series32(:,:,1:91),0,3);
CFLUX_32_DJF_avg = mean(CFLUX_Series32(:,:,1:3),3);
OFLUX_32_DJF_avg = mean(OFLUX_Series32(:,:,1:3),3);
MLD_32_DJF_avg = mean(MLD_Series32(:,:,1:91),3);
MLD_32_DJF_std = std(MLD_Series32(:,:,1:91),0,3);
DIC_32_DJF_avg = mean(DIC_Series32(:,:,1:3),3);
ALK_32_DJF_avg = mean(ALK_Series32(:,:,1:3),3);

THETA_32_JFM_avg = mean(THETA_Series32(:,:,2:4),3);
SALT_32_JFM_avg = mean(SALT_Series32(:,:,2:4),3);
THETA105_32_JFM_avg = mean(THETA105_Series32(:,:,2:4),3);
SALT105_32_JFM_avg = mean(SALT105_Series32(:,:,2:4),3);
THETA200_32_JFM_avg = mean(THETA200_Series32(:,:,2:4),3);
SALT200_32_JFM_avg = mean(SALT200_Series32(:,:,2:4),3);
THETA300_32_JFM_avg = mean(THETA300_Series32(:,:,2:4),3);
SALT300_32_JFM_avg = mean(SALT300_Series32(:,:,2:4),3);
AGE_32_JFM_avg = mean(AGE_Series32(:,:,2:4),3);
AGE200_32_JFM_avg = mean(AGE200_Series32(:,:,2:4),3);
AGE500_32_JFM_avg = mean(AGE500_Series32(:,:,2:4),3);
AGE1000_32_JFM_avg = mean(AGE1000_Series32(:,:,2:4),3);
AGE2000_32_JFM_avg = mean(AGE2000_Series32(:,:,2:4),3);
WVEL100_32_JFM_avg = mean(WVEL100_Series32(:,:,32:32),3);
WVEL100_32_JFM_std = std(WVEL100_Series32(:,:,32:32),0,3);
WVEL190_32_JFM_avg = mean(WVEL190_Series32(:,:,32:32),3);
WVEL190_32_JFM_std = std(WVEL190_Series32(:,:,32:32),0,3);
WVEL290_32_JFM_avg = mean(WVEL290_Series32(:,:,32:32),3);
WVEL290_32_JFM_std = std(WVEL290_Series32(:,:,32:32),0,3);
TFLUX_32_JFM_avg = mean(TFLUX_Series32(:,:,2:4),3);
SFLUX_32_JFM_avg = mean(SFLUX_Series32(:,:,2:4),3);
ETAN_32_JFM_avg = mean(ETAN_Series32(:,:,32:32),3);
ETAN_32_JFM_std = std(ETAN_Series32(:,:,32:32),0,3);
CFLUX_32_JFM_avg = mean(CFLUX_Series32(:,:,2:4),3);
OFLUX_32_JFM_avg = mean(OFLUX_Series32(:,:,2:4),3);
MLD_32_JFM_avg = mean(MLD_Series32(:,:,32:32),3);
MLD_32_JFM_std = std(MLD_Series32(:,:,32:32),0,3);
DIC_32_JFM_avg = mean(DIC_Series32(:,:,2:4),3);
ALK_32_JFM_avg = mean(ALK_Series32(:,:,2:4),3);

THETA_32_DJFMAM_avg = mean(THETA_Series32(:,:,1:6),3);
SALT_32_DJFMAM_avg = mean(SALT_Series32(:,:,1:6),3);
THETA105_32_DJFMAM_avg = mean(THETA105_Series32(:,:,1:6),3);
SALT105_32_DJFMAM_avg = mean(SALT105_Series32(:,:,1:6),3);
THETA200_32_DJFMAM_avg = mean(THETA200_Series32(:,:,1:6),3);
SALT200_32_DJFMAM_avg = mean(SALT200_Series32(:,:,1:6),3);
THETA300_32_DJFMAM_avg = mean(THETA300_Series32(:,:,1:6),3);
SALT300_32_DJFMAM_avg = mean(SALT300_Series32(:,:,1:6),3);
AGE_32_DJFMAM_avg = mean(AGE_Series32(:,:,1:6),3);
AGE200_32_DJFMAM_avg = mean(AGE200_Series32(:,:,1:6),3);
AGE500_32_DJFMAM_avg = mean(AGE500_Series32(:,:,1:6),3);
AGE1000_32_DJFMAM_avg = mean(AGE1000_Series32(:,:,1:6),3);
AGE2000_32_DJFMAM_avg = mean(AGE2000_Series32(:,:,1:6),3);
WVEL100_32_DJFMAM_avg = mean(WVEL100_Series32(:,:,1:182),3);
WVEL100_32_DJFMAM_std = std(WVEL100_Series32(:,:,1:182),0,3);
WVEL190_32_DJFMAM_avg = mean(WVEL190_Series32(:,:,1:182),3);
WVEL190_32_DJFMAM_std = std(WVEL190_Series32(:,:,1:182),0,3);
WVEL290_32_DJFMAM_avg = mean(WVEL290_Series32(:,:,1:182),3);
WVEL290_32_DJFMAM_std = std(WVEL290_Series32(:,:,1:182),0,3);
TFLUX_32_DJFMAM_avg = mean(TFLUX_Series32(:,:,1:6),3);
SFLUX_32_DJFMAM_avg = mean(SFLUX_Series32(:,:,1:6),3);
ETAN_32_DJFMAM_avg = mean(ETAN_Series32(:,:,1:182),3);
ETAN_32_DJFMAM_std = std(ETAN_Series32(:,:,1:182),0,3);
CFLUX_32_DJFMAM_avg = mean(CFLUX_Series32(:,:,1:6),3);
OFLUX_32_DJFMAM_avg = mean(OFLUX_Series32(:,:,1:6),3);
MLD_32_DJFMAM_avg = mean(MLD_Series32(:,:,1:182),3);
MLD_32_DJFMAM_std = std(MLD_Series32(:,:,1:182),0,3);
DIC_32_DJFMAM_avg = mean(DIC_Series32(:,:,1:6),3);
ALK_32_DJFMAM_avg = mean(ALK_Series32(:,:,1:6),3);

THETA_32_JFMAMJ_avg = mean(THETA_Series32(:,:,2:7),3);
SALT_32_JFMAMJ_avg = mean(SALT_Series32(:,:,2:7),3);
THETA105_32_JFMAMJ_avg = mean(THETA105_Series32(:,:,2:7),3);
SALT105_32_JFMAMJ_avg = mean(SALT105_Series32(:,:,2:7),3);
THETA200_32_JFMAMJ_avg = mean(THETA200_Series32(:,:,2:7),3);
SALT200_32_JFMAMJ_avg = mean(SALT200_Series32(:,:,2:7),3);
THETA300_32_JFMAMJ_avg = mean(THETA300_Series32(:,:,2:7),3);
SALT300_32_JFMAMJ_avg = mean(SALT300_Series32(:,:,2:7),3);
AGE_32_JFMAMJ_avg = mean(AGE_Series32(:,:,2:7),3);
AGE200_32_JFMAMJ_avg = mean(AGE200_Series32(:,:,2:7),3);
AGE500_32_JFMAMJ_avg = mean(AGE500_Series32(:,:,2:7),3);
AGE1000_32_JFMAMJ_avg = mean(AGE1000_Series32(:,:,2:7),3);
AGE2000_32_JFMAMJ_avg = mean(AGE2000_Series32(:,:,2:7),3);
WVEL100_32_JFMAMJ_avg = mean(WVEL100_Series32(:,:,32:213),3);
WVEL100_32_JFMAMJ_std = std(WVEL100_Series32(:,:,32:213),0,3);
WVEL190_32_JFMAMJ_avg = mean(WVEL190_Series32(:,:,32:213),3);
WVEL190_32_JFMAMJ_std = std(WVEL190_Series32(:,:,32:213),0,3);
WVEL290_32_JFMAMJ_avg = mean(WVEL290_Series32(:,:,32:213),3);
WVEL290_32_JFMAMJ_std = std(WVEL290_Series32(:,:,32:213),0,3);
TFLUX_32_JFMAMJ_avg = mean(TFLUX_Series32(:,:,2:7),3);
SFLUX_32_JFMAMJ_avg = mean(SFLUX_Series32(:,:,2:7),3);
ETAN_32_JFMAMJ_avg = mean(ETAN_Series32(:,:,32:213),3);
ETAN_32_JFMAMJ_std = std(ETAN_Series32(:,:,32:213),0,3);
CFLUX_32_JFMAMJ_avg = mean(CFLUX_Series32(:,:,2:7),3);
OFLUX_32_JFMAMJ_avg = mean(OFLUX_Series32(:,:,2:7),3);
MLD_32_JFMAMJ_avg = mean(MLD_Series32(:,:,32:213),3);
MLD_32_JFMAMJ_std = std(MLD_Series32(:,:,32:213),0,3);
DIC_32_JFMAMJ_avg = mean(DIC_Series32(:,:,2:7),3);
ALK_32_JFMAMJ_avg = mean(ALK_Series32(:,:,2:7),3);

THETA_32_DN_avg = mean(THETA_Series32(:,:,1:12),3);
SALT_32_DN_avg = mean(SALT_Series32(:,:,1:12),3);
THETA105_32_DN_avg = mean(THETA105_Series32(:,:,1:12),3);
SALT105_32_DN_avg = mean(SALT105_Series32(:,:,1:12),3);
THETA200_32_DN_avg = mean(THETA200_Series32(:,:,1:12),3);
SALT200_32_DN_avg = mean(SALT200_Series32(:,:,1:12),3);
THETA300_32_DN_avg = mean(THETA300_Series32(:,:,1:12),3);
SALT300_32_DN_avg = mean(SALT300_Series32(:,:,1:12),3);
AGE_32_DN_avg = mean(AGE_Series32(:,:,1:12),3);
AGE200_32_DN_avg = mean(AGE200_Series32(:,:,1:12),3);
AGE500_32_DN_avg = mean(AGE500_Series32(:,:,1:12),3);
AGE1000_32_DN_avg = mean(AGE1000_Series32(:,:,1:12),3);
AGE2000_32_DN_avg = mean(AGE2000_Series32(:,:,1:12),3);
WVEL100_32_DN_avg = mean(WVEL100_Series32(:,:,1:364),3);
WVEL100_32_DN_std = std(WVEL100_Series32(:,:,1:364),0,3);
WVEL190_32_DN_avg = mean(WVEL190_Series32(:,:,1:364),3);
WVEL190_32_DN_std = std(WVEL190_Series32(:,:,1:364),0,3);
WVEL290_32_DN_avg = mean(WVEL290_Series32(:,:,1:364),3);
WVEL290_32_DN_std = std(WVEL290_Series32(:,:,1:364),0,3);
TFLUX_32_DN_avg = mean(TFLUX_Series32(:,:,1:12),3);
SFLUX_32_DN_avg = mean(SFLUX_Series32(:,:,1:12),3);
ETAN_32_DN_avg = mean(ETAN_Series32(:,:,1:364),3);
ETAN_32_DN_std = std(ETAN_Series32(:,:,1:364),0,3);
CFLUX_32_DN_avg = mean(CFLUX_Series32(:,:,1:12),3);
OFLUX_32_DN_avg = mean(OFLUX_Series32(:,:,1:12),3);
MLD_32_DN_avg = mean(MLD_Series32(:,:,1:364),3);
MLD_32_DN_std = std(MLD_Series32(:,:,1:364),0,3);
DIC_32_DN_avg = mean(DIC_Series32(:,:,1:12),3);
ALK_32_DN_avg = mean(ALK_Series32(:,:,1:12),3);

THETA_32_JD_avg = mean(THETA_Series32(:,:,2:13),3);
SALT_32_JD_avg = mean(SALT_Series32(:,:,2:13),3);
THETA105_32_JD_avg = mean(THETA105_Series32(:,:,2:13),3);
SALT105_32_JD_avg = mean(SALT105_Series32(:,:,2:13),3);
THETA200_32_JD_avg = mean(THETA200_Series32(:,:,2:13),3);
SALT200_32_JD_avg = mean(SALT200_Series32(:,:,2:13),3);
THETA300_32_JD_avg = mean(THETA300_Series32(:,:,2:13),3);
SALT300_32_JD_avg = mean(SALT300_Series32(:,:,2:13),3);
AGE_32_JD_avg = mean(AGE_Series32(:,:,2:13),3);
AGE200_32_JD_avg = mean(AGE200_Series32(:,:,2:13),3);
AGE500_32_JD_avg = mean(AGE500_Series32(:,:,2:13),3);
AGE1000_32_JD_avg = mean(AGE1000_Series32(:,:,2:13),3);
AGE2000_32_JD_avg = mean(AGE2000_Series32(:,:,2:13),3);
WVEL100_32_JD_avg = mean(WVEL100_Series32(:,:,32:395),3);
WVEL100_32_JD_std = std(WVEL100_Series32(:,:,32:395),0,3);
WVEL190_32_JD_avg = mean(WVEL190_Series32(:,:,32:395),3);
WVEL190_32_JD_std = std(WVEL190_Series32(:,:,32:395),0,3);
WVEL290_32_JD_avg = mean(WVEL290_Series32(:,:,32:395),3);
WVEL290_32_JD_std = std(WVEL290_Series32(:,:,32:395),0,3);
TFLUX_32_JD_avg = mean(TFLUX_Series32(:,:,2:13),3);
SFLUX_32_JD_avg = mean(SFLUX_Series32(:,:,2:13),3);
ETAN_32_JD_avg = mean(ETAN_Series32(:,:,32:395),3);
ETAN_32_JD_std = std(ETAN_Series32(:,:,32:395),0,3);
CFLUX_32_JD_avg = mean(CFLUX_Series32(:,:,2:13),3);
OFLUX_32_JD_avg = mean(OFLUX_Series32(:,:,2:13),3);
MLD_32_JD_avg = mean(MLD_Series32(:,:,32:395),3);
MLD_32_JD_std = std(MLD_Series32(:,:,32:395),0,3);
DIC_32_JD_avg = mean(DIC_Series32(:,:,2:13),3);
ALK_32_JD_avg = mean(ALK_Series32(:,:,2:13),3);


[m32,n32] = size(THETA_32_DJF_avg);

parfor ii=1:m32
    for jj=1:n32
        if (HC(ii,jj,1)==0)
            THETA_32_DJF_avg(ii,jj) = 99999999999;
            SALT_32_DJF_avg(ii,jj) = 99999999999;
            TFLUX_32_DJF_avg(ii,jj) = 99999999999;
            SFLUX_32_DJF_avg(ii,jj) = 99999999999;
            ETAN_32_DJF_avg(ii,jj) = 99999999999;
            ETAN_32_DJF_std(ii,jj) = 99999999999;
            CFLUX_32_DJF_avg(ii,jj) = 99999999999;
            OFLUX_32_DJF_avg(ii,jj) = 99999999999;
            MLD_32_DJF_avg(ii,jj) = 99999999999;
            MLD_32_DJF_std(ii,jj) = 99999999999;
            DIC_32_DJF_avg(ii,jj) = 99999999999;
            ALK_32_DJF_avg(ii,jj) = 99999999999;
            THETA_32_JFM_avg(ii,jj) = 99999999999;
            SALT_32_JFM_avg(ii,jj) = 99999999999;
            AGE_32_JFM_avg(ii,jj) = 99999999999;
            TFLUX_32_JFM_avg(ii,jj) = 99999999999;
            SFLUX_32_JFM_avg(ii,jj) = 99999999999;
            ETAN_32_JFM_avg(ii,jj) = 99999999999;
            ETAN_32_JFM_std(ii,jj) = 99999999999;
            CFLUX_32_JFM_avg(ii,jj) = 99999999999;
            OFLUX_32_JFM_avg(ii,jj) = 99999999999;
            MLD_32_JFM_avg(ii,jj) = 99999999999;
            MLD_32_JFM_std(ii,jj) = 99999999999;
            DIC_32_JFM_avg(ii,jj) = 99999999999;
            ALK_32_JFM_avg(ii,jj) = 99999999999;
            THETA_32_DJFMAM_avg(ii,jj) = 99999999999;
            SALT_32_DJFMAM_avg(ii,jj) = 99999999999;
            AGE_32_DJFMAM_avg(ii,jj) = 99999999999;
            TFLUX_32_DJFMAM_avg(ii,jj) = 99999999999;
            SFLUX_32_DJFMAM_avg(ii,jj) = 99999999999;
            ETAN_32_DJFMAM_avg(ii,jj) = 99999999999;
            ETAN_32_DJFMAM_std(ii,jj) = 99999999999;
            CFLUX_32_DJFMAM_avg(ii,jj) = 99999999999;
            OFLUX_32_DJFMAM_avg(ii,jj) = 99999999999;
            MLD_32_DJFMAM_avg(ii,jj) = 99999999999;
            MLD_32_DJFMAM_std(ii,jj) = 99999999999;
            DIC_32_DJFMAM_avg(ii,jj) = 99999999999;
            ALK_32_DJFMAM_avg(ii,jj) = 99999999999;
            THETA_32_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT_32_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE_32_JFMAMJ_avg(ii,jj) = 99999999999;
            TFLUX_32_JFMAMJ_avg(ii,jj) = 99999999999;
            SFLUX_32_JFMAMJ_avg(ii,jj) = 99999999999;
            ETAN_32_JFMAMJ_avg(ii,jj) = 99999999999;
            ETAN_32_JFMAMJ_std(ii,jj) = 99999999999;
            CFLUX_32_JFMAMJ_avg(ii,jj) = 99999999999;
            OFLUX_32_JFMAMJ_avg(ii,jj) = 99999999999;
            MLD_32_JFMAMJ_avg(ii,jj) = 99999999999;
            MLD_32_JFMAMJ_std(ii,jj) = 99999999999;
            DIC_32_JFMAMJ_avg(ii,jj) = 99999999999;
            ALK_32_JFMAMJ_avg(ii,jj) = 99999999999;
            THETA_32_DN_avg(ii,jj) = 99999999999;
            SALT_32_DN_avg(ii,jj) = 99999999999;
            AGE_32_DN_avg(ii,jj) = 99999999999;
            TFLUX_32_DN_avg(ii,jj) = 99999999999;
            SFLUX_32_DN_avg(ii,jj) = 99999999999;
            ETAN_32_DN_avg(ii,jj) = 99999999999;
            ETAN_32_DN_std(ii,jj) = 99999999999;
            CFLUX_32_DN_avg(ii,jj) = 99999999999;
            OFLUX_32_DN_avg(ii,jj) = 99999999999;
            MLD_32_DN_avg(ii,jj) = 99999999999;
            MLD_32_DN_std(ii,jj) = 99999999999;
            DIC_32_DN_avg(ii,jj) = 99999999999;
            ALK_32_DN_avg(ii,jj) = 99999999999;
            THETA_32_JD_avg(ii,jj) = 99999999999;
            SALT_32_JD_avg(ii,jj) = 99999999999;
            AGE_32_JD_avg(ii,jj) = 99999999999;
            TFLUX_32_JD_avg(ii,jj) = 99999999999;
            SFLUX_32_JD_avg(ii,jj) = 99999999999;
            ETAN_32_JD_avg(ii,jj) = 99999999999;
            ETAN_32_JD_std(ii,jj) = 99999999999;
            CFLUX_32_JD_avg(ii,jj) = 99999999999;
            OFLUX_32_JD_avg(ii,jj) = 99999999999;
            MLD_32_JD_avg(ii,jj) = 99999999999;
            MLD_32_JD_std(ii,jj) = 99999999999;
            DIC_32_JD_avg(ii,jj) = 99999999999;
            ALK_32_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,13)==0)
            THETA105_32_DJF_avg(ii,jj) = 99999999999;
            SALT105_32_DJF_avg(ii,jj) = 99999999999;
            WVEL100_32_DJF_avg(ii,jj) = 99999999999;
            WVEL100_32_DJF_std(ii,jj) = 99999999999;
            THETA105_32_JFM_avg(ii,jj) = 99999999999;
            SALT105_32_JFM_avg(ii,jj) = 99999999999;
            WVEL100_32_JFM_avg(ii,jj) = 99999999999;
            WVEL100_32_JFM_std(ii,jj) = 99999999999;
            THETA105_32_DJFMAM_avg(ii,jj) = 99999999999;
            SALT105_32_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL100_32_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL100_32_DJFMAM_std(ii,jj) = 99999999999;
            THETA105_32_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT105_32_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL100_32_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL100_32_JFMAMJ_std(ii,jj) = 99999999999;
            THETA105_32_DN_avg(ii,jj) = 99999999999;
            SALT105_32_DN_avg(ii,jj) = 99999999999;
            WVEL100_32_DN_avg(ii,jj) = 99999999999;
            WVEL100_32_DN_std(ii,jj) = 99999999999;
            THETA105_32_JD_avg(ii,jj) = 99999999999;
            SALT105_32_JD_avg(ii,jj) = 99999999999;
            WVEL100_32_JD_avg(ii,jj) = 99999999999;
            WVEL100_32_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,20)==0)
            THETA200_32_DJF_avg(ii,jj) = 99999999999;
            SALT200_32_DJF_avg(ii,jj) = 99999999999;
            AGE200_32_DJF_avg(ii,jj) = 99999999999;
            WVEL190_32_DJF_avg(ii,jj) = 99999999999;
            WVEL190_32_DJF_std(ii,jj) = 99999999999;
            THETA200_32_JFM_avg(ii,jj) = 99999999999;
            SALT200_32_JFM_avg(ii,jj) = 99999999999;
            AGE200_32_JFM_avg(ii,jj) = 99999999999;
            WVEL190_32_JFM_avg(ii,jj) = 99999999999;
            WVEL190_32_JFM_std(ii,jj) = 99999999999;
            THETA200_32_DJFMAM_avg(ii,jj) = 99999999999;
            SALT200_32_DJFMAM_avg(ii,jj) = 99999999999;
            AGE200_32_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL190_32_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL190_32_DJFMAM_std(ii,jj) = 99999999999;
            THETA200_32_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT200_32_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE200_32_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL190_32_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL190_32_JFMAMJ_std(ii,jj) = 99999999999;
            THETA200_32_DN_avg(ii,jj) = 99999999999;
            SALT200_32_DN_avg(ii,jj) = 99999999999;
            AGE200_32_DN_avg(ii,jj) = 99999999999;
            WVEL190_32_DN_avg(ii,jj) = 99999999999;
            WVEL190_32_DN_std(ii,jj) = 99999999999;
            THETA200_32_JD_avg(ii,jj) = 99999999999;
            SALT200_32_JD_avg(ii,jj) = 99999999999;
            AGE200_32_JD_avg(ii,jj) = 99999999999;
            WVEL190_32_JD_avg(ii,jj) = 99999999999;
            WVEL190_32_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,25)==0)
            THETA300_32_DJF_avg(ii,jj) = 99999999999;
            SALT300_32_DJF_avg(ii,jj) = 99999999999;
            WVEL290_32_DJF_avg(ii,jj) = 99999999999;
            WVEL290_32_DJF_std(ii,jj) = 99999999999;
            THETA300_32_JFM_avg(ii,jj) = 99999999999;
            SALT300_32_JFM_avg(ii,jj) = 99999999999;
            WVEL290_32_JFM_avg(ii,jj) = 99999999999;
            WVEL290_32_JFM_std(ii,jj) = 99999999999;
            THETA300_32_DJFMAM_avg(ii,jj) = 99999999999;
            SALT300_32_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL290_32_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL290_32_DJFMAM_std(ii,jj) = 99999999999;
            THETA300_32_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT300_32_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL290_32_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL290_32_JFMAMJ_std(ii,jj) = 99999999999;
            THETA300_32_DN_avg(ii,jj) = 99999999999;
            SALT300_32_DN_avg(ii,jj) = 99999999999;
            WVEL290_32_DN_avg(ii,jj) = 99999999999;
            WVEL290_32_DN_std(ii,jj) = 99999999999;
            THETA300_32_JD_avg(ii,jj) = 99999999999;
            SALT300_32_JD_avg(ii,jj) = 99999999999;
            WVEL290_32_JD_avg(ii,jj) = 99999999999;
            WVEL290_32_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,30)==0)
            AGE500_32_DJF_avg(ii,jj) = 99999999999;
            AGE500_32_JFM_avg(ii,jj) = 99999999999;
            AGE500_32_DJFMAM_avg(ii,jj) = 99999999999;
            AGE500_32_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE500_32_DN_avg(ii,jj) = 99999999999;
            AGE500_32_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,36)==0)
            AGE1000_32_DJF_avg(ii,jj) = 99999999999;
            AGE1000_32_JFM_avg(ii,jj) = 99999999999;
            AGE1000_32_DJFMAM_avg(ii,jj) = 99999999999;
            AGE1000_32_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE1000_32_DN_avg(ii,jj) = 99999999999;
            AGE1000_32_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,42)==0)
            AGE2000_32_DJF_avg(ii,jj) = 99999999999;
            AGE2000_32_JFM_avg(ii,jj) = 99999999999;
            AGE2000_32_DJFMAM_avg(ii,jj) = 99999999999;
            AGE2000_32_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE2000_32_DN_avg(ii,jj) = 99999999999;
            AGE2000_32_JD_avg(ii,jj) = 99999999999;
        end
    end
end


clear char32* temp32* *Series32 n32 m32 *field32 ii
save AB32_output

fprintf('finished 32 \n')

%% end 32


