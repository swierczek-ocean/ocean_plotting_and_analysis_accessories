clear
close all
clc
tic()


%% 1/3

hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
RF3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RF'));
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';

%% prelim

wvel3ts = zeros(192,132,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel3ts(:,:,:,ii) = temp;
    clear temp
end

wvel3 = mean(wvel3ts,4);
wvel3sd = std(wvel3ts,0,4);

clear wvel3ts

for ii=1:192
    for jj=1:132
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                wvel3(ii,jj,kk) = NaN;
                wvel3sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save wvel3 wvel3 wvel3sd XC3 YC3 RF3

clear wvel3*

%% end 1/3

%% 1/6
hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RF6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RF'));
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim

wvel6ts = zeros(384,260,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel6ts(:,:,:,ii) = temp;
    clear temp
end

wvel6 = mean(wvel6ts,4);
wvel6sd = std(wvel6ts,0,4);

clear wvel6ts

for ii=1:384
    for jj=1:260
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                wvel6(ii,jj,kk) = NaN;
                wvel6sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save wvel6 wvel6 wvel6sd XC6 YC6 RF6

clear wvel6*

%% end 1/6


%% 1/12
hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RF12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RF'));
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

wvel12ts = zeros(756,512,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel12ts(:,:,:,ii) = temp(:,:,1:2:103);
    clear temp
end

wvel12 = mean(wvel12ts,4);
wvel12sd = std(wvel12ts,0,4);

clear wvel12ts

for ii=1:756
    for jj=1:512
        for kk=1:52
            if hFacC(ii,jj,(2*kk-1))==0
                wvel12(ii,jj,kk) = NaN;
                wvel12sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save wvel12 wvel12 wvel12sd XC12 YC12 RF12

clear wvel12*

%% end 1/12


clear






toc()