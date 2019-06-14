clear
close all
clc

tic()


bsose_day_1 = datenum('01012013','mmddyyyy');
mit_day_2 = datenum('12012016','mmddyyyy');
mit_day_last = datenum('11302017','mmddyyyy');
mit_day_DJF_last = datenum('02282017','mmddyyyy');
mit_day_DM_last = datenum('05312017','mmddyyyy');
mit_day_JJA_last = datenum('08312017','mmddyyyy');
mit_day_4 = datenum('06012017','mmddyyyy');


DD_length_time = mit_day_last - mit_day_2 + 1;
DJF_length_time = mit_day_DJF_last - mit_day_2 + 1;
DM_length_time = mit_day_DM_last - mit_day_2 + 1;
JN_length_time = mit_day_last - mit_day_4 + 1;
JJA_length_time = mit_day_JJA_last - mit_day_4 + 1;

bsose_index_2 = mit_day_2 - bsose_day_1 + 1;
bsose_index_4 = mit_day_4 - bsose_day_1 + 1;

%% THETA
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Theta.nc';
sd = 48;
nd = 12;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288,1)-1;
hix = find(X>352,1)+1;
loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
HC = hFacC(lox:hix,loy:hiy,1);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

THETA_temp = ncread(str,'THETA',[lox,loy,1,sd],[nn,mm,1,nd]);

THETA_BSOSE_DJF_avg = mean(THETA_temp(:,:,1:3),3);
THETA_BSOSE_DM_avg = mean(THETA_temp(:,:,1:6),3);
THETA_BSOSE_DD_avg = mean(THETA_temp(:,:,1:12),3);
THETA_BSOSE_JJA_avg = mean(THETA_temp(:,:,7:9),3);
THETA_BSOSE_JN_avg = mean(THETA_temp(:,:,7:12),3);

