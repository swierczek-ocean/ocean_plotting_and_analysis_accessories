
%% 34

tfield34 = 1;
sfield34 = 2;
wfield34 = 3;
ufield34 = 3;
vfield34 = 4;
tffield34 = 1;
sffield34 = 2;
cfield34 = 3;
ofield34 = 4;
efield34 = 1;
mfield34 = 4;
dfield34 = 1;
afield34 = 2;
agfield34 = 9;
pcfield34 = 2;
no3field34 = 4;
o2field34 = 3;

slice_index = 57;

THETA_Series_vert_34 = zeros(192,132,213);
DIC_Series_vert_34 = zeros(192,132,213);
O2_Series_vert_34 = zeros(192,132,213);
NO3_Series_vert_34 = zeros(192,132,213);

THETA_Series_vert_t34 = zeros(192,132,213);
DIC_Series_vert_t34 = zeros(192,132,213);
O2_Series_vert_t34 = zeros(192,132,213);
NO3_Series_vert_t34 = zeros(192,132,213);

THETA_Series_vert100_t34 = zeros(192,132,213);
DIC_Series_vert100_t34 = zeros(192,132,213);
O2_Series_vert100_t34 = zeros(192,132,213);
NO3_Series_vert100_t34 = zeros(192,132,213);

THETA_Series_slice_34 = zeros(132,52,213);
SALT_Series_slice_34 = zeros(132,52,213);
WVEL_Series_slice_34 = zeros(132,52,213);
UVEL_Series_slice_34 = zeros(132,52,213);
VVEL_Series_slice_34 = zeros(132,52,213);
DIC_Series_slice_34 = zeros(132,52,213);
ALK_Series_slice_34 = zeros(132,52,213);
O2_Series_slice_34 = zeros(132,52,213);
NO3_Series_slice_34 = zeros(132,52,213);
TFLUX_Series_slice_34 = zeros(132,213);
SFLUX_Series_slice_34 = zeros(132,213);
CFLUX_Series_slice_34 = zeros(132,213);
OFLUX_Series_slice_34 = zeros(132,213);
ETAN_Series_slice_34 = zeros(132,213);
MLD_Series_slice_34 = zeros(132,213);
PCO2_Series_slice_34 = zeros(132,213);

HC = rdmds('../MITgcm/verification/SO3_20190515/run/hFacC');
DRF_temp = rdmds('../MITgcm/verification/SO3_20190515/run/DRF');
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

depth34 = 1;
str = '../MITgcm/verification/SO3_20190515/diag_slice/';

for ii=1:2
    char34state = [str,'diag_state.00000000',num2str(48*ii)];
    temp34state = rdmds(char34state);
    THETA_Series_vert_t34(:,:,ii) = sum(temp34state(:,:,:,tfield34).*Volume,3);
    THETA_Series_vert100_t34(:,:,ii) = sum(temp34state(:,:,1:12,tfield34).*Volume(:,:,1:12),3);
    THETA_Series_vert_34(:,:,ii) = THETA_Series_vert_t34(:,:,ii)./Height;
    THETA_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,tfield34);
    SALT_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,sfield34);
    WVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,wfield34);
    UVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,ufield34);
    VVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,vfield34);
    clear temp34state
    char34surf = [str,'diag_surf.00000000',num2str(48*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series_slice_34(:,ii) = temp34surf(slice_index,:,efield34); 
    MLD_Series_slice_34(:,ii) = temp34surf(slice_index,:,mfield34);
    PCO2_Series_slice_34(:,ii) = temp34surf(slice_index,:,pcfield34);
    clear temp34surf
    char34airsea = [str,'diag_airsea.00000000',num2str(48*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,tffield34);
    SFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,sffield34);
    CFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,cfield34);
    OFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,ofield34);
    clear temp34airsea
    char34bgc = [str,'diag_bgc.00000000',num2str(48*ii)];
    temp34bgc = rdmds(char34bgc); 
    DIC_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,dfield34);
    ALK_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,afield34);
    O2_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,o2field34);
    NO3_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,no3field34);
    DIC_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,dfield34).*Volume,3);
    DIC_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,dfield34).*Volume(:,:,1:12),3);
    DIC_Series_vert_34(:,:,ii) = DIC_Series_vert_t34(:,:,ii)./Height;
    O2_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,o2field34).*Volume,3);
    O2_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,o2field34).*Volume(:,:,1:12),3);
    O2_Series_vert_34(:,:,ii) = O2_Series_vert_t34(:,:,ii)./Height;
    NO3_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,no3field34).*Volume,3);
    NO3_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,no3field34).*Volume(:,:,1:12),3);
    NO3_Series_vert_34(:,:,ii) = NO3_Series_vert_t34(:,:,ii)./Height;
    clear temp34bgc
