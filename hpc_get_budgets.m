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
TFLUX_TS3 = zeros(1,395);
CFLUX_TS3 = zeros(1,395);

THETA3_Series9m = zeros(395,1);
DIC3_Series9m = zeros(395,1);
THETA3_Series100m = zeros(395,1);
DIC3_Series100m = zeros(395,1);

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


vol9m = sum(squeeze(DRF3(1:depth31)).*(sum(sum(RAC3))));
vol100m = sum(squeeze(DRF3(1:depth32)).*(sum(sum(RAC3))));

for ii=1:2
    char3state = [str3s,'diag_state.00000000',num2str(48*ii)];
    temp3state = rdmds(char3state);
    THETA_temp1 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth31,thetafield);
    THETA_temp2 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth32,thetafield);
    THETA3_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))))./vol9m;
    THETA3_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))))./vol100m;
    clear temp3state
    char3bgc = [str3s,'diag_bgc.00000000',num2str(48*ii)];
    temp3bgc = rdmds(char3bgc);
    DIC_temp1 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth31,dicfield);
    DIC_temp2 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth32,dicfield);
    DIC3_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))));
    DIC3_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))));
    clear temp3state    
    char3surf = [str3s,'diag_airsea.00000000',num2str(48*ii)];
    temp3surf = rdmds(char3surf); 
    TFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,tffield); 
    CFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,cffield);
    TFLUX_TS3(ii) = sum(sum(TFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    CFLUX_TS3(ii) = sum(sum(CFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    clear temp3surf
end

for ii=3:20
    char3state = [str3s,'diag_state.0000000',num2str(48*ii)];
    temp3state = rdmds(char3state);
    THETA_temp1 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth31,thetafield);
    THETA_temp2 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth32,thetafield);
    THETA3_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))))./vol9m;
    THETA3_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))))./vol100m;
    clear temp3state
    char3bgc = [str3s,'diag_bgc.0000000',num2str(48*ii)];
    temp3bgc = rdmds(char3bgc);
    DIC_temp1 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth31,dicfield);
    DIC_temp2 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth32,dicfield);
    DIC3_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))));
    DIC3_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))));
    clear temp3state    
    char3surf = [str3s,'diag_airsea.0000000',num2str(48*ii)];
    temp3surf = rdmds(char3surf); 
    TFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,tffield); 
    CFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,cffield);
    TFLUX_TS3(ii) = sum(sum(TFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    CFLUX_TS3(ii) = sum(sum(CFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    clear temp3surf
end

for ii=21:208
    char3state = [str3s,'diag_state.000000',num2str(48*ii)];
    temp3state = rdmds(char3state);
    THETA_temp1 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth31,thetafield);
    THETA_temp2 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth32,thetafield);
    THETA3_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))))./vol9m;
    THETA3_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))))./vol100m;
    clear temp3state
    char3bgc = [str3s,'diag_bgc.000000',num2str(48*ii)];
    temp3bgc = rdmds(char3bgc);
    DIC_temp1 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth31,dicfield);
    DIC_temp2 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth32,dicfield);
    DIC3_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))));
    DIC3_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))));
    clear temp3state    
    char3surf = [str3s,'diag_airsea.000000',num2str(48*ii)];
    temp3surf = rdmds(char3surf); 
    TFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,tffield); 
    CFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,cffield);
    TFLUX_TS3(ii) = sum(sum(TFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    CFLUX_TS3(ii) = sum(sum(CFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    clear temp3surf
end

for ii=209:395
    char3state = [str3s,'diag_state.00000',num2str(48*ii)];
    temp3state = rdmds(char3state);
    THETA_temp1 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth31,thetafield);
    THETA_temp2 = temp3state(ind3w:ind3e,ind3s:ind3n,1:depth32,thetafield);
    THETA3_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))))./vol9m;
    THETA3_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))))./vol100m;
    clear temp3state
    char3bgc = [str3s,'diag_bgc.00000',num2str(48*ii)];
    temp3bgc = rdmds(char3bgc);
    DIC_temp1 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth31,dicfield);
    DIC_temp2 = temp3bgc(ind3w:ind3e,ind3s:ind3n,1:depth32,dicfield);
    DIC3_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth31))));
    DIC3_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC3(ind3w:ind3e,ind3s:ind3n).*...
        DRF3(1,1,1:depth32))));
    clear temp3state    
    char3surf = [str3s,'diag_airsea.00000',num2str(48*ii)];
    temp3surf = rdmds(char3surf); 
    TFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,tffield); 
    CFLUX_Series3(:,:,ii) = temp3surf(ind3w:ind3e,ind3s:ind3n,cffield);
    TFLUX_TS3(ii) = sum(sum(TFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    CFLUX_TS3(ii) = sum(sum(CFLUX_Series3(:,:,ii).*RAC3(ind3w:ind3e,ind3s:ind3n)));
    clear temp3surf
end

THETA3E = mean(THETA3E(:,:,2:13),3);
THETA3W = mean(THETA3W(:,:,2:13),3);
THETA3N = mean(THETA3N(:,:,2:13),3);
THETA3S = mean(THETA3S(:,:,2:13),3);
DIC3E = mean(DIC3E(:,:,2:13),3);
DIC3W = mean(DIC3W(:,:,2:13),3);
DIC3N = mean(DIC3N(:,:,2:13),3);
DIC3S = mean(DIC3S(:,:,2:13),3);

YC3e = YC3(ind3e+1,ind3s:ind3n);
YC3w = YC3(ind3w,ind3s:ind3n);
XC3s = XC3(ind3w:ind3e,ind3s);
XC3n = XC3(ind3w:ind3e,ind3n+1);

clear *temp*

save SO3_BUDGETS DIC* THETA* TFLUX* CFLUX* RC3 YC3e YC3w XC3n XC3s

clear THETA* DIC* TFLUX* CFLUX*

DIC6N = zeros(360,52,13);
DIC6S = zeros(360,52,13);
DIC6E = zeros(240,52,13);
DIC6W = zeros(240,52,13);
THETA6N = zeros(360,52,13);
THETA6S = zeros(360,52,13);
THETA6E = zeros(240,52,13);
THETA6W = zeros(240,52,13);

DIC6Nts = zeros(1,13);
DIC6Sts = zeros(1,13);
DIC6Ets = zeros(1,13);
DIC6Wts = zeros(1,13);
THETA6Nts = zeros(1,13);
THETA6Sts = zeros(1,13);
THETA6Ets = zeros(1,13);
THETA6Wts = zeros(1,13);

TFLUX_Series6 = zeros(360,240,395);
CFLUX_Series6 = zeros(360,240,395);
TFLUX_TS6 = zeros(1,395);
CFLUX_TS6 = zeros(1,395);

THETA6_Series9m = zeros(395,1);
DIC6_Series9m = zeros(395,1);
THETA6_Series100m = zeros(395,1);
DIC6_Series100m = zeros(395,1);

depth61 = 2;
depth62 = 12;


for ii=1:4
    char6dic = [str6b,'diag_dic_budget.000000',num2str(2190*ii)];
    temp6dic = rdmds(char6dic);
    DIC6E(:,:,ii) = squeeze(temp6dic(ind6e+1,ind6s:ind6n,:,dicuadvfield));
    DIC6W(:,:,ii) = squeeze(temp6dic(ind6w,ind6s:ind6n,:,dicuadvfield));
    DIC6S(:,:,ii) = squeeze(temp6dic(ind6w:ind6e,ind6s,:,dicvadvfield));
    DIC6N(:,:,ii) = squeeze(temp6dic(ind6w:ind6e,ind6n+1,:,dicvadvfield));
%     DIC6Ets(ii) = sum(sum(DIC6E(:,:,ii).*squeeze(DYG6(ind6e+1,ind6s:ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6e+1,ind6s:ind6n,:))));
%     DIC6Wts(ii) = sum(sum(DIC6W(:,:,ii).*squeeze(DYG6(ind6w,ind6s:ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w,ind6s:ind6n,:))));
%     DIC6Sts(ii) = sum(sum(DIC6S(:,:,ii).*squeeze(DYG6(ind6w:ind6e,ind6s)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w:ind6e,ind6s,:))));
%     DIC6Nts(ii) = sum(sum(DIC6N(:,:,ii).*squeeze(DYG6(ind6w:ind6e,ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w:ind6e,ind6n,:))));
    DIC6Ets(ii) = sum(sum(DIC6E(:,:,ii)));
    DIC6Wts(ii) = sum(sum(DIC6W(:,:,ii)));
    DIC6Sts(ii) = sum(sum(DIC6S(:,:,ii)));
    DIC6Nts(ii) = sum(sum(DIC6N(:,:,ii)));
    clear temp6dic
    char6t = [str6b,'diag_T_budget.000000',num2str(2190*ii)];
    temp6t = rdmds(char6t);
    THETA6E(:,:,ii) = squeeze(temp6t(ind6e+1,ind6s:ind6n,:,tuadvfield));
    THETA6W(:,:,ii) = squeeze(temp6t(ind6w,ind6s:ind6n,:,tuadvfield));
    THETA6S(:,:,ii) = squeeze(temp6t(ind6w:ind6e,ind6s,:,tvadvfield));
    THETA6N(:,:,ii) = squeeze(temp6t(ind6w:ind6e,ind6n+1,:,tvadvfield));
%     THETA6Ets(ii) = sum(sum(THETA6E(:,:,ii).*squeeze(DYG6(ind6e+1,ind6s:ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6e+1,ind6s:ind6n,:))));
%     THETA6Wts(ii) = sum(sum(THETA6W(:,:,ii).*squeeze(DYG6(ind6w,ind6s:ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w,ind6s:ind6n,:))));
%     THETA6Sts(ii) = sum(sum(THETA6S(:,:,ii).*squeeze(DYG6(ind6w:ind6e,ind6s)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w:ind6e,ind6s,:))));
%     THETA6Nts(ii) = sum(sum(THETA6N(:,:,ii).*squeeze(DYG6(ind6w:ind6e,ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w:ind6e,ind6n,:))));
    THETA6Ets(ii) = sum(sum(THETA6E(:,:,ii)));
    THETA6Wts(ii) = sum(sum(THETA6W(:,:,ii)));
    THETA6Sts(ii) = sum(sum(THETA6S(:,:,ii)));
    THETA6Nts(ii) = sum(sum(THETA6N(:,:,ii)));
    clear temp6t
