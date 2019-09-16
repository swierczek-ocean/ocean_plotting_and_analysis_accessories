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
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Theta.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
DRF_temp = ncread(str,'drF');
DRF = zeros(1,1,52);
DRF(1,1,:) = DRF_temp;
X = XCS;
Y = YCS;
lox = find(X>288,1)-1;
hix = find(X>352,1)+1;
loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
HC = hFacC(lox:hix,loy:hiy,:);

nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

Volume = zeros(nn,mm,52);

for ii=1:nn
    for jj=1:mm
        Volume(ii,jj,:) = HC(ii,jj,:).*DRF;
    end
end

Height = sum(Volume,3);

THETA_temp = ncread(str,'THETA',[lox,loy,1,sd],[nn,mm,52,nd]);

THETA_series = zeros(nn,mm,nd);
THETA_series_100 = zeros(nn,mm,nd);
THETA_series_avg = zeros(nn,mm,nd);


for ii=1:nd
    THETA_series(:,:,ii) = sum(THETA_temp(:,:,:,ii).*Volume,3);
    THETA_series_100(:,:,ii) = sum(THETA_temp(:,:,1:12,ii).*Volume(:,:,1:12),3);
    THETA_series_avg(:,:,ii) = THETA_series(:,:,ii)./Height;
end

THETA_BSOSE_DJF_vert_avg = mean(THETA_series_avg(:,:,1:3),3);
THETA_BSOSE_DJFMAM_vert_avg = mean(THETA_series_avg(:,:,1:6),3);
THETA_BSOSE_DN_vert_avg = mean(THETA_series_avg(:,:,1:12),3);
THETA_BSOSE_JJA_vert_avg = mean(THETA_series_avg(:,:,7:9),3);
THETA_BSOSE_JAS_vert_avg = mean(THETA_series_avg(:,:,8:10),3);
THETA_BSOSE_JJASON_vert_avg = mean(THETA_series_avg(:,:,7:12),3);
THETA_BSOSE_JASOND_vert_avg = mean(THETA_series_avg(:,:,8:13),3);
THETA_BSOSE_JFM_vert_avg = mean(THETA_series_avg(:,:,2:4),3);
THETA_BSOSE_JFMAMJ_vert_avg = mean(THETA_series_avg(:,:,2:7),3);
THETA_BSOSE_JD_vert_avg = mean(THETA_series_avg(:,:,2:13),3);

THETA_BSOSE_DJF_vert_std = std(THETA_series_avg(:,:,1:3),0,3);
THETA_BSOSE_DJFMAM_vert_std = std(THETA_series_avg(:,:,1:6),0,3);
THETA_BSOSE_DN_vert_std = std(THETA_series_avg(:,:,1:12),0,3);
THETA_BSOSE_JJA_vert_std = std(THETA_series_avg(:,:,7:9),0,3);
THETA_BSOSE_JAS_vert_std = std(THETA_series_avg(:,:,8:10),0,3);
THETA_BSOSE_JJASON_vert_std = std(THETA_series_avg(:,:,7:12),0,3);
THETA_BSOSE_JASOND_vert_std = std(THETA_series_avg(:,:,8:13),0,3);
THETA_BSOSE_JFM_vert_std = std(THETA_series_avg(:,:,2:4),0,3);
THETA_BSOSE_JFMAMJ_vert_std = std(THETA_series_avg(:,:,2:7),0,3);
THETA_BSOSE_JD_vert_std = std(THETA_series_avg(:,:,2:13),0,3);

THETA_BSOSE_DJF_tvert_avg = mean(THETA_series(:,:,1:3),3);
THETA_BSOSE_DJFMAM_tvert_avg = mean(THETA_series(:,:,1:6),3);
THETA_BSOSE_DN_tvert_avg = mean(THETA_series(:,:,1:12),3);
THETA_BSOSE_JJA_tvert_avg = mean(THETA_series(:,:,7:9),3);
THETA_BSOSE_JAS_tvert_avg = mean(THETA_series(:,:,8:10),3);
THETA_BSOSE_JJASON_tvert_avg = mean(THETA_series(:,:,7:12),3);
THETA_BSOSE_JASOND_tvert_avg = mean(THETA_series(:,:,8:13),3);
THETA_BSOSE_JFM_tvert_avg = mean(THETA_series(:,:,2:4),3);
THETA_BSOSE_JFMAMJ_tvert_avg = mean(THETA_series(:,:,2:7),3);
THETA_BSOSE_JD_tvert_avg = mean(THETA_series(:,:,2:13),3);

THETA_BSOSE_DJF_tvert_std = std(THETA_series(:,:,1:3),0,3);
THETA_BSOSE_DJFMAM_tvert_std = std(THETA_series(:,:,1:6),0,3);
THETA_BSOSE_DN_tvert_std = std(THETA_series(:,:,1:12),0,3);
THETA_BSOSE_JJA_tvert_std = std(THETA_series(:,:,7:9),0,3);
THETA_BSOSE_JAS_tvert_std = std(THETA_series(:,:,8:10),0,3);
THETA_BSOSE_JJASON_tvert_std = std(THETA_series(:,:,7:12),0,3);
THETA_BSOSE_JASOND_tvert_std = std(THETA_series(:,:,8:13),0,3);
THETA_BSOSE_JFM_tvert_std = std(THETA_series(:,:,2:4),0,3);
THETA_BSOSE_JFMAMJ_tvert_std = std(THETA_series(:,:,2:7),0,3);
THETA_BSOSE_JD_tvert_std = std(THETA_series(:,:,2:13),0,3);

