clear
close all
clc
tic()

load XY3
nn = 192;
mm = 132;
Depth3 = zeros(nn,mm);

for ii=1:nn
    for jj=1:mm
        Depth3(ii,jj) = sum(squeeze(hFacC3(ii,jj,:)).*DRF3);
    end
end
clear nn mm ii jj
save XY3
clear

load XY6
nn = 384;
mm = 260;
Depth6 = zeros(nn,mm);

for ii=1:nn
    for jj=1:mm
        Depth6(ii,jj) = sum(squeeze(hFacC6(ii,jj,:)).*DRF6);
    end
end
clear nn mm ii jj
save XY6
clear

load XY12
nn = 756;
mm = 512;
Depth12 = zeros(nn,mm);

for ii=1:nn
    for jj=1:mm
        Depth12(ii,jj) = sum(squeeze(hFacC12(ii,jj,:)).*DRF12);
    end
end
clear nn mm ii jj
save XY12
clear


toc()