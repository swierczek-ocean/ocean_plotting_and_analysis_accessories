clear
close all
clc

tic()


bsose_day_1 = datenum('01012013','mmddyyyy');
mit_day_2 = datenum('12012016','mmddyyyy');
mit_day_last = datenum('11302017','mmddyyyy');
mit_day_DJF_last = datenum('02282017','mmddyyyy');
mit_day_DJFMAM_last = datenum('05312017','mmddyyyy');
mit_day_JJA_last = datenum('08312017','mmddyyyy');
mit_day_4 = datenum('06012017','mmddyyyy');



DD_length_time = mit_day_last - mit_day_2 + 1;
DJF_length_time = mit_day_DJF_last - mit_day_2 + 1;
DM_length_time = mit_day_DJFMAM_last - mit_day_2 + 1;
JN_length_time = mit_day_last - mit_day_4 + 1;
JJA_length_time = mit_day_JJA_last - mit_day_4 + 1;

bsose_index_2 = mit_day_2 - bsose_day_1 + 1;
bsose_index_4 = mit_day_4 - bsose_day_1 + 1;

%% THETA
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Theta.nc';
sd = 48;
nd = 13;

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
THETA_BSOSE_DJFMAM_avg = mean(THETA_temp(:,:,1:6),3);
THETA_BSOSE_DN_avg = mean(THETA_temp(:,:,1:12),3);
THETA_BSOSE_JJA_avg = mean(THETA_temp(:,:,7:9),3);
THETA_BSOSE_JAS_avg = mean(THETA_temp(:,:,8:10),3);
THETA_BSOSE_JJASON_avg = mean(THETA_temp(:,:,7:12),3);
THETA_BSOSE_JASOND_avg = mean(THETA_temp(:,:,8:13),3);
THETA_BSOSE_JFM_avg = mean(THETA_temp(:,:,2:4),3);
THETA_BSOSE_JFMAMJ_avg = mean(THETA_temp(:,:,2:7),3);
THETA_BSOSE_JD_avg = mean(THETA_temp(:,:,2:13),3);

THETA_temp = ncread(str,'THETA',[lox,loy,13,sd],[nn,mm,1,nd]);

THETA_BSOSE105_DJF_avg = mean(THETA_temp(:,:,1:3),3);
THETA_BSOSE105_DJFMAM_avg = mean(THETA_temp(:,:,1:6),3);
THETA_BSOSE105_DN_avg = mean(THETA_temp(:,:,1:12),3);
THETA_BSOSE105_JJA_avg = mean(THETA_temp(:,:,7:9),3);
THETA_BSOSE105_JAS_avg = mean(THETA_temp(:,:,8:10),3);
THETA_BSOSE105_JJASON_avg = mean(THETA_temp(:,:,7:12),3);
THETA_BSOSE105_JASOND_avg = mean(THETA_temp(:,:,8:13),3);
THETA_BSOSE105_JFM_avg = mean(THETA_temp(:,:,2:4),3);
THETA_BSOSE105_JFMAMJ_avg = mean(THETA_temp(:,:,2:7),3);
THETA_BSOSE105_JD_avg = mean(THETA_temp(:,:,2:13),3);

THETA_temp = ncread(str,'THETA',[lox,loy,20,sd],[nn,mm,1,nd]);

THETA_BSOSE200_DJF_avg = mean(THETA_temp(:,:,1:3),3);
THETA_BSOSE200_DJFMAM_avg = mean(THETA_temp(:,:,1:6),3);
THETA_BSOSE200_DN_avg = mean(THETA_temp(:,:,1:12),3);
THETA_BSOSE200_JJA_avg = mean(THETA_temp(:,:,7:9),3);
THETA_BSOSE200_JAS_avg = mean(THETA_temp(:,:,8:10),3);
THETA_BSOSE200_JJASON_avg = mean(THETA_temp(:,:,7:12),3);
THETA_BSOSE200_JASOND_avg = mean(THETA_temp(:,:,8:13),3);
THETA_BSOSE200_JFM_avg = mean(THETA_temp(:,:,2:4),3);
THETA_BSOSE200_JFMAMJ_avg = mean(THETA_temp(:,:,2:7),3);
THETA_BSOSE200_JD_avg = mean(THETA_temp(:,:,2:13),3);

THETA_temp = ncread(str,'THETA',[lox,loy,25,sd],[nn,mm,1,nd]);

THETA_BSOSE300_DJF_avg = mean(THETA_temp(:,:,1:3),3);
THETA_BSOSE300_DJFMAM_avg = mean(THETA_temp(:,:,1:6),3);
THETA_BSOSE300_DN_avg = mean(THETA_temp(:,:,1:12),3);
THETA_BSOSE300_JJA_avg = mean(THETA_temp(:,:,7:9),3);
THETA_BSOSE300_JAS_avg = mean(THETA_temp(:,:,8:10),3);
THETA_BSOSE300_JJASON_avg = mean(THETA_temp(:,:,7:12),3);
THETA_BSOSE300_JASOND_avg = mean(THETA_temp(:,:,8:13),3);
THETA_BSOSE300_JFM_avg = mean(THETA_temp(:,:,2:4),3);
THETA_BSOSE300_JFMAMJ_avg = mean(THETA_temp(:,:,2:7),3);
THETA_BSOSE300_JD_avg = mean(THETA_temp(:,:,2:13),3);

THETA_temp = ncread(str,'THETA',[lox,loy,30,sd],[nn,mm,1,nd]);

THETA_BSOSE500_DJF_avg = mean(THETA_temp(:,:,1:3),3);
THETA_BSOSE500_DJFMAM_avg = mean(THETA_temp(:,:,1:6),3);
THETA_BSOSE500_DN_avg = mean(THETA_temp(:,:,1:12),3);
THETA_BSOSE500_JJA_avg = mean(THETA_temp(:,:,7:9),3);
THETA_BSOSE500_JAS_avg = mean(THETA_temp(:,:,8:10),3);
THETA_BSOSE500_JJASON_avg = mean(THETA_temp(:,:,7:12),3);
THETA_BSOSE500_JASOND_avg = mean(THETA_temp(:,:,8:13),3);
THETA_BSOSE500_JFM_avg = mean(THETA_temp(:,:,2:4),3);
THETA_BSOSE500_JFMAMJ_avg = mean(THETA_temp(:,:,2:7),3);
THETA_BSOSE500_JD_avg = mean(THETA_temp(:,:,2:13),3);

THETA_temp = ncread(str,'THETA',[lox,loy,36,sd],[nn,mm,1,nd]);

THETA_BSOSE1000_DJF_avg = mean(THETA_temp(:,:,1:3),3);
THETA_BSOSE1000_DJFMAM_avg = mean(THETA_temp(:,:,1:6),3);
THETA_BSOSE1000_DN_avg = mean(THETA_temp(:,:,1:12),3);
THETA_BSOSE1000_JJA_avg = mean(THETA_temp(:,:,7:9),3);
THETA_BSOSE1000_JAS_avg = mean(THETA_temp(:,:,8:10),3);
THETA_BSOSE1000_JJASON_avg = mean(THETA_temp(:,:,7:12),3);
THETA_BSOSE1000_JASOND_avg = mean(THETA_temp(:,:,8:13),3);
THETA_BSOSE1000_JFM_avg = mean(THETA_temp(:,:,2:4),3);
THETA_BSOSE1000_JFMAMJ_avg = mean(THETA_temp(:,:,2:7),3);
THETA_BSOSE1000_JD_avg = mean(THETA_temp(:,:,2:13),3);

THETA_temp = ncread(str,'THETA',[lox,loy,42,sd],[nn,mm,1,nd]);

THETA_BSOSE2000_DJF_avg = mean(THETA_temp(:,:,1:3),3);
THETA_BSOSE2000_DJFMAM_avg = mean(THETA_temp(:,:,1:6),3);
THETA_BSOSE2000_DN_avg = mean(THETA_temp(:,:,1:12),3);
THETA_BSOSE2000_JJA_avg = mean(THETA_temp(:,:,7:9),3);
THETA_BSOSE2000_JAS_avg = mean(THETA_temp(:,:,8:10),3);
THETA_BSOSE2000_JJASON_avg = mean(THETA_temp(:,:,7:12),3);
THETA_BSOSE2000_JASOND_avg = mean(THETA_temp(:,:,8:13),3);
THETA_BSOSE2000_JFM_avg = mean(THETA_temp(:,:,2:4),3);
THETA_BSOSE2000_JFMAMJ_avg = mean(THETA_temp(:,:,2:7),3);
THETA_BSOSE2000_JD_avg = mean(THETA_temp(:,:,2:13),3);