THETA_BSOSE_DJF_vert100_avg = mean(THETA_series_100(:,:,1:3),3);
THETA_BSOSE_DJFMAM_vert100_avg = mean(THETA_series_100(:,:,1:6),3);
THETA_BSOSE_DN_vert100_avg = mean(THETA_series_100(:,:,1:12),3);
THETA_BSOSE_JJA_vert100_avg = mean(THETA_series_100(:,:,7:9),3);
THETA_BSOSE_JAS_vert100_avg = mean(THETA_series_100(:,:,8:10),3);
THETA_BSOSE_JJASON_vert100_avg = mean(THETA_series_100(:,:,7:12),3);
THETA_BSOSE_JASOND_vert100_avg = mean(THETA_series_100(:,:,8:13),3);
THETA_BSOSE_JFM_vert100_avg = mean(THETA_series_100(:,:,2:4),3);
THETA_BSOSE_JFMAMJ_vert100_avg = mean(THETA_series_100(:,:,2:7),3);
THETA_BSOSE_JD_vert100_avg = mean(THETA_series_100(:,:,2:13),3);

THETA_BSOSE_DJF_vert100_std = std(THETA_series_100(:,:,1:3),0,3);
THETA_BSOSE_DJFMAM_vert100_std = std(THETA_series_100(:,:,1:6),0,3);
THETA_BSOSE_DN_vert100_std = std(THETA_series_100(:,:,1:12),0,3);
THETA_BSOSE_JJA_vert100_std = std(THETA_series_100(:,:,7:9),0,3);
THETA_BSOSE_JAS_vert100_std = std(THETA_series_100(:,:,8:10),0,3);
THETA_BSOSE_JJASON_vert100_std = std(THETA_series_100(:,:,7:12),0,3);
THETA_BSOSE_JASOND_vert100_std = std(THETA_series_100(:,:,8:13),0,3);
THETA_BSOSE_JFM_vert100_std = std(THETA_series_100(:,:,2:4),0,3);
THETA_BSOSE_JFMAMJ_vert100_std = std(THETA_series_100(:,:,2:7),0,3);
THETA_BSOSE_JD_vert100_std = std(THETA_series_100(:,:,2:13),0,3);

[m64,n64] = size(THETA_BSOSE_JJA_vert_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj,1)==0)
            THETA_BSOSE_DJF_vert_avg(ii,jj) = 99999999999;
	        THETA_BSOSE_DJFMAM_vert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_DN_vert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JJA_vert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JAS_vert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JJASON_vert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JASOND_vert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JFM_vert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JFMAMJ_vert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JD_vert_avg(ii,jj) = 99999999999;   
            THETA_BSOSE_DJF_vert_std(ii,jj) = 99999999999;
	        THETA_BSOSE_DJFMAM_vert_std(ii,jj) = 99999999999;
            THETA_BSOSE_DN_vert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JJA_vert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JAS_vert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JJASON_vert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JASOND_vert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JFM_vert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JFMAMJ_vert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JD_vert_std(ii,jj) = 99999999999; 
            THETA_BSOSE_DJF_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_DJF_tvert_avg(ii,jj) = 99999999999;
	        THETA_BSOSE_DJFMAM_tvert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_DN_tvert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JJA_tvert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JAS_tvert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JJASON_tvert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JASOND_tvert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JFM_tvert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JFMAMJ_tvert_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JD_tvert_avg(ii,jj) = 99999999999;   
            THETA_BSOSE_DJF_tvert_std(ii,jj) = 99999999999;
	        THETA_BSOSE_DJFMAM_tvert_std(ii,jj) = 99999999999;
            THETA_BSOSE_DN_tvert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JJA_tvert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JAS_tvert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JJASON_tvert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JASOND_tvert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JFM_tvert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JFMAMJ_tvert_std(ii,jj) = 99999999999;
            THETA_BSOSE_JD_tvert_std(ii,jj) = 99999999999; 
	        THETA_BSOSE_DJFMAM_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_DN_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JJA_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JAS_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JJASON_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JASOND_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JFM_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JFMAMJ_vert100_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JD_vert100_avg(ii,jj) = 99999999999;   
            THETA_BSOSE_DJF_vert100_std(ii,jj) = 99999999999;
	        THETA_BSOSE_DJFMAM_vert100_std(ii,jj) = 99999999999;
            THETA_BSOSE_DN_vert100_std(ii,jj) = 99999999999;
            THETA_BSOSE_JJA_vert100_std(ii,jj) = 99999999999;
            THETA_BSOSE_JAS_vert100_std(ii,jj) = 99999999999;
            THETA_BSOSE_JJASON_vert100_std(ii,jj) = 99999999999;
            THETA_BSOSE_JASOND_vert100_std(ii,jj) = 99999999999;
            THETA_BSOSE_JFM_vert100_std(ii,jj) = 99999999999;
            THETA_BSOSE_JFMAMJ_vert100_std(ii,jj) = 99999999999;
            THETA_BSOSE_JD_vert100_std(ii,jj) = 99999999999;
        end
    end
end

clear THETA_temp

fprintf('finished THETA \n')

%% THETA

%% DIC
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_5day_DIC.nc';
sd = floor(bsose_index_2/5);
nd = ceil((DD_length_time+30)/5);

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
DRF = ncread(str,'drF');
X = XCS;
Y = YCS;
lox = find(X>288,1)-1;
hix = find(X>352,1)+1;
loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
HC = hFacC(lox:hix,loy:hiy,:);

nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

DIC_temp = ncread(str,'TRAC01',[lox,loy,1,sd],[nn,mm,52,nd]);

DIC_series = zeros(nn,mm,nd);
DIC_series_100 = zeros(nn,mm,nd);
DIC_series_avg = zeros(nn,mm,nd);


for ii=1:nd
    DIC_series(:,:,ii) = sum(DIC_temp(:,:,:,ii).*Volume,3);
    DIC_series_100(:,:,ii) = sum(DIC_temp(:,:,1:12,ii).*Volume(:,:,1:12),3);
    DIC_series_avg(:,:,ii) = DIC_series(:,:,ii)./Height;
end

DIC_BSOSE_DJF_vert_avg = mean(DIC_series_avg(:,:,1:3),3);
DIC_BSOSE_DJFMAM_vert_avg = mean(DIC_series_avg(:,:,1:6),3);
DIC_BSOSE_DN_vert_avg = mean(DIC_series_avg(:,:,1:12),3);
DIC_BSOSE_JJA_vert_avg = mean(DIC_series_avg(:,:,7:9),3);
DIC_BSOSE_JAS_vert_avg = mean(DIC_series_avg(:,:,8:10),3);
DIC_BSOSE_JJASON_vert_avg = mean(DIC_series_avg(:,:,7:12),3);
DIC_BSOSE_JASOND_vert_avg = mean(DIC_series_avg(:,:,8:13),3);
DIC_BSOSE_JFM_vert_avg = mean(DIC_series_avg(:,:,2:4),3);
DIC_BSOSE_JFMAMJ_vert_avg = mean(DIC_series_avg(:,:,2:7),3);
DIC_BSOSE_JD_vert_avg = mean(DIC_series_avg(:,:,2:13),3);

DIC_BSOSE_DJF_vert_std = std(DIC_series_avg(:,:,1:3),0,3);
DIC_BSOSE_DJFMAM_vert_std = std(DIC_series_avg(:,:,1:6),0,3);
DIC_BSOSE_DN_vert_std = std(DIC_series_avg(:,:,1:12),0,3);
DIC_BSOSE_JJA_vert_std = std(DIC_series_avg(:,:,7:9),0,3);
DIC_BSOSE_JAS_vert_std = std(DIC_series_avg(:,:,8:10),0,3);
DIC_BSOSE_JJASON_vert_std = std(DIC_series_avg(:,:,7:12),0,3);
DIC_BSOSE_JASOND_vert_std = std(DIC_series_avg(:,:,8:13),0,3);
DIC_BSOSE_JFM_vert_std = std(DIC_series_avg(:,:,2:4),0,3);
DIC_BSOSE_JFMAMJ_vert_std = std(DIC_series_avg(:,:,2:7),0,3);
DIC_BSOSE_JD_vert_std = std(DIC_series_avg(:,:,2:13),0,3);

DIC_BSOSE_DJF_tvert_avg = mean(DIC_series(:,:,1:3),3);
DIC_BSOSE_DJFMAM_tvert_avg = mean(DIC_series(:,:,1:6),3);
DIC_BSOSE_DN_tvert_avg = mean(DIC_series(:,:,1:12),3);
DIC_BSOSE_JJA_tvert_avg = mean(DIC_series(:,:,7:9),3);
DIC_BSOSE_JAS_tvert_avg = mean(DIC_series(:,:,8:10),3);
DIC_BSOSE_JJASON_tvert_avg = mean(DIC_series(:,:,7:12),3);
DIC_BSOSE_JASOND_tvert_avg = mean(DIC_series(:,:,8:13),3);
DIC_BSOSE_JFM_tvert_avg = mean(DIC_series(:,:,2:4),3);
DIC_BSOSE_JFMAMJ_tvert_avg = mean(DIC_series(:,:,2:7),3);
DIC_BSOSE_JD_tvert_avg = mean(DIC_series(:,:,2:13),3);

DIC_BSOSE_DJF_tvert_std = std(DIC_series(:,:,1:3),0,3);
DIC_BSOSE_DJFMAM_tvert_std = std(DIC_series(:,:,1:6),0,3);
DIC_BSOSE_DN_tvert_std = std(DIC_series(:,:,1:12),0,3);
DIC_BSOSE_JJA_tvert_std = std(DIC_series(:,:,7:9),0,3);
DIC_BSOSE_JAS_tvert_std = std(DIC_series(:,:,8:10),0,3);
DIC_BSOSE_JJASON_tvert_std = std(DIC_series(:,:,7:12),0,3);
DIC_BSOSE_JASOND_tvert_std = std(DIC_series(:,:,8:13),0,3);
DIC_BSOSE_JFM_tvert_std = std(DIC_series(:,:,2:4),0,3);
DIC_BSOSE_JFMAMJ_tvert_std = std(DIC_series(:,:,2:7),0,3);
DIC_BSOSE_JD_tvert_std = std(DIC_series(:,:,2:13),0,3);

