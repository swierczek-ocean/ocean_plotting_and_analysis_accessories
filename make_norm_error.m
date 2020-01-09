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

norm_pco2_socat_misfit3 = zeros(size(pco2_socat_clim_2));
norm_pco2_socat_misfit6 = zeros(size(pco2_socat_clim_2));
norm_pco2_socat_misfit12 = zeros(size(pco2_socat_clim_2));

norm_pco2_socat_misfit3(:,:,1) = interp_AB(PCO2_3_01_JAN,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,1) = interp_AB(PCO2_6_01_JAN,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,1) = interp_AB(PCO2_12_01_JAN,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,2) = interp_AB(PCO2_3_02_FEB,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,2) = interp_AB(PCO2_6_02_FEB,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,2) = interp_AB(PCO2_12_02_FEB,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,3) = interp_AB(PCO2_3_03_MAR,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,3) = interp_AB(PCO2_6_03_MAR,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,3) = interp_AB(PCO2_12_03_MAR,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,4) = interp_AB(PCO2_3_04_APR,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,4) = interp_AB(PCO2_6_04_APR,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,4) = interp_AB(PCO2_12_04_APR,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,5) = interp_AB(PCO2_3_05_MAY,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,5) = interp_AB(PCO2_6_05_MAY,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,5) = interp_AB(PCO2_12_05_MAY,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,6) = interp_AB(PCO2_3_06_JUN,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,6) = interp_AB(PCO2_6_06_JUN,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,6) = interp_AB(PCO2_12_06_JUN,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,7) = interp_AB(PCO2_3_07_JUL,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,7) = interp_AB(PCO2_6_07_JUL,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,7) = interp_AB(PCO2_12_07_JUL,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,8) = interp_AB(PCO2_3_08_AUG,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,8) = interp_AB(PCO2_6_08_AUG,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,8) = interp_AB(PCO2_12_08_AUG,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,9) = interp_AB(PCO2_3_09_SEP,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,9) = interp_AB(PCO2_6_09_SEP,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,9) = interp_AB(PCO2_12_09_SEP,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,10) = interp_AB(PCO2_3_10_OCT,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,10) = interp_AB(PCO2_6_10_OCT,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,10) = interp_AB(PCO2_12_10_OCT,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,11) = interp_AB(PCO2_3_11_NOV,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,11) = interp_AB(PCO2_6_11_NOV,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,11) = interp_AB(PCO2_12_11_NOV,XC12,YC12,xlon,ylat);

norm_pco2_socat_misfit3(:,:,12) = interp_AB(PCO2_3_12_DEC,XC3,YC3,xlon,ylat);
norm_pco2_socat_misfit6(:,:,12) = interp_AB(PCO2_6_12_DEC,XC6,YC6,xlon,ylat);
norm_pco2_socat_misfit12(:,:,12) = interp_AB(PCO2_12_12_DEC,XC12,YC12,xlon,ylat);

clear PCO2_*

for ii=1:12
    norm_pco2_socat_misfit3(:,:,ii) = (1e6.*norm_pco2_socat_misfit3(:,:,ii) - ...
        pco2_socat_clim_2(:,:,ii))./abs(pco2_socat_clim_2(:,:,ii));
    norm_pco2_socat_misfit6(:,:,ii) = (1e6.*norm_pco2_socat_misfit6(:,:,ii) - ...
        pco2_socat_clim_2(:,:,ii))./abs(pco2_socat_clim_2(:,:,ii));
    norm_pco2_socat_misfit12(:,:,ii) = (1e6.*norm_pco2_socat_misfit12(:,:,ii) - ...
        pco2_socat_clim_2(:,:,ii))./abs(pco2_socat_clim_2(:,:,ii));
end

[nn,mm] = size(xlon);

temp_socat3 = NaN.*ones(nn*mm,3);
temp_socat6 = NaN.*ones(nn*mm,3);
temp_socat12 = NaN.*ones(nn*mm,3);