end

for ii=3:20
    char34state = [str,'diag_state.0000000',num2str(48*ii)];
    temp34state = rdmds(char34state);
    THETA_Series_vert_t34(:,:,ii) = sum(temp34state(:,:,:,tfield34).*Volume,3);
    THETA_Series_vert100_t34(:,:,ii) = sum(temp34state(:,:,1:12,tfield34).*Volume(:,:,1:12),3);
    THETA_Series_vert_34(:,:,ii) = THETA_Series_vert_t34(:,:,ii)./Height;
    THETA_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,tfield34);
    SALT_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,sfield34);
    WVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,wfield34);
    UVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,ufield34);
    VVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,vfield34);
    clear temp34state
    char34surf = [str,'diag_surf.0000000',num2str(48*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series_slice_34(:,ii) = temp34surf(slice_index,:,efield34); 
    MLD_Series_slice_34(:,ii) = temp34surf(slice_index,:,mfield34);
    PCO2_Series_slice_34(:,ii) = temp34surf(slice_index,:,pcfield34);
    clear temp34surf
    char34airsea = [str,'diag_airsea.0000000',num2str(48*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,tffield34);
    SFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,sffield34);
    CFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,cfield34);
    OFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,ofield34);
    clear temp34airsea
    char34bgc = [str,'diag_bgc.0000000',num2str(48*ii)];
    temp34bgc = rdmds(char34bgc); 
    DIC_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,dfield34);
    ALK_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,afield34);
    O2_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,o2field34);
    NO3_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,no3field34);
    DIC_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,dfield34).*Volume,3);
    DIC_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,dfield34).*Volume(:,:,1:12),3);
    DIC_Series_vert_34(:,:,ii) = DIC_Series_vert_t34(:,:,ii)./Height;
    O2_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,o2field34).*Volume,3);
    O2_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,o2field34).*Volume(:,:,1:12),3);
    O2_Series_vert_34(:,:,ii) = O2_Series_vert_t34(:,:,ii)./Height;
    NO3_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,no3field34).*Volume,3);
    NO3_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,no3field34).*Volume(:,:,1:12),3);
    NO3_Series_vert_34(:,:,ii) = NO3_Series_vert_t34(:,:,ii)./Height;
    clear temp34bgc
end