DIC_BSOSE_DJF_vert100_avg = mean(DIC_series_100(:,:,1:3),3);
DIC_BSOSE_DJFMAM_vert100_avg = mean(DIC_series_100(:,:,1:6),3);
DIC_BSOSE_DN_vert100_avg = mean(DIC_series_100(:,:,1:12),3);
DIC_BSOSE_JJA_vert100_avg = mean(DIC_series_100(:,:,7:9),3);
DIC_BSOSE_JAS_vert100_avg = mean(DIC_series_100(:,:,8:10),3);
DIC_BSOSE_JJASON_vert100_avg = mean(DIC_series_100(:,:,7:12),3);
DIC_BSOSE_JASOND_vert100_avg = mean(DIC_series_100(:,:,8:13),3);
DIC_BSOSE_JFM_vert100_avg = mean(DIC_series_100(:,:,2:4),3);
DIC_BSOSE_JFMAMJ_vert100_avg = mean(DIC_series_100(:,:,2:7),3);
DIC_BSOSE_JD_vert100_avg = mean(DIC_series_100(:,:,2:13),3);

DIC_BSOSE_DJF_vert100_std = std(DIC_series_100(:,:,1:3),0,3);
DIC_BSOSE_DJFMAM_vert100_std = std(DIC_series_100(:,:,1:6),0,3);
DIC_BSOSE_DN_vert100_std = std(DIC_series_100(:,:,1:12),0,3);
DIC_BSOSE_JJA_vert100_std = std(DIC_series_100(:,:,7:9),0,3);
DIC_BSOSE_JAS_vert100_std = std(DIC_series_100(:,:,8:10),0,3);
DIC_BSOSE_JJASON_vert100_std = std(DIC_series_100(:,:,7:12),0,3);
DIC_BSOSE_JASOND_vert100_std = std(DIC_series_100(:,:,8:13),0,3);
DIC_BSOSE_JFM_vert100_std = std(DIC_series_100(:,:,2:4),0,3);
DIC_BSOSE_JFMAMJ_vert100_std = std(DIC_series_100(:,:,2:7),0,3);
DIC_BSOSE_JD_vert100_std = std(DIC_series_100(:,:,2:13),0,3);

[m64,n64] = size(DIC_BSOSE_JJA_vert_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj,1)==0)
            DIC_BSOSE_DJF_vert_avg(ii,jj) = 99999999999;
	        DIC_BSOSE_DJFMAM_vert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_DN_vert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JJA_vert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JAS_vert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JJASON_vert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JASOND_vert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JFM_vert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JFMAMJ_vert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JD_vert_avg(ii,jj) = 99999999999;   
            DIC_BSOSE_DJF_vert_std(ii,jj) = 99999999999;
	        DIC_BSOSE_DJFMAM_vert_std(ii,jj) = 99999999999;
            DIC_BSOSE_DN_vert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JJA_vert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JAS_vert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JJASON_vert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JASOND_vert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JFM_vert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JFMAMJ_vert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JD_vert_std(ii,jj) = 99999999999; 
            DIC_BSOSE_DJF_tvert_avg(ii,jj) = 99999999999;
	        DIC_BSOSE_DJFMAM_tvert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_DN_tvert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JJA_tvert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JAS_tvert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JJASON_tvert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JASOND_tvert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JFM_tvert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JFMAMJ_tvert_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JD_tvert_avg(ii,jj) = 99999999999;   
            DIC_BSOSE_DJF_tvert_std(ii,jj) = 99999999999;
	        DIC_BSOSE_DJFMAM_tvert_std(ii,jj) = 99999999999;
            DIC_BSOSE_DN_tvert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JJA_tvert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JAS_tvert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JJASON_tvert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JASOND_tvert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JFM_tvert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JFMAMJ_tvert_std(ii,jj) = 99999999999;
            DIC_BSOSE_JD_tvert_std(ii,jj) = 99999999999; 
            DIC_BSOSE_DJF_vert100_avg(ii,jj) = 99999999999;
	        DIC_BSOSE_DJFMAM_vert100_avg(ii,jj) = 99999999999;
            DIC_BSOSE_DN_vert100_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JJA_vert100_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JAS_vert100_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JJASON_vert100_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JASOND_vert100_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JFM_vert100_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JFMAMJ_vert100_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JD_vert100_avg(ii,jj) = 99999999999;   
            DIC_BSOSE_DJF_vert100_std(ii,jj) = 99999999999;
	        DIC_BSOSE_DJFMAM_vert100_std(ii,jj) = 99999999999;
            DIC_BSOSE_DN_vert100_std(ii,jj) = 99999999999;
            DIC_BSOSE_JJA_vert100_std(ii,jj) = 99999999999;
            DIC_BSOSE_JAS_vert100_std(ii,jj) = 99999999999;
            DIC_BSOSE_JJASON_vert100_std(ii,jj) = 99999999999;
            DIC_BSOSE_JASOND_vert100_std(ii,jj) = 99999999999;
            DIC_BSOSE_JFM_vert100_std(ii,jj) = 99999999999;
            DIC_BSOSE_JFMAMJ_vert100_std(ii,jj) = 99999999999;
            DIC_BSOSE_JD_vert100_std(ii,jj) = 99999999999;
        end
    end
end

clear DIC_temp

fprintf('finished DIC \n')

%% DIC

%% O2
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_5day_O2.nc';
sd = floor(bsose_index_2/5);
nd = ceil((DD_length_time+30)/5);

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
DRF = ncread(str,'drF');
X = XCS;
Y = YCS;
lox = find(X>288,1)-1;
hix = find(X>352,1)+1;
loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
HC = hFacC(lox:hix,loy:hiy,:);

nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

O2_temp = ncread(str,'TRAC03',[lox,loy,1,sd],[nn,mm,52,nd]);

O2_series = zeros(nn,mm,nd);
O2_series_100 = zeros(nn,mm,nd);
O2_series_avg = zeros(nn,mm,nd);


