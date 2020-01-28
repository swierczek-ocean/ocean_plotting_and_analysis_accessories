clear
close all
clc
tic()


fid = fopen('PHYTO_SM_AB3_IC_20161128.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,132,52]);
fclose(fid);
U = permute(U,[2,1,3]);


contourf(U(:,:,1))







toc()