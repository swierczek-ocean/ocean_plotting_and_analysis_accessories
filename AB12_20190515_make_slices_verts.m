
%% 124

tfield124 = 1;
sfield124 = 2;
wfield124 = 3;
ufield124 = 3;
vfield124 = 4;
tffield124 = 1;
sffield124 = 2;
cfield124 = 3;
ofield124 = 4;
efield124 = 1;
mfield124 = 4;
dfield124 = 1;
afield124 = 2;
agfield124 = 9;
pcfield124 = 2;
no3field124 = 4;
o2field124 = 3;

slice_index = 223;

THETA_Series_vert_124 = zeros(756,512,213);
DIC_Series_vert_124 = zeros(756,512,213);
O2_Series_vert_124 = zeros(756,512,213);
NO3_Series_vert_124 = zeros(756,512,213);

THETA_Series_vert_t124 = zeros(756,512,213);
DIC_Series_vert_t124 = zeros(756,512,213);
O2_Series_vert_t124 = zeros(756,512,213);
NO3_Series_vert_t124 = zeros(756,512,213);

THETA_Series_slice_124 = zeros(512,104,213);
SALT_Series_slice_124 = zeros(512,104,213);
WVEL_Series_slice_124 = zeros(512,104,213);
UVEL_Series_slice_124 = zeros(512,104,213);
VVEL_Series_slice_124 = zeros(512,104,213);
DIC_Series_slice_124 = zeros(512,104,213);
ALK_Series_slice_124 = zeros(512,104,213);
O2_Series_slice_124 = zeros(512,104,213);
NO3_Series_slice_124 = zeros(512,104,213);
TFLUX_Series_slice_124 = zeros(512,213);
SFLUX_Series_slice_124 = zeros(512,213);
CFLUX_Series_slice_124 = zeros(512,213);
OFLUX_Series_slice_124 = zeros(512,213);
ETAN_Series_slice_124 = zeros(512,213);
MLD_Series_slice_124 = zeros(512,213);
PCO2_Series_slice_124 = zeros(512,213);

HC = rdmds('../MITgcm/verification/SO12_20190515/run/hFacC');
DRF_temp = rdmds('../MITgcm/verification/SO12_20190515/run/DRF');
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

depth124 = 1;
str = '../MITgcm/verification/SO12_20190515/diag_slice/';

for ii=1:2
    char124state = [str,'diag_state.0000000',num2str(360*ii)];
    temp124state = rdmds(char124state);
    THETA_Series_vert_t124(:,:,ii) = sum(temp124state(:,:,:,tfield124).*Volume,3);
    THETA_Series_vert_124(:,:,ii) = THETA_Series_vert_t124(:,:,ii)./Height;
    THETA_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,tfield124);
    SALT_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,sfield124);
    WVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,wfield124);
    UVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,ufield124);
    VVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,vfield124);
    clear temp124state
    char124surf = [str,'diag_surf.0000000',num2str(360*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series_slice_124(:,ii) = temp124surf(slice_index,:,efield124); 
    MLD_Series_slice_124(:,ii) = temp124surf(slice_index,:,mfield124);
    PCO2_Series_slice_124(:,ii) = temp124surf(slice_index,:,pcfield124);
    clear temp124surf
    char124airsea = [str,'diag_airsea.0000000',num2str(360*ii)];
    temp124airsea = rdmds(char124airsea); 
    TFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,tffield124);
    SFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,sffield124);
    CFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,cfield124);
    OFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,ofield124);
    clear temp124airsea
    char124bgc = [str,'diag_bgc.0000000',num2str(360*ii)];
    temp124bgc = rdmds(char124bgc); 
    DIC_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,dfield124);
    ALK_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,afield124);
    O2_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,o2field124);
    NO3_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,no3field124);
    DIC_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,dfield124).*Volume,3);
    DIC_Series_vert_124(:,:,ii) = DIC_Series_vert_t124(:,:,ii)./Height;
    O2_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,o2field124).*Volume,3);
    O2_Series_vert_124(:,:,ii) = O2_Series_vert_t124(:,:,ii)./Height;
    NO3_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,no3field124).*Volume,3);
    NO3_Series_vert_124(:,:,ii) = NO3_Series_vert_t124(:,:,ii)./Height;
    clear temp124bgc
end