[m64,n64] = size(THETA_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            THETA_BSOSE_DJF_avg(ii,jj) = 9999999;
	        THETA_BSOSE_DJFMAM_avg(ii,jj) = 9999999;
            THETA_BSOSE_DN_avg(ii,jj) = 9999999;
            THETA_BSOSE_JJA_avg(ii,jj) = 9999999;
            THETA_BSOSE_JAS_avg(ii,jj) = 9999999;
            THETA_BSOSE_JJASON_avg(ii,jj) = 9999999;
            THETA_BSOSE_JASOND_avg(ii,jj) = 9999999;
            THETA_BSOSE_JFM_avg(ii,jj) = 9999999;
            THETA_BSOSE_JFMAMJ_avg(ii,jj) = 9999999;
            THETA_BSOSE_JD_avg(ii,jj) = 9999999;
            THETA_BSOSE105_DJF_avg(ii,jj) = 9999999;
	        THETA_BSOSE105_DJFMAM_avg(ii,jj) = 9999999;
            THETA_BSOSE105_DN_avg(ii,jj) = 9999999;
            THETA_BSOSE105_JJA_avg(ii,jj) = 9999999;
            THETA_BSOSE105_JAS_avg(ii,jj) = 9999999;
            THETA_BSOSE105_JJASON_avg(ii,jj) = 9999999;
            THETA_BSOSE105_JASOND_avg(ii,jj) = 9999999;
            THETA_BSOSE105_JFM_avg(ii,jj) = 9999999;
            THETA_BSOSE105_JFMAMJ_avg(ii,jj) = 9999999;
            THETA_BSOSE105_JD_avg(ii,jj) = 9999999;
            THETA_BSOSE200_DJF_avg(ii,jj) = 9999999;
	        THETA_BSOSE200_DJFMAM_avg(ii,jj) = 9999999;
            THETA_BSOSE200_DN_avg(ii,jj) = 9999999;
            THETA_BSOSE200_JJA_avg(ii,jj) = 9999999;
            THETA_BSOSE200_JAS_avg(ii,jj) = 9999999;
            THETA_BSOSE200_JJASON_avg(ii,jj) = 9999999;
            THETA_BSOSE200_JASOND_avg(ii,jj) = 9999999;
            THETA_BSOSE200_JFM_avg(ii,jj) = 9999999;
            THETA_BSOSE200_JFMAMJ_avg(ii,jj) = 9999999;
            THETA_BSOSE200_JD_avg(ii,jj) = 9999999;
            THETA_BSOSE300_DJF_avg(ii,jj) = 9999999;
	        THETA_BSOSE300_DJFMAM_avg(ii,jj) = 9999999;
            THETA_BSOSE300_DN_avg(ii,jj) = 9999999;
            THETA_BSOSE300_JJA_avg(ii,jj) = 9999999;
            THETA_BSOSE300_JAS_avg(ii,jj) = 9999999;
            THETA_BSOSE300_JJASON_avg(ii,jj) = 9999999;
            THETA_BSOSE300_JASOND_avg(ii,jj) = 9999999;
            THETA_BSOSE300_JFM_avg(ii,jj) = 9999999;
            THETA_BSOSE300_JFMAMJ_avg(ii,jj) = 9999999;
            THETA_BSOSE300_JD_avg(ii,jj) = 9999999;
            THETA_BSOSE500_DJF_avg(ii,jj) = 9999999;
	        THETA_BSOSE500_DJFMAM_avg(ii,jj) = 9999999;
            THETA_BSOSE500_DN_avg(ii,jj) = 9999999;
            THETA_BSOSE500_JJA_avg(ii,jj) = 9999999;
            THETA_BSOSE500_JAS_avg(ii,jj) = 9999999;
            THETA_BSOSE500_JJASON_avg(ii,jj) = 9999999;
            THETA_BSOSE500_JASOND_avg(ii,jj) = 9999999;
            THETA_BSOSE500_JFM_avg(ii,jj) = 9999999;
            THETA_BSOSE500_JFMAMJ_avg(ii,jj) = 9999999;
            THETA_BSOSE500_JD_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_DJF_avg(ii,jj) = 9999999;
	        THETA_BSOSE1000_DJFMAM_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_DN_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_JJA_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_JAS_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_JJASON_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_JASOND_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_JFM_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_JFMAMJ_avg(ii,jj) = 9999999;
            THETA_BSOSE1000_JD_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_DJF_avg(ii,jj) = 9999999;
	        THETA_BSOSE2000_DJFMAM_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_DN_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_JJA_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_JAS_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_JJASON_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_JASOND_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_JFM_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_JFMAMJ_avg(ii,jj) = 9999999;
            THETA_BSOSE2000_JD_avg(ii,jj) = 9999999;            
        end
    end
end

clear THETA_temp

% fid = fopen('THETA_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,THETA_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('THETA_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,THETA_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('THETA_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,THETA_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('THETA_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,THETA_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('THETA_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,THETA_BSOSE_JJA_avg,'single');
% fclose(fid);

fprintf('finished THETA \n')

%% THETA


%% ETAN
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_SSH.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

ETAN_temp = ncread(str,'ETAN',[lox,loy,sd],[nn,mm,nd]);

ETAN_BSOSE_DJF_avg = mean(ETAN_temp(:,:,1:DJF_length_time),3);
ETAN_BSOSE_DJFMAM_avg = mean(ETAN_temp(:,:,1:DM_length_time),3);
ETAN_BSOSE_DN_avg = mean(ETAN_temp(:,:,1:DD_length_time),3);
ETAN_BSOSE_JJA_avg = mean(ETAN_temp(:,:,JN_length_time:(JN_length_time+91)),3);
ETAN_BSOSE_JJASON_avg = mean(ETAN_temp(:,:,JN_length_time:DD_length_time),3);
ETAN_BSOSE_JFM_avg = mean(ETAN_temp(:,:,32:(DJF_length_time+31)),3);
ETAN_BSOSE_JFMAMJ_avg = mean(ETAN_temp(:,:,32:(DM_length_time+30)),3);
ETAN_BSOSE_JD_avg = mean(ETAN_temp(:,:,32:(DD_length_time+30)),3);
ETAN_BSOSE_JAS_avg = mean(ETAN_temp(:,:,(JN_length_time+30):(JN_length_time+121)),3);
ETAN_BSOSE_JASOND_avg = mean(ETAN_temp(:,:,(JN_length_time+30):(DD_length_time+30)),3);

ETAN_BSOSE_DJF_std = std(ETAN_temp(:,:,1:DJF_length_time),0,3);
ETAN_BSOSE_DJFMAM_std = std(ETAN_temp(:,:,1:DM_length_time),0,3);
ETAN_BSOSE_DN_std = std(ETAN_temp(:,:,1:DD_length_time),0,3);
ETAN_BSOSE_JJA_std = std(ETAN_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
ETAN_BSOSE_JJASON_std = std(ETAN_temp(:,:,JN_length_time:DD_length_time),0,3);
ETAN_BSOSE_JFM_std = std(ETAN_temp(:,:,32:(DJF_length_time+31)),0,3);
ETAN_BSOSE_JFMAMJ_std = std(ETAN_temp(:,:,32:(DM_length_time+30)),0,3);
ETAN_BSOSE_JD_std = std(ETAN_temp(:,:,32:(DD_length_time+30)),0,3);
ETAN_BSOSE_JAS_std = std(ETAN_temp(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
ETAN_BSOSE_JASOND_std = std(ETAN_temp(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);

clear ETAN_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            ETAN_BSOSE_JJA_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JJASON_avg(ii,jj) = 99999999;
            ETAN_BSOSE_DN_avg(ii,jj) = 99999999;
            ETAN_BSOSE_DJF_avg(ii,jj) = 99999999;
            ETAN_BSOSE_DJFMAM_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JAS_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JASOND_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JD_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JFM_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JFMAMJ_avg(ii,jj) = 99999999;
            ETAN_BSOSE_JJA_std(ii,jj) = 99999999;
            ETAN_BSOSE_JJASON_std(ii,jj) = 99999999;
            ETAN_BSOSE_DN_std(ii,jj) = 99999999;
            ETAN_BSOSE_DJF_std(ii,jj) = 99999999;
            ETAN_BSOSE_DJFMAM_std(ii,jj) = 99999999;
            ETAN_BSOSE_JAS_std(ii,jj) = 99999999;
            ETAN_BSOSE_JASOND_std(ii,jj) = 99999999;
            ETAN_BSOSE_JD_std(ii,jj) = 99999999;
            ETAN_BSOSE_JFM_std(ii,jj) = 99999999;
            ETAN_BSOSE_JFMAMJ_std(ii,jj) = 99999999;
        end
    end
end

% fid = fopen('ETAN_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,ETAN_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_DN_std.bin','w','b');
% fwrite(fid,ETAN_BSOSE_DN_std,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,ETAN_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_DJFMAM_std.bin','w','b');
% fwrite(fid,ETAN_BSOSE_DJFMAM_std,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,ETAN_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_DJF_std.bin','w','b');
% fwrite(fid,ETAN_BSOSE_DJF_std,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,ETAN_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_JJASON_std.bin','w','b');
% fwrite(fid,ETAN_BSOSE_JJASON_std,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,ETAN_BSOSE_JJA_avg,'single');
% fclose(fid);
% fid = fopen('ETAN_BSOSE_JJA_std.bin','w','b');
% fwrite(fid,ETAN_BSOSE_JJA_std,'single');
% fclose(fid);

fprintf('finished ETAN \n')

%% ETAN

%% MLD
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_MLD.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

MLD_temp = ncread(str,'BLGMLD',[lox,loy,sd],[nn,mm,nd]);

MLD_BSOSE_DJF_avg = mean(MLD_temp(:,:,1:DJF_length_time),3);
MLD_BSOSE_DJFMAM_avg = mean(MLD_temp(:,:,1:DM_length_time),3);
MLD_BSOSE_DN_avg = mean(MLD_temp(:,:,1:DD_length_time),3);
MLD_BSOSE_JJA_avg = mean(MLD_temp(:,:,JN_length_time:(JN_length_time+91)),3);
MLD_BSOSE_JJASON_avg = mean(MLD_temp(:,:,JN_length_time:DD_length_time),3);
MLD_BSOSE_JFM_avg = mean(MLD_temp(:,:,32:(DJF_length_time+31)),3);
MLD_BSOSE_JFMAMJ_avg = mean(MLD_temp(:,:,32:(DM_length_time+30)),3);
MLD_BSOSE_JD_avg = mean(MLD_temp(:,:,32:(DD_length_time+30)),3);
MLD_BSOSE_JAS_avg = mean(MLD_temp(:,:,(JN_length_time+30):(JN_length_time+121)),3);
MLD_BSOSE_JASOND_avg = mean(MLD_temp(:,:,(JN_length_time+30):(DD_length_time+30)),3);

MLD_BSOSE_DJF_std = std(MLD_temp(:,:,1:DJF_length_time),0,3);
MLD_BSOSE_DJFMAM_std = std(MLD_temp(:,:,1:DM_length_time),0,3);
MLD_BSOSE_DN_std = std(MLD_temp(:,:,1:DD_length_time),0,3);
MLD_BSOSE_JJA_std = std(MLD_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
MLD_BSOSE_JJASON_std = std(MLD_temp(:,:,JN_length_time:DD_length_time),0,3);
MLD_BSOSE_JFM_std = std(MLD_temp(:,:,32:(DJF_length_time+31)),0,3);
MLD_BSOSE_JFMAMJ_std = std(MLD_temp(:,:,32:(DM_length_time+30)),0,3);
MLD_BSOSE_JD_std = std(MLD_temp(:,:,32:(DD_length_time+30)),0,3);
MLD_BSOSE_JAS_std = std(MLD_temp(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
MLD_BSOSE_JASOND_std = std(MLD_temp(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);

clear MLD_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            MLD_BSOSE_JJA_avg(ii,jj) = 99999999;
            MLD_BSOSE_JJASON_avg(ii,jj) = 99999999;
            MLD_BSOSE_DN_avg(ii,jj) = 99999999;
            MLD_BSOSE_DJF_avg(ii,jj) = 99999999;
            MLD_BSOSE_DJFMAM_avg(ii,jj) = 99999999;
            MLD_BSOSE_JAS_avg(ii,jj) = 99999999;
            MLD_BSOSE_JASOND_avg(ii,jj) = 99999999;
            MLD_BSOSE_JD_avg(ii,jj) = 99999999;
            MLD_BSOSE_JFM_avg(ii,jj) = 99999999;
            MLD_BSOSE_JFMAMJ_avg(ii,jj) = 99999999;
            MLD_BSOSE_JJA_std(ii,jj) = 99999999;
            MLD_BSOSE_JJASON_std(ii,jj) = 99999999;
            MLD_BSOSE_DN_std(ii,jj) = 99999999;
            MLD_BSOSE_DJF_std(ii,jj) = 99999999;
            MLD_BSOSE_DJFMAM_std(ii,jj) = 99999999;
            MLD_BSOSE_JAS_std(ii,jj) = 99999999;
            MLD_BSOSE_JASOND_std(ii,jj) = 99999999;
            MLD_BSOSE_JD_std(ii,jj) = 99999999;
            MLD_BSOSE_JFM_std(ii,jj) = 99999999;
            MLD_BSOSE_JFMAMJ_std(ii,jj) = 99999999;
        end
    end
end

% fid = fopen('MLD_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,MLD_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_DN_std.bin','w','b');
% fwrite(fid,MLD_BSOSE_DN_std,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,MLD_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_DJFMAM_std.bin','w','b');
% fwrite(fid,MLD_BSOSE_DJFMAM_std,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,MLD_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_DJF_std.bin','w','b');
% fwrite(fid,MLD_BSOSE_DJF_std,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,MLD_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_JJASON_std.bin','w','b');
% fwrite(fid,MLD_BSOSE_JJASON_std,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,MLD_BSOSE_JJA_avg,'single');
% fclose(fid);
% fid = fopen('MLD_BSOSE_JJA_std.bin','w','b');
% fwrite(fid,MLD_BSOSE_JJA_std,'single');
% fclose(fid);

fprintf('finished MLD \n')

%% MLD

%% WVEL
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Wvel.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

WVEL_temp = ncread(str,'WVEL',[lox,loy,1,sd],[nn,mm,1,nd]);

WVEL_BSOSE_DJF_avg = mean(WVEL_temp(:,:,1:DJF_length_time),3);
WVEL_BSOSE_DJFMAM_avg = mean(WVEL_temp(:,:,1:DM_length_time),3);
WVEL_BSOSE_DN_avg = mean(WVEL_temp(:,:,1:DD_length_time),3);
WVEL_BSOSE_JJA_avg = mean(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),3);
WVEL_BSOSE_JJASON_avg = mean(WVEL_temp(:,:,JN_length_time:DD_length_time),3);
WVEL_BSOSE_JFM_avg = mean(WVEL_temp(:,:,32:(DJF_length_time+31)),3);
WVEL_BSOSE_JFMAMJ_avg = mean(WVEL_temp(:,:,32:(DM_length_time+30)),3);
WVEL_BSOSE_JD_avg = mean(WVEL_temp(:,:,32:(DD_length_time+30)),3);
WVEL_BSOSE_JAS_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),3);
WVEL_BSOSE_JASOND_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),3);

WVEL_BSOSE_DJF_std = std(WVEL_temp(:,:,1:DJF_length_time),0,3);
WVEL_BSOSE_DJFMAM_std = std(WVEL_temp(:,:,1:DM_length_time),0,3);
WVEL_BSOSE_DN_std = std(WVEL_temp(:,:,1:DD_length_time),0,3);
WVEL_BSOSE_JJA_std = std(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
WVEL_BSOSE_JJASON_std = std(WVEL_temp(:,:,JN_length_time:DD_length_time),0,3);
WVEL_BSOSE_JFM_std = std(WVEL_temp(:,:,32:(DJF_length_time+31)),0,3);
WVEL_BSOSE_JFMAMJ_std = std(WVEL_temp(:,:,32:(DM_length_time+30)),0,3);
WVEL_BSOSE_JD_std = std(WVEL_temp(:,:,32:(DD_length_time+30)),0,3);
WVEL_BSOSE_JAS_std = std(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
WVEL_BSOSE_JASOND_std = std(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);

WVEL_temp = ncread(str,'WVEL',[lox,loy,13,sd],[nn,mm,1,nd]);

WVEL100_BSOSE_DJF_avg = mean(WVEL_temp(:,:,1:DJF_length_time),3);
WVEL100_BSOSE_DJFMAM_avg = mean(WVEL_temp(:,:,1:DM_length_time),3);
WVEL100_BSOSE_DN_avg = mean(WVEL_temp(:,:,1:DD_length_time),3);
WVEL100_BSOSE_JJA_avg = mean(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),3);
WVEL100_BSOSE_JJASON_avg = mean(WVEL_temp(:,:,JN_length_time:DD_length_time),3);
WVEL100_BSOSE_JFM_avg = mean(WVEL_temp(:,:,32:(DJF_length_time+31)),3);
WVEL100_BSOSE_JFMAMJ_avg = mean(WVEL_temp(:,:,32:(DM_length_time+30)),3);
WVEL100_BSOSE_JD_avg = mean(WVEL_temp(:,:,32:(DD_length_time+30)),3);
WVEL100_BSOSE_JAS_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),3);
WVEL100_BSOSE_JASOND_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),3);

WVEL100_BSOSE_DJF_std = std(WVEL_temp(:,:,1:DJF_length_time),0,3);
WVEL100_BSOSE_DJFMAM_std = std(WVEL_temp(:,:,1:DM_length_time),0,3);
WVEL100_BSOSE_DN_std = std(WVEL_temp(:,:,1:DD_length_time),0,3);
WVEL100_BSOSE_JJA_std = std(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
WVEL100_BSOSE_JJASON_std = std(WVEL_temp(:,:,JN_length_time:DD_length_time),0,3);
WVEL100_BSOSE_JFM_std = std(WVEL_temp(:,:,32:(DJF_length_time+31)),0,3);
WVEL100_BSOSE_JFMAMJ_std = std(WVEL_temp(:,:,32:(DM_length_time+30)),0,3);
WVEL100_BSOSE_JD_std = std(WVEL_temp(:,:,32:(DD_length_time+30)),0,3);
WVEL100_BSOSE_JAS_std = std(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
WVEL100_BSOSE_JASOND_std = std(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);

WVEL_temp = ncread(str,'WVEL',[lox,loy,20,sd],[nn,mm,1,nd]);

WVEL190_BSOSE_DJF_avg = mean(WVEL_temp(:,:,1:DJF_length_time),3);
WVEL190_BSOSE_DJFMAM_avg = mean(WVEL_temp(:,:,1:DM_length_time),3);
WVEL190_BSOSE_DN_avg = mean(WVEL_temp(:,:,1:DD_length_time),3);
WVEL190_BSOSE_JJA_avg = mean(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),3);
WVEL190_BSOSE_JJASON_avg = mean(WVEL_temp(:,:,JN_length_time:DD_length_time),3);
WVEL190_BSOSE_JFM_avg = mean(WVEL_temp(:,:,32:(DJF_length_time+31)),3);
WVEL190_BSOSE_JFMAMJ_avg = mean(WVEL_temp(:,:,32:(DM_length_time+30)),3);
WVEL190_BSOSE_JD_avg = mean(WVEL_temp(:,:,32:(DD_length_time+30)),3);
WVEL190_BSOSE_JAS_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),3);
WVEL190_BSOSE_JASOND_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),3);

WVEL190_BSOSE_DJF_std = std(WVEL_temp(:,:,1:DJF_length_time),0,3);
WVEL190_BSOSE_DJFMAM_std = std(WVEL_temp(:,:,1:DM_length_time),0,3);
WVEL190_BSOSE_DN_std = std(WVEL_temp(:,:,1:DD_length_time),0,3);
WVEL190_BSOSE_JJA_std = std(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
WVEL190_BSOSE_JJASON_std = std(WVEL_temp(:,:,JN_length_time:DD_length_time),0,3);
WVEL190_BSOSE_JFM_std = std(WVEL_temp(:,:,32:(DJF_length_time+31)),0,3);
WVEL190_BSOSE_JFMAMJ_std = std(WVEL_temp(:,:,32:(DM_length_time+30)),0,3);
WVEL190_BSOSE_JD_std = std(WVEL_temp(:,:,32:(DD_length_time+30)),0,3);
WVEL190_BSOSE_JAS_std = std(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
WVEL190_BSOSE_JASOND_std = std(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);

WVEL_temp = ncread(str,'WVEL',[lox,loy,25,sd],[nn,mm,1,nd]);

WVEL290_BSOSE_DJF_avg = mean(WVEL_temp(:,:,1:DJF_length_time),3);
WVEL290_BSOSE_DJFMAM_avg = mean(WVEL_temp(:,:,1:DM_length_time),3);
WVEL290_BSOSE_DN_avg = mean(WVEL_temp(:,:,1:DD_length_time),3);
WVEL290_BSOSE_JJA_avg = mean(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),3);
WVEL290_BSOSE_JJASON_avg = mean(WVEL_temp(:,:,JN_length_time:DD_length_time),3);
WVEL290_BSOSE_JFM_avg = mean(WVEL_temp(:,:,32:(DJF_length_time+31)),3);
WVEL290_BSOSE_JFMAMJ_avg = mean(WVEL_temp(:,:,32:(DM_length_time+30)),3);
WVEL290_BSOSE_JD_avg = mean(WVEL_temp(:,:,32:(DD_length_time+30)),3);
WVEL290_BSOSE_JAS_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),3);
WVEL290_BSOSE_JASOND_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),3);

WVEL290_BSOSE_DJF_std = std(WVEL_temp(:,:,1:DJF_length_time),0,3);
WVEL290_BSOSE_DJFMAM_std = std(WVEL_temp(:,:,1:DM_length_time),0,3);
WVEL290_BSOSE_DN_std = std(WVEL_temp(:,:,1:DD_length_time),0,3);
WVEL290_BSOSE_JJA_std = std(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
WVEL290_BSOSE_JJASON_std = std(WVEL_temp(:,:,JN_length_time:DD_length_time),0,3);
WVEL290_BSOSE_JFM_std = std(WVEL_temp(:,:,32:(DJF_length_time+31)),0,3);
WVEL290_BSOSE_JFMAMJ_std = std(WVEL_temp(:,:,32:(DM_length_time+30)),0,3);
WVEL290_BSOSE_JD_std = std(WVEL_temp(:,:,32:(DD_length_time+30)),0,3);
WVEL290_BSOSE_JAS_std = std(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
WVEL290_BSOSE_JASOND_std = std(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);

WVEL_temp = ncread(str,'WVEL',[lox,loy,30,sd],[nn,mm,1,nd]);

WVEL475_BSOSE_DJF_avg = mean(WVEL_temp(:,:,1:DJF_length_time),3);
WVEL475_BSOSE_DJFMAM_avg = mean(WVEL_temp(:,:,1:DM_length_time),3);
WVEL475_BSOSE_DN_avg = mean(WVEL_temp(:,:,1:DD_length_time),3);
WVEL475_BSOSE_JJA_avg = mean(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),3);
WVEL475_BSOSE_JJASON_avg = mean(WVEL_temp(:,:,JN_length_time:DD_length_time),3);
WVEL475_BSOSE_JFM_avg = mean(WVEL_temp(:,:,32:(DJF_length_time+31)),3);
WVEL475_BSOSE_JFMAMJ_avg = mean(WVEL_temp(:,:,32:(DM_length_time+30)),3);
WVEL475_BSOSE_JD_avg = mean(WVEL_temp(:,:,32:(DD_length_time+30)),3);
WVEL475_BSOSE_JAS_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),3);
WVEL475_BSOSE_JASOND_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),3);

WVEL475_BSOSE_DJF_std = std(WVEL_temp(:,:,1:DJF_length_time),0,3);
WVEL475_BSOSE_DJFMAM_std = std(WVEL_temp(:,:,1:DM_length_time),0,3);
WVEL475_BSOSE_DN_std = std(WVEL_temp(:,:,1:DD_length_time),0,3);
WVEL475_BSOSE_JJA_std = std(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
WVEL475_BSOSE_JJASON_std = std(WVEL_temp(:,:,JN_length_time:DD_length_time),0,3);
WVEL475_BSOSE_JFM_std = std(WVEL_temp(:,:,32:(DJF_length_time+31)),0,3);
WVEL475_BSOSE_JFMAMJ_std = std(WVEL_temp(:,:,32:(DM_length_time+30)),0,3);
WVEL475_BSOSE_JD_std = std(WVEL_temp(:,:,32:(DD_length_time+30)),0,3);
WVEL475_BSOSE_JAS_std = std(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
WVEL475_BSOSE_JASOND_std = std(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);

WVEL_temp = ncread(str,'WVEL',[lox,loy,36,sd],[nn,mm,1,nd]);

WVEL950_BSOSE_DJF_avg = mean(WVEL_temp(:,:,1:DJF_length_time),3);
WVEL950_BSOSE_DJFMAM_avg = mean(WVEL_temp(:,:,1:DM_length_time),3);
WVEL950_BSOSE_DN_avg = mean(WVEL_temp(:,:,1:DD_length_time),3);
WVEL950_BSOSE_JJA_avg = mean(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),3);
WVEL950_BSOSE_JJASON_avg = mean(WVEL_temp(:,:,JN_length_time:DD_length_time),3);
WVEL950_BSOSE_JFM_avg = mean(WVEL_temp(:,:,32:(DJF_length_time+31)),3);
WVEL950_BSOSE_JFMAMJ_avg = mean(WVEL_temp(:,:,32:(DM_length_time+30)),3);
WVEL950_BSOSE_JD_avg = mean(WVEL_temp(:,:,32:(DD_length_time+30)),3);
WVEL950_BSOSE_JAS_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),3);
WVEL950_BSOSE_JASOND_avg = mean(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),3);

