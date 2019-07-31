clear
close all
clc

tic()

load XY3
load XY6
load XY12

clearvars -except XC* YC*

acc_settings

lat_a = -42.4932;
lon_a = 360 - 42.8917;

lat_b = -42.4947;
lon_b = 360 - 42.1371;

ind_3_left_a = find(XC3>lon_a,1)-1;
ind_3_right_a = find(XC3>lon_a,1);

ind_3_left_b = find(XC3>lon_b,1)-1;
ind_3_right_b = find(XC3>lon_b,1);

ind_3_up_a = find(YC3>lat_a,1);
ind_3_down_a = find(YC3>lat_a,1)-1;

ind_3_up_b = find(YC3>lat_b,1);
ind_3_down_b = find(YC3>lat_b,1)-1;

ind_6_left_a = find(XC6>lon_a,1)-1;
ind_6_right_a = find(XC6>lon_a,1);

ind_6_left_b = find(XC6>lon_b,1)-1;
ind_6_right_b = find(XC6>lon_b,1);

ind_6_up_a = find(YC6>lat_a,1);
ind_6_down_a = find(YC6>lat_a,1)-1;

ind_6_up_b = find(YC6>lat_b,1);
ind_6_down_b = find(YC6>lat_b,1)-1;

ind_12_left_a = find(XC12>lon_a,1)-1;
ind_12_right_a = find(XC12>lon_a,1);

ind_12_left_b = find(XC12>lon_b,1)-1;
ind_12_right_b = find(XC12>lon_b,1);

ind_12_up_a = find(YC12>lat_a,1);
ind_12_down_a = find(YC12>lat_a,1)-1;

ind_12_up_b = find(YC12>lat_b,1);
ind_12_down_b = find(YC12>lat_b,1)-1;





toc()