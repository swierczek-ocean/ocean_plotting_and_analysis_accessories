clear
close all
clc
tic()

fid = fopen('fe_surfflux_so6_interp_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,132,12]);
fclose(fid);







toc()