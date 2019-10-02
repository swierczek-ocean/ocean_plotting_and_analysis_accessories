function [mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(ooi_array)
%% calculates some descriptive stats for ooi array
% time input has to be a column, ooi_array input has to have 
% str_key format
%%
% str_key = '[time,lat,lon,temp,salt,pres,dens,depth,QC]';

time = ooi_array(:,1);
len_array = length(time);
mfreq = mean(time(2:len_array)-time(1:(len_array-1)));
mfreq = mfreq*24*60;
fprintf('average sampling frequency: %g minutes \n',mfreq)

depth = ooi_array(:,8);
mean_depth = mean(depth);
std_depth = std(depth);
depth_l = min(depth);
depth_h = max(depth);
fprintf('mean sample depth: %g meters \n',-mean_depth)
fprintf('stdev sample depth: %g meters \n',std_depth)
fprintf('min sample depth: %g meters \n',-depth_h)
fprintf('max sample depth: %g meters \n',-depth_l)
edges = floor(depth_l):2:ceil(depth_h);
h = histogram(depth,edges);
counts = h.Values;
[~,ind] = max(counts);
mode_depth = edges(ind)+1;
fprintf('mode sample depth: %g meters \n',-mode_depth)

depth_lim = mean_depth;% - 2*std_depth;

array_keep = ooi_array(ooi_array(:,8)>depth_lim,:);

mean_theta = mean(array_keep(:,4));
std_theta = std(array_keep(:,4));
mean_salt = mean(array_keep(:,5));
std_salt = std(array_keep(:,5));

fprintf('mean sample theta: %g C \n',mean_theta)
fprintf('stdev sample theta: %g C \n',std_theta)
fprintf('mean sample salinity: %g psu \n',mean_salt)
fprintf('stdev sample salinity: %g psu \n',std_salt)

max_lat = max(ooi_array(:,2));
min_lat = min(ooi_array(:,2));
fprintf('maximum north south drift: %g km \n',110*(max_lat-min_lat))
max_lon = max(ooi_array(:,3));
min_lon = min(ooi_array(:,3));
fprintf('maximum east west drift: %g km \n \n',85*(max_lon-min_lon))


end

