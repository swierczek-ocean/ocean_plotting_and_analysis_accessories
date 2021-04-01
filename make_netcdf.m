clear
close all
clc
tic()

A = poissrnd(9,192,132,52);
B = randn(192,132,52);

nccreate('arrays.nc','A','Dimensions',{'lon',192,'lat',132,'z',52},'Datatype','single')

nccreate('arrays.nc','B','Dimensions',{'lon',192,'lat',132,'z',52},'Datatype','single')

ncwrite('arrays.nc','A',single(A))

ncwrite('arrays.nc','B',single(B))

ncwriteatt('arrays.nc','A','units','meters');
ncwriteatt('arrays.nc','B','units','degrees C');







toc()