clear
close all
clc
tic()

str1 = 'VIZ_SO_201';
str2 = '_PFL.nc';

SOCCOM_floats = [];
counter = 0;

for ii=4:8
    str = [str1,num2str(ii),str2];
    descr = ncread(str,'prof_descr');
    descr = descr';
    nn = size(descr,1);
    counter = counter + nn;
    float = zeros(nn,1);
    for jj=1:nn
        if descr(jj,5)=='1'
            float(jj) = str2num(descr(jj,5:9));
        else
            float(jj) = str2num(descr(jj,5:8));
        end
    end
    time = ncread(str,'prof_YYYYMMDD');
    lat = ncread(str,'prof_lat');
    lon = ncread(str,'prof_lon');
    SOCCOM_floats = [SOCCOM_floats;float,time,lat,lon];
end

SOCCOM_floats = sortrows(SOCCOM_floats,4);
fprintf('highest latitude: %g \n',max(SOCCOM_floats(:,3)))

indl = find(SOCCOM_floats(:,4)>250,1);
indh = find(SOCCOM_floats(:,4)>350,1);

SOCCOM_floats = SOCCOM_floats(indl:indh,:);

SOCCOM_floats = sortrows(SOCCOM_floats,2);
SOCCOM_floats = sortrows(SOCCOM_floats,1);

floats = unique(SOCCOM_floats(:,1));

save SOCCOM_floats SOCCOM_floats floats




toc()