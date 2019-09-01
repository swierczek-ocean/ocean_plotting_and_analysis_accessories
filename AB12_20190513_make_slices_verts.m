
%% 122

tfield122 = 1;
sfield122 = 2;
wfield122 = 3;
ufield122 = 3;
vfield122 = 4;
tffield122 = 1;
sffield122 = 2;
cfield122 = 3;
ofield122 = 4;
efield122 = 1;
mfield122 = 4;
dfield122 = 1;
afield122 = 2;
agfield122 = 9;
pcfield122 = 2;
no3field122 = 4;
o2field122 = 3;

slice_index = 223;

THETA_Series_vert_122 = zeros(756,512,395);
DIC_Series_vert_122 = zeros(756,512,395);
O2_Series_vert_122 = zeros(756,512,395);
NO3_Series_vert_122 = zeros(756,512,395);

THETA_Series_vert_t122 = zeros(756,512,395);
DIC_Series_vert_t122 = zeros(756,512,395);
O2_Series_vert_t122 = zeros(756,512,395);
NO3_Series_vert_t122 = zeros(756,512,395);

THETA_Series_slice_122 = zeros(512,104,395);
SALT_Series_slice_122 = zeros(512,104,395);
WVEL_Series_slice_122 = zeros(512,104,395);
UVEL_Series_slice_122 = zeros(512,104,395);
VVEL_Series_slice_122 = zeros(512,104,395);
DIC_Series_slice_122 = zeros(512,104,395);
ALK_Series_slice_122 = zeros(512,104,395);
O2_Series_slice_122 = zeros(512,104,395);
NO3_Series_slice_122 = zeros(512,104,395);
TFLUX_Series_slice_122 = zeros(512,395);
SFLUX_Series_slice_122 = zeros(512,395);
CFLUX_Series_slice_122 = zeros(512,395);
OFLUX_Series_slice_122 = zeros(512,395);
ETAN_Series_slice_122 = zeros(512,395);
MLD_Series_slice_122 = zeros(512,395);
PCO2_Series_slice_122 = zeros(512,395);

HC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
DRF_temp = rdmds('../MITgcm/verification/SO12_20190513/run/DRF');
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

depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag_slice/';

for ii=1:2
    char122state = [str,'diag_state.0000000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    THETA_Series_vert_t122(:,:,ii) = sum(temp122state(:,:,:,tfield122).*Volume,3);
    THETA_Series_vert_122(:,:,ii) = THETA_Series_vert_t122(:,:,ii)./Height;
    THETA_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,tfield122);
    SALT_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,sfield122);
    WVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,wfield122);
    UVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,ufield122);
    VVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,vfield122);
    clear temp122state
    char122surf = [str,'diag_surf.0000000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series_slice_122(:,ii) = temp122surf(slice_index,:,efield122); 
    MLD_Series_slice_122(:,ii) = temp122surf(slice_index,:,mfield122);
    PCO2_Series_slice_122(:,ii) = temp122surf(slice_index,:,pcfield122);
    clear temp122surf
    char122airsea = [str,'diag_airsea.0000000',num2str(360*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,tffield122);
    SFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,sffield122);
    CFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,cfield122);
    OFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,ofield122);
    clear temp122airsea
    char122bgc = [str,'diag_bgc.0000000',num2str(360*ii)];
    temp122bgc = rdmds(char122bgc); 
    DIC_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,dfield122);
    ALK_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,afield122);
    O2_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,o2field122);
    NO3_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,no3field122);
    DIC_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,dfield122).*Volume,3);
    DIC_Series_vert_122(:,:,ii) = DIC_Series_vert_t122(:,:,ii)./Height;
    O2_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,o2field122).*Volume,3);
    O2_Series_vert_122(:,:,ii) = O2_Series_vert_t122(:,:,ii)./Height;
    NO3_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,no3field122).*Volume,3);
    NO3_Series_vert_122(:,:,ii) = NO3_Series_vert_t122(:,:,ii)./Height;
    clear temp122bgc
end

