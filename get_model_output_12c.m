clear
close all
clc

strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

dic_12 = zeros(756,512,52,365);


for ii=1:365
    charbgc = [strs,'diag_bgc.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic_12(:,:,:,ii) = temp(:,:,1:2:104);
    clear temp
end

clear temp char* str*

nccreate('AB12_output.nc','dic_12','Dimensions',...
    {'lon',756,'lat',512,'z',52,'time_days',365},'Datatype','single')
ncwrite('AB12_output.nc','dic_12',dic_12)
ncwriteatt('AB12_output.nc','dic_12','units','mol C/m^3');
ncwriteatt('AB12_output.nc','dic_12','description','dissolved inorganic carbon');



clear