end

for ii=5:13
    char6dic = [str6b,'diag_dic_budget.00000',num2str(2190*ii)];
    temp6dic = rdmds(char6dic);
    DIC6E(:,:,ii) = squeeze(temp6dic(ind6e+1,ind6s:ind6n,:,dicuadvfield));
    DIC6W(:,:,ii) = squeeze(temp6dic(ind6w,ind6s:ind6n,:,dicuadvfield));
    DIC6S(:,:,ii) = squeeze(temp6dic(ind6w:ind6e,ind6s,:,dicvadvfield));
    DIC6N(:,:,ii) = squeeze(temp6dic(ind6w:ind6e,ind6n+1,:,dicvadvfield));
%     DIC6Ets(ii) = sum(sum(DIC6E(:,:,ii).*squeeze(DYG6(ind6e+1,ind6s:ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6e+1,ind6s:ind6n,:))));
%     DIC6Wts(ii) = sum(sum(DIC6W(:,:,ii).*squeeze(DYG6(ind6w,ind6s:ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w,ind6s:ind6n,:))));
%     DIC6Sts(ii) = sum(sum(DIC6S(:,:,ii).*squeeze(DYG6(ind6w:ind6e,ind6s)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w:ind6e,ind6s,:))));
%     DIC6Nts(ii) = sum(sum(DIC6N(:,:,ii).*squeeze(DYG6(ind6w:ind6e,ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w:ind6e,ind6n,:))));
    DIC6Ets(ii) = sum(sum(DIC6E(:,:,ii)));
    DIC6Wts(ii) = sum(sum(DIC6W(:,:,ii)));
    DIC6Sts(ii) = sum(sum(DIC6S(:,:,ii)));
    DIC6Nts(ii) = sum(sum(DIC6N(:,:,ii)));
    clear temp6dic
    char6t = [str6b,'diag_T_budget.00000',num2str(2190*ii)];
    temp6t = rdmds(char6t); 
    THETA6E(:,:,ii) = squeeze(temp6t(ind6e+1,ind6s:ind6n,:,tuadvfield));
    THETA6W(:,:,ii) = squeeze(temp6t(ind6w,ind6s:ind6n,:,tuadvfield));
    THETA6S(:,:,ii) = squeeze(temp6t(ind6w:ind6e,ind6s,:,tvadvfield));
    THETA6N(:,:,ii) = squeeze(temp6t(ind6w:ind6e,ind6n+1,:,tvadvfield));
