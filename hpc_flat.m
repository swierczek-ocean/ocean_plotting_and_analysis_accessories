clear
close all
clc
tic()

XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';

%% prelim


wvel3 = zeros(192,132,396);
theta3 = zeros(192,132,396);
salt3 = zeros(192,132,396);
dic3 = zeros(192,132,396);
do3 = zeros(192,132,396);
wtheta3 = zeros(192,132);
wsalt3 = zeros(192,132);
wdic3 = zeros(192,132);
wdo3 = zeros(192,132);
wctheta3 = zeros(192,132);
wcsalt3 = zeros(192,132);
wcdic3 = zeros(192,132);
wcdo3 = zeros(192,132);
etheta3 = zeros(192,132);
esalt3 = zeros(192,132);
edic3 = zeros(192,132);
edo3 = zeros(192,132);
mwtheta3 = zeros(192,132);
mwsalt3 = zeros(192,132);
mwdic3 = zeros(192,132);
mwdo3 = zeros(192,132);


for jj=1:396
    fprintf('1/3 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(48*jj,'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel3(:,:,jj) = temp(:,:,20);
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta3(:,:,jj) = temp(:,:,20);
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt3(:,:,jj) = temp(:,:,20);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(48*jj,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic3(:,:,jj) = temp(:,:,20);
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do3(:,:,jj) = temp(:,:,20);
    clear temp
end

clear char*

for ii=1:192
    for jj=1:132
        [mwtheta3(ii,jj),etheta3(ii,jj),wtheta3(ii,jj),...
            wctheta3(ii,jj)] = hilo_pass(squeeze(wvel3(ii,jj,:)),...
            squeeze(theta3(ii,jj,:)));
        [mwsalt3(ii,jj),esalt3(ii,jj),wsalt3(ii,jj),...
            wcsalt3(ii,jj)] = hilo_pass(squeeze(wvel3(ii,jj,:)),...
            squeeze(salt3(ii,jj,:)));
        [mwdic3(ii,jj),edic3(ii,jj),wdic3(ii,jj),...
            wcdic3(ii,jj)] = hilo_pass(squeeze(wvel3(ii,jj,:)),...
            squeeze(dic3(ii,jj,:)));
        [mwdo3(ii,jj),edo3(ii,jj),wdo3(ii,jj),...
            wcdo3(ii,jj)] = hilo_pass(squeeze(wvel3(ii,jj,:)),...
            squeeze(do3(ii,jj,:)));
    end
end

wt3 = wvel3.*theta3;
save WT3 wt3 XC3 YC3
clear wvel3 theta3 salt3 dic3 do3 wt3

save eddy_TSCO3_190m *theta3 *salt3 *dic3 *do3 XC3 YC3

clear

XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim

wvel6 = zeros(384,260,396);
theta6 = zeros(384,260,396);
salt6 = zeros(384,260,396);
dic6 = zeros(384,260,396);
do6 = zeros(384,260,396);
wtheta6 = zeros(384,260);
wsalt6 = zeros(384,260);
wdic6 = zeros(384,260);
wdo6 = zeros(384,260);
wctheta6 = zeros(384,260);
wcsalt6 = zeros(384,260);
wcdic6 = zeros(384,260);
wcdo6 = zeros(384,260);
etheta6 = zeros(384,260);
esalt6 = zeros(384,260);
edic6 = zeros(384,260);
edo6 = zeros(384,260);
mwtheta6 = zeros(384,260);
mwsalt6 = zeros(384,260);
mwdic6 = zeros(384,260);
mwdo6 = zeros(384,260);


for jj=1:396
    fprintf('1/6 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(72*jj,'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel6(:,:,jj) = temp(:,:,20);
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta6(:,:,jj) = temp(:,:,20);
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt6(:,:,jj) = temp(:,:,20);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(72*jj,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic6(:,:,jj) = temp(:,:,20);
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do6(:,:,jj) = temp(:,:,20);
    clear temp
end

clear char*

for ii=1:384
    for jj=1:260
        [mwtheta6(ii,jj),etheta6(ii,jj),wtheta6(ii,jj),...
            wctheta6(ii,jj)] = hilo_pass(squeeze(wvel6(ii,jj,:)),...
            squeeze(theta6(ii,jj,:)));
        [mwsalt6(ii,jj),esalt6(ii,jj),wsalt6(ii,jj),...
            wcsalt6(ii,jj)] = hilo_pass(squeeze(wvel6(ii,jj,:)),...
            squeeze(salt6(ii,jj,:)));
        [mwdic6(ii,jj),edic6(ii,jj),wdic6(ii,jj),...
            wcdic6(ii,jj)] = hilo_pass(squeeze(wvel6(ii,jj,:)),...
            squeeze(dic6(ii,jj,:)));
        [mwdo6(ii,jj),edo6(ii,jj),wdo6(ii,jj),...
            wcdo6(ii,jj)] = hilo_pass(squeeze(wvel6(ii,jj,:)),...
            squeeze(do6(ii,jj,:)));
    end
end

wt6 = wvel6.*theta6;
save WT6 wt6 XC6 YC6
clear wvel6 theta6 salt6 dic6 do6 wt6


save eddy_TSCO6_190m *theta6 *salt6 *dic6 *do6 XC6 YC6

clear


XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

wvel12 = single(zeros(756,512,396));
theta12 = single(zeros(756,512,396));
salt12 = single(zeros(756,512,396));
dic12 = single(zeros(756,512,396));
do12 = single(zeros(756,512,396));
wtheta12 = single(zeros(756,512));
wsalt12 = single(zeros(756,512));
wdic12 = single(zeros(756,512));
wdo12 = single(zeros(756,512));
wctheta12 = single(zeros(756,512));
wcsalt12 = single(zeros(756,512));
wcdic12 = single(zeros(756,512));
wcdo12 = single(zeros(756,512));
etheta12 = single(zeros(756,512));
esalt12 = single(zeros(756,512));
edic12 = single(zeros(756,512));
edo12 = single(zeros(756,512));
mwtheta12 = single(zeros(756,512));
mwsalt12 = single(zeros(756,512));
mwdic12 = single(zeros(756,512));
mwdo12 = single(zeros(756,512));


for jj=1:396
    fprintf('1/6 model daily fields iter %g of 396 \n',jj)
    charstate = [strs,'diag_state.',num2str(360*jj,'%010.f')];
    temp = rdmds(charstate,'rec',5);
    temp_wvel = single(temp(:,:,39));
    wvel12(:,:,jj) = single(temp(:,:,39));
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta12(:,:,jj) = single(temp(:,:,39));
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt12(:,:,jj) = single(temp(:,:,39));
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(360*jj,'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12(:,:,jj) = single(temp(:,:,39));
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do12(:,:,jj) = single(temp(:,:,39));
    clear temp
end

clear char*

for ii=1:756
    for jj=1:512
            [mwtheta12(ii,jj),etheta12(ii,jj),wtheta12(ii,jj),...
                wctheta12(ii,jj)] = hilo_pass(squeeze(wvel12(ii,jj,:)),...
                squeeze(theta12(ii,jj,:)));
            [mwsalt12(ii,jj),esalt12(ii,jj),wsalt12(ii,jj),...
                wcsalt12(ii,jj)] = hilo_pass(squeeze(wvel12(ii,jj,:)),...
                squeeze(salt12(ii,jj,:)));
            [mwdic12(ii,jj),edic12(ii,jj),wdic12(ii,jj),...
                wcdic12(ii,jj)] = hilo_pass(squeeze(wvel12(ii,jj,:)),...
                squeeze(dic12(ii,jj,:)));
            [mwdo12(ii,jj),edo12(ii,jj),wdo12(ii,jj),...
                wcdo12(ii,jj)] = hilo_pass(squeeze(wvel12(ii,jj,:)),...
                squeeze(do12(ii,jj,:)));
    end
end

wt12 = wvel12.*theta12;
save WT12 wt12 XC12 YC12
clear wvel12 theta12 salt12 dic12 do12 wt12

save eddy_TSCO12_190m *theta12 *salt12 *dic12 *do12 XC12 YC12

clear

toc()