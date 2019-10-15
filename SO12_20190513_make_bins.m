
%% 122

tfield122 = 1;
sfield122 = 2;
wfield122 = 3;
tffield122 = 1;
sffield122 = 2;
cfield122 = 3;
ofield122 = 4;
efield122 = 1;
mfield122 = 4;
dfield122 = 1;
afield122 = 2;
agfield122 = 10;

THETA_Series122 = zeros(756,512,13);
THETA105_Series122 = zeros(756,512,13);
THETA200_Series122 = zeros(756,512,13);
THETA300_Series122 = zeros(756,512,13);
SALT_Series122 = zeros(756,512,13);
SALT105_Series122 = zeros(756,512,13);
SALT200_Series122 = zeros(756,512,13);
SALT300_Series122 = zeros(756,512,13);
AGE_Series122 = zeros(756,512,13);
AGE200_Series122 = zeros(756,512,13);
AGE500_Series122 = zeros(756,512,13);
AGE1000_Series122 = zeros(756,512,13);
AGE2000_Series122 = zeros(756,512,13);
WVEL100_Series122 = zeros(756,512,395);
WVEL190_Series122 = zeros(756,512,395);
WVEL290_Series122 = zeros(756,512,395);
DIC_Series122 = zeros(756,512,13);
ALK_Series122 = zeros(756,512,13);
TFLUX_Series122 = zeros(756,512,13);
SFLUX_Series122 = zeros(756,512,13);
CFLUX_Series122 = zeros(756,512,13);
OFLUX_Series122 = zeros(756,512,13);
ETAN_Series122 = zeros(756,512,395);
MLD_Series122 = zeros(756,512,395);

HC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag/';

