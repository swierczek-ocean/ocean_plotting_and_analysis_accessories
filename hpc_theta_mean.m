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

theta3ts = zeros(192,132,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta3ts(:,:,:,ii) = temp;
    clear temp
end

theta3 = mean(theta3ts,4);
theta3sd = std(theta3ts,0,4);

clear theta3ts

for ii=1:192
    for jj=1:132
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                theta3(ii,jj,kk) = NaN;
                theta3sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save theta3 theta3 XC3 YC3 RC3 theta3sd

clear theta3*

%% end 1/3

%% 1/6
hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim

theta6ts = zeros(384,260,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta6ts(:,:,:,ii) = temp;
    clear temp
end

theta6 = mean(theta6ts,4);
theta6sd = std(theta6ts,0,4);

clear theta6ts

for ii=1:384
    for jj=1:260
        for kk=1:52
            if hFacC(ii,jj,kk)==0
                theta6(ii,jj,kk) = NaN;
                theta6sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save theta6 theta6 XC6 YC6 RC6 theta6sd

clear theta6*

%% end 1/6


%% 1/12
hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

theta12ts = zeros(756,512,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta12ts(:,:,:,ii) = temp(:,:,1:2:103);
    clear temp
end

theta12 = mean(theta12ts,4);
theta12sd = std(theta12ts,0,4);

clear theta12ts

for ii=1:756
    for jj=1:512
        for kk=1:52
            if hFacC(ii,jj,(2*kk-1))==0
                theta12(ii,jj,kk) = NaN;
                theta12sd(ii,jj,kk) = NaN;
            end
        end
    end
end

save theta12 theta12 XC12 YC12 RC12 theta12sd

clear theta12*

%% end 1/12


clear






toc()