[m64,n64] = size(THETA_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            THETA_BSOSE_JJA_avg(ii,jj) = 99999999;
            THETA_BSOSE_JN_avg(ii,jj) = 99999999;
            THETA_BSOSE_DD_avg(ii,jj) = 99999999;
            THETA_BSOSE_DJF_avg(ii,jj) = 99999999;
            THETA_BSOSE_DM_avg(ii,jj) = 99999999;
        end
    end
end

clear THETA_temp

fid = fopen('THETA_BSOSE_DD_avg.bin','w','b');
fwrite(fid,THETA_BSOSE_DD_avg,'single');
fclose(fid);
fid = fopen('THETA_BSOSE_DM_avg.bin','w','b');
fwrite(fid,THETA_BSOSE_DM_avg,'single');
fclose(fid);
fid = fopen('THETA_BSOSE_DJF_avg.bin','w','b');
fwrite(fid,THETA_BSOSE_DJF_avg,'single');
fclose(fid);
fid = fopen('THETA_BSOSE_JN_avg.bin','w','b');
fwrite(fid,THETA_BSOSE_JN_avg,'single');
fclose(fid);
fid = fopen('THETA_BSOSE_JJA_avg.bin','w','b');
fwrite(fid,THETA_BSOSE_JJA_avg,'single');
fclose(fid);

fprintf('finished THETA \n')

%% THETA


%% ETAN
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_SSH.nc';
sd = bsose_index_2;
nd = DD_length_time;

ETAN_temp = ncread(str,'ETAN',[lox,loy,sd],[nn,mm,nd]);

ETAN_BSOSE_DJF_avg = mean(ETAN_temp(:,:,1:DJF_length_time),3);
ETAN_BSOSE_DM_avg = mean(ETAN_temp(:,:,1:DM_length_time),3);
ETAN_BSOSE_DD_avg = mean(ETAN_temp(:,:,1:DD_length_time),3);
ETAN_BSOSE_JJA_avg = mean(ETAN_temp(:,:,JN_length_time:(JN_length_time+91)),3);
ETAN_BSOSE_JN_avg = mean(ETAN_temp(:,:,JN_length_time:DD_length_time),3);
ETAN_BSOSE_DJF_std = std(ETAN_temp(:,:,1:DJF_length_time),0,3);
ETAN_BSOSE_DM_std = std(ETAN_temp(:,:,1:DM_length_time),0,3);
ETAN_BSOSE_DD_std = std(ETAN_temp(:,:,1:DD_length_time),0,3);
ETAN_BSOSE_JJA_std = std(ETAN_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
ETAN_BSOSE_JN_std = std(ETAN_temp(:,:,JN_length_time:DD_length_time),0,3);

clear ETAN_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            ETAN_BSOSE_JJA_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JN_avg(ii,jj) = 99999999;
            ETAN_BSOSE_DD_avg(ii,jj) = 99999999;
            ETAN_BSOSE_DJF_avg(ii,jj) = 99999999;
            ETAN_BSOSE_DM_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JJA_std(ii,jj) = 99999999;
            ETAN_BSOSE_JN_std(ii,jj) = 99999999;
            ETAN_BSOSE_DD_std(ii,jj) = 99999999;
            ETAN_BSOSE_DJF_std(ii,jj) = 99999999;
            ETAN_BSOSE_DM_std(ii,jj) = 99999999;
        end
    end
end

fid = fopen('ETAN_BSOSE_DD_avg.bin','w','b');
fwrite(fid,ETAN_BSOSE_DD_avg,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_DD_std.bin','w','b');
fwrite(fid,ETAN_BSOSE_DD_std,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_DM_avg.bin','w','b');
fwrite(fid,ETAN_BSOSE_DM_avg,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_DM_std.bin','w','b');
fwrite(fid,ETAN_BSOSE_DM_std,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_DJF_avg.bin','w','b');
fwrite(fid,ETAN_BSOSE_DJF_avg,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_DJF_std.bin','w','b');
fwrite(fid,ETAN_BSOSE_DJF_std,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_JN_avg.bin','w','b');
fwrite(fid,ETAN_BSOSE_JN_avg,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_JN_std.bin','w','b');
fwrite(fid,ETAN_BSOSE_JN_std,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_JJA_avg.bin','w','b');
fwrite(fid,ETAN_BSOSE_JJA_avg,'single');
fclose(fid);
fid = fopen('ETAN_BSOSE_JJA_std.bin','w','b');
fwrite(fid,ETAN_BSOSE_JJA_std,'single');
fclose(fid);

fprintf('finished ETAN \n')

%% ETAN

%% WVEL
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Wvel.nc';
sd = bsose_index_2;
nd = DD_length_time;

% XCS = ncread(str,'XC');
% YCS = ncread(str,'YC');
% hFacC = ncread(str,'hFacC');
% X = XCS;
% Y = YCS;
% lox = find(X>288,1)-1;
% hix = find(X>352,1)+1;
% loy = find(Y>-60,1)-1;
% hiy = find(Y>-30,1)+1;
% XCS = XCS(lox:hix);
% YCS = YCS(loy:hiy);
% hFacC = hFacC(lox:hix,loy:hiy,1);
% nn = length(XCS);
% mm = length(YCS);
% [XCS,YCS] = ndgrid(XCS,YCS);

WVEL_temp = ncread(str,'WVEL',[lox,loy,1,sd],[nn,mm,1,nd]);

WVEL_BSOSE_DJF_avg = mean(WVEL_temp(:,:,1:DJF_length_time),3);
WVEL_BSOSE_DM_avg = mean(WVEL_temp(:,:,1:DM_length_time),3);
WVEL_BSOSE_DD_avg = mean(WVEL_temp(:,:,1:DD_length_time),3);
WVEL_BSOSE_JJA_avg = mean(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),3);
WVEL_BSOSE_JN_avg = mean(WVEL_temp(:,:,JN_length_time:DD_length_time),3);
WVEL_BSOSE_DJF_std = std(WVEL_temp(:,:,1:DJF_length_time),0,3);
WVEL_BSOSE_DM_std = std(WVEL_temp(:,:,1:DM_length_time),0,3);
WVEL_BSOSE_DD_std = std(WVEL_temp(:,:,1:DD_length_time),0,3);
WVEL_BSOSE_JJA_std = std(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
WVEL_BSOSE_JN_std = std(WVEL_temp(:,:,JN_length_time:DD_length_time),0,3);

clear WVEL_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            WVEL_BSOSE_JJA_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JN_avg(ii,jj) = 99999999;
            WVEL_BSOSE_DD_avg(ii,jj) = 99999999;
            WVEL_BSOSE_DJF_avg(ii,jj) = 99999999;
            WVEL_BSOSE_DM_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JJA_std(ii,jj) = 99999999;
            WVEL_BSOSE_JN_std(ii,jj) = 99999999;
            WVEL_BSOSE_DD_std(ii,jj) = 99999999;
            WVEL_BSOSE_DJF_std(ii,jj) = 99999999;
            WVEL_BSOSE_DM_std(ii,jj) = 99999999;
        end
    end
end

fid = fopen('WVEL_BSOSE_DD_avg.bin','w','b');
fwrite(fid,WVEL_BSOSE_DD_avg,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_DD_std.bin','w','b');
fwrite(fid,WVEL_BSOSE_DD_std,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_DM_avg.bin','w','b');
fwrite(fid,WVEL_BSOSE_DM_avg,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_DM_std.bin','w','b');
fwrite(fid,WVEL_BSOSE_DM_std,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_DJF_avg.bin','w','b');
fwrite(fid,WVEL_BSOSE_DJF_avg,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_DJF_std.bin','w','b');
fwrite(fid,WVEL_BSOSE_DJF_std,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_JN_avg.bin','w','b');
fwrite(fid,WVEL_BSOSE_JN_avg,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_JN_std.bin','w','b');
fwrite(fid,WVEL_BSOSE_JN_std,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_JJA_avg.bin','w','b');
fwrite(fid,WVEL_BSOSE_JJA_avg,'single');
fclose(fid);
fid = fopen('WVEL_BSOSE_JJA_std.bin','w','b');
fwrite(fid,WVEL_BSOSE_JJA_std,'single');
fclose(fid);

fprintf('finished WVEL \n')

%% WVEL

%% SALT
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Salt.nc';
sd = 48;
nd = 12;

SALT_temp = ncread(str,'SALT',[lox,loy,1,sd],[nn,mm,1,nd]);

SALT_BSOSE_DJF_avg = mean(SALT_temp(:,:,1:3),3);
SALT_BSOSE_DM_avg = mean(SALT_temp(:,:,1:6),3);
SALT_BSOSE_DD_avg = mean(SALT_temp(:,:,1:12),3);
SALT_BSOSE_JJA_avg = mean(SALT_temp(:,:,7:9),3);
SALT_BSOSE_JN_avg = mean(SALT_temp(:,:,7:12),3);

clear SALT_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            SALT_BSOSE_JJA_avg(ii,jj) = 99999999;
            SALT_BSOSE_JN_avg(ii,jj) = 99999999;
            SALT_BSOSE_DD_avg(ii,jj) = 99999999;
            SALT_BSOSE_DJF_avg(ii,jj) = 99999999;
            SALT_BSOSE_DM_avg(ii,jj) = 99999999;
        end
    end
end

fid = fopen('SALT_BSOSE_DD_avg.bin','w','b');
fwrite(fid,SALT_BSOSE_DD_avg,'single');
fclose(fid);
fid = fopen('SALT_BSOSE_DM_avg.bin','w','b');
fwrite(fid,SALT_BSOSE_DM_avg,'single');
fclose(fid);
fid = fopen('SALT_BSOSE_DJF_avg.bin','w','b');
fwrite(fid,SALT_BSOSE_DJF_avg,'single');
fclose(fid);
fid = fopen('SALT_BSOSE_JN_avg.bin','w','b');
fwrite(fid,SALT_BSOSE_JN_avg,'single');
fclose(fid);
fid = fopen('SALT_BSOSE_JJA_avg.bin','w','b');
fwrite(fid,SALT_BSOSE_JJA_avg,'single');
fclose(fid);

fprintf('finished SALT \n')

%% SALT

%% TFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfTflx.nc';
sd = 48;
nd = 12;

TFLUX_temp = ncread(str,'TFLUX',[lox,loy,sd],[nn,mm,nd]);

TFLUX_BSOSE_DJF_avg = mean(TFLUX_temp(:,:,1:3),3);
TFLUX_BSOSE_DM_avg = mean(TFLUX_temp(:,:,1:6),3);
TFLUX_BSOSE_DD_avg = mean(TFLUX_temp(:,:,1:12),3);
TFLUX_BSOSE_JJA_avg = mean(TFLUX_temp(:,:,7:9),3);
TFLUX_BSOSE_JN_avg = mean(TFLUX_temp(:,:,7:12),3);

clear TFLUX_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            TFLUX_BSOSE_JJA_avg(ii,jj) = 99999999;
            TFLUX_BSOSE_JN_avg(ii,jj) = 99999999;
            TFLUX_BSOSE_DD_avg(ii,jj) = 99999999;
            TFLUX_BSOSE_DJF_avg(ii,jj) = 99999999;
            TFLUX_BSOSE_DM_avg(ii,jj) = 99999999;
        end
    end
end

fid = fopen('TFLUX_BSOSE_DD_avg.bin','w','b');
fwrite(fid,TFLUX_BSOSE_DD_avg,'single');
fclose(fid);
fid = fopen('TFLUX_BSOSE_DM_avg.bin','w','b');
fwrite(fid,TFLUX_BSOSE_DM_avg,'single');
fclose(fid);
fid = fopen('TFLUX_BSOSE_DJF_avg.bin','w','b');
fwrite(fid,TFLUX_BSOSE_DJF_avg,'single');
fclose(fid);
fid = fopen('TFLUX_BSOSE_JN_avg.bin','w','b');
fwrite(fid,TFLUX_BSOSE_JN_avg,'single');
fclose(fid);
fid = fopen('TFLUX_BSOSE_JJA_avg.bin','w','b');
fwrite(fid,TFLUX_BSOSE_JJA_avg,'single');
fclose(fid);

fprintf('finished TFLUX \n')

%% TFLUX

%% SFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfSflx.nc';
sd = 48;
nd = 12;

SFLUX_temp = ncread(str,'SFLUX',[lox,loy,sd],[nn,mm,nd]);

SFLUX_BSOSE_DJF_avg = mean(SFLUX_temp(:,:,1:3),3);
SFLUX_BSOSE_DM_avg = mean(SFLUX_temp(:,:,1:6),3);
SFLUX_BSOSE_DD_avg = mean(SFLUX_temp(:,:,1:12),3);
SFLUX_BSOSE_JJA_avg = mean(SFLUX_temp(:,:,7:9),3);
SFLUX_BSOSE_JN_avg = mean(SFLUX_temp(:,:,7:12),3);

clear SFLUX_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            SFLUX_BSOSE_JJA_avg(ii,jj) = 99999999;
            SFLUX_BSOSE_JN_avg(ii,jj) = 99999999;
            SFLUX_BSOSE_DD_avg(ii,jj) = 99999999;
            SFLUX_BSOSE_DJF_avg(ii,jj) = 99999999;
            SFLUX_BSOSE_DM_avg(ii,jj) = 99999999;
        end
    end
end

fid = fopen('SFLUX_BSOSE_DD_avg.bin','w','b');
fwrite(fid,SFLUX_BSOSE_DD_avg,'single');
fclose(fid);
fid = fopen('SFLUX_BSOSE_DM_avg.bin','w','b');
fwrite(fid,SFLUX_BSOSE_DM_avg,'single');
fclose(fid);
fid = fopen('SFLUX_BSOSE_DJF_avg.bin','w','b');
fwrite(fid,SFLUX_BSOSE_DJF_avg,'single');
fclose(fid);
fid = fopen('SFLUX_BSOSE_JN_avg.bin','w','b');
fwrite(fid,SFLUX_BSOSE_JN_avg,'single');
fclose(fid);
fid = fopen('SFLUX_BSOSE_JJA_avg.bin','w','b');
fwrite(fid,SFLUX_BSOSE_JJA_avg,'single');
fclose(fid);

fprintf('finished SFLUX \n')

%% SFLUX

%% CFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfCO2flx.nc';
sd = 48;
nd = 12;

CFLUX_temp = ncread(str,'BLGCFLX',[lox,loy,sd],[nn,mm,nd]);

CFLUX_BSOSE_DJF_avg = mean(CFLUX_temp(:,:,1:3),3);
CFLUX_BSOSE_DM_avg = mean(CFLUX_temp(:,:,1:6),3);
CFLUX_BSOSE_DD_avg = mean(CFLUX_temp(:,:,1:12),3);
CFLUX_BSOSE_JJA_avg = mean(CFLUX_temp(:,:,7:9),3);
CFLUX_BSOSE_JN_avg = mean(CFLUX_temp(:,:,7:12),3);

clear CFLUX_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            CFLUX_BSOSE_JJA_avg(ii,jj) = 99999999;
            CFLUX_BSOSE_JN_avg(ii,jj) = 99999999;
            CFLUX_BSOSE_DD_avg(ii,jj) = 99999999;
            CFLUX_BSOSE_DJF_avg(ii,jj) = 99999999;
            CFLUX_BSOSE_DM_avg(ii,jj) = 99999999;
        end
    end
end

fid = fopen('CFLUX_BSOSE_DD_avg.bin','w','b');
fwrite(fid,CFLUX_BSOSE_DD_avg,'single');
fclose(fid);
fid = fopen('CFLUX_BSOSE_DM_avg.bin','w','b');
fwrite(fid,CFLUX_BSOSE_DM_avg,'single');
fclose(fid);
fid = fopen('CFLUX_BSOSE_DJF_avg.bin','w','b');
fwrite(fid,CFLUX_BSOSE_DJF_avg,'single');
fclose(fid);
fid = fopen('CFLUX_BSOSE_JN_avg.bin','w','b');
fwrite(fid,CFLUX_BSOSE_JN_avg,'single');
fclose(fid);
fid = fopen('CFLUX_BSOSE_JJA_avg.bin','w','b');
fwrite(fid,CFLUX_BSOSE_JJA_avg,'single');
fclose(fid);

fprintf('finished CFLUX \n')

%% CFLUX

%% OFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfO2flx.nc';
sd = 48;
nd = 12;

OFLUX_temp = ncread(str,'BLGOFLX',[lox,loy,sd],[nn,mm,nd]);

OFLUX_BSOSE_DJF_avg = mean(OFLUX_temp(:,:,1:3),3);
OFLUX_BSOSE_DM_avg = mean(OFLUX_temp(:,:,1:6),3);
OFLUX_BSOSE_DD_avg = mean(OFLUX_temp(:,:,1:12),3);
OFLUX_BSOSE_JJA_avg = mean(OFLUX_temp(:,:,7:9),3);
OFLUX_BSOSE_JN_avg = mean(OFLUX_temp(:,:,7:12),3);

clear OFLUX_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            OFLUX_BSOSE_JJA_avg(ii,jj) = 99999999;
            OFLUX_BSOSE_JN_avg(ii,jj) = 99999999;
            OFLUX_BSOSE_DD_avg(ii,jj) = 99999999;
            OFLUX_BSOSE_DJF_avg(ii,jj) = 99999999;
            OFLUX_BSOSE_DM_avg(ii,jj) = 99999999;
        end
    end
end

fid = fopen('OFLUX_BSOSE_DD_avg.bin','w','b');
fwrite(fid,OFLUX_BSOSE_DD_avg,'single');
fclose(fid);
fid = fopen('OFLUX_BSOSE_DM_avg.bin','w','b');
fwrite(fid,OFLUX_BSOSE_DM_avg,'single');
fclose(fid);
fid = fopen('OFLUX_BSOSE_DJF_avg.bin','w','b');
fwrite(fid,OFLUX_BSOSE_DJF_avg,'single');
fclose(fid);
fid = fopen('OFLUX_BSOSE_JN_avg.bin','w','b');
fwrite(fid,OFLUX_BSOSE_JN_avg,'single');
fclose(fid);
fid = fopen('OFLUX_BSOSE_JJA_avg.bin','w','b');
fwrite(fid,OFLUX_BSOSE_JJA_avg,'single');
fclose(fid);

fprintf('finished OFLUX \n')

%% OFLUX

clear sd nd char bsose_* *_length_* *_day_* m64 n64

save BSOSE_surf_avgs








toc()