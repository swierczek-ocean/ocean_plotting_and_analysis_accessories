clear
close all
clc
tic()

XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
XG3 = rdmds('../MITgcm/verification/SO3_20190513/run/XG');
YG3 = rdmds('../MITgcm/verification/SO3_20190513/run/YG');
RC3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC'));
RF3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RF'));
hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO3_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO3_20190513/run/hFacS');
str = '../MITgcm/verification/SO3_20190513/old_diag/';
strb = '../MITgcm/verification/SO3_20190513/old_diag_budgets/';

%% 

wvel3 = zeros(192,132,52,12);
theta3 = wvel3;
salt3 = wvel3;
uvel3 = wvel3;
vvel3 = wvel3;
dic3 = wvel3;
oxy3 = wvel3;
advrth3 = wvel3;
advuth3 = wvel3;
advvth3 = wvel3;
advrsa3 = wvel3;
advusa3 = wvel3;
advvsa3 = wvel3;
advrdic3 = wvel3;
advudic3 = wvel3;
advvdic3 = wvel3;
tflux3 = zeros(192,132,12);
sflux3 = tflux3;
cflux3 = tflux3;
oflux3 = tflux3;


for ii=1:12
    charstate = [str,'diag_state.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1:5);
    theta3(:,:,:,ii) = temp(:,:,:,1);
    salt3(:,:,:,ii) = temp(:,:,:,2);
    uvel3(:,:,:,ii) = temp(:,:,:,3);
    vvel3(:,:,:,ii) = temp(:,:,:,4);
    wvel3(:,:,:,ii) = temp(:,:,:,5);
    clear temp
    
    charbio = [str,'diag_bgc.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbio,'rec',[1,3]);
    dic3(:,:,:,ii) = temp(:,:,:,1);
    oxy3(:,:,:,ii) = temp(:,:,:,2);
    clear temp
    
    charas = [str,'diag_airsea.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charas,'rec',1:4);
    tflux3(:,:,ii) = temp(:,:,1);
    sflux3(:,:,ii) = temp(:,:,2);
    cflux3(:,:,ii) = temp(:,:,3);
    oflux3(:,:,ii) = temp(:,:,4);
    clear temp
    
    charbth = [strb,'diag_T_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbth,'rec',1:3);
    advrth3(:,:,:,ii) = temp(:,:,:,1);
    advuth3(:,:,:,ii) = temp(:,:,:,2);
    advvth3(:,:,:,ii) = temp(:,:,:,3);
    clear temp
    
    charbsa = [strb,'diag_S_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbsa,'rec',1:3);
    advrsa3(:,:,:,ii) = temp(:,:,:,1);
    advusa3(:,:,:,ii) = temp(:,:,:,2);
    advvsa3(:,:,:,ii) = temp(:,:,:,3);
    clear temp
    
    charbc = [strb,'diag_dic_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbc,'rec',1:3);
    advrdic3(:,:,:,ii) = temp(:,:,:,1);
    advudic3(:,:,:,ii) = temp(:,:,:,2);
    advvdic3(:,:,:,ii) = temp(:,:,:,3);
    clear temp
end

for ii=1:192
    for jj=1:132
        if hFacC(ii,jj,1)==0
            tflux3(ii,jj,:) = NaN;
            sflux3(ii,jj,:) = NaN;
            cflux3(ii,jj,:) = NaN;
            oflux3(ii,jj,:) = NaN;
        end
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                theta3(ii,jj,kk,:) = NaN;
                salt3(ii,jj,kk,:) = NaN;
                dic3(ii,jj,kk,:) = NaN;
                oxy3(ii,jj,kk,:) = NaN;
                wvel3(ii,jj,kk,:) = NaN;
                advrth3(ii,jj,kk,:) = NaN;
                advrsa3(ii,jj,kk,:) = NaN;
                advrdic3(ii,jj,kk,:) = NaN;
            end
            if hFacW(ii,jj,kk)==0
                uvel3(ii,jj,kk,:) = NaN;
                advuth3(ii,jj,kk,:) = NaN;
                advusa3(ii,jj,kk,:) = NaN;
                advudic3(ii,jj,kk,:) = NaN;
            end
            if hFacS(ii,jj,kk)==0
                vvel3(ii,jj,kk,:) = NaN;
                advvth3(ii,jj,kk,:) = NaN;
                advvsa3(ii,jj,kk,:) = NaN;
                advvdic3(ii,jj,kk,:) = NaN;
            end
        end
    end
end

clear ii jj kk str* hFac* temp char* 

save monthly3

clear

XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
XG6 = rdmds('../MITgcm/verification/SO6_20190513/run/XG');
YG6 = rdmds('../MITgcm/verification/SO6_20190513/run/YG');
RC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
RF6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RF'));
hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO6_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO6_20190513/run/hFacS');
str = '../MITgcm/verification/SO6_20190513/old_diag/';
strb = '../MITgcm/verification/SO6_20190513/old_diag_budgets/';

%% 

wvel6 = zeros(384,260,52,12);
theta6 = wvel6;
salt6 = wvel6;
uvel6 = wvel6;
vvel6 = wvel6;
dic6 = wvel6;
oxy6 = wvel6;
advrth6 = wvel6;
advuth6 = wvel6;
advvth6 = wvel6;
advrsa6 = wvel6;
advusa6 = wvel6;
advvsa6 = wvel6;
advrdic6 = wvel6;
advudic6 = wvel6;
advvdic6 = wvel6;
tflux6 = zeros(384,260,12);
sflux6 = tflux6;
cflux6 = tflux6;
oflux6 = tflux6;


for ii=1:12
    charstate = [str,'diag_state.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1:5);
    theta6(:,:,:,ii) = temp(:,:,:,1);
    salt6(:,:,:,ii) = temp(:,:,:,2);
    uvel6(:,:,:,ii) = temp(:,:,:,3);
    vvel6(:,:,:,ii) = temp(:,:,:,4);
    wvel6(:,:,:,ii) = temp(:,:,:,5);
    clear temp
    
    charbio = [str,'diag_bgc.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbio,'rec',[1,3]);
    dic6(:,:,:,ii) = temp(:,:,:,1);
    oxy6(:,:,:,ii) = temp(:,:,:,2);
    clear temp
    
    charas = [str,'diag_airsea.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charas,'rec',1:4);
    tflux6(:,:,ii) = temp(:,:,1);
    sflux6(:,:,ii) = temp(:,:,2);
    cflux6(:,:,ii) = temp(:,:,3);
    oflux6(:,:,ii) = temp(:,:,4);
    clear temp
    
    charbth = [strb,'diag_T_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbth,'rec',1:3);
    advrth6(:,:,:,ii) = temp(:,:,:,1);
    advuth6(:,:,:,ii) = temp(:,:,:,2);
    advvth6(:,:,:,ii) = temp(:,:,:,3);
    clear temp
    
    charbsa = [strb,'diag_S_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbsa,'rec',1:3);
    advrsa6(:,:,:,ii) = temp(:,:,:,1);
    advusa6(:,:,:,ii) = temp(:,:,:,2);
    advvsa6(:,:,:,ii) = temp(:,:,:,3);
    clear temp
    
    charbc = [strb,'diag_dic_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbc,'rec',1:3);
    advrdic6(:,:,:,ii) = temp(:,:,:,1);
    advudic6(:,:,:,ii) = temp(:,:,:,2);
    advvdic6(:,:,:,ii) = temp(:,:,:,3);
    clear temp
end

for ii=1:384
    for jj=1:260
        if hFacC(ii,jj,1)==0
            tflux6(ii,jj,:) = NaN;
            sflux6(ii,jj,:) = NaN;
            cflux6(ii,jj,:) = NaN;
            oflux6(ii,jj,:) = NaN;
        end
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                theta6(ii,jj,kk,:) = NaN;
                salt6(ii,jj,kk,:) = NaN;
                dic6(ii,jj,kk,:) = NaN;
                oxy6(ii,jj,kk,:) = NaN;
                wvel6(ii,jj,kk,:) = NaN;
                advrth6(ii,jj,kk,:) = NaN;
                advrsa6(ii,jj,kk,:) = NaN;
                advrdic6(ii,jj,kk,:) = NaN;
            end
            if hFacW(ii,jj,kk)==0
                uvel6(ii,jj,kk,:) = NaN;
                advuth6(ii,jj,kk,:) = NaN;
                advusa6(ii,jj,kk,:) = NaN;
                advudic6(ii,jj,kk,:) = NaN;
            end
            if hFacS(ii,jj,kk)==0
                vvel6(ii,jj,kk,:) = NaN;
                advvth6(ii,jj,kk,:) = NaN;
                advvsa6(ii,jj,kk,:) = NaN;
                advvdic6(ii,jj,kk,:) = NaN;
            end
        end
    end
end

clear ii jj kk str* hFac* temp char*

save monthly6

clear


XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
XG12 = rdmds('../MITgcm/verification/SO12_20190513/run/XG');
YG12 = rdmds('../MITgcm/verification/SO12_20190513/run/YG');
RC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
RF12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RF'));
hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO12_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO12_20190513/run/hFacS');
str = '../MITgcm/verification/SO12_20190513/old_diag/';
strb = '../MITgcm/verification/SO12_20190513/old_diag_budgets/';

%% 

wvel12 = zeros(756,512,52,12);
theta12 = wvel12;
salt12 = wvel12;
uvel12 = wvel12;
vvel12 = wvel12;
dic12 = wvel12;
oxy12 = wvel12;
advrth12 = wvel12;
advuth12 = wvel12;
advvth12 = wvel12;
advrsa12 = wvel12;
advusa12 = wvel12;
advvsa12 = wvel12;
advrdic12 = wvel12;
advudic12 = wvel12;
advvdic12 = wvel12;
tflux12 = zeros(756,512,12);
sflux12 = tflux12;
cflux12 = tflux12;
oflux12 = tflux12;


for ii=1:12
    charstate = [str,'diag_state.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1:5);
    theta12(:,:,:,ii) = temp(:,:,1:2:104,1);
    salt12(:,:,:,ii) = temp(:,:,1:2:104,2);
    uvel12(:,:,:,ii) = temp(:,:,1:2:104,3);
    vvel12(:,:,:,ii) = temp(:,:,1:2:104,4);
    wvel12(:,:,:,ii) = temp(:,:,1:2:104,5);
    clear temp
    
    charbio = [str,'diag_bgc.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charbio,'rec',[1,3]);
    dic12(:,:,:,ii) = temp(:,:,1:2:104,1);
    oxy12(:,:,:,ii) = temp(:,:,1:2:104,2);
    clear temp
    
    charas = [str,'diag_airsea.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charas,'rec',1:4);
    tflux12(:,:,ii) = temp(:,:,1);
    sflux12(:,:,ii) = temp(:,:,2);
    cflux12(:,:,ii) = temp(:,:,3);
    oflux12(:,:,ii) = temp(:,:,4);
    clear temp
    
    charbth = [strb,'diag_T_budget.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charbth,'rec',1:3);
    advrth12(:,:,:,ii) = temp(:,:,1:2:104,1);
    advuth12(:,:,:,ii) = temp(:,:,1:2:104,2);
    advvth12(:,:,:,ii) = temp(:,:,1:2:104,3);
    clear temp
    
    charbsa = [strb,'diag_S_budget.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charbsa,'rec',1:3);
    advrsa12(:,:,:,ii) = temp(:,:,1:2:104,1);
    advusa12(:,:,:,ii) = temp(:,:,1:2:104,2);
    advvsa12(:,:,:,ii) = temp(:,:,1:2:104,3);
    clear temp
    
    charbc = [strb,'diag_dic_budget.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charbc,'rec',1:3);
    advrdic12(:,:,:,ii) = temp(:,:,1:2:104,1);
    advudic12(:,:,:,ii) = temp(:,:,1:2:104,2);
    advvdic12(:,:,:,ii) = temp(:,:,1:2:104,3);
    clear temp
end

for ii=1:756
    for jj=1:512
        if hFacC(ii,jj,1)==0
            tflux12(ii,jj,:) = NaN;
            sflux12(ii,jj,:) = NaN;
            cflux12(ii,jj,:) = NaN;
            oflux12(ii,jj,:) = NaN;
        end
        for kk=1:52
            if hFacC(ii,jj,2*kk-1)==0
                theta12(ii,jj,kk,:) = NaN;
                salt12(ii,jj,kk,:) = NaN;
                dic12(ii,jj,kk,:) = NaN;
                oxy12(ii,jj,kk,:) = NaN;
                wvel12(ii,jj,kk,:) = NaN;
                advrth12(ii,jj,kk,:) = NaN;
                advrsa12(ii,jj,kk,:) = NaN;
                advrdic12(ii,jj,kk,:) = NaN;
            end
            if hFacW(ii,jj,2*kk-1)==0
                uvel12(ii,jj,kk,:) = NaN;
                advuth12(ii,jj,kk,:) = NaN;
                advusa12(ii,jj,kk,:) = NaN;
                advudic12(ii,jj,kk,:) = NaN;
            end
            if hFacS(ii,jj,2*kk-1)==0
                vvel12(ii,jj,kk,:) = NaN;
                advvth12(ii,jj,kk,:) = NaN;
                advvsa12(ii,jj,kk,:) = NaN;
                advvdic12(ii,jj,kk,:) = NaN;
            end
        end
    end
end

RC12 = RC12(1:2:104);
RF12 = RF12(1:2:104);

clear ii jj kk str* hFac* temp char*

save monthly12

clear

toc()