clear
close all
clc
tic()


%% 1/3

hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
RC3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC'));
strs = '../MITgcm/verification/SO3_20190513/diag/';

%% prelim

ph3 = zeros(192,132,12);

for ii=1:12
    charbgc = [strs,'diag_bgc.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',11);
    ph3(:,:,ii) = temp(:,:,1);
    clear temp
end

ph3 = mean(ph3,3);

for ii=1:192
    for jj=1:132
        if hFacC(ii,jj,1)==0
            ph3(ii,jj) = NaN;
        end
        
    end
end

save ph3 ph3 XC3 YC3

clear ph3*

%% end 1/3

%% 1/6
hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
strs = '../MITgcm/verification/SO6_20190513/diag/';

%% prelim

ph6 = zeros(384,260,12);

for ii=1:12
    charbgc = [strs,'diag_bgc.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',11);
    ph6(:,:,ii) = temp(:,:,1);
    clear temp
end

ph6 = mean(ph6,3);


for ii=1:384
    for jj=1:260
        if hFacC(ii,jj,1)==0
            ph6(ii,jj) = NaN;
        end
    end
end

save ph6 ph6 XC6 YC6

clear ph6*

%% end 1/6


%% 1/12
hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
strs = '../MITgcm/verification/SO12_20190513/diag/';

%% prelim

ph12 = zeros(756,512,12);

for ii=1:12
    charbgc = [strs,'diag_bgc.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',11);
    ph12(:,:,ii) = temp(:,:,1);
    clear temp
end

ph12 = mean(ph12,3);

clear ph12ts

for ii=1:756
    for jj=1:512
        if hFacC(ii,jj,1)==0
            ph12(ii,jj) = NaN;
        end
        
    end
end

save ph12 ph12 XC12 YC12

clear ph12*

%% end 1/12


clear






toc()