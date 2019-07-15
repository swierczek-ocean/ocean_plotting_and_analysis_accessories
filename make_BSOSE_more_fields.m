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
HC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);


%% PCO2
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_pCO2.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

PCO2_BSOSE = ncread(str,'BLGPCO2',[lox,loy,sd],[nn,mm,nd]);
%% PCO2


%% curl
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Uvel.nc';
sd = bsose_index_2;
nd = DD_length_time+30;

UVEL_BSOSE = ncread(str,'UVEL',[lox,loy,1,sd],[nn,mm,1,nd]);
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Vvel.nc';
VVEL_BSOSE = ncread(str,'VVEL',[lox,loy,1,sd],[nn,mm,1,nd]);

CURL_BSOSE = zeros(size(UVEL_BSOSE));
CAV_BSOSE = zeros(size(UVEL_BSOSE));

for ii=1:395
    [CURL_BSOSE(:,:,ii),CAV_BSOSE(:,:,ii)] = curl(XCS,YCS,...
        UVEL_BSOSE(:,:,ii),VVEL_BSOSE(:,:,ii));
end
%% curl

%% WVEL
str = '/data/SOSE/SOSE/SO6/ITER122/bsose_i122_2013to2017_1day_Wvel.nc';
sd = bsose_index_2;
nd = DD_length_time+30;
WVEL190_BSOSE = ncread(str,'WVEL',[lox,loy,20,sd],[nn,mm,1,nd]);
%% WVEL 

for ii=1:395
    CURL_temp = CURL_BSOSE(:,:,ii);
    CAV_temp = CAV_BSOSE(:,:,ii);
    PCO2_temp = PCO2_BSOSE(:,:,ii);
    WVEL190_temp = WVEL190_BSOSE(:,:,ii);
    
    CURL_temp(HC(:,:,1)==0) = 99999999999;
    CAV_temp(HC(:,:,1)==0) = 99999999999;
    PCO2_temp(HC(:,:,1)==0) = 99999999999;
    WVEL190_temp(HC(:,:,20)==0) = 99999999999;
    
    CURL_BSOSE(:,:,ii) = CURL_temp;
    CAV_BSOSE(:,:,ii) = CAV_temp;
    PCO2_BSOSE(:,:,ii) = PCO2_temp;
    WVEL190_BSOSE(:,:,ii) = WVEL190_temp;
end



clearvars -except WVEL190_BSOSE CAV_BSOSE CURL_BSOSE PCO2_BSOSE XCS YCS

save BSOSE_OTHERS



toc()