
%% 64

tfield64 = 1;
sfield64 = 2;
wfield64 = 3;
ufield64 = 3;
vfield64 = 4;
tffield64 = 1;
sffield64 = 2;
cfield64 = 3;
ofield64 = 4;
efield64 = 1;
mfield64 = 4;
dfield64 = 1;
afield64 = 2;
agfield64 = 9;
pcfield64 = 2;
no3field64 = 4;
o2field64 = 3;

slice_index = 114;

THETA_Series_vert_64 = zeros(384,260,213);
DIC_Series_vert_64 = zeros(384,260,213);
O2_Series_vert_64 = zeros(384,260,213);
NO3_Series_vert_64 = zeros(384,260,213);

THETA_Series_vert_t64 = zeros(384,260,213);
DIC_Series_vert_t64 = zeros(384,260,213);
O2_Series_vert_t64 = zeros(384,260,213);
NO3_Series_vert_t64 = zeros(384,260,213);

THETA_Series_slice_64 = zeros(260,52,213);
SALT_Series_slice_64 = zeros(260,52,213);
WVEL_Series_slice_64 = zeros(260,52,213);
UVEL_Series_slice_64 = zeros(260,52,213);
VVEL_Series_slice_64 = zeros(260,52,213);
DIC_Series_slice_64 = zeros(260,52,213);
ALK_Series_slice_64 = zeros(260,52,213);
O2_Series_slice_64 = zeros(260,52,213);
NO3_Series_slice_64 = zeros(260,52,213);
TFLUX_Series_slice_64 = zeros(260,213);
SFLUX_Series_slice_64 = zeros(260,213);
CFLUX_Series_slice_64 = zeros(260,213);
OFLUX_Series_slice_64 = zeros(260,213);
ETAN_Series_slice_64 = zeros(260,213);
MLD_Series_slice_64 = zeros(260,213);
PCO2_Series_slice_64 = zeros(260,213);

HC = rdmds('../MITgcm/verification/SO6_20190515/run/hFacC');
DRF_temp = rdmds('../MITgcm/verification/SO6_20190515/run/DRF');
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

depth64 = 1;
str = '../MITgcm/verification/SO6_20190515/diag_slice/';

for ii=1:1
    char64state = [str,'diag_state.00000000',num2str(72*ii)];
    temp64state = rdmds(char64state);
    THETA_Series_vert_t64(:,:,ii) = sum(temp64state(:,:,:,tfield64).*Volume,3);
    THETA_Series_vert_64(:,:,ii) = THETA_Series_vert_t64(:,:,ii)./Height;
    THETA_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,tfield64);
    SALT_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,sfield64);
    WVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,wfield64);
    UVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,ufield64);
    VVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,vfield64);
    clear temp64state
    char64surf = [str,'diag_surf.00000000',num2str(72*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series_slice_64(:,ii) = temp64surf(slice_index,:,efield64); 
    MLD_Series_slice_64(:,ii) = temp64surf(slice_index,:,mfield64);
    PCO2_Series_slice_64(:,ii) = temp64surf(slice_index,:,pcfield64);
    clear temp64surf
    char64airsea = [str,'diag_airsea.00000000',num2str(72*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,tffield64);
    SFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,sffield64);
    CFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,cfield64);
    OFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,ofield64);
    clear temp64airsea
    char64bgc = [str,'diag_bgc.00000000',num2str(72*ii)];
    temp64bgc = rdmds(char64bgc); 
    DIC_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,dfield64);
    ALK_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,afield64);
    O2_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,o2field64);
    NO3_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,no3field64);
    DIC_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,dfield64).*Volume,3);
    DIC_Series_vert_64(:,:,ii) = DIC_Series_vert_t64(:,:,ii)./Height;
    O2_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,o2field64).*Volume,3);
    O2_Series_vert_64(:,:,ii) = O2_Series_vert_t64(:,:,ii)./Height;
    NO3_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,no3field64).*Volume,3);
    NO3_Series_vert_64(:,:,ii) = NO3_Series_vert_t64(:,:,ii)./Height;
    clear temp64bgc
end

