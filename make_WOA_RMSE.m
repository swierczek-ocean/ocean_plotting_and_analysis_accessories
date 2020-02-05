clear
close all
clc
tic()


%% 122

DO_Series122 = zeros(756,512,79,12);
NO3_Series122 = zeros(756,512,68,12);
HC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag/';

for ii=2:13
    char122bgc = [str,'diag_bgc.',num2str(10950*ii,'%010.f')];
    temp122bgc = rdmds(char122bgc); 
    DO_Series122(:,:,:,ii-1) = temp122bgc(:,:,1:79,3); 
    NO3_Series122(:,:,:,ii-1) = temp122bgc(:,:,1:68,4);
    clear temp122bgc
end

for jj=1:756
    for kk=1:512
        for ii=1:68
            if HC12(jj,kk,ii)==0
                DO_Series122(jj,kk,ii) = NaN;
                NO3_Series122(jj,kk,ii) = NaN;
            end
        end
        for ii=69:79
            if HC12(jj,kk,ii)==0
                DO_Series122(jj,kk,ii) = NaN;
            end
        end
    end
end

%% 62

DO_Series62 = zeros(384,260,40,12);
NO3_Series62 = zeros(384,260,34,12);
HC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag/';

for ii=2:13
    char62bgc = [str,'diag_bgc.',num2str(2190*ii,'%010.f')];
    temp62bgc = rdmds(char62bgc); 
    DO_Series62(:,:,:,ii-1) = temp62bgc(:,:,1:40,3); 
    NO3_Series62(:,:,:,ii-1) = temp62bgc(:,:,1:34,4); 
    clear temp62bgc
end

for jj=1:384
    for kk=1:260
        for ii=1:34
            if HC6(jj,kk,ii)==0
                DO_Series62(jj,kk,ii) = NaN;
                NO3_Series62(jj,kk,ii) = NaN;
            end
        end
        for ii=35:40
            if HC6(jj,kk,ii)==0
                DO_Series62(jj,kk,ii) = NaN;
            end
        end       
    end
end

%% 32

DO_Series32 = zeros(192,132,40,12);
NO3_Series32 = zeros(192,132,34,12);
HC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
depth32 = 1;
str = '../MITgcm/verification/SO3_20190513/diag/';

for ii=2:13
    char32bgc = [str,'diag_bgc.',num2str(1460*ii,'%010.f')];
    temp32bgc = rdmds(char32bgc); 
    DO_Series32(:,:,:,ii-1) = temp32bgc(:,:,1:40,3); 
    NO3_Series32(:,:,:,ii-1) = temp32bgc(:,:,1:34,4);
    clear temp32bgc
end

for jj=1:192
    for kk=1:132
        for ii=1:34
            if HC3(jj,kk,ii)==0
                DO_Series32(jj,kk,ii) = NaN;
                NO3_Series32(jj,kk,ii) = NaN;
            end
        end
        for ii=35:40
            if HC3(jj,kk,ii)==0
                DO_Series32(jj,kk,ii) = NaN;
            end
        end         
    end
end


clearvars -except DO* NO3*

