function [mfreq,mean_sst,std_sst,mean_sss,std_sss] = get_array_stats_met(ooi_array)
%% calculates some descriptive stats for ooi array
% time input has to be a column, ooi_array input has to have 
% str_key format
%%
% str_key_metbk = '[time,lat,lon,air_temp,pres,dlw,rain,relhum,
% sst,dsw,u5m,v5m,netsirr,sss,spfh2m,ctd_depth,relwindspd,tfluxup,
% lattfluxup,netlirr,senstfluxup,]';


time = ooi_array(:,1);
len_array = length(time);
mfreq = mean(time(2:len_array)-time(1:(len_array-1)));
mfreq = mfreq*24*60;
fprintf('average sampling frequency: %g minutes \n',mfreq)



mean_sst = mean(ooi_array(:,9));
std_sst = std(ooi_array(:,9));
mean_sss = mean(ooi_array(:,14));
std_sss = std(ooi_array(:,14));

fprintf('mean sample sst: %g C \n',mean_sst)
fprintf('stdev sample sst: %g C \n',std_sst)
fprintf('mean sample sss: %g psu \n',mean_sss)
fprintf('stdev sample sss: %g psu \n',std_sss)

mean_at = mean(ooi_array(:,4));
std_at = std(ooi_array(:,4));
mean_ap = mean(ooi_array(:,5));
std_ap = std(ooi_array(:,5));

fprintf('mean sample air temperature: %g C \n',mean_at)
fprintf('stdev sample air temperature: %g C \n',std_at)
fprintf('mean sample sss: %g psu \n',mean_ap)
fprintf('stdev sample sss: %g psu \n',std_ap)

end

