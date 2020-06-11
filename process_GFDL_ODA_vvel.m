clear
close all
clc
tic()

load ODA

strs = 'ocean.196101-201912.v.nc';

ncdisp(strs)

oda_vvel = ncread(strs,'v',[205,17,1,673],[71,41,50,12]);
clear strs
oda_vvel(oda_vvel<-1000) = NaN;


save ODA

clear


toc()