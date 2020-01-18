clear
close all
clc
tic()

load pco2_socat_clim_2
load PCO2_monthly
load XY3 XC3 YC3
load XY6  XC6 YC6
load XY12 XC12 YC12

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
[xlon,ylat] = ndgrid(xlon,ylat);

pco2_socat_misfit3 = zeros(size(pco2_socat_clim_2));
pco2_socat_misfit6 = zeros(size(pco2_socat_clim_2));
pco2_socat_misfit12 = zeros(size(pco2_socat_clim_2));

pco2_socat_misfit3(:,:,1) = interp_AB(PCO2_3_01_JAN,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,1) = interp_AB(PCO2_6_01_JAN,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,1) = interp_AB(PCO2_12_01_JAN,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,2) = interp_AB(PCO2_3_02_FEB,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,2) = interp_AB(PCO2_6_02_FEB,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,2) = interp_AB(PCO2_12_02_FEB,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,3) = interp_AB(PCO2_3_03_MAR,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,3) = interp_AB(PCO2_6_03_MAR,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,3) = interp_AB(PCO2_12_03_MAR,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,4) = interp_AB(PCO2_3_04_APR,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,4) = interp_AB(PCO2_6_04_APR,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,4) = interp_AB(PCO2_12_04_APR,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,5) = interp_AB(PCO2_3_05_MAY,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,5) = interp_AB(PCO2_6_05_MAY,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,5) = interp_AB(PCO2_12_05_MAY,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,6) = interp_AB(PCO2_3_06_JUN,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,6) = interp_AB(PCO2_6_06_JUN,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,6) = interp_AB(PCO2_12_06_JUN,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,7) = interp_AB(PCO2_3_07_JUL,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,7) = interp_AB(PCO2_6_07_JUL,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,7) = interp_AB(PCO2_12_07_JUL,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,8) = interp_AB(PCO2_3_08_AUG,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,8) = interp_AB(PCO2_6_08_AUG,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,8) = interp_AB(PCO2_12_08_AUG,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,9) = interp_AB(PCO2_3_09_SEP,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,9) = interp_AB(PCO2_6_09_SEP,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,9) = interp_AB(PCO2_12_09_SEP,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,10) = interp_AB(PCO2_3_10_OCT,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,10) = interp_AB(PCO2_6_10_OCT,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,10) = interp_AB(PCO2_12_10_OCT,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,11) = interp_AB(PCO2_3_11_NOV,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,11) = interp_AB(PCO2_6_11_NOV,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,11) = interp_AB(PCO2_12_11_NOV,XC12,YC12,xlon,ylat);

pco2_socat_misfit3(:,:,12) = interp_AB(PCO2_3_12_DEC,XC3,YC3,xlon,ylat);
pco2_socat_misfit6(:,:,12) = interp_AB(PCO2_6_12_DEC,XC6,YC6,xlon,ylat);
pco2_socat_misfit12(:,:,12) = interp_AB(PCO2_12_12_DEC,XC12,YC12,xlon,ylat);

clear PCO2_*

pco2_socat_rmse3 = zeros(12,2);
pco2_socat_rmse6 = zeros(12,2);
pco2_socat_rmse12 = zeros(12,2);

for ii=1:12
    pco2_socat_misfit3(:,:,ii) = 1e6.*pco2_socat_misfit3(:,:,ii) - ...
        pco2_socat_clim_2(:,:,ii);
    temp = pco2_socat_misfit3(:,:,ii);
    temp = temp(isnan(temp)==0);
    n = length(temp);
    pco2_socat_rmse3(ii,1) = norm(temp,2)./sqrt(n);
    pco2_socat_rmse3(ii,2) = n;
    
    pco2_socat_misfit6(:,:,ii) = 1e6.*pco2_socat_misfit6(:,:,ii) - ...
        pco2_socat_clim_2(:,:,ii);
    temp = pco2_socat_misfit6(:,:,ii);
    temp = temp(isnan(temp)==0);
    n = length(temp);
    pco2_socat_rmse6(ii,1) = norm(temp,2)./sqrt(n);
    pco2_socat_rmse6(ii,2) = n;
    
    pco2_socat_misfit12(:,:,ii) = 1e6.*pco2_socat_misfit12(:,:,ii) - ...
        pco2_socat_clim_2(:,:,ii);
    temp = pco2_socat_misfit12(:,:,ii);
    temp = temp(isnan(temp)==0);
    n = length(temp);
    pco2_socat_rmse12(ii,1) = norm(temp,2)./sqrt(n);
    pco2_socat_rmse12(ii,2) = n;
end


save pco2_rmse pco2_socat_rmse*

clear 

toc()
