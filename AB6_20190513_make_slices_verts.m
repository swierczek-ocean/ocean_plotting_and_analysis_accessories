
%% 62

tfield62 = 1;
sfield62 = 2;
wfield62 = 3;
ufield62 = 3;
vfield62 = 4;
tffield62 = 1;
sffield62 = 2;
cfield62 = 3;
ofield62 = 4;
efield62 = 1;
mfield62 = 4;
dfield62 = 1;
afield62 = 2;
agfield62 = 9;
pcfield62 = 2;
no3field62 = 4;
o2field62 = 3;

slice_index = 114;

THETA_Series_vert_62 = zeros(384,260,395);
DIC_Series_vert_62 = zeros(384,260,395);
O2_Series_vert_62 = zeros(384,260,395);
NO3_Series_vert_62 = zeros(384,260,395);

THETA_Series_vert_t62 = zeros(384,260,395);
DIC_Series_vert_t62 = zeros(384,260,395);
O2_Series_vert_t62 = zeros(384,260,395);
NO3_Series_vert_t62 = zeros(384,260,395);

THETA_Series_slice_62 = zeros(260,52,395);
SALT_Series_slice_62 = zeros(260,52,395);
WVEL_Series_slice_62 = zeros(260,52,395);
UVEL_Series_slice_62 = zeros(260,52,395);
VVEL_Series_slice_62 = zeros(260,52,395);
DIC_Series_slice_62 = zeros(260,52,395);
ALK_Series_slice_62 = zeros(260,52,395);
O2_Series_slice_62 = zeros(260,52,395);
NO3_Series_slice_62 = zeros(260,52,395);
TFLUX_Series_slice_62 = zeros(260,395);
SFLUX_Series_slice_62 = zeros(260,395);
CFLUX_Series_slice_62 = zeros(260,395);
OFLUX_Series_slice_62 = zeros(260,395);
ETAN_Series_slice_62 = zeros(260,395);
MLD_Series_slice_62 = zeros(260,395);
PCO2_Series_slice_62 = zeros(260,395);

HC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
DRF_temp = rdmds('../MITgcm/verification/SO6_20190513/run/DRF');
[mm,nn,pp] = size(HC);
DRF = zeros(1,1,pp);
DRF(1,1,:) = DRF_temp;
clear DRF_temp;
Volume = zeros(mm,nn,pp);

for ii=1:mm
    for jj=1:nn
        Volume(ii,jj,:) = HC(ii,jj,:).*DRF;
    end
end

Height = sum(Volume,3);

depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag_slice/';

for ii=1:1
    char62state = [str,'diag_state.00000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    THETA_Series_vert_t62(:,:,ii) = sum(temp62state(:,:,:,tfield62).*Volume,3);
    THETA_Series_vert_62(:,:,ii) = THETA_Series_vert_t62(:,:,ii)./Height;
    THETA_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,tfield62);
    SALT_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,sfield62);
    WVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,wfield62);
    UVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,ufield62);
    VVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,vfield62);
    clear temp62state
    char62surf = [str,'diag_surf.00000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series_slice_62(:,ii) = temp62surf(slice_index,:,efield62); 
    MLD_Series_slice_62(:,ii) = temp62surf(slice_index,:,mfield62);
    PCO2_Series_slice_62(:,ii) = temp62surf(slice_index,:,pcfield62);
    clear temp62surf
    char62airsea = [str,'diag_airsea.00000000',num2str(72*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,tffield62);
    SFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,sffield62);
    CFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,cfield62);
    OFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,ofield62);
    clear temp62airsea
    char62bgc = [str,'diag_bgc.00000000',num2str(72*ii)];
    temp62bgc = rdmds(char62bgc); 
    DIC_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,dfield62);
    ALK_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,afield62);
    O2_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,o2field62);
    NO3_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,no3field62);
    DIC_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,dfield62).*Volume,3);
    DIC_Series_vert_62(:,:,ii) = DIC_Series_vert_t62(:,:,ii)./Height;
    O2_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,o2field62).*Volume,3);
    O2_Series_vert_62(:,:,ii) = O2_Series_vert_t62(:,:,ii)./Height;
    NO3_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,no3field62).*Volume,3);
    NO3_Series_vert_62(:,:,ii) = NO3_Series_vert_t62(:,:,ii)./Height;
    clear temp62bgc
end

