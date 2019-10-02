function processed_ooi_array = process_OOI_hourly(ooi_array,time)
%% looks for long stretches of subhourly data with no breaks, 
%% then saves them and averages into hourly bins
% time input has to be a column, ooi_array input has to have 
% str_key format (without last two columns)
%%

str_key = '[time,lat,lon,temp,salt,pres,dens,depth,obs_exist,counter]';

num_hours = length(time);

processed_ooi_array = [time,NaN.*ones(num_hours,9)];

ooi_time = ooi_array(:,1);

%% convert in situ temperature to potential temperature
% first get absolute salinity
SA = gsw_SA_from_SP(ooi_array(:,5),ooi_array(:,6),...
    ooi_array(:,3),ooi_array(:,2));
ooi_array(:,4) = gsw_pt0_from_t(SA,...
    ooi_array(:,4),ooi_array(:,6));
%% end

%% first hour
ind1 = find(ooi_time>time(1),1);
ind2 = find(ooi_time>time(2),1)-1;

if ind2>ind1
    processed_ooi_array(1,2:8) = mean(ooi_array(ind1:ind2,2:8),1);
    processed_ooi_array(1,9) = 1;
    counter = 1;
    processed_ooi_array(1,10) = counter;
else
    counter = 0;
    processed_ooi_array(1,10) = counter;
    processed_ooi_array(1,9) = 0;
end
%% end first hour

%% second to second to last hour
for ii=2:(num_hours-1)
    ind1 = find(ooi_time>time(ii),1);
    ind2 = find(ooi_time>time(ii+1),1)-1;
    
    if ind2>ind1
        processed_ooi_array(ii,2:8) = mean(ooi_array(ind1:ind2,2:8),1);
        processed_ooi_array(ii,9) = 1;
        counter = counter + 1;
        processed_ooi_array(ii,10) = counter;
    else
        counter = 0;
        processed_ooi_array(ii,10) = counter;
        processed_ooi_array(ii,9) = 0;
    end
end
%% end second to second to last hour

%% last hour
ind1 = find(ooi_time>time(num_hours),1);
ind2 = find(ooi_time>(time(num_hours)+(1/24)),1)-1;

if ind2>ind1
    processed_ooi_array(num_hours,2:8) = mean(ooi_array(ind1:ind2,2:8),1);
    processed_ooi_array(num_hours,9) = 1;
    counter = counter + 1;
    processed_ooi_array(num_hours,10) = counter;
else
    processed_ooi_array(num_hours,10) = 0;
    processed_ooi_array(num_hours,9) = 0;
end
%% end last hour

%% finding length of consecutive hour series
num_obs = sum(processed_ooi_array(:,9));
fprintf('   %g hours out of %g total hours have obs \n \n',num_obs,num_hours)
fprintf('   %g hours out of %g total hours do not have obs \n \n',...
    num_hours - num_obs,num_hours)

max_consec_obs = max(processed_ooi_array(:,10));
fprintf('   longest set of consecutive hours with obs: %g \n \n',max_consec_obs)
%% end finding yadda yadda



% %% grab only the longest series
% ind2 = find(processed_ooi_array(:,10)==max_consec_obs);
% processed_ooi_array = processed_ooi_array((ind2-max_consec_obs+1):ind2,:);
% %%

end