%     THETA6Ets(ii) = sum(sum(THETA6E(:,:,ii).*squeeze(DYG6(ind6e+1,ind6s:ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6e+1,ind6s:ind6n,:))));
%     THETA6Wts(ii) = sum(sum(THETA6W(:,:,ii).*squeeze(DYG6(ind6w,ind6s:ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w,ind6s:ind6n,:))));
%     THETA6Sts(ii) = sum(sum(THETA6S(:,:,ii).*squeeze(DYG6(ind6w:ind6e,ind6s)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w:ind6e,ind6s,:))));
%     THETA6Nts(ii) = sum(sum(THETA6N(:,:,ii).*squeeze(DYG6(ind6w:ind6e,ind6n)).*...
%         (squeeze(DRF6)').*squeeze(hFacW(ind6w:ind6e,ind6n,:))));
    THETA6Ets(ii) = sum(sum(THETA6E(:,:,ii)));
    THETA6Wts(ii) = sum(sum(THETA6W(:,:,ii)));
    THETA6Sts(ii) = sum(sum(THETA6S(:,:,ii)));
    THETA6Nts(ii) = sum(sum(THETA6N(:,:,ii)));
    clear temp6t
end


vol9m = sum(squeeze(DRF6(1:depth61)).*(sum(sum(RAC6))));
vol100m = sum(squeeze(DRF6(1:depth62)).*(sum(sum(RAC6))));

for ii=1:1
    char6state = [str6s,'diag_state.00000000',num2str(72*ii)];
    temp6state = rdmds(char6state);
    THETA_temp1 = temp6state(ind6w:ind6e,ind6s:ind6n,1:depth61,thetafield);
    THETA_temp2 = temp6state(ind6w:ind6e,ind6s:ind6n,1:depth62,thetafield);
    THETA6_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth61))))./vol9m;
    THETA6_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth62))))./vol100m;
    clear temp6state
    char6bgc = [str6s,'diag_bgc.00000000',num2str(72*ii)];
    temp6bgc = rdmds(char6bgc);
    DIC_temp1 = temp6bgc(ind6w:ind6e,ind6s:ind6n,1:depth61,dicfield);
    DIC_temp2 = temp6bgc(ind6w:ind6e,ind6s:ind6n,1:depth62,dicfield);
    DIC6_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth61))));
    DIC6_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth62))));
    clear temp6state    
    char6surf = [str6s,'diag_airsea.00000000',num2str(72*ii)];
    temp6surf = rdmds(char6surf); 
    TFLUX_Series6(:,:,ii) = temp6surf(ind6w:ind6e,ind6s:ind6n,tffield); 
    CFLUX_Series6(:,:,ii) = temp6surf(ind6w:ind6e,ind6s:ind6n,cffield);
    TFLUX_TS6(ii) = sum(sum(TFLUX_Series6(:,:,ii).*RAC6(ind6w:ind6e,ind6s:ind6n)));
    CFLUX_TS6(ii) = sum(sum(CFLUX_Series6(:,:,ii).*RAC6(ind6w:ind6e,ind6s:ind6n)));
    clear temp6surf