for ii=3:27
    char122state = [str,'diag_state.000000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    THETA_Series_vert_t122(:,:,ii) = sum(temp122state(:,:,:,tfield122).*Volume,3);
    THETA_Series_vert_122(:,:,ii) = THETA_Series_vert_t122(:,:,ii)./Height;
    THETA_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,tfield122);
    SALT_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,sfield122);
    WVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,wfield122);
    UVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,ufield122);
    VVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,vfield122);
    clear temp122state
    char122surf = [str,'diag_surf.000000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series_slice_122(:,ii) = temp122surf(slice_index,:,efield122); 
    MLD_Series_slice_122(:,ii) = temp122surf(slice_index,:,mfield122);
    PCO2_Series_slice_122(:,ii) = temp122surf(slice_index,:,pcfield122);
    clear temp122surf
    char122airsea = [str,'diag_airsea.000000',num2str(360*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,tffield122);
    SFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,sffield122);
    CFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,cfield122);
    OFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,ofield122);
    clear temp122airsea
    char122bgc = [str,'diag_bgc.000000',num2str(360*ii)];
    temp122bgc = rdmds(char122bgc); 
    DIC_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,dfield122);
    ALK_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,afield122);
    O2_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,o2field122);
    NO3_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,no3field122);
    DIC_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,dfield122).*Volume,3);
    DIC_Series_vert_122(:,:,ii) = DIC_Series_vert_t122(:,:,ii)./Height;
    O2_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,o2field122).*Volume,3);
    O2_Series_vert_122(:,:,ii) = O2_Series_vert_t122(:,:,ii)./Height;
    NO3_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,no3field122).*Volume,3);
    NO3_Series_vert_122(:,:,ii) = NO3_Series_vert_t122(:,:,ii)./Height;
    clear temp122bgc
end

for ii=28:277
    char122state = [str,'diag_state.00000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    THETA_Series_vert_t122(:,:,ii) = sum(temp122state(:,:,:,tfield122).*Volume,3);
    THETA_Series_vert_122(:,:,ii) = THETA_Series_vert_t122(:,:,ii)./Height;
    THETA_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,tfield122);
    SALT_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,sfield122);
    WVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,wfield122);
    UVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,ufield122);
    VVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,vfield122);
    clear temp122state
    char122surf = [str,'diag_surf.00000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series_slice_122(:,ii) = temp122surf(slice_index,:,efield122); 
    MLD_Series_slice_122(:,ii) = temp122surf(slice_index,:,mfield122);
    PCO2_Series_slice_122(:,ii) = temp122surf(slice_index,:,pcfield122);
    clear temp122surf
    char122airsea = [str,'diag_airsea.00000',num2str(360*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,tffield122);
    SFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,sffield122);
    CFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,cfield122);
    OFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,ofield122);
    clear temp122airsea
    char122bgc = [str,'diag_bgc.00000',num2str(360*ii)];
    temp122bgc = rdmds(char122bgc); 
    DIC_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,dfield122);
    ALK_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,afield122);
    O2_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,o2field122);
    NO3_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,no3field122);
    DIC_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,dfield122).*Volume,3);
    DIC_Series_vert_122(:,:,ii) = DIC_Series_vert_t122(:,:,ii)./Height;
    O2_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,o2field122).*Volume,3);
    O2_Series_vert_122(:,:,ii) = O2_Series_vert_t122(:,:,ii)./Height;
    NO3_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,no3field122).*Volume,3);
    NO3_Series_vert_122(:,:,ii) = NO3_Series_vert_t122(:,:,ii)./Height;
    clear temp122bgc
end

for ii=278:395
    char122state = [str,'diag_state.0000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    THETA_Series_vert_t122(:,:,ii) = sum(temp122state(:,:,:,tfield122).*Volume,3);
    THETA_Series_vert_122(:,:,ii) = THETA_Series_vert_t122(:,:,ii)./Height;
    THETA_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,tfield122);
    SALT_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,sfield122);
    WVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,wfield122);
    UVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,ufield122);
    VVEL_Series_slice_122(:,:,ii) = temp122state(slice_index,:,:,vfield122);
    clear temp122state
    char122surf = [str,'diag_surf.0000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series_slice_122(:,ii) = temp122surf(slice_index,:,efield122); 
    MLD_Series_slice_122(:,ii) = temp122surf(slice_index,:,mfield122);
    PCO2_Series_slice_122(:,ii) = temp122surf(slice_index,:,pcfield122);
    clear temp122surf
    char122airsea = [str,'diag_airsea.0000',num2str(360*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,tffield122);
    SFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,sffield122);
    CFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,cfield122);
    OFLUX_Series_slice_122(:,:,ii) = temp122airsea(slice_index,:,ofield122);
    clear temp122airsea
    char122bgc = [str,'diag_bgc.0000',num2str(360*ii)];
    temp122bgc = rdmds(char122bgc); 
    DIC_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,dfield122);
    ALK_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,afield122);
    O2_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,o2field122);
    NO3_Series_slice_122(:,:,ii) = temp122bgc(slice_index,:,:,no3field122);
    DIC_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,dfield122).*Volume,3);
    DIC_Series_vert_122(:,:,ii) = DIC_Series_vert_t122(:,:,ii)./Height;
    O2_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,o2field122).*Volume,3);
    O2_Series_vert_122(:,:,ii) = O2_Series_vert_t122(:,:,ii)./Height;
    NO3_Series_vert_t122(:,:,ii) = sum(temp122bgc(:,:,:,no3field122).*Volume,3);
    NO3_Series_vert_122(:,:,ii) = NO3_Series_vert_t122(:,:,ii)./Height;
    clear temp122bgc
