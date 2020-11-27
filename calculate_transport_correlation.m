clear
close all
clc
tic()

S3 = [1.029;1.27;.88];
S6 = [1.124;1.39;.962];
S12 = [1.16;1.41;.993];

N3 = [.419;1.49;.351];
N6 = [.393;1.43;.33];
N12 = [.41;1.53;.343];

E3 = [1.447;2.46;1.237];
E6 = [1.517;2.53;1.297];
E12 = [1.57;2.66;1.342];

fprintf('correlation between 1/3 and 1/6 at S boundary is %g \n',corr(S3,S6))
fprintf('correlation between 1/3 and 1/12 at S boundary is %g \n',corr(S3,S12))
fprintf('correlation between 1/6 and 1/12 at S boundary is %g \n \n',corr(S6,S12))

fprintf('correlation between 1/3 and 1/6 at N boundary is %g \n',corr(N3,N6))
fprintf('correlation between 1/3 and 1/12 at N boundary is %g \n',corr(N3,N12))
fprintf('correlation between 1/6 and 1/12 at N boundary is %g \n \n',corr(N6,N12))

fprintf('correlation between 1/3 and 1/6 at E boundary is %g \n',corr(E3,E6))
fprintf('correlation between 1/3 and 1/12 at E boundary is %g \n',corr(E3,E12))
fprintf('correlation between 1/6 and 1/12 at E boundary is %g \n \n',corr(E6,E12))


toc()