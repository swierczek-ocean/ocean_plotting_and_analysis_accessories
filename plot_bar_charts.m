clear
close all
clc
tic()

acc_colors

Y = [0.0106,0.0169,0.0180,0.0119,0.0146,0.0159,0.0156,0.0147,0.0252,...
    0.0218,0.0182,0.0138,-0.0072,0.0159,0.0138,0.0106,0.0162,0.0107,...
    0.0172,0.0117,0.0112,0.0202,0.0256,0.0254,0.0258,0.0099,0.0128,0.0114];
Y = sort(Y)';
X = [1:28]';

figure()
set(gcf, 'Position', [1, 1, 1100, 900])
barh(X,Y,'FaceColor',Color(74,:))
hold on
yticks(X)
yticklabels({'INM-CM5-0','BSOSE 2017','ACCESS-ESM1-5','MPI-ESM-1-2-HAM',...
    'MPI-ESM1-2-LR','NorESM2-MM','BSOSE 2013-8','NorESM2-LM',...
    'CanESM5','BSOSE 2013-4','INM-CM4-8','MIROC-ES2L','CESM2-FV2',...
    'CESM2-WACCM','CESM2-WACCM-FV2','CESM2','IPSL-CM6A-LR',...
    'MPI-ESM1-2-HR','BCC-CSM2-MR','NorCPM1','BCC-ESM1','UKESM1-0-LL',...
    'GISS-E2-1-G-CC','GFDL-ESM4','GFDL-CM4','1/6 AB 2017',...
    '1/3 AB 2017','1/12 AB 2017'})
grid on
ylim([0 29])
xlim([-0.0075 0.026])
acc_movie_w
acc_plots
title('2010-2014 CMIP6 mean annual downward surface CO2 flux [kg C/m^2/yr]','FontWeight','Normal','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','CMIP6_CFLX_BAR_1','-dpng')















Y = [4.98,7.83,-6.35,12.83,3.65,7.86,1.82,3.67,0.12,10.55,12.79,13.52,1.75,...
    1.35,-1.51,11.69,-1.56,3.59,5.71,17.53,16.86,-4.31,3.80,-18.89,6.16,...
    18.01,0.38,-1.53,-1.10,0.17,23.12,7.88,6.93,-2.67,4.62,3.95,3.41,...
    -1.30,30.65,24.17,23.78];

Y = sort(Y)';
X = [1:41]';

figure()
set(gcf, 'Position', [1, 1, 1100, 900])
barh(X,Y,'FaceColor',Color(74,:))
hold on
yticks(X)
yticklabels({'HadGEM3-GC31-MM','AWI-CM-1-1-MR','GISS-E2-1-H',...
    'SAM0-UNICON','FIO-ESM-2-0','MPI-ESM1-2-HR','FGOALS-f3-L',...
    '1/12 AB 2017','MPI-ESM1-2-LR','CIESM','NESM3','MPI-ESM-1-2-HAM',...
    'EC-Earth3-Veg','EC-Earth3','CESM2','1/6 AB 2017','GFDL-CM4',...
    'CAMS-CSM1-0','CESM2-WACCM','HadGEM3-GC31-LL','1/3 AB 2017',...
    'UKESM1-0-LL','ACCESS-CM2','GFDL-ESM4','IPSL-CM6A-LR','NorESM2-MM',...
    'ACCESS-ESM1-5','CanESM5','NorESM2-LM','CNRM-CM6-1','FGOALS-g3',...
    'CNRM-ESM2-1','AWI-ESM-1-1-LR','E3SM-1-0','GISS-E2-1-G',...
    'GISS-E2-1-G-CC','MCM-UA-1-0','NorCPM1','BSOSE 2013-8',...
    'BSOSE 2013-4','BSOSE 2017'})
grid on
ylim([0 42])
xlim([-20 32])
acc_movie_w
acc_plots
title('2010-2014 CMIP6 mean annual downward surface heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','CMIP6_TFLX_BAR_1','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1100, 900])
barh(X(1:9),-Y(1:9),'FaceColor',Color(70,:))
hold on
barh(X(10:41),Y(10:41),'FaceColor',Color(74,:))
yticks(X)
yticklabels({'HadGEM3-GC31-MM','AWI-CM-1-1-MR','GISS-E2-1-H',...
    'SAM0-UNICON','FIO-ESM-2-0','MPI-ESM1-2-HR','FGOALS-f3-L',...
    '1/12 AB 2017','MPI-ESM1-2-LR','CIESM','NESM3','MPI-ESM-1-2-HAM',...
    'EC-Earth3-Veg','EC-Earth3','CESM2','1/6 AB 2017','GFDL-CM4',...
    'CAMS-CSM1-0','CESM2-WACCM','HadGEM3-GC31-LL','1/3 AB 2017',...
    'UKESM1-0-LL','ACCESS-CM2','GFDL-ESM4','IPSL-CM6A-LR','NorESM2-MM',...
    'ACCESS-ESM1-5','CanESM5','NorESM2-LM','CNRM-CM6-1','FGOALS-g3',...
    'CNRM-ESM2-1','AWI-ESM-1-1-LR','E3SM-1-0','GISS-E2-1-G',...
    'GISS-E2-1-G-CC','MCM-UA-1-0','NorCPM1','BSOSE 2013-8',...
    'BSOSE 2013-4','BSOSE 2017'})
grid on
ylim([0 42])
xlim([-1 32])
acc_movie_w
acc_plots
title('2010-2014 CMIP6 mean annual downward surface heat flux [W/m^2]','FontWeight','Normal','FontSize',18)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','CMIP6_TFLX_BAR_2','-dpng')













toc()