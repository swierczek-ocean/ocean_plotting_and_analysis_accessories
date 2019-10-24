clear
close all
clc
tic()

dicfield = 1;
thetafield = 1;
tuadvffield = 1;
tvadvffield = 2;
dicuadvfield = 1;
dicvadvfield = 2;
tffield = 1;
cffield = 3;

ind3up = 126;
ind3down = 7;
ind3e = 185;
ind3w = 6;

ind6up = 249;
ind6down = 10;
ind6e = 370;
ind6w = 11;

ind12up = 496;
ind12down = 18;
ind12e = 736;
ind12w = 17;

HFacC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
HFacC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
HFacC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
HFacW3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacW');
HFacW6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacW');
HFacW12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacW');
HFacS3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacS');
HFacS6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacS');
HFacS12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacS');
DRF3 = rdmds('../MITgcm/verification/SO3_20190513/run/DRF');
DRF6 = rdmds('../MITgcm/verification/SO6_20190513/run/DRF');
DRF12 = rdmds('../MITgcm/verification/SO12_20190513/run/DRF');
RAC3 = rdmds('../MITgcm/verification/SO3_20190513/run/RAC');
RAC6 = rdmds('../MITgcm/verification/SO6_20190513/run/RAC');
RAC12 = rdmds('../MITgcm/verification/SO12_20190513/run/RAC');
RC3 = rdmds('../MITgcm/verification/SO3_20190513/run/RC');
RC6 = rdmds('../MITgcm/verification/SO6_20190513/run/RC');
RC12 = rdmds('../MITgcm/verification/SO12_20190513/run/RC');
DXG3 = rdmds('../MITgcm/verification/SO3_20190513/run/DXG');
DXG6 = rdmds('../MITgcm/verification/SO6_20190513/run/DXG');
DXG12 = rdmds('../MITgcm/verification/SO12_20190513/run/DXG');
DYG3 = rdmds('../MITgcm/verification/SO3_20190513/run/DYG');
DYG6 = rdmds('../MITgcm/verification/SO6_20190513/run/DYG');
DYG12 = rdmds('../MITgcm/verification/SO12_20190513/run/DYG');
XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');


str3b = '../MITgcm/verification/SO3_20190513/diag_budgets/';
str6b = '../MITgcm/verification/SO6_20190513/diag_budgets/';
str12b = '../MITgcm/verification/SO12_20190513/diag_budgets/';
str3s = '../MITgcm/verification/SO3_20190513/diag_slice/';
str6s = '../MITgcm/verification/SO6_20190513/diag_slice/';
str12s = '../MITgcm/verification/SO12_20190513/diag_slice/';


DIC3N = zeros(180,52,13);
DIC3S = zeros(180,52,13);
DIC3E = zeros(120,52,13);
DIC3W = zeros(120,52,13);
THETA3N = zeros(180,52,13);
THETA3S = zeros(180,52,13);
THETA3E = zeros(120,52,13);
THETA3W = zeros(120,52,13);

DIC3Nts = zeros(1,13);
DIC3Sts = zeros(1,13);
DIC3Ets = zeros(1,13);
DIC3Wts = zeros(1,13);
THETA3Nts = zeros(1,13);
THETA3Sts = zeros(1,13);
THETA3Ets = zeros(1,13);
THETA3Wts = zeros(1,13);

TFLUX_Series3 = zeros(180,120,395);
CFLUX_Series3 = zeros(180,120,395);
TFLUX_TS = zeros(1,395);
CFLUX_TS = zeros(1,395);

THETA_Series9m = zeros(395,1);
DIC_Series9m = zeros(395,1);
THETA_Series100m = zeros(395,1);
DIC_Series100m = zeros(395,1);

depth31 = 2;
depth32 = 12;


for ii=1:6
    char3dic = [str3b,'diag_dic_budget.000000',num2str(1460*ii)];
    temp3dic = rdmds(char3dic);
    DIC3E(:,:,ii) = squeeze(temp3dic(ind3e+1,ind3s:ind3n,:,dicuadvfield));
    DIC3W(:,:,ii) = squeeze(temp3dic(ind3w,ind3s:ind3n,:,dicuadvfield));
    DIC3S(:,:,ii) = squeeze(temp3dic(ind3w:ind3e,ind3s,:,dicvadvfield));
    DIC3N(:,:,ii) = squeeze(temp3dic(ind3w:ind3e,ind3n+1,:,dicvadvfield));