for ii=3:27
    char124state = [str,'diag_state.000000',num2str(360*ii)];
    temp124state = rdmds(char124state);
    THETA_Series_vert_t124(:,:,ii) = sum(temp124state(:,:,:,tfield124).*Volume,3);
    THETA_Series_vert_124(:,:,ii) = THETA_Series_vert_t124(:,:,ii)./Height;
    THETA_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,tfield124);
    SALT_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,sfield124);
    WVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,wfield124);
    UVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,ufield124);
    VVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,vfield124);
    clear temp124state
    char124surf = [str,'diag_surf.000000',num2str(360*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series_slice_124(:,ii) = temp124surf(slice_index,:,efield124); 
    MLD_Series_slice_124(:,ii) = temp124surf(slice_index,:,mfield124);
    PCO2_Series_slice_124(:,ii) = temp124surf(slice_index,:,pcfield124);
    clear temp124surf
    char124airsea = [str,'diag_airsea.000000',num2str(360*ii)];
    temp124airsea = rdmds(char124airsea); 
    TFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,tffield124);
    SFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,sffield124);
    CFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,cfield124);
    OFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,ofield124);
    clear temp124airsea
    char124bgc = [str,'diag_bgc.000000',num2str(360*ii)];
    temp124bgc = rdmds(char124bgc); 
    DIC_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,dfield124);
    ALK_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,afield124);
    O2_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,o2field124);
    NO3_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,no3field124);
    DIC_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,dfield124).*Volume,3);
    DIC_Series_vert_124(:,:,ii) = DIC_Series_vert_t124(:,:,ii)./Height;
    O2_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,o2field124).*Volume,3);
    O2_Series_vert_124(:,:,ii) = O2_Series_vert_t124(:,:,ii)./Height;
    NO3_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,no3field124).*Volume,3);
    NO3_Series_vert_124(:,:,ii) = NO3_Series_vert_t124(:,:,ii)./Height;
    clear temp124bgc
end

for ii=28:213
    char124state = [str,'diag_state.00000',num2str(360*ii)];
    temp124state = rdmds(char124state);
    THETA_Series_vert_t124(:,:,ii) = sum(temp124state(:,:,:,tfield124).*Volume,3);
    THETA_Series_vert_124(:,:,ii) = THETA_Series_vert_t124(:,:,ii)./Height;
    THETA_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,tfield124);
    SALT_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,sfield124);
    WVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,wfield124);
    UVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,ufield124);
    VVEL_Series_slice_124(:,:,ii) = temp124state(slice_index,:,:,vfield124);
    clear temp124state
    char124surf = [str,'diag_surf.00000',num2str(360*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series_slice_124(:,ii) = temp124surf(slice_index,:,efield124); 
    MLD_Series_slice_124(:,ii) = temp124surf(slice_index,:,mfield124);
    PCO2_Series_slice_124(:,ii) = temp124surf(slice_index,:,pcfield124);
    clear temp124surf
    char124airsea = [str,'diag_airsea.00000',num2str(360*ii)];
    temp124airsea = rdmds(char124airsea); 
    TFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,tffield124);
    SFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,sffield124);
    CFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,cfield124);
    OFLUX_Series_slice_124(:,:,ii) = temp124airsea(slice_index,:,ofield124);
    clear temp124airsea
    char124bgc = [str,'diag_bgc.00000',num2str(360*ii)];
    temp124bgc = rdmds(char124bgc); 
    DIC_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,dfield124);
    ALK_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,afield124);
    O2_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,o2field124);
    NO3_Series_slice_124(:,:,ii) = temp124bgc(slice_index,:,:,no3field124);
    DIC_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,dfield124).*Volume,3);
    DIC_Series_vert_124(:,:,ii) = DIC_Series_vert_t124(:,:,ii)./Height;
    O2_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,o2field124).*Volume,3);
    O2_Series_vert_124(:,:,ii) = O2_Series_vert_t124(:,:,ii)./Height;
    NO3_Series_vert_t124(:,:,ii) = sum(temp124bgc(:,:,:,no3field124).*Volume,3);
    NO3_Series_vert_124(:,:,ii) = NO3_Series_vert_t124(:,:,ii)./Height;
    clear temp124bgc
end


THETA_124_JJA_slice_avg = mean(THETA_Series_slice_124(:,:,1:91),3);
SALT_124_JJA_slice_avg = mean(SALT_Series_slice_124(:,:,1:91),3);
WVEL_124_JJA_slice_avg = mean(WVEL_Series_slice_124(:,:,1:91),3);
WVEL_124_JJA_slice_std = std(WVEL_Series_slice_124(:,:,1:91),0,3);
UVEL_124_JJA_slice_avg = mean(UVEL_Series_slice_124(:,:,1:91),3);
UVEL_124_JJA_slice_std = std(UVEL_Series_slice_124(:,:,1:91),0,3);
VVEL_124_JJA_slice_avg = mean(VVEL_Series_slice_124(:,:,1:91),3);
VVEL_124_JJA_slice_std = std(VVEL_Series_slice_124(:,:,1:91),0,3);
DIC_124_JJA_slice_avg = mean(DIC_Series_slice_124(:,:,1:91),3);
ALK_124_JJA_slice_avg = mean(ALK_Series_slice_124(:,:,1:91),3);
O2_124_JJA_slice_avg = mean(O2_Series_slice_124(:,:,1:91),3);
NO3_124_JJA_slice_avg = mean(NO3_Series_slice_124(:,:,1:91),3);