end


THETA_122_DJF_slice_avg = mean(THETA_Series_slice_122(:,:,1:91),3);
SALT_122_DJF_slice_avg = mean(SALT_Series_slice_122(:,:,1:91),3);
WVEL_122_DJF_slice_avg = mean(WVEL_Series_slice_122(:,:,1:91),3);
WVEL_122_DJF_slice_std = std(WVEL_Series_slice_122(:,:,1:91),0,3);
UVEL_122_DJF_slice_avg = mean(UVEL_Series_slice_122(:,:,1:91),3);
UVEL_122_DJF_slice_std = std(UVEL_Series_slice_122(:,:,1:91),0,3);
VVEL_122_DJF_slice_avg = mean(VVEL_Series_slice_122(:,:,1:91),3);
VVEL_122_DJF_slice_std = std(VVEL_Series_slice_122(:,:,1:91),0,3);
DIC_122_DJF_slice_avg = mean(DIC_Series_slice_122(:,:,1:91),3);
ALK_122_DJF_slice_avg = mean(ALK_Series_slice_122(:,:,1:91),3);
O2_122_DJF_slice_avg = mean(O2_Series_slice_122(:,:,1:91),3);
NO3_122_DJF_slice_avg = mean(NO3_Series_slice_122(:,:,1:91),3);

THETA_122_JFM_slice_avg = mean(THETA_Series_slice_122(:,:,122:122),3);
SALT_122_JFM_slice_avg = mean(SALT_Series_slice_122(:,:,122:122),3);
WVEL_122_JFM_slice_avg = mean(WVEL_Series_slice_122(:,:,122:122),3);
WVEL_122_JFM_slice_std = std(WVEL_Series_slice_122(:,:,122:122),0,3);
UVEL_122_JFM_slice_avg = mean(UVEL_Series_slice_122(:,:,122:122),3);
UVEL_122_JFM_slice_std = std(UVEL_Series_slice_122(:,:,122:122),0,3);
VVEL_122_JFM_slice_avg = mean(VVEL_Series_slice_122(:,:,122:122),3);
VVEL_122_JFM_slice_std = std(VVEL_Series_slice_122(:,:,122:122),0,3);
DIC_122_JFM_slice_avg = mean(DIC_Series_slice_122(:,:,122:122),3);
ALK_122_JFM_slice_avg = mean(ALK_Series_slice_122(:,:,122:122),3);
O2_122_JFM_slice_avg = mean(O2_Series_slice_122(:,:,122:122),3);
NO3_122_JFM_slice_avg = mean(NO3_Series_slice_122(:,:,122:122),3);

THETA_122_DJFMAM_slice_avg = mean(THETA_Series_slice_122(:,:,1:182),3);
SALT_122_DJFMAM_slice_avg = mean(SALT_Series_slice_122(:,:,1:182),3);
WVEL_122_DJFMAM_slice_avg = mean(WVEL_Series_slice_122(:,:,1:182),3);
WVEL_122_DJFMAM_slice_std = std(WVEL_Series_slice_122(:,:,1:182),0,3);
UVEL_122_DJFMAM_slice_avg = mean(UVEL_Series_slice_122(:,:,1:182),3);
UVEL_122_DJFMAM_slice_std = std(UVEL_Series_slice_122(:,:,1:182),0,3);
VVEL_122_DJFMAM_slice_avg = mean(VVEL_Series_slice_122(:,:,1:182),3);
VVEL_122_DJFMAM_slice_std = std(VVEL_Series_slice_122(:,:,1:182),0,3);
DIC_122_DJFMAM_slice_avg = mean(DIC_Series_slice_122(:,:,1:182),3);
ALK_122_DJFMAM_slice_avg = mean(ALK_Series_slice_122(:,:,1:182),3);
O2_122_DJFMAM_slice_avg = mean(O2_Series_slice_122(:,:,1:182),3);
NO3_122_DJFMAM_slice_avg = mean(NO3_Series_slice_122(:,:,1:182),3);

