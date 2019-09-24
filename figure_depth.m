clear
close all
clc
tic()

load XY12 DRF12
RC12 = squeeze(rdmds('RC12'));

DG12 = cumsum(DRF12);






toc()