THETA_124_JAS_slice_avg = mean(THETA_Series_slice_124(:,:,124:122),3);
SALT_124_JAS_slice_avg = mean(SALT_Series_slice_124(:,:,124:122),3);
WVEL_124_JAS_slice_avg = mean(WVEL_Series_slice_124(:,:,124:122),3);
WVEL_124_JAS_slice_std = std(WVEL_Series_slice_124(:,:,124:122),0,3);
UVEL_124_JAS_slice_avg = mean(UVEL_Series_slice_124(:,:,124:122),3);
UVEL_124_JAS_slice_std = std(UVEL_Series_slice_124(:,:,124:122),0,3);
VVEL_124_JAS_slice_avg = mean(VVEL_Series_slice_124(:,:,124:122),3);
VVEL_124_JAS_slice_std = std(VVEL_Series_slice_124(:,:,124:122),0,3);
DIC_124_JAS_slice_avg = mean(DIC_Series_slice_124(:,:,124:122),3);
ALK_124_JAS_slice_avg = mean(ALK_Series_slice_124(:,:,124:122),3);
O2_124_JAS_slice_avg = mean(O2_Series_slice_124(:,:,124:122),3);
NO3_124_JAS_slice_avg = mean(NO3_Series_slice_124(:,:,124:122),3);

THETA_124_JJASON_slice_avg = mean(THETA_Series_slice_124(:,:,1:182),3);
SALT_124_JJASON_slice_avg = mean(SALT_Series_slice_124(:,:,1:182),3);
WVEL_124_JJASON_slice_avg = mean(WVEL_Series_slice_124(:,:,1:182),3);
WVEL_124_JJASON_slice_std = std(WVEL_Series_slice_124(:,:,1:182),0,3);
UVEL_124_JJASON_slice_avg = mean(UVEL_Series_slice_124(:,:,1:182),3);
UVEL_124_JJASON_slice_std = std(UVEL_Series_slice_124(:,:,1:182),0,3);
VVEL_124_JJASON_slice_avg = mean(VVEL_Series_slice_124(:,:,1:182),3);
VVEL_124_JJASON_slice_std = std(VVEL_Series_slice_124(:,:,1:182),0,3);
DIC_124_JJASON_slice_avg = mean(DIC_Series_slice_124(:,:,1:182),3);
ALK_124_JJASON_slice_avg = mean(ALK_Series_slice_124(:,:,1:182),3);
O2_124_JJASON_slice_avg = mean(O2_Series_slice_124(:,:,1:182),3);
NO3_124_JJASON_slice_avg = mean(NO3_Series_slice_124(:,:,1:182),3);

THETA_124_JASOND_slice_avg = mean(THETA_Series_slice_124(:,:,124:213),3);
SALT_124_JASOND_slice_avg = mean(SALT_Series_slice_124(:,:,124:213),3);
WVEL_124_JASOND_slice_avg = mean(WVEL_Series_slice_124(:,:,124:213),3);
WVEL_124_JASOND_slice_std = std(WVEL_Series_slice_124(:,:,124:213),0,3);
UVEL_124_JASOND_slice_avg = mean(UVEL_Series_slice_124(:,:,124:213),3);
UVEL_124_JASOND_slice_std = std(UVEL_Series_slice_124(:,:,124:213),0,3);
VVEL_124_JASOND_slice_avg = mean(VVEL_Series_slice_124(:,:,124:213),3);
VVEL_124_JASOND_slice_std = std(VVEL_Series_slice_124(:,:,124:213),0,3);
DIC_124_JASOND_slice_avg = mean(DIC_Series_slice_124(:,:,124:213),3);
ALK_124_JASOND_slice_avg = mean(ALK_Series_slice_124(:,:,124:213),3);
O2_124_JASOND_slice_avg = mean(O2_Series_slice_124(:,:,124:213),3);
NO3_124_JASOND_slice_avg = mean(NO3_Series_slice_124(:,:,124:213),3);

[m124,n124] = size(THETA_124_JJA_slice_avg);

