clear
close all
clc
tic()


% fid = fopen('PHYTO_SM_AB3_IC_20161128.bin','r','b');
% U = fread(fid,inf,'single');
% U = reshape(U,[192,132,52]);
% fclose(fid);
% U = permute(U,[2,1,3]);
% 
% 
% contourf(U(:,:,1))

% load grid12

fid = fopen('runoff_Core_cnyf2p0_DJ_so12_ms_V1.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[4320,1260]);
fclose(fid);
U = U';


contourf(U(:,:,1),200,'LineStyle','none')




toc()