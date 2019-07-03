% clear
% close all
% clc
% tic()
% 
% acc_settings
% 
% load BSOSE_surf_avgs
close all
A = CFLUX_BSOSE_DJF_avg;
A = A(A<1000000);

figure()
set(gcf, 'Position', [1, 1, 1600, 750])
histogram(A,100)
% acc_plots_prof_contourf







% toc()