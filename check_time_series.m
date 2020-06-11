clear
close all
clc
tic()

fprintf('what the fuck %g \n',A)

W = 1 + randn(1000,1);
T = 3 + poissrnd(2,1000,1) + randn(1000,1);

WT = W.*T;

wta = mean(WT) - mean(W)*mean(T);
mean(WT)
mean(W)*mean(T)

Wa = W - mean(W);

Ta = T - mean(T);

wtb = mean(Wa.*Ta);

Tc = T + 273;
WTc = W.*Tc;

wtc = mean(WTc) - mean(W)*mean(Tc);
mean(WTc)
mean(W)*mean(Tc)











toc()