clear
close all
clc
tic()

hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO6_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO6_20190513/run/hFacS');
str = '../MITgcm/verification/SO6_20190513/diag/';

%% prelim
nt = 12;
nn = 384;
mm = 260;

%% T,S,U,V,DIC,O2,NO3

uvel6_2017 = zeros(nn,mm,nt);
vvel6_2017 = zeros(nn,mm,nt);
speed6_2017 = zeros(nn,mm,nt);

theta6_2017 = zeros(nn,mm,nt);
salt6_2017 = zeros(nn,mm,nt);

dic6_2017 = zeros(nn,mm,nt);
o26_2017 = zeros(nn,mm,nt);
no36_2017 = zeros(nn,mm,nt);

for t=2:13
    
    charstate = [str,'diag_state.',num2str(2190*t,'%010.f')];
    vel = rdmds(charstate,'rec',3:5);
    uvel6_2017(:,:,t-1) = vel(:,:,1,1);
    vvel6_2017(:,:,t-1) = vel(:,:,1,2);
    speed6_2017(:,:,t-1) = sqrt(uvel6_2017(:,:,t-1).^2 + uvel6_2017(:,:,t-1).^2);
    clear vel
    theta = rdmds(charstate,'rec',1);
    theta6_2017(:,:,t-1) = theta(:,:,1);
    salt = rdmds(charstate,'rec',2);
    salt6_2017(:,:,t-1) = salt(:,:,1);
    clear theta salt
    charbgc = [str,'diag_bgc.',num2str(2190*t,'%010.f')];
    dic = rdmds(charbgc,'rec',1);
    dic6_2017(:,:,t-1) = dic(:,:,1);
    o2 = rdmds(charbgc,'rec',3);
    o26_2017(:,:,t-1) = o2(:,:,1);
    no3 = rdmds(charbgc,'rec',4);
    no36_2017(:,:,t-1) = no3(:,:,1);
    
end % for t

uvel6_2017 = mean(uvel6_2017,3);
vvel6_2017 = mean(vvel6_2017,3);
speed6_2017 = mean(speed6_2017,3);

theta6_2017 = mean(theta6_2017,3);
salt6_2017 = mean(salt6_2017,3);

dic6_2017 = mean(dic6_2017,3);
o26_2017 = mean(o26_2017,3);
no36_2017 = mean(no36_2017,3);
%% end

for ii=1:nn
    for jj=1:mm
        if hFacC(ii,jj,1)==0
            theta6_2017(ii,jj) = NaN;
            salt6_2017(ii,jj) = NaN;
            dic6_2017(ii,jj) = NaN;
            o26_2017(ii,jj) = NaN;
            no36_2017(ii,jj) = NaN;
            speed6_2017(ii,jj) = NaN;
        end
        if hFacW(ii,jj,1)==0
            uvel6_2017(ii,jj) = NaN;
        end
        if hFacS(ii,jj,1)==0
            vvel6_2017(ii,jj) = NaN;
        end
    end
end

clear ii jj nn mm str hFa* nt t
save 6_surf_avgs

clear







toc()