for ii=1:nd
    O2_series(:,:,ii) = sum(O2_temp(:,:,:,ii).*Volume,3);
    O2_series_100(:,:,ii) = sum(O2_temp(:,:,1:12,ii).*Volume(:,:,1:12),3);
    O2_series_avg(:,:,ii) = O2_series(:,:,ii)./Height;
end

O2_BSOSE_DJF_vert_avg = mean(O2_series_avg(:,:,1:3),3);
O2_BSOSE_DJFMAM_vert_avg = mean(O2_series_avg(:,:,1:6),3);
O2_BSOSE_DN_vert_avg = mean(O2_series_avg(:,:,1:12),3);
O2_BSOSE_JJA_vert_avg = mean(O2_series_avg(:,:,7:9),3);
O2_BSOSE_JAS_vert_avg = mean(O2_series_avg(:,:,8:10),3);
O2_BSOSE_JJASON_vert_avg = mean(O2_series_avg(:,:,7:12),3);
O2_BSOSE_JASOND_vert_avg = mean(O2_series_avg(:,:,8:13),3);
O2_BSOSE_JFM_vert_avg = mean(O2_series_avg(:,:,2:4),3);
O2_BSOSE_JFMAMJ_vert_avg = mean(O2_series_avg(:,:,2:7),3);
O2_BSOSE_JD_vert_avg = mean(O2_series_avg(:,:,2:13),3);

O2_BSOSE_DJF_vert_std = std(O2_series_avg(:,:,1:3),0,3);
O2_BSOSE_DJFMAM_vert_std = std(O2_series_avg(:,:,1:6),0,3);
O2_BSOSE_DN_vert_std = std(O2_series_avg(:,:,1:12),0,3);
O2_BSOSE_JJA_vert_std = std(O2_series_avg(:,:,7:9),0,3);
O2_BSOSE_JAS_vert_std = std(O2_series_avg(:,:,8:10),0,3);
O2_BSOSE_JJASON_vert_std = std(O2_series_avg(:,:,7:12),0,3);
O2_BSOSE_JASOND_vert_std = std(O2_series_avg(:,:,8:13),0,3);
O2_BSOSE_JFM_vert_std = std(O2_series_avg(:,:,2:4),0,3);
O2_BSOSE_JFMAMJ_vert_std = std(O2_series_avg(:,:,2:7),0,3);
O2_BSOSE_JD_vert_std = std(O2_series_avg(:,:,2:13),0,3);

O2_BSOSE_DJF_tvert_avg = mean(O2_series(:,:,1:3),3);
O2_BSOSE_DJFMAM_tvert_avg = mean(O2_series(:,:,1:6),3);
O2_BSOSE_DN_tvert_avg = mean(O2_series(:,:,1:12),3);
O2_BSOSE_JJA_tvert_avg = mean(O2_series(:,:,7:9),3);
O2_BSOSE_JAS_tvert_avg = mean(O2_series(:,:,8:10),3);
O2_BSOSE_JJASON_tvert_avg = mean(O2_series(:,:,7:12),3);
O2_BSOSE_JASOND_tvert_avg = mean(O2_series(:,:,8:13),3);
O2_BSOSE_JFM_tvert_avg = mean(O2_series(:,:,2:4),3);
O2_BSOSE_JFMAMJ_tvert_avg = mean(O2_series(:,:,2:7),3);
O2_BSOSE_JD_tvert_avg = mean(O2_series(:,:,2:13),3);

O2_BSOSE_DJF_tvert_std = std(O2_series(:,:,1:3),0,3);
O2_BSOSE_DJFMAM_tvert_std = std(O2_series(:,:,1:6),0,3);
O2_BSOSE_DN_tvert_std = std(O2_series(:,:,1:12),0,3);
O2_BSOSE_JJA_tvert_std = std(O2_series(:,:,7:9),0,3);
O2_BSOSE_JAS_tvert_std = std(O2_series(:,:,8:10),0,3);
O2_BSOSE_JJASON_tvert_std = std(O2_series(:,:,7:12),0,3);
O2_BSOSE_JASOND_tvert_std = std(O2_series(:,:,8:13),0,3);
O2_BSOSE_JFM_tvert_std = std(O2_series(:,:,2:4),0,3);
O2_BSOSE_JFMAMJ_tvert_std = std(O2_series(:,:,2:7),0,3);
O2_BSOSE_JD_tvert_std = std(O2_series(:,:,2:13),0,3);

O2_BSOSE_DJF_vert100_avg = mean(O2_series_100(:,:,1:3),3);
O2_BSOSE_DJFMAM_vert100_avg = mean(O2_series_100(:,:,1:6),3);
O2_BSOSE_DN_vert100_avg = mean(O2_series_100(:,:,1:12),3);
O2_BSOSE_JJA_vert100_avg = mean(O2_series_100(:,:,7:9),3);
O2_BSOSE_JAS_vert100_avg = mean(O2_series_100(:,:,8:10),3);
O2_BSOSE_JJASON_vert100_avg = mean(O2_series_100(:,:,7:12),3);
O2_BSOSE_JASOND_vert100_avg = mean(O2_series_100(:,:,8:13),3);
O2_BSOSE_JFM_vert100_avg = mean(O2_series_100(:,:,2:4),3);
O2_BSOSE_JFMAMJ_vert100_avg = mean(O2_series_100(:,:,2:7),3);
O2_BSOSE_JD_vert100_avg = mean(O2_series_100(:,:,2:13),3);

