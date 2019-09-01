clear
close all 
clc
tic()

acc_settings

load XY3
load XY6
load XY12

clearvars -except hFacC*

ooi_mask3 = zeros(size(hFacC3));
ooi_mask6 = zeros(size(hFacC6));
ooi_mask12 = zeros(size(hFacC12));

% ooi_mask3(87,86,27) = 1;
% ooi_mask3(87,86,33) = 1;
% ooi_mask3(87,86,34) = 1;
% ooi_mask3(87,86,36) = 1;
% ooi_mask3(87,86,39) = 1;
% ooi_mask3(87,86,40) = 1;
% ooi_mask3(89,86,27) = 1;
% ooi_mask3(89,86,33) = 1;
% ooi_mask3(89,86,34) = 1;
% ooi_mask3(89,86,36) = 1;
% ooi_mask3(89,86,39) = 1;
% ooi_mask3(89,86,40) = 1;
% 
% ooi_mask6(173,168,27) = 1;
% ooi_mask6(173,168,33) = 1;
% ooi_mask6(173,168,34) = 1;
% ooi_mask6(173,168,36) = 1;
% ooi_mask6(173,168,39) = 1;
% ooi_mask6(173,168,40) = 1;
% ooi_mask6(178,168,27) = 1;
% ooi_mask6(178,168,33) = 1;
% ooi_mask6(178,168,34) = 1;
% ooi_mask6(178,168,36) = 1;
% ooi_mask6(178,168,39) = 1;
% ooi_mask6(178,168,40) = 1;
% 
% ooi_mask12(342,334,53) = 1;
% ooi_mask12(342,334,54) = 1;
% ooi_mask12(342,334,67) = 1;
% ooi_mask12(342,334,71) = 1;
% ooi_mask12(342,334,72) = 1;
% ooi_mask12(342,334,78) = 1;
% ooi_mask12(342,334,79) = 1;
% ooi_mask12(351,334,53) = 1;
% ooi_mask12(351,334,54) = 1;
% ooi_mask12(351,334,67) = 1;
% ooi_mask12(351,334,71) = 1;
% ooi_mask12(351,334,72) = 1;
% ooi_mask12(351,334,78) = 1;
% ooi_mask12(351,334,79) = 1;

ooi_mask3(87,86,:) = 1;
ooi_mask3(89,86,:) = 2;
ooi_mask3(88,84,:) = 3;

ooi_mask6(173,168,:) = 1;
ooi_mask6(178,168,:) = 2;
ooi_mask6(175,164,:) = 3;

ooi_mask12(342,334,:) = 1;
ooi_mask12(351,334,:) = 2;
ooi_mask12(346,326,:) = 3;

fid = fopen('ooi_mask3.bin','w','b');
fwrite(fid,ooi_mask3,'single');
fclose(fid);

fid = fopen('ooi_mask6.bin','w','b');
fwrite(fid,ooi_mask6,'single');
fclose(fid);

fid = fopen('ooi_mask12.bin','w','b');
fwrite(fid,ooi_mask12,'single');
fclose(fid);











toc()