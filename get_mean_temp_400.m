clear
close all
clc
tic()

hFacC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
strs3 = '../MITgcm/verification/SO3_20190513/diag/';

hFacC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
strs6 = '../MITgcm/verification/SO6_20190513/diag/';

hFacC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
strs12 = '../MITgcm/verification/SO12_20190513/diag/';

Theta_400m_TS_3 = zeros(192,132,28);
Theta_400m_TS_6 = zeros(384,260,28);
Theta_400m_TS_12 = zeros(756,512,55);

for ii=1:12
    charstate = [strs3,'diag_state.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    temp = temp(:,:,1:28);
    Theta_400m_TS_3 = Theta_400m_TS_3 + temp;
    clear temp
    
    charstate = [strs6,'diag_state.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    temp = temp(:,:,1:28);
    Theta_400m_TS_6 = Theta_400m_TS_6 + temp;
    clear temp
    
    charstate = [strs12,'diag_state.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    temp = temp(:,:,1:55);
    Theta_400m_TS_12 = Theta_400m_TS_12 + temp;
    clear temp
end

Theta_400m_TS_3 = Theta_400m_TS_3./12;
Theta_400m_TS_6 = Theta_400m_TS_6./12;

Theta_400m_TS_3(:,:,27) = (Theta_400m_TS_3(:,:,27) + ...
    Theta_400m_TS_3(:,:,28))./2;
Theta_400m_TS_6(:,:,27) = (Theta_400m_TS_6(:,:,27) + ...
    Theta_400m_TS_6(:,:,28))./2;
Theta_400m_TS_12 = Theta_400m_TS_12./12;

PF_3 = zeros(192,132);
PF_6 = zeros(384,260);
PF_12 = zeros(756,512);

SAF_3 = zeros(192,132);
SAF_6 = zeros(384,260);
SAF_12 = zeros(756,512);

for ii=1:756
    for jj=1:512
        temp = Theta_400m_TS_12(ii,jj,1:39);
        if min(temp)<2
            PF_12(ii,jj) = 1;
        end
        if Theta_400m_TS_12(ii,jj,55)<4
            SAF_12(ii,jj) = 1;
        end
        if hFacC12(ii,jj,1)==0
            SAF_12(ii,jj) = NaN;
            PF_12(ii,jj) = NaN;
        end
        clear temp
    end
end
clear Theta_400m_TS_12

for ii=1:384
    for jj=1:260
        temp = squeeze(Theta_400m_TS_6(ii,jj,1:20));
        temp = [temp(1:18);(temp(19)+temp(20))./2];
        if min(temp)<2
            PF_6(ii,jj) = 1;
        end
        if Theta_400m_TS_6(ii,jj,28)<4
            SAF_6(ii,jj) = 1;
        end
        if hFacC6(ii,jj,1)==0
            SAF_6(ii,jj) = NaN;
            PF_6(ii,jj) = NaN;
        end
        clear temp
    end
end
clear Theta_400m_TS_6

for ii=1:192
    for jj=1:132
        temp = squeeze(Theta_400m_TS_3(ii,jj,1:20));
        temp = [temp(1:18);(temp(19)+temp(20))./2];
        if min(temp)<2
            PF_3(ii,jj) = 1;
        end
        if Theta_400m_TS_3(ii,jj,28)<4
            SAF_3(ii,jj) = 1;
        end
        if hFacC3(ii,jj,1)==0
            SAF_3(ii,jj) = NaN;
            PF_3(ii,jj) = NaN;
        end
        clear temp
    end
end
clear Theta_400m_TS_3


save fronts_mitgcm PF_* SAF_*




toc()