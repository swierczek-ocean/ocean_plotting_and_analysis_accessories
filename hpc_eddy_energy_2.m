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

wdic3ts = zeros(192,132,52,365);

for ii=1:365
    charbgc = [strs,'diag_bgc.',num2str(48*(ii+31),'%010.f')];
    charstate = [strs,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp2 = rdmds(charstate,'rec',5);
    temp3 = rdmds(charbgc,'rec',1);
    wdic3ts(:,:,:,ii) = temp3.*temp2;
    clear temp*
end

wdic3 = mean(wdic3ts,4);

clear wdic3ts

for ii=1:192
    for jj=1:132
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                wdic3(ii,jj,kk) = NaN;
            end
        end
    end
end

save eddyc3 wdic3 XC3 YC3 RC3

clear wdic3*

%% end 1/3

%% 1/6
hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim

wdic6ts = zeros(384,260,52,365);

for ii=1:365
    charbgc = [strs,'diag_bgc.',num2str(72*(ii+31),'%010.f')];
    charstate = [strs,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp2 = rdmds(charstate,'rec',5);
    temp3 = rdmds(charbgc,'rec',1);
    wdic6ts(:,:,:,ii) = temp3.*temp2;
    clear temp*
end

wdic6 = mean(wdic6ts,4);

clear wdic6ts

for ii=1:384
    for jj=1:260
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                wdic6(ii,jj,kk) = NaN;
            end
        end
    end
end

save eddyc6 wdic6 XC6 YC6 RC6

clear wdic6*

%% end 1/6


%% 1/12
hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

wdic12ts = zeros(756,512,52,365);

for ii=1:365
    charbgc = [strs,'diag_bgc.',num2str(360*(ii+31),'%010.f')];
    charstate = [strs,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp2 = rdmds(charstate,'rec',5);
    temp3 = rdmds(charbgc,'rec',1);
    wdic12ts(:,:,:,ii) = temp3(:,:,1:2:103).*temp2(:,:,1:2:103);
    clear temp*
end

wdic12 = mean(wdic12ts,4);

clear wdic12ts

for ii=1:756
    for jj=1:512
        for kk=1:52
            if hFacC(ii,jj,(2*kk-1))==0
                wdic12(ii,jj,kk) = NaN;
            end
        end
    end
end

save eddyc12 wdic12 XC12 YC12 RC12

clear wdic12*

%% end 1/12


clear






toc()