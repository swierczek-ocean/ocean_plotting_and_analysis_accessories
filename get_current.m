clear
close all
clc
tic()


load XY3 XC3 YC3
load XY12 XC12 YC12
load Current
j = 2;
X = XC12(1:j:end);
Y = YC12(1:j:end);
U = uvel12(1:j:end,1:j:end);
V = vvel12(1:j:end,1:j:end);

Z = zeros(size(U));
[X,Y] = ndgrid(X,Y);
% [XC3,YC3] = ndgrid(XC3,YC3);
% [XC12,YC12] = ndgrid(XC12,YC12);
% 
% zed1 = zeros(192,132);
% zed2 = zeros(756,512);

% quiver3(XC3,YC3,zed1,uvel3,vvel3,zed1)

quiver3(X,Y,Z,U,V,Z)


toc()