for ii=21:208
    char34state = [str,'diag_state.000000',num2str(48*ii)];
    temp34state = rdmds(char34state);
    THETA_Series_vert_t34(:,:,ii) = sum(temp34state(:,:,:,tfield34).*Volume,3);
    THETA_Series_vert100_t34(:,:,ii) = sum(temp34state(:,:,1:12,tfield34).*Volume(:,:,1:12),3);
    THETA_Series_vert_34(:,:,ii) = THETA_Series_vert_t34(:,:,ii)./Height;
    THETA_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,tfield34);
    SALT_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,sfield34);
    WVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,wfield34);
    UVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,ufield34);
    VVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,vfield34);
    clear temp34state
    char34surf = [str,'diag_surf.000000',num2str(48*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series_slice_34(:,ii) = temp34surf(slice_index,:,efield34); 
    MLD_Series_slice_34(:,ii) = temp34surf(slice_index,:,mfield34);
    PCO2_Series_slice_34(:,ii) = temp34surf(slice_index,:,pcfield34);
    clear temp34surf
    char34airsea = [str,'diag_airsea.000000',num2str(48*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,tffield34);
    SFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,sffield34);
    CFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,cfield34);
    OFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,ofield34);
    clear temp34airsea
    char34bgc = [str,'diag_bgc.000000',num2str(48*ii)];
    temp34bgc = rdmds(char34bgc); 
    DIC_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,dfield34);
    ALK_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,afield34);
    O2_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,o2field34);
    NO3_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,no3field34);
    DIC_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,dfield34).*Volume,3);
    DIC_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,dfield34).*Volume(:,:,1:12),3);
    DIC_Series_vert_34(:,:,ii) = DIC_Series_vert_t34(:,:,ii)./Height;
    O2_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,o2field34).*Volume,3);
    O2_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,o2field34).*Volume(:,:,1:12),3);
    O2_Series_vert_34(:,:,ii) = O2_Series_vert_t34(:,:,ii)./Height;
    NO3_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,no3field34).*Volume,3);
    NO3_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,no3field34).*Volume(:,:,1:12),3);
    NO3_Series_vert_34(:,:,ii) = NO3_Series_vert_t34(:,:,ii)./Height;
    clear temp34bgc
end

for ii=209:213
    char34state = [str,'diag_state.00000',num2str(48*ii)];
    temp34state = rdmds(char34state);
    THETA_Series_vert_t34(:,:,ii) = sum(temp34state(:,:,:,tfield34).*Volume,3);
    THETA_Series_vert100_t34(:,:,ii) = sum(temp34state(:,:,1:12,tfield34).*Volume(:,:,1:12),3);
    THETA_Series_vert_34(:,:,ii) = THETA_Series_vert_t34(:,:,ii)./Height;
    THETA_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,tfield34);
    SALT_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,sfield34);
    WVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,wfield34);
    UVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,ufield34);
    VVEL_Series_slice_34(:,:,ii) = temp34state(slice_index,:,:,vfield34);
    clear temp34state
    char34surf = [str,'diag_surf.00000',num2str(48*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series_slice_34(:,ii) = temp34surf(slice_index,:,efield34); 
    MLD_Series_slice_34(:,ii) = temp34surf(slice_index,:,mfield34);
    PCO2_Series_slice_34(:,ii) = temp34surf(slice_index,:,pcfield34);
    clear temp34surf
    char34airsea = [str,'diag_airsea.00000',num2str(48*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,tffield34);
    SFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,sffield34);
    CFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,cfield34);
    OFLUX_Series_slice_34(:,ii) = temp34airsea(slice_index,:,ofield34);
    clear temp34airsea
    char34bgc = [str,'diag_bgc.00000',num2str(48*ii)];
    temp34bgc = rdmds(char34bgc); 
    DIC_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,dfield34);
    ALK_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,afield34);
    O2_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,o2field34);
    NO3_Series_slice_34(:,:,ii) = temp34bgc(slice_index,:,:,no3field34);
    DIC_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,dfield34).*Volume,3);
    DIC_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,dfield34).*Volume(:,:,1:12),3);
    DIC_Series_vert_34(:,:,ii) = DIC_Series_vert_t34(:,:,ii)./Height;
    O2_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,o2field34).*Volume,3);
    O2_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,o2field34).*Volume(:,:,1:12),3);
    O2_Series_vert_34(:,:,ii) = O2_Series_vert_t34(:,:,ii)./Height;
    NO3_Series_vert_t34(:,:,ii) = sum(temp34bgc(:,:,:,no3field34).*Volume,3);
    NO3_Series_vert100_t34(:,:,ii) = sum(temp34bgc(:,:,1:12,no3field34).*Volume(:,:,1:12),3);
    NO3_Series_vert_34(:,:,ii) = NO3_Series_vert_t34(:,:,ii)./Height;
    clear temp34bgc
end