end

for ii=2:13
    char6state = [str6s,'diag_state.0000000',num2str(72*ii)];
    temp6state = rdmds(char6state);
    THETA_temp1 = temp6state(ind6w:ind6e,ind6s:ind6n,1:depth61,thetafield);
    THETA_temp2 = temp6state(ind6w:ind6e,ind6s:ind6n,1:depth62,thetafield);
    THETA6_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth61))))./vol9m;
    THETA6_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth62))))./vol100m;
    clear temp6state
    char6bgc = [str6s,'diag_bgc.0000000',num2str(72*ii)];
    temp6bgc = rdmds(char6bgc);
    DIC_temp1 = temp6bgc(ind6w:ind6e,ind6s:ind6n,1:depth61,dicfield);
    DIC_temp2 = temp6bgc(ind6w:ind6e,ind6s:ind6n,1:depth62,dicfield);
    DIC6_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth61))));
    DIC6_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth62))));
    clear temp6state    
    char6surf = [str6s,'diag_airsea.0000000',num2str(72*ii)];
    temp6surf = rdmds(char6surf); 
    TFLUX_Series6(:,:,ii) = temp6surf(ind6w:ind6e,ind6s:ind6n,tffield); 
    CFLUX_Series6(:,:,ii) = temp6surf(ind6w:ind6e,ind6s:ind6n,cffield);
    TFLUX_TS6(ii) = sum(sum(TFLUX_Series6(:,:,ii).*RAC6(ind6w:ind6e,ind6s:ind6n)));
    CFLUX_TS6(ii) = sum(sum(CFLUX_Series6(:,:,ii).*RAC6(ind6w:ind6e,ind6s:ind6n)));
    clear temp6surf
end

for ii=14:138
    char6state = [str6s,'diag_state.000000',num2str(72*ii)];
    temp6state = rdmds(char6state);
    THETA_temp1 = temp6state(ind6w:ind6e,ind6s:ind6n,1:depth61,thetafield);
    THETA_temp2 = temp6state(ind6w:ind6e,ind6s:ind6n,1:depth62,thetafield);
    THETA6_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth61))))./vol9m;
    THETA6_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth62))))./vol100m;
    clear temp6state
    char6bgc = [str6s,'diag_bgc.000000',num2str(72*ii)];
    temp6bgc = rdmds(char6bgc);
    DIC_temp1 = temp6bgc(ind6w:ind6e,ind6s:ind6n,1:depth61,dicfield);
    DIC_temp2 = temp6bgc(ind6w:ind6e,ind6s:ind6n,1:depth62,dicfield);
    DIC6_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth61))));
    DIC6_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth62))));
    clear temp6state    
    char6surf = [str6s,'diag_airsea.000000',num2str(72*ii)];
    temp6surf = rdmds(char6surf); 
    TFLUX_Series6(:,:,ii) = temp6surf(ind6w:ind6e,ind6s:ind6n,tffield); 
    CFLUX_Series6(:,:,ii) = temp6surf(ind6w:ind6e,ind6s:ind6n,cffield);
    TFLUX_TS6(ii) = sum(sum(TFLUX_Series6(:,:,ii).*RAC6(ind6w:ind6e,ind6s:ind6n)));
    CFLUX_TS6(ii) = sum(sum(CFLUX_Series6(:,:,ii).*RAC6(ind6w:ind6e,ind6s:ind6n)));
    clear temp6surf
