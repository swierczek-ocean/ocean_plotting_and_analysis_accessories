clear
close all
clc
tic()

load SST_TS
load MURd

XC3 = rdmds('../Grids/3/XC');
YC3 = rdmds('../Grids/3/YC');

XC6 = rdmds('../Grids/6/XC');
YC6 = rdmds('../Grids/6/YC');

XC12 = rdmds('../Grids/12/XC');
YC12 = rdmds('../Grids/12/YC');

murday(isnan(murday)==1) = 0;
SST_TS_3(isnan(SST_TS_3)==1) = 0;
SST_TS_6(isnan(SST_TS_6)==1) = 0;
SST_TS_12(isnan(SST_TS_12)==1) = 0;

murlon = murlon(50:660);
murlat = murlat(63:340)';

murday = murday(50:660,63:340,:);

SST3 = zeros(611,278,365);
SST6 = SST3;
SST12 = SST3;

[XX,YY] = ndgrid(murlon,murlat');

for ii=1:365
    F = griddedInterpolant(XC3,YC3,SST_TS_3(:,:,ii),'linear');
    temp = F(XX,YY);
    SST3(:,:,ii) = temp - murday(:,:,ii);
    
    F = griddedInterpolant(XC6,YC6,SST_TS_6(:,:,ii),'linear');
    temp = F(XX,YY);
    SST6(:,:,ii) = temp - murday(:,:,ii);
    
    F = griddedInterpolant(XC12,YC12,SST_TS_12(:,:,ii),'linear');
    temp = F(XX,YY);
    SST12(:,:,ii) = temp - murday(:,:,ii);    
end

temp = SST3(SST3~=0);
a = mean(temp);
b = std(temp,0);

fprintf('1/3 mean misfit: %g   stdev msift: %g \n',a,b)

temp = SST6(SST6~=0);
a = mean(temp);
b = std(temp,0);

fprintf('1/6 mean misfit: %g   stdev msift: %g \n',a,b)

temp = SST12(SST12~=0);
a = mean(temp);
b = std(temp,0);

fprintf('1/12 mean misfit: %g   stdev msift: %g \n',a,b)




toc()