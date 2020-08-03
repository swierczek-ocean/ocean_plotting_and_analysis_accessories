clear
close all
clc
tic()

load SSH
load AB_AVISO_adj

D_AVISO(isnan(D_AVISO)==1) = 0;
etan12(etan12==-10) = 0;
etan6(etan6==-10) = 0;
etan3(etan3==-10) = 0;

SSH3 = zeros(254,121,365);
SSH6 = SSH3;
SSH12 = SSH3;

[XX,YY] = ndgrid(X_AVISO,Y_AVISO');

for ii=32:396
    F = griddedInterpolant(XC3,YC3,etan3(:,:,ii),'linear');
    temp = F(XX,YY);
    % temp = temp - mean(temp,[1,2]);
    SSH3(:,:,ii-31) = temp - D_AVISO(:,:,ii);
    
    F = griddedInterpolant(XC6,YC6,etan6(:,:,ii),'linear');
    temp = F(XX,YY);
    % temp = temp - mean(temp,[1,2]);
    SSH6(:,:,ii-31) = temp - D_AVISO(:,:,ii);
    
    F = griddedInterpolant(XC12,YC12,etan12(:,:,ii),'linear');
    temp = F(XX,YY);
    % temp = temp - mean(temp,[1,2]);
    SSH12(:,:,ii-31) = temp - D_AVISO(:,:,ii);    
end

temp = SSH3(SSH3~=0);
a = mean(temp);
b = std(temp,0);

fprintf('1/3 mean misfit: %g   stdev msift: %g \n',a,b)

temp = SSH6(SSH6~=0);
a = mean(temp);
b = std(temp,0);

fprintf('1/6 mean misfit: %g   stdev msift: %g \n',a,b)

temp = SSH12(SSH12~=0);
a = mean(temp);
b = std(temp,0);

fprintf('1/12 mean misfit: %g   stdev msift: %g \n',a,b)




toc()