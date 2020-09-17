clear
close all
clc
tic()

load Misfits/THETA_USGO_WO_2017_PFL_D_3 prof_lat prof_lon prof_Tdifn

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


prof_Tdifn = prof_Tdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_Tdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_Tdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_Tdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/3 theta:  7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/3 theta:  100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/3 theta:  1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/THETA_USGO_WO_2017_PFL_D_6 prof_lat prof_lon prof_Tdifn

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


prof_Tdifn = prof_Tdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_Tdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_Tdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_Tdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/6 theta:  7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/6 theta:  100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/6 theta:  1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/THETA_USGO_WO_2017_PFL_D_12 prof_lat prof_lon prof_Tdifn

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


prof_Tdifn = prof_Tdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_Tdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_Tdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_Tdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/12 theta:  7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/12 theta:  100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/12 theta:  1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/SALT_USGO_WO_2017_PFL_D_3 prof_lat prof_lon prof_Sdifn

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


prof_Sdifn = prof_Sdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_Sdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_Sdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_Sdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/3 salt:   7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/3 salt:   100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/3 salt:   1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/SALT_USGO_WO_2017_PFL_D_6 prof_lat prof_lon prof_Sdifn

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


prof_Sdifn = prof_Sdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_Sdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_Sdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_Sdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/6 salt:   7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/6 salt:   100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/6 salt:   1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/SALT_USGO_WO_2017_PFL_D_12 prof_lat prof_lon prof_Sdifn

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


prof_Sdifn = prof_Sdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_Sdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_Sdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_Sdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/12 salt:   7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/12 salt:   100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/12 salt:   1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/DIC_VIZ_SO_2017_PFL_3 prof_lat prof_lon prof_DICdifn

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

mm = 1000000/1035;

prof_DICdifn = prof_DICdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_DICdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_DICdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_DICdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/3 dic:    7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/3 dic:    100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/3 dic:    1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/DIC_VIZ_SO_2017_PFL_6 prof_lat prof_lon prof_DICdifn

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


prof_DICdifn = prof_DICdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_DICdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_DICdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_DICdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/6 dic:    7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/6 dic:    100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/6 dic:    1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/DIC_VIZ_SO_2017_PFL_12 prof_lat prof_lon prof_DICdifn

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


prof_DICdifn = prof_DICdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_DICdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_DICdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_DICdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/12 dic:    7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/12 dic:    100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/12 dic:    1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/O2_VIZ_SO_2017_PFL_3 prof_lat prof_lon prof_O2difn

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


prof_O2difn = prof_O2difn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_O2difn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_O2difn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_O2difn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/3 oxygen: 7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/3 oxygen: 100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/3 oxygen: 1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/O2_VIZ_SO_2017_PFL_6 prof_lat prof_lon prof_O2difn

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


prof_O2difn = prof_O2difn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_O2difn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_O2difn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_O2difn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/6 oxygen: 7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/6 oxygen: 100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/6 oxygen: 1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/O2_VIZ_SO_2017_PFL_12 prof_lat prof_lon prof_O2difn

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


prof_O2difn = prof_O2difn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_O2difn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_O2difn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_O2difn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/12 oxygen: 7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/12 oxygen: 100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/12 oxygen: 1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/NO3_VIZ_SO_2017_PFL_3.mat prof_lat prof_lon prof_NO3difn

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


prof_NO3difn = prof_NO3difn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_NO3difn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_NO3difn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_NO3difn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/3 nitrate: 7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/3 nitrate: 100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/3 nitrate: 1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/NO3_VIZ_SO_2017_PFL_6.mat prof_lat prof_lon prof_NO3difn

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


prof_NO3difn = prof_NO3difn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_NO3difn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_NO3difn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_NO3difn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/6 nitrate: 7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/6 nitrate: 100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/6 nitrate: 1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/NO3_VIZ_SO_2017_PFL_12.mat prof_lat prof_lon prof_NO3difn

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


prof_NO3difn = prof_NO3difn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_NO3difn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_NO3difn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_NO3difn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/12 nitrate: 7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/12 nitrate: 100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/12 nitrate: 1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/PH_VIZ_SO_2017_PFL_3 prof_lat prof_lon prof_PHdifn

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


prof_PHdifn = prof_PHdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_PHdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_PHdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_PHdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/3 pH:     7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/3 pH:     100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/3 pH:     1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/PH_VIZ_SO_2017_PFL_6 prof_lat prof_lon prof_PHdifn

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


prof_PHdifn = prof_PHdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_PHdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_PHdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_PHdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/6 pH:     7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/6 pH:     100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/6 pH:     1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/PH_VIZ_SO_2017_PFL_12 prof_lat prof_lon prof_PHdifn

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


prof_PHdifn = prof_PHdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_PHdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_PHdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_PHdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/12 pH:     7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/12 pH:     100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/12 pH:     1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/ALK_VIZ_SO_2017_PFL_3 prof_lat prof_lon prof_ALKdifn

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


prof_ALKdifn = prof_ALKdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_ALKdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_ALKdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_ALKdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/3 alk:    7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/3 alk:    100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/3 alk:    1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/ALK_VIZ_SO_2017_PFL_6 prof_lat prof_lon prof_ALKdifn

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


prof_ALKdifn = prof_ALKdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_ALKdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_ALKdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_ALKdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/6 alk:    7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/6 alk:    100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/6 alk:    1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/ALK_VIZ_SO_2017_PFL_12 prof_lat prof_lon prof_ALKdifn

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


prof_ALKdifn = prof_ALKdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_ALKdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_ALKdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_ALKdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/12 alk:    7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/12 alk:    100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/12 alk:    1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/CHL_VIZ_SO_2017_PFL_3 prof_lat prof_lon prof_CHLdifn

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


prof_CHLdifn = prof_CHLdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_CHLdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_CHLdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_CHLdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/3 chloro:  7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/3 chloro:  100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/3 chloro:  1000-2000m mean: %g    stdev: %g \n',e,f)


load Misfits/CHL_VIZ_SO_2017_PFL_6 prof_lat prof_lon prof_CHLdifn

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


prof_CHLdifn = prof_CHLdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_CHLdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_CHLdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_CHLdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/6 chloro:  7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/6 chloro:  100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/6 chloro:  1000-2000m mean: %g    stdev: %g \n',e,f)

load Misfits/CHL_VIZ_SO_2017_PFL_12 prof_lat prof_lon prof_CHLdifn

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


prof_CHLdifn = prof_CHLdifn(box_ind,:);

ind1 = 3:7;
ind2 = 23:37;
ind3 = 66:77;

temp = prof_CHLdifn(:,ind1);
temp = temp(isnan(temp)==0);
a = mean(temp);
b = std(temp,0);

temp = prof_CHLdifn(:,ind2);
temp = temp(isnan(temp)==0);
c = mean(temp);
d = std(temp,0);

temp = prof_CHLdifn(:,ind3);
temp = temp(isnan(temp)==0);
e = mean(temp);
f = std(temp,0);

clear temp

fprintf('1/12 chloro:  7-20m mean:      %g    stdev: %g \n',a,b)
fprintf('1/12 chloro:  100-200m mean:   %g    stdev: %g \n',c,d)
fprintf('1/12 chloro:  1000-2000m mean: %g    stdev: %g \n',e,f)  


toc()