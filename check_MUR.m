clear
close all
clc
tic()

strm = 'MUR-JPL-L4-GLOB-v4.1_Jan.nc';

ncdisp(strm)


A = zeros(10,10,10000);
B = randi(6990,10000,1);
C = randi(3990,10000,1);
D = randi(31,10000,1);

for ii=1:10000
    A(:,:,ii) = ncread(strm,'analysed_sst',[B(ii),C(ii),D(ii)],[10,10,1]);
end

E = zeros(10000,1);

for jj=1:10000
    temp = A(:,:,jj);
    temp = temp(isnan(temp)==0);
    E(jj) = std(temp);    
end

mean(E(isnan(E)==0))

histogram(E,50)







toc()