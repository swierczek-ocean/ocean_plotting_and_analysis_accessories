clear
close all
clc

tic()

A = unifrnd(-10,10,100000,1);

A = rmoutliers(A,'percentile',[1 99]);

% A = sort(A);
% len = length(A);
% ind1 = ceil(len*0.01);
% 
% A = A(ind1:(len-ind1));

toc()




