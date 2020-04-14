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

wtheta3ts = zeros(192,132,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp1 = rdmds(charstate,'rec',1);
    temp2 = rdmds(charstate,'rec',5);
    wtheta3ts(:,:,:,ii) = temp1.*temp2;
    clear temp*
end

wtheta3 = mean(wtheta3ts,4);
clear wtheta3ts 

for ii=1:192
    for jj=1:132
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                wtheta3(ii,jj,kk) = NaN;
            end
        end
    end
end

save eddyt3 wtheta3  XC3 YC3 RC3

clear wtheta3*

%% end 1/3

%% 1/6
hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim

wtheta6ts = zeros(384,260,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp1 = rdmds(charstate,'rec',1);
    temp2 = rdmds(charstate,'rec',5);
    wtheta6ts(:,:,:,ii) = temp1.*temp2;
    clear temp*
end

wtheta6 = mean(wtheta6ts,4);

clear wtheta6ts

for ii=1:384
    for jj=1:260
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                wtheta6(ii,jj,kk) = NaN;
            end
        end
    end
end

save eddyt6 wtheta6 XC6 YC6 RC6

clear wtheta6*

%% end 1/6


%% 1/12
hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

wtheta12ts = zeros(756,512,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp1 = rdmds(charstate,'rec',1);
    temp2 = rdmds(charstate,'rec',5);
    wtheta12ts(:,:,:,ii) = temp1(:,:,1:2:103).*temp2(:,:,1:2:103);
    clear temp*
end

wtheta12 = mean(wtheta12ts,4);

clear wtheta12ts

for ii=1:756
    for jj=1:512
        for kk=1:52
            if hFacC(ii,jj,(2*kk-1))==0
                wtheta12(ii,jj,kk) = NaN;
            end
        end
    end
end

save eddyt12 wtheta12 XC12 YC12 RC12

clear wtheta12*

%% end 1/12


clear






toc()