for ii=2:13
    char62state = [str,'diag_state.0000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    THETA_Series_vert_t62(:,:,ii) = sum(temp62state(:,:,:,tfield62).*Volume,3);
    THETA_Series_vert_62(:,:,ii) = THETA_Series_vert_t62(:,:,ii)./Height;
    THETA_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,tfield62);
    SALT_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,sfield62);
    WVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,wfield62);
    UVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,ufield62);
    VVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,vfield62);
    clear temp62state
    char62surf = [str,'diag_surf.0000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series_slice_62(:,ii) = temp62surf(slice_index,:,efield62); 
    MLD_Series_slice_62(:,ii) = temp62surf(slice_index,:,mfield62);
    PCO2_Series_slice_62(:,ii) = temp62surf(slice_index,:,pcfield62);
    clear temp62surf
    char62airsea = [str,'diag_airsea.0000000',num2str(72*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,tffield62);
    SFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,sffield62);
    CFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,cfield62);
    OFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,ofield62);
    clear temp62airsea
    char62bgc = [str,'diag_bgc.0000000',num2str(72*ii)];
    temp62bgc = rdmds(char62bgc); 
    DIC_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,dfield62);
    ALK_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,afield62);
    O2_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,o2field62);
    NO3_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,no3field62);
    DIC_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,dfield62).*Volume,3);
    DIC_Series_vert_62(:,:,ii) = DIC_Series_vert_t62(:,:,ii)./Height;
    O2_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,o2field62).*Volume,3);
    O2_Series_vert_62(:,:,ii) = O2_Series_vert_t62(:,:,ii)./Height;
    NO3_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,no3field62).*Volume,3);
    NO3_Series_vert_62(:,:,ii) = NO3_Series_vert_t62(:,:,ii)./Height;
    clear temp62bgc
end

for ii=14:138
    char62state = [str,'diag_state.000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    THETA_Series_vert_t62(:,:,ii) = sum(temp62state(:,:,:,tfield62).*Volume,3);
    THETA_Series_vert_62(:,:,ii) = THETA_Series_vert_t62(:,:,ii)./Height;
    THETA_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,tfield62);
    SALT_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,sfield62);
    WVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,wfield62);
    UVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,ufield62);
    VVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,vfield62);
    clear temp62state
    char62surf = [str,'diag_surf.000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series_slice_62(:,ii) = temp62surf(slice_index,:,efield62); 
    MLD_Series_slice_62(:,ii) = temp62surf(slice_index,:,mfield62);
    PCO2_Series_slice_62(:,ii) = temp62surf(slice_index,:,pcfield62);
    clear temp62surf
    char62airsea = [str,'diag_airsea.000000',num2str(72*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,tffield62);
    SFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,sffield62);
    CFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,cfield62);
    OFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,ofield62);
    clear temp62airsea
    char62bgc = [str,'diag_bgc.000000',num2str(72*ii)];
    temp62bgc = rdmds(char62bgc); 
    DIC_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,dfield62);
    ALK_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,afield62);
    O2_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,o2field62);
    NO3_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,no3field62);
    DIC_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,dfield62).*Volume,3);
    DIC_Series_vert_62(:,:,ii) = DIC_Series_vert_t62(:,:,ii)./Height;
    O2_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,o2field62).*Volume,3);
    O2_Series_vert_62(:,:,ii) = O2_Series_vert_t62(:,:,ii)./Height;
    NO3_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,no3field62).*Volume,3);
    NO3_Series_vert_62(:,:,ii) = NO3_Series_vert_t62(:,:,ii)./Height;
    clear temp62bgc
end

