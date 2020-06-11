clear
close all
clc
tic()

load ODA

strs = 'ocean.196101-201912.u.nc';

ncdisp(strs)

oda_uvel = ncread(strs,'u',[205,17,1,673],[71,41,50,12]);
clear strs
oda_uvel(oda_uvel<-1000) = NaN;


save ODA

clear


toc()