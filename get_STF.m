clear
close all
clc
tic()

load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12

load ../2019_06_June_analysis/AB32_output THETA_32_JD_avg SALT_32_JD_avg
load ../2019_06_June_analysis/AB62_output THETA_62_JD_avg SALT_62_JD_avg
load ../2019_06_June_analysis/AB122_output THETA_122_JD_avg SALT_122_JD_avg

theta_3 = THETA_32_JD_avg;
salt_3 = SALT_32_JD_avg;
theta_6 = THETA_62_JD_avg;
salt_6 = SALT_62_JD_avg;
theta_12 = THETA_122_JD_avg;
salt_12 = SALT_122_JD_avg;

clear THETA* SALT*

dif_theta_3ud = diff(theta_3,2,1);
dif_salt_3ud = diff(salt_3,2,1);
dif_theta_6ud = diff(theta_6,2,1);
dif_salt_6ud = diff(salt_6,2,1);
dif_theta_12ud = diff(theta_12,2,1);
dif_salt_12ud = diff(salt_12,2,1);

dif_theta_3rl = diff(theta_3,1,2);
dif_salt_3rl = diff(salt_3,1,2);
dif_theta_6rl = diff(theta_6,1,2);
dif_salt_6rl = diff(salt_6,1,2);
dif_theta_12rl = diff(theta_12,1,2);
dif_salt_12rl = diff(salt_12,1,2);


z = -1:1:22;

% surf(dif_theta_3ud')
contourf(theta_12','LevelList',z)







toc()