end

for ii=139:395
    char6state = [str6s,'diag_state.00000',num2str(72*ii)];
    temp6state = rdmds(char6state);
    THETA_temp1 = temp6state(ind6w:ind6e,ind6s:ind6n,1:depth61,thetafield);
    THETA_temp2 = temp6state(ind6w:ind6e,ind6s:ind6n,1:depth62,thetafield);
    THETA6_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth61))))./vol9m;
    THETA6_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth62))))./vol100m;
    clear temp6state
    char6bgc = [str6s,'diag_bgc.00000',num2str(72*ii)];
    temp6bgc = rdmds(char6bgc);
    DIC_temp1 = temp6bgc(ind6w:ind6e,ind6s:ind6n,1:depth61,dicfield);
    DIC_temp2 = temp6bgc(ind6w:ind6e,ind6s:ind6n,1:depth62,dicfield);
    DIC6_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth61))));
    DIC6_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC6(ind6w:ind6e,ind6s:ind6n).*...
        DRF6(1,1,1:depth62))));
    clear temp6state    
    char6surf = [str6s,'diag_airsea.00000',num2str(72*ii)];
    temp6surf = rdmds(char6surf); 
    TFLUX_Series6(:,:,ii) = temp6surf(ind6w:ind6e,ind6s:ind6n,tffield); 
    CFLUX_Series6(:,:,ii) = temp6surf(ind6w:ind6e,ind6s:ind6n,cffield);
    TFLUX_TS6(ii) = sum(sum(TFLUX_Series6(:,:,ii).*RAC6(ind6w:ind6e,ind6s:ind6n)));
    CFLUX_TS6(ii) = sum(sum(CFLUX_Series6(:,:,ii).*RAC6(ind6w:ind6e,ind6s:ind6n)));
    clear temp6surf
end

THETA6E = mean(THETA6E(:,:,2:13),3);
THETA6W = mean(THETA6W(:,:,2:13),3);
THETA6N = mean(THETA6N(:,:,2:13),3);
THETA6S = mean(THETA6S(:,:,2:13),3);
DIC6E = mean(DIC6E(:,:,2:13),3);
DIC6W = mean(DIC6W(:,:,2:13),3);
DIC6N = mean(DIC6N(:,:,2:13),3);
DIC6S = mean(DIC6S(:,:,2:13),3);

YC6e = YC6(ind6e+1,ind6s:ind6n);
YC6w = YC6(ind6w,ind6s:ind6n);
XC6s = XC6(ind6w:ind6e,ind6s);
XC6n = XC6(ind6w:ind6e,ind6n+1);

clear *temp*

save SO6_BUDGETS DIC* THETA* TFLUX* CFLUX* RC6 YC6e YC6w XC6n XC6s

clear THETA* DIC* TFLUX* CFLUX*

DIC12N = zeros(720,52,13);
DIC12S = zeros(720,52,13);
DIC12E = zeros(479,52,13);
DIC12W = zeros(479,52,13);
THETA12N = zeros(720,52,13);
THETA12S = zeros(720,52,13);
THETA12E = zeros(479,52,13);
THETA12W = zeros(479,52,13);

DIC12Nts = zeros(1,13);
DIC12Sts = zeros(1,13);
DIC12Ets = zeros(1,13);
DIC12Wts = zeros(1,13);
THETA12Nts = zeros(1,13);
THETA12Sts = zeros(1,13);
THETA12Ets = zeros(1,13);
THETA12Wts = zeros(1,13);

TFLUX_Series12 = zeros(720,479,395);
CFLUX_Series12 = zeros(720,479,395);
TFLUX_TS12 = zeros(1,395);
CFLUX_TS12 = zeros(1,395);

THETA12_Series9m = zeros(395,1);
DIC12_Series9m = zeros(395,1);
THETA12_Series100m = zeros(395,1);
DIC12_Series100m = zeros(395,1);

depth121 = 4;
depth122 = 24;


for ii=1:9
    char12dic = [str12b,'diag_dic_budget.00000',num2str(10950*ii)];
    temp12dic = rdmds(char12dic);
    DIC12E(:,:,ii) = squeeze(temp12dic(ind12e+1,ind12s:ind12n,:,dicuadvfield));
    DIC12W(:,:,ii) = squeeze(temp12dic(ind12w,ind12s:ind12n,:,dicuadvfield));
    DIC12S(:,:,ii) = squeeze(temp12dic(ind12w:ind12e,ind12s,:,dicvadvfield));
    DIC12N(:,:,ii) = squeeze(temp12dic(ind12w:ind12e,ind12n+1,:,dicvadvfield));