for ii=2:13
    char64state = [str,'diag_state.0000000',num2str(72*ii)];
    temp64state = rdmds(char64state);
    THETA_Series_vert_t64(:,:,ii) = sum(temp64state(:,:,:,tfield64).*Volume,3);
    THETA_Series_vert_64(:,:,ii) = THETA_Series_vert_t64(:,:,ii)./Height;
    THETA_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,tfield64);
    SALT_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,sfield64);
    WVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,wfield64);
    UVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,ufield64);
    VVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,vfield64);
    clear temp64state
    char64surf = [str,'diag_surf.0000000',num2str(72*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series_slice_64(:,ii) = temp64surf(slice_index,:,efield64); 
    MLD_Series_slice_64(:,ii) = temp64surf(slice_index,:,mfield64);
    PCO2_Series_slice_64(:,ii) = temp64surf(slice_index,:,pcfield64);
    clear temp64surf
    char64airsea = [str,'diag_airsea.0000000',num2str(72*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,tffield64);
    SFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,sffield64);
    CFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,cfield64);
    OFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,ofield64);
    clear temp64airsea
    char64bgc = [str,'diag_bgc.0000000',num2str(72*ii)];
    temp64bgc = rdmds(char64bgc); 
    DIC_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,dfield64);
    ALK_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,afield64);
    O2_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,o2field64);
    NO3_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,no3field64);
    DIC_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,dfield64).*Volume,3);
    DIC_Series_vert_64(:,:,ii) = DIC_Series_vert_t64(:,:,ii)./Height;
    O2_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,o2field64).*Volume,3);
    O2_Series_vert_64(:,:,ii) = O2_Series_vert_t64(:,:,ii)./Height;
    NO3_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,no3field64).*Volume,3);
    NO3_Series_vert_64(:,:,ii) = NO3_Series_vert_t64(:,:,ii)./Height;
    clear temp64bgc
end

for ii=14:138
    char64state = [str,'diag_state.000000',num2str(72*ii)];
    temp64state = rdmds(char64state);
    THETA_Series_vert_t64(:,:,ii) = sum(temp64state(:,:,:,tfield64).*Volume,3);
    THETA_Series_vert_64(:,:,ii) = THETA_Series_vert_t64(:,:,ii)./Height;
    THETA_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,tfield64);
    SALT_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,sfield64);
    WVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,wfield64);
    UVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,ufield64);
    VVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,vfield64);
    clear temp64state
    char64surf = [str,'diag_surf.000000',num2str(72*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series_slice_64(:,ii) = temp64surf(slice_index,:,efield64); 
    MLD_Series_slice_64(:,ii) = temp64surf(slice_index,:,mfield64);
    PCO2_Series_slice_64(:,ii) = temp64surf(slice_index,:,pcfield64);
    clear temp64surf
    char64airsea = [str,'diag_airsea.000000',num2str(72*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,tffield64);
    SFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,sffield64);
    CFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,cfield64);
    OFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,ofield64);
    clear temp64airsea
    char64bgc = [str,'diag_bgc.000000',num2str(72*ii)];
    temp64bgc = rdmds(char64bgc); 
    DIC_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,dfield64);
    ALK_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,afield64);
    O2_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,o2field64);
    NO3_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,no3field64);
    DIC_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,dfield64).*Volume,3);
    DIC_Series_vert_64(:,:,ii) = DIC_Series_vert_t64(:,:,ii)./Height;
    O2_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,o2field64).*Volume,3);
    O2_Series_vert_64(:,:,ii) = O2_Series_vert_t64(:,:,ii)./Height;
    NO3_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,no3field64).*Volume,3);
    NO3_Series_vert_64(:,:,ii) = NO3_Series_vert_t64(:,:,ii)./Height;
    clear temp64bgc
end

