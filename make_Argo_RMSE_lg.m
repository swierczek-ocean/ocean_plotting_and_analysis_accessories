clear
close all
clc
tic()

load ../2020_02_February_analysis/PROFILES/THETA_USGO_WO_2017_PFL_D_3

ind1 = find(prof_lat>-58.8);
ind2 = find(prof_lat<-32);

ind3 = find(prof_lon>290);
ind4 = find(prof_lon<349.8);

ind5 = intersect(ind1,ind2);
ind6 = intersect(ind3,ind4);
box_ind = intersect(ind5,ind6);
clear ind*

prof_lat = prof_lat(box_ind);
prof_lon = prof_lon(box_ind);
mltime = mltime(box_ind);

prof_Tdif = prof_Tdif(box_ind,:);
prof_Tdifn = prof_Tdifn(box_ind,:);
prof_Tmod = prof_Tmod(box_ind,:);
prof_Tobs = prof_Tobs(box_ind,:);


prof_mean = zeros(97,1);

for ii=1:78
    temp = prof_Tdif(:,ii);
    temp = temp(isnan(temp)==0);
    prof_mean(ii) = mean(temp);
    clear temp
end

A = 2357 - sum(isnan(prof_Tdif),1)';

[[4:100]',prof_depth,A,prof_mean]

big_array = [mltime,prof_lon',prof_lat',prof_Tdif];

big_array = sortrows(big_array,1);

strg = 'time bin : 0-200m : 200-400m : 400-600m : 600-800m : 800-1000m : 1000-1500m : 1500-2000m : 0-1000m : 1000-2000m : 0-2000m';

dates = 736696:5:737060;
datesm = dates(1:72) + 2.5;

RMSE3 = [datesm',zeros(72,10)];

for ii=1:72
    xlo = find(big_array(:,1)>dates(ii),1);
    xhi = find(big_array(:,1)>dates(ii+1),1)-1;
    temp = big_array(xlo:xhi,4:39);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,2) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,40:53);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,3) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,54:60);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,4) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,61:64);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,5) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,65:69);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,6) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,70:74);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,7) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,75:80);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,8) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,4:68);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,9) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,69:80);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,10) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,4:80);
    temp = temp(isnan(temp)==0);
    RMSE3(ii,11) = rmse(temp);
    clear temp
end

load ../2020_02_February_analysis/PROFILES/THETA_USGO_WO_2017_PFL_D_6

ind1 = find(prof_lat>-58.8);
ind2 = find(prof_lat<-32);

ind3 = find(prof_lon>290);
ind4 = find(prof_lon<349.8);

ind5 = intersect(ind1,ind2);
ind6 = intersect(ind3,ind4);
box_ind = intersect(ind5,ind6);
clear ind*

prof_lat = prof_lat(box_ind);
prof_lon = prof_lon(box_ind);
mltime = mltime(box_ind);

prof_Tdif = prof_Tdif(box_ind,:);
prof_Tdifn = prof_Tdifn(box_ind,:);
prof_Tmod = prof_Tmod(box_ind,:);
prof_Tobs = prof_Tobs(box_ind,:);


prof_mean = zeros(97,1);

for ii=1:78
    temp = prof_Tdif(:,ii);
    temp = temp(isnan(temp)==0);
    prof_mean(ii) = mean(temp);
    clear temp
end

A = 2357 - sum(isnan(prof_Tdif),1)';

[[4:100]',prof_depth,A,prof_mean]

big_array = [mltime,prof_lon',prof_lat',prof_Tdif];

big_array = sortrows(big_array,1);

strg = 'time bin : 0-200m : 200-400m : 400-600m : 600-800m : 800-1000m : 1000-1500m : 1500-2000m : 0-1000m : 1000-2000m : 0-2000m';

dates = 736696:5:737060;
datesm = dates(1:72) + 2.5;

RMSE6 = [datesm',zeros(72,10)];

for ii=1:72
    xlo = find(big_array(:,1)>dates(ii),1);
    xhi = find(big_array(:,1)>dates(ii+1),1)-1;
    temp = big_array(xlo:xhi,4:39);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,2) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,40:53);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,3) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,54:60);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,4) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,61:64);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,5) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,65:69);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,6) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,70:74);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,7) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,75:80);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,8) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,4:68);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,9) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,69:80);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,10) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,4:80);
    temp = temp(isnan(temp)==0);
    RMSE6(ii,11) = rmse(temp);
    clear temp
end

load ../2020_02_February_analysis/PROFILES/THETA_USGO_WO_2017_PFL_D_12

ind1 = find(prof_lat>-58.8);
ind2 = find(prof_lat<-32);

ind3 = find(prof_lon>290);
ind4 = find(prof_lon<349.8);

ind5 = intersect(ind1,ind2);
ind6 = intersect(ind3,ind4);
box_ind = intersect(ind5,ind6);
clear ind*