for ii=1:2
    char122state = [str,'diag_vel.0000000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    WVEL100_Series122(:,:,ii) = temp122state(:,:,2,wfield122);
    WVEL190_Series122(:,:,ii) = temp122state(:,:,3,wfield122);
    WVEL290_Series122(:,:,ii) = temp122state(:,:,4,wfield122);
    clear temp122state
    char122surf = [str,'diag_surf.0000000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,efield122); 
    MLD_Series122(:,:,ii) = temp122surf(:,:,mfield122);
    clear temp122surf
end

for ii=3:27
    char122state = [str,'diag_vel.000000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    WVEL100_Series122(:,:,ii) = temp122state(:,:,2,wfield122);
    WVEL190_Series122(:,:,ii) = temp122state(:,:,3,wfield122);
    WVEL290_Series122(:,:,ii) = temp122state(:,:,4,wfield122);
    clear temp122state
    char122surf = [str,'diag_surf.000000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,efield122); 
    MLD_Series122(:,:,ii) = temp122surf(:,:,mfield122);
    clear temp122surf
end

for ii=28:277
    char122state = [str,'diag_vel.00000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    WVEL100_Series122(:,:,ii) = temp122state(:,:,2,wfield122);
    WVEL190_Series122(:,:,ii) = temp122state(:,:,3,wfield122);
    WVEL290_Series122(:,:,ii) = temp122state(:,:,4,wfield122);
    clear temp122state
    char122surf = [str,'diag_surf.00000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,efield122); 
    MLD_Series122(:,:,ii) = temp122surf(:,:,mfield122);
    clear temp122surf
end

for ii=278:395
    char122state = [str,'diag_vel.0000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    WVEL100_Series122(:,:,ii) = temp122state(:,:,2,wfield122);
    WVEL190_Series122(:,:,ii) = temp122state(:,:,3,wfield122);
    WVEL290_Series122(:,:,ii) = temp122state(:,:,4,wfield122);
    clear temp122state
    char122surf = [str,'diag_surf.0000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,efield122); 
    MLD_Series122(:,:,ii) = temp122surf(:,:,mfield122);
    clear temp122surf
end

for ii=1:9
    char122state = [str,'diag_state.00000',num2str(10950*ii)];
    temp122state = rdmds(char122state);
    THETA_Series122(:,:,ii) = temp122state(:,:,depth122,tfield122);
    SALT_Series122(:,:,ii) = temp122state(:,:,depth122,sfield122);
    THETA105_Series122(:,:,ii) = temp122state(:,:,26,tfield122);
    SALT105_Series122(:,:,ii) = temp122state(:,:,26,sfield122);
    THETA200_Series122(:,:,ii) = temp122state(:,:,40,tfield122);
    SALT200_Series122(:,:,ii) = temp122state(:,:,40,sfield122);
    THETA300_Series122(:,:,ii) = temp122state(:,:,50,tfield122);
    SALT300_Series122(:,:,ii) = temp122state(:,:,50,sfield122);
    clear temp122state
    char122airsea = [str,'diag_airsea.00000',num2str(10950*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series122(:,:,ii) = temp122airsea(:,:,tffield122);
    SFLUX_Series122(:,:,ii) = temp122airsea(:,:,sffield122);
    CFLUX_Series122(:,:,ii) = temp122airsea(:,:,cfield122);
    OFLUX_Series122(:,:,ii) = temp122airsea(:,:,ofield122);
    clear temp122airsea
    char122bgc = [str,'diag_bgc.00000',num2str(10950*ii)];
    temp122bgc = rdmds(char122bgc); 
    DIC_Series122(:,:,ii) = temp122bgc(:,:,1,dfield122);
    ALK_Series122(:,:,ii) = temp122bgc(:,:,1,afield122);
    AGE_Series122(:,:,ii) = temp122bgc(:,:,depth122,agfield122);
    AGE200_Series122(:,:,ii) = temp122bgc(:,:,40,agfield122);
    AGE500_Series122(:,:,ii) = temp122bgc(:,:,60,agfield122);
    AGE1000_Series122(:,:,ii) = temp122bgc(:,:,72,agfield122);
    AGE2000_Series122(:,:,ii) = temp122bgc(:,:,84,agfield122);
    clear temp122bgc
end

for ii=10:13
    char122state = [str,'diag_state.0000',num2str(10950*ii)];
    temp122state = rdmds(char122state);
    THETA_Series122(:,:,ii) = temp122state(:,:,depth122,tfield122);
    SALT_Series122(:,:,ii) = temp122state(:,:,depth122,sfield122);
    THETA105_Series122(:,:,ii) = temp122state(:,:,26,tfield122);
    SALT105_Series122(:,:,ii) = temp122state(:,:,26,sfield122);
    THETA200_Series122(:,:,ii) = temp122state(:,:,40,tfield122);
    SALT200_Series122(:,:,ii) = temp122state(:,:,40,sfield122);
    THETA300_Series122(:,:,ii) = temp122state(:,:,50,tfield122);
    SALT300_Series122(:,:,ii) = temp122state(:,:,50,sfield122);
    clear temp122state
    char122airsea = [str,'diag_airsea.0000',num2str(10950*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series122(:,:,ii) = temp122airsea(:,:,tffield122);
    SFLUX_Series122(:,:,ii) = temp122airsea(:,:,sffield122);
    CFLUX_Series122(:,:,ii) = temp122airsea(:,:,cfield122);
    OFLUX_Series122(:,:,ii) = temp122airsea(:,:,ofield122);
    clear temp122airsea
    char122bgc = [str,'diag_bgc.0000',num2str(10950*ii)];
    temp122bgc = rdmds(char122bgc); 
    DIC_Series122(:,:,ii) = temp122bgc(:,:,1,dfield122);
    ALK_Series122(:,:,ii) = temp122bgc(:,:,1,afield122);
    AGE_Series122(:,:,ii) = temp122bgc(:,:,depth122,agfield122);
    AGE200_Series122(:,:,ii) = temp122bgc(:,:,40,agfield122);
    AGE500_Series122(:,:,ii) = temp122bgc(:,:,60,agfield122);
    AGE1000_Series122(:,:,ii) = temp122bgc(:,:,72,agfield122);
    AGE2000_Series122(:,:,ii) = temp122bgc(:,:,84,agfield122);
    clear temp122bgc
end

THETA_122_DJF_avg = mean(THETA_Series122(:,:,1:3),3);
SALT_122_DJF_avg = mean(SALT_Series122(:,:,1:3),3);
THETA105_122_DJF_avg = mean(THETA105_Series122(:,:,1:3),3);
SALT105_122_DJF_avg = mean(SALT105_Series122(:,:,1:3),3);
THETA200_122_DJF_avg = mean(THETA200_Series122(:,:,1:3),3);
SALT200_122_DJF_avg = mean(SALT200_Series122(:,:,1:3),3);
THETA300_122_DJF_avg = mean(THETA300_Series122(:,:,1:3),3);
SALT300_122_DJF_avg = mean(SALT300_Series122(:,:,1:3),3);
AGE_122_DJF_avg = mean(AGE_Series122(:,:,1:3),3);
AGE200_122_DJF_avg = mean(AGE200_Series122(:,:,1:3),3);
AGE500_122_DJF_avg = mean(AGE500_Series122(:,:,1:3),3);
AGE1000_122_DJF_avg = mean(AGE1000_Series122(:,:,1:3),3);
AGE2000_122_DJF_avg = mean(AGE2000_Series122(:,:,1:3),3);
WVEL100_122_DJF_avg = mean(WVEL100_Series122(:,:,1:91),3);
WVEL100_122_DJF_std = std(WVEL100_Series122(:,:,1:91),0,3);
WVEL190_122_DJF_avg = mean(WVEL190_Series122(:,:,1:91),3);
WVEL190_122_DJF_std = std(WVEL190_Series122(:,:,1:91),0,3);
WVEL290_122_DJF_avg = mean(WVEL290_Series122(:,:,1:91),3);
WVEL290_122_DJF_std = std(WVEL290_Series122(:,:,1:91),0,3);
TFLUX_122_DJF_avg = mean(TFLUX_Series122(:,:,1:3),3);
SFLUX_122_DJF_avg = mean(SFLUX_Series122(:,:,1:3),3);
ETAN_122_DJF_avg = mean(ETAN_Series122(:,:,1:91),3);
ETAN_122_DJF_std = std(ETAN_Series122(:,:,1:91),0,3);
CFLUX_122_DJF_avg = mean(CFLUX_Series122(:,:,1:3),3);
OFLUX_122_DJF_avg = mean(OFLUX_Series122(:,:,1:3),3);
MLD_122_DJF_avg = mean(MLD_Series122(:,:,1:91),3);
MLD_122_DJF_std = std(MLD_Series122(:,:,1:91),0,3);
DIC_122_DJF_avg = mean(DIC_Series122(:,:,1:3),3);
ALK_122_DJF_avg = mean(ALK_Series122(:,:,1:3),3);

THETA_122_JFM_avg = mean(THETA_Series122(:,:,2:4),3);
SALT_122_JFM_avg = mean(SALT_Series122(:,:,2:4),3);
THETA105_122_JFM_avg = mean(THETA105_Series122(:,:,2:4),3);
SALT105_122_JFM_avg = mean(SALT105_Series122(:,:,2:4),3);
THETA200_122_JFM_avg = mean(THETA200_Series122(:,:,2:4),3);
SALT200_122_JFM_avg = mean(SALT200_Series122(:,:,2:4),3);
THETA300_122_JFM_avg = mean(THETA300_Series122(:,:,2:4),3);
SALT300_122_JFM_avg = mean(SALT300_Series122(:,:,2:4),3);
WVEL100_122_JFM_avg = mean(WVEL100_Series122(:,:,32:122),3);
WVEL100_122_JFM_std = std(WVEL100_Series122(:,:,32:122),0,3);
WVEL190_122_JFM_avg = mean(WVEL190_Series122(:,:,32:122),3);
WVEL190_122_JFM_std = std(WVEL190_Series122(:,:,32:122),0,3);
WVEL290_122_JFM_avg = mean(WVEL290_Series122(:,:,32:122),3);
WVEL290_122_JFM_std = std(WVEL290_Series122(:,:,32:122),0,3);
AGE_122_JFM_avg = mean(AGE_Series122(:,:,2:4),3);
AGE200_122_JFM_avg = mean(AGE200_Series122(:,:,2:4),3);
AGE500_122_JFM_avg = mean(AGE500_Series122(:,:,2:4),3);
AGE1000_122_JFM_avg = mean(AGE1000_Series122(:,:,2:4),3);
AGE2000_122_JFM_avg = mean(AGE2000_Series122(:,:,2:4),3);
TFLUX_122_JFM_avg = mean(TFLUX_Series122(:,:,2:4),3);
SFLUX_122_JFM_avg = mean(SFLUX_Series122(:,:,2:4),3);
ETAN_122_JFM_avg = mean(ETAN_Series122(:,:,32:122),3);
ETAN_122_JFM_std = std(ETAN_Series122(:,:,32:122),0,3);
CFLUX_122_JFM_avg = mean(CFLUX_Series122(:,:,2:4),3);
OFLUX_122_JFM_avg = mean(OFLUX_Series122(:,:,2:4),3);
MLD_122_JFM_avg = mean(MLD_Series122(:,:,32:122),3);
MLD_122_JFM_std = std(MLD_Series122(:,:,32:122),0,3);
DIC_122_JFM_avg = mean(DIC_Series122(:,:,2:4),3);
ALK_122_JFM_avg = mean(ALK_Series122(:,:,2:4),3);

THETA_122_DJFMAM_avg = mean(THETA_Series122(:,:,1:6),3);
SALT_122_DJFMAM_avg = mean(SALT_Series122(:,:,1:6),3);
THETA105_122_DJFMAM_avg = mean(THETA105_Series122(:,:,1:6),3);
SALT105_122_DJFMAM_avg = mean(SALT105_Series122(:,:,1:6),3);
THETA200_122_DJFMAM_avg = mean(THETA200_Series122(:,:,1:6),3);
SALT200_122_DJFMAM_avg = mean(SALT200_Series122(:,:,1:6),3);
THETA300_122_DJFMAM_avg = mean(THETA300_Series122(:,:,1:6),3);
SALT300_122_DJFMAM_avg = mean(SALT300_Series122(:,:,1:6),3);
AGE_122_DJFMAM_avg = mean(AGE_Series122(:,:,1:6),3);
AGE200_122_DJFMAM_avg = mean(AGE200_Series122(:,:,1:6),3);
AGE500_122_DJFMAM_avg = mean(AGE500_Series122(:,:,1:6),3);
AGE1000_122_DJFMAM_avg = mean(AGE1000_Series122(:,:,1:6),3);
AGE2000_122_DJFMAM_avg = mean(AGE2000_Series122(:,:,1:6),3);
WVEL100_122_DJFMAM_avg = mean(WVEL100_Series122(:,:,1:182),3);
WVEL100_122_DJFMAM_std = std(WVEL100_Series122(:,:,1:182),0,3);
WVEL190_122_DJFMAM_avg = mean(WVEL190_Series122(:,:,1:182),3);
WVEL190_122_DJFMAM_std = std(WVEL190_Series122(:,:,1:182),0,3);
WVEL290_122_DJFMAM_avg = mean(WVEL290_Series122(:,:,1:182),3);
WVEL290_122_DJFMAM_std = std(WVEL290_Series122(:,:,1:182),0,3);
TFLUX_122_DJFMAM_avg = mean(TFLUX_Series122(:,:,1:6),3);
SFLUX_122_DJFMAM_avg = mean(SFLUX_Series122(:,:,1:6),3);
ETAN_122_DJFMAM_avg = mean(ETAN_Series122(:,:,1:182),3);
ETAN_122_DJFMAM_std = std(ETAN_Series122(:,:,1:182),0,3);
CFLUX_122_DJFMAM_avg = mean(CFLUX_Series122(:,:,1:6),3);
OFLUX_122_DJFMAM_avg = mean(OFLUX_Series122(:,:,1:6),3);
MLD_122_DJFMAM_avg = mean(MLD_Series122(:,:,1:182),3);
MLD_122_DJFMAM_std = std(MLD_Series122(:,:,1:182),0,3);
DIC_122_DJFMAM_avg = mean(DIC_Series122(:,:,1:6),3);
ALK_122_DJFMAM_avg = mean(ALK_Series122(:,:,1:6),3);

THETA_122_JFMAMJ_avg = mean(THETA_Series122(:,:,2:7),3);
SALT_122_JFMAMJ_avg = mean(SALT_Series122(:,:,2:7),3);
THETA105_122_JFMAMJ_avg = mean(THETA105_Series122(:,:,2:7),3);
SALT105_122_JFMAMJ_avg = mean(SALT105_Series122(:,:,2:7),3);
THETA200_122_JFMAMJ_avg = mean(THETA200_Series122(:,:,2:7),3);
SALT200_122_JFMAMJ_avg = mean(SALT200_Series122(:,:,2:7),3);
THETA300_122_JFMAMJ_avg = mean(THETA300_Series122(:,:,2:7),3);
SALT300_122_JFMAMJ_avg = mean(SALT300_Series122(:,:,2:7),3);
AGE_122_JFMAMJ_avg = mean(AGE_Series122(:,:,2:7),3);
AGE200_122_JFMAMJ_avg = mean(AGE200_Series122(:,:,2:7),3);
AGE500_122_JFMAMJ_avg = mean(AGE500_Series122(:,:,2:7),3);
AGE1000_122_JFMAMJ_avg = mean(AGE1000_Series122(:,:,2:7),3);
AGE2000_122_JFMAMJ_avg = mean(AGE2000_Series122(:,:,2:7),3);
WVEL100_122_JFMAMJ_avg = mean(WVEL100_Series122(:,:,32:213),3);
WVEL100_122_JFMAMJ_std = std(WVEL100_Series122(:,:,32:213),0,3);
WVEL190_122_JFMAMJ_avg = mean(WVEL190_Series122(:,:,32:213),3);
WVEL190_122_JFMAMJ_std = std(WVEL190_Series122(:,:,32:213),0,3);
WVEL290_122_JFMAMJ_avg = mean(WVEL290_Series122(:,:,32:213),3);
WVEL290_122_JFMAMJ_std = std(WVEL290_Series122(:,:,32:213),0,3);
TFLUX_122_JFMAMJ_avg = mean(TFLUX_Series122(:,:,2:7),3);
SFLUX_122_JFMAMJ_avg = mean(SFLUX_Series122(:,:,2:7),3);
ETAN_122_JFMAMJ_avg = mean(ETAN_Series122(:,:,32:213),3);
ETAN_122_JFMAMJ_std = std(ETAN_Series122(:,:,32:213),0,3);
CFLUX_122_JFMAMJ_avg = mean(CFLUX_Series122(:,:,2:7),3);
OFLUX_122_JFMAMJ_avg = mean(OFLUX_Series122(:,:,2:7),3);
MLD_122_JFMAMJ_avg = mean(MLD_Series122(:,:,32:213),3);
MLD_122_JFMAMJ_std = std(MLD_Series122(:,:,32:213),0,3);
DIC_122_JFMAMJ_avg = mean(DIC_Series122(:,:,2:7),3);
ALK_122_JFMAMJ_avg = mean(ALK_Series122(:,:,2:7),3);

THETA_122_DN_avg = mean(THETA_Series122(:,:,1:12),3);
SALT_122_DN_avg = mean(SALT_Series122(:,:,1:12),3);
THETA105_122_DN_avg = mean(THETA105_Series122(:,:,1:12),3);
SALT105_122_DN_avg = mean(SALT105_Series122(:,:,1:12),3);
THETA200_122_DN_avg = mean(THETA200_Series122(:,:,1:12),3);
SALT200_122_DN_avg = mean(SALT200_Series122(:,:,1:12),3);
THETA300_122_DN_avg = mean(THETA300_Series122(:,:,1:12),3);
SALT300_122_DN_avg = mean(SALT300_Series122(:,:,1:12),3);
AGE_122_DN_avg = mean(AGE_Series122(:,:,1:12),3);
AGE200_122_DN_avg = mean(AGE200_Series122(:,:,1:12),3);
AGE500_122_DN_avg = mean(AGE500_Series122(:,:,1:12),3);
AGE1000_122_DN_avg = mean(AGE1000_Series122(:,:,1:12),3);
AGE2000_122_DN_avg = mean(AGE2000_Series122(:,:,1:12),3);
WVEL100_122_DN_avg = mean(WVEL100_Series122(:,:,1:364),3);
WVEL100_122_DN_std = std(WVEL100_Series122(:,:,1:364),0,3);
WVEL190_122_DN_avg = mean(WVEL190_Series122(:,:,1:364),3);
WVEL190_122_DN_std = std(WVEL190_Series122(:,:,1:364),0,3);
WVEL290_122_DN_avg = mean(WVEL290_Series122(:,:,1:364),3);
WVEL290_122_DN_std = std(WVEL290_Series122(:,:,1:364),0,3);
TFLUX_122_DN_avg = mean(TFLUX_Series122(:,:,1:12),3);
SFLUX_122_DN_avg = mean(SFLUX_Series122(:,:,1:12),3);
ETAN_122_DN_avg = mean(ETAN_Series122(:,:,1:364),3);
ETAN_122_DN_std = std(ETAN_Series122(:,:,1:364),0,3);
CFLUX_122_DN_avg = mean(CFLUX_Series122(:,:,1:12),3);
OFLUX_122_DN_avg = mean(OFLUX_Series122(:,:,1:12),3);
MLD_122_DN_avg = mean(MLD_Series122(:,:,1:364),3);
MLD_122_DN_std = std(MLD_Series122(:,:,1:364),0,3);
DIC_122_DN_avg = mean(DIC_Series122(:,:,1:12),3);
ALK_122_DN_avg = mean(ALK_Series122(:,:,1:12),3);

THETA_122_JD_avg = mean(THETA_Series122(:,:,2:13),3);
SALT_122_JD_avg = mean(SALT_Series122(:,:,2:13),3);
THETA105_122_JD_avg = mean(THETA105_Series122(:,:,2:13),3);
SALT105_122_JD_avg = mean(SALT105_Series122(:,:,2:13),3);
THETA200_122_JD_avg = mean(THETA200_Series122(:,:,2:13),3);
SALT200_122_JD_avg = mean(SALT200_Series122(:,:,2:13),3);
THETA300_122_JD_avg = mean(THETA300_Series122(:,:,2:13),3);
SALT300_122_JD_avg = mean(SALT300_Series122(:,:,2:13),3);
AGE_122_JD_avg = mean(AGE_Series122(:,:,2:13),3);
AGE200_122_JD_avg = mean(AGE200_Series122(:,:,2:13),3);
AGE500_122_JD_avg = mean(AGE500_Series122(:,:,2:13),3);
AGE1000_122_JD_avg = mean(AGE1000_Series122(:,:,2:13),3);
AGE2000_122_JD_avg = mean(AGE2000_Series122(:,:,2:13),3);
WVEL100_122_JD_avg = mean(WVEL100_Series122(:,:,32:395),3);
WVEL100_122_JD_std = std(WVEL100_Series122(:,:,32:395),0,3);
WVEL190_122_JD_avg = mean(WVEL190_Series122(:,:,32:395),3);
WVEL190_122_JD_std = std(WVEL190_Series122(:,:,32:395),0,3);
WVEL290_122_JD_avg = mean(WVEL290_Series122(:,:,32:395),3);
WVEL290_122_JD_std = std(WVEL290_Series122(:,:,32:395),0,3);
TFLUX_122_JD_avg = mean(TFLUX_Series122(:,:,2:13),3);
SFLUX_122_JD_avg = mean(SFLUX_Series122(:,:,2:13),3);
ETAN_122_JD_avg = mean(ETAN_Series122(:,:,32:395),3);
ETAN_122_JD_std = std(ETAN_Series122(:,:,32:395),0,3);
CFLUX_122_JD_avg = mean(CFLUX_Series122(:,:,2:13),3);
OFLUX_122_JD_avg = mean(OFLUX_Series122(:,:,2:13),3);
MLD_122_JD_avg = mean(MLD_Series122(:,:,32:395),3);
MLD_122_JD_std = std(MLD_Series122(:,:,32:395),0,3);
DIC_122_JD_avg = mean(DIC_Series122(:,:,2:13),3);
ALK_122_JD_avg = mean(ALK_Series122(:,:,2:13),3);


[m122,n122] = size(THETA_122_DJF_avg);

parfor ii=1:m122
    for jj=1:n122
        if (HC(ii,jj,1)==0)
            THETA_122_DJF_avg(ii,jj) = 99999999999;
            SALT_122_DJF_avg(ii,jj) = 99999999999;
            TFLUX_122_DJF_avg(ii,jj) = 99999999999;
            SFLUX_122_DJF_avg(ii,jj) = 99999999999;
            ETAN_122_DJF_avg(ii,jj) = 99999999999;
            ETAN_122_DJF_std(ii,jj) = 99999999999;
            CFLUX_122_DJF_avg(ii,jj) = 99999999999;
            OFLUX_122_DJF_avg(ii,jj) = 99999999999;
            MLD_122_DJF_avg(ii,jj) = 99999999999;
            MLD_122_DJF_std(ii,jj) = 99999999999;
            DIC_122_DJF_avg(ii,jj) = 99999999999;
            ALK_122_DJF_avg(ii,jj) = 99999999999;
            THETA_122_JFM_avg(ii,jj) = 99999999999;
            SALT_122_JFM_avg(ii,jj) = 99999999999;
            AGE_122_JFM_avg(ii,jj) = 99999999999;
            TFLUX_122_JFM_avg(ii,jj) = 99999999999;
            SFLUX_122_JFM_avg(ii,jj) = 99999999999;
            ETAN_122_JFM_avg(ii,jj) = 99999999999;
            ETAN_122_JFM_std(ii,jj) = 99999999999;
            CFLUX_122_JFM_avg(ii,jj) = 99999999999;
            OFLUX_122_JFM_avg(ii,jj) = 99999999999;
            MLD_122_JFM_avg(ii,jj) = 99999999999;
            MLD_122_JFM_std(ii,jj) = 99999999999;
            DIC_122_JFM_avg(ii,jj) = 99999999999;
            ALK_122_JFM_avg(ii,jj) = 99999999999;
            THETA_122_DJFMAM_avg(ii,jj) = 99999999999;
            SALT_122_DJFMAM_avg(ii,jj) = 99999999999;
            AGE_122_DJFMAM_avg(ii,jj) = 99999999999;
            TFLUX_122_DJFMAM_avg(ii,jj) = 99999999999;
            SFLUX_122_DJFMAM_avg(ii,jj) = 99999999999;
            ETAN_122_DJFMAM_avg(ii,jj) = 99999999999;
            ETAN_122_DJFMAM_std(ii,jj) = 99999999999;
            CFLUX_122_DJFMAM_avg(ii,jj) = 99999999999;
            OFLUX_122_DJFMAM_avg(ii,jj) = 99999999999;
            MLD_122_DJFMAM_avg(ii,jj) = 99999999999;
            MLD_122_DJFMAM_std(ii,jj) = 99999999999;
            DIC_122_DJFMAM_avg(ii,jj) = 99999999999;
            ALK_122_DJFMAM_avg(ii,jj) = 99999999999;
            THETA_122_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT_122_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE_122_JFMAMJ_avg(ii,jj) = 99999999999;
            TFLUX_122_JFMAMJ_avg(ii,jj) = 99999999999;
            SFLUX_122_JFMAMJ_avg(ii,jj) = 99999999999;
            ETAN_122_JFMAMJ_avg(ii,jj) = 99999999999;
            ETAN_122_JFMAMJ_std(ii,jj) = 99999999999;
            CFLUX_122_JFMAMJ_avg(ii,jj) = 99999999999;
            OFLUX_122_JFMAMJ_avg(ii,jj) = 99999999999;
            MLD_122_JFMAMJ_avg(ii,jj) = 99999999999;
            MLD_122_JFMAMJ_std(ii,jj) = 99999999999;
            DIC_122_JFMAMJ_avg(ii,jj) = 99999999999;
            ALK_122_JFMAMJ_avg(ii,jj) = 99999999999;
            THETA_122_DN_avg(ii,jj) = 99999999999;
            SALT_122_DN_avg(ii,jj) = 99999999999;
            AGE_122_DN_avg(ii,jj) = 99999999999;
            TFLUX_122_DN_avg(ii,jj) = 99999999999;
            SFLUX_122_DN_avg(ii,jj) = 99999999999;
            ETAN_122_DN_avg(ii,jj) = 99999999999;
            ETAN_122_DN_std(ii,jj) = 99999999999;
            CFLUX_122_DN_avg(ii,jj) = 99999999999;
            OFLUX_122_DN_avg(ii,jj) = 99999999999;
            MLD_122_DN_avg(ii,jj) = 99999999999;
            MLD_122_DN_std(ii,jj) = 99999999999;
            DIC_122_DN_avg(ii,jj) = 99999999999;
            ALK_122_DN_avg(ii,jj) = 99999999999;
            THETA_122_JD_avg(ii,jj) = 99999999999;
            SALT_122_JD_avg(ii,jj) = 99999999999;
            AGE_122_JD_avg(ii,jj) = 99999999999;
            TFLUX_122_JD_avg(ii,jj) = 99999999999;
            SFLUX_122_JD_avg(ii,jj) = 99999999999;
            ETAN_122_JD_avg(ii,jj) = 99999999999;
            ETAN_122_JD_std(ii,jj) = 99999999999;
            CFLUX_122_JD_avg(ii,jj) = 99999999999;
            OFLUX_122_JD_avg(ii,jj) = 99999999999;
            MLD_122_JD_avg(ii,jj) = 99999999999;
            MLD_122_JD_std(ii,jj) = 99999999999;
            DIC_122_JD_avg(ii,jj) = 99999999999;
            ALK_122_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,26)==0)
            THETA105_122_DJF_avg(ii,jj) = 99999999999;
            SALT105_122_DJF_avg(ii,jj) = 99999999999;
            WVEL100_122_DJF_avg(ii,jj) = 99999999999;
            WVEL100_122_DJF_std(ii,jj) = 99999999999;
            THETA105_122_JFM_avg(ii,jj) = 99999999999;
            SALT105_122_JFM_avg(ii,jj) = 99999999999;
            WVEL100_122_JFM_avg(ii,jj) = 99999999999;
            WVEL100_122_JFM_std(ii,jj) = 99999999999;
            THETA105_122_DJFMAM_avg(ii,jj) = 99999999999;
            SALT105_122_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL100_122_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL100_122_DJFMAM_std(ii,jj) = 99999999999;
            THETA105_122_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT105_122_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL100_122_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL100_122_JFMAMJ_std(ii,jj) = 99999999999;
            THETA105_122_DN_avg(ii,jj) = 99999999999;
            SALT105_122_DN_avg(ii,jj) = 99999999999;
            WVEL100_122_DN_avg(ii,jj) = 99999999999;
            WVEL100_122_DN_std(ii,jj) = 99999999999;
            THETA105_122_JD_avg(ii,jj) = 99999999999;
            SALT105_122_JD_avg(ii,jj) = 99999999999;
            WVEL100_122_JD_avg(ii,jj) = 99999999999;
            WVEL100_122_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,40)==0)
            THETA200_122_DJF_avg(ii,jj) = 99999999999;
            SALT200_122_DJF_avg(ii,jj) = 99999999999;
            AGE200_122_DJF_avg(ii,jj) = 99999999999;
            WVEL190_122_DJF_avg(ii,jj) = 99999999999;
            WVEL190_122_DJF_std(ii,jj) = 99999999999;
            THETA200_122_JFM_avg(ii,jj) = 99999999999;
            SALT200_122_JFM_avg(ii,jj) = 99999999999;
            AGE200_122_JFM_avg(ii,jj) = 99999999999;
            WVEL190_122_JFM_avg(ii,jj) = 99999999999;
            WVEL190_122_JFM_std(ii,jj) = 99999999999;
            THETA200_122_DJFMAM_avg(ii,jj) = 99999999999;
            SALT200_122_DJFMAM_avg(ii,jj) = 99999999999;
            AGE200_122_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL190_122_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL190_122_DJFMAM_std(ii,jj) = 99999999999;
            THETA200_122_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT200_122_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE200_122_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL190_122_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL190_122_JFMAMJ_std(ii,jj) = 99999999999;
            THETA200_122_DN_avg(ii,jj) = 99999999999;
            SALT200_122_DN_avg(ii,jj) = 99999999999;
            AGE200_122_DN_avg(ii,jj) = 99999999999;
            WVEL190_122_DN_avg(ii,jj) = 99999999999;
            WVEL190_122_DN_std(ii,jj) = 99999999999;
            THETA200_122_JD_avg(ii,jj) = 99999999999;
            SALT200_122_JD_avg(ii,jj) = 99999999999;
            AGE200_122_JD_avg(ii,jj) = 99999999999;
            WVEL190_122_JD_avg(ii,jj) = 99999999999;
            WVEL190_122_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,50)==0)
            THETA300_122_DJF_avg(ii,jj) = 99999999999;
            SALT300_122_DJF_avg(ii,jj) = 99999999999;
            WVEL290_122_DJF_avg(ii,jj) = 99999999999;
            WVEL290_122_DJF_std(ii,jj) = 99999999999;
            THETA300_122_JFM_avg(ii,jj) = 99999999999;
            SALT300_122_JFM_avg(ii,jj) = 99999999999;
            WVEL290_122_JFM_avg(ii,jj) = 99999999999;
            WVEL290_122_JFM_std(ii,jj) = 99999999999;
            THETA300_122_DJFMAM_avg(ii,jj) = 99999999999;
            SALT300_122_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL290_122_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL290_122_DJFMAM_std(ii,jj) = 99999999999;
            THETA300_122_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT300_122_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL290_122_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL290_122_JFMAMJ_std(ii,jj) = 99999999999;
            THETA300_122_DN_avg(ii,jj) = 99999999999;
            SALT300_122_DN_avg(ii,jj) = 99999999999;
            WVEL290_122_DN_avg(ii,jj) = 99999999999;
            WVEL290_122_DN_std(ii,jj) = 99999999999;
            THETA300_122_JD_avg(ii,jj) = 99999999999;
            SALT300_122_JD_avg(ii,jj) = 99999999999;
            WVEL290_122_JD_avg(ii,jj) = 99999999999;
            WVEL290_122_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,60)==0)
            AGE500_122_DJF_avg(ii,jj) = 99999999999;
            AGE500_122_JFM_avg(ii,jj) = 99999999999;
            AGE500_122_DJFMAM_avg(ii,jj) = 99999999999;
            AGE500_122_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE500_122_DN_avg(ii,jj) = 99999999999;
            AGE500_122_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,72)==0)
            AGE1000_122_DJF_avg(ii,jj) = 99999999999;
            AGE1000_122_JFM_avg(ii,jj) = 99999999999;
            AGE1000_122_DJFMAM_avg(ii,jj) = 99999999999;
            AGE1000_122_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE1000_122_DN_avg(ii,jj) = 99999999999;
            AGE1000_122_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,84)==0)
            AGE2000_122_DJF_avg(ii,jj) = 99999999999;
            AGE2000_122_JFM_avg(ii,jj) = 99999999999;
            AGE2000_122_DJFMAM_avg(ii,jj) = 99999999999;
            AGE2000_122_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE2000_122_DN_avg(ii,jj) = 99999999999;
            AGE2000_122_JD_avg(ii,jj) = 99999999999;
        end
    end
end


clear char122* temp122* *Series122 n122 m122 *field122 ii
save AB122_output

fprintf('finished 122 \n')

%% end 122


