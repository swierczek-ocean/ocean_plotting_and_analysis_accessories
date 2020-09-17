clear
close all
clc
tic()

area = 7269967971348;

c3 = 0.0256;
c6 = 0.0254;
c12 = 0.0258;

ctrans3 = 1000*c3*area/1e15;
ctrans6 = 1000*c6*area/1e15;
ctrans12 = 1000*c12*area/1e15;


airgm = 28.95;
co2gm = 44;
atmm = 5.148e21;

atmco2ppm = 410;

atmco2m = 410*atmm/airgm/1000000;

gco2pga = 0.000169948186528497;









toc()