prof_lat = prof_lat(box_ind);
prof_lon = prof_lon(box_ind);
mltime = mltime(box_ind);

prof_Tdif = prof_Tdif(box_ind,:);
prof_Tdifn = prof_Tdifn(box_ind,:);
prof_Tmod = prof_Tmod(box_ind,:);
prof_Tobs = prof_Tobs(box_ind,:);


prof_mean = zeros(97,1);

for ii=1:78
    temp = prof_Tdif(:,ii);
    temp = temp(isnan(temp)==0);
    prof_mean(ii) = mean(temp);
    clear temp
end

A = 2357 - sum(isnan(prof_Tdif),1)';

[[4:100]',prof_depth,A,prof_mean]

big_array = [mltime,prof_lon',prof_lat',prof_Tdif];

big_array = sortrows(big_array,1);

strg = 'time bin : 0-200m : 200-400m : 400-600m : 600-800m : 800-1000m : 1000-1500m : 1500-2000m : 0-1000m : 1000-2000m : 0-2000m';

dates = 736696:5:737060;
datesm = dates(1:72) + 2.5;

RMSE12 = [datesm',zeros(72,10)];

for ii=1:72
    xlo = find(big_array(:,1)>dates(ii),1);
    xhi = find(big_array(:,1)>dates(ii+1),1)-1;
    temp = big_array(xlo:xhi,4:39);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,2) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,40:53);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,3) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,54:60);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,4) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,61:64);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,5) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,65:69);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,6) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,70:74);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,7) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,75:80);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,8) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,4:68);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,9) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,69:80);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,10) = rmse(temp);
    clear temp
    temp = big_array(xlo:xhi,4:80);
    temp = temp(isnan(temp)==0);
    RMSE12(ii,11) = rmse(temp);
    clear temp
end

save RMSE_ARGO_lg RMSE* strg 

clear

load ../2020_02_February_analysis/PROFILES/THETA_USGO_WO_2017_PFL_D_3

ind1 = find(prof_lat>-58.8);
ind2 = find(prof_lat<-32);

ind3 = find(prof_lon>290);
ind4 = find(prof_lon<349.8);

ind5 = intersect(ind1,ind2);
ind6 = intersect(ind3,ind4);
box_ind = intersect(ind5,ind6);
clear ind*

prof_lat = prof_lat(box_ind);
prof_lon = prof_lon(box_ind);
mltime = mltime(box_ind);

prof_Tdif = prof_Tdif(box_ind,:);
prof_Tdifn = prof_Tdifn(box_ind,:);
prof_Tmod = prof_Tmod(box_ind,:);
prof_Tobs = prof_Tobs(box_ind,:);


prof_mean = zeros(97,1);

for ii=1:78
    temp = prof_Tdif(:,ii);
    temp = temp(isnan(temp)==0);
    prof_mean(ii) = mean(temp);
    clear temp
end

A = 2357 - sum(isnan(prof_Tdif),1)';

[[4:100]',prof_depth,A,prof_mean]

big_array = [mltime,prof_lon',prof_lat',prof_Tdif];

big_array = sortrows(big_array,1);

strg = 'time bin : 0-200m : 200-400m : 400-600m : 600-800m : 800-1000m : 1000-1500m : 1500-2000m : 0-1000m : 1000-2000m : 0-2000m';

dates = 736696:5:737060;
datesm = dates(1:72) + 2.5;

MEAN3 = [datesm',zeros(72,10)];
SD3 = [datesm',zeros(72,10)];

for ii=1:72
    xlo = find(big_array(:,1)>dates(ii),1);
    xhi = find(big_array(:,1)>dates(ii+1),1)-1;
    temp = big_array(xlo:xhi,4:39);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,2) = mean(temp);
    SD3(ii,2) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,40:53);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,3) = mean(temp);
    SD3(ii,3) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,54:60);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,4) = mean(temp);
    SD3(ii,4) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,61:64);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,5) = mean(temp);
    SD3(ii,5) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,65:69);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,6) = mean(temp);
    SD3(ii,6) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,70:74);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,7) = mean(temp);
    SD3(ii,7) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,75:80);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,8) = mean(temp);
    SD3(ii,8) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,4:68);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,9) = mean(temp);
    SD3(ii,9) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,69:80);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,10) = mean(temp);
    SD3(ii,10) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,4:80);
    temp = temp(isnan(temp)==0);
    MEAN3(ii,11) = mean(temp);
    SD3(ii,11) = std(temp);
    clear temp
end

load ../2020_02_February_analysis/PROFILES/THETA_USGO_WO_2017_PFL_D_6

ind1 = find(prof_lat>-58.8);
ind2 = find(prof_lat<-32);

ind3 = find(prof_lon>290);
ind4 = find(prof_lon<349.8);

ind5 = intersect(ind1,ind2);
ind6 = intersect(ind3,ind4);
box_ind = intersect(ind5,ind6);
clear ind*

prof_lat = prof_lat(box_ind);
prof_lon = prof_lon(box_ind);
mltime = mltime(box_ind);

