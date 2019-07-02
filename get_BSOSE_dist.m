% clear
% close all
% clc
% tic()
% 
% acc_settings
% 
% load BSOSE_surf_avgs
close all
A = ALK_BSOSE_JAS_avg;
A = A(A<10000);

figure()
set(gcf, 'Position', [1, 1, 1600, 750])
histogram(A,100)
% acc_plots_prof_contourf







% toc()