parfor ii=1:m124
    for jj=1:n124
        if (HC(slice_index,ii,jj)==0)
            THETA_Series_slice_124(ii,jj,:) = 99999999999;
            SALT_Series_slice_124(ii,jj,:) = 99999999999;
            WVEL_Series_slice_124(ii,jj,:) = 99999999999;
            UVEL_Series_slice_124(ii,jj,:) = 99999999999;
            VVEL_Series_slice_124(ii,jj,:) = 99999999999;
            DIC_Series_slice_124(ii,jj,:) = 99999999999;
            ALK_Series_slice_124(ii,jj,:) = 99999999999;
            O2_Series_slice_124(ii,jj,:) = 99999999999;
            NO3_Series_slice_124(ii,jj,:) = 99999999999;
            
            THETA_124_JJA_slice_avg(ii,jj) = 99999999999;
            SALT_124_JJA_slice_avg(ii,jj) = 99999999999;
            DIC_124_JJA_slice_avg(ii,jj) = 99999999999;
            ALK_124_JJA_slice_avg(ii,jj) = 99999999999;
            WVEL_124_JJA_slice_avg(ii,jj) = 99999999999;
            VVEL_124_JJA_slice_avg(ii,jj) = 99999999999;
            UVEL_124_JJA_slice_avg(ii,jj) = 99999999999;
            O2_124_JJA_slice_avg(ii,jj) = 99999999999;
            NO3_124_JJA_slice_avg(ii,jj) = 99999999999;
            
            THETA_124_JAS_slice_avg(ii,jj) = 99999999999;
            SALT_124_JAS_slice_avg(ii,jj) = 99999999999;
            DIC_124_JAS_slice_avg(ii,jj) = 99999999999;
            ALK_124_JAS_slice_avg(ii,jj) = 99999999999;
            WVEL_124_JAS_slice_avg(ii,jj) = 99999999999;
            VVEL_124_JAS_slice_avg(ii,jj) = 99999999999;
            UVEL_124_JAS_slice_avg(ii,jj) = 99999999999;
            O2_124_JAS_slice_avg(ii,jj) = 99999999999;
            NO3_124_JAS_slice_avg(ii,jj) = 99999999999;
            
            THETA_124_JJASON_slice_avg(ii,jj) = 99999999999;
            SALT_124_JJASON_slice_avg(ii,jj) = 99999999999;
            DIC_124_JJASON_slice_avg(ii,jj) = 99999999999;
            ALK_124_JJASON_slice_avg(ii,jj) = 99999999999;
            WVEL_124_JJASON_slice_avg(ii,jj) = 99999999999;
            VVEL_124_JJASON_slice_avg(ii,jj) = 99999999999;
            UVEL_124_JJASON_slice_avg(ii,jj) = 99999999999;
            O2_124_JJASON_slice_avg(ii,jj) = 99999999999;
            NO3_124_JJASON_slice_avg(ii,jj) = 99999999999;
            
            THETA_124_JASOND_slice_avg(ii,jj) = 99999999999;
            SALT_124_JASOND_slice_avg(ii,jj) = 99999999999;
            DIC_124_JASOND_slice_avg(ii,jj) = 99999999999;
            ALK_124_JASOND_slice_avg(ii,jj) = 99999999999;
            WVEL_124_JASOND_slice_avg(ii,jj) = 99999999999;
            VVEL_124_JASOND_slice_avg(ii,jj) = 99999999999;
            UVEL_124_JASOND_slice_avg(ii,jj) = 99999999999;
            O2_124_JASOND_slice_avg(ii,jj) = 99999999999;
            NO3_124_JASOND_slice_avg(ii,jj) = 99999999999;
            
            THETA_124_DN_slice_avg(ii,jj) = 99999999999;
            SALT_124_DN_slice_avg(ii,jj) = 99999999999;
            DIC_124_DN_slice_avg(ii,jj) = 99999999999;
            ALK_124_DN_slice_avg(ii,jj) = 99999999999;
            WVEL_124_DN_slice_avg(ii,jj) = 99999999999;
            VVEL_124_DN_slice_avg(ii,jj) = 99999999999;
            UVEL_124_DN_slice_avg(ii,jj) = 99999999999;
            O2_124_DN_slice_avg(ii,jj) = 99999999999;
            NO3_124_DN_slice_avg(ii,jj) = 99999999999;
            
            THETA_124_JD_slice_avg(ii,jj) = 99999999999;
            SALT_124_JD_slice_avg(ii,jj) = 99999999999;
            DIC_124_JD_slice_avg(ii,jj) = 99999999999;
            ALK_124_JD_slice_avg(ii,jj) = 99999999999;
            WVEL_124_JD_slice_avg(ii,jj) = 99999999999;
            VVEL_124_JD_slice_avg(ii,jj) = 99999999999;
            UVEL_124_JD_slice_avg(ii,jj) = 99999999999;
            O2_124_JD_slice_avg(ii,jj) = 99999999999;
            NO3_124_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end


clear char124* temp124* n124 m124 *field124 ii jj
save AB124_output_slice_vert

fprintf('finished 124 \n')

%% end 124


