clear
close all
clc
tic()

load Depth_52_104

load OOI_Sampling/THETA_OOI_32 *ooip*
load OOI_Sampling/THETA_OOI_62 *ooip*
load OOI_Sampling/THETA_OOI_122 *ooip*

load OOI_Sampling/SALT_OOI_32 *ooip*
load OOI_Sampling/SALT_OOI_62 *ooip*
load OOI_Sampling/SALT_OOI_122 *ooip*

load OOI_Sampling/UVEL_OOI_32 *ooip*
load OOI_Sampling/UVEL_OOI_62 *ooip*
load OOI_Sampling/UVEL_OOI_122 *ooip*

load OOI_Sampling/VVEL_OOI_32 *ooip*
load OOI_Sampling/VVEL_OOI_62 *ooip*
load OOI_Sampling/VVEL_OOI_122 *ooip*

numdate = datenum('12012016','mmddyyyy');
option = 1;
lw = 3.3;
ms = 20;
cb = 85;
c3 = 86;
c6 = 87;
c12 = 88;
t_coords = [-2 17 -5200 0];
s_coords = [34 35 -5200 0];
u_coords = [-0.7 0.7 -5200 0];
v_coords = [-0.7 0.7 -5200 0];
%%

min(min(vvel_ooip_32(1:50,1:(end-1))))
min(min(vvel_ooip_62(1:50,1:(end-1))))
min(min(vvel_ooip_122(1:100,1:(end-1))))

max(max(vvel_ooip_32(1:50,1:(end-1))))
max(max(vvel_ooip_62(1:50,1:(end-1))))
max(max(vvel_ooip_122(1:100,1:(end-1))))








toc()