O2_BSOSE_DJF_vert100_std = std(O2_series_100(:,:,1:3),0,3);
O2_BSOSE_DJFMAM_vert100_std = std(O2_series_100(:,:,1:6),0,3);
O2_BSOSE_DN_vert100_std = std(O2_series_100(:,:,1:12),0,3);
O2_BSOSE_JJA_vert100_std = std(O2_series_100(:,:,7:9),0,3);
O2_BSOSE_JAS_vert100_std = std(O2_series_100(:,:,8:10),0,3);
O2_BSOSE_JJASON_vert100_std = std(O2_series_100(:,:,7:12),0,3);
O2_BSOSE_JASOND_vert100_std = std(O2_series_100(:,:,8:13),0,3);
O2_BSOSE_JFM_vert100_std = std(O2_series_100(:,:,2:4),0,3);
O2_BSOSE_JFMAMJ_vert100_std = std(O2_series_100(:,:,2:7),0,3);
O2_BSOSE_JD_vert100_std = std(O2_series_100(:,:,2:13),0,3);

[m64,n64] = size(O2_BSOSE_JJA_vert_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj,1)==0)
            O2_BSOSE_DJF_vert_avg(ii,jj) = 99999999999;
	        O2_BSOSE_DJFMAM_vert_avg(ii,jj) = 99999999999;
            O2_BSOSE_DN_vert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JJA_vert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JAS_vert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JJASON_vert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JASOND_vert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JFM_vert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JFMAMJ_vert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JD_vert_avg(ii,jj) = 99999999999;   
            O2_BSOSE_DJF_vert_std(ii,jj) = 99999999999;
	        O2_BSOSE_DJFMAM_vert_std(ii,jj) = 99999999999;
            O2_BSOSE_DN_vert_std(ii,jj) = 99999999999;
            O2_BSOSE_JJA_vert_std(ii,jj) = 99999999999;
            O2_BSOSE_JAS_vert_std(ii,jj) = 99999999999;
            O2_BSOSE_JJASON_vert_std(ii,jj) = 99999999999;
            O2_BSOSE_JASOND_vert_std(ii,jj) = 99999999999;
            O2_BSOSE_JFM_vert_std(ii,jj) = 99999999999;
            O2_BSOSE_JFMAMJ_vert_std(ii,jj) = 99999999999;
            O2_BSOSE_JD_vert_std(ii,jj) = 99999999999; 
            O2_BSOSE_DJF_tvert_avg(ii,jj) = 99999999999;
	        O2_BSOSE_DJFMAM_tvert_avg(ii,jj) = 99999999999;
            O2_BSOSE_DN_tvert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JJA_tvert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JAS_tvert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JJASON_tvert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JASOND_tvert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JFM_tvert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JFMAMJ_tvert_avg(ii,jj) = 99999999999;
            O2_BSOSE_JD_tvert_avg(ii,jj) = 99999999999;   
            O2_BSOSE_DJF_tvert_std(ii,jj) = 99999999999;
	        O2_BSOSE_DJFMAM_tvert_std(ii,jj) = 99999999999;
            O2_BSOSE_DN_tvert_std(ii,jj) = 99999999999;
            O2_BSOSE_JJA_tvert_std(ii,jj) = 99999999999;
            O2_BSOSE_JAS_tvert_std(ii,jj) = 99999999999;
            O2_BSOSE_JJASON_tvert_std(ii,jj) = 99999999999;
            O2_BSOSE_JASOND_tvert_std(ii,jj) = 99999999999;
            O2_BSOSE_JFM_tvert_std(ii,jj) = 99999999999;
            O2_BSOSE_JFMAMJ_tvert_std(ii,jj) = 99999999999;
            O2_BSOSE_JD_tvert_std(ii,jj) = 99999999999; 
            O2_BSOSE_DJF_vert100_avg(ii,jj) = 99999999999;
	        O2_BSOSE_DJFMAM_vert100_avg(ii,jj) = 99999999999;
            O2_BSOSE_DN_vert100_avg(ii,jj) = 99999999999;
            O2_BSOSE_JJA_vert100_avg(ii,jj) = 99999999999;
            O2_BSOSE_JAS_vert100_avg(ii,jj) = 99999999999;
            O2_BSOSE_JJASON_vert100_avg(ii,jj) = 99999999999;
            O2_BSOSE_JASOND_vert100_avg(ii,jj) = 99999999999;
            O2_BSOSE_JFM_vert100_avg(ii,jj) = 99999999999;
            O2_BSOSE_JFMAMJ_vert100_avg(ii,jj) = 99999999999;
            O2_BSOSE_JD_vert100_avg(ii,jj) = 99999999999;   
            O2_BSOSE_DJF_vert100_std(ii,jj) = 99999999999;
	        O2_BSOSE_DJFMAM_vert100_std(ii,jj) = 99999999999;
            O2_BSOSE_DN_vert100_std(ii,jj) = 99999999999;
            O2_BSOSE_JJA_vert100_std(ii,jj) = 99999999999;
            O2_BSOSE_JAS_vert100_std(ii,jj) = 99999999999;
            O2_BSOSE_JJASON_vert100_std(ii,jj) = 99999999999;
            O2_BSOSE_JASOND_vert100_std(ii,jj) = 99999999999;
            O2_BSOSE_JFM_vert100_std(ii,jj) = 99999999999;
            O2_BSOSE_JFMAMJ_vert100_std(ii,jj) = 99999999999;
            O2_BSOSE_JD_vert100_std(ii,jj) = 99999999999;
        end
    end