%     DIC12Ets(ii) = sum(sum(DIC12E(:,:,ii).*squeeze(DYG12(ind12e+1,ind12s:ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12e+1,ind12s:ind12n,:))));
%     DIC12Wts(ii) = sum(sum(DIC12W(:,:,ii).*squeeze(DYG12(ind12w,ind12s:ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w,ind12s:ind12n,:))));
%     DIC12Sts(ii) = sum(sum(DIC12S(:,:,ii).*squeeze(DYG12(ind12w:ind12e,ind12s)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w:ind12e,ind12s,:))));
%     DIC12Nts(ii) = sum(sum(DIC12N(:,:,ii).*squeeze(DYG12(ind12w:ind12e,ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w:ind12e,ind12n,:))));
    DIC12Ets(ii) = sum(sum(DIC12E(:,:,ii)));
    DIC12Wts(ii) = sum(sum(DIC12W(:,:,ii)));
    DIC12Sts(ii) = sum(sum(DIC12S(:,:,ii)));
    DIC12Nts(ii) = sum(sum(DIC12N(:,:,ii)));
    clear temp12dic
    char12t = [str12b,'diag_T_budget.00000',num2str(10950*ii)];
    temp12t = rdmds(char12t);
    THETA12E(:,:,ii) = squeeze(temp12t(ind12e+1,ind12s:ind12n,:,tuadvfield));
    THETA12W(:,:,ii) = squeeze(temp12t(ind12w,ind12s:ind12n,:,tuadvfield));
    THETA12S(:,:,ii) = squeeze(temp12t(ind12w:ind12e,ind12s,:,tvadvfield));
    THETA12N(:,:,ii) = squeeze(temp12t(ind12w:ind12e,ind12n+1,:,tvadvfield));
%     THETA12Ets(ii) = sum(sum(THETA12E(:,:,ii).*squeeze(DYG12(ind12e+1,ind12s:ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12e+1,ind12s:ind12n,:))));
%     THETA12Wts(ii) = sum(sum(THETA12W(:,:,ii).*squeeze(DYG12(ind12w,ind12s:ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w,ind12s:ind12n,:))));
%     THETA12Sts(ii) = sum(sum(THETA12S(:,:,ii).*squeeze(DYG12(ind12w:ind12e,ind12s)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w:ind12e,ind12s,:))));
%     THETA12Nts(ii) = sum(sum(THETA12N(:,:,ii).*squeeze(DYG12(ind12w:ind12e,ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w:ind12e,ind12n,:))));
    THETA12Ets(ii) = sum(sum(THETA12E(:,:,ii)));
    THETA12Wts(ii) = sum(sum(THETA12W(:,:,ii)));
    THETA12Sts(ii) = sum(sum(THETA12S(:,:,ii)));
    THETA12Nts(ii) = sum(sum(THETA12N(:,:,ii)));
    clear temp12t
end

for ii=10:13
    char12dic = [str12b,'diag_dic_budget.0000',num2str(10950*ii)];
    temp12dic = rdmds(char12dic);
    DIC12E(:,:,ii) = squeeze(temp12dic(ind12e+1,ind12s:ind12n,:,dicuadvfield));
    DIC12W(:,:,ii) = squeeze(temp12dic(ind12w,ind12s:ind12n,:,dicuadvfield));
    DIC12S(:,:,ii) = squeeze(temp12dic(ind12w:ind12e,ind12s,:,dicvadvfield));
    DIC12N(:,:,ii) = squeeze(temp12dic(ind12w:ind12e,ind12n+1,:,dicvadvfield));
%     DIC12Ets(ii) = sum(sum(DIC12E(:,:,ii).*squeeze(DYG12(ind12e+1,ind12s:ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12e+1,ind12s:ind12n,:))));
%     DIC12Wts(ii) = sum(sum(DIC12W(:,:,ii).*squeeze(DYG12(ind12w,ind12s:ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w,ind12s:ind12n,:))));
%     DIC12Sts(ii) = sum(sum(DIC12S(:,:,ii).*squeeze(DYG12(ind12w:ind12e,ind12s)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w:ind12e,ind12s,:))));
%     DIC12Nts(ii) = sum(sum(DIC12N(:,:,ii).*squeeze(DYG12(ind12w:ind12e,ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w:ind12e,ind12n,:))));
    DIC12Ets(ii) = sum(sum(DIC12E(:,:,ii)));
    DIC12Wts(ii) = sum(sum(DIC12W(:,:,ii)));
    DIC12Sts(ii) = sum(sum(DIC12S(:,:,ii)));
    DIC12Nts(ii) = sum(sum(DIC12N(:,:,ii)));
    clear temp12dic
    char12t = [str12b,'diag_T_budget.0000',num2str(10950*ii)];
    temp12t = rdmds(char12t); 
    THETA12E(:,:,ii) = squeeze(temp12t(ind12e+1,ind12s:ind12n,:,tuadvfield));
    THETA12W(:,:,ii) = squeeze(temp12t(ind12w,ind12s:ind12n,:,tuadvfield));
    THETA12S(:,:,ii) = squeeze(temp12t(ind12w:ind12e,ind12s,:,tvadvfield));
    THETA12N(:,:,ii) = squeeze(temp12t(ind12w:ind12e,ind12n+1,:,tvadvfield));