THETA_122_JFMAMJ_slice_avg = mean(THETA_Series_slice_122(:,:,122:213),3);
SALT_122_JFMAMJ_slice_avg = mean(SALT_Series_slice_122(:,:,122:213),3);
WVEL_122_JFMAMJ_slice_avg = mean(WVEL_Series_slice_122(:,:,122:213),3);
WVEL_122_JFMAMJ_slice_std = std(WVEL_Series_slice_122(:,:,122:213),0,3);
UVEL_122_JFMAMJ_slice_avg = mean(UVEL_Series_slice_122(:,:,122:213),3);
UVEL_122_JFMAMJ_slice_std = std(UVEL_Series_slice_122(:,:,122:213),0,3);
VVEL_122_JFMAMJ_slice_avg = mean(VVEL_Series_slice_122(:,:,122:213),3);
VVEL_122_JFMAMJ_slice_std = std(VVEL_Series_slice_122(:,:,122:213),0,3);
DIC_122_JFMAMJ_slice_avg = mean(DIC_Series_slice_122(:,:,122:213),3);
ALK_122_JFMAMJ_slice_avg = mean(ALK_Series_slice_122(:,:,122:213),3);
O2_122_JFMAMJ_slice_avg = mean(O2_Series_slice_122(:,:,122:213),3);
NO3_122_JFMAMJ_slice_avg = mean(NO3_Series_slice_122(:,:,122:213),3);

THETA_122_DN_slice_avg = mean(THETA_Series_slice_122(:,:,1:364),3);
SALT_122_DN_slice_avg = mean(SALT_Series_slice_122(:,:,1:364),3);
WVEL_122_DN_slice_avg = mean(WVEL_Series_slice_122(:,:,1:364),3);
WVEL_122_DN_slice_std = std(WVEL_Series_slice_122(:,:,1:364),0,3);
UVEL_122_DN_slice_avg = mean(UVEL_Series_slice_122(:,:,1:364),3);
UVEL_122_DN_slice_std = std(UVEL_Series_slice_122(:,:,1:364),0,3);
VVEL_122_DN_slice_avg = mean(VVEL_Series_slice_122(:,:,1:364),3);
VVEL_122_DN_slice_std = std(VVEL_Series_slice_122(:,:,1:364),0,3);
DIC_122_DN_slice_avg = mean(DIC_Series_slice_122(:,:,1:364),3);
ALK_122_DN_slice_avg = mean(ALK_Series_slice_122(:,:,1:364),3);
O2_122_DN_slice_avg = mean(O2_Series_slice_122(:,:,1:364),3);
NO3_122_DN_slice_avg = mean(NO3_Series_slice_122(:,:,1:364),3);

THETA_122_JD_slice_avg = mean(THETA_Series_slice_122(:,:,122:395),3);
SALT_122_JD_slice_avg = mean(SALT_Series_slice_122(:,:,122:395),3);
WVEL_122_JD_slice_avg = mean(WVEL_Series_slice_122(:,:,122:395),3);
WVEL_122_JD_slice_std = std(WVEL_Series_slice_122(:,:,122:395),0,3);
UVEL_122_JD_slice_avg = mean(UVEL_Series_slice_122(:,:,122:395),3);
UVEL_122_JD_slice_std = std(UVEL_Series_slice_122(:,:,122:395),0,3);
VVEL_122_JD_slice_avg = mean(VVEL_Series_slice_122(:,:,122:395),3);
VVEL_122_JD_slice_std = std(VVEL_Series_slice_122(:,:,122:395),0,3);
DIC_122_JD_slice_avg = mean(DIC_Series_slice_122(:,:,122:395),3);
ALK_122_JD_slice_avg = mean(ALK_Series_slice_122(:,:,122:395),3);
O2_122_JD_slice_avg = mean(O2_Series_slice_122(:,:,122:395),3);
NO3_122_JD_slice_avg = mean(NO3_Series_slice_122(:,:,122:395),3);

