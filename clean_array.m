function [processed_array] = clean_array(array,depth_name)
%% eliminates garbage signals
% array = [time,lat,lon,temp,salt,pres,dens,depth,QC];

time = array(:,1);
len_array = length(time);
keep_array = ones(len_array,1);
time_tol = 0.005;
depth_tol = 20;
depth_r = max(10,depth_name/35);

for ii=1:len_array
    if array(ii,8)>(-depth_name+depth_r)
        array(ii,:) = NaN;
        keep_array(ii) = 0;
    elseif array(ii,5)<32
        array(ii,:) = NaN;
        keep_array(ii) = 0;
    elseif ii>1
        if array(ii,1)-array(ii-1,1)<time_tol
            array(ii-1,:) = NaN;
            keep_array(ii-1) = 0;
        elseif abs(array(ii,8)-array(ii-1,8))>depth_tol
            array(ii,:) = NaN;
            array(ii-1,:) = NaN;
            keep_array(ii) = 0;
            keep_array(ii-1) = 0;
        end
    end
end

processed_array = array(keep_array==1,:);

fprintf('removed %g out of %g total obs \n \n',len_array-sum(keep_array),len_array)

end