for ii=1:132
    if (HC(slice_index,ii,1)==0)
        ETAN_Series_slice_34(ii,:) = NaN;
        MLD_Series_slice_34(ii,:) = NaN;
        PCO2_Series_slice_34(ii,:) = NaN;
        TFLUX_Series_slice_34(ii,:) = NaN;
        OFLUX_Series_slice_34(ii,:) = NaN;
        CFLUX_Series_slice_34(ii,:) = NaN;
        SFLUX_Series_slice_34(ii,:) = NaN;
    end
end

parfor ii=1:192
    for jj=1:132
        if (HC(ii,jj,1)==0)
            THETA_Series_vert_34(ii,jj,:) = 99999999999;
            THETA_Series_vert_t34(ii,jj,:) = 99999999999;
            THETA_Series_vert100_t34(ii,jj,:) = 99999999999;
            DIC_Series_vert_34(ii,jj,:) = 99999999999;
            DIC_Series_vert_t34(ii,jj,:) = 99999999999;
            DIC_Series_vert100_t34(ii,jj,:) = 99999999999;
            O2_Series_vert_34(ii,jj,:) = 99999999999;
            O2_Series_vert_t34(ii,jj,:) = 99999999999;
            O2_Series_vert100_t34(ii,jj,:) = 99999999999;
            NO3_Series_vert_34(ii,jj,:) = 99999999999;
            NO3_Series_vert_t34(ii,jj,:) = 99999999999;
            NO3_Series_vert100_t34(ii,jj,:) = 99999999999;
        end
    end
end


THETA_34_JJA_slice_avg = mean(THETA_Series_slice_34(:,:,1:91),3);
SALT_34_JJA_slice_avg = mean(SALT_Series_slice_34(:,:,1:91),3);
WVEL_34_JJA_slice_avg = mean(WVEL_Series_slice_34(:,:,1:91),3);
WVEL_34_JJA_slice_std = std(WVEL_Series_slice_34(:,:,1:91),0,3);
UVEL_34_JJA_slice_avg = mean(UVEL_Series_slice_34(:,:,1:91),3);
UVEL_34_JJA_slice_std = std(UVEL_Series_slice_34(:,:,1:91),0,3);
VVEL_34_JJA_slice_avg = mean(VVEL_Series_slice_34(:,:,1:91),3);
VVEL_34_JJA_slice_std = std(VVEL_Series_slice_34(:,:,1:91),0,3);
DIC_34_JJA_slice_avg = mean(DIC_Series_slice_34(:,:,1:91),3);
ALK_34_JJA_slice_avg = mean(ALK_Series_slice_34(:,:,1:91),3);
O2_34_JJA_slice_avg = mean(O2_Series_slice_34(:,:,1:91),3);
NO3_34_JJA_slice_avg = mean(NO3_Series_slice_34(:,:,1:91),3);
ETAN_34_JJA_slice_avg = mean(ETAN_Series_slice_34(:,1:91),2);
MLD_34_JJA_slice_avg = mean(MLD_Series_slice_34(:,1:91),2);
PCO2_34_JJA_slice_avg = mean(PCO2_Series_slice_34(:,1:91),2);
TFLUX_34_JJA_slice_avg = mean(TFLUX_Series_slice_34(:,1:91),2);
SFLUX_34_JJA_slice_avg = mean(SFLUX_Series_slice_34(:,1:91),2);
CFLUX_34_JJA_slice_avg = mean(CFLUX_Series_slice_34(:,1:91),2);
OFLUX_34_JJA_slice_avg = mean(OFLUX_Series_slice_34(:,1:91),2);
THETA_34_JJA_vert_avg = mean(THETA_Series_vert_34(:,:,1:91),3);
THETA_34_JJA_tvert_avg = mean(THETA_Series_vert_t34(:,:,1:91),3);
THETA_34_JJA_vert100_avg = mean(THETA_Series_vert100_t34(:,:,1:91),3);
DIC_34_JJA_vert_avg = mean(DIC_Series_vert_34(:,:,1:91),3);
DIC_34_JJA_tvert_avg = mean(DIC_Series_vert_t34(:,:,1:91),3);
DIC_34_JJA_vert100_avg = mean(DIC_Series_vert100_t34(:,:,1:91),3);
O2_34_JJA_vert_avg = mean(O2_Series_vert_34(:,:,1:91),3);
O2_34_JJA_tvert_avg = mean(O2_Series_vert_t34(:,:,1:91),3);
O2_34_JJA_vert100_avg = mean(O2_Series_vert100_t34(:,:,1:91),3);
NO3_34_JJA_vert_avg = mean(NO3_Series_vert_34(:,:,1:91),3);
NO3_34_JJA_tvert_avg = mean(NO3_Series_vert_t34(:,:,1:91),3);
NO3_34_JJA_vert100_avg = mean(NO3_Series_vert100_t34(:,:,1:91),3);

