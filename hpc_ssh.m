clear
close all
clc
tic()

XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
strs = '../MITgcm/verification/SO3_20190513/diag/';

%% prelim


etan3 = zeros(192,132,396);


for jj=1:396
    fprintf('1/3 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_surf.',num2str(48*jj,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    etan3(:,:,jj) = temp;
    clear temp
end

clear char*


XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
strs = '../MITgcm/verification/SO6_20190513/diag/';

%% prelim

etan6 = zeros(384,260,396);


for jj=1:396
    fprintf('1/6 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_surf.',num2str(72*jj,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    etan6(:,:,jj) = temp;
    clear temp
end

clear char*


XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
strs = '../MITgcm/verification/SO12_20190513/diag/';

%% prelim

etan12 = single(zeros(756,512,396));

for jj=1:396
    fprintf('1/6 model daily fields iter %g of 396 \n',jj)
    charstate = [strs,'diag_surf.',num2str(360*jj,'%010.f')];
    temp = rdmds(charstate,'rec',1);
    etan12(:,:,jj) = single(temp);
    clear temp
end

clear char*

save SSH etan* XC* YC* 

clear

toc()