clear
close all 
clc
tic()

load ../PhaseII/input6/6grid/grid XC YC
load XY6 XC6 YC6

XC = XC(:,1);
YC = YC(1,:);

xlo = find(XC==XC6(1));
xhi = find(XC==XC6(382));
ylo = find(YC==YC6(1));
yhi = find(YC==YC6(260));
XC = XC(xlo:xhi);
YC = YC(ylo:yhi);
XCL = XC;
YCL = YC;

load landschutzer2018_sose_grid6 co2flux_interp % time_land

co2flux_2017 = co2flux_interp(xlo:xhi,ylo:yhi,421:432);

save co2fluxm co2flux_2017 XCL YCL


clear co2flux_interp

co2flux_2017 = mean(co2flux_2017,3);

save co2flux_2017m co2flux_2017 XC YC













toc()