THETA_34_JAS_slice_avg = mean(THETA_Series_slice_34(:,:,32:122),3);
SALT_34_JAS_slice_avg = mean(SALT_Series_slice_34(:,:,32:122),3);
WVEL_34_JAS_slice_avg = mean(WVEL_Series_slice_34(:,:,32:122),3);
WVEL_34_JAS_slice_std = std(WVEL_Series_slice_34(:,:,32:122),0,3);
UVEL_34_JAS_slice_avg = mean(UVEL_Series_slice_34(:,:,32:122),3);
UVEL_34_JAS_slice_std = std(UVEL_Series_slice_34(:,:,32:122),0,3);
VVEL_34_JAS_slice_avg = mean(VVEL_Series_slice_34(:,:,32:122),3);
VVEL_34_JAS_slice_std = std(VVEL_Series_slice_34(:,:,32:122),0,3);
DIC_34_JAS_slice_avg = mean(DIC_Series_slice_34(:,:,32:122),3);
ALK_34_JAS_slice_avg = mean(ALK_Series_slice_34(:,:,32:122),3);
O2_34_JAS_slice_avg = mean(O2_Series_slice_34(:,:,32:122),3);
NO3_34_JAS_slice_avg = mean(NO3_Series_slice_34(:,:,32:122),3);
ETAN_34_JAS_slice_avg = mean(ETAN_Series_slice_34(:,32:122),2);
MLD_34_JAS_slice_avg = mean(MLD_Series_slice_34(:,32:122),2);
PCO2_34_JAS_slice_avg = mean(PCO2_Series_slice_34(:,32:122),2);
TFLUX_34_JAS_slice_avg = mean(TFLUX_Series_slice_34(:,32:122),2);
SFLUX_34_JAS_slice_avg = mean(SFLUX_Series_slice_34(:,32:122),2);
CFLUX_34_JAS_slice_avg = mean(CFLUX_Series_slice_34(:,32:122),2);
OFLUX_34_JAS_slice_avg = mean(OFLUX_Series_slice_34(:,32:122),2);
THETA_34_JAS_vert_avg = mean(THETA_Series_vert_34(:,:,32:122),3);
THETA_34_JAS_tvert_avg = mean(THETA_Series_vert_t34(:,:,32:122),3);
THETA_34_JAS_vert100_avg = mean(THETA_Series_vert100_t34(:,:,32:122),3);
DIC_34_JAS_vert_avg = mean(DIC_Series_vert_34(:,:,32:122),3);
DIC_34_JAS_tvert_avg = mean(DIC_Series_vert_t34(:,:,32:122),3);
DIC_34_JAS_vert100_avg = mean(DIC_Series_vert100_t34(:,:,32:122),3);
O2_34_JAS_vert_avg = mean(O2_Series_vert_34(:,:,32:122),3);
O2_34_JAS_tvert_avg = mean(O2_Series_vert_t34(:,:,32:122),3);
O2_34_JAS_vert100_avg = mean(O2_Series_vert100_t34(:,:,32:122),3);
NO3_34_JAS_vert_avg = mean(NO3_Series_vert_34(:,:,32:122),3);
NO3_34_JAS_tvert_avg = mean(NO3_Series_vert_t34(:,:,32:122),3);
NO3_34_JAS_vert100_avg = mean(NO3_Series_vert100_t34(:,:,32:122),3); 