for ii=139:395
    char62state = [str,'diag_state.00000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    THETA_Series_vert_t62(:,:,ii) = sum(temp62state(:,:,:,tfield62).*Volume,3);
    THETA_Series_vert_62(:,:,ii) = THETA_Series_vert_t62(:,:,ii)./Height;
    THETA_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,tfield62);
    SALT_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,sfield62);
    WVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,wfield62);
    UVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,ufield62);
    VVEL_Series_slice_62(:,:,ii) = temp62state(slice_index,:,:,vfield62);
    clear temp62state
    char62surf = [str,'diag_surf.00000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series_slice_62(:,ii) = temp62surf(slice_index,:,efield62); 
    MLD_Series_slice_62(:,ii) = temp62surf(slice_index,:,mfield62);
    PCO2_Series_slice_62(:,ii) = temp62surf(slice_index,:,pcfield62);
    clear temp62surf
    char62airsea = [str,'diag_airsea.00000',num2str(72*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,tffield62);
    SFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,sffield62);
    CFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,cfield62);
    OFLUX_Series_slice_62(:,:,ii) = temp62airsea(slice_index,:,ofield62);
    clear temp62airsea
    char62bgc = [str,'diag_bgc.00000',num2str(72*ii)];
    temp62bgc = rdmds(char62bgc); 
    DIC_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,dfield62);
    ALK_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,afield62);
    O2_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,o2field62);
    NO3_Series_slice_62(:,:,ii) = temp62bgc(slice_index,:,:,no3field62);
    DIC_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,dfield62).*Volume,3);
    DIC_Series_vert_62(:,:,ii) = DIC_Series_vert_t62(:,:,ii)./Height;
    O2_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,o2field62).*Volume,3);
    O2_Series_vert_62(:,:,ii) = O2_Series_vert_t62(:,:,ii)./Height;
    NO3_Series_vert_t62(:,:,ii) = sum(temp62bgc(:,:,:,no3field62).*Volume,3);
    NO3_Series_vert_62(:,:,ii) = NO3_Series_vert_t62(:,:,ii)./Height;
    clear temp62bgc
end


THETA_62_DJF_slice_avg = mean(THETA_Series_slice_62(:,:,1:91),3);
SALT_62_DJF_slice_avg = mean(SALT_Series_slice_62(:,:,1:91),3);
WVEL_62_DJF_slice_avg = mean(WVEL_Series_slice_62(:,:,1:91),3);
WVEL_62_DJF_slice_std = std(WVEL_Series_slice_62(:,:,1:91),0,3);
UVEL_62_DJF_slice_avg = mean(UVEL_Series_slice_62(:,:,1:91),3);
UVEL_62_DJF_slice_std = std(UVEL_Series_slice_62(:,:,1:91),0,3);
VVEL_62_DJF_slice_avg = mean(VVEL_Series_slice_62(:,:,1:91),3);
VVEL_62_DJF_slice_std = std(VVEL_Series_slice_62(:,:,1:91),0,3);
DIC_62_DJF_slice_avg = mean(DIC_Series_slice_62(:,:,1:91),3);
ALK_62_DJF_slice_avg = mean(ALK_Series_slice_62(:,:,1:91),3);
O2_62_DJF_slice_avg = mean(O2_Series_slice_62(:,:,1:91),3);
NO3_62_DJF_slice_avg = mean(NO3_Series_slice_62(:,:,1:91),3);

THETA_62_JFM_slice_avg = mean(THETA_Series_slice_62(:,:,62:122),3);
SALT_62_JFM_slice_avg = mean(SALT_Series_slice_62(:,:,62:122),3);
WVEL_62_JFM_slice_avg = mean(WVEL_Series_slice_62(:,:,62:122),3);
WVEL_62_JFM_slice_std = std(WVEL_Series_slice_62(:,:,62:122),0,3);
UVEL_62_JFM_slice_avg = mean(UVEL_Series_slice_62(:,:,62:122),3);
UVEL_62_JFM_slice_std = std(UVEL_Series_slice_62(:,:,62:122),0,3);
VVEL_62_JFM_slice_avg = mean(VVEL_Series_slice_62(:,:,62:122),3);
VVEL_62_JFM_slice_std = std(VVEL_Series_slice_62(:,:,62:122),0,3);
DIC_62_JFM_slice_avg = mean(DIC_Series_slice_62(:,:,62:122),3);
ALK_62_JFM_slice_avg = mean(ALK_Series_slice_62(:,:,62:122),3);
O2_62_JFM_slice_avg = mean(O2_Series_slice_62(:,:,62:122),3);
NO3_62_JFM_slice_avg = mean(NO3_Series_slice_62(:,:,62:122),3);

