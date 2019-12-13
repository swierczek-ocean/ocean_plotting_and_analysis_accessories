clear
close all
clc
tic()

hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO12_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO12_20190513/run/hFacS');
str = '../MITgcm/verification/SO12_20190513/diag/';

%% prelim
nt = 12;
nn = 756;
mm = 512;

%% T,S,U,V,DIC,O2,NO3

uvel12_2017 = zeros(nn,mm,nt);
vvel12_2017 = zeros(nn,mm,nt);
speed12_2017 = zeros(nn,mm,nt);

theta12_2017 = zeros(nn,mm,nt);
salt12_2017 = zeros(nn,mm,nt);

dic12_2017 = zeros(nn,mm,nt);
o212_2017 = zeros(nn,mm,nt);
no312_2017 = zeros(nn,mm,nt);

for t=2:13
    
    charstate = [str,'diag_state.',num2str(10950*t,'%010.f')];
    vel = rdmds(charstate,'rec',3:5);
    uvel12_2017(:,:,t-1) = vel(:,:,1,1);
    vvel12_2017(:,:,t-1) = vel(:,:,1,2);
    speed12_2017(:,:,t-1) = sqrt(uvel12_2017(:,:,t-1).^2 + uvel12_2017(:,:,t-1).^2);
    clear vel
    theta = rdmds(charstate,'rec',1);
    theta12_2017(:,:,t-1) = theta(:,:,1);
    salt = rdmds(charstate,'rec',2);
    salt12_2017(:,:,t-1) = salt(:,:,1);
    clear theta salt
    charbgc = [str,'diag_bgc.',num2str(10950*t,'%010.f')];
    dic = rdmds(charbgc,'rec',1);
    dic12_2017(:,:,t-1) = dic(:,:,1);
    o2 = rdmds(charbgc,'rec',3);
    o212_2017(:,:,t-1) = o2(:,:,1);
    no3 = rdmds(charbgc,'rec',4);
    no312_2017(:,:,t-1) = no3(:,:,1);
    
end % for t

uvel12_2017 = mean(uvel12_2017,3);
vvel12_2017 = mean(vvel12_2017,3);
speed12_2017 = mean(speed12_2017,3);

theta12_2017 = mean(theta12_2017,3);
salt12_2017 = mean(salt12_2017,3);

dic12_2017 = mean(dic12_2017,3);
o212_2017 = mean(o212_2017,3);
no312_2017 = mean(no312_2017,3);
%% end

for ii=1:nn
    for jj=1:mm
        if hFacC(ii,jj,1)==0
            theta12_2017(ii,jj) = NaN;
            salt12_2017(ii,jj) = NaN;
            dic12_2017(ii,jj) = NaN;
            o212_2017(ii,jj) = NaN;
            no312_2017(ii,jj) = NaN;
            speed12_2017(ii,jj) = NaN;
        end
        if hFacW(ii,jj,1)==0
            uvel12_2017(ii,jj) = NaN;
        end
        if hFacS(ii,jj,1)==0
            vvel12_2017(ii,jj) = NaN;
        end
    end
end

clear ii jj nn mm str hFa* nt t
save 12_surf_avgs

clear







toc()