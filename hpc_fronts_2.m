clear
close all
clc
tic()

XC = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
str = '../MITgcm/verification/SO3_20190513/diag/';

%% prelim

theta = zeros(192,132,12);
salt = zeros(192,132,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,ii) = mean(temp(:,:,12:13),3);
    temp = rdmds(charstate,'rec',2);
    salt(:,:,ii) = mean(temp(:,:,12:13),3);
end

theta = mean(theta,3);
salt = mean(salt,3);

stf310 = zeros(192,132);
stf311 = zeros(192,132);
stf312 = zeros(192,132);
stf31s = zeros(192,132);
stf32s = zeros(192,132);

stf310(theta>10) = 1;
stf311(theta>11) = 1;
stf312(theta>12) = 1;
stf31s(salt>34.6) = 1;
stf32s(salt>35) = 1;


XC = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
str = '../MITgcm/verification/SO6_20190513/diag/';

%% prelim

theta = zeros(384,260,12);
salt = zeros(384,260,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,ii) = mean(temp(:,:,12:13),3);
    temp = rdmds(charstate,'rec',2);
    salt(:,:,ii) = mean(temp(:,:,12:13),3);
end

theta = mean(theta,3);
salt = mean(salt,3);

stf610 = zeros(384,260);
stf611 = zeros(384,260);
stf612 = zeros(384,260);
stf61s = zeros(384,260);
stf62s = zeros(384,260);

stf610(theta>10) = 1;
stf611(theta>11) = 1;
stf612(theta>12) = 1;
stf61s(salt>34.6) = 1;
stf62s(salt>35) = 1;


XC = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
str = '../MITgcm/verification/SO12_20190513/diag/';

%% prelim

theta = zeros(756,512,12);
salt = zeros(756,512,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,ii) = mean(temp(:,:,24:25),3);
    temp = rdmds(charstate,'rec',2);
    salt(:,:,ii) = mean(temp(:,:,24:25),3);
end

theta = mean(theta,3);
salt = mean(salt,3);

stf1210 = zeros(756,512);
stf1211 = zeros(756,512);
stf1212 = zeros(756,512);
stf121s = zeros(756,512);
stf122s = zeros(756,512);

stf1210(theta>10) = 1;
stf1211(theta>11) = 1;
stf1212(theta>12) = 1;
stf121s(salt>34.6) = 1;
stf122s(salt>35) = 1;


save subtropABC2 stf*

toc()