for ii=139:213
    char64state = [str,'diag_state.00000',num2str(72*ii)];
    temp64state = rdmds(char64state);
    THETA_Series_vert_t64(:,:,ii) = sum(temp64state(:,:,:,tfield64).*Volume,3);
    THETA_Series_vert_64(:,:,ii) = THETA_Series_vert_t64(:,:,ii)./Height;
    THETA_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,tfield64);
    SALT_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,sfield64);
    WVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,wfield64);
    UVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,ufield64);
    VVEL_Series_slice_64(:,:,ii) = temp64state(slice_index,:,:,vfield64);
    clear temp64state
    char64surf = [str,'diag_surf.00000',num2str(72*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series_slice_64(:,ii) = temp64surf(slice_index,:,efield64); 
    MLD_Series_slice_64(:,ii) = temp64surf(slice_index,:,mfield64);
    PCO2_Series_slice_64(:,ii) = temp64surf(slice_index,:,pcfield64);
    clear temp64surf
    char64airsea = [str,'diag_airsea.00000',num2str(72*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,tffield64);
    SFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,sffield64);
    CFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,cfield64);
    OFLUX_Series_slice_64(:,ii) = temp64airsea(slice_index,:,ofield64);
    clear temp64airsea
    char64bgc = [str,'diag_bgc.00000',num2str(72*ii)];
    temp64bgc = rdmds(char64bgc); 
    DIC_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,dfield64);
    ALK_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,afield64);
    O2_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,o2field64);
    NO3_Series_slice_64(:,:,ii) = temp64bgc(slice_index,:,:,no3field64);
    DIC_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,dfield64).*Volume,3);
    DIC_Series_vert_64(:,:,ii) = DIC_Series_vert_t64(:,:,ii)./Height;
    O2_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,o2field64).*Volume,3);
    O2_Series_vert_64(:,:,ii) = O2_Series_vert_t64(:,:,ii)./Height;
    NO3_Series_vert_t64(:,:,ii) = sum(temp64bgc(:,:,:,no3field64).*Volume,3);
    NO3_Series_vert_64(:,:,ii) = NO3_Series_vert_t64(:,:,ii)./Height;
    clear temp64bgc
end


THETA_64_JJA_slice_avg = mean(THETA_Series_slice_64(:,:,1:91),3);
SALT_64_JJA_slice_avg = mean(SALT_Series_slice_64(:,:,1:91),3);
WVEL_64_JJA_slice_avg = mean(WVEL_Series_slice_64(:,:,1:91),3);
WVEL_64_JJA_slice_std = std(WVEL_Series_slice_64(:,:,1:91),0,3);
UVEL_64_JJA_slice_avg = mean(UVEL_Series_slice_64(:,:,1:91),3);
UVEL_64_JJA_slice_std = std(UVEL_Series_slice_64(:,:,1:91),0,3);
VVEL_64_JJA_slice_avg = mean(VVEL_Series_slice_64(:,:,1:91),3);
VVEL_64_JJA_slice_std = std(VVEL_Series_slice_64(:,:,1:91),0,3);
DIC_64_JJA_slice_avg = mean(DIC_Series_slice_64(:,:,1:91),3);
ALK_64_JJA_slice_avg = mean(ALK_Series_slice_64(:,:,1:91),3);
O2_64_JJA_slice_avg = mean(O2_Series_slice_64(:,:,1:91),3);
NO3_64_JJA_slice_avg = mean(NO3_Series_slice_64(:,:,1:91),3);

THETA_64_JAS_slice_avg = mean(THETA_Series_slice_64(:,:,64:122),3);
SALT_64_JAS_slice_avg = mean(SALT_Series_slice_64(:,:,64:122),3);
WVEL_64_JAS_slice_avg = mean(WVEL_Series_slice_64(:,:,64:122),3);
WVEL_64_JAS_slice_std = std(WVEL_Series_slice_64(:,:,64:122),0,3);
UVEL_64_JAS_slice_avg = mean(UVEL_Series_slice_64(:,:,64:122),3);
UVEL_64_JAS_slice_std = std(UVEL_Series_slice_64(:,:,64:122),0,3);
VVEL_64_JAS_slice_avg = mean(VVEL_Series_slice_64(:,:,64:122),3);
VVEL_64_JAS_slice_std = std(VVEL_Series_slice_64(:,:,64:122),0,3);
DIC_64_JAS_slice_avg = mean(DIC_Series_slice_64(:,:,64:122),3);
ALK_64_JAS_slice_avg = mean(ALK_Series_slice_64(:,:,64:122),3);
O2_64_JAS_slice_avg = mean(O2_Series_slice_64(:,:,64:122),3);
NO3_64_JAS_slice_avg = mean(NO3_Series_slice_64(:,:,64:122),3);

