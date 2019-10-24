clear
close all
clc

tic()
acc_settings

%%
load AB_AVISO

D_AVISO = permute(D_AVISO,[3,2,1]);

D_AVISO_DJF_std = std(D_AVISO(:,:,1:91),0,3);

D_AVISO_JFM_std = std(D_AVISO(:,:,32:122),0,3);

D_AVISO_DJFMAM_std = std(D_AVISO(:,:,1:182),0,3);

D_AVISO_JFMAMJ_std = std(D_AVISO(:,:,32:213),0,3);

D_AVISO_DN_std = std(D_AVISO(:,:,1:364),0,3);

D_AVISO_JD_std = std(D_AVISO(:,:,32:396),0,3);

D_AVISO_JJA_std = std(D_AVISO(:,:,183:274),0,3);

D_AVISO_JAS_std = std(D_AVISO(:,:,215:306),0,3);

D_AVISO_JJASON_std = std(D_AVISO(:,:,183:366),0,3);

D_AVISO_JASOND_std = std(D_AVISO(:,:,215:396),0,3);

D_AVISO = D_AVISO(:,:,1);

D_AVISO_DJF_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_JFM_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_DJFMAM_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_JFMAMJ_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_DN_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_JD_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_JJA_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_JAS_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_JJASON_std(isnan(D_AVISO)==1) = 99999999;
D_AVISO_JASOND_std(isnan(D_AVISO)==1) = 99999999;

[XCA,YCA] = ndgrid(X_AVISO,Y_AVISO);


clear *sz cm Color 

save AVISO_stds


toc()