clear
close all
clc
tic()

load Depth_52_104

load OOI_Sampling/DIC_OOI_32 *ooip*
load OOI_Sampling/DIC_OOI_62 *ooip*
load OOI_Sampling/DIC_OOI_122 *ooip*

load OOI_Sampling/NO3_OOI_32 *ooip*
load OOI_Sampling/NO3_OOI_62 *ooip*
load OOI_Sampling/NO3_OOI_122 *ooip*

load OOI_Sampling/O2_OOI_32 *ooip*
load OOI_Sampling/O2_OOI_62 *ooip*
load OOI_Sampling/O2_OOI_122 *ooip*

% load OOI_Sampling/PHYTO_OOI_32 *ooip*
% load OOI_Sampling/PHYTO_OOI_62 *ooip*
% load OOI_Sampling/PHYTO_OOI_122 *ooip*

load OOI_Sampling/ALK_OOI_32 *ooip*
load OOI_Sampling/ALK_OOI_62 *ooip*
load OOI_Sampling/ALK_OOI_122 *ooip*

load OOI_Sampling/PH_OOI_32 *ooip*
load OOI_Sampling/PH_OOI_62 *ooip*
load OOI_Sampling/PH_OOI_122 *ooip*

numdate = datenum('12012016','mmddyyyy');
option = 1;
lw = 3.3;
ms = 20;
cb = 85;
c3 = 86;
c6 = 87;
c12 = 88;
c_coords = [2.1 2.35 -5200 0];
n_coords = [0.0055 0.0335 -5200 0];
o_coords = [0.198 0.301 -5200 0];
p_coords = [-0.7 0.7 -5200 0];
a_coords = [2.33 2.43 -5200 0];
ph_coords = [7.78 8.08 -5200 0];
%%

min(min(o2_ooip_32(1:50,1:(end-1))))
min(min(o2_ooip_62(1:50,1:(end-1))))
min(min(o2_ooip_122(1:100,1:(end-1))))

max(max(o2_ooip_32(1:50,1:(end-1))))
max(max(o2_ooip_62(1:50,1:(end-1))))
max(max(o2_ooip_122(1:100,1:(end-1))))








toc()