THETA_62_DJFMAM_slice_avg = mean(THETA_Series_slice_62(:,:,1:182),3);
SALT_62_DJFMAM_slice_avg = mean(SALT_Series_slice_62(:,:,1:182),3);
WVEL_62_DJFMAM_slice_avg = mean(WVEL_Series_slice_62(:,:,1:182),3);
WVEL_62_DJFMAM_slice_std = std(WVEL_Series_slice_62(:,:,1:182),0,3);
UVEL_62_DJFMAM_slice_avg = mean(UVEL_Series_slice_62(:,:,1:182),3);
UVEL_62_DJFMAM_slice_std = std(UVEL_Series_slice_62(:,:,1:182),0,3);
VVEL_62_DJFMAM_slice_avg = mean(VVEL_Series_slice_62(:,:,1:182),3);
VVEL_62_DJFMAM_slice_std = std(VVEL_Series_slice_62(:,:,1:182),0,3);
DIC_62_DJFMAM_slice_avg = mean(DIC_Series_slice_62(:,:,1:182),3);
ALK_62_DJFMAM_slice_avg = mean(ALK_Series_slice_62(:,:,1:182),3);
O2_62_DJFMAM_slice_avg = mean(O2_Series_slice_62(:,:,1:182),3);
NO3_62_DJFMAM_slice_avg = mean(NO3_Series_slice_62(:,:,1:182),3);

THETA_62_JFMAMJ_slice_avg = mean(THETA_Series_slice_62(:,:,62:213),3);
SALT_62_JFMAMJ_slice_avg = mean(SALT_Series_slice_62(:,:,62:213),3);
WVEL_62_JFMAMJ_slice_avg = mean(WVEL_Series_slice_62(:,:,62:213),3);
WVEL_62_JFMAMJ_slice_std = std(WVEL_Series_slice_62(:,:,62:213),0,3);
UVEL_62_JFMAMJ_slice_avg = mean(UVEL_Series_slice_62(:,:,62:213),3);
UVEL_62_JFMAMJ_slice_std = std(UVEL_Series_slice_62(:,:,62:213),0,3);
VVEL_62_JFMAMJ_slice_avg = mean(VVEL_Series_slice_62(:,:,62:213),3);
VVEL_62_JFMAMJ_slice_std = std(VVEL_Series_slice_62(:,:,62:213),0,3);
DIC_62_JFMAMJ_slice_avg = mean(DIC_Series_slice_62(:,:,62:213),3);
ALK_62_JFMAMJ_slice_avg = mean(ALK_Series_slice_62(:,:,62:213),3);
O2_62_JFMAMJ_slice_avg = mean(O2_Series_slice_62(:,:,62:213),3);
NO3_62_JFMAMJ_slice_avg = mean(NO3_Series_slice_62(:,:,62:213),3);

THETA_62_DN_slice_avg = mean(THETA_Series_slice_62(:,:,1:364),3);
SALT_62_DN_slice_avg = mean(SALT_Series_slice_62(:,:,1:364),3);
WVEL_62_DN_slice_avg = mean(WVEL_Series_slice_62(:,:,1:364),3);
WVEL_62_DN_slice_std = std(WVEL_Series_slice_62(:,:,1:364),0,3);
UVEL_62_DN_slice_avg = mean(UVEL_Series_slice_62(:,:,1:364),3);
UVEL_62_DN_slice_std = std(UVEL_Series_slice_62(:,:,1:364),0,3);
VVEL_62_DN_slice_avg = mean(VVEL_Series_slice_62(:,:,1:364),3);
VVEL_62_DN_slice_std = std(VVEL_Series_slice_62(:,:,1:364),0,3);
DIC_62_DN_slice_avg = mean(DIC_Series_slice_62(:,:,1:364),3);
ALK_62_DN_slice_avg = mean(ALK_Series_slice_62(:,:,1:364),3);
O2_62_DN_slice_avg = mean(O2_Series_slice_62(:,:,1:364),3);
NO3_62_DN_slice_avg = mean(NO3_Series_slice_62(:,:,1:364),3);

THETA_62_JD_slice_avg = mean(THETA_Series_slice_62(:,:,62:395),3);
SALT_62_JD_slice_avg = mean(SALT_Series_slice_62(:,:,62:395),3);
WVEL_62_JD_slice_avg = mean(WVEL_Series_slice_62(:,:,62:395),3);
WVEL_62_JD_slice_std = std(WVEL_Series_slice_62(:,:,62:395),0,3);
UVEL_62_JD_slice_avg = mean(UVEL_Series_slice_62(:,:,62:395),3);
UVEL_62_JD_slice_std = std(UVEL_Series_slice_62(:,:,62:395),0,3);
VVEL_62_JD_slice_avg = mean(VVEL_Series_slice_62(:,:,62:395),3);
VVEL_62_JD_slice_std = std(VVEL_Series_slice_62(:,:,62:395),0,3);
DIC_62_JD_slice_avg = mean(DIC_Series_slice_62(:,:,62:395),3);
ALK_62_JD_slice_avg = mean(ALK_Series_slice_62(:,:,62:395),3);
O2_62_JD_slice_avg = mean(O2_Series_slice_62(:,:,62:395),3);
NO3_62_JD_slice_avg = mean(NO3_Series_slice_62(:,:,62:395),3);