%     THETA12Ets(ii) = sum(sum(THETA12E(:,:,ii).*squeeze(DYG12(ind12e+1,ind12s:ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12e+1,ind12s:ind12n,:))));
%     THETA12Wts(ii) = sum(sum(THETA12W(:,:,ii).*squeeze(DYG12(ind12w,ind12s:ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w,ind12s:ind12n,:))));
%     THETA12Sts(ii) = sum(sum(THETA12S(:,:,ii).*squeeze(DYG12(ind12w:ind12e,ind12s)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w:ind12e,ind12s,:))));
%     THETA12Nts(ii) = sum(sum(THETA12N(:,:,ii).*squeeze(DYG12(ind12w:ind12e,ind12n)).*...
%         (squeeze(DRF12)').*squeeze(hFacW(ind12w:ind12e,ind12n,:))));
    THETA12Ets(ii) = sum(sum(THETA12E(:,:,ii)));
    THETA12Wts(ii) = sum(sum(THETA12W(:,:,ii)));
    THETA12Sts(ii) = sum(sum(THETA12S(:,:,ii)));
    THETA12Nts(ii) = sum(sum(THETA12N(:,:,ii)));
    clear temp12t
end


vol9m = sum(squeeze(DRF12(1:depth121)).*(sum(sum(RAC12))));
vol100m = sum(squeeze(DRF12(1:depth122)).*(sum(sum(RAC12))));

for ii=1:2
    char12state = [str12s,'diag_state.0000000',num2str(360*ii)];
    temp12state = rdmds(char12state);
    THETA_temp1 = temp12state(ind12w:ind12e,ind12s:ind12n,1:depth121,thetafield);
    THETA_temp2 = temp12state(ind12w:ind12e,ind12s:ind12n,1:depth122,thetafield);
    THETA12_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth121))))./vol9m;
    THETA12_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth122))))./vol100m;
    clear temp12state
    char12bgc = [str12s,'diag_bgc.0000000',num2str(360*ii)];
    temp12bgc = rdmds(char12bgc);
    DIC_temp1 = temp12bgc(ind12w:ind12e,ind12s:ind12n,1:depth121,dicfield);
    DIC_temp2 = temp12bgc(ind12w:ind12e,ind12s:ind12n,1:depth122,dicfield);
    DIC12_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth121))));
    DIC12_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth122))));
    clear temp12state    
    char12surf = [str12s,'diag_airsea.0000000',num2str(360*ii)];
    temp12surf = rdmds(char12surf); 
    TFLUX_Series12(:,:,ii) = temp12surf(ind12w:ind12e,ind12s:ind12n,tffield); 
    CFLUX_Series12(:,:,ii) = temp12surf(ind12w:ind12e,ind12s:ind12n,cffield);
    TFLUX_TS12(ii) = sum(sum(TFLUX_Series12(:,:,ii).*RAC12(ind12w:ind12e,ind12s:ind12n)));
    CFLUX_TS12(ii) = sum(sum(CFLUX_Series12(:,:,ii).*RAC12(ind12w:ind12e,ind12s:ind12n)));
    clear temp12surf
end

for ii=3:27
    char12state = [str12s,'diag_state.000000',num2str(360*ii)];
    temp12state = rdmds(char12state);
    THETA_temp1 = temp12state(ind12w:ind12e,ind12s:ind12n,1:depth121,thetafield);
    THETA_temp2 = temp12state(ind12w:ind12e,ind12s:ind12n,1:depth122,thetafield);
    THETA12_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth121))))./vol9m;
    THETA12_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth122))))./vol100m;
    clear temp12state
    char12bgc = [str12s,'diag_bgc.000000',num2str(360*ii)];
    temp12bgc = rdmds(char12bgc);
    DIC_temp1 = temp12bgc(ind12w:ind12e,ind12s:ind12n,1:depth121,dicfield);
    DIC_temp2 = temp12bgc(ind12w:ind12e,ind12s:ind12n,1:depth122,dicfield);
    DIC12_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth121))));
    DIC12_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth122))));
    clear temp12state    
    char12surf = [str12s,'diag_airsea.000000',num2str(360*ii)];
    temp12surf = rdmds(char12surf); 
    TFLUX_Series12(:,:,ii) = temp12surf(ind12w:ind12e,ind12s:ind12n,tffield); 
    CFLUX_Series12(:,:,ii) = temp12surf(ind12w:ind12e,ind12s:ind12n,cffield);
    TFLUX_TS12(ii) = sum(sum(TFLUX_Series12(:,:,ii).*RAC12(ind12w:ind12e,ind12s:ind12n)));
    CFLUX_TS12(ii) = sum(sum(CFLUX_Series12(:,:,ii).*RAC12(ind12w:ind12e,ind12s:ind12n)));
    clear temp12surf
