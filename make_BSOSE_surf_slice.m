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

ETAN_BSOSE_DJF_slice_avg = mean(ETAN_series(:,1:DJF_length_time),2);
ETAN_BSOSE_DJFMAM_slice_avg = mean(ETAN_series(:,1:DM_length_time),2);
ETAN_BSOSE_DN_slice_avg = mean(ETAN_series(:,1:DD_length_time),2);
ETAN_BSOSE_JJA_slice_avg = mean(ETAN_series(:,JN_length_time:(JN_length_time+91)),2);
ETAN_BSOSE_JJASON_slice_avg = mean(ETAN_series(:,JN_length_time:DD_length_time),2);
ETAN_BSOSE_JFM_slice_avg = mean(ETAN_series(:,32:(DJF_length_time+31)),2);
ETAN_BSOSE_JFMAMJ_slice_avg = mean(ETAN_series(:,32:(DM_length_time+30)),2);
ETAN_BSOSE_JD_slice_avg = mean(ETAN_series(:,32:(DD_length_time+30)),2);
ETAN_BSOSE_JAS_slice_avg = mean(ETAN_series(:,(JN_length_time+30):(JN_length_time+121)),2);
ETAN_BSOSE_JASOND_slice_avg = mean(ETAN_series(:,(JN_length_time+30):(DD_length_time+30)),2);


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

for ii=1:nd
    temp = MLD_series(:,ii);
    temp(HC(:,1)==0) = NaN;
    MLD_series(:,ii) = temp;
end

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

%% TFLUX
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_surfTflx.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

TFLUX_series = squeeze(ncread(str,'TFLUX',[thex,loy,sd],[1,mm,nd]));

for ii=1:nd
    temp = TFLUX_series(:,ii);
    temp(HC(:,1)==0) = NaN;
    TFLUX_series(:,ii) = temp;
end

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

for ii=1:nd
    temp = SFLUX_series(:,ii);
    temp(HC(:,1)==0) = NaN;
    SFLUX_series(:,ii) = temp;
end

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

for ii=1:nd
    temp = CFLUX_series(:,ii);
    temp(HC(:,1)==0) = NaN;
    CFLUX_series(:,ii) = temp;
end

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

for ii=1:nd
    temp = OFLUX_series(:,ii);
    temp(HC(:,1)==0) = NaN;
    OFLUX_series(:,ii) = temp;
end

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


% clear sd nd char bsose_* *_length_* *_day_* m64 n64 temp

clearvars -except *_BSOSE_* *_series HC XCS YCS

save BSOSE_surf_slice_avgs








toc()