THETA_34_JJASON_slice_avg = mean(THETA_Series_slice_34(:,:,1:182),3);
SALT_34_JJASON_slice_avg = mean(SALT_Series_slice_34(:,:,1:182),3);
WVEL_34_JJASON_slice_avg = mean(WVEL_Series_slice_34(:,:,1:182),3);
WVEL_34_JJASON_slice_std = std(WVEL_Series_slice_34(:,:,1:182),0,3);
UVEL_34_JJASON_slice_avg = mean(UVEL_Series_slice_34(:,:,1:182),3);
UVEL_34_JJASON_slice_std = std(UVEL_Series_slice_34(:,:,1:182),0,3);
VVEL_34_JJASON_slice_avg = mean(VVEL_Series_slice_34(:,:,1:182),3);
VVEL_34_JJASON_slice_std = std(VVEL_Series_slice_34(:,:,1:182),0,3);
DIC_34_JJASON_slice_avg = mean(DIC_Series_slice_34(:,:,1:182),3);
ALK_34_JJASON_slice_avg = mean(ALK_Series_slice_34(:,:,1:182),3);
O2_34_JJASON_slice_avg = mean(O2_Series_slice_34(:,:,1:182),3);
NO3_34_JJASON_slice_avg = mean(NO3_Series_slice_34(:,:,1:182),3);
ETAN_34_JJASON_slice_avg = mean(ETAN_Series_slice_34(:,1:182),2);
MLD_34_JJASON_slice_avg = mean(MLD_Series_slice_34(:,1:182),2);
PCO2_34_JJASON_slice_avg = mean(PCO2_Series_slice_34(:,1:182),2);
TFLUX_34_JJASON_slice_avg = mean(TFLUX_Series_slice_34(:,1:182),2);
SFLUX_34_JJASON_slice_avg = mean(SFLUX_Series_slice_34(:,1:182),2);
CFLUX_34_JJASON_slice_avg = mean(CFLUX_Series_slice_34(:,1:182),2);
OFLUX_34_JJASON_slice_avg = mean(OFLUX_Series_slice_34(:,1:182),2);
THETA_34_JJASON_vert_avg = mean(THETA_Series_vert_34(:,:,1:182),3);
THETA_34_JJASON_tvert_avg = mean(THETA_Series_vert_t34(:,:,1:182),3);
THETA_34_JJASON_vert100_avg = mean(THETA_Series_vert100_t34(:,:,1:182),3);
DIC_34_JJASON_vert_avg = mean(DIC_Series_vert_34(:,:,1:182),3);
DIC_34_JJASON_tvert_avg = mean(DIC_Series_vert_t34(:,:,1:182),3);
DIC_34_JJASON_vert100_avg = mean(DIC_Series_vert100_t34(:,:,1:182),3);
O2_34_JJASON_vert_avg = mean(O2_Series_vert_34(:,:,1:182),3);
O2_34_JJASON_tvert_avg = mean(O2_Series_vert_t34(:,:,1:182),3);
O2_34_JJASON_vert100_avg = mean(O2_Series_vert100_t34(:,:,1:182),3);
NO3_34_JJASON_vert_avg = mean(NO3_Series_vert_34(:,:,1:182),3);
NO3_34_JJASON_tvert_avg = mean(NO3_Series_vert_t34(:,:,1:182),3);
NO3_34_JJASON_vert100_avg = mean(NO3_Series_vert100_t34(:,:,1:182),3); 

