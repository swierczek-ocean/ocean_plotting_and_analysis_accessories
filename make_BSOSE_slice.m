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
thex = find(X==307.2500);

loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
YCS = YCS(loy:hiy);
HC = squeeze(hFacC(thex,loy:hiy,:));
clear hFacC
mm = length(YCS);

THETA_series = squeeze(ncread(str,'THETA',[thex,loy,1,sd],[1,mm,52,nd]));

THETA_BSOSE_DJF_slice_avg = mean(THETA_series(:,:,1:3),3);
THETA_BSOSE_DJFMAM_slice_avg = mean(THETA_series(:,:,1:6),3);
THETA_BSOSE_DN_slice_avg = mean(THETA_series(:,:,1:12),3);
THETA_BSOSE_JJA_slice_avg = mean(THETA_series(:,:,7:9),3);
THETA_BSOSE_JAS_slice_avg = mean(THETA_series(:,:,8:10),3);
THETA_BSOSE_JJASON_slice_avg = mean(THETA_series(:,:,7:12),3);
THETA_BSOSE_JASOND_slice_avg = mean(THETA_series(:,:,8:13),3);
THETA_BSOSE_JFM_slice_avg = mean(THETA_series(:,:,2:4),3);
THETA_BSOSE_JFMAMJ_slice_avg = mean(THETA_series(:,:,2:7),3);
THETA_BSOSE_JD_slice_avg = mean(THETA_series(:,:,2:13),3);

