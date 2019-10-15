
%% 62

tfield62 = 1;
sfield62 = 2;
wfield62 = 3;
tffield62 = 1;
sffield62 = 2;
cfield62 = 3;
ofield62 = 4;
efield62 = 1;
mfield62 = 4;
dfield62 = 1;
afield62 = 2;
agfield62 = 10;


THETA_Series62 = zeros(384,260,13);
THETA105_Series62 = zeros(384,260,13);
THETA200_Series62 = zeros(384,260,13);
THETA300_Series62 = zeros(384,260,13);
SALT_Series62 = zeros(384,260,13);
SALT105_Series62 = zeros(384,260,13);
SALT200_Series62 = zeros(384,260,13);
SALT300_Series62 = zeros(384,260,13);
AGE_Series62 = zeros(384,260,13);
AGE200_Series62 = zeros(384,260,13);
AGE500_Series62 = zeros(384,260,13);
AGE1000_Series62 = zeros(384,260,13);
AGE2000_Series62 = zeros(384,260,13);
WVEL100_Series62 = zeros(384,260,395);
WVEL190_Series62 = zeros(384,260,395);
WVEL290_Series62 = zeros(384,260,395);
DIC_Series62 = zeros(384,260,13);
ALK_Series62 = zeros(384,260,13);
TFLUX_Series62 = zeros(384,260,13);
SFLUX_Series62 = zeros(384,260,13);
CFLUX_Series62 = zeros(384,260,13);
OFLUX_Series62 = zeros(384,260,13);
ETAN_Series62 = zeros(384,260,395);
MLD_Series62 = zeros(384,260,395);

HC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag/';