end

clear O2_temp

fprintf('finished O2 \n')

%% O2

%% NO3
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_5day_NO3.nc';
sd = floor(bsose_index_2/5);
nd = ceil((DD_length_time+30)/5);

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
DRF = ncread(str,'drF');
X = XCS;
Y = YCS;
lox = find(X>288,1)-1;
hix = find(X>352,1)+1;
loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);

nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);

NO3_temp = ncread(str,'TRAC04',[lox,loy,1,sd],[nn,mm,52,nd]);

NO3_series = zeros(nn,mm,nd);
NO3_series_100 = zeros(nn,mm,nd);
NO3_series_avg = zeros(nn,mm,nd);


for ii=1:nd
    NO3_series(:,:,ii) = sum(NO3_temp(:,:,:,ii).*Volume,3);
    NO3_series_100(:,:,ii) = sum(NO3_temp(:,:,1:12,ii).*Volume(:,:,1:12),3);
    NO3_series_avg(:,:,ii) = NO3_series(:,:,ii)./Height;
end

NO3_BSOSE_DJF_vert_avg = mean(NO3_series_avg(:,:,1:3),3);
NO3_BSOSE_DJFMAM_vert_avg = mean(NO3_series_avg(:,:,1:6),3);
NO3_BSOSE_DN_vert_avg = mean(NO3_series_avg(:,:,1:12),3);
NO3_BSOSE_JJA_vert_avg = mean(NO3_series_avg(:,:,7:9),3);
NO3_BSOSE_JAS_vert_avg = mean(NO3_series_avg(:,:,8:10),3);
NO3_BSOSE_JJASON_vert_avg = mean(NO3_series_avg(:,:,7:12),3);
NO3_BSOSE_JASOND_vert_avg = mean(NO3_series_avg(:,:,8:13),3);
NO3_BSOSE_JFM_vert_avg = mean(NO3_series_avg(:,:,2:4),3);
NO3_BSOSE_JFMAMJ_vert_avg = mean(NO3_series_avg(:,:,2:7),3);
NO3_BSOSE_JD_vert_avg = mean(NO3_series_avg(:,:,2:13),3);

NO3_BSOSE_DJF_vert_std = std(NO3_series_avg(:,:,1:3),0,3);
NO3_BSOSE_DJFMAM_vert_std = std(NO3_series_avg(:,:,1:6),0,3);
NO3_BSOSE_DN_vert_std = std(NO3_series_avg(:,:,1:12),0,3);
NO3_BSOSE_JJA_vert_std = std(NO3_series_avg(:,:,7:9),0,3);
NO3_BSOSE_JAS_vert_std = std(NO3_series_avg(:,:,8:10),0,3);
NO3_BSOSE_JJASON_vert_std = std(NO3_series_avg(:,:,7:12),0,3);
NO3_BSOSE_JASOND_vert_std = std(NO3_series_avg(:,:,8:13),0,3);
NO3_BSOSE_JFM_vert_std = std(NO3_series_avg(:,:,2:4),0,3);
NO3_BSOSE_JFMAMJ_vert_std = std(NO3_series_avg(:,:,2:7),0,3);
NO3_BSOSE_JD_vert_std = std(NO3_series_avg(:,:,2:13),0,3);

NO3_BSOSE_DJF_tvert_avg = mean(NO3_series(:,:,1:3),3);
NO3_BSOSE_DJFMAM_tvert_avg = mean(NO3_series(:,:,1:6),3);
NO3_BSOSE_DN_tvert_avg = mean(NO3_series(:,:,1:12),3);
NO3_BSOSE_JJA_tvert_avg = mean(NO3_series(:,:,7:9),3);
NO3_BSOSE_JAS_tvert_avg = mean(NO3_series(:,:,8:10),3);
NO3_BSOSE_JJASON_tvert_avg = mean(NO3_series(:,:,7:12),3);
NO3_BSOSE_JASOND_tvert_avg = mean(NO3_series(:,:,8:13),3);
NO3_BSOSE_JFM_tvert_avg = mean(NO3_series(:,:,2:4),3);
NO3_BSOSE_JFMAMJ_tvert_avg = mean(NO3_series(:,:,2:7),3);
NO3_BSOSE_JD_tvert_avg = mean(NO3_series(:,:,2:13),3);

NO3_BSOSE_DJF_tvert_std = std(NO3_series(:,:,1:3),0,3);
NO3_BSOSE_DJFMAM_tvert_std = std(NO3_series(:,:,1:6),0,3);
NO3_BSOSE_DN_tvert_std = std(NO3_series(:,:,1:12),0,3);
NO3_BSOSE_JJA_tvert_std = std(NO3_series(:,:,7:9),0,3);
NO3_BSOSE_JAS_tvert_std = std(NO3_series(:,:,8:10),0,3);
NO3_BSOSE_JJASON_tvert_std = std(NO3_series(:,:,7:12),0,3);
NO3_BSOSE_JASOND_tvert_std = std(NO3_series(:,:,8:13),0,3);
NO3_BSOSE_JFM_tvert_std = std(NO3_series(:,:,2:4),0,3);
NO3_BSOSE_JFMAMJ_tvert_std = std(NO3_series(:,:,2:7),0,3);
NO3_BSOSE_JD_tvert_std = std(NO3_series(:,:,2:13),0,3);

