clear
close all
clc
tic()

load ../2020_04_April_analysis/MUR_movie_diffs SST*


hFacC = rdmds('../Grids/3/hFacC');
x = 6:170;
y = 29:119;
mask3 = zeros(192,132);
mask3(x,y) = 1;

for ii=1:192
    for jj=1:132
        if hFacC(ii,jj,42)<1
            mask3(ii,jj) = 0;
        end
    end
end

count = sum(sum(mask3));
sstrmse3 = zeros(365,1);

for ii=1:365
    temp = SST_TS_3(:,:,ii).*mask3;
    temp = temp(isnan(temp)==0);
    sstrmse3(ii) = sqrt(sum(temp.^2))./sqrt(count);
end


hFacC = rdmds('../Grids/6/hFacC');
x = 11:340;
y = 54:235;
mask6 = zeros(384,260);
mask6(x,y) = 1;

for ii=1:384
    for jj=1:260
        if hFacC(ii,jj,42)<1
            mask6(ii,jj) = 0;
        end
    end
end

count = sum(sum(mask6));
sstrmse6 = zeros(365,1);

for ii=1:365
    temp = SST_TS_6(:,:,ii).*mask6;
    temp = temp(isnan(temp)==0);
    sstrmse6(ii) = sqrt(sum(temp.^2))./sqrt(count);
end




hFacC = rdmds('../Grids/12/hFacC');
x = 17:676;
y = 106:467;
mask12 = zeros(756,512);
mask12(x,y) = 1;

for ii=1:756
    for jj=1:512
        if hFacC(ii,jj,85)<1
            mask12(ii,jj) = 0;
        end
    end
end

count = sum(sum(mask12));
sstrmse12 = zeros(365,1);

for ii=1:365
    temp = SST_TS_12(:,:,ii).*mask12;
    temp = temp(isnan(temp)==0);
    sstrmse12(ii) = sqrt(sum(temp.^2))./sqrt(count);
end

save SST_RMSE_2 sstrmse*



toc()