prof_Tdif = prof_Tdif(box_ind,:);
prof_Tdifn = prof_Tdifn(box_ind,:);
prof_Tmod = prof_Tmod(box_ind,:);
prof_Tobs = prof_Tobs(box_ind,:);


prof_mean = zeros(97,1);

for ii=1:78
    temp = prof_Tdif(:,ii);
    temp = temp(isnan(temp)==0);
    prof_mean(ii) = mean(temp);
    clear temp
end

A = 2357 - sum(isnan(prof_Tdif),1)';

[[4:100]',prof_depth,A,prof_mean]

big_array = [mltime,prof_lon',prof_lat',prof_Tdif];

big_array = sortrows(big_array,1);

strg = 'time bin : 0-200m : 200-400m : 400-600m : 600-800m : 800-1000m : 1000-1500m : 1500-2000m : 0-1000m : 1000-2000m : 0-2000m';

dates = 736696:5:737060;
datesm = dates(1:72) + 2.5;

MEAN6 = [datesm',zeros(72,10)];
SD6 = [datesm',zeros(72,10)];

for ii=1:72
    xlo = find(big_array(:,1)>dates(ii),1);
    xhi = find(big_array(:,1)>dates(ii+1),1)-1;
    temp = big_array(xlo:xhi,4:39);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,2) = mean(temp);
    SD6(ii,2) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,40:53);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,3) = mean(temp);
    SD6(ii,3) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,54:60);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,4) = mean(temp);
    SD6(ii,4) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,61:64);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,5) = mean(temp);
    SD6(ii,5) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,65:69);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,6) = mean(temp);
    SD6(ii,6) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,70:74);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,7) = mean(temp);
    SD6(ii,7) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,75:80);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,8) = mean(temp);
    SD6(ii,8) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,4:68);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,9) = mean(temp);
    SD6(ii,9) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,69:80);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,10) = mean(temp);
    SD6(ii,10) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,4:80);
    temp = temp(isnan(temp)==0);
    MEAN6(ii,11) = mean(temp);
    SD6(ii,11) = std(temp);
    clear temp
end

load ../2020_02_February_analysis/PROFILES/THETA_USGO_WO_2017_PFL_D_12

ind1 = find(prof_lat>-58.8);
ind2 = find(prof_lat<-32);

ind3 = find(prof_lon>290);
ind4 = find(prof_lon<349.8);

ind5 = intersect(ind1,ind2);
ind6 = intersect(ind3,ind4);
box_ind = intersect(ind5,ind6);
clear ind*

prof_lat = prof_lat(box_ind);
prof_lon = prof_lon(box_ind);
mltime = mltime(box_ind);

prof_Tdif = prof_Tdif(box_ind,:);
prof_Tdifn = prof_Tdifn(box_ind,:);
prof_Tmod = prof_Tmod(box_ind,:);
prof_Tobs = prof_Tobs(box_ind,:);


prof_mean = zeros(97,1);

for ii=1:78
    temp = prof_Tdif(:,ii);
    temp = temp(isnan(temp)==0);
    prof_mean(ii) = mean(temp);
    clear temp
end

A = 2357 - sum(isnan(prof_Tdif),1)';

[[4:100]',prof_depth,A,prof_mean]

big_array = [mltime,prof_lon',prof_lat',prof_Tdif];

big_array = sortrows(big_array,1);

strg = 'time bin : 0-200m : 200-400m : 400-600m : 600-800m : 800-1000m : 1000-1500m : 1500-2000m : 0-1000m : 1000-2000m : 0-2000m';

dates = 736696:5:737060;
datesm = dates(1:72) + 2.5;

MEAN12 = [datesm',zeros(72,10)];
SD12 = [datesm',zeros(72,10)];

for ii=1:72
    xlo = find(big_array(:,1)>dates(ii),1);
    xhi = find(big_array(:,1)>dates(ii+1),1)-1;
    temp = big_array(xlo:xhi,4:39);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,2) = mean(temp);
    SD12(ii,2) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,40:53);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,3) = mean(temp);
    SD12(ii,3) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,54:60);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,4) = mean(temp);
    SD12(ii,4) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,61:64);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,5) = mean(temp);
    SD12(ii,5) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,65:69);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,6) = mean(temp);
    SD12(ii,6) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,70:74);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,7) = mean(temp);
    SD12(ii,7) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,75:80);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,8) = mean(temp);
    SD12(ii,8) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,4:68);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,9) = mean(temp);
    SD12(ii,9) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,69:80);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,10) = mean(temp);
    SD12(ii,10) = std(temp);
    clear temp
    temp = big_array(xlo:xhi,4:80);
    temp = temp(isnan(temp)==0);
    MEAN12(ii,11) = mean(temp);
    SD12(ii,11) = std(temp);
    clear temp
end

save MEAN_ARGO_lg MEAN* SD* strg 

clear

toc()