clear
close all
clc
tic()

str = '../MITgcm/verification/SO3_20190513/diag/';

uvel3 = zeros(192,132,12);
vvel3 = zeros(192,132,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',3);
    uvel3(:,:,ii) = temp(:,:,1);
    temp = rdmds(charstate,'rec',4);
    vvel3(:,:,ii) = temp(:,:,1);
end

uvel3 = mean(uvel3,3);
vvel3 = mean(vvel3,3);


str = '../MITgcm/verification/SO12_20190513/diag/';

uvel12 = zeros(756,512,12);
vvel12 = zeros(756,512,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',3);
    uvel12(:,:,ii) = temp(:,:,1);
    temp = rdmds(charstate,'rec',4);
    vvel12(:,:,ii) = temp(:,:,1);
end

uvel12 = mean(uvel12,3);
vvel12 = mean(vvel12,3);




save Current uvel* vvel*