THETA_34_JASOND_slice_avg = mean(THETA_Series_slice_34(:,:,32:213),3);
SALT_34_JASOND_slice_avg = mean(SALT_Series_slice_34(:,:,32:213),3);
WVEL_34_JASOND_slice_avg = mean(WVEL_Series_slice_34(:,:,32:213),3);
WVEL_34_JASOND_slice_std = std(WVEL_Series_slice_34(:,:,32:213),0,3);
UVEL_34_JASOND_slice_avg = mean(UVEL_Series_slice_34(:,:,32:213),3);
UVEL_34_JASOND_slice_std = std(UVEL_Series_slice_34(:,:,32:213),0,3);
VVEL_34_JASOND_slice_avg = mean(VVEL_Series_slice_34(:,:,32:213),3);
VVEL_34_JASOND_slice_std = std(VVEL_Series_slice_34(:,:,32:213),0,3);
DIC_34_JASOND_slice_avg = mean(DIC_Series_slice_34(:,:,32:213),3);
ALK_34_JASOND_slice_avg = mean(ALK_Series_slice_34(:,:,32:213),3);
O2_34_JASOND_slice_avg = mean(O2_Series_slice_34(:,:,32:213),3);
NO3_34_JASOND_slice_avg = mean(NO3_Series_slice_34(:,:,32:213),3);
ETAN_34_JASOND_slice_avg = mean(ETAN_Series_slice_34(:,32:213),2);
MLD_34_JASOND_slice_avg = mean(MLD_Series_slice_34(:,32:213),2);
PCO2_34_JASOND_slice_avg = mean(PCO2_Series_slice_34(:,32:213),2);
TFLUX_34_JASOND_slice_avg = mean(TFLUX_Series_slice_34(:,32:213),2);
SFLUX_34_JASOND_slice_avg = mean(SFLUX_Series_slice_34(:,32:213),2);
CFLUX_34_JASOND_slice_avg = mean(CFLUX_Series_slice_34(:,32:213),2);
OFLUX_34_JASOND_slice_avg = mean(OFLUX_Series_slice_34(:,32:213),2);
THETA_34_JASOND_vert_avg = mean(THETA_Series_vert_34(:,:,32:213),3);
THETA_34_JASOND_tvert_avg = mean(THETA_Series_vert_t34(:,:,32:213),3);
THETA_34_JASOND_vert100_avg = mean(THETA_Series_vert100_t34(:,:,32:213),3);
DIC_34_JASOND_vert_avg = mean(DIC_Series_vert_34(:,:,32:213),3);
DIC_34_JASOND_tvert_avg = mean(DIC_Series_vert_t34(:,:,32:213),3);
DIC_34_JASOND_vert100_avg = mean(DIC_Series_vert100_t34(:,:,32:213),3);
O2_34_JASOND_vert_avg = mean(O2_Series_vert_34(:,:,32:213),3);
O2_34_JASOND_tvert_avg = mean(O2_Series_vert_t34(:,:,32:213),3);
O2_34_JASOND_vert100_avg = mean(O2_Series_vert100_t34(:,:,32:213),3);
NO3_34_JASOND_vert_avg = mean(NO3_Series_vert_34(:,:,32:213),3);
NO3_34_JASOND_tvert_avg = mean(NO3_Series_vert_t34(:,:,32:213),3);
NO3_34_JASOND_vert100_avg = mean(NO3_Series_vert100_t34(:,:,32:213),3);

[m34,n34] = size(THETA_34_JJA_slice_avg);

