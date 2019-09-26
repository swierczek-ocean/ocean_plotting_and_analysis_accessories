clear
close all
clc
tic()

%% 1/12
load XY12 XC12 YC12 XG12 YG12
XC = rdmds('Model_Grids/XC_12');
XG = rdmds('Model_Grids/XG_12');
YC = rdmds('Model_Grids/YC_12');
YG = rdmds('Model_Grids/YG_12');
XC = XC(:,1);
XG = XG(:,1);
YC = YC(1,:);
YG = YG(1,:);
fprintf('the 1/12 MITgcm lon C grid on HPC starts at %g and ends at %g \n',...
    XC(1),XC(end))
fprintf('the 1/12 MATLAB lon C grid on PC starts at %g and ends at %g \n',...
    XC12(1),XC12(end))
fprintf('the 1/12 MITgcm lon G grid on HPC starts at %g and ends at %g \n',...
    XG(1),XG(end))
fprintf('the 1/12 MATLAB lon G grid on PC starts at %g and ends at %g \n',...
    XG12(1),XG12(end))
fprintf('the 1/12 MITgcm lat C grid on HPC starts at %g and ends at %g \n',...
    YC(1),YC(end))
fprintf('the 1/12 MATLAB lat C grid on PC starts at %g and ends at %g \n',...
    YC12(1),YC12(end))
fprintf('the 1/12 MITgcm lat G grid on HPC starts at %g and ends at %g \n',...
    YG(1),YG(end))
fprintf('the 1/12 MATLAB lat G grid on PC starts at %g and ends at %g \n \n',...
    YG12(1),YG12(end))
%% end 1/12


%% 1/6
load XY6 XC6 YC6 XG6 YG6
XC = rdmds('Model_Grids/XC_6');
XG = rdmds('Model_Grids/XG_6');
YC = rdmds('Model_Grids/YC_6');
YG = rdmds('Model_Grids/YG_6');
XC = XC(:,1);
XG = XG(:,1);
YC = YC(1,:);
YG = YG(1,:);
fprintf('the 1/6 MITgcm lon C grid on HPC starts at %g and ends at %g \n',...
    XC(1),XC(end))
fprintf('the 1/6 MATLAB lon C grid on PC starts at %g and ends at %g \n',...
    XC6(1),XC6(end))
fprintf('the 1/6 MITgcm lon G grid on HPC starts at %g and ends at %g \n',...
    XG(1),XG(end))
fprintf('the 1/6 MATLAB lon G grid on PC starts at %g and ends at %g \n',...
    XG6(1),XG6(end))
fprintf('the 1/6 MITgcm lat C grid on HPC starts at %g and ends at %g \n',...
    YC(1),YC(end))
fprintf('the 1/6 MATLAB lat C grid on PC starts at %g and ends at %g \n',...
    YC6(1),YC6(end))
fprintf('the 1/6 MITgcm lat G grid on HPC starts at %g and ends at %g \n',...
    YG(1),YG(end))
fprintf('the 1/6 MATLAB lat G grid on PC starts at %g and ends at %g \n \n',...
    YG6(1),YG6(end))
%% end 1/6

%% 1/3
load XY3 XC3 YC3 XG3 YG3
XC = rdmds('Model_Grids/XC_3');
XG = rdmds('Model_Grids/XG_3');
YC = rdmds('Model_Grids/YC_3');
YG = rdmds('Model_Grids/YG_3');
XC = XC(:,1);
XG = XG(:,1);
YC = YC(1,:);
YG = YG(1,:);
fprintf('the 1/3 MITgcm lon C grid on HPC starts at %g and ends at %g \n',...
    XC(1),XC(end))
fprintf('the 1/3 MATLAB lon C grid on PC starts at %g and ends at %g \n',...
    XC3(1),XC3(end))
fprintf('the 1/3 MITgcm lon G grid on HPC starts at %g and ends at %g \n',...
    XG(1),XG(end))
fprintf('the 1/3 MATLAB lon G grid on PC starts at %g and ends at %g \n',...
    XG3(1),XG3(end))
fprintf('the 1/3 MITgcm lat C grid on HPC starts at %g and ends at %g \n',...
    YC(1),YC(end))
fprintf('the 1/3 MATLAB lat C grid on PC starts at %g and ends at %g \n',...
    YC3(1),YC3(end))
fprintf('the 1/3 MITgcm lat G grid on HPC starts at %g and ends at %g \n',...
    YG(1),YG(end))
fprintf('the 1/3 MATLAB lat G grid on PC starts at %g and ends at %g \n',...
    YG3(1),YG3(end))
%% end 1/3

