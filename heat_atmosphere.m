clear
close all
clc
tic()

x12 = .01e15; % J/s
x12 = x12*60*60*24; % J/day

x6 = 0.027e15;
x6 = x6*60*60*24;

x3 = 0.032e15;
x3 = x3*60*60*24;

y = 5.95e21; % J to heat atm by 1 deg

z12 = y/x12;  % num of days to heat atm by 1 deg at x rate
z6 = y/x6;
z3 = y/x3;

z3/365

z6/365

z12/365

toc()