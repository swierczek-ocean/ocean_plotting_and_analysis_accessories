clear
close all
clc
tic()

hFacC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
strs3 = '../MITgcm/verification/SO3_20190513/diag_slice/';
hFacC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
strs6 = '../MITgcm/verification/SO6_20190513/diag_slice/';
hFacC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
strs12 = '../MITgcm/verification/SO12_20190513/diag_slice/';

SST_TS_3 = zeros(192,132,365);
SST_TS_6 = zeros(384,260,365);
SST_TS_12 = zeros(756,512,365);

for ii=1:365
    charstate = [strs3,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    SST_TS_3(:,:,ii) = temp(:,:,1);
    
    charstate = [strs6,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    SST_TS_6(:,:,ii) = temp(:,:,1);
    
    charstate = [strs12,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    SST_TS_12(:,:,ii) = temp(:,:,1);
end

for ii=1:192
    for jj=1:132
        if (hFacC3(ii,jj,1)==0)
            SST_TS_3(ii,jj) = NaN;
        end
    end
end

for ii=1:384
    for jj=1:260
        if (hFacC6(ii,jj,1)==0)
            SST_TS_6(ii,jj) = NaN;
        end
    end
end

for ii=1:756
    for jj=1:512
        if (hFacC12(ii,jj,1)==0)
            SST_TS_12(ii,jj) = NaN;
        end
    end
end

SST_mean_3 = mean(SST_TS_3,3);
SST_std_3 = std(SST_TS_3,0,3);
SST_mean_6 = mean(SST_TS_6,3);
SST_std_6 = std(SST_TS_6,0,3);
SST_mean_12 = mean(SST_TS_12,3);
SST_std_12 = std(SST_TS_12,0,3);

save SST_mean_std SST_mean* SST_std*

save SST_TS SST_TS*



toc()