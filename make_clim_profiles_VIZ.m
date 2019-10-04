% make "clim" from bgc-Argo

% path to ncloads.m and make_mitgcm_profiles_bgc.m
% addpath ~/scripts_m

% First, read profiles from all years
% (each year is in a separate file)

% initialize
prof_DICall=[];
prof_ALKall=[];
prof_PHall=[];
prof_PCOall=[];
prof_O2all=[];
prof_NO3all=[];
prof_Tall=[];
prof_Sall=[];
prof_latall=[];
prof_lonall=[];
prof_dateall=[];
prof_YYYYMMDDall=[];
prof_HHMMSSall=[];
prof_DICweightall=[];
prof_ALKweightall=[];
prof_PHweightall=[];
prof_PCOweightall=[];
prof_O2weightall=[];
prof_NO3weightall=[];
prof_Tweightall=[];
prof_Sweightall=[];

t1=1;

for yr=2012:2013

 filename = ['VIZ_SO_' num2str(yr) '_PFL.nc'];
 
 % I read using ncloads, but one could use ncread or other matlab function
 ncloads(filename);

 t2=t1+size(prof_DIC_LIAR,1)-1;
 
 prof_DICall(t1:t2,:)=prof_DIC_LIAR;
 prof_ALKall(t1:t2,:)=prof_ALK_LIAR;
 prof_PHall(t1:t2,:)=prof_PH;
 prof_PCOall(t1:t2,:)=prof_PCO_LIAR;
 prof_O2all(t1:t2,:)=prof_O2;
 prof_NO3all(t1:t2,:)=prof_NO3;
 prof_Tall(t1:t2,:)=prof_T;
 prof_Sall(t1:t2,:)=prof_S;
 prof_latall(t1:t2,:)=prof_lat;
 prof_lonall(t1:t2,:)=prof_lon;
 prof_dateall(t1:t2,:)=prof_date;
 prof_YYYYMMDDall(t1:t2,:)=prof_YYYYMMDD;
 prof_HHMMSSall(t1:t2,:)=prof_HHMMSS;
 prof_DICweightall(t1:t2,:)=prof_DIC_LIARweight;
 prof_ALKweightall(t1:t2,:)=prof_ALK_LIARweight;
 prof_PHweightall(t1:t2,:)=prof_PHweight;
 prof_PCOweightall(t1:t2,:)=prof_PCO_LIARweight;
 prof_O2weightall(t1:t2,:)=prof_O2weight;
 prof_NO3weightall(t1:t2,:)=prof_NO3weight;
 prof_Tweightall(t1:t2,:)=prof_Tweight;
 prof_Sweightall(t1:t2,:)=prof_Sweight;
 
 t1=t2+1;

end

for yr=2014

 filename = ['VIZ_SO_' num2str(yr) '_PFL.nc'];
 
 % I read using ncloads, but one could use ncread or other matlab function
 ncloads(filename);

 t2=t1+size(prof_DIC,1)-1;
 
 prof_DICall(t1:t2,:)=prof_DIC;
 prof_ALKall(t1:t2,:)=prof_ALK;
 prof_PHall(t1:t2,:)=prof_PH;
 prof_PCOall(t1:t2,:)=prof_PCO;
 prof_O2all(t1:t2,:)=prof_O2;
 prof_NO3all(t1:t2,:)=prof_NO3;
 prof_Tall(t1:t2,:)=prof_T;
 prof_Sall(t1:t2,:)=prof_S;
 prof_latall(t1:t2,:)=prof_lat;
 prof_lonall(t1:t2,:)=prof_lon;
 prof_dateall(t1:t2,:)=prof_date;
 prof_YYYYMMDDall(t1:t2,:)=prof_YYYYMMDD;
 prof_HHMMSSall(t1:t2,:)=prof_HHMMSS;
 prof_DICweightall(t1:t2,:)=prof_DIC_LIARweight;
 prof_ALKweightall(t1:t2,:)=prof_ALKweight;
 prof_PHweightall(t1:t2,:)=prof_PHweight;
 prof_PCOweightall(t1:t2,:)=prof_PCOweight;
 prof_O2weightall(t1:t2,:)=prof_O2weight;
 prof_NO3weightall(t1:t2,:)=prof_NO3weight;
 prof_Tweightall(t1:t2,:)=prof_Tweight;
 prof_Sweightall(t1:t2,:)=prof_Sweight;
 
 t1=t2+1;