% %% 1/12
% load XY12 DXC DYC DXG DYG
% DXC_m = rdmds('Model_Grids/DXC_12');
% DXG_m = rdmds('Model_Grids/DXG_12');
% DYC_m = rdmds('Model_Grids/DYC_12');
% DYG_m = rdmds('Model_Grids/DYG_12');
% fprintf('the 1/12 MITgcm lon C grid on HPC starts at %g and ends at %g \n',...
%     DXC_m(1),DXC_m(end))
% fprintf('the 1/12 MATLAB lon C grid on PC starts at %g and ends at %g \n',...
%     DXC(1),DXC(end))
% fprintf('the 1/12 MITgcm lon G grid on HPC starts at %g and ends at %g \n',...
%     DXG_m(1),DXG_m(end))
% fprintf('the 1/12 MATLAB lon G grid on PC starts at %g and ends at %g \n',...
%     DXG(1),DXG(end))
% fprintf('the 1/12 MITgcm lat C grid on HPC starts at %g and ends at %g \n',...
%     DYC_m(1),DYC_m(end))
% fprintf('the 1/12 MATLAB lat C grid on PC starts at %g and ends at %g \n',...
%     DYC(1),DYC(end))
% fprintf('the 1/12 MITgcm lat G grid on HPC starts at %g and ends at %g \n',...
%     DYG_m(1),DYG_m(end))
% fprintf('the 1/12 MATLAB lat G grid on PC starts at %g and ends at %g \n \n',...
%     DYG(1),DYG(end))
% %% end 1/12
% 
% 
% %% 1/6
% load XY6 DXC DYC DXG DYG
% DXC_m = rdmds('Model_Grids/DXC_6');
% DXG_m = rdmds('Model_Grids/DXG_6');
% DYC_m = rdmds('Model_Grids/DYC_6');
% DYG_m = rdmds('Model_Grids/DYG_6');
% fprintf('the 1/6 MITgcm lon C grid on HPC starts at %g and ends at %g \n',...
%     DXC_m(1),DXC_m(end))
% fprintf('the 1/6 MATLAB lon C grid on PC starts at %g and ends at %g \n',...
%     DXC(1),DXC(end))
% fprintf('the 1/6 MITgcm lon G grid on HPC starts at %g and ends at %g \n',...
%     DXG_m(1),DXG_m(end))
% fprintf('the 1/6 MATLAB lon G grid on PC starts at %g and ends at %g \n',...
%     DXG(1),DXG(end))
% fprintf('the 1/6 MITgcm lat C grid on HPC starts at %g and ends at %g \n',...
%     DYC_m(1),DYC_m(end))
% fprintf('the 1/6 MATLAB lat C grid on PC starts at %g and ends at %g \n',...
%     DYC(1),DYC(end))
% fprintf('the 1/6 MITgcm lat G grid on HPC starts at %g and ends at %g \n',...
%     DYG_m(1),DYG_m(end))
% fprintf('the 1/6 MATLAB lat G grid on PC starts at %g and ends at %g \n \n',...
%     DYG(1),DYG(end))
% %% end 1/6
% 
% %% 1/3
% load XY3 DXC DYC DXG DYG
% DXC_m = rdmds('Model_Grids/DXC_3');
% DXG_m = rdmds('Model_Grids/DXG_3');
% DYC_m = rdmds('Model_Grids/DYC_3');
% DYG_m = rdmds('Model_Grids/DYG_3');
% fprintf('the 1/3 MITgcm lon C grid on HPC starts at %g and ends at %g \n',...
%     DXC_m(1),DXC_m(end))
% fprintf('the 1/3 MATLAB lon C grid on PC starts at %g and ends at %g \n',...
%     DXC(1),DXC(end))
% fprintf('the 1/3 MITgcm lon G grid on HPC starts at %g and ends at %g \n',...
%     DXG_m(1),DXG_m(end))
% fprintf('the 1/3 MATLAB lon G grid on PC starts at %g and ends at %g \n',...
%     DXG(1),DXG(end))
% fprintf('the 1/3 MITgcm lat C grid on HPC starts at %g and ends at %g \n',...
%     DYC_m(1),DYC_m(end))
% fprintf('the 1/3 MATLAB lat C grid on PC starts at %g and ends at %g \n',...
%     DYC(1),DYC(end))
% fprintf('the 1/3 MITgcm lat G grid on HPC starts at %g and ends at %g \n',...
%     DYG_m(1),DYG_m(end))
% fprintf('the 1/3 MATLAB lat G grid on PC starts at %g and ends at %g \n',...
%     DYG(1),DYG(end))
% %% end 1/3

toc()