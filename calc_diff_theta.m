clear
close all
clc
tic()



load VERT_3
load VERT_6
load VERT_12


theta12 = zeros(52,1);
for ii=1:52
    A = (vert_theta_12(2*ii-1,:) + vert_theta_12(2*ii,:))./2;
    theta12(ii) = mean(A);
end

theta6 = mean(vert_theta_6,2);
theta3 = mean(vert_theta_3,2);

[theta12-theta6,theta12-theta3]




toc()