WVEL950_BSOSE_DJF_std = std(WVEL_temp(:,:,1:DJF_length_time),0,3);
WVEL950_BSOSE_DJFMAM_std = std(WVEL_temp(:,:,1:DM_length_time),0,3);
WVEL950_BSOSE_DN_std = std(WVEL_temp(:,:,1:DD_length_time),0,3);
WVEL950_BSOSE_JJA_std = std(WVEL_temp(:,:,JN_length_time:(JN_length_time+91)),0,3);
WVEL950_BSOSE_JJASON_std = std(WVEL_temp(:,:,JN_length_time:DD_length_time),0,3);
WVEL950_BSOSE_JFM_std = std(WVEL_temp(:,:,32:(DJF_length_time+31)),0,3);
WVEL950_BSOSE_JFMAMJ_std = std(WVEL_temp(:,:,32:(DM_length_time+30)),0,3);
WVEL950_BSOSE_JD_std = std(WVEL_temp(:,:,32:(DD_length_time+30)),0,3);
WVEL950_BSOSE_JAS_std = std(WVEL_temp(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
WVEL950_BSOSE_JASOND_std = std(WVEL_temp(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);


clear WVEL_temp

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            WVEL_BSOSE_JJA_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JJASON_avg(ii,jj) = 99999999;
            WVEL_BSOSE_DN_avg(ii,jj) = 99999999;
            WVEL_BSOSE_DJF_avg(ii,jj) = 99999999;
            WVEL_BSOSE_DJFMAM_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JAS_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JASOND_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JD_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JFM_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JFMAMJ_avg(ii,jj) = 99999999;
            WVEL_BSOSE_JJA_std(ii,jj) = 99999999;
            WVEL_BSOSE_JJASON_std(ii,jj) = 99999999;
            WVEL_BSOSE_DN_std(ii,jj) = 99999999;
            WVEL_BSOSE_DJF_std(ii,jj) = 99999999;
            WVEL_BSOSE_DJFMAM_std(ii,jj) = 99999999;
            WVEL_BSOSE_JAS_std(ii,jj) = 99999999;
            WVEL_BSOSE_JASOND_std(ii,jj) = 99999999;
            WVEL_BSOSE_JD_std(ii,jj) = 99999999;
            WVEL_BSOSE_JFM_std(ii,jj) = 99999999;
            WVEL_BSOSE_JFMAMJ_std(ii,jj) = 99999999;
            WVEL100_BSOSE_JJA_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_JJASON_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_DN_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_DJF_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_DJFMAM_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_JAS_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_JASOND_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_JD_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_JFM_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_JFMAMJ_avg(ii,jj) = 99999999;
            WVEL100_BSOSE_JJA_std(ii,jj) = 99999999;
            WVEL100_BSOSE_JJASON_std(ii,jj) = 99999999;
            WVEL100_BSOSE_DN_std(ii,jj) = 99999999;
            WVEL100_BSOSE_DJF_std(ii,jj) = 99999999;
            WVEL100_BSOSE_DJFMAM_std(ii,jj) = 99999999;
            WVEL100_BSOSE_JAS_std(ii,jj) = 99999999;
            WVEL100_BSOSE_JASOND_std(ii,jj) = 99999999;
            WVEL100_BSOSE_JD_std(ii,jj) = 99999999;
            WVEL100_BSOSE_JFM_std(ii,jj) = 99999999;
            WVEL100_BSOSE_JFMAMJ_std(ii,jj) = 99999999;
            WVEL190_BSOSE_JJA_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_JJASON_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_DN_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_DJF_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_DJFMAM_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_JAS_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_JASOND_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_JD_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_JFM_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_JFMAMJ_avg(ii,jj) = 99999999;
            WVEL190_BSOSE_JJA_std(ii,jj) = 99999999;
            WVEL190_BSOSE_JJASON_std(ii,jj) = 99999999;
            WVEL190_BSOSE_DN_std(ii,jj) = 99999999;
            WVEL190_BSOSE_DJF_std(ii,jj) = 99999999;
            WVEL190_BSOSE_DJFMAM_std(ii,jj) = 99999999;
            WVEL190_BSOSE_JAS_std(ii,jj) = 99999999;
            WVEL190_BSOSE_JASOND_std(ii,jj) = 99999999;
            WVEL190_BSOSE_JD_std(ii,jj) = 99999999;
            WVEL190_BSOSE_JFM_std(ii,jj) = 99999999;
            WVEL190_BSOSE_JFMAMJ_std(ii,jj) = 99999999;
            WVEL290_BSOSE_JJA_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_JJASON_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_DN_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_DJF_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_DJFMAM_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_JAS_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_JASOND_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_JD_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_JFM_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_JFMAMJ_avg(ii,jj) = 99999999;
            WVEL290_BSOSE_JJA_std(ii,jj) = 99999999;
            WVEL290_BSOSE_JJASON_std(ii,jj) = 99999999;
            WVEL290_BSOSE_DN_std(ii,jj) = 99999999;
            WVEL290_BSOSE_DJF_std(ii,jj) = 99999999;
            WVEL290_BSOSE_DJFMAM_std(ii,jj) = 99999999;
            WVEL290_BSOSE_JAS_std(ii,jj) = 99999999;
            WVEL290_BSOSE_JASOND_std(ii,jj) = 99999999;
            WVEL290_BSOSE_JD_std(ii,jj) = 99999999;
            WVEL290_BSOSE_JFM_std(ii,jj) = 99999999;
            WVEL290_BSOSE_JFMAMJ_std(ii,jj) = 99999999;
            WVEL475_BSOSE_JJA_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_JJASON_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_DN_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_DJF_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_DJFMAM_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_JAS_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_JASOND_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_JD_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_JFM_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_JFMAMJ_avg(ii,jj) = 99999999;
            WVEL475_BSOSE_JJA_std(ii,jj) = 99999999;
            WVEL475_BSOSE_JJASON_std(ii,jj) = 99999999;
            WVEL475_BSOSE_DN_std(ii,jj) = 99999999;
            WVEL475_BSOSE_DJF_std(ii,jj) = 99999999;
            WVEL475_BSOSE_DJFMAM_std(ii,jj) = 99999999;
            WVEL475_BSOSE_JAS_std(ii,jj) = 99999999;
            WVEL475_BSOSE_JASOND_std(ii,jj) = 99999999;
            WVEL475_BSOSE_JD_std(ii,jj) = 99999999;
            WVEL475_BSOSE_JFM_std(ii,jj) = 99999999;
            WVEL475_BSOSE_JFMAMJ_std(ii,jj) = 99999999;
            WVEL950_BSOSE_JJA_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_JJASON_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_DN_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_DJF_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_DJFMAM_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_JAS_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_JASOND_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_JD_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_JFM_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_JFMAMJ_avg(ii,jj) = 99999999;
            WVEL950_BSOSE_JJA_std(ii,jj) = 99999999;
            WVEL950_BSOSE_JJASON_std(ii,jj) = 99999999;
            WVEL950_BSOSE_DN_std(ii,jj) = 99999999;
            WVEL950_BSOSE_DJF_std(ii,jj) = 99999999;
            WVEL950_BSOSE_DJFMAM_std(ii,jj) = 99999999;
            WVEL950_BSOSE_JAS_std(ii,jj) = 99999999;
            WVEL950_BSOSE_JASOND_std(ii,jj) = 99999999;
            WVEL950_BSOSE_JD_std(ii,jj) = 99999999;
            WVEL950_BSOSE_JFM_std(ii,jj) = 99999999;
            WVEL950_BSOSE_JFMAMJ_std(ii,jj) = 99999999;
        end
    end
end

% fid = fopen('WVEL_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,WVEL_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_DN_std.bin','w','b');
% fwrite(fid,WVEL_BSOSE_DN_std,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,WVEL_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_DJFMAM_std.bin','w','b');
% fwrite(fid,WVEL_BSOSE_DJFMAM_std,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,WVEL_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_DJF_std.bin','w','b');
% fwrite(fid,WVEL_BSOSE_DJF_std,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,WVEL_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_JJASON_std.bin','w','b');
% fwrite(fid,WVEL_BSOSE_JJASON_std,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,WVEL_BSOSE_JJA_avg,'single');
% fclose(fid);
% fid = fopen('WVEL_BSOSE_JJA_std.bin','w','b');
% fwrite(fid,WVEL_BSOSE_JJA_std,'single');
% fclose(fid);

fprintf('finished WVEL \n')

%% WVEL

%% SALT
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Salt.nc';
sd = 48;
nd = 13;

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

SALT_temp = ncread(str,'SALT',[lox,loy,1,sd],[nn,mm,1,nd]);

SALT_BSOSE_DJF_avg = mean(SALT_temp(:,:,1:3),3);
SALT_BSOSE_DJFMAM_avg = mean(SALT_temp(:,:,1:6),3);
SALT_BSOSE_DN_avg = mean(SALT_temp(:,:,1:12),3);
SALT_BSOSE_JJA_avg = mean(SALT_temp(:,:,7:9),3);
SALT_BSOSE_JAS_avg = mean(SALT_temp(:,:,8:10),3);
SALT_BSOSE_JJASON_avg = mean(SALT_temp(:,:,7:12),3);
SALT_BSOSE_JASOND_avg = mean(SALT_temp(:,:,8:13),3);
SALT_BSOSE_JFM_avg = mean(SALT_temp(:,:,2:4),3);
SALT_BSOSE_JFMAMJ_avg = mean(SALT_temp(:,:,2:7),3);
SALT_BSOSE_JD_avg = mean(SALT_temp(:,:,2:13),3);

SALT_temp = ncread(str,'SALT',[lox,loy,13,sd],[nn,mm,1,nd]);

SALT_BSOSE105_DJF_avg = mean(SALT_temp(:,:,1:3),3);
SALT_BSOSE105_DJFMAM_avg = mean(SALT_temp(:,:,1:6),3);
SALT_BSOSE105_DN_avg = mean(SALT_temp(:,:,1:12),3);
SALT_BSOSE105_JJA_avg = mean(SALT_temp(:,:,7:9),3);
SALT_BSOSE105_JAS_avg = mean(SALT_temp(:,:,8:10),3);
SALT_BSOSE105_JJASON_avg = mean(SALT_temp(:,:,7:12),3);
SALT_BSOSE105_JASOND_avg = mean(SALT_temp(:,:,8:13),3);
SALT_BSOSE105_JFM_avg = mean(SALT_temp(:,:,2:4),3);
SALT_BSOSE105_JFMAMJ_avg = mean(SALT_temp(:,:,2:7),3);
SALT_BSOSE105_JD_avg = mean(SALT_temp(:,:,2:13),3);

SALT_temp = ncread(str,'SALT',[lox,loy,20,sd],[nn,mm,1,nd]);

SALT_BSOSE200_DJF_avg = mean(SALT_temp(:,:,1:3),3);
SALT_BSOSE200_DJFMAM_avg = mean(SALT_temp(:,:,1:6),3);
SALT_BSOSE200_DN_avg = mean(SALT_temp(:,:,1:12),3);
SALT_BSOSE200_JJA_avg = mean(SALT_temp(:,:,7:9),3);
SALT_BSOSE200_JAS_avg = mean(SALT_temp(:,:,8:10),3);
SALT_BSOSE200_JJASON_avg = mean(SALT_temp(:,:,7:12),3);
SALT_BSOSE200_JASOND_avg = mean(SALT_temp(:,:,8:13),3);
SALT_BSOSE200_JFM_avg = mean(SALT_temp(:,:,2:4),3);
SALT_BSOSE200_JFMAMJ_avg = mean(SALT_temp(:,:,2:7),3);
SALT_BSOSE200_JD_avg = mean(SALT_temp(:,:,2:13),3);

SALT_temp = ncread(str,'SALT',[lox,loy,25,sd],[nn,mm,1,nd]);

SALT_BSOSE300_DJF_avg = mean(SALT_temp(:,:,1:3),3);
SALT_BSOSE300_DJFMAM_avg = mean(SALT_temp(:,:,1:6),3);
SALT_BSOSE300_DN_avg = mean(SALT_temp(:,:,1:12),3);
SALT_BSOSE300_JJA_avg = mean(SALT_temp(:,:,7:9),3);
SALT_BSOSE300_JAS_avg = mean(SALT_temp(:,:,8:10),3);
SALT_BSOSE300_JJASON_avg = mean(SALT_temp(:,:,7:12),3);
SALT_BSOSE300_JASOND_avg = mean(SALT_temp(:,:,8:13),3);
SALT_BSOSE300_JFM_avg = mean(SALT_temp(:,:,2:4),3);
SALT_BSOSE300_JFMAMJ_avg = mean(SALT_temp(:,:,2:7),3);
SALT_BSOSE300_JD_avg = mean(SALT_temp(:,:,2:13),3);

SALT_temp = ncread(str,'SALT',[lox,loy,30,sd],[nn,mm,1,nd]);

SALT_BSOSE500_DJF_avg = mean(SALT_temp(:,:,1:3),3);
SALT_BSOSE500_DJFMAM_avg = mean(SALT_temp(:,:,1:6),3);
SALT_BSOSE500_DN_avg = mean(SALT_temp(:,:,1:12),3);
SALT_BSOSE500_JJA_avg = mean(SALT_temp(:,:,7:9),3);
SALT_BSOSE500_JAS_avg = mean(SALT_temp(:,:,8:10),3);
SALT_BSOSE500_JJASON_avg = mean(SALT_temp(:,:,7:12),3);
SALT_BSOSE500_JASOND_avg = mean(SALT_temp(:,:,8:13),3);
SALT_BSOSE500_JFM_avg = mean(SALT_temp(:,:,2:4),3);
SALT_BSOSE500_JFMAMJ_avg = mean(SALT_temp(:,:,2:7),3);
SALT_BSOSE500_JD_avg = mean(SALT_temp(:,:,2:13),3);

SALT_temp = ncread(str,'SALT',[lox,loy,36,sd],[nn,mm,1,nd]);

SALT_BSOSE1000_DJF_avg = mean(SALT_temp(:,:,1:3),3);
SALT_BSOSE1000_DJFMAM_avg = mean(SALT_temp(:,:,1:6),3);
SALT_BSOSE1000_DN_avg = mean(SALT_temp(:,:,1:12),3);
SALT_BSOSE1000_JJA_avg = mean(SALT_temp(:,:,7:9),3);
SALT_BSOSE1000_JAS_avg = mean(SALT_temp(:,:,8:10),3);
SALT_BSOSE1000_JJASON_avg = mean(SALT_temp(:,:,7:12),3);
SALT_BSOSE1000_JASOND_avg = mean(SALT_temp(:,:,8:13),3);
SALT_BSOSE1000_JFM_avg = mean(SALT_temp(:,:,2:4),3);
SALT_BSOSE1000_JFMAMJ_avg = mean(SALT_temp(:,:,2:7),3);
SALT_BSOSE1000_JD_avg = mean(SALT_temp(:,:,2:13),3);

SALT_temp = ncread(str,'SALT',[lox,loy,42,sd],[nn,mm,1,nd]);

SALT_BSOSE2000_DJF_avg = mean(SALT_temp(:,:,1:3),3);
SALT_BSOSE2000_DJFMAM_avg = mean(SALT_temp(:,:,1:6),3);
SALT_BSOSE2000_DN_avg = mean(SALT_temp(:,:,1:12),3);
SALT_BSOSE2000_JJA_avg = mean(SALT_temp(:,:,7:9),3);
SALT_BSOSE2000_JAS_avg = mean(SALT_temp(:,:,8:10),3);
SALT_BSOSE2000_JJASON_avg = mean(SALT_temp(:,:,7:12),3);
SALT_BSOSE2000_JASOND_avg = mean(SALT_temp(:,:,8:13),3);
SALT_BSOSE2000_JFM_avg = mean(SALT_temp(:,:,2:4),3);
SALT_BSOSE2000_JFMAMJ_avg = mean(SALT_temp(:,:,2:7),3);
SALT_BSOSE2000_JD_avg = mean(SALT_temp(:,:,2:13),3);

[m64,n64] = size(SALT_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            SALT_BSOSE_DJF_avg(ii,jj) = 9999999;
	        SALT_BSOSE_DJFMAM_avg(ii,jj) = 9999999;
            SALT_BSOSE_DN_avg(ii,jj) = 9999999;
            SALT_BSOSE_JJA_avg(ii,jj) = 9999999;
            SALT_BSOSE_JAS_avg(ii,jj) = 9999999;
            SALT_BSOSE_JJASON_avg(ii,jj) = 9999999;
            SALT_BSOSE_JASOND_avg(ii,jj) = 9999999;
            SALT_BSOSE_JFM_avg(ii,jj) = 9999999;
            SALT_BSOSE_JFMAMJ_avg(ii,jj) = 9999999;
            SALT_BSOSE_JD_avg(ii,jj) = 9999999;
            SALT_BSOSE105_DJF_avg(ii,jj) = 9999999;
	        SALT_BSOSE105_DJFMAM_avg(ii,jj) = 9999999;
            SALT_BSOSE105_DN_avg(ii,jj) = 9999999;
            SALT_BSOSE105_JJA_avg(ii,jj) = 9999999;
            SALT_BSOSE105_JAS_avg(ii,jj) = 9999999;
            SALT_BSOSE105_JJASON_avg(ii,jj) = 9999999;
            SALT_BSOSE105_JASOND_avg(ii,jj) = 9999999;
            SALT_BSOSE105_JFM_avg(ii,jj) = 9999999;
            SALT_BSOSE105_JFMAMJ_avg(ii,jj) = 9999999;
            SALT_BSOSE105_JD_avg(ii,jj) = 9999999;
            SALT_BSOSE200_DJF_avg(ii,jj) = 9999999;
	        SALT_BSOSE200_DJFMAM_avg(ii,jj) = 9999999;
            SALT_BSOSE200_DN_avg(ii,jj) = 9999999;
            SALT_BSOSE200_JJA_avg(ii,jj) = 9999999;
            SALT_BSOSE200_JAS_avg(ii,jj) = 9999999;
            SALT_BSOSE200_JJASON_avg(ii,jj) = 9999999;
            SALT_BSOSE200_JASOND_avg(ii,jj) = 9999999;
            SALT_BSOSE200_JFM_avg(ii,jj) = 9999999;
            SALT_BSOSE200_JFMAMJ_avg(ii,jj) = 9999999;
            SALT_BSOSE200_JD_avg(ii,jj) = 9999999;
            SALT_BSOSE300_DJF_avg(ii,jj) = 9999999;
	        SALT_BSOSE300_DJFMAM_avg(ii,jj) = 9999999;
            SALT_BSOSE300_DN_avg(ii,jj) = 9999999;
            SALT_BSOSE300_JJA_avg(ii,jj) = 9999999;
            SALT_BSOSE300_JAS_avg(ii,jj) = 9999999;
            SALT_BSOSE300_JJASON_avg(ii,jj) = 9999999;
            SALT_BSOSE300_JASOND_avg(ii,jj) = 9999999;
            SALT_BSOSE300_JFM_avg(ii,jj) = 9999999;
            SALT_BSOSE300_JFMAMJ_avg(ii,jj) = 9999999;
            SALT_BSOSE300_JD_avg(ii,jj) = 9999999;
            SALT_BSOSE500_DJF_avg(ii,jj) = 9999999;
	        SALT_BSOSE500_DJFMAM_avg(ii,jj) = 9999999;
            SALT_BSOSE500_DN_avg(ii,jj) = 9999999;
            SALT_BSOSE500_JJA_avg(ii,jj) = 9999999;
            SALT_BSOSE500_JAS_avg(ii,jj) = 9999999;
            SALT_BSOSE500_JJASON_avg(ii,jj) = 9999999;
            SALT_BSOSE500_JASOND_avg(ii,jj) = 9999999;
            SALT_BSOSE500_JFM_avg(ii,jj) = 9999999;
            SALT_BSOSE500_JFMAMJ_avg(ii,jj) = 9999999;
            SALT_BSOSE500_JD_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_DJF_avg(ii,jj) = 9999999;
	        SALT_BSOSE1000_DJFMAM_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_DN_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_JJA_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_JAS_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_JJASON_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_JASOND_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_JFM_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_JFMAMJ_avg(ii,jj) = 9999999;
            SALT_BSOSE1000_JD_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_DJF_avg(ii,jj) = 9999999;
	        SALT_BSOSE2000_DJFMAM_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_DN_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_JJA_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_JAS_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_JJASON_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_JASOND_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_JFM_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_JFMAMJ_avg(ii,jj) = 9999999;
            SALT_BSOSE2000_JD_avg(ii,jj) = 9999999;            
        end
    end
end

clear SALT_temp

% fid = fopen('SALT_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,SALT_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('SALT_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,SALT_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('SALT_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,SALT_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('SALT_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,SALT_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('SALT_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,SALT_BSOSE_JJA_avg,'single');
% fclose(fid);

fprintf('finished SALT \n')

%% SALT

%% TFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfTflx.nc';
sd = 48;
nd = 13;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
% hFacC = ncread(str,'hFacC');
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

TFLUX_temp = ncread(str,'TFLUX',[lox,loy,sd],[nn,mm,nd]);

TFLUX_BSOSE_DJF_avg = mean(TFLUX_temp(:,:,1:3),3);
TFLUX_BSOSE_DJFMAM_avg = mean(TFLUX_temp(:,:,1:6),3);
TFLUX_BSOSE_DN_avg = mean(TFLUX_temp(:,:,1:12),3);
TFLUX_BSOSE_JJA_avg = mean(TFLUX_temp(:,:,7:9),3);
TFLUX_BSOSE_JAS_avg = mean(TFLUX_temp(:,:,8:10),3);
TFLUX_BSOSE_JJASON_avg = mean(TFLUX_temp(:,:,7:12),3);
TFLUX_BSOSE_JASOND_avg = mean(TFLUX_temp(:,:,8:13),3);
TFLUX_BSOSE_JFM_avg = mean(TFLUX_temp(:,:,2:4),3);
TFLUX_BSOSE_JFMAMJ_avg = mean(TFLUX_temp(:,:,2:7),3);
TFLUX_BSOSE_JD_avg = mean(TFLUX_temp(:,:,2:13),3);

[m64,n64] = size(TFLUX_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            TFLUX_BSOSE_DJF_avg(ii,jj) = 9999999;
	        TFLUX_BSOSE_DJFMAM_avg(ii,jj) = 9999999;
            TFLUX_BSOSE_DN_avg(ii,jj) = 9999999;
            TFLUX_BSOSE_JJA_avg(ii,jj) = 9999999;
            TFLUX_BSOSE_JAS_avg(ii,jj) = 9999999;
            TFLUX_BSOSE_JJASON_avg(ii,jj) = 9999999;
            TFLUX_BSOSE_JASOND_avg(ii,jj) = 9999999;
            TFLUX_BSOSE_JFM_avg(ii,jj) = 9999999;
            TFLUX_BSOSE_JFMAMJ_avg(ii,jj) = 9999999;
            TFLUX_BSOSE_JD_avg(ii,jj) = 9999999;          
        end
    end
end

clear TFLUX_temp

% fid = fopen('TFLUX_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,TFLUX_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('TFLUX_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,TFLUX_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('TFLUX_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,TFLUX_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('TFLUX_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,TFLUX_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('TFLUX_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,TFLUX_BSOSE_JJA_avg,'single');
% fclose(fid);

fprintf('finished TFLUX \n')

%% TFLUX

%% SFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfSflx.nc';
sd = 48;
nd = 13;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
% hFacC = ncread(str,'hFacC');
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

SFLUX_temp = ncread(str,'SFLUX',[lox,loy,sd],[nn,mm,nd]);

SFLUX_BSOSE_DJF_avg = mean(SFLUX_temp(:,:,1:3),3);
SFLUX_BSOSE_DJFMAM_avg = mean(SFLUX_temp(:,:,1:6),3);
SFLUX_BSOSE_DN_avg = mean(SFLUX_temp(:,:,1:12),3);
SFLUX_BSOSE_JJA_avg = mean(SFLUX_temp(:,:,7:9),3);
SFLUX_BSOSE_JAS_avg = mean(SFLUX_temp(:,:,8:10),3);
SFLUX_BSOSE_JJASON_avg = mean(SFLUX_temp(:,:,7:12),3);
SFLUX_BSOSE_JASOND_avg = mean(SFLUX_temp(:,:,8:13),3);
SFLUX_BSOSE_JFM_avg = mean(SFLUX_temp(:,:,2:4),3);
SFLUX_BSOSE_JFMAMJ_avg = mean(SFLUX_temp(:,:,2:7),3);
SFLUX_BSOSE_JD_avg = mean(SFLUX_temp(:,:,2:13),3);

[m64,n64] = size(SFLUX_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            SFLUX_BSOSE_DJF_avg(ii,jj) = 9999999;
	        SFLUX_BSOSE_DJFMAM_avg(ii,jj) = 9999999;
            SFLUX_BSOSE_DN_avg(ii,jj) = 9999999;
            SFLUX_BSOSE_JJA_avg(ii,jj) = 9999999;
            SFLUX_BSOSE_JAS_avg(ii,jj) = 9999999;
            SFLUX_BSOSE_JJASON_avg(ii,jj) = 9999999;
            SFLUX_BSOSE_JASOND_avg(ii,jj) = 9999999;
            SFLUX_BSOSE_JFM_avg(ii,jj) = 9999999;
            SFLUX_BSOSE_JFMAMJ_avg(ii,jj) = 9999999;
            SFLUX_BSOSE_JD_avg(ii,jj) = 9999999;          
        end
    end
end

clear SFLUX_temp

% fid = fopen('SFLUX_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,SFLUX_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('SFLUX_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,SFLUX_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('SFLUX_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,SFLUX_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('SFLUX_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,SFLUX_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('SFLUX_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,SFLUX_BSOSE_JJA_avg,'single');
% fclose(fid);

fprintf('finished SFLUX \n')

%% SFLUX

%% CFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfCO2flx.nc';
sd = 48;
nd = 13;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
% hFacC = ncread(str,'hFacC');
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

CFLUX_temp = ncread(str,'BLGCFLX',[lox,loy,sd],[nn,mm,nd]);

CFLUX_BSOSE_DJF_avg = mean(CFLUX_temp(:,:,1:3),3);
CFLUX_BSOSE_DJFMAM_avg = mean(CFLUX_temp(:,:,1:6),3);
CFLUX_BSOSE_DN_avg = mean(CFLUX_temp(:,:,1:12),3);
CFLUX_BSOSE_JJA_avg = mean(CFLUX_temp(:,:,7:9),3);
CFLUX_BSOSE_JAS_avg = mean(CFLUX_temp(:,:,8:10),3);
CFLUX_BSOSE_JJASON_avg = mean(CFLUX_temp(:,:,7:12),3);
CFLUX_BSOSE_JASOND_avg = mean(CFLUX_temp(:,:,8:13),3);
CFLUX_BSOSE_JFM_avg = mean(CFLUX_temp(:,:,2:4),3);
CFLUX_BSOSE_JFMAMJ_avg = mean(CFLUX_temp(:,:,2:7),3);
CFLUX_BSOSE_JD_avg = mean(CFLUX_temp(:,:,2:13),3);

[m64,n64] = size(CFLUX_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            CFLUX_BSOSE_DJF_avg(ii,jj) = 9999999;
	        CFLUX_BSOSE_DJFMAM_avg(ii,jj) = 9999999;
            CFLUX_BSOSE_DN_avg(ii,jj) = 9999999;
            CFLUX_BSOSE_JJA_avg(ii,jj) = 9999999;
            CFLUX_BSOSE_JAS_avg(ii,jj) = 9999999;
            CFLUX_BSOSE_JJASON_avg(ii,jj) = 9999999;
            CFLUX_BSOSE_JASOND_avg(ii,jj) = 9999999;
            CFLUX_BSOSE_JFM_avg(ii,jj) = 9999999;
            CFLUX_BSOSE_JFMAMJ_avg(ii,jj) = 9999999;
            CFLUX_BSOSE_JD_avg(ii,jj) = 9999999;          
        end
    end
end

clear CFLUX_temp

% fid = fopen('CFLUX_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,CFLUX_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('CFLUX_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,CFLUX_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('CFLUX_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,CFLUX_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('CFLUX_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,CFLUX_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('CFLUX_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,CFLUX_BSOSE_JJA_avg,'single');
% fclose(fid);

fprintf('finished CFLUX \n')

%% CFLUX


%% OFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_surfO2flx.nc';
sd = 48;
nd = 13;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
% hFacC = ncread(str,'hFacC');
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

OFLUX_temp = ncread(str,'BLGOFLX',[lox,loy,sd],[nn,mm,nd]);

OFLUX_BSOSE_DJF_avg = mean(OFLUX_temp(:,:,1:3),3);
OFLUX_BSOSE_DJFMAM_avg = mean(OFLUX_temp(:,:,1:6),3);
OFLUX_BSOSE_DN_avg = mean(OFLUX_temp(:,:,1:12),3);
OFLUX_BSOSE_JJA_avg = mean(OFLUX_temp(:,:,7:9),3);
OFLUX_BSOSE_JAS_avg = mean(OFLUX_temp(:,:,8:10),3);
OFLUX_BSOSE_JJASON_avg = mean(OFLUX_temp(:,:,7:12),3);
OFLUX_BSOSE_JASOND_avg = mean(OFLUX_temp(:,:,8:13),3);
OFLUX_BSOSE_JFM_avg = mean(OFLUX_temp(:,:,2:4),3);
OFLUX_BSOSE_JFMAMJ_avg = mean(OFLUX_temp(:,:,2:7),3);
OFLUX_BSOSE_JD_avg = mean(OFLUX_temp(:,:,2:13),3);

[m64,n64] = size(OFLUX_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            OFLUX_BSOSE_DJF_avg(ii,jj) = 9999999;
	        OFLUX_BSOSE_DJFMAM_avg(ii,jj) = 9999999;
            OFLUX_BSOSE_DN_avg(ii,jj) = 9999999;
            OFLUX_BSOSE_JJA_avg(ii,jj) = 9999999;
            OFLUX_BSOSE_JAS_avg(ii,jj) = 9999999;
            OFLUX_BSOSE_JJASON_avg(ii,jj) = 9999999;
            OFLUX_BSOSE_JASOND_avg(ii,jj) = 9999999;
            OFLUX_BSOSE_JFM_avg(ii,jj) = 9999999;
            OFLUX_BSOSE_JFMAMJ_avg(ii,jj) = 9999999;
            OFLUX_BSOSE_JD_avg(ii,jj) = 9999999;          
        end
    end
end

clear OFLUX_temp

% fid = fopen('OFLUX_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,OFLUX_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('OFLUX_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,OFLUX_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('OFLUX_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,OFLUX_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('OFLUX_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,OFLUX_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('OFLUX_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,OFLUX_BSOSE_JJA_avg,'single');
% fclose(fid);

fprintf('finished OFLUX \n')

%% OFLUX

%% DIC
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_DIC.nc';
sd = 48;
nd = 13;

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

DIC_temp = ncread(str,'TRAC01',[lox,loy,1,sd],[nn,mm,1,nd]);

DIC_BSOSE_DJF_avg = mean(DIC_temp(:,:,1:3),3);
DIC_BSOSE_DJFMAM_avg = mean(DIC_temp(:,:,1:6),3);
DIC_BSOSE_DN_avg = mean(DIC_temp(:,:,1:12),3);
DIC_BSOSE_JJA_avg = mean(DIC_temp(:,:,7:9),3);
DIC_BSOSE_JAS_avg = mean(DIC_temp(:,:,8:10),3);
DIC_BSOSE_JJASON_avg = mean(DIC_temp(:,:,7:12),3);
DIC_BSOSE_JASOND_avg = mean(DIC_temp(:,:,8:13),3);
DIC_BSOSE_JFM_avg = mean(DIC_temp(:,:,2:4),3);
DIC_BSOSE_JFMAMJ_avg = mean(DIC_temp(:,:,2:7),3);
DIC_BSOSE_JD_avg = mean(DIC_temp(:,:,2:13),3);

[m64,n64] = size(DIC_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            DIC_BSOSE_DJF_avg(ii,jj) = 9999999;
	        DIC_BSOSE_DJFMAM_avg(ii,jj) = 9999999;
            DIC_BSOSE_DN_avg(ii,jj) = 9999999;
            DIC_BSOSE_JJA_avg(ii,jj) = 9999999;
            DIC_BSOSE_JAS_avg(ii,jj) = 9999999;
            DIC_BSOSE_JJASON_avg(ii,jj) = 9999999;
            DIC_BSOSE_JASOND_avg(ii,jj) = 9999999;
            DIC_BSOSE_JFM_avg(ii,jj) = 9999999;
            DIC_BSOSE_JFMAMJ_avg(ii,jj) = 9999999;
            DIC_BSOSE_JD_avg(ii,jj) = 9999999;          
        end
    end
end

clear DIC_temp

% fid = fopen('DIC_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,DIC_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('DIC_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,DIC_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('DIC_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,DIC_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('DIC_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,DIC_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('DIC_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,DIC_BSOSE_JJA_avg,'single');
% fclose(fid);

fprintf('finished DIC \n')

%% DIC

%% ALK
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Alk.nc';
sd = 48;
nd = 13;

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

ALK_temp = ncread(str,'TRAC02',[lox,loy,1,sd],[nn,mm,1,nd]);

ALK_BSOSE_DJF_avg = mean(ALK_temp(:,:,1:3),3);
ALK_BSOSE_DJFMAM_avg = mean(ALK_temp(:,:,1:6),3);
ALK_BSOSE_DN_avg = mean(ALK_temp(:,:,1:12),3);
ALK_BSOSE_JJA_avg = mean(ALK_temp(:,:,7:9),3);
ALK_BSOSE_JAS_avg = mean(ALK_temp(:,:,8:10),3);
ALK_BSOSE_JJASON_avg = mean(ALK_temp(:,:,7:12),3);
ALK_BSOSE_JASOND_avg = mean(ALK_temp(:,:,8:13),3);
ALK_BSOSE_JFM_avg = mean(ALK_temp(:,:,2:4),3);
ALK_BSOSE_JFMAMJ_avg = mean(ALK_temp(:,:,2:7),3);
ALK_BSOSE_JD_avg = mean(ALK_temp(:,:,2:13),3);

[m64,n64] = size(ALK_BSOSE_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            ALK_BSOSE_DJF_avg(ii,jj) = 9999999;
	        ALK_BSOSE_DJFMAM_avg(ii,jj) = 9999999;
            ALK_BSOSE_DN_avg(ii,jj) = 9999999;
            ALK_BSOSE_JJA_avg(ii,jj) = 9999999;
            ALK_BSOSE_JAS_avg(ii,jj) = 9999999;
            ALK_BSOSE_JJASON_avg(ii,jj) = 9999999;
            ALK_BSOSE_JASOND_avg(ii,jj) = 9999999;
            ALK_BSOSE_JFM_avg(ii,jj) = 9999999;
            ALK_BSOSE_JFMAMJ_avg(ii,jj) = 9999999;
            ALK_BSOSE_JD_avg(ii,jj) = 9999999;          
        end
    end
end

clear ALK_temp

% fid = fopen('ALK_BSOSE_DN_avg.bin','w','b');
% fwrite(fid,ALK_BSOSE_DN_avg,'single');
% fclose(fid);
% fid = fopen('ALK_BSOSE_DJFMAM_avg.bin','w','b');
% fwrite(fid,ALK_BSOSE_DJFMAM_avg,'single');
% fclose(fid);
% fid = fopen('ALK_BSOSE_DJF_avg.bin','w','b');
% fwrite(fid,ALK_BSOSE_DJF_avg,'single');
% fclose(fid);
% fid = fopen('ALK_BSOSE_JJASON_avg.bin','w','b');
% fwrite(fid,ALK_BSOSE_JJASON_avg,'single');
% fclose(fid);
% fid = fopen('ALK_BSOSE_JJA_avg.bin','w','b');
% fwrite(fid,ALK_BSOSE_JJA_avg,'single');
% fclose(fid);

fprintf('finished ALK \n')

%% ALK



clear sd nd char bsose_* *_length_* *_day_* m64 n64

save BSOSE_surf_avgs








toc()