THETA_64_JJASON_slice_avg = mean(THETA_Series_slice_64(:,:,1:182),3);
SALT_64_JJASON_slice_avg = mean(SALT_Series_slice_64(:,:,1:182),3);
WVEL_64_JJASON_slice_avg = mean(WVEL_Series_slice_64(:,:,1:182),3);
WVEL_64_JJASON_slice_std = std(WVEL_Series_slice_64(:,:,1:182),0,3);
UVEL_64_JJASON_slice_avg = mean(UVEL_Series_slice_64(:,:,1:182),3);
UVEL_64_JJASON_slice_std = std(UVEL_Series_slice_64(:,:,1:182),0,3);
VVEL_64_JJASON_slice_avg = mean(VVEL_Series_slice_64(:,:,1:182),3);
VVEL_64_JJASON_slice_std = std(VVEL_Series_slice_64(:,:,1:182),0,3);
DIC_64_JJASON_slice_avg = mean(DIC_Series_slice_64(:,:,1:182),3);
ALK_64_JJASON_slice_avg = mean(ALK_Series_slice_64(:,:,1:182),3);
O2_64_JJASON_slice_avg = mean(O2_Series_slice_64(:,:,1:182),3);
NO3_64_JJASON_slice_avg = mean(NO3_Series_slice_64(:,:,1:182),3);

THETA_64_JASOND_slice_avg = mean(THETA_Series_slice_64(:,:,64:213),3);
SALT_64_JASOND_slice_avg = mean(SALT_Series_slice_64(:,:,64:213),3);
WVEL_64_JASOND_slice_avg = mean(WVEL_Series_slice_64(:,:,64:213),3);
WVEL_64_JASOND_slice_std = std(WVEL_Series_slice_64(:,:,64:213),0,3);
UVEL_64_JASOND_slice_avg = mean(UVEL_Series_slice_64(:,:,64:213),3);
UVEL_64_JASOND_slice_std = std(UVEL_Series_slice_64(:,:,64:213),0,3);
VVEL_64_JASOND_slice_avg = mean(VVEL_Series_slice_64(:,:,64:213),3);
VVEL_64_JASOND_slice_std = std(VVEL_Series_slice_64(:,:,64:213),0,3);
DIC_64_JASOND_slice_avg = mean(DIC_Series_slice_64(:,:,64:213),3);
ALK_64_JASOND_slice_avg = mean(ALK_Series_slice_64(:,:,64:213),3);
O2_64_JASOND_slice_avg = mean(O2_Series_slice_64(:,:,64:213),3);
NO3_64_JASOND_slice_avg = mean(NO3_Series_slice_64(:,:,64:213),3);

[m64,n64] = size(THETA_64_JJA_slice_avg);