NO3_BSOSE_DJF_vert100_avg = mean(NO3_series_100(:,:,1:3),3);
NO3_BSOSE_DJFMAM_vert100_avg = mean(NO3_series_100(:,:,1:6),3);
NO3_BSOSE_DN_vert100_avg = mean(NO3_series_100(:,:,1:12),3);
NO3_BSOSE_JJA_vert100_avg = mean(NO3_series_100(:,:,7:9),3);
NO3_BSOSE_JAS_vert100_avg = mean(NO3_series_100(:,:,8:10),3);
NO3_BSOSE_JJASON_vert100_avg = mean(NO3_series_100(:,:,7:12),3);
NO3_BSOSE_JASOND_vert100_avg = mean(NO3_series_100(:,:,8:13),3);
NO3_BSOSE_JFM_vert100_avg = mean(NO3_series_100(:,:,2:4),3);
NO3_BSOSE_JFMAMJ_vert100_avg = mean(NO3_series_100(:,:,2:7),3);
NO3_BSOSE_JD_vert100_avg = mean(NO3_series_100(:,:,2:13),3);

NO3_BSOSE_DJF_vert100_std = std(NO3_series_100(:,:,1:3),0,3);
NO3_BSOSE_DJFMAM_vert100_std = std(NO3_series_100(:,:,1:6),0,3);
NO3_BSOSE_DN_vert100_std = std(NO3_series_100(:,:,1:12),0,3);
NO3_BSOSE_JJA_vert100_std = std(NO3_series_100(:,:,7:9),0,3);
NO3_BSOSE_JAS_vert100_std = std(NO3_series_100(:,:,8:10),0,3);
NO3_BSOSE_JJASON_vert100_std = std(NO3_series_100(:,:,7:12),0,3);
NO3_BSOSE_JASOND_vert100_std = std(NO3_series_100(:,:,8:13),0,3);
NO3_BSOSE_JFM_vert100_std = std(NO3_series_100(:,:,2:4),0,3);
NO3_BSOSE_JFMAMJ_vert100_std = std(NO3_series_100(:,:,2:7),0,3);
NO3_BSOSE_JD_vert100_std = std(NO3_series_100(:,:,2:13),0,3);

[m64,n64] = size(NO3_BSOSE_JJA_vert_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj,1)==0)
            NO3_BSOSE_DJF_vert_avg(ii,jj) = 99999999999;
	        NO3_BSOSE_DJFMAM_vert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_DN_vert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JJA_vert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JAS_vert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JJASON_vert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JASOND_vert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JFM_vert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JFMAMJ_vert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JD_vert_avg(ii,jj) = 99999999999;   
            NO3_BSOSE_DJF_vert_std(ii,jj) = 99999999999;
	        NO3_BSOSE_DJFMAM_vert_std(ii,jj) = 99999999999;
            NO3_BSOSE_DN_vert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JJA_vert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JAS_vert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JJASON_vert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JASOND_vert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JFM_vert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JFMAMJ_vert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JD_vert_std(ii,jj) = 99999999999; 
            NO3_BSOSE_DJF_tvert_avg(ii,jj) = 99999999999;
	        NO3_BSOSE_DJFMAM_tvert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_DN_tvert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JJA_tvert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JAS_tvert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JJASON_tvert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JASOND_tvert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JFM_tvert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JFMAMJ_tvert_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JD_tvert_avg(ii,jj) = 99999999999;   
            NO3_BSOSE_DJF_tvert_std(ii,jj) = 99999999999;
	        NO3_BSOSE_DJFMAM_tvert_std(ii,jj) = 99999999999;
            NO3_BSOSE_DN_tvert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JJA_tvert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JAS_tvert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JJASON_tvert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JASOND_tvert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JFM_tvert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JFMAMJ_tvert_std(ii,jj) = 99999999999;
            NO3_BSOSE_JD_tvert_std(ii,jj) = 99999999999; 
            NO3_BSOSE_DJF_vert100_avg(ii,jj) = 99999999999;
	        NO3_BSOSE_DJFMAM_vert100_avg(ii,jj) = 99999999999;
            NO3_BSOSE_DN_vert100_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JJA_vert100_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JAS_vert100_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JJASON_vert100_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JASOND_vert100_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JFM_vert100_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JFMAMJ_vert100_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JD_vert100_avg(ii,jj) = 99999999999;   
            NO3_BSOSE_DJF_vert100_std(ii,jj) = 99999999999;
	        NO3_BSOSE_DJFMAM_vert100_std(ii,jj) = 99999999999;
            NO3_BSOSE_DN_vert100_std(ii,jj) = 99999999999;
            NO3_BSOSE_JJA_vert100_std(ii,jj) = 99999999999;
            NO3_BSOSE_JAS_vert100_std(ii,jj) = 99999999999;
            NO3_BSOSE_JJASON_vert100_std(ii,jj) = 99999999999;
            NO3_BSOSE_JASOND_vert100_std(ii,jj) = 99999999999;
            NO3_BSOSE_JFM_vert100_std(ii,jj) = 99999999999;
            NO3_BSOSE_JFMAMJ_vert100_std(ii,jj) = 99999999999;
            NO3_BSOSE_JD_vert100_std(ii,jj) = 99999999999;
        end
    end
end

clear NO3_temp

fprintf('finished NO3 \n')

%% NO3

clearvars -except *_BSOSE_* *_series* XCS YCS

save THETA_BSOSE_vert THETA* XCS YCS
save DIC_BSOSE_vert DIC* XCS YCS
save O2_BSOSE_vert O2* XCS YCS
save NO3_BSOSE_vert NO3* XCS YCS