[m64,n64] = size(THETA_BSOSE_JJA_slice_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            THETA_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            THETA_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end

clear THETA_series

fprintf('finished THETA \n')

%% THETA

%% THETA
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Theta.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

THETA_series = squeeze(ncread(str,'THETA',[thex,loy,1,sd],[1,mm,52,nd]));

for ii=1:nd
    ii
    temp = THETA_series(:,:,ii);
    temp(HC(:,:)==0) = 99999999999;
    THETA_series(:,:,ii) = temp;
end

fprintf('finished THETA \n')

%% THETA


%% ETAN
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_SSH.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

ETAN_series = squeeze(ncread(str,'ETAN',[thex,loy,sd],[1,mm,nd]));

for ii=1:nd
    temp = ETAN_series(:,ii);
    temp(HC(:,1)==0) = NaN;
    ETAN_series(:,ii) = temp;
end

ETAN_mu = mean(ETAN_series(isnan(ETAN_series)==0));
ETAN_series = ETAN_series - ETAN_mu;
ETAN_series(isnan(ETAN_series)==0) = 0;

ETAN_BSOSE_DJF_slice_avg = mean(ETAN_series(:,1:DJF_length_time),2);
ETAN_BSOSE_DJF_slice_avg = ETAN_BSOSE_DJF_slice_avg -...
    mean(ETAN_BSOSE_DJF_slice_avg(isnan(ETAN_BSOSE_DJF_slice_avg)==0));
ETAN_BSOSE_DJFMAM_slice_avg = mean(ETAN_series(:,1:DM_length_time),2);
ETAN_BSOSE_DJFMAM_slice_avg = ETAN_BSOSE_DJFMAM_slice_avg -...
    mean(ETAN_BSOSE_DJFMAM_slice_avg(isnan(ETAN_BSOSE_DJFMAM_slice_avg)==0));
ETAN_BSOSE_DN_slice_avg = mean(ETAN_series(:,1:DD_length_time),2);
ETAN_BSOSE_DN_slice_avg = ETAN_BSOSE_DN_slice_avg -...
    mean(ETAN_BSOSE_DN_slice_avg(isnan(ETAN_BSOSE_DN_slice_avg)==0));
ETAN_BSOSE_JJA_slice_avg = mean(ETAN_series(:,JN_length_time:(JN_length_time+91)),2);
ETAN_BSOSE_JJA_slice_avg = ETAN_BSOSE_JJA_slice_avg -...
    mean(ETAN_BSOSE_JJA_slice_avg(isnan(ETAN_BSOSE_JJA_slice_avg)==0));
ETAN_BSOSE_JJASON_slice_avg = mean(ETAN_series(:,JN_length_time:DD_length_time),2);
ETAN_BSOSE_JJASON_slice_avg = ETAN_BSOSE_JJASON_slice_avg -...
    mean(ETAN_BSOSE_JJASON_slice_avg(isnan(ETAN_BSOSE_JJASON_slice_avg)==0));
ETAN_BSOSE_JFM_slice_avg = mean(ETAN_series(:,32:(DJF_length_time+31)),2);
ETAN_BSOSE_JFM_slice_avg = ETAN_BSOSE_JFM_slice_avg -...
    mean(ETAN_BSOSE_JFM_slice_avg(isnan(ETAN_BSOSE_JFM_slice_avg)==0));
ETAN_BSOSE_JFMAMJ_slice_avg = mean(ETAN_series(:,32:(DM_length_time+30)),2);
ETAN_BSOSE_JFMAMJ_slice_avg = ETAN_BSOSE_JFMAMJ_slice_avg -...
    mean(ETAN_BSOSE_JFMAMJ_slice_avg(isnan(ETAN_BSOSE_JFMAMJ_slice_avg)==0));
ETAN_BSOSE_JD_slice_avg = mean(ETAN_series(:,32:(DD_length_time+30)),2);
ETAN_BSOSE_JD_slice_avg = ETAN_BSOSE_JD_slice_avg -...
    mean(ETAN_BSOSE_JD_slice_avg(isnan(ETAN_BSOSE_JD_slice_avg)==0));
ETAN_BSOSE_JAS_slice_avg = mean(ETAN_series(:,(JN_length_time+30):(JN_length_time+121)),2);
ETAN_BSOSE_JAS_slice_avg = ETAN_BSOSE_JAS_slice_avg -...
    mean(ETAN_BSOSE_JAS_slice_avg(isnan(ETAN_BSOSE_JAS_slice_avg)==0));
ETAN_BSOSE_JASOND_slice_avg = mean(ETAN_series(:,(JN_length_time+30):(DD_length_time+30)),2);
ETAN_BSOSE_JASOND_slice_avg = ETAN_BSOSE_JASOND_slice_avg -...
    mean(ETAN_BSOSE_JASOND_slice_avg(isnan(ETAN_BSOSE_JASOND_slice_avg)==0));

ETAN_BSOSE_slice_std = std(ETAN_series(:,:),0,2);

fprintf('finished ETAN \n')

%% ETAN

%% PCO2
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_pCO2.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

PCO2_series = squeeze(ncread(str,'BLGPCO2',[thex,loy,sd],[1,mm,nd]));

for ii=1:nd
    temp = PCO2_series(:,ii);
    temp(HC(:,1)==0) = NaN;
    PCO2_series(:,ii) = temp;
end

PCO2_BSOSE_DJF_slice_avg = mean(PCO2_series(:,1:DJF_length_time),2);
PCO2_BSOSE_DJFMAM_slice_avg = mean(PCO2_series(:,1:DM_length_time),2);
PCO2_BSOSE_DN_slice_avg = mean(PCO2_series(:,1:DD_length_time),2);
PCO2_BSOSE_JJA_slice_avg = mean(PCO2_series(:,JN_length_time:(JN_length_time+91)),2);
PCO2_BSOSE_JJASON_slice_avg = mean(PCO2_series(:,JN_length_time:DD_length_time),2);
PCO2_BSOSE_JFM_slice_avg = mean(PCO2_series(:,32:(DJF_length_time+31)),2);
PCO2_BSOSE_JFMAMJ_slice_avg = mean(PCO2_series(:,32:(DM_length_time+30)),2);
PCO2_BSOSE_JD_slice_avg = mean(PCO2_series(:,32:(DD_length_time+30)),2);
PCO2_BSOSE_JAS_slice_avg = mean(PCO2_series(:,(JN_length_time+30):(JN_length_time+121)),2);
PCO2_BSOSE_JASOND_slice_avg = mean(PCO2_series(:,(JN_length_time+30):(DD_length_time+30)),2);

PCO2_BSOSE_slice_std = std(PCO2_series(:,:),0,2);

fprintf('finished PCO2 \n')

%% PCO2

%% MLD
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_MLD.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

MLD_series = squeeze(ncread(str,'BLGMLD',[thex,loy,sd],[1,mm,nd]));

MLD_BSOSE_DJF_slice_avg = mean(MLD_series(:,1:DJF_length_time),2);
MLD_BSOSE_DJFMAM_slice_avg = mean(MLD_series(:,1:DM_length_time),2);
MLD_BSOSE_DN_slice_avg = mean(MLD_series(:,1:DD_length_time),2);
MLD_BSOSE_JJA_slice_avg = mean(MLD_series(:,JN_length_time:(JN_length_time+91)),2);
MLD_BSOSE_JJASON_slice_avg = mean(MLD_series(:,JN_length_time:DD_length_time),2);
MLD_BSOSE_JFM_slice_avg = mean(MLD_series(:,32:(DJF_length_time+31)),2);
MLD_BSOSE_JFMAMJ_slice_avg = mean(MLD_series(:,32:(DM_length_time+30)),2);
MLD_BSOSE_JD_slice_avg = mean(MLD_series(:,32:(DD_length_time+30)),2);
MLD_BSOSE_JAS_slice_avg = mean(MLD_series(:,(JN_length_time+30):(JN_length_time+121)),2);
MLD_BSOSE_JASOND_slice_avg = mean(MLD_series(:,(JN_length_time+30):(DD_length_time+30)),2);

MLD_BSOSE_slice_std = std(MLD_series(:,:),0,2);


fprintf('finished MLD \n')

%% MLD

%% WVEL
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Wvel.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

WVEL_series = squeeze(ncread(str,'WVEL',[thex,loy,1,sd],[1,mm,52,nd]));

WVEL_BSOSE_DJF_slice_avg = mean(WVEL_series(:,:,1:DJF_length_time),3);
WVEL_BSOSE_DJFMAM_slice_avg = mean(WVEL_series(:,:,1:DM_length_time),3);
WVEL_BSOSE_DN_slice_avg = mean(WVEL_series(:,:,1:DD_length_time),3);
WVEL_BSOSE_JJA_slice_avg = mean(WVEL_series(:,:,JN_length_time:(JN_length_time+91)),3);
WVEL_BSOSE_JJASON_slice_avg = mean(WVEL_series(:,:,JN_length_time:DD_length_time),3);
WVEL_BSOSE_JFM_slice_avg = mean(WVEL_series(:,:,32:(DJF_length_time+31)),3);
WVEL_BSOSE_JFMAMJ_slice_avg = mean(WVEL_series(:,:,32:(DM_length_time+30)),3);
WVEL_BSOSE_JD_slice_avg = mean(WVEL_series(:,:,32:(DD_length_time+30)),3);
WVEL_BSOSE_JAS_slice_avg = mean(WVEL_series(:,:,(JN_length_time+30):(JN_length_time+121)),3);
WVEL_BSOSE_JASOND_slice_avg = mean(WVEL_series(:,:,(JN_length_time+30):(DD_length_time+30)),3);

WVEL_BSOSE_DJF_slice_std = std(WVEL_series(:,:,1:DJF_length_time),0,3);
WVEL_BSOSE_DJFMAM_slice_std = std(WVEL_series(:,:,1:DM_length_time),0,3);
WVEL_BSOSE_DN_slice_std = std(WVEL_series(:,:,1:DD_length_time),0,3);
WVEL_BSOSE_JJA_slice_std = std(WVEL_series(:,:,JN_length_time:(JN_length_time+91)),0,3);
WVEL_BSOSE_JJASON_slice_std = std(WVEL_series(:,:,JN_length_time:DD_length_time),0,3);
WVEL_BSOSE_JFM_slice_std = std(WVEL_series(:,:,32:(DJF_length_time+31)),0,3);
WVEL_BSOSE_JFMAMJ_slice_std = std(WVEL_series(:,:,32:(DM_length_time+30)),0,3);
WVEL_BSOSE_JD_slice_std = std(WVEL_series(:,:,32:(DD_length_time+30)),0,3);
WVEL_BSOSE_JAS_slice_std = std(WVEL_series(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
WVEL_BSOSE_JASOND_slice_std = std(WVEL_series(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);


for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            WVEL_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            WVEL_BSOSE_JJA_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_JJASON_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_DN_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_DJF_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_DJFMAM_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_JAS_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_JASOND_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_JD_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_JFM_slice_std(ii,jj) = 99999999999;
            WVEL_BSOSE_JFMAMJ_slice_std(ii,jj) = 99999999999;
        end
    end
end

for ii=1:nd
    ii
    temp = WVEL_series(:,:,ii);
    temp(HC(:,:)==0) = 99999999999;
    WVEL_series(:,:,ii) = temp;
end

fprintf('finished WVEL \n')

%% WVEL

%% UVEL
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Uvel.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

UVEL_series = squeeze(ncread(str,'UVEL',[thex,loy,1,sd],[1,mm,52,nd]));

UVEL_BSOSE_DJF_slice_avg = mean(UVEL_series(:,:,1:DJF_length_time),3);
UVEL_BSOSE_DJFMAM_slice_avg = mean(UVEL_series(:,:,1:DM_length_time),3);
UVEL_BSOSE_DN_slice_avg = mean(UVEL_series(:,:,1:DD_length_time),3);
UVEL_BSOSE_JJA_slice_avg = mean(UVEL_series(:,:,JN_length_time:(JN_length_time+91)),3);
UVEL_BSOSE_JJASON_slice_avg = mean(UVEL_series(:,:,JN_length_time:DD_length_time),3);
UVEL_BSOSE_JFM_slice_avg = mean(UVEL_series(:,:,32:(DJF_length_time+31)),3);
UVEL_BSOSE_JFMAMJ_slice_avg = mean(UVEL_series(:,:,32:(DM_length_time+30)),3);
UVEL_BSOSE_JD_slice_avg = mean(UVEL_series(:,:,32:(DD_length_time+30)),3);
UVEL_BSOSE_JAS_slice_avg = mean(UVEL_series(:,:,(JN_length_time+30):(JN_length_time+121)),3);
UVEL_BSOSE_JASOND_slice_avg = mean(UVEL_series(:,:,(JN_length_time+30):(DD_length_time+30)),3);

UVEL_BSOSE_DJF_slice_std = std(UVEL_series(:,:,1:DJF_length_time),0,3);
UVEL_BSOSE_DJFMAM_slice_std = std(UVEL_series(:,:,1:DM_length_time),0,3);
UVEL_BSOSE_DN_slice_std = std(UVEL_series(:,:,1:DD_length_time),0,3);
UVEL_BSOSE_JJA_slice_std = std(UVEL_series(:,:,JN_length_time:(JN_length_time+91)),0,3);
UVEL_BSOSE_JJASON_slice_std = std(UVEL_series(:,:,JN_length_time:DD_length_time),0,3);
UVEL_BSOSE_JFM_slice_std = std(UVEL_series(:,:,32:(DJF_length_time+31)),0,3);
UVEL_BSOSE_JFMAMJ_slice_std = std(UVEL_series(:,:,32:(DM_length_time+30)),0,3);
UVEL_BSOSE_JD_slice_std = std(UVEL_series(:,:,32:(DD_length_time+30)),0,3);
UVEL_BSOSE_JAS_slice_std = std(UVEL_series(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
UVEL_BSOSE_JASOND_slice_std = std(UVEL_series(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);


for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            UVEL_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            UVEL_BSOSE_JJA_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_JJASON_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_DN_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_DJF_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_DJFMAM_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_JAS_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_JASOND_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_JD_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_JFM_slice_std(ii,jj) = 99999999999;
            UVEL_BSOSE_JFMAMJ_slice_std(ii,jj) = 99999999999;
        end
    end
end

for ii=1:nd
    ii
    temp = UVEL_series(:,:,ii);
    temp(HC(:,:)==0) = 99999999999;
    UVEL_series(:,:,ii) = temp;
end

fprintf('finished UVEL \n')

%% UVEL

%% VVEL
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Vvel.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

VVEL_series = squeeze(ncread(str,'VVEL',[thex,loy,1,sd],[1,mm,52,nd]));

VVEL_BSOSE_DJF_slice_avg = mean(VVEL_series(:,:,1:DJF_length_time),3);
VVEL_BSOSE_DJFMAM_slice_avg = mean(VVEL_series(:,:,1:DM_length_time),3);
VVEL_BSOSE_DN_slice_avg = mean(VVEL_series(:,:,1:DD_length_time),3);
VVEL_BSOSE_JJA_slice_avg = mean(VVEL_series(:,:,JN_length_time:(JN_length_time+91)),3);
VVEL_BSOSE_JJASON_slice_avg = mean(VVEL_series(:,:,JN_length_time:DD_length_time),3);
VVEL_BSOSE_JFM_slice_avg = mean(VVEL_series(:,:,32:(DJF_length_time+31)),3);
VVEL_BSOSE_JFMAMJ_slice_avg = mean(VVEL_series(:,:,32:(DM_length_time+30)),3);
VVEL_BSOSE_JD_slice_avg = mean(VVEL_series(:,:,32:(DD_length_time+30)),3);
VVEL_BSOSE_JAS_slice_avg = mean(VVEL_series(:,:,(JN_length_time+30):(JN_length_time+121)),3);
VVEL_BSOSE_JASOND_slice_avg = mean(VVEL_series(:,:,(JN_length_time+30):(DD_length_time+30)),3);

VVEL_BSOSE_DJF_slice_std = std(VVEL_series(:,:,1:DJF_length_time),0,3);
VVEL_BSOSE_DJFMAM_slice_std = std(VVEL_series(:,:,1:DM_length_time),0,3);
VVEL_BSOSE_DN_slice_std = std(VVEL_series(:,:,1:DD_length_time),0,3);
VVEL_BSOSE_JJA_slice_std = std(VVEL_series(:,:,JN_length_time:(JN_length_time+91)),0,3);
VVEL_BSOSE_JJASON_slice_std = std(VVEL_series(:,:,JN_length_time:DD_length_time),0,3);
VVEL_BSOSE_JFM_slice_std = std(VVEL_series(:,:,32:(DJF_length_time+31)),0,3);
VVEL_BSOSE_JFMAMJ_slice_std = std(VVEL_series(:,:,32:(DM_length_time+30)),0,3);
VVEL_BSOSE_JD_slice_std = std(VVEL_series(:,:,32:(DD_length_time+30)),0,3);
VVEL_BSOSE_JAS_slice_std = std(VVEL_series(:,:,(JN_length_time+30):(JN_length_time+121)),0,3);
VVEL_BSOSE_JASOND_slice_std = std(VVEL_series(:,:,(JN_length_time+30):(DD_length_time+30)),0,3);


for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            VVEL_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            VVEL_BSOSE_JJA_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_JJASON_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_DN_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_DJF_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_DJFMAM_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_JAS_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_JASOND_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_JD_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_JFM_slice_std(ii,jj) = 99999999999;
            VVEL_BSOSE_JFMAMJ_slice_std(ii,jj) = 99999999999;
        end
    end
end

for ii=1:nd
    ii
    temp = VVEL_series(:,:,ii);
    temp(HC(:,:)==0) = 99999999999;
    VVEL_series(:,:,ii) = temp;
end

fprintf('finished VVEL \n')

%% VVEL

%% SALT
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_Salt.nc';
sd = 48;
nd = 13;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
thex = find(X==307.2500);

loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
YCS = YCS(loy:hiy);
HC = squeeze(hFacC(thex,loy:hiy,:));

mm = length(YCS);

SALT_series = squeeze(ncread(str,'SALT',[thex,loy,1,sd],[1,mm,52,nd]));

SALT_BSOSE_DJF_slice_avg = mean(SALT_series(:,:,1:3),3);
SALT_BSOSE_DJFMAM_slice_avg = mean(SALT_series(:,:,1:6),3);
SALT_BSOSE_DN_slice_avg = mean(SALT_series(:,:,1:12),3);
SALT_BSOSE_JJA_slice_avg = mean(SALT_series(:,:,7:9),3);
SALT_BSOSE_JAS_slice_avg = mean(SALT_series(:,:,8:10),3);
SALT_BSOSE_JJASON_slice_avg = mean(SALT_series(:,:,7:12),3);
SALT_BSOSE_JASOND_slice_avg = mean(SALT_series(:,:,8:13),3);
SALT_BSOSE_JFM_slice_avg = mean(SALT_series(:,:,2:4),3);
SALT_BSOSE_JFMAMJ_slice_avg = mean(SALT_series(:,:,2:7),3);
SALT_BSOSE_JD_slice_avg = mean(SALT_series(:,:,2:13),3);

[m64,n64] = size(SALT_BSOSE_JJA_slice_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            SALT_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            SALT_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end

clear SALT_series

fprintf('finished SALT \n')

%% SALT

%% TFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_surfTflx.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

TFLUX_series = squeeze(ncread(str,'TFLUX',[thex,loy,sd],[1,mm,nd]));

TFLUX_BSOSE_DJF_slice_avg = mean(TFLUX_series(:,1:DJF_length_time),2);
TFLUX_BSOSE_DJFMAM_slice_avg = mean(TFLUX_series(:,1:DM_length_time),2);
TFLUX_BSOSE_DN_slice_avg = mean(TFLUX_series(:,1:DD_length_time),2);
TFLUX_BSOSE_JJA_slice_avg = mean(TFLUX_series(:,JN_length_time:(JN_length_time+91)),2);
TFLUX_BSOSE_JJASON_slice_avg = mean(TFLUX_series(:,JN_length_time:DD_length_time),2);
TFLUX_BSOSE_JFM_slice_avg = mean(TFLUX_series(:,32:(DJF_length_time+31)),2);
TFLUX_BSOSE_JFMAMJ_slice_avg = mean(TFLUX_series(:,32:(DM_length_time+30)),2);
TFLUX_BSOSE_JD_slice_avg = mean(TFLUX_series(:,32:(DD_length_time+30)),2);
TFLUX_BSOSE_JAS_slice_avg = mean(TFLUX_series(:,(JN_length_time+30):(JN_length_time+121)),2);
TFLUX_BSOSE_JASOND_slice_avg = mean(TFLUX_series(:,(JN_length_time+30):(DD_length_time+30)),2);

TFLUX_BSOSE_slice_std = std(TFLUX_series(:,:),0,2);


fprintf('finished TFLUX \n')

%% TFLUX

%% SFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_surfSflx.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

SFLUX_series = squeeze(ncread(str,'SFLUX',[thex,loy,sd],[1,mm,nd]));

SFLUX_BSOSE_DJF_slice_avg = mean(SFLUX_series(:,1:DJF_length_time),2);
SFLUX_BSOSE_DJFMAM_slice_avg = mean(SFLUX_series(:,1:DM_length_time),2);
SFLUX_BSOSE_DN_slice_avg = mean(SFLUX_series(:,1:DD_length_time),2);
SFLUX_BSOSE_JJA_slice_avg = mean(SFLUX_series(:,JN_length_time:(JN_length_time+91)),2);
SFLUX_BSOSE_JJASON_slice_avg = mean(SFLUX_series(:,JN_length_time:DD_length_time),2);
SFLUX_BSOSE_JFM_slice_avg = mean(SFLUX_series(:,32:(DJF_length_time+31)),2);
SFLUX_BSOSE_JFMAMJ_slice_avg = mean(SFLUX_series(:,32:(DM_length_time+30)),2);
SFLUX_BSOSE_JD_slice_avg = mean(SFLUX_series(:,32:(DD_length_time+30)),2);
SFLUX_BSOSE_JAS_slice_avg = mean(SFLUX_series(:,(JN_length_time+30):(JN_length_time+121)),2);
SFLUX_BSOSE_JASOND_slice_avg = mean(SFLUX_series(:,(JN_length_time+30):(DD_length_time+30)),2);

SFLUX_BSOSE_slice_std = std(SFLUX_series(:,:),0,2);

fprintf('finished SFLUX \n')

%% SFLUX

%% CFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_surfCO2flx.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

CFLUX_series = squeeze(ncread(str,'BLGCFLX',[thex,loy,sd],[1,mm,nd]));

CFLUX_BSOSE_DJF_slice_avg = mean(CFLUX_series(:,1:DJF_length_time),2);
CFLUX_BSOSE_DJFMAM_slice_avg = mean(CFLUX_series(:,1:DM_length_time),2);
CFLUX_BSOSE_DN_slice_avg = mean(CFLUX_series(:,1:DD_length_time),2);
CFLUX_BSOSE_JJA_slice_avg = mean(CFLUX_series(:,JN_length_time:(JN_length_time+91)),2);
CFLUX_BSOSE_JJASON_slice_avg = mean(CFLUX_series(:,JN_length_time:DD_length_time),2);
CFLUX_BSOSE_JFM_slice_avg = mean(CFLUX_series(:,32:(DJF_length_time+31)),2);
CFLUX_BSOSE_JFMAMJ_slice_avg = mean(CFLUX_series(:,32:(DM_length_time+30)),2);
CFLUX_BSOSE_JD_slice_avg = mean(CFLUX_series(:,32:(DD_length_time+30)),2);
CFLUX_BSOSE_JAS_slice_avg = mean(CFLUX_series(:,(JN_length_time+30):(JN_length_time+121)),2);
CFLUX_BSOSE_JASOND_slice_avg = mean(CFLUX_series(:,(JN_length_time+30):(DD_length_time+30)),2);

CFLUX_BSOSE_slice_std = std(CFLUX_series(:,:),0,2);

fprintf('finished CFLUX \n')

%% CFLUX


%% OFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_surfO2flx.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

OFLUX_series = squeeze(ncread(str,'BLGOFLX',[thex,loy,sd],[1,mm,nd]));

OFLUX_BSOSE_DJF_slice_avg = mean(OFLUX_series(:,1:DJF_length_time),2);
OFLUX_BSOSE_DJFMAM_slice_avg = mean(OFLUX_series(:,1:DM_length_time),2);
OFLUX_BSOSE_DN_slice_avg = mean(OFLUX_series(:,1:DD_length_time),2);
OFLUX_BSOSE_JJA_slice_avg = mean(OFLUX_series(:,JN_length_time:(JN_length_time+91)),2);
OFLUX_BSOSE_JJASON_slice_avg = mean(OFLUX_series(:,JN_length_time:DD_length_time),2);
OFLUX_BSOSE_JFM_slice_avg = mean(OFLUX_series(:,32:(DJF_length_time+31)),2);
OFLUX_BSOSE_JFMAMJ_slice_avg = mean(OFLUX_series(:,32:(DM_length_time+30)),2);
OFLUX_BSOSE_JD_slice_avg = mean(OFLUX_series(:,32:(DD_length_time+30)),2);
OFLUX_BSOSE_JAS_slice_avg = mean(OFLUX_series(:,(JN_length_time+30):(JN_length_time+121)),2);
OFLUX_BSOSE_JASOND_slice_avg = mean(OFLUX_series(:,(JN_length_time+30):(DD_length_time+30)),2);

OFLUX_BSOSE_slice_std = std(OFLUX_series(:,:),0,2);

fprintf('finished OFLUX \n')

%% OFLUX

%% O2
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_O2.nc';
sd = 48;
nd = 13;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
thex = find(X==307.2500);

loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
YCS = YCS(loy:hiy);
HC = squeeze(hFacC(thex,loy:hiy,:));

mm = length(YCS);

O2_series = squeeze(ncread(str,'TRAC03',[thex,loy,1,sd],[1,mm,52,nd]));

O2_BSOSE_DJF_slice_avg = mean(O2_series(:,:,1:3),3);
O2_BSOSE_DJFMAM_slice_avg = mean(O2_series(:,:,1:6),3);
O2_BSOSE_DN_slice_avg = mean(O2_series(:,:,1:12),3);
O2_BSOSE_JJA_slice_avg = mean(O2_series(:,:,7:9),3);
O2_BSOSE_JAS_slice_avg = mean(O2_series(:,:,8:10),3);
O2_BSOSE_JJASON_slice_avg = mean(O2_series(:,:,7:12),3);
O2_BSOSE_JASOND_slice_avg = mean(O2_series(:,:,8:13),3);
O2_BSOSE_JFM_slice_avg = mean(O2_series(:,:,2:4),3);
O2_BSOSE_JFMAMJ_slice_avg = mean(O2_series(:,:,2:7),3);
O2_BSOSE_JD_slice_avg = mean(O2_series(:,:,2:13),3);

[m64,n64] = size(O2_BSOSE_JJA_slice_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            O2_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            O2_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end

clear O2_series

fprintf('finished O2 \n')

%% O2

%% O2
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_5day_O2.nc';
sd = floor(bsose_index_2/5);
nd = ceil((DD_length_time+30)/5);

O2_series = squeeze(ncread(str,'TRAC03',[thex,loy,1,sd],[1,mm,52,nd]));

for ii=1:nd
    ii
    temp = O2_series(:,:,ii);
    temp(HC(:,:)==0) = 99999999999;
    O2_series(:,:,ii) = temp;
end

fprintf('finished O2 \n')

%% O2

%% NO3
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_NO3.nc';
sd = 48;
nd = 13;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
thex = find(X==307.2500);

loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
YCS = YCS(loy:hiy);
HC = squeeze(hFacC(thex,loy:hiy,:));

mm = length(YCS);

NO3_series = squeeze(ncread(str,'TRAC04',[thex,loy,1,sd],[1,mm,52,nd]));

NO3_BSOSE_DJF_slice_avg = mean(NO3_series(:,:,1:3),3);
NO3_BSOSE_DJFMAM_slice_avg = mean(NO3_series(:,:,1:6),3);
NO3_BSOSE_DN_slice_avg = mean(NO3_series(:,:,1:12),3);
NO3_BSOSE_JJA_slice_avg = mean(NO3_series(:,:,7:9),3);
NO3_BSOSE_JAS_slice_avg = mean(NO3_series(:,:,8:10),3);
NO3_BSOSE_JJASON_slice_avg = mean(NO3_series(:,:,7:12),3);
NO3_BSOSE_JASOND_slice_avg = mean(NO3_series(:,:,8:13),3);
NO3_BSOSE_JFM_slice_avg = mean(NO3_series(:,:,2:4),3);
NO3_BSOSE_JFMAMJ_slice_avg = mean(NO3_series(:,:,2:7),3);
NO3_BSOSE_JD_slice_avg = mean(NO3_series(:,:,2:13),3);

[m64,n64] = size(NO3_BSOSE_JJA_slice_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            NO3_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            NO3_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end

clear NO3_series

fprintf('finished NO3 \n')

%% NO3

%% NO3
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_5day_NO3.nc';
sd = floor(bsose_index_2/5);
nd = ceil((DD_length_time+30)/5);

NO3_series = squeeze(ncread(str,'TRAC04',[thex,loy,1,sd],[1,mm,52,nd]));

for ii=1:nd
    ii
    temp = NO3_series(:,:,ii);
    temp(HC(:,:)==0) = 99999999999;
    NO3_series(:,:,ii) = temp;
end

fprintf('finished NO3 \n')

%% NO3

%% DIC
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_monthly_DIC.nc';
sd = 48;
nd = 13;

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
thex = find(X==307.2500);

loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
YCS = YCS(loy:hiy);
HC = squeeze(hFacC(thex,loy:hiy,:));

mm = length(YCS);

DIC_series = squeeze(ncread(str,'TRAC01',[thex,loy,1,sd],[1,mm,52,nd]));

DIC_BSOSE_DJF_slice_avg = mean(DIC_series(:,:,1:3),3);
DIC_BSOSE_DJFMAM_slice_avg = mean(DIC_series(:,:,1:6),3);
DIC_BSOSE_DN_slice_avg = mean(DIC_series(:,:,1:12),3);
DIC_BSOSE_JJA_slice_avg = mean(DIC_series(:,:,7:9),3);
DIC_BSOSE_JAS_slice_avg = mean(DIC_series(:,:,8:10),3);
DIC_BSOSE_JJASON_slice_avg = mean(DIC_series(:,:,7:12),3);
DIC_BSOSE_JASOND_slice_avg = mean(DIC_series(:,:,8:13),3);
DIC_BSOSE_JFM_slice_avg = mean(DIC_series(:,:,2:4),3);
DIC_BSOSE_JFMAMJ_slice_avg = mean(DIC_series(:,:,2:7),3);
DIC_BSOSE_JD_slice_avg = mean(DIC_series(:,:,2:13),3);

[m64,n64] = size(DIC_BSOSE_JJA_slice_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            DIC_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            DIC_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end

clear DIC_series

fprintf('finished DIC \n')

%% DIC

%% DIC
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_5day_DIC.nc';
sd = floor(bsose_index_2/5);
nd = ceil((DD_length_time+30)/5);

DIC_series = squeeze(ncread(str,'TRAC01',[thex,loy,1,sd],[1,mm,52,nd]));

for ii=1:nd
    ii
    temp = DIC_series(:,:,ii);
    temp(HC(:,:)==0) = 99999999999;
    DIC_series(:,:,ii) = temp;
end

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
thex = find(X==307.2500);

loy = find(Y>-60,1)-1;
hiy = find(Y>-30,1)+1;
YCS = YCS(loy:hiy);
HC = squeeze(hFacC(thex,loy:hiy,:));

mm = length(YCS);

ALK_series = squeeze(ncread(str,'TRAC02',[thex,loy,1,sd],[1,mm,52,nd]));

ALK_BSOSE_DJF_slice_avg = mean(ALK_series(:,:,1:3),3);
ALK_BSOSE_DJFMAM_slice_avg = mean(ALK_series(:,:,1:6),3);
ALK_BSOSE_DN_slice_avg = mean(ALK_series(:,:,1:12),3);
ALK_BSOSE_JJA_slice_avg = mean(ALK_series(:,:,7:9),3);
ALK_BSOSE_JAS_slice_avg = mean(ALK_series(:,:,8:10),3);
ALK_BSOSE_JJASON_slice_avg = mean(ALK_series(:,:,7:12),3);
ALK_BSOSE_JASOND_slice_avg = mean(ALK_series(:,:,8:13),3);
ALK_BSOSE_JFM_slice_avg = mean(ALK_series(:,:,2:4),3);
ALK_BSOSE_JFMAMJ_slice_avg = mean(ALK_series(:,:,2:7),3);
ALK_BSOSE_JD_slice_avg = mean(ALK_series(:,:,2:13),3);

[m64,n64] = size(ALK_BSOSE_JJA_slice_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            ALK_BSOSE_DJF_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_DJFMAM_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_DN_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_JJA_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_JAS_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_JJASON_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_JASOND_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_JFM_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_JFMAMJ_slice_avg(ii,jj) = 99999999999;
            ALK_BSOSE_JD_slice_avg(ii,jj) = 99999999999;
        end
    end
end

clear ALK_series

fprintf('finished ALK \n')
%% ALK



% clear sd nd char bsose_* *_length_* *_day_* m64 n64 temp

clearvars -except *_BSOSE_* *_series HC XCS YCS

save BSOSE_slice_avgs








toc()