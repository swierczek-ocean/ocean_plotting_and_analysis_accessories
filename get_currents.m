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

current_3 = zeros(192,132,365);
current_6 = zeros(384,260,365);
current_12 = zeros(756,512,365);

for ii=1:365
    charstate = [strs3,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',3:4);
    temp1 = temp(:,:,1,1);
    temp2 = temp(:,:,1,2);
    clear temp
    current_3(:,:,ii) = sqrt(temp1.^2 + temp2.^2);
    clear temp*
    charstate = [strs6,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',3:4);
    temp1 = temp(:,:,1,1);
    temp2 = temp(:,:,1,2);
    clear temp
    current_6(:,:,ii) = sqrt(temp1.^2 + temp2.^2);
    clear temp*
    charstate = [strs12,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',3:4);
    temp1 = temp(:,:,1,1);
    temp2 = temp(:,:,1,2);
    clear temp
    current_12(:,:,ii) = sqrt(temp1.^2 + temp2.^2);
    clear temp*
end

for ii=1:192
    for jj=1:132
        if (hFacC3(ii,jj,1)==0)
            current_3(ii,jj,:) = NaN;
        end
    end
end

for ii=1:384
    for jj=1:260
        if (hFacC6(ii,jj,1)==0)
            current_6(ii,jj,:) = NaN;
        end
    end
end

for ii=1:756
    for jj=1:512
        if (hFacC12(ii,jj,1)==0)
            current_12(ii,jj,:) = NaN;
        end
    end
end

save current current*



toc()