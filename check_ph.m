clear
close all
clc
tic()

hFacC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
str3 = '../MITgcm/verification/SO3_20190513/diag/';

hFacC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
str6 = '../MITgcm/verification/SO6_20190513/diag/';

hFacC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
str12 = '../MITgcm/verification/SO12_20190513/diag/';
%% prelim

ph_3_surf = zeros(192,132,12);
ph_3_105m = zeros(192,132,12);
ph_6_surf = zeros(384,260,12);
ph_6_105m = zeros(384,260,12);
ph_12_surf = zeros(756,512,12);
ph_12_105m = zeros(756,512,12);

for ii=1:12
    charstate = [str3,'diag_bgc.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',11);
    
    ph_3_surf(:,:,ii) = temp(:,:,1);
    ph_3_105m(:,:,ii) = temp(:,:,13);
    
    charstate = [str6,'diag_bgc.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',11);
    
    ph_6_surf(:,:,ii) = temp(:,:,1);
    ph_6_105m(:,:,ii) = temp(:,:,13);
    
    charstate = [str12,'diag_bgc.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',11);
    
    ph_12_surf(:,:,ii) = temp(:,:,1);
    ph_12_105m(:,:,ii) = temp(:,:,26);
    
end % for t

ph_3_surf = mean(ph_3_surf,3);
ph_6_surf = mean(ph_6_surf,3);
ph_12_surf = mean(ph_12_surf,3);
ph_3_105m = mean(ph_3_105m,3);
ph_6_105m = mean(ph_6_105m,3);
ph_12_105m = mean(ph_12_105m,3);

for ii=1:192
    for jj=1:132
        if (hFacC3(ii,jj,1)==0)
            ph_3_surf(ii,jj) = NaN;
        end
        if (hFacC3(ii,jj,13)==0)
            ph_3_105m(ii,jj) = NaN;
        end
    end
end

for ii=1:384
    for jj=1:260
        if (hFacC6(ii,jj,1)==0)
            ph_6_surf(ii,jj) = NaN;
        end
        if (hFacC6(ii,jj,13)==0)
            ph_6_105m(ii,jj) = NaN;
        end
    end
end

for ii=1:756
    for jj=1:512
        if (hFacC12(ii,jj,1)==0)
            ph_12_surf(ii,jj) = NaN;
        end
        if (hFacC12(ii,jj,26)==0)
            ph_12_105m(ii,jj) = NaN;
        end
    end
end

save ph_avg ph*




toc()