clear
close all
clc
tic()

A = zeros(100,1);


parfor ii=1:100
    B = rand(50);
    B = B*B';
    A(ii) = mean(eig(B));    
end




toc()