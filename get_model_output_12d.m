clear
close all
clc

strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

wvel_12 = zeros(756,512,52,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel_12(:,:,:,ii) = temp(:,:,1:2:104);
    clear temp
end

clear temp char* str*

nccreate('AB12_output.nc','wvel_12','Dimensions',...
    {'lon',756,'lat',512,'z',52,'time_days',365},'Datatype','single')
ncwrite('AB12_output.nc','wvel_12',wvel_12)
ncwriteatt('AB12_output.nc','wvel_12','units','m/s');
ncwriteatt('AB12_output.nc','wvel_12','description','vertical velocity');


clear
