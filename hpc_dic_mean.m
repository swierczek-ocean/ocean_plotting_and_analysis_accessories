clear
close all
clc
tic()


%% 1/3

hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
RC3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC'));
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';

%% prelim

dic3ts = zeros(192,132,52,365);

for ii=1:365
    charbgc = [strs,'diag_bgc.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic3ts(:,:,:,ii) = temp;
    clear temp
end

dic3 = mean(dic3ts,4);
dic3sd = std(dic3ts,0,4);

clear dic3ts

for ii=1:192
    for jj=1:132
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                dic3(ii,jj,kk) = NaN;
                dic3sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save dic3 dic3 dic3sd XC3 YC3 RC3

clear dic3*

%% end 1/3

%% 1/6
hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim

dic6ts = zeros(384,260,52,365);

for ii=1:365
    charbgc = [strs,'diag_bgc.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic6ts(:,:,:,ii) = temp;
    clear temp
end

dic6 = mean(dic6ts,4);
dic6sd = std(dic6ts,0,4);

clear dic6ts

for ii=1:384
    for jj=1:260
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                dic6(ii,jj,kk) = NaN;
                dic6sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save dic6 dic6 dic6sd XC6 YC6 RC6

clear dic6*

%% end 1/6


%% 1/12
hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

dic12ts = zeros(756,512,52,365);

for ii=1:365
    charbgc = [strs,'diag_bgc.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12ts(:,:,:,ii) = temp(:,:,1:2:103);
    clear temp
end

dic12 = mean(dic12ts,4);
dic12sd = std(dic12ts,0,4);

clear dic12ts

for ii=1:756
    for jj=1:512
        for kk=1:52
            if hFacC(ii,jj,(2*kk-1))==0
                dic12(ii,jj,kk) = NaN;
                dic12sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save dic12 dic12 dic12sd XC12 YC12 RC12

clear dic12*

%% end 1/12


clear






toc()