[m122,n122] = size(THETA_122_DJF_slice_avg);

parfor ii=1:m122
    for jj=1:n122
        if (HC(slice_index,ii,jj)==0)
            THETA_Series_slice_122(ii,jj,:) = 99999999999;
            SALT_Series_slice_122(ii,jj,:) = 99999999999;
            WVEL_Series_slice_122(ii,jj,:) = 99999999999;
            UVEL_Series_slice_122(ii,jj,:) = 99999999999;
            VVEL_Series_slice_122(ii,jj,:) = 99999999999;
            DIC_Series_slice_122(ii,jj,:) = 99999999999;
            ALK_Series_slice_122(ii,jj,:) = 99999999999;
            O2_Series_slice_122(ii,jj,:) = 99999999999;
            NO3_Series_slice_122(ii,jj,:) = 99999999999;
            
            THETA_122_DJF_slice_avg(ii,jj) = 99999999999;
            SALT_122_DJF_slice_avg(ii,jj) = 99999999999;
            DIC_122_DJF_slice_avg(ii,jj) = 99999999999;
            ALK_122_DJF_slice_avg(ii,jj) = 99999999999;
            WVEL_122_DJF_slice_avg(ii,jj) = 99999999999;
            VVEL_122_DJF_slice_avg(ii,jj) = 99999999999;
            UVEL_122_DJF_slice_avg(ii,jj) = 99999999999;
            O2_122_DJF_slice_avg(ii,jj) = 99999999999;
            NO3_122_DJF_slice_avg(ii,jj) = 99999999999;
            
            THETA_122_JFM_slice_avg(ii,jj) = 99999999999;
            SALT_122_JFM_slice_avg(ii,jj) = 99999999999;
            DIC_122_JFM_slice_avg(ii,jj) = 99999999999;
            ALK_122_JFM_slice_avg(ii,jj) = 99999999999;
            WVEL_122_JFM_slice_avg(ii,jj) = 99999999999;
            VVEL_122_JFM_slice_avg(ii,jj) = 99999999999;
            UVEL_122_JFM_slice_avg(ii,jj) = 99999999999;
            O2_122_JFM_slice_avg(ii,jj) = 99999999999;
            NO3_122_JFM_slice_avg(ii,jj) = 99999999999;
            
            THETA_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            SALT_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            DIC_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            ALK_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            WVEL_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            VVEL_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            UVEL_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            O2_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            NO3_122_DJFMAM_slice_avg(ii,jj) = 99999999999;
            
            THETA_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            SALT_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            DIC_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            ALK_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            WVEL_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            VVEL_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            UVEL_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            O2_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            NO3_122_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            
            THETA_122_DN_slice_avg(ii,jj) = 99999999999;
            SALT_122_DN_slice_avg(ii,jj) = 99999999999;
            DIC_122_DN_slice_avg(ii,jj) = 99999999999;
            ALK_122_DN_slice_avg(ii,jj) = 99999999999;
            WVEL_122_DN_slice_avg(ii,jj) = 99999999999;
            VVEL_122_DN_slice_avg(ii,jj) = 99999999999;
            UVEL_122_DN_slice_avg(ii,jj) = 99999999999;
            O2_122_DN_slice_avg(ii,jj) = 99999999999;
            NO3_122_DN_slice_avg(ii,jj) = 99999999999;
            
            THETA_122_JD_slice_avg(ii,jj) = 99999999999;
            SALT_122_JD_slice_avg(ii,jj) = 99999999999;
            DIC_122_JD_slice_avg(ii,jj) = 99999999999;
            ALK_122_JD_slice_avg(ii,jj) = 99999999999;
            WVEL_122_JD_slice_avg(ii,jj) = 99999999999;
            VVEL_122_JD_slice_avg(ii,jj) = 99999999999;
            UVEL_122_JD_slice_avg(ii,jj) = 99999999999;
            O2_122_JD_slice_avg(ii,jj) = 99999999999;
            NO3_122_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end


clear char122* temp122* n122 m122 *field122 ii jj
save AB122_output_slice_vert

fprintf('finished 122 \n')

%% end 122


