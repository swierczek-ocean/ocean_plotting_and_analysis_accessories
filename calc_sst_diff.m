clear
close all
clc
tic()

%%
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load MURm
load SST_TS

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
[murlon,murlat] = ndgrid(murlon,murlat);

murmonths = zeros(1401,801,16);


md = [0,31,28,31,30,31,30,31,31,30,31,30,31];
cmd = cumsum(md);

SST3diff = zeros(192,132,16);
SST6diff = zeros(384,260,16);
SST12diff = zeros(756,512,16);

for ii=1:12
    SST3diff(:,:,ii) = mean(SST_TS_3(:,:,(cmd(ii)+1):cmd(ii+1)),3);
    SST6diff(:,:,ii) = mean(SST_TS_6(:,:,(cmd(ii)+1):cmd(ii+1)),3);
    SST12diff(:,:,ii) = mean(SST_TS_12(:,:,(cmd(ii)+1):cmd(ii+1)),3);
end

A = [1,2,3;4,5,6;7,8,9;10,11,12];

for ii=1:4
    SST3diff(:,:,ii+12) = mean(SST3diff(:,:,A(ii,:)),3);
    SST6diff(:,:,ii+12) = mean(SST6diff(:,:,A(ii,:)),3);
    SST12diff(:,:,ii+12) = mean(SST12diff(:,:,A(ii,:)),3);
    murmonths(:,:,ii+12) = mean(murmonth(:,:,A(ii,:)),3);
end

murmonths(:,:,1:12) = murmonth;
murmonth = murmonths;

clear murmonths


for ii=1:16
    F = griddedInterpolant(murlon,murlat,murmonth(:,:,ii),'linear');
    U = F(XC3,YC3);
    SST3diff(:,:,ii) = SST3diff(:,:,ii) - U;
    U = F(XC6,YC6);
    SST6diff(:,:,ii) = SST6diff(:,:,ii) - U;
    U = F(XC12,YC12);
    SST12diff(:,:,ii) = SST12diff(:,:,ii) - U;
end

save mur_diffs SST*diff XC* YC* murmonth murlat murlon

clear

load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load MURd
load SST_TS

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
[murlon,murlat] = ndgrid(murlon,murlat);


for ii=1:365
    F = griddedInterpolant(murlon,murlat,murday(:,:,ii),'linear');
    U = F(XC3,YC3);
    SST_TS_3(:,:,ii) = SST_TS_3(:,:,ii) - U;
    U = F(XC6,YC6);
    SST_TS_6(:,:,ii) = SST_TS_6(:,:,ii) - U;
    U = F(XC12,YC12);
    SST_TS_12(:,:,ii) = SST_TS_12(:,:,ii) - U;
end


save MUR_movie_diffs SST_TS* XC* YC* murday murlon murlat

clear







toc()