% make "clim" from bgc-Argo

% path to ncloads.m and make_mitgcm_profiles_bgc.m
% addpath ~/scripts_m

% First, read profiles from all years
% (each year is in a separate file)

% initialize
prof_Tall=[];
prof_Sall=[];
prof_latall=[];
prof_lonall=[];
prof_dateall=[];
prof_YYYYMMDDall=[];
prof_HHMMSSall=[];
prof_Tweightall=[];
prof_Sweightall=[];

t1=1;

for yr=2005:2016

 filename = ['SIO_SO_' num2str(yr) '_XBT.nc'];
 
 % I read using ncloads, but one could use ncread or other matlab function
 ncloads(filename);

 t2=t1+size(prof_T,1)-1;
 
 prof_Tall(t1:t2,:)=prof_T;
 prof_Sall(t1:t2,:)=prof_S;
 prof_latall(t1:t2,:)=prof_lat;
 prof_lonall(t1:t2,:)=prof_lon;
 prof_dateall(t1:t2,:)=prof_date;
 prof_YYYYMMDDall(t1:t2,:)=prof_YYYYMMDD;
 prof_HHMMSSall(t1:t2,:)=prof_HHMMSS;
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
    Raw(t).lat = prof_latall(t,:);
    Raw(t).lon = prof_lonall(t,:);
    Raw(t).pnum_txt = {'sio clim'}; 
    Raw(t).t_w = prof_Tweightall(t,:);
    Raw(t).s_w = prof_Sweightall(t,:);
    Raw(t).t_ERR = 0*Raw(t).t;
    Raw(t).s_ERR = 0*Raw(t).s;
    Raw(t).point = 0;
    Raw(t).basin = 0;
    Raw(t).dataset = 'SIOclim';
    Raw(t).descr = {'SIOclim'};
end

% This is where we make it a "climatology" 
% We will write a file for each year we want this climatology
% For each profile, change the year, keep the month and day

for yr1=2016:2017

for t=1:t2-1
 prof_YYYYMMDDall(t,:) = yr1*10000+rem(prof_YYYYMMDDall(t,:),10000);
 Raw(t).ymd = prof_YYYYMMDDall(t,:);
 Raw(t).filename = ['SIO_clim_' num2str(yr1)];
end

make_mitgcm_profiles_bgc(Raw);

end