for ii=1:1
    char62state = [str,'diag_vel.00000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    WVEL100_Series62(:,:,ii) = temp62state(:,:,2,wfield62);
    WVEL190_Series62(:,:,ii) = temp62state(:,:,3,wfield62);
    WVEL290_Series62(:,:,ii) = temp62state(:,:,4,wfield62);
    clear temp62state
    char62surf = [str,'diag_surf.00000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    MLD_Series62(:,:,ii) = temp62surf(:,:,mfield62);
    clear temp62surf
end

for ii=2:13
    char62state = [str,'diag_vel.0000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    WVEL100_Series62(:,:,ii) = temp62state(:,:,2,wfield62);
    WVEL190_Series62(:,:,ii) = temp62state(:,:,3,wfield62);
    WVEL290_Series62(:,:,ii) = temp62state(:,:,4,wfield62);
    clear temp62state
    char62surf = [str,'diag_surf.0000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    MLD_Series62(:,:,ii) = temp62surf(:,:,mfield62);
    clear temp62surf
end

for ii=14:138
    char62state = [str,'diag_vel.000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    WVEL100_Series62(:,:,ii) = temp62state(:,:,2,wfield62);
    WVEL190_Series62(:,:,ii) = temp62state(:,:,3,wfield62);
    WVEL290_Series62(:,:,ii) = temp62state(:,:,4,wfield62);
    clear temp62state
    char62surf = [str,'diag_surf.000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    MLD_Series62(:,:,ii) = temp62surf(:,:,mfield62);
    clear temp62surf
end

for ii=139:395
    char62state = [str,'diag_vel.00000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    WVEL100_Series62(:,:,ii) = temp62state(:,:,2,wfield62);
    WVEL190_Series62(:,:,ii) = temp62state(:,:,3,wfield62);
    WVEL290_Series62(:,:,ii) = temp62state(:,:,4,wfield62);
    clear temp62state
    char62surf = [str,'diag_surf.00000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    MLD_Series62(:,:,ii) = temp62surf(:,:,mfield62);
    clear temp62surf
end

for ii=1:4
    char62state = [str,'diag_state.000000',num2str(2190*ii)];
    temp62state = rdmds(char62state);
    THETA_Series62(:,:,ii) = temp62state(:,:,depth62,tfield62);
    SALT_Series62(:,:,ii) = temp62state(:,:,depth62,sfield62);
    THETA105_Series62(:,:,ii) = temp62state(:,:,13,tfield62);
    SALT105_Series62(:,:,ii) = temp62state(:,:,13,sfield62);
    THETA200_Series62(:,:,ii) = temp62state(:,:,20,tfield62);
    SALT200_Series62(:,:,ii) = temp62state(:,:,20,sfield62);
    THETA300_Series62(:,:,ii) = temp62state(:,:,25,tfield62);
    SALT300_Series62(:,:,ii) = temp62state(:,:,25,sfield62);
    clear temp62state
    char62airsea = [str,'diag_airsea.000000',num2str(2190*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series62(:,:,ii) = temp62airsea(:,:,tffield62);
    SFLUX_Series62(:,:,ii) = temp62airsea(:,:,sffield62);
    CFLUX_Series62(:,:,ii) = temp62airsea(:,:,cfield62);
    OFLUX_Series62(:,:,ii) = temp62airsea(:,:,ofield62);
    clear temp62airsea
    char62bgc = [str,'diag_bgc.000000',num2str(2190*ii)];
    temp62bgc = rdmds(char62bgc); 
    DIC_Series62(:,:,ii) = temp62bgc(:,:,1,dfield62);
    ALK_Series62(:,:,ii) = temp62bgc(:,:,1,afield62);
    AGE_Series62(:,:,ii) = temp62bgc(:,:,depth62,agfield62);
    AGE200_Series62(:,:,ii) = temp62bgc(:,:,20,agfield62);
    AGE500_Series62(:,:,ii) = temp62bgc(:,:,30,agfield62);
    AGE1000_Series62(:,:,ii) = temp62bgc(:,:,36,agfield62);
    AGE2000_Series62(:,:,ii) = temp62bgc(:,:,42,agfield62);
    clear temp62bgc
end

for ii=5:13
    char62state = [str,'diag_state.00000',num2str(2190*ii)];
    temp62state = rdmds(char62state);
    THETA_Series62(:,:,ii) = temp62state(:,:,depth62,tfield62);
    SALT_Series62(:,:,ii) = temp62state(:,:,depth62,sfield62);
    THETA105_Series62(:,:,ii) = temp62state(:,:,13,tfield62);
    SALT105_Series62(:,:,ii) = temp62state(:,:,13,sfield62);
    THETA200_Series62(:,:,ii) = temp62state(:,:,20,tfield62);
    SALT200_Series62(:,:,ii) = temp62state(:,:,20,sfield62);
    THETA300_Series62(:,:,ii) = temp62state(:,:,25,tfield62);
    SALT300_Series62(:,:,ii) = temp62state(:,:,25,sfield62);
    clear temp62state
    char62airsea = [str,'diag_airsea.00000',num2str(2190*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series62(:,:,ii) = temp62airsea(:,:,tffield62);
    SFLUX_Series62(:,:,ii) = temp62airsea(:,:,sffield62);
    CFLUX_Series62(:,:,ii) = temp62airsea(:,:,cfield62);
    OFLUX_Series62(:,:,ii) = temp62airsea(:,:,ofield62);
    clear temp62airsea
    char62bgc = [str,'diag_bgc.00000',num2str(2190*ii)];
    temp62bgc = rdmds(char62bgc); 
    DIC_Series62(:,:,ii) = temp62bgc(:,:,1,dfield62);
    ALK_Series62(:,:,ii) = temp62bgc(:,:,1,afield62);
    AGE_Series62(:,:,ii) = temp62bgc(:,:,depth62,agfield62);
    AGE200_Series62(:,:,ii) = temp62bgc(:,:,20,agfield62);
    AGE500_Series62(:,:,ii) = temp62bgc(:,:,30,agfield62);
    AGE1000_Series62(:,:,ii) = temp62bgc(:,:,36,agfield62);
    AGE2000_Series62(:,:,ii) = temp62bgc(:,:,42,agfield62);
    clear temp62bgc
end

THETA_62_DJF_avg = mean(THETA_Series62(:,:,1:3),3);
SALT_62_DJF_avg = mean(SALT_Series62(:,:,1:3),3);
THETA105_62_DJF_avg = mean(THETA105_Series62(:,:,1:3),3);
SALT105_62_DJF_avg = mean(SALT105_Series62(:,:,1:3),3);
THETA200_62_DJF_avg = mean(THETA200_Series62(:,:,1:3),3);
SALT200_62_DJF_avg = mean(SALT200_Series62(:,:,1:3),3);
THETA300_62_DJF_avg = mean(THETA300_Series62(:,:,1:3),3);
SALT300_62_DJF_avg = mean(SALT300_Series62(:,:,1:3),3);
AGE_62_DJF_avg = mean(AGE_Series62(:,:,1:3),3);
AGE200_62_DJF_avg = mean(AGE200_Series62(:,:,1:3),3);
AGE500_62_DJF_avg = mean(AGE500_Series62(:,:,1:3),3);
AGE1000_62_DJF_avg = mean(AGE1000_Series62(:,:,1:3),3);
AGE2000_62_DJF_avg = mean(AGE2000_Series62(:,:,1:3),3);
WVEL100_62_DJF_avg = mean(WVEL100_Series62(:,:,1:91),3);
WVEL100_62_DJF_std = std(WVEL100_Series62(:,:,1:91),0,3);
WVEL190_62_DJF_avg = mean(WVEL190_Series62(:,:,1:91),3);
WVEL190_62_DJF_std = std(WVEL190_Series62(:,:,1:91),0,3);
WVEL290_62_DJF_avg = mean(WVEL290_Series62(:,:,1:91),3);
WVEL290_62_DJF_std = std(WVEL290_Series62(:,:,1:91),0,3);
TFLUX_62_DJF_avg = mean(TFLUX_Series62(:,:,1:3),3);
SFLUX_62_DJF_avg = mean(SFLUX_Series62(:,:,1:3),3);
ETAN_62_DJF_avg = mean(ETAN_Series62(:,:,1:91),3);
ETAN_62_DJF_std = std(ETAN_Series62(:,:,1:91),0,3);
CFLUX_62_DJF_avg = mean(CFLUX_Series62(:,:,1:3),3);
OFLUX_62_DJF_avg = mean(OFLUX_Series62(:,:,1:3),3);
MLD_62_DJF_avg = mean(MLD_Series62(:,:,1:91),3);
MLD_62_DJF_std = std(MLD_Series62(:,:,1:91),0,3);
DIC_62_DJF_avg = mean(DIC_Series62(:,:,1:3),3);
ALK_62_DJF_avg = mean(ALK_Series62(:,:,1:3),3);

THETA_62_JFM_avg = mean(THETA_Series62(:,:,2:4),3);
SALT_62_JFM_avg = mean(SALT_Series62(:,:,2:4),3);
THETA105_62_JFM_avg = mean(THETA105_Series62(:,:,2:4),3);
SALT105_62_JFM_avg = mean(SALT105_Series62(:,:,2:4),3);
THETA200_62_JFM_avg = mean(THETA200_Series62(:,:,2:4),3);
SALT200_62_JFM_avg = mean(SALT200_Series62(:,:,2:4),3);
THETA300_62_JFM_avg = mean(THETA300_Series62(:,:,2:4),3);
SALT300_62_JFM_avg = mean(SALT300_Series62(:,:,2:4),3);
AGE_62_JFM_avg = mean(AGE_Series62(:,:,2:4),3);
AGE200_62_JFM_avg = mean(AGE200_Series62(:,:,2:4),3);
AGE500_62_JFM_avg = mean(AGE500_Series62(:,:,2:4),3);
AGE1000_62_JFM_avg = mean(AGE1000_Series62(:,:,2:4),3);
AGE2000_62_JFM_avg = mean(AGE2000_Series62(:,:,2:4),3);
WVEL100_62_JFM_avg = mean(WVEL100_Series62(:,:,32:122),3);
WVEL100_62_JFM_std = std(WVEL100_Series62(:,:,32:122),0,3);
WVEL190_62_JFM_avg = mean(WVEL190_Series62(:,:,32:122),3);
WVEL190_62_JFM_std = std(WVEL190_Series62(:,:,32:122),0,3);
WVEL290_62_JFM_avg = mean(WVEL290_Series62(:,:,32:122),3);
WVEL290_62_JFM_std = std(WVEL290_Series62(:,:,32:122),0,3);
TFLUX_62_JFM_avg = mean(TFLUX_Series62(:,:,2:4),3);
SFLUX_62_JFM_avg = mean(SFLUX_Series62(:,:,2:4),3);
ETAN_62_JFM_avg = mean(ETAN_Series62(:,:,32:122),3);
ETAN_62_JFM_std = std(ETAN_Series62(:,:,32:122),0,3);
CFLUX_62_JFM_avg = mean(CFLUX_Series62(:,:,2:4),3);
OFLUX_62_JFM_avg = mean(OFLUX_Series62(:,:,2:4),3);
MLD_62_JFM_avg = mean(MLD_Series62(:,:,32:122),3);
MLD_62_JFM_std = std(MLD_Series62(:,:,32:122),0,3);
DIC_62_JFM_avg = mean(DIC_Series62(:,:,2:4),3);
ALK_62_JFM_avg = mean(ALK_Series62(:,:,2:4),3);

THETA_62_DJFMAM_avg = mean(THETA_Series62(:,:,1:6),3);
SALT_62_DJFMAM_avg = mean(SALT_Series62(:,:,1:6),3);
THETA105_62_DJFMAM_avg = mean(THETA105_Series62(:,:,1:6),3);
SALT105_62_DJFMAM_avg = mean(SALT105_Series62(:,:,1:6),3);
THETA200_62_DJFMAM_avg = mean(THETA200_Series62(:,:,1:6),3);
SALT200_62_DJFMAM_avg = mean(SALT200_Series62(:,:,1:6),3);
THETA300_62_DJFMAM_avg = mean(THETA300_Series62(:,:,1:6),3);
SALT300_62_DJFMAM_avg = mean(SALT300_Series62(:,:,1:6),3);
AGE_62_DJFMAM_avg = mean(AGE_Series62(:,:,1:6),3);
AGE200_62_DJFMAM_avg = mean(AGE200_Series62(:,:,1:6),3);
AGE500_62_DJFMAM_avg = mean(AGE500_Series62(:,:,1:6),3);
AGE1000_62_DJFMAM_avg = mean(AGE1000_Series62(:,:,1:6),3);
AGE2000_62_DJFMAM_avg = mean(AGE2000_Series62(:,:,1:6),3);
WVEL100_62_DJFMAM_avg = mean(WVEL100_Series62(:,:,1:182),3);
WVEL100_62_DJFMAM_std = std(WVEL100_Series62(:,:,1:182),0,3);
WVEL190_62_DJFMAM_avg = mean(WVEL190_Series62(:,:,1:182),3);
WVEL190_62_DJFMAM_std = std(WVEL190_Series62(:,:,1:182),0,3);
WVEL290_62_DJFMAM_avg = mean(WVEL290_Series62(:,:,1:182),3);
WVEL290_62_DJFMAM_std = std(WVEL290_Series62(:,:,1:182),0,3);
TFLUX_62_DJFMAM_avg = mean(TFLUX_Series62(:,:,1:6),3);
SFLUX_62_DJFMAM_avg = mean(SFLUX_Series62(:,:,1:6),3);
ETAN_62_DJFMAM_avg = mean(ETAN_Series62(:,:,1:182),3);
ETAN_62_DJFMAM_std = std(ETAN_Series62(:,:,1:182),0,3);
CFLUX_62_DJFMAM_avg = mean(CFLUX_Series62(:,:,1:6),3);
OFLUX_62_DJFMAM_avg = mean(OFLUX_Series62(:,:,1:6),3);
MLD_62_DJFMAM_avg = mean(MLD_Series62(:,:,1:182),3);
MLD_62_DJFMAM_std = std(MLD_Series62(:,:,1:182),0,3);
DIC_62_DJFMAM_avg = mean(DIC_Series62(:,:,1:6),3);
ALK_62_DJFMAM_avg = mean(ALK_Series62(:,:,1:6),3);

THETA_62_JFMAMJ_avg = mean(THETA_Series62(:,:,2:7),3);
SALT_62_JFMAMJ_avg = mean(SALT_Series62(:,:,2:7),3);
THETA105_62_JFMAMJ_avg = mean(THETA105_Series62(:,:,2:7),3);
SALT105_62_JFMAMJ_avg = mean(SALT105_Series62(:,:,2:7),3);
THETA200_62_JFMAMJ_avg = mean(THETA200_Series62(:,:,2:7),3);
SALT200_62_JFMAMJ_avg = mean(SALT200_Series62(:,:,2:7),3);
THETA300_62_JFMAMJ_avg = mean(THETA300_Series62(:,:,2:7),3);
SALT300_62_JFMAMJ_avg = mean(SALT300_Series62(:,:,2:7),3);
AGE_62_JFMAMJ_avg = mean(AGE_Series62(:,:,2:7),3);
AGE200_62_JFMAMJ_avg = mean(AGE200_Series62(:,:,2:7),3);
AGE500_62_JFMAMJ_avg = mean(AGE500_Series62(:,:,2:7),3);
AGE1000_62_JFMAMJ_avg = mean(AGE1000_Series62(:,:,2:7),3);
AGE2000_62_JFMAMJ_avg = mean(AGE2000_Series62(:,:,2:7),3);
WVEL100_62_JFMAMJ_avg = mean(WVEL100_Series62(:,:,62:213),3);
WVEL100_62_JFMAMJ_std = std(WVEL100_Series62(:,:,62:213),0,3);
WVEL190_62_JFMAMJ_avg = mean(WVEL190_Series62(:,:,62:213),3);
WVEL190_62_JFMAMJ_std = std(WVEL190_Series62(:,:,62:213),0,3);
WVEL290_62_JFMAMJ_avg = mean(WVEL290_Series62(:,:,62:213),3);
WVEL290_62_JFMAMJ_std = std(WVEL290_Series62(:,:,62:213),0,3);
TFLUX_62_JFMAMJ_avg = mean(TFLUX_Series62(:,:,2:7),3);
SFLUX_62_JFMAMJ_avg = mean(SFLUX_Series62(:,:,2:7),3);
ETAN_62_JFMAMJ_avg = mean(ETAN_Series62(:,:,62:213),3);
ETAN_62_JFMAMJ_std = std(ETAN_Series62(:,:,62:213),0,3);
CFLUX_62_JFMAMJ_avg = mean(CFLUX_Series62(:,:,2:7),3);
OFLUX_62_JFMAMJ_avg = mean(OFLUX_Series62(:,:,2:7),3);
MLD_62_JFMAMJ_avg = mean(MLD_Series62(:,:,62:213),3);
MLD_62_JFMAMJ_std = std(MLD_Series62(:,:,62:213),0,3);
DIC_62_JFMAMJ_avg = mean(DIC_Series62(:,:,2:7),3);
ALK_62_JFMAMJ_avg = mean(ALK_Series62(:,:,2:7),3);

THETA_62_DN_avg = mean(THETA_Series62(:,:,1:12),3);
SALT_62_DN_avg = mean(SALT_Series62(:,:,1:12),3);
THETA105_62_DN_avg = mean(THETA105_Series62(:,:,1:12),3);
SALT105_62_DN_avg = mean(SALT105_Series62(:,:,1:12),3);
THETA200_62_DN_avg = mean(THETA200_Series62(:,:,1:12),3);
SALT200_62_DN_avg = mean(SALT200_Series62(:,:,1:12),3);
THETA300_62_DN_avg = mean(THETA300_Series62(:,:,1:12),3);
SALT300_62_DN_avg = mean(SALT300_Series62(:,:,1:12),3);
AGE_62_DN_avg = mean(AGE_Series62(:,:,1:12),3);
AGE200_62_DN_avg = mean(AGE200_Series62(:,:,1:12),3);
AGE500_62_DN_avg = mean(AGE500_Series62(:,:,1:12),3);
AGE1000_62_DN_avg = mean(AGE1000_Series62(:,:,1:12),3);
AGE2000_62_DN_avg = mean(AGE2000_Series62(:,:,1:12),3);
WVEL100_62_DN_avg = mean(WVEL100_Series62(:,:,1:364),3);
WVEL100_62_DN_std = std(WVEL100_Series62(:,:,1:364),0,3);
WVEL190_62_DN_avg = mean(WVEL190_Series62(:,:,1:364),3);
WVEL190_62_DN_std = std(WVEL190_Series62(:,:,1:364),0,3);
WVEL290_62_DN_avg = mean(WVEL290_Series62(:,:,1:364),3);
WVEL290_62_DN_std = std(WVEL290_Series62(:,:,1:364),0,3);
TFLUX_62_DN_avg = mean(TFLUX_Series62(:,:,1:12),3);
SFLUX_62_DN_avg = mean(SFLUX_Series62(:,:,1:12),3);
ETAN_62_DN_avg = mean(ETAN_Series62(:,:,1:364),3);
ETAN_62_DN_std = std(ETAN_Series62(:,:,1:364),0,3);
CFLUX_62_DN_avg = mean(CFLUX_Series62(:,:,1:12),3);
OFLUX_62_DN_avg = mean(OFLUX_Series62(:,:,1:12),3);
MLD_62_DN_avg = mean(MLD_Series62(:,:,1:364),3);
MLD_62_DN_std = std(MLD_Series62(:,:,1:364),0,3);
DIC_62_DN_avg = mean(DIC_Series62(:,:,1:12),3);
ALK_62_DN_avg = mean(ALK_Series62(:,:,1:12),3);

THETA_62_JD_avg = mean(THETA_Series62(:,:,2:13),3);
SALT_62_JD_avg = mean(SALT_Series62(:,:,2:13),3);
THETA105_62_JD_avg = mean(THETA105_Series62(:,:,2:13),3);
SALT105_62_JD_avg = mean(SALT105_Series62(:,:,2:13),3);
THETA200_62_JD_avg = mean(THETA200_Series62(:,:,2:13),3);
SALT200_62_JD_avg = mean(SALT200_Series62(:,:,2:13),3);
THETA300_62_JD_avg = mean(THETA300_Series62(:,:,2:13),3);
SALT300_62_JD_avg = mean(SALT300_Series62(:,:,2:13),3);
AGE_62_JD_avg = mean(AGE_Series62(:,:,2:13),3);
AGE200_62_JD_avg = mean(AGE200_Series62(:,:,2:13),3);
AGE500_62_JD_avg = mean(AGE500_Series62(:,:,2:13),3);
AGE1000_62_JD_avg = mean(AGE1000_Series62(:,:,2:13),3);
AGE2000_62_JD_avg = mean(AGE2000_Series62(:,:,2:13),3);
WVEL100_62_JD_avg = mean(WVEL100_Series62(:,:,32:395),3);
WVEL100_62_JD_std = std(WVEL100_Series62(:,:,32:395),0,3);
WVEL190_62_JD_avg = mean(WVEL190_Series62(:,:,32:395),3);
WVEL190_62_JD_std = std(WVEL190_Series62(:,:,32:395),0,3);
WVEL290_62_JD_avg = mean(WVEL290_Series62(:,:,32:395),3);
WVEL290_62_JD_std = std(WVEL290_Series62(:,:,32:395),0,3);
TFLUX_62_JD_avg = mean(TFLUX_Series62(:,:,2:13),3);
SFLUX_62_JD_avg = mean(SFLUX_Series62(:,:,2:13),3);
ETAN_62_JD_avg = mean(ETAN_Series62(:,:,32:395),3);
ETAN_62_JD_std = std(ETAN_Series62(:,:,32:395),0,3);
CFLUX_62_JD_avg = mean(CFLUX_Series62(:,:,2:13),3);
OFLUX_62_JD_avg = mean(OFLUX_Series62(:,:,2:13),3);
MLD_62_JD_avg = mean(MLD_Series62(:,:,32:395),3);
MLD_62_JD_std = std(MLD_Series62(:,:,32:395),0,3);
DIC_62_JD_avg = mean(DIC_Series62(:,:,2:13),3);
ALK_62_JD_avg = mean(ALK_Series62(:,:,2:13),3);


[m62,n62] = size(THETA_62_DJF_avg);

parfor ii=1:m62
    for jj=1:n62
        if (HC(ii,jj,1)==0)
            THETA_62_DJF_avg(ii,jj) = 99999999999;
            SALT_62_DJF_avg(ii,jj) = 99999999999;
            TFLUX_62_DJF_avg(ii,jj) = 99999999999;
            SFLUX_62_DJF_avg(ii,jj) = 99999999999;
            ETAN_62_DJF_avg(ii,jj) = 99999999999;
            ETAN_62_DJF_std(ii,jj) = 99999999999;
            CFLUX_62_DJF_avg(ii,jj) = 99999999999;
            OFLUX_62_DJF_avg(ii,jj) = 99999999999;
            MLD_62_DJF_avg(ii,jj) = 99999999999;
            MLD_62_DJF_std(ii,jj) = 99999999999;
            DIC_62_DJF_avg(ii,jj) = 99999999999;
            ALK_62_DJF_avg(ii,jj) = 99999999999;
            THETA_62_JFM_avg(ii,jj) = 99999999999;
            SALT_62_JFM_avg(ii,jj) = 99999999999;
            AGE_62_JFM_avg(ii,jj) = 99999999999;
            TFLUX_62_JFM_avg(ii,jj) = 99999999999;
            SFLUX_62_JFM_avg(ii,jj) = 99999999999;
            ETAN_62_JFM_avg(ii,jj) = 99999999999;
            ETAN_62_JFM_std(ii,jj) = 99999999999;
            CFLUX_62_JFM_avg(ii,jj) = 99999999999;
            OFLUX_62_JFM_avg(ii,jj) = 99999999999;
            MLD_62_JFM_avg(ii,jj) = 99999999999;
            MLD_62_JFM_std(ii,jj) = 99999999999;
            DIC_62_JFM_avg(ii,jj) = 99999999999;
            ALK_62_JFM_avg(ii,jj) = 99999999999;
            THETA_62_DJFMAM_avg(ii,jj) = 99999999999;
            SALT_62_DJFMAM_avg(ii,jj) = 99999999999;
            AGE_62_DJFMAM_avg(ii,jj) = 99999999999;
            TFLUX_62_DJFMAM_avg(ii,jj) = 99999999999;
            SFLUX_62_DJFMAM_avg(ii,jj) = 99999999999;
            ETAN_62_DJFMAM_avg(ii,jj) = 99999999999;
            ETAN_62_DJFMAM_std(ii,jj) = 99999999999;
            CFLUX_62_DJFMAM_avg(ii,jj) = 99999999999;
            OFLUX_62_DJFMAM_avg(ii,jj) = 99999999999;
            MLD_62_DJFMAM_avg(ii,jj) = 99999999999;
            MLD_62_DJFMAM_std(ii,jj) = 99999999999;
            DIC_62_DJFMAM_avg(ii,jj) = 99999999999;
            ALK_62_DJFMAM_avg(ii,jj) = 99999999999;
            THETA_62_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT_62_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE_62_JFMAMJ_avg(ii,jj) = 99999999999;
            TFLUX_62_JFMAMJ_avg(ii,jj) = 99999999999;
            SFLUX_62_JFMAMJ_avg(ii,jj) = 99999999999;
            ETAN_62_JFMAMJ_avg(ii,jj) = 99999999999;
            ETAN_62_JFMAMJ_std(ii,jj) = 99999999999;
            CFLUX_62_JFMAMJ_avg(ii,jj) = 99999999999;
            OFLUX_62_JFMAMJ_avg(ii,jj) = 99999999999;
            MLD_62_JFMAMJ_avg(ii,jj) = 99999999999;
            MLD_62_JFMAMJ_std(ii,jj) = 99999999999;
            DIC_62_JFMAMJ_avg(ii,jj) = 99999999999;
            ALK_62_JFMAMJ_avg(ii,jj) = 99999999999;
            THETA_62_DN_avg(ii,jj) = 99999999999;
            SALT_62_DN_avg(ii,jj) = 99999999999;
            AGE_62_DN_avg(ii,jj) = 99999999999;
            TFLUX_62_DN_avg(ii,jj) = 99999999999;
            SFLUX_62_DN_avg(ii,jj) = 99999999999;
            ETAN_62_DN_avg(ii,jj) = 99999999999;
            ETAN_62_DN_std(ii,jj) = 99999999999;
            CFLUX_62_DN_avg(ii,jj) = 99999999999;
            OFLUX_62_DN_avg(ii,jj) = 99999999999;
            MLD_62_DN_avg(ii,jj) = 99999999999;
            MLD_62_DN_std(ii,jj) = 99999999999;
            DIC_62_DN_avg(ii,jj) = 99999999999;
            ALK_62_DN_avg(ii,jj) = 99999999999;
            THETA_62_JD_avg(ii,jj) = 99999999999;
            SALT_62_JD_avg(ii,jj) = 99999999999;
            AGE_62_JD_avg(ii,jj) = 99999999999;
            TFLUX_62_JD_avg(ii,jj) = 99999999999;
            SFLUX_62_JD_avg(ii,jj) = 99999999999;
            ETAN_62_JD_avg(ii,jj) = 99999999999;
            ETAN_62_JD_std(ii,jj) = 99999999999;
            CFLUX_62_JD_avg(ii,jj) = 99999999999;
            OFLUX_62_JD_avg(ii,jj) = 99999999999;
            MLD_62_JD_avg(ii,jj) = 99999999999;
            MLD_62_JD_std(ii,jj) = 99999999999;
            DIC_62_JD_avg(ii,jj) = 99999999999;
            ALK_62_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,13)==0)
            THETA105_62_DJF_avg(ii,jj) = 99999999999;
            SALT105_62_DJF_avg(ii,jj) = 99999999999;
            WVEL100_62_DJF_avg(ii,jj) = 99999999999;
            WVEL100_62_DJF_std(ii,jj) = 99999999999;
            THETA105_62_JFM_avg(ii,jj) = 99999999999;
            SALT105_62_JFM_avg(ii,jj) = 99999999999;
            WVEL100_62_JFM_avg(ii,jj) = 99999999999;
            WVEL100_62_JFM_std(ii,jj) = 99999999999;
            THETA105_62_DJFMAM_avg(ii,jj) = 99999999999;
            SALT105_62_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL100_62_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL100_62_DJFMAM_std(ii,jj) = 99999999999;
            THETA105_62_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT105_62_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL100_62_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL100_62_JFMAMJ_std(ii,jj) = 99999999999;
            THETA105_62_DN_avg(ii,jj) = 99999999999;
            SALT105_62_DN_avg(ii,jj) = 99999999999;
            WVEL100_62_DN_avg(ii,jj) = 99999999999;
            WVEL100_62_DN_std(ii,jj) = 99999999999;
            THETA105_62_JD_avg(ii,jj) = 99999999999;
            SALT105_62_JD_avg(ii,jj) = 99999999999;
            WVEL100_62_JD_avg(ii,jj) = 99999999999;
            WVEL100_62_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,20)==0)
            THETA200_62_DJF_avg(ii,jj) = 99999999999;
            SALT200_62_DJF_avg(ii,jj) = 99999999999;
            AGE200_62_DJF_avg(ii,jj) = 99999999999;
            WVEL190_62_DJF_avg(ii,jj) = 99999999999;
            WVEL190_62_DJF_std(ii,jj) = 99999999999;
            THETA200_62_JFM_avg(ii,jj) = 99999999999;
            SALT200_62_JFM_avg(ii,jj) = 99999999999;
            AGE200_62_JFM_avg(ii,jj) = 99999999999;
            WVEL190_62_JFM_avg(ii,jj) = 99999999999;
            WVEL190_62_JFM_std(ii,jj) = 99999999999;
            THETA200_62_DJFMAM_avg(ii,jj) = 99999999999;
            SALT200_62_DJFMAM_avg(ii,jj) = 99999999999;
            AGE200_62_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL190_62_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL190_62_DJFMAM_std(ii,jj) = 99999999999;
            THETA200_62_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT200_62_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE200_62_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL190_62_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL190_62_JFMAMJ_std(ii,jj) = 99999999999;
            THETA200_62_DN_avg(ii,jj) = 99999999999;
            SALT200_62_DN_avg(ii,jj) = 99999999999;
            AGE200_62_DN_avg(ii,jj) = 99999999999;
            WVEL190_62_DN_avg(ii,jj) = 99999999999;
            WVEL190_62_DN_std(ii,jj) = 99999999999;
            THETA200_62_JD_avg(ii,jj) = 99999999999;
            SALT200_62_JD_avg(ii,jj) = 99999999999;
            AGE200_62_JD_avg(ii,jj) = 99999999999;
            WVEL190_62_JD_avg(ii,jj) = 99999999999;
            WVEL190_62_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,25)==0)
            THETA300_62_DJF_avg(ii,jj) = 99999999999;
            SALT300_62_DJF_avg(ii,jj) = 99999999999;
            WVEL290_62_DJF_avg(ii,jj) = 99999999999;
            WVEL290_62_DJF_std(ii,jj) = 99999999999;
            THETA300_62_JFM_avg(ii,jj) = 99999999999;
            SALT300_62_JFM_avg(ii,jj) = 99999999999;
            WVEL290_62_JFM_avg(ii,jj) = 99999999999;
            WVEL290_62_JFM_std(ii,jj) = 99999999999;
            THETA300_62_DJFMAM_avg(ii,jj) = 99999999999;
            SALT300_62_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL290_62_DJFMAM_avg(ii,jj) = 99999999999;
            WVEL290_62_DJFMAM_std(ii,jj) = 99999999999;
            THETA300_62_JFMAMJ_avg(ii,jj) = 99999999999;
            SALT300_62_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL290_62_JFMAMJ_avg(ii,jj) = 99999999999;
            WVEL290_62_JFMAMJ_std(ii,jj) = 99999999999;
            THETA300_62_DN_avg(ii,jj) = 99999999999;
            SALT300_62_DN_avg(ii,jj) = 99999999999;
            WVEL290_62_DN_avg(ii,jj) = 99999999999;
            WVEL290_62_DN_std(ii,jj) = 99999999999;
            THETA300_62_JD_avg(ii,jj) = 99999999999;
            SALT300_62_JD_avg(ii,jj) = 99999999999;
            WVEL290_62_JD_avg(ii,jj) = 99999999999;
            WVEL290_62_JD_std(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,30)==0)
            AGE500_62_DJF_avg(ii,jj) = 99999999999;
            AGE500_62_JFM_avg(ii,jj) = 99999999999;
            AGE500_62_DJFMAM_avg(ii,jj) = 99999999999;
            AGE500_62_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE500_62_DN_avg(ii,jj) = 99999999999;
            AGE500_62_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,36)==0)
            AGE1000_62_DJF_avg(ii,jj) = 99999999999;
            AGE1000_62_JFM_avg(ii,jj) = 99999999999;
            AGE1000_62_DJFMAM_avg(ii,jj) = 99999999999;
            AGE1000_62_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE1000_62_DN_avg(ii,jj) = 99999999999;
            AGE1000_62_JD_avg(ii,jj) = 99999999999;
        end
        if (HC(ii,jj,42)==0)
            AGE2000_62_DJF_avg(ii,jj) = 99999999999;
            AGE2000_62_JFM_avg(ii,jj) = 99999999999;
            AGE2000_62_DJFMAM_avg(ii,jj) = 99999999999;
            AGE2000_62_JFMAMJ_avg(ii,jj) = 99999999999;
            AGE2000_62_DN_avg(ii,jj) = 99999999999;
            AGE2000_62_JD_avg(ii,jj) = 99999999999;
        end
    end
end


clear char62* temp62* *Series62 n62 m62 *field62 ii
save AB62_output

fprintf('finished 62 \n')

%% end 62