for ii=1:nn
    for jj=1:mm
        temp = norm_pco2_socat_misfit3(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_socat3(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_socat3(sub2ind([nn,mm],ii,jj),1) = xlon(ii,jj);
            temp_socat3(sub2ind([nn,mm],ii,jj),2) = ylat(ii,jj);
        end
        temp = norm_pco2_socat_misfit6(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_socat6(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_socat6(sub2ind([nn,mm],ii,jj),1) = xlon(ii,jj);
            temp_socat6(sub2ind([nn,mm],ii,jj),2) = ylat(ii,jj);
        end
        temp = norm_pco2_socat_misfit12(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_socat12(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_socat12(sub2ind([nn,mm],ii,jj),1) = xlon(ii,jj);
            temp_socat12(sub2ind([nn,mm],ii,jj),2) = ylat(ii,jj);
        end
    end
end

temp = temp_socat3(:,3);
norm_pco2_socat_misfit3 = temp_socat3(isnan(temp)==0,:);
temp = temp_socat6(:,3);
norm_pco2_socat_misfit6 = temp_socat6(isnan(temp)==0,:);
temp = temp_socat12(:,3);
norm_pco2_socat_misfit12 = temp_socat12(isnan(temp)==0,:);

save norm_pco2_misfits norm_pco2_socat_misfit*

clear *socat* temp* pco2*

load DO_monthly
load NO3_monthly
load WOA_O_N

DO_clim = (1035/1000000).*DO_clim;
NO3_clim = (1035/1000000).*NO3_clim;

[lon,lat] = ndgrid(lon,lat);

norm_do_woa_misfit3 = zeros(62,32,12);
norm_do_woa_misfit6 = zeros(62,32,12);
norm_do_woa_misfit12 = zeros(62,32,12);
norm_no3_woa_misfit3 = zeros(62,32,12);
norm_no3_woa_misfit6 = zeros(62,32,12);
norm_no3_woa_misfit12 = zeros(62,32,12);

for ii=1:12
    norm_do_woa_misfit3(:,:,ii) = interp_AB(DO_Series32(:,:,ii),XC3,YC3,lon,lat);
    norm_do_woa_misfit6(:,:,ii) = interp_AB(DO_Series62(:,:,ii),XC6,YC6,lon,lat);
    norm_do_woa_misfit12(:,:,ii) = interp_AB(DO_Series122(:,:,ii),XC12,YC12,lon,lat);
    norm_no3_woa_misfit3(:,:,ii) = interp_AB(NO3_Series32(:,:,ii),XC3,YC3,lon,lat);
    norm_no3_woa_misfit6(:,:,ii) = interp_AB(NO3_Series62(:,:,ii),XC6,YC6,lon,lat);
    norm_no3_woa_misfit12(:,:,ii) = interp_AB(NO3_Series122(:,:,ii),XC12,YC12,lon,lat);
end

for ii=1:12
    norm_do_woa_misfit3(:,:,ii) = (norm_do_woa_misfit3(:,:,ii) - ...
        DO_clim(:,:,1,ii))./abs(DO_clim(:,:,1,ii));
    norm_do_woa_misfit6(:,:,ii) = (norm_do_woa_misfit6(:,:,ii) - ...
        DO_clim(:,:,1,ii))./abs(DO_clim(:,:,1,ii));
    norm_do_woa_misfit12(:,:,ii) = (norm_do_woa_misfit12(:,:,ii) - ...
        DO_clim(:,:,1,ii))./abs(DO_clim(:,:,1,ii));
    norm_no3_woa_misfit3(:,:,ii) = (norm_no3_woa_misfit3(:,:,ii) - ...
        NO3_clim(:,:,5,ii))./abs(NO3_clim(:,:,5,ii));
    norm_no3_woa_misfit6(:,:,ii) = (norm_no3_woa_misfit6(:,:,ii) - ...
        NO3_clim(:,:,5,ii))./abs(NO3_clim(:,:,5,ii));
    norm_no3_woa_misfit12(:,:,ii) = (norm_no3_woa_misfit12(:,:,ii) - ...
        NO3_clim(:,:,5,ii))./abs(NO3_clim(:,:,5,ii));
end

[nn,mm] = size(lon);

temp_woa_no3_3 = NaN.*ones(nn*mm,3);
temp_woa_no3_6 = NaN.*ones(nn*mm,3);
temp_woa_no3_12 = NaN.*ones(nn*mm,3);
temp_woa_do_3 = NaN.*ones(nn*mm,3);
temp_woa_do_6 = NaN.*ones(nn*mm,3);
temp_woa_do_12 = NaN.*ones(nn*mm,3);

for ii=1:nn
    for jj=1:mm
        temp = norm_do_woa_misfit3(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_woa_do_3(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_woa_do_3(sub2ind([nn,mm],ii,jj),1) = lon(ii,jj);
            temp_woa_do_3(sub2ind([nn,mm],ii,jj),2) = lat(ii,jj);
        end
        temp = norm_do_woa_misfit6(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_woa_do_6(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_woa_do_6(sub2ind([nn,mm],ii,jj),1) = lon(ii,jj);
            temp_woa_do_6(sub2ind([nn,mm],ii,jj),2) = lat(ii,jj);
        end
        temp = norm_do_woa_misfit12(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_woa_do_12(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_woa_do_12(sub2ind([nn,mm],ii,jj),1) = lon(ii,jj);
            temp_woa_do_12(sub2ind([nn,mm],ii,jj),2) = lat(ii,jj);
        end
        temp = norm_no3_woa_misfit3(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_woa_no3_3(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_woa_no3_3(sub2ind([nn,mm],ii,jj),1) = lon(ii,jj);
            temp_woa_no3_3(sub2ind([nn,mm],ii,jj),2) = lat(ii,jj);
        end
        temp = norm_no3_woa_misfit6(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_woa_no3_6(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_woa_no3_6(sub2ind([nn,mm],ii,jj),1) = lon(ii,jj);
            temp_woa_no3_6(sub2ind([nn,mm],ii,jj),2) = lat(ii,jj);
        end
        temp = norm_no3_woa_misfit12(ii,jj,:);
        temp = mean(temp(isnan(temp)==0));
        if isnan(temp)==0
            temp_woa_no3_12(sub2ind([nn,mm],ii,jj),3) = temp;
            temp_woa_no3_12(sub2ind([nn,mm],ii,jj),1) = lon(ii,jj);
            temp_woa_no3_12(sub2ind([nn,mm],ii,jj),2) = lat(ii,jj);
        end
    end
end

temp = temp_woa_no3_3(:,3);
norm_no3_woa_misfit3 = temp_woa_no3_3(isnan(temp)==0,:);
temp = temp_woa_no3_6(:,3);
norm_no3_woa_misfit6 = temp_woa_no3_6(isnan(temp)==0,:);
temp = temp_woa_no3_12(:,3);
norm_no3_woa_misfit12 = temp_woa_no3_12(isnan(temp)==0,:);

temp = temp_woa_do_3(:,3);
norm_do_woa_misfit3 = temp_woa_do_3(isnan(temp)==0,:);
temp = temp_woa_do_6(:,3);
norm_do_woa_misfit6 = temp_woa_do_6(isnan(temp)==0,:);
temp = temp_woa_do_12(:,3);
norm_do_woa_misfit12 = temp_woa_do_12(isnan(temp)==0,:);

save norm_woa_misfits *woa_misfit*



toc()