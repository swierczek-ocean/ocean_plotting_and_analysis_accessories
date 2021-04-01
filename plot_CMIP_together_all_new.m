clear
close all
clc
tic()

acc_colors

X = 1:50;
Ya = fliplr([29,24,16]);
Xah = fliplr([3.95,3.41,-1.30]);
Xac = fliplr([.0256,.0254,.0258]);

Yb = fliplr([49.15,48.1,47.05]);
Xbh = fliplr([30.65,24.17,23.78]);
Xbc = fliplr([.0099,.0128,.0114]);

Yh = [9,10,11,12,13,14,15,17,18,19,20,21,22,23,25,26,27,28,30,31,32,...
    33,34,35,36,37,38,39,40,41,42,43,44,45,46];

Yc = [1,2,3,4,5,6,7,8,14,17,20,23,25,27,30,32,33,34,36,37,44,46];

Xh = [4.98,7.83,-6.35,12.83,3.65,7.86,1.82,3.67,0.12,10.55,12.79,13.52,1.75,...
    1.35,-1.51,11.69,-1.56,3.59,5.71,17.53,16.86,-4.31,3.80,-18.89,6.16,...
    18.01,0.38,-1.53,-1.10,0.17,23.12,7.88,6.93,-2.67,4.62];

Xh = sort(Xh)';


Xc = fliplr([.0172,.0202,.0117,.0119,.0112,.0159,0.0218,.0182...
    .0147,.0252,.0159,.0106,.0107,.0162,.0180,.0169,.0156,...
    .0146,.0138,.0138,.0106,-.0072]);

figure()
set(gcf, 'Position', [1, 1, 1600, 1000])
ax1 = subplot(1,2,1);
plot(13.8.*ones(50),linspace(0.13,49.96,50),'LineWidth',83,'Color',[0.7,0.7,0.7,0.05])
hold on
plot(9.27.*ones(50),linspace(0.13,49.96,50),'LineWidth',1.5,'Color','k')
plot(18.33.*ones(50),linspace(0.13,49.96,50),'LineWidth',1.5,'Color','k')
barh(Yh,Xh,'FaceColor',Color(58,:),'LineWidth',1.5)
barh(Yb,Xbh,'FaceColor',Color(60,:),'LineWidth',1.6)
barh(Ya,Xah,0.165,'FaceColor',Color(59,:),'LineWidth',1.6)
yticks(X)
yticklabels({'INM-CM5-0','ACCESS-ESM1-5',...
    'INM-CM4-8','MIROC-ES2L','CESM2-FV2',...
    'CESM2-WACCM-FV2','BCC-CSM2-MR','BCC-ESM1','\color[rgb]{.9,.1,.11}\bf HadGEM3-GC31-MM',...
    'AWI-CM-1-1-MR','GISS-E2-1-H',...
    'SAM0-UNICON','FIO-ESM-2-0','\color[rgb]{.6,.31,.64}\bf MPI-ESM1-2-HR','FGOALS-f3-L',...
    '\color{black}\bf 1/12 AB 2017','\color[rgb]{.6,.31,.64}\bf MPI-ESM1-2-LR','CIESM','NESM3',...
    'MPI-ESM-1-2-HAM','EC-Earth3-Veg','EC-Earth3',...
    'CESM2','\color{black}\bf 1/6 AB 2017','GFDL-CM4','CAMS-CSM1-0',...
    'CESM2-WACCM','\color[rgb]{.9,.1,.11}\bf HadGEM3-GC31-LL',...
    '\color{black}\bf 1/3 AB 2017','UKESM1-0-LL','ACCESS-CM2',...
    'GFDL-ESM4','IPSL-CM6A-LR',...
    '\color[rgb]{.22,.5,.72}\bf NorESM2-MM','ACCESS-ESM1-5','CanESM5','\color[rgb]{.22,.5,.72}\bf NorESM2-LM',...
    'CNRM-CM6-1','FGOALS-g3',...
    'CNRM-ESM2-1','AWI-ESM-1-1-LR','E3SM-1-0','GISS-E2-1-G','GISS-E2-1-G-CC',...
    'MCM-UA-1-0','NorCPM1','\color{black}\bf BSOSE 2013-8',...
    '\color{black}\bf BSOSE 2013-4','\color{black}\bf BSOSE 2017'})
grid on
ax1.GridAlpha = 1;
ylim([0 50])
xlim([-20 32])
% text(10.5,1,'not reported','FontSize',20);
% plot(13.*ones(100,1),linspace(0.6,6.9,100),'LineWidth',2.3,'Color','k')
% text(8,7.53,'not reported','FontSize',20);
acc_movie_w
acc_2plots(1)
xlabel('heat [W/m^2]','FontSize',20)
title('2010-2014 CMIP6 mean annual downward surface fluxes','FontWeight','Normal','FontSize',22)
hold off

ax2 = subplot(1,2,2);
plot(26.2.*ones(50),linspace(0.13,49.96,50),'LineWidth',107,'Color',[0.7,0.7,0.7,0.05])
hold on
plot(30.8.*ones(50),linspace(0.13,49.96,50),'LineWidth',1.5,'Color','k')
plot(21.6.*ones(50),linspace(0.13,49.96,50),'LineWidth',1.5,'Color','k')
barh(Yc,1000.*Xc,'FaceColor',Color(58,:),'LineWidth',1.5)
barh(Yb,1000.*Xbc,'FaceColor',Color(60,:),'LineWidth',1.6)
barh(Ya,1000.*Xac,0.165,'FaceColor',Color(59,:),'LineWidth',1.6)
grid on
ax2.GridAlpha = 1;
yticks(X)
ylim([0 50])
xlim([-8 33])
yticklabels({})
acc_movie_w
acc_2plots(2)
xlabel('carbon [g/m^2/yr]','FontSize',20)
set(gcf,'InvertHardCopy','off'); 
print('-r300','CMIP6_2plot3','-dpng')







toc()