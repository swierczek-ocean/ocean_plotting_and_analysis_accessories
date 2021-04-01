clear
close all
clc
tic()

%%

load PROFILES/processed/theta_zonal_3
load PROFILES/processed/theta_zonal_6
load PROFILES/processed/theta_zonal_12
load PROFILES/processed/dic_zonal_3
load PROFILES/processed/dic_zonal_6
load PROFILES/processed/dic_zonal_12

lat_grd = (-59:1:-31)';

depth_grd = [0,25:20:305,355:50:1005,1105:100:2005];

theta_zonal_3cf = NaN.*ones(28,39);
theta_zonal_6cf = NaN.*ones(28,39);
theta_zonal_12cf = NaN.*ones(28,39);
dic_zonal_3cf = NaN.*ones(28,39);
dic_zonal_6cf = NaN.*ones(28,39);
dic_zonal_12cf = NaN.*ones(28,39);
theta_zonal_3cfsd = NaN.*ones(28,39);
theta_zonal_6cfsd = NaN.*ones(28,39);
theta_zonal_12cfsd = NaN.*ones(28,39);
dic_zonal_3cfsd = NaN.*ones(28,39);
dic_zonal_6cfsd = NaN.*ones(28,39);
dic_zonal_12cfsd = NaN.*ones(28,39);
theta_zonal_3n = NaN.*ones(28,39);
theta_zonal_6n = NaN.*ones(28,39);
theta_zonal_12n = NaN.*ones(28,39);
dic_zonal_3n = NaN.*ones(28,39);
dic_zonal_6n = NaN.*ones(28,39);
dic_zonal_12n = NaN.*ones(28,39);




for ii=1:28
    for jj=1:39
        ind1 = find(prof_lat_3>lat_grd(ii));
        ind2 = find(prof_lat_3<lat_grd(ii+1));
        ind = intersect(ind1,ind2);
        if isempty(ind)==0
            ind3 = find(prof_depth>depth_grd(jj));
            ind4 = find(prof_depth<depth_grd(jj+1));
            indd = intersect(ind3,ind4);
            temp = theta_zonal_3(ind,indd);
            temp = temp(isnan(temp)==0);
            theta_zonal_3cf(ii,jj) = mean(temp);
            theta_zonal_3cfsd(ii,jj) = std(temp,0);
            theta_zonal_3n(ii,jj) = length(temp);
        end
        clear ind*
        
        ind1 = find(prof_lat_6>lat_grd(ii));
        ind2 = find(prof_lat_6<lat_grd(ii+1));
        ind = intersect(ind1,ind2);
        if isempty(ind)==0
            ind3 = find(prof_depth>depth_grd(jj));
            ind4 = find(prof_depth<depth_grd(jj+1));
            indd = intersect(ind3,ind4);
            temp = theta_zonal_6(ind,indd);
            temp = temp(isnan(temp)==0);
            theta_zonal_6cf(ii,jj) = mean(temp);
            theta_zonal_6cfsd(ii,jj) = std(temp,0);
            theta_zonal_6n(ii,jj) = length(temp);
        end
        clear ind*
        
        ind1 = find(prof_lat_12>lat_grd(ii));
        ind2 = find(prof_lat_12<lat_grd(ii+1));
        ind = intersect(ind1,ind2);
        if isempty(ind)==0
            ind3 = find(prof_depth>depth_grd(jj));
            ind4 = find(prof_depth<depth_grd(jj+1));
            indd = intersect(ind3,ind4);
            temp = theta_zonal_12(ind,indd);
            temp = temp(isnan(temp)==0);
            theta_zonal_12cf(ii,jj) = mean(temp);
            theta_zonal_12cfsd(ii,jj) = std(temp,0);
            theta_zonal_12n(ii,jj) = length(temp);
        end
        clear ind*
        
        ind1 = find(prof_lat_3c>lat_grd(ii));
        ind2 = find(prof_lat_3c<lat_grd(ii+1));
        ind = intersect(ind1,ind2);
        if isempty(ind)==0
            ind3 = find(prof_depth>depth_grd(jj));
            ind4 = find(prof_depth<depth_grd(jj+1));
            indd = intersect(ind3,ind4);
            temp = dic_zonal_3(ind,indd);
            temp = temp(isnan(temp)==0);
            dic_zonal_3cf(ii,jj) = mean(temp);
            dic_zonal_3cfsd(ii,jj) = std(temp,0);
            dic_zonal_3n(ii,jj) = length(temp);
        end
        clear ind*
        
        ind1 = find(prof_lat_6c>lat_grd(ii));
        ind2 = find(prof_lat_6c<lat_grd(ii+1));
        ind = intersect(ind1,ind2);
        if isempty(ind)==0
            ind3 = find(prof_depth>depth_grd(jj));
            ind4 = find(prof_depth<depth_grd(jj+1));
            indd = intersect(ind3,ind4);
            temp = dic_zonal_6(ind,indd);
            temp = temp(isnan(temp)==0);
            dic_zonal_6cf(ii,jj) = mean(temp);
            dic_zonal_6cfsd(ii,jj) = std(temp,0);
            dic_zonal_6n(ii,jj) = length(temp);
        end
        clear ind*
        
        ind1 = find(prof_lat_12c>lat_grd(ii));
        ind2 = find(prof_lat_12c<lat_grd(ii+1));
        ind = intersect(ind1,ind2);
        if isempty(ind)==0
            ind3 = find(prof_depth>depth_grd(jj));
            ind4 = find(prof_depth<depth_grd(jj+1));
            indd = intersect(ind3,ind4);
            temp = dic_zonal_12(ind,indd);
            temp = temp(isnan(temp)==0);
            dic_zonal_12cf(ii,jj) = mean(temp);
            dic_zonal_12cfsd(ii,jj) = std(temp,0);
            dic_zonal_12n(ii,jj) = length(temp);
        end
        clear ind*
        fprintf('finished iteration ii = %g, jj = %g \n',ii,jj)
    end
end

clear theta_zonal_3  theta_zonal_6 theta_zonal_12 dic_zonal_3 dic_zonal_6 dic_zonal_12

depth_grd = (depth_grd(2:end) + depth_grd(1:(end-1)))./2; 
lat_grd = (lat_grd(2:end) + lat_grd(1:(end-1)))./2; 

save contour_misfit dic_zonal_* theta_zonal_* depth_grd lat_grd

clear



toc()