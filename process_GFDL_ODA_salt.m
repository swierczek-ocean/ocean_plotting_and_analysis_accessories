clear
close all
clc
tic()

load ODA

strs = 'ocean.196101-201912.salt.nc';

ncdisp(strs)

oda_salt = ncread(strs,'salt',[206,18,1,673],[70,40,50,12]);
clear strs
oda_salt(oda_salt<-1000) = NaN;


save ODA

clear


toc()