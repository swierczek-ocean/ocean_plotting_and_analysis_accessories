clear
close all
clc

tic()

%% 1/12

XC = rdmds('Model_Grids/XC_12');
XG = rdmds('Model_Grids/XG_12');
DXC = rdmds('Model_Grids/DXC_12');
DXG = rdmds('Model_Grids/DXG_12');
XC = XC(:,1);
XG = XG(:,1);
DXC = DXC(:,1);
DXG = DXG(:,1);

YC = rdmds('Model_Grids/YC_12');
YG = rdmds('Model_Grids/YG_12');
DYC = rdmds('Model_Grids/DYC_12');
DYG = rdmds('Model_Grids/DYG_12');
YC = YC(1,:);
YG = YG(1,:);
DYC = DYC(1,:);
DYG = DYG(1,:);




toc()