clear
close all
clc
tic()

%%
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load SST_TS
load murgrid

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);

numdate = datenum('01012017','mmddyyyy');

strm = 'MUR/MUR-JPL-L4-GLOB-v4.1_';

sstrmse3 = zeros(365,1);
sstrmse6 = zeros(365,1);
sstrmse12 = zeros(365,1);


for ii=1:365
    F = griddedInterpolant(XC3,YC3,SST_TS_3(:,:,ii),'linear');
    sst3 = F(murlon,murlat);
    str1 = [strm,datestr(numdate,'mmm'),'.nc'];
    dd = str2double(datestr(numdate,'dd'));
    temp = ncread(str1,'analysed_sst',[502,1002,dd],[5500,2125,1]);
    murtemp = temp(1:4:end,1:4:end) - 273.15;
    clear temp
    sst3 = sst3 - murtemp;
    clear murtemp
    sst3 = sst3.*sqrt(murarea./totalmurarea);
%     sst3 = sst3.*murmask;
%     sst3 = sst3(isnan(sst3)==0);
    sst3(isnan(sst3)==1) = 0;
    sstrmse3(ii) = sqrt(sum(sum(sst3.^2)));%./sqrt(murcount);
    clear sst3
    
    F = griddedInterpolant(XC6,YC6,SST_TS_6(:,:,ii),'linear');
    sst6 = F(murlon,murlat);
    str1 = [strm,datestr(numdate,'mmm'),'.nc'];
    dd = str2double(datestr(numdate,'dd'));
    temp = ncread(str1,'analysed_sst',[502,1002,dd],[5500,2125,1]);
    murtemp = temp(1:4:end,1:4:end) - 273.15;
    clear temp
    sst6 = sst6 - murtemp;
    clear murtemp
    sst6 = sst6.*sqrt(murarea./totalmurarea);
%     sst6 = sst6.*murmask;
%     sst6 = sst6(isnan(sst6)==0);
    sst6(isnan(sst6)==1) = 0;
    sstrmse6(ii) = sqrt(sum(sum(sst6.^2)));%./sqrt(murcount);
    clear sst6
    
    F = griddedInterpolant(XC12,YC12,SST_TS_12(:,:,ii),'linear');
    sst12 = F(murlon,murlat);
    str1 = [strm,datestr(numdate,'mmm'),'.nc'];
    dd = str2double(datestr(numdate,'dd'));
    temp = ncread(str1,'analysed_sst',[502,1002,dd],[5500,2125,1]);
    murtemp = temp(1:4:end,1:4:end) - 273.15;
    clear temp
    sst12 = sst12 - murtemp;
    clear murtemp
    sst12 = sst12.*sqrt(murarea./totalmurarea);
%     sst12 = sst12.*murmask;
%     sst12 = sst12(isnan(sst12)==0);
    sst12(isnan(sst12)==1) = 0;
    sstrmse12(ii) = sqrt(sum(sum(sst12.^2)));%./sqrt(murcount);
    clear sst12
    
    numdate = numdate + 1;
    fprintf('iteration %g \n',ii)
end

save RMSE_MUR sstrmse*

clear

load RMSE_MUR


toc()