%     DIC3Ets(ii) = sum(sum(DIC3E(:,:,ii).*squeeze(DYG3(ind3e+1,ind3s:ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3e+1,ind3s:ind3n,:))));
%     DIC3Wts(ii) = sum(sum(DIC3W(:,:,ii).*squeeze(DYG3(ind3w,ind3s:ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w,ind3s:ind3n,:))));
%     DIC3Sts(ii) = sum(sum(DIC3S(:,:,ii).*squeeze(DYG3(ind3w:ind3e,ind3s)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w:ind3e,ind3s,:))));
%     DIC3Nts(ii) = sum(sum(DIC3N(:,:,ii).*squeeze(DYG3(ind3w:ind3e,ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w:ind3e,ind3n,:))));
    DIC3Ets(ii) = sum(sum(DIC3E(:,:,ii)));
    DIC3Wts(ii) = sum(sum(DIC3W(:,:,ii)));
    DIC3Sts(ii) = sum(sum(DIC3S(:,:,ii)));
    DIC3Nts(ii) = sum(sum(DIC3N(:,:,ii)));
    clear temp3dic
    char3t = [str3b,'diag_T_budget.000000',num2str(1460*ii)];
    temp3t = rdmds(char3t);
    THETA3E(:,:,ii) = squeeze(temp3t(ind3e+1,ind3s:ind3n,:,tuadvfield));
    THETA3W(:,:,ii) = squeeze(temp3t(ind3w,ind3s:ind3n,:,tuadvfield));
    THETA3S(:,:,ii) = squeeze(temp3t(ind3w:ind3e,ind3s,:,tvadvfield));
    THETA3N(:,:,ii) = squeeze(temp3t(ind3w:ind3e,ind3n+1,:,tvadvfield));
%     THETA3Ets(ii) = sum(sum(THETA3E(:,:,ii).*squeeze(DYG3(ind3e+1,ind3s:ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3e+1,ind3s:ind3n,:))));
%     THETA3Wts(ii) = sum(sum(THETA3W(:,:,ii).*squeeze(DYG3(ind3w,ind3s:ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w,ind3s:ind3n,:))));
%     THETA3Sts(ii) = sum(sum(THETA3S(:,:,ii).*squeeze(DYG3(ind3w:ind3e,ind3s)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w:ind3e,ind3s,:))));
%     THETA3Nts(ii) = sum(sum(THETA3N(:,:,ii).*squeeze(DYG3(ind3w:ind3e,ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w:ind3e,ind3n,:))));
    THETA3Ets(ii) = sum(sum(THETA3E(:,:,ii)));
    THETA3Wts(ii) = sum(sum(THETA3W(:,:,ii)));
    THETA3Sts(ii) = sum(sum(THETA3S(:,:,ii)));
    THETA3Nts(ii) = sum(sum(THETA3N(:,:,ii)));
    clear temp3t
end

for ii=7:13
    char3dic = [str3b,'diag_dic_budget.00000',num2str(1460*ii)];
    temp3dic = rdmds(char3dic);
    DIC3E(:,:,ii) = squeeze(temp3dic(ind3e+1,ind3s:ind3n,:,dicuadvfield));
    DIC3W(:,:,ii) = squeeze(temp3dic(ind3w,ind3s:ind3n,:,dicuadvfield));
    DIC3S(:,:,ii) = squeeze(temp3dic(ind3w:ind3e,ind3s,:,dicvadvfield));
    DIC3N(:,:,ii) = squeeze(temp3dic(ind3w:ind3e,ind3n+1,:,dicvadvfield));
%     DIC3Ets(ii) = sum(sum(DIC3E(:,:,ii).*squeeze(DYG3(ind3e+1,ind3s:ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3e+1,ind3s:ind3n,:))));
%     DIC3Wts(ii) = sum(sum(DIC3W(:,:,ii).*squeeze(DYG3(ind3w,ind3s:ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w,ind3s:ind3n,:))));
%     DIC3Sts(ii) = sum(sum(DIC3S(:,:,ii).*squeeze(DYG3(ind3w:ind3e,ind3s)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w:ind3e,ind3s,:))));
%     DIC3Nts(ii) = sum(sum(DIC3N(:,:,ii).*squeeze(DYG3(ind3w:ind3e,ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w:ind3e,ind3n,:))));
    DIC3Ets(ii) = sum(sum(DIC3E(:,:,ii)));
    DIC3Wts(ii) = sum(sum(DIC3W(:,:,ii)));
    DIC3Sts(ii) = sum(sum(DIC3S(:,:,ii)));
    DIC3Nts(ii) = sum(sum(DIC3N(:,:,ii)));
    clear temp3dic
    char3t = [str3b,'diag_T_budget.00000',num2str(1460*ii)];
    temp3t = rdmds(char3t); 
    THETA3E(:,:,ii) = squeeze(temp3t(ind3e+1,ind3s:ind3n,:,tuadvfield));
    THETA3W(:,:,ii) = squeeze(temp3t(ind3w,ind3s:ind3n,:,tuadvfield));
    THETA3S(:,:,ii) = squeeze(temp3t(ind3w:ind3e,ind3s,:,tvadvfield));
    THETA3N(:,:,ii) = squeeze(temp3t(ind3w:ind3e,ind3n+1,:,tvadvfield));