end

for yr=2015:2018

 filename = ['VIZ_SO_' num2str(yr) '_PFL.nc'];
 
 % I read using ncloads, but one could use ncread or other matlab function
 ncloads(filename);

 t2=t1+size(prof_DIC,1)-1;
 
 prof_DICall(t1:t2,:)=prof_DIC;
 prof_ALKall(t1:t2,:)=prof_ALK;
 prof_PHall(t1:t2,:)=prof_PH;
 prof_PCOall(t1:t2,:)=prof_PCO;
 prof_O2all(t1:t2,:)=prof_O2;
 prof_NO3all(t1:t2,:)=prof_NO3;
 prof_Tall(t1:t2,:)=prof_T;
 prof_Sall(t1:t2,:)=prof_S;
 prof_latall(t1:t2,:)=prof_lat;
 prof_lonall(t1:t2,:)=prof_lon;
 prof_dateall(t1:t2,:)=prof_date;
 prof_YYYYMMDDall(t1:t2,:)=prof_YYYYMMDD;
 prof_HHMMSSall(t1:t2,:)=prof_HHMMSS;
 prof_DICweightall(t1:t2,:)=prof_DICweight;
 prof_ALKweightall(t1:t2,:)=prof_ALKweight;
 prof_PHweightall(t1:t2,:)=prof_PHweight;
 prof_PCOweightall(t1:t2,:)=prof_PCOweight;
 prof_O2weightall(t1:t2,:)=prof_O2weight;
 prof_NO3weightall(t1:t2,:)=prof_NO3weight;
 prof_Tweightall(t1:t2,:)=prof_Tweight;
 prof_Sweightall(t1:t2,:)=prof_Sweight;
 
 t1=t2+1;

end

% Now write it all in a structured array

for t=1:t2-1
    Raw(t).hms = prof_HHMMSSall(t,:);
    Raw(t).t = prof_Tall(t,:);
    Raw(t).s = prof_Sall(t,:);
    Raw(t).depth = prof_depth;
    Raw(t).o2 = prof_O2all(t,:);
    Raw(t).no3 = prof_NO3all(t,:);
    Raw(t).dic = prof_DICall(t,:);
    Raw(t).alk = prof_ALKall(t,:);
    Raw(t).ph = prof_PHall(t,:);
    Raw(t).pco = prof_PCOall(t,:);
    Raw(t).lat = prof_latall(t,:);
    Raw(t).lon = prof_lonall(t,:);
    Raw(t).pnum_txt = {'viz clim'}; 
    Raw(t).t_w = prof_Tweightall(t,:);
    Raw(t).s_w = prof_Sweightall(t,:);
    Raw(t).o2_w = prof_O2weightall(t,:);
    Raw(t).no3_w = prof_NO3weightall(t,:);
    Raw(t).dic_w = prof_DICweightall(t,:);
    Raw(t).alk_w = prof_ALKweightall(t,:);
    Raw(t).ph_w = prof_PHweightall(t,:);
    Raw(t).pco_w = prof_PCOweightall(t,:);
    Raw(t).t_ERR = 0*Raw(t).t;
    Raw(t).s_ERR = 0*Raw(t).s;
    Raw(t).point = 0;
    Raw(t).basin = 0;
    Raw(t).dataset = 'VIZclim';
    Raw(t).descr = {'VIZclim'};
end

% This is where we make it a "climatology" 
% We will write a file for each year we want this climatology
% For each profile, change the year, keep the month and day

for yr1=2016:2017

for t=1:t2-1
 prof_YYYYMMDDall(t,:) = yr1*10000+rem(prof_YYYYMMDDall(t,:),10000);
 Raw(t).ymd = prof_YYYYMMDDall(t,:);
 Raw(t).filename = ['VIZclim_' num2str(yr1)];
end

make_mitgcm_profiles_bgc(Raw);

end