XC3 = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC3 = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
RC3 = abs(squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC')));
XC3 = XC3(:,1);
YC3 = YC3(1,:);

XC6 = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC6 = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RC6 = abs(squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC')));
XC6 = XC6(:,1);
YC6 = YC6(1,:);

XC12 = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC12 = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RC12 = abs(squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC')));
XC12 = XC12(:,1);
YC12 = YC12(1,:);


[oXC3,oYC3,oRC3] = ndgrid(XC3,YC3,RC3(1:40));
[oXC6,oYC6,oRC6] = ndgrid(XC6,YC6,RC6(1:40));
[oXC12,oYC12,oRC12] = ndgrid(XC12,YC12,RC12(1:79));

[nXC3,nYC3,nRC3] = ndgrid(XC3,YC3,RC3(1:34));
[nXC6,nYC6,nRC6] = ndgrid(XC6,YC6,RC6(1:34));
[nXC12,nYC12,nRC12] = ndgrid(XC12,YC12,RC12(1:68));

load WOA_O_N

DO_clim = (1035/1000000).*DO_clim;
NO3_clim = (1035/1000000).*NO3_clim;

depth = woa_depth_o;
ndepth = woa_depth_n;
[olon,olat,odepth] = ndgrid(lon,lat,depth);
[nlon,nlat,ndepth] = ndgrid(lon,lat,ndepth);

do_woa_misfit3 = zeros(62,32,57,12);
do_woa_misfit6 = zeros(62,32,57,12);
do_woa_misfit12 = zeros(62,32,57,12);
no3_woa_misfit3 = zeros(62,32,43,12);
no3_woa_misfit6 = zeros(62,32,43,12);
no3_woa_misfit12 = zeros(62,32,43,12);

for ii=1:12
    do_woa_misfit3(:,:,:,ii) = interp_AB_3(DO_Series32(:,:,:,ii),...
        oXC3,oYC3,oRC3,olon,olat,odepth);
    do_woa_misfit6(:,:,:,ii) = interp_AB_3(DO_Series62(:,:,:,ii),...
        oXC6,oYC6,oRC6,olon,olat,odepth);
    do_woa_misfit12(:,:,:,ii) = interp_AB_3(DO_Series122(:,:,:,ii),...
        oXC12,oYC12,oRC12,olon,olat,odepth);
    no3_woa_misfit3(:,:,:,ii) = interp_AB_3(NO3_Series32(:,:,:,ii),...
        nXC3,nYC3,nRC3,nlon,nlat,ndepth);
    no3_woa_misfit6(:,:,:,ii) = interp_AB_3(NO3_Series62(:,:,:,ii),...
        nXC6,nYC6,nRC6,nlon,nlat,ndepth);
    no3_woa_misfit12(:,:,:,ii) = interp_AB_3(NO3_Series122(:,:,:,ii),...
        nXC12,nYC12,nRC12,nlon,nlat,ndepth);
end

for ii=1:12
    do_woa_misfit3(:,:,:,ii) = do_woa_misfit3(:,:,:,ii) - ...
        DO_clim(:,:,:,ii);
    do_woa_misfit6(:,:,:,ii) = do_woa_misfit6(:,:,:,ii) - ...
        DO_clim(:,:,:,ii);
    do_woa_misfit12(:,:,:,ii) = do_woa_misfit12(:,:,:,ii) - ...
        DO_clim(:,:,:,ii);
    no3_woa_misfit3(:,:,:,ii) = no3_woa_misfit3(:,:,:,ii) - ...
        NO3_clim(:,:,:,ii);
    no3_woa_misfit6(:,:,:,ii) = no3_woa_misfit6(:,:,:,ii) - ...
        NO3_clim(:,:,:,ii);
    no3_woa_misfit12(:,:,:,ii) = no3_woa_misfit12(:,:,:,ii) - ...
        NO3_clim(:,:,:,ii);
end

[nn,mm] = size(lon);

do_woa_rmse3 = zeros(12,57,2);
do_woa_rmse6 = zeros(12,57,2);
do_woa_rmse12 = zeros(12,57,2);
no3_woa_rmse3 = zeros(12,43,2);
no3_woa_rmse6 = zeros(12,43,2);
no3_woa_rmse12 = zeros(12,43,2);

do_woa_sd3 = zeros(12,57);
do_woa_sd6 = zeros(12,57);
do_woa_sd12 = zeros(12,57);
no3_woa_sd3 = zeros(12,43);
no3_woa_sd6 = zeros(12,43);
no3_woa_sd12 = zeros(12,43);

for ii=1:12
    for jj=1:43
        temp = do_woa_misfit3(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        do_woa_rmse3(ii,jj,1) = norm(temp,2)./sqrt(n);
        do_woa_rmse3(ii,jj,2) = n;
        do_woa_sd3(ii,jj) = std(temp,0);
        
        temp = do_woa_misfit6(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        do_woa_rmse6(ii,jj,1) = norm(temp,2)./sqrt(n);
        do_woa_rmse6(ii,jj,2) = n;
        do_woa_sd6(ii,jj) = std(temp,0);
        
        temp = do_woa_misfit12(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        do_woa_rmse12(ii,jj,1) = norm(temp,2)./sqrt(n);
        do_woa_rmse12(ii,jj,2) = n;
        do_woa_sd12(ii,jj) = std(temp,0);
        
        temp = no3_woa_misfit3(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        no3_woa_rmse3(ii,jj,1) = norm(temp,2)./sqrt(n);
        no3_woa_rmse3(ii,jj,2) = n;
        no3_woa_sd3(ii,jj) = std(temp,0);
        
        temp = no3_woa_misfit6(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        no3_woa_rmse6(ii,jj,1) = norm(temp,2)./sqrt(n);
        no3_woa_rmse6(ii,jj,2) = n;
        no3_woa_sd6(ii,jj) = std(temp,0);
        
        temp = no3_woa_misfit12(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        no3_woa_rmse12(ii,jj,1) = norm(temp,2)./sqrt(n);
        no3_woa_rmse12(ii,jj,2) = n;
        no3_woa_sd12(ii,jj) = std(temp,0);
    end
    for jj=44:57
        temp = do_woa_misfit3(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        do_woa_rmse3(ii,jj,1) = norm(temp,2)./sqrt(n);
        do_woa_rmse3(ii,jj,2) = n;
        do_woa_sd3(ii,jj) = std(temp,0);
        
        temp = do_woa_misfit6(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        do_woa_rmse6(ii,jj,1) = norm(temp,2)./sqrt(n);
        do_woa_rmse6(ii,jj,2) = n;
        do_woa_sd6(ii,jj) = std(temp,0);
        
        temp = do_woa_misfit12(:,:,jj,ii);
        temp = temp(isnan(temp)==0);
        n = length(temp);
        do_woa_rmse12(ii,jj,1) = norm(temp,2)./sqrt(n);
        do_woa_rmse12(ii,jj,2) = n;
        do_woa_sd12(ii,jj) = std(temp,0);
    end
    
end

save woa_misfits *_misfit* olon olat odepth nlon nlat ndepth
save woa_rmse *woa_rmse*



toc()