parfor ii=1:m34
    for jj=1:n34
        if (HC(slice_index,ii,jj)==0)
            THETA_Series_slice_34(ii,jj,:) = 99999999999;
            SALT_Series_slice_34(ii,jj,:) = 99999999999;
            WVEL_Series_slice_34(ii,jj,:) = 99999999999;
            UVEL_Series_slice_34(ii,jj,:) = 99999999999;
            VVEL_Series_slice_34(ii,jj,:) = 99999999999;
            DIC_Series_slice_34(ii,jj,:) = 99999999999;
            ALK_Series_slice_34(ii,jj,:) = 99999999999;
            O2_Series_slice_34(ii,jj,:) = 99999999999;
            NO3_Series_slice_34(ii,jj,:) = 99999999999;
            
            THETA_34_JJA_slice_avg(ii,jj) = 99999999999;
            SALT_34_JJA_slice_avg(ii,jj) = 99999999999;
            DIC_34_JJA_slice_avg(ii,jj) = 99999999999;
            ALK_34_JJA_slice_avg(ii,jj) = 99999999999;
            WVEL_34_JJA_slice_avg(ii,jj) = 99999999999;
            VVEL_34_JJA_slice_avg(ii,jj) = 99999999999;
            UVEL_34_JJA_slice_avg(ii,jj) = 99999999999;
            O2_34_JJA_slice_avg(ii,jj) = 99999999999;
            NO3_34_JJA_slice_avg(ii,jj) = 99999999999;
            
            THETA_34_JAS_slice_avg(ii,jj) = 99999999999;
            SALT_34_JAS_slice_avg(ii,jj) = 99999999999;
            DIC_34_JAS_slice_avg(ii,jj) = 99999999999;
            ALK_34_JAS_slice_avg(ii,jj) = 99999999999;
            WVEL_34_JAS_slice_avg(ii,jj) = 99999999999;
            VVEL_34_JAS_slice_avg(ii,jj) = 99999999999;
            UVEL_34_JAS_slice_avg(ii,jj) = 99999999999;
            O2_34_JAS_slice_avg(ii,jj) = 99999999999;
            NO3_34_JAS_slice_avg(ii,jj) = 99999999999;
            
            THETA_34_JJASON_slice_avg(ii,jj) = 99999999999;
            SALT_34_JJASON_slice_avg(ii,jj) = 99999999999;
            DIC_34_JJASON_slice_avg(ii,jj) = 99999999999;
            ALK_34_JJASON_slice_avg(ii,jj) = 99999999999;
            WVEL_34_JJASON_slice_avg(ii,jj) = 99999999999;
            VVEL_34_JJASON_slice_avg(ii,jj) = 99999999999;
            UVEL_34_JJASON_slice_avg(ii,jj) = 99999999999;
            O2_34_JJASON_slice_avg(ii,jj) = 99999999999;
            NO3_34_JJASON_slice_avg(ii,jj) = 99999999999;
            
            THETA_34_JASOND_slice_avg(ii,jj) = 99999999999;
            SALT_34_JASOND_slice_avg(ii,jj) = 99999999999;
            DIC_34_JASOND_slice_avg(ii,jj) = 99999999999;
            ALK_34_JASOND_slice_avg(ii,jj) = 99999999999;
            WVEL_34_JASOND_slice_avg(ii,jj) = 99999999999;
            VVEL_34_JASOND_slice_avg(ii,jj) = 99999999999;
            UVEL_34_JASOND_slice_avg(ii,jj) = 99999999999;
            O2_34_JASOND_slice_avg(ii,jj) = 99999999999;
            NO3_34_JASOND_slice_avg(ii,jj) = 99999999999;
        end
    end
end


clear char34* temp34* n34 m34 *field34 ii jj

save AB34_output_THETA_slice_vert THETA*
save AB34_output_SALT_slice_vert SALT*
save AB34_output_WVEL_slice_vert WVEL*
save AB34_output_VVEL_slice_vert VVEL*
save AB34_output_UVEL_slice_vert UVEL*
save AB34_output_O2_slice_vert O2*
save AB34_output_NO3_slice_vert NO3*
save AB34_output_DIC_slice_vert DIC*
save AB34_output_ALK_slice_vert ALK*
save AB34_output_ETAN_slice_vert ETAN*
save AB34_output_MLD_slice_vert MLD*
save AB34_output_PCO2_slice_vert PCO2*
save AB34_output_TFLUX_slice_vert TFLUX*
save AB34_output_CFLUX_slice_vert CFLUX*
save AB34_output_SFLUX_slice_vert SFLUX*
save AB34_output_OFLUX_slice_vert OFLUX*

fprintf('finished 34 \n')

%% end 34