end

for ii=28:277
    char12state = [str12s,'diag_state.00000',num2str(360*ii)];
    temp12state = rdmds(char12state);
    THETA_temp1 = temp12state(ind12w:ind12e,ind12s:ind12n,1:depth121,thetafield);
    THETA_temp2 = temp12state(ind12w:ind12e,ind12s:ind12n,1:depth122,thetafield);
    THETA12_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth121))))./vol9m;
    THETA12_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth122))))./vol100m;
    clear temp12state
    char12bgc = [str12s,'diag_bgc.00000',num2str(360*ii)];
    temp12bgc = rdmds(char12bgc);
    DIC_temp1 = temp12bgc(ind12w:ind12e,ind12s:ind12n,1:depth121,dicfield);
    DIC_temp2 = temp12bgc(ind12w:ind12e,ind12s:ind12n,1:depth122,dicfield);
    DIC12_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth121))));
    DIC12_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth122))));
    clear temp12state    
    char12surf = [str12s,'diag_airsea.00000',num2str(360*ii)];
    temp12surf = rdmds(char12surf); 
    TFLUX_Series12(:,:,ii) = temp12surf(ind12w:ind12e,ind12s:ind12n,tffield); 
    CFLUX_Series12(:,:,ii) = temp12surf(ind12w:ind12e,ind12s:ind12n,cffield);
    TFLUX_TS12(ii) = sum(sum(TFLUX_Series12(:,:,ii).*RAC12(ind12w:ind12e,ind12s:ind12n)));
    CFLUX_TS12(ii) = sum(sum(CFLUX_Series12(:,:,ii).*RAC12(ind12w:ind12e,ind12s:ind12n)));
    clear temp12surf
end

for ii=278:395
    char12state = [str12s,'diag_state.0000',num2str(360*ii)];
    temp12state = rdmds(char12state);
    THETA_temp1 = temp12state(ind12w:ind12e,ind12s:ind12n,1:depth121,thetafield);
    THETA_temp2 = temp12state(ind12w:ind12e,ind12s:ind12n,1:depth122,thetafield);
    THETA12_Series9m(ii) = sum(sum(sum(THETA_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth121))))./vol9m;
    THETA12_Series100m(ii) = sum(sum(sum(THETA_temp2.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth122))))./vol100m;
    clear temp12state
    char12bgc = [str12s,'diag_bgc.0000',num2str(360*ii)];
    temp12bgc = rdmds(char12bgc);
    DIC_temp1 = temp12bgc(ind12w:ind12e,ind12s:ind12n,1:depth121,dicfield);
    DIC_temp2 = temp12bgc(ind12w:ind12e,ind12s:ind12n,1:depth122,dicfield);
    DIC12_Series9m(ii) = sum(sum(sum(DIC_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth121))));
    DIC12_Series100m(ii) = sum(sum(sum(DIC_temp1.*RAC12(ind12w:ind12e,ind12s:ind12n).*...
        DRF12(1,1,1:depth122))));
    clear temp12state    
    char12surf = [str12s,'diag_airsea.0000',num2str(360*ii)];
    temp12surf = rdmds(char12surf); 
    TFLUX_Series12(:,:,ii) = temp12surf(ind12w:ind12e,ind12s:ind12n,tffield); 
    CFLUX_Series12(:,:,ii) = temp12surf(ind12w:ind12e,ind12s:ind12n,cffield);
    TFLUX_TS12(ii) = sum(sum(TFLUX_Series12(:,:,ii).*RAC12(ind12w:ind12e,ind12s:ind12n)));
    CFLUX_TS12(ii) = sum(sum(CFLUX_Series12(:,:,ii).*RAC12(ind12w:ind12e,ind12s:ind12n)));
    clear temp12surf
end

THETA12E = mean(THETA12E(:,:,2:13),3);
THETA12W = mean(THETA12W(:,:,2:13),3);
THETA12N = mean(THETA12N(:,:,2:13),3);
THETA12S = mean(THETA12S(:,:,2:13),3);
DIC12E = mean(DIC12E(:,:,2:13),3);
DIC12W = mean(DIC12W(:,:,2:13),3);
DIC12N = mean(DIC12N(:,:,2:13),3);
DIC12S = mean(DIC12S(:,:,2:13),3);

YC12e = YC12(ind12e+1,ind12s:ind12n);
YC12w = YC12(ind12w,ind12s:ind12n);
XC12s = XC12(ind12w:ind12e,ind12s);
XC12n = XC12(ind12w:ind12e,ind12n+1);

clear *temp*

save SO12_BUDGETS DIC* THETA* TFLUX* CFLUX* RC12 YC12e YC12w XC12n XC12s

clear THETA* DIC* TFLUX* CFLUX*



toc()