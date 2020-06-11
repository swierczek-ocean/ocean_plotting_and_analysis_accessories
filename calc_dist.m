clear
close all
clc
tic()

load BSOSE_grid YC

km = zeros(588,1);

for ii=1:588
    km(ii) = calc_km(YC(ii),1/6);
end

clear

load BSOSE_grid month* time*

ref = datenum('2012 12 01 00:00:00','yyyy mm dd HH:MM:SS');
spd = 24*60*60;
month_time = double(month_time)./spd + ref;
time_5day = double(time_5day)./spd + ref;
time_1day = double(time_1day)./spd + ref;





toc()