clear
close all
clc
tic()

hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO3_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO3_20190513/run/hFacS');
str = '../MITgcm/verification/SO3_20190513/diag/';

%% prelim
nt = 12;
nn = 192;
mm = 132;

%% T,S,U,V,DIC,O2,NO3

uvel3_2017 = zeros(nn,mm,nt);
vvel3_2017 = zeros(nn,mm,nt);
speed3_2017 = zeros(nn,mm,nt);

theta3_2017 = zeros(nn,mm,nt);
salt3_2017 = zeros(nn,mm,nt);

dic3_2017 = zeros(nn,mm,nt);
o23_2017 = zeros(nn,mm,nt);
no33_2017 = zeros(nn,mm,nt);

for t=2:13
    
    charstate = [str,'diag_state.',num2str(1460*t,'%010.f')];
    vel = rdmds(charstate,'rec',3:5);
    uvel3_2017(:,:,t-1) = vel(:,:,1,1);
    vvel3_2017(:,:,t-1) = vel(:,:,1,2);
    speed3_2017(:,:,t-1) = sqrt(uvel3_2017(:,:,t-1).^2 + uvel3_2017(:,:,t-1).^2);
    clear vel
    theta = rdmds(charstate,'rec',1);
    theta3_2017(:,:,t-1) = theta(:,:,1);
    salt = rdmds(charstate,'rec',2);
    salt3_2017(:,:,t-1) = salt(:,:,1);
    clear theta salt
    charbgc = [str,'diag_bgc.',num2str(1460*t,'%010.f')];
    dic = rdmds(charbgc,'rec',1);
    dic3_2017(:,:,t-1) = dic(:,:,1);
    o2 = rdmds(charbgc,'rec',3);
    o23_2017(:,:,t-1) = o2(:,:,1);
    no3 = rdmds(charbgc,'rec',4);
    no33_2017(:,:,t-1) = no3(:,:,1);
    
end % for t

uvel3_2017 = mean(uvel3_2017,3);
vvel3_2017 = mean(vvel3_2017,3);
speed3_2017 = mean(speed3_2017,3);

theta3_2017 = mean(theta3_2017,3);
salt3_2017 = mean(salt3_2017,3);

dic3_2017 = mean(dic3_2017,3);
o23_2017 = mean(o23_2017,3);
no33_2017 = mean(no33_2017,3);
%% end

for ii=1:nn
    for jj=1:mm
        if hFacC(ii,jj,1)==0
            theta3_2017(ii,jj) = NaN;
            salt3_2017(ii,jj) = NaN;
            dic3_2017(ii,jj) = NaN;
            o23_2017(ii,jj) = NaN;
            no33_2017(ii,jj) = NaN;
            speed3_2017(ii,jj) = NaN;
        end
        if hFacW(ii,jj,1)==0
            uvel3_2017(ii,jj) = NaN;
        end
        if hFacS(ii,jj,1)==0
            vvel3_2017(ii,jj) = NaN;
        end
    end
end

clear ii jj nn mm str hFa* nt t
save 3_surf_avgs

clear







toc()