%     THETA3Ets(ii) = sum(sum(THETA3E(:,:,ii).*squeeze(DYG3(ind3e+1,ind3s:ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3e+1,ind3s:ind3n,:))));
%     THETA3Wts(ii) = sum(sum(THETA3W(:,:,ii).*squeeze(DYG3(ind3w,ind3s:ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w,ind3s:ind3n,:))));
%     THETA3Sts(ii) = sum(sum(THETA3S(:,:,ii).*squeeze(DYG3(ind3w:ind3e,ind3s)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w:ind3e,ind3s,:))));
%     THETA3Nts(ii) = sum(sum(THETA3N(:,:,ii).*squeeze(DYG3(ind3w:ind3e,ind3n)).*...
%         (squeeze(DRF3)').*squeeze(hFacW(ind3w:ind3e,ind3n,:))));
    THETA3Ets(ii) = sum(sum(THETA3E(:,:,ii)));
    THETA3Wts(ii) = sum(sum(THETA3W(:,:,ii)));
    THETA3Sts(ii) = sum(sum(THETA3S(:,:,ii)));
    THETA3Nts(ii) = sum(sum(THETA3N(:,:,ii)));
    clear temp3t
end


vol9m = sum(squeeze(DRF3(1:depth31)).*(sum(sum(RAC))));
vol100m = sum(squeeze(DRF3(1:depth32)).*(sum(sum(RAC))));

for ii=1:2
    char3state = [str3s,'diag_state.00000000',num2str(48*ii)];
    temp3state = rdmds(char3state);
    THETA_temp1 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth31,thetafield);
    THETA_temp2 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth32,thetafield);
    THETA_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))))./vol9m;
    THETA_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))))./vol100m;
    clear temp3state
    char3bgc = [str3s,'diag_bgc.00000000',num2str(48*ii)];
    temp3bgc = rdmds(char3bgc);
    DIC_temp1 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth31,dicfield);
    DIC_temp2 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth32,dicfield);
    DIC_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))));
    DIC_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))));
    clear temp3state    
    char3surf = [str3s,'diag_airsea.00000000',num2str(48*ii)];
    temp3surf = rdmds(char3surf); 
    TFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,tffield); 
    CFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,cffield);
    TFLUX_TS(ii) = sum(sum(TFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    CFLUX_TS(ii) = sum(sum(CFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    clear temp3surf
end

for ii=3:20
    char3state = [str3s,'diag_state.0000000',num2str(48*ii)];
    temp3state = rdmds(char3state);
    THETA_temp1 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth31,thetafield);
    THETA_temp2 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth32,thetafield);
    THETA_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))))./vol9m;
    THETA_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))))./vol100m;
    clear temp3state
    char3bgc = [str3s,'diag_bgc.0000000',num2str(48*ii)];
    temp3bgc = rdmds(char3bgc);
    DIC_temp1 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth31,dicfield);
    DIC_temp2 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth32,dicfield);
    DIC_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))));
    DIC_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))));
    clear temp3state    
    char3surf = [str3s,'diag_airsea.0000000',num2str(48*ii)];
    temp3surf = rdmds(char3surf); 
    TFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,tffield); 
    CFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,cffield);
    TFLUX_TS(ii) = sum(sum(TFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    CFLUX_TS(ii) = sum(sum(CFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    clear temp3surf
end

for ii=21:208
    char3state = [str3s,'diag_state.000000',num2str(48*ii)];
    temp3state = rdmds(char3state);
    THETA_temp1 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth31,thetafield);
    THETA_temp2 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth32,thetafield);
    THETA_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))))./vol9m;
    THETA_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))))./vol100m;
    clear temp3state
    char3bgc = [str3s,'diag_bgc.000000',num2str(48*ii)];
    temp3bgc = rdmds(char3bgc);
    DIC_temp1 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth31,dicfield);
    DIC_temp2 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth32,dicfield);
    DIC_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))));
    DIC_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))));
    clear temp3state    
    char3surf = [str3s,'diag_airsea.000000',num2str(48*ii)];
    temp3surf = rdmds(char3surf); 
    TFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,tffield); 
    CFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,cffield);
    TFLUX_TS(ii) = sum(sum(TFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    CFLUX_TS(ii) = sum(sum(CFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    clear temp3surf
end

for ii=209:395
    char3state = [str3s,'diag_state.00000',num2str(48*ii)];
    temp3state = rdmds(char3state);
    THETA_temp1 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth31,thetafield);
    THETA_temp2 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth32,thetafield);
    THETA_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))))./vol9m;
    THETA_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))))./vol100m;
    clear temp3state
    char3bgc = [str3s,'diag_bgc.00000',num2str(48*ii)];
    temp3bgc = rdmds(char3bgc);
    DIC_temp1 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth31,dicfield);
    DIC_temp2 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth32,dicfield);
    DIC_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))));
    DIC_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))));
    clear temp3state    
    char3surf = [str3s,'diag_airsea.00000',num2str(48*ii)];
    temp3surf = rdmds(char3surf); 
    TFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,tffield); 
    CFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,cffield);
    TFLUX_TS(ii) = sum(sum(TFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    CFLUX_TS(ii) = sum(sum(CFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    clear temp3surf
end





toc()