parfor ii=1:m64
    for jj=1:n64
        if (HC(slice_index,ii,jj)==0)
            THETA_Series_slice_64(ii,jj,:) = 99999999999;
            SALT_Series_slice_64(ii,jj,:) = 99999999999;
            WVEL_Series_slice_64(ii,jj,:) = 99999999999;
            UVEL_Series_slice_64(ii,jj,:) = 99999999999;
            VVEL_Series_slice_64(ii,jj,:) = 99999999999;
            DIC_Series_slice_64(ii,jj,:) = 99999999999;
            ALK_Series_slice_64(ii,jj,:) = 99999999999;
            O2_Series_slice_64(ii,jj,:) = 99999999999;
            NO3_Series_slice_64(ii,jj,:) = 99999999999;
            
            THETA_64_JJA_slice_avg(ii,jj) = 99999999999;
            SALT_64_JJA_slice_avg(ii,jj) = 99999999999;
            DIC_64_JJA_slice_avg(ii,jj) = 99999999999;
            ALK_64_JJA_slice_avg(ii,jj) = 99999999999;
            WVEL_64_JJA_slice_avg(ii,jj) = 99999999999;
            VVEL_64_JJA_slice_avg(ii,jj) = 99999999999;
            UVEL_64_JJA_slice_avg(ii,jj) = 99999999999;
            O2_64_JJA_slice_avg(ii,jj) = 99999999999;
            NO3_64_JJA_slice_avg(ii,jj) = 99999999999;
            
            THETA_64_JAS_slice_avg(ii,jj) = 99999999999;
            SALT_64_JAS_slice_avg(ii,jj) = 99999999999;
            DIC_64_JAS_slice_avg(ii,jj) = 99999999999;
            ALK_64_JAS_slice_avg(ii,jj) = 99999999999;
            WVEL_64_JAS_slice_avg(ii,jj) = 99999999999;
            VVEL_64_JAS_slice_avg(ii,jj) = 99999999999;
            UVEL_64_JAS_slice_avg(ii,jj) = 99999999999;
            O2_64_JAS_slice_avg(ii,jj) = 99999999999;
            NO3_64_JAS_slice_avg(ii,jj) = 99999999999;
            
            THETA_64_JJASON_slice_avg(ii,jj) = 99999999999;
            SALT_64_JJASON_slice_avg(ii,jj) = 99999999999;
            DIC_64_JJASON_slice_avg(ii,jj) = 99999999999;
            ALK_64_JJASON_slice_avg(ii,jj) = 99999999999;
            WVEL_64_JJASON_slice_avg(ii,jj) = 99999999999;
            VVEL_64_JJASON_slice_avg(ii,jj) = 99999999999;
            UVEL_64_JJASON_slice_avg(ii,jj) = 99999999999;
            O2_64_JJASON_slice_avg(ii,jj) = 99999999999;
            NO3_64_JJASON_slice_avg(ii,jj) = 99999999999;
            
            THETA_64_JASOND_slice_avg(ii,jj) = 99999999999;
            SALT_64_JASOND_slice_avg(ii,jj) = 99999999999;
            DIC_64_JASOND_slice_avg(ii,jj) = 99999999999;
            ALK_64_JASOND_slice_avg(ii,jj) = 99999999999;
            WVEL_64_JASOND_slice_avg(ii,jj) = 99999999999;
            VVEL_64_JASOND_slice_avg(ii,jj) = 99999999999;
            UVEL_64_JASOND_slice_avg(ii,jj) = 99999999999;
            O2_64_JASOND_slice_avg(ii,jj) = 99999999999;
            NO3_64_JASOND_slice_avg(ii,jj) = 99999999999;
            
            THETA_64_DN_slice_avg(ii,jj) = 99999999999;
            SALT_64_DN_slice_avg(ii,jj) = 99999999999;
            DIC_64_DN_slice_avg(ii,jj) = 99999999999;
            ALK_64_DN_slice_avg(ii,jj) = 99999999999;
            WVEL_64_DN_slice_avg(ii,jj) = 99999999999;
            VVEL_64_DN_slice_avg(ii,jj) = 99999999999;
            UVEL_64_DN_slice_avg(ii,jj) = 99999999999;
            O2_64_DN_slice_avg(ii,jj) = 99999999999;
            NO3_64_DN_slice_avg(ii,jj) = 99999999999;
            
            THETA_64_JD_slice_avg(ii,jj) = 99999999999;
            SALT_64_JD_slice_avg(ii,jj) = 99999999999;
            DIC_64_JD_slice_avg(ii,jj) = 99999999999;
            ALK_64_JD_slice_avg(ii,jj) = 99999999999;
            WVEL_64_JD_slice_avg(ii,jj) = 99999999999;
            VVEL_64_JD_slice_avg(ii,jj) = 99999999999;
            UVEL_64_JD_slice_avg(ii,jj) = 99999999999;
            O2_64_JD_slice_avg(ii,jj) = 99999999999;
            NO3_64_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end


clear char64* temp64* n64 m64 *field64 ii jj

save AB64_output_THETA_slice_vert THETA*
save AB64_output_SALT_slice_vert SALT*
save AB64_output_WVEL_slice_vert WVEL*
save AB64_output_VVEL_slice_vert VVEL*
save AB64_output_UVEL_slice_vert UVEL*
save AB64_output_O2_slice_vert O2*
save AB64_output_NO3_slice_vert NO3*
save AB64_output_DIC_slice_vert DIC*
save AB64_output_ALK_slice_vert ALK*
save AB64_output_ETAN_slice_vert ETAN*
save AB64_output_MLD_slice_vert MLD*
save AB64_output_PCO2_slice_vert PCO2*
save AB64_output_TFLUX_slice_vert TFLUX*
save AB64_output_CFLUX_slice_vert CFLUX*
save AB64_output_SFLUX_slice_vert SFLUX*
save AB64_output_OFLUX_slice_vert OFLUX*

fprintf('finished 64 \n')

%% end 64


