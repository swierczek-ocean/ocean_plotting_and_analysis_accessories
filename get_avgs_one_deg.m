clear
close all
clc
tic()

load ODA YGt XGt
YGt = YGt(11:32);
XGt = XGt(12:61);
area_box = zeros(49,21,50);

for ii=1:21
    area_box(:,ii,:) = area_degree(abs(YGt(ii)),1,1);
end

area_box(1:12,21,1:20) = 0;
area_box(1:11,20,1:20) = 0;
area_box(1:10,19,1:20) = 0;
area_box(1:9,18,1:20) = 0;
area_box(1:9,17,1:20) = 0;
area_box(1:8,16,1:20) = 0;
area_box(1:7,15,1:20) = 0;
area_box(1:6,14,1:20) = 0;
area_box(1:5,13,1:20) = 0;
area_box(1:4,12,1:20) = 0;
area_box(1:4,11,1:20) = 0;
area_box(1:4,10,1:20) = 0;
area_box(1:3,9,1:20) = 0;
area_box(1:3,8,1:20) = 0;
area_box(1:3,7,1:20) = 0;
area_box(1:4,6,1:20) = 0;
area_box(1:7,5,1:20) = 0;
area_box(1:7,4,1:20) = 0;
area_box(4:6,3,1:20) = 0;
area_box([1,3:8,27,28],1,1:20) = 0;

load ODA oda_wvel
oda_wvel = squeeze(mean(oda_wvel,4));
load ODA oda_theta XCt YCt RCt RCWt
oda_theta = squeeze(mean(oda_theta,4));

oda_wvel = oda_wvel(12:60,11:31,:);
oda_theta = oda_theta(12:60,11:31,:);

for ii=21:50
    temp1 = area_box(:,:,ii);
    temp2 = oda_wvel(:,:,ii);
    temp1(isnan(temp2)==1) = 0;
    area_box(:,:,ii) = temp1;
end

oda_theta(isnan(oda_theta)==1) = 0;
oda_wvel(isnan(oda_wvel)==1) = 0;

total_area = zeros(50,1);

for jj=1:50
    total_area(jj) = sum(area_box(:,:,jj),[1,2]);
end

oda_wvel_v = zeros(50,1);
oda_theta_v = zeros(50,1);

for ii=1:50
    oda_wvel_v(ii) = sum(oda_wvel(:,:,ii).*area_box(:,:,ii),[1,2])./total_area(ii);
    oda_theta_v(ii) = sum(oda_theta(:,:,ii).*area_box(:,:,ii),[1,2])./total_area(ii);
end


load smooth_fields

theta3int = theta3int(12:60,11:31,:);
wvel3int = wvel3int(12:60,11:31,:);
theta6int = theta6int(12:60,11:31,:);
wvel6int = wvel6int(12:60,11:31,:);
theta12int = theta12int(12:60,11:31,:);
wvel12int = wvel12int(12:60,11:31,:);

area_box = zeros(49,21,52);

for ii=1:21
    area_box(:,ii,:) = area_degree(abs(YGt(ii)),1,1);
end

area_box(1:12,21,1:20) = 0;
area_box(1:11,20,1:20) = 0;
area_box(1:10,19,1:20) = 0;
area_box(1:9,18,1:20) = 0;
area_box(1:9,17,1:20) = 0;
area_box(1:8,16,1:20) = 0;
area_box(1:7,15,1:20) = 0;
area_box(1:6,14,1:20) = 0;
area_box(1:5,13,1:20) = 0;
area_box(1:4,12,1:20) = 0;
area_box(1:4,11,1:20) = 0;
area_box(1:4,10,1:20) = 0;
area_box(1:3,9,1:20) = 0;
area_box(1:3,8,1:20) = 0;
area_box(1:3,7,1:20) = 0;
area_box(1:4,6,1:20) = 0;
area_box(1:7,5,1:20) = 0;
area_box(1:7,4,1:20) = 0;
area_box(4:6,3,1:20) = 0;
area_box([1,3:8,27,28],1,1:20) = 0;

for ii=1:52
    temp1 = area_box(:,:,ii);
    temp2 = theta12int(:,:,ii);
    temp1(isnan(temp2)==1) = 0;
    area_box(:,:,ii) = temp1;
end

theta3int(isnan(theta3int)==1) = 0;
wvel3int(isnan(wvel3int)==1) = 0;
theta6int(isnan(theta6int)==1) = 0;
wvel6int(isnan(wvel6int)==1) = 0;
theta12int(isnan(theta12int)==1) = 0;
wvel12int(isnan(wvel12int)==1) = 0;



total_area = zeros(52,1);

for jj=1:52
    total_area(jj) = sum(area_box(:,:,jj),[1,2]);
end

wvel_3v = zeros(52,1);
theta_3v = zeros(52,1);
wvel_6v = zeros(52,1);
theta_6v = zeros(52,1);
wvel_12v = zeros(52,1);
theta_12v = zeros(52,1);

for ii=1:52
    wvel_3v(ii) = sum(wvel3int(:,:,ii).*area_box(:,:,ii),[1,2])./total_area(ii);
    theta_3v(ii) = sum(theta3int(:,:,ii).*area_box(:,:,ii),[1,2])./total_area(ii);
    wvel_6v(ii) = sum(wvel6int(:,:,ii).*area_box(:,:,ii),[1,2])./total_area(ii);
    theta_6v(ii) = sum(theta6int(:,:,ii).*area_box(:,:,ii),[1,2])./total_area(ii);
    wvel_12v(ii) = sum(wvel12int(:,:,ii).*area_box(:,:,ii),[1,2])./total_area(ii);
    theta_12v(ii) = sum(theta12int(:,:,ii).*area_box(:,:,ii),[1,2])./total_area(ii);
end

save vert_oda oda_*_v wvel*v theta*v RC* RF3


toc()