
%% 122

PCO2_Series122 = zeros(756,512,365);
HC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag/';

for ii=32:396
    char122surf = [str,'diag_surf.',num2str(360*ii,'%010.f')];
    temp122surf = rdmds(char122surf); 
    PCO2_Series122(:,:,ii-31) = temp122surf(:,:,2); 
    clear temp122surf
end

for jj=1:756
    for kk=1:512
        if HC12(jj,kk,1)==0
            PCO2_Series122(jj,kk,:) = NaN;
        end        
    end
end

%% 62

PCO2_Series62 = zeros(384,260,365);

HC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag/';

for ii=32:396
    char62surf = [str,'diag_surf.',num2str(72*ii,'%010.f')];
    temp62surf = rdmds(char62surf); 
    PCO2_Series62(:,:,ii-31) = temp62surf(:,:,2); 
    clear temp62surf
end

for jj=1:384
    for kk=1:260
        if HC6(jj,kk,1)==0
            PCO2_Series62(jj,kk,:) = NaN;
        end        
    end
end

%% 32

PCO2_Series32 = zeros(192,132,365);

HC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
depth32 = 1;
str = '../MITgcm/verification/SO3_20190513/diag/';

for ii=32:396
    char32surf = [str,'diag_surf.',num2str(48*ii,'%010.f')];
    temp32surf = rdmds(char32surf); 
    PCO2_Series32(:,:,ii-31) = temp32surf(:,:,2); 
    clear temp32surf
end

for jj=1:192
    for kk=1:132
        if HC3(jj,kk,1)==0
            PCO2_Series32(jj,kk,:) = NaN;
        end        
    end
end

PCO2_12_01_JAN = mean(PCO2_Series122(:,:,1:31),3);
PCO2_6_01_JAN = mean(PCO2_Series62(:,:,1:31),3);
PCO2_3_01_JAN = mean(PCO2_Series32(:,:,1:31),3);

PCO2_12_02_FEB = mean(PCO2_Series122(:,:,32:59),3);
PCO2_6_02_FEB = mean(PCO2_Series62(:,:,32:59),3);
PCO2_3_02_FEB = mean(PCO2_Series32(:,:,32:59),3);

PCO2_12_03_MAR = mean(PCO2_Series122(:,:,60:90),3);
PCO2_6_03_MAR = mean(PCO2_Series62(:,:,60:90),3);
PCO2_3_03_MAR = mean(PCO2_Series32(:,:,60:90),3);

PCO2_12_04_APR = mean(PCO2_Series122(:,:,91:120),3);
PCO2_6_04_APR = mean(PCO2_Series62(:,:,91:120),3);
PCO2_3_04_APR = mean(PCO2_Series32(:,:,91:120),3);

PCO2_12_05_MAY = mean(PCO2_Series122(:,:,121:151),3);
PCO2_6_05_MAY = mean(PCO2_Series62(:,:,121:151),3);
PCO2_3_05_MAY = mean(PCO2_Series32(:,:,121:151),3);

PCO2_12_06_JUN = mean(PCO2_Series122(:,:,152:181),3);
PCO2_6_06_JUN = mean(PCO2_Series62(:,:,152:181),3);
PCO2_3_06_JUN = mean(PCO2_Series32(:,:,152:181),3);

PCO2_12_07_JUL = mean(PCO2_Series122(:,:,182:212),3);
PCO2_6_07_JUL = mean(PCO2_Series62(:,:,182:212),3);
PCO2_3_07_JUL = mean(PCO2_Series32(:,:,182:212),3);

PCO2_12_08_AUG = mean(PCO2_Series122(:,:,213:243),3);
PCO2_6_08_AUG = mean(PCO2_Series62(:,:,213:243),3);
PCO2_3_08_AUG = mean(PCO2_Series32(:,:,213:243),3);

PCO2_12_09_SEP = mean(PCO2_Series122(:,:,244:273),3);
PCO2_6_09_SEP = mean(PCO2_Series62(:,:,244:273),3);
PCO2_3_09_SEP = mean(PCO2_Series32(:,:,244:273),3);

PCO2_12_10_OCT = mean(PCO2_Series122(:,:,274:304),3);
PCO2_6_10_OCT = mean(PCO2_Series62(:,:,274:304),3);
PCO2_3_10_OCT = mean(PCO2_Series32(:,:,274:304),3);

PCO2_12_11_NOV = mean(PCO2_Series122(:,:,305:334),3);
PCO2_6_11_NOV = mean(PCO2_Series62(:,:,305:334),3);
PCO2_3_11_NOV = mean(PCO2_Series32(:,:,305:334),3);

PCO2_12_12_DEC = mean(PCO2_Series122(:,:,335:365),3);
PCO2_6_12_DEC = mean(PCO2_Series62(:,:,335:365),3);
PCO2_3_12_DEC = mean(PCO2_Series32(:,:,335:365),3);


clear PCO2_Series*
clearvars -except PCO2*

save PCO2_monthly

