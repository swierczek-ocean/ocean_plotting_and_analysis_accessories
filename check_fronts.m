clear
close all
clc
tic()
lw = 3.5;
load FRONTS
load mask
mask = permute(mask,[2,1,3]);

SACCF_X = SACCF_X(200:700);
SACCF_Y = SACCF_Y(200:700);


contourf(XCm-360,YCm,mask(:,:,1),'LineStyle','none') %,'LevelList',z)
hold on
contour(XCm-360,YCm,mask(:,:,1),'Color','k','LineWidth',lw-1)
line(SACCF_X,SACCF_Y,'Color','k','LineWidth',lw);
toc()