[m62,n62] = size(THETA_62_DJF_slice_avg);

parfor ii=1:m62
    for jj=1:n62
        if (HC(slice_index,ii,jj)==0)
            THETA_Series_slice_62(ii,jj,:) = 99999999999;
            SALT_Series_slice_62(ii,jj,:) = 99999999999;
            WVEL_Series_slice_62(ii,jj,:) = 99999999999;
            UVEL_Series_slice_62(ii,jj,:) = 99999999999;
            VVEL_Series_slice_62(ii,jj,:) = 99999999999;
            DIC_Series_slice_62(ii,jj,:) = 99999999999;
            ALK_Series_slice_62(ii,jj,:) = 99999999999;
            O2_Series_slice_62(ii,jj,:) = 99999999999;
            NO3_Series_slice_62(ii,jj,:) = 99999999999;
            
            THETA_62_DJF_slice_avg(ii,jj) = 99999999999;
            SALT_62_DJF_slice_avg(ii,jj) = 99999999999;
            DIC_62_DJF_slice_avg(ii,jj) = 99999999999;
            ALK_62_DJF_slice_avg(ii,jj) = 99999999999;
            WVEL_62_DJF_slice_avg(ii,jj) = 99999999999;
            VVEL_62_DJF_slice_avg(ii,jj) = 99999999999;
            UVEL_62_DJF_slice_avg(ii,jj) = 99999999999;
            O2_62_DJF_slice_avg(ii,jj) = 99999999999;
            NO3_62_DJF_slice_avg(ii,jj) = 99999999999;
            
            THETA_62_JFM_slice_avg(ii,jj) = 99999999999;
            SALT_62_JFM_slice_avg(ii,jj) = 99999999999;
            DIC_62_JFM_slice_avg(ii,jj) = 99999999999;
            ALK_62_JFM_slice_avg(ii,jj) = 99999999999;
            WVEL_62_JFM_slice_avg(ii,jj) = 99999999999;
            VVEL_62_JFM_slice_avg(ii,jj) = 99999999999;
            UVEL_62_JFM_slice_avg(ii,jj) = 99999999999;
            O2_62_JFM_slice_avg(ii,jj) = 99999999999;
            NO3_62_JFM_slice_avg(ii,jj) = 99999999999;
            
            THETA_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            SALT_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            DIC_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            ALK_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            WVEL_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            VVEL_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            UVEL_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            O2_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            NO3_62_DJFMAM_slice_avg(ii,jj) = 99999999999;
            
            THETA_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            SALT_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            DIC_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            ALK_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            WVEL_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            VVEL_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            UVEL_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            O2_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            NO3_62_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            
            THETA_62_DN_slice_avg(ii,jj) = 99999999999;
            SALT_62_DN_slice_avg(ii,jj) = 99999999999;
            DIC_62_DN_slice_avg(ii,jj) = 99999999999;
            ALK_62_DN_slice_avg(ii,jj) = 99999999999;
            WVEL_62_DN_slice_avg(ii,jj) = 99999999999;
            VVEL_62_DN_slice_avg(ii,jj) = 99999999999;
            UVEL_62_DN_slice_avg(ii,jj) = 99999999999;
            O2_62_DN_slice_avg(ii,jj) = 99999999999;
            NO3_62_DN_slice_avg(ii,jj) = 99999999999;
            
            THETA_62_JD_slice_avg(ii,jj) = 99999999999;
            SALT_62_JD_slice_avg(ii,jj) = 99999999999;
            DIC_62_JD_slice_avg(ii,jj) = 99999999999;
            ALK_62_JD_slice_avg(ii,jj) = 99999999999;
            WVEL_62_JD_slice_avg(ii,jj) = 99999999999;
            VVEL_62_JD_slice_avg(ii,jj) = 99999999999;
            UVEL_62_JD_slice_avg(ii,jj) = 99999999999;
            O2_62_JD_slice_avg(ii,jj) = 99999999999;
            NO3_62_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end


clear char62* temp62* n62 m62 *field62 ii jj
save AB62_output_slice_vert

fprintf('finished 62 \n')

%% end 62


