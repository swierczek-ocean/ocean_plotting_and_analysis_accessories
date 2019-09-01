clear
close all
clc

tic()

load XY3
load XY6
load XY12

clearvars -except XC* YC*

acc_settings

lat_a = -42.4932;
lon_a = 360 - 42.8917;

lat_b = -42.4947;
lon_b = 360 - 42.1371;

lat_p = -42.9799;
lon_p = 360 - 42.5083;

ind_3_left_a = find(XC3>lon_a,1)-1;
ind_3_right_a = find(XC3>lon_a,1);

ind_3_left_b = find(XC3>lon_b,1)-1;
ind_3_right_b = find(XC3>lon_b,1);

ind_3_up_a = find(YC3>lat_a,1);
ind_3_down_a = find(YC3>lat_a,1)-1;

ind_3_up_b = find(YC3>lat_b,1);
ind_3_down_b = find(YC3>lat_b,1)-1;

ind_6_left_a = find(XC6>lon_a,1)-1;
ind_6_right_a = find(XC6>lon_a,1);

ind_6_left_b = find(XC6>lon_b,1)-1;
ind_6_right_b = find(XC6>lon_b,1);

ind_6_up_a = find(YC6>lat_a,1);
ind_6_down_a = find(YC6>lat_a,1)-1;

ind_6_up_b = find(YC6>lat_b,1);
ind_6_down_b = find(YC6>lat_b,1)-1;

ind_12_left_a = find(XC12>lon_a,1)-1;
ind_12_right_a = find(XC12>lon_a,1);

ind_12_left_b = find(XC12>lon_b,1)-1;
ind_12_right_b = find(XC12>lon_b,1);

ind_12_up_a = find(YC12>lat_a,1);
ind_12_down_a = find(YC12>lat_a,1)-1;

ind_12_up_b = find(YC12>lat_b,1);
ind_12_down_b = find(YC12>lat_b,1)-1;

ind_3_left_p = find(XC3>lon_p,1)-1;
ind_3_right_p = find(XC3>lon_p,1);

ind_3_up_p = find(YC3>lat_p,1);
ind_3_down_p = find(YC3>lat_p,1)-1;

ind_6_left_p = find(XC6>lon_p,1)-1;
ind_6_right_p = find(XC6>lon_p,1);

ind_6_up_p = find(YC6>lat_p,1);
ind_6_down_p = find(YC6>lat_p,1)-1;

ind_12_left_p = find(XC12>lon_p,1)-1;
ind_12_right_p = find(XC12>lon_p,1);

ind_12_up_p = find(YC12>lat_p,1);
ind_12_down_p = find(YC12>lat_p,1)-1;

X3ind = [ind_3_left_a,ind_3_left_a,ind_3_right_a,ind_3_right_a,...
    ind_3_left_b,ind_3_left_b,ind_3_right_b,ind_3_right_b,...
    ind_3_left_p,ind_3_left_p,ind_3_right_p,ind_3_right_p];
Y3ind = [ind_3_down_a,ind_3_up_a,ind_3_down_a,ind_3_up_a,...
    ind_3_down_b,ind_3_up_b,ind_3_down_b,ind_3_up_b,...
    ind_3_down_p,ind_3_up_p,ind_3_down_p,ind_3_up_p];
X6ind = [ind_6_left_a,ind_6_left_a,ind_6_right_a,ind_6_right_a,...
    ind_6_left_b,ind_6_left_b,ind_6_right_b,ind_6_right_b,...
    ind_6_left_p,ind_6_left_p,ind_6_right_p,ind_6_right_p];
Y6ind = [ind_6_down_a,ind_6_up_a,ind_6_down_a,ind_6_up_a,...
    ind_6_down_b,ind_6_up_b,ind_6_down_b,ind_6_up_b,...
    ind_6_down_p,ind_6_up_p,ind_6_down_p,ind_6_up_p];
X12ind = [ind_12_left_a,ind_12_left_a,ind_12_right_a,ind_12_right_a,...
    ind_12_left_b,ind_12_left_b,ind_12_right_b,ind_12_right_b,...
    ind_12_left_p,ind_12_left_p,ind_12_right_p,ind_12_right_p];
Y12ind = [ind_12_down_a,ind_12_up_a,ind_12_down_a,ind_12_up_a,...
    ind_12_down_b,ind_12_up_b,ind_12_down_b,ind_12_up_b,...
    ind_12_down_p,ind_12_up_p,ind_12_down_p,ind_12_up_p];

X3 = XC3(X3ind);
Y3 = YC3(Y3ind);
X6 = XC6(X6ind);
Y6 = YC6(Y6ind);
X12 = XC12(X12ind);
Y12 = YC12(Y12ind);

X3c = XC3([ind_3_right_a,ind_3_left_b,ind_3_right_p]);
Y3c = YC3([ind_3_up_a,ind_3_up_b,ind_3_up_p]);
X6c = XC6([ind_6_left_a,ind_6_right_b,ind_6_left_p]);
Y6c = YC6([ind_6_up_a,ind_6_up_b,ind_6_up_p]);
X12c = XC12([ind_12_right_a,ind_12_right_b,ind_12_left_p]);
Y12c = YC12([ind_12_down_a,ind_12_down_b,ind_12_down_p]);


OOI_X = [lon_a,lon_b,lon_p];
OOI_Y = [lat_a,lat_b,lat_p];

OOI_Box_X = [-42.4957,-42.4957,-42.5419,-42.5419,-42.9211,-42.9211,...
    -42.8707,-42.8707,-42.1626,-42.1626,-42.1220,-42.1220] + 360;
OOI_Box_Y = [-42.9817,-42.978,-42.9817,-42.978,-42.4946,-42.4921,...
    -42.4946,-42.4921,-42.496,-42.4924,-42.496,-42.4924];

sz3 = 300;
sz6 = 300;
sz12 = 300;
coords = [316.8 318.2 -43.2 -42.4];

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
scatter(X3,Y3,sz3,Color(:,9)','filled');
hold on
scatter(X6,Y6,sz6,Color(:,19)','filled');
scatter(X12,Y12,sz12,Color(:,11)','filled');
scatter(OOI_X,OOI_Y,sz6,Color(:,37)','filled');
scatter(OOI_Box_X,OOI_Box_Y,sz6,Color(:,36)','filled');
title('Argentine Basin OOI mooring location vs. model grids')
grid on
axis(coords)
acc_plots_prof_contourf 
legend('1/3 grid','1/6 grid','1/12 grid','OOI moorings')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_Location','-dpng')
hold off

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
scatter(X3c,Y3c,sz3,Color(:,9)','filled');
hold on
scatter(X6c,Y6c,sz6,Color(:,19)','filled');
scatter(X12c,Y12c,sz12,Color(:,11)','filled');
scatter(OOI_X,OOI_Y,sz6,Color(:,37)','filled');
scatter(OOI_Box_X,OOI_Box_Y,sz6,Color(:,36)','filled');
title('Argentine Basin OOI mooring location vs. model grids')
grid on
axis(coords)
acc_plots_prof_contourf 
legend('1/3 grid','1/6 grid','1/12 grid','OOI moorings')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_Location_2','-dpng')
hold off

toc()