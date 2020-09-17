clear
close all
clc
tic()

acc_colors

X = 1:28;
Ya = fliplr([17,14,10]);
Xah = fliplr([3.95,3.41,-1.30]);
Xac = fliplr([.0256,.0254,.0258]);

Yb = fliplr([28,27,26]);
Xbh = fliplr([30.65,24.17,23.78]);
Xbc = fliplr([.0099,.0128,.0114]);

Yh = fliplr([25,24,23,22,21,20,19,18,16,15,13,12,11,9]);
Yc = fliplr([25,24,23,22,21,20,19,18,16,15,13,12,11,9,8,7,6,5,4,3,2,1]);
Xh = fliplr([23.12,17.53,7.88,7.86,6.93,6.16,5.71,4.62,...
    3.67,3.59,1.82,0.38,-1.10,-1.53]);
Xc = fliplr([.0172,.0202,.0117,.0119,.0112,.0159,0.0218,.0182...
    .0147,.0252,.0159,.0106,.0107,.0162,.0180,.0169,.0156,...
    .0146,.0138,.0138,.0106,-.0072]);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(1,2,1);
barh(Yh,Xh,'FaceColor',Color(58,:),'LineWidth',1)
hold on
barh(Yb,Xbh,'FaceColor',Color(60,:),'LineWidth',2)
barh(Ya,Xah,0.25,'FaceColor',Color(59,:),'LineWidth',2)
yticks(X)
yticklabels({'INM-CM5-0','ACCESS-ESM1-5',...
    'INM-CM4-8','MIROC-ES2L','CESM2-FV2',...
    'CESM2-WACCM-FV2','BCC-CSM2-MR','BCC-ESM1','MPI-ESM1-2-HR',...
    '\color{black}\bf 1/12 AB 2017','MPI-ESM1-2-LR','MPI-ESM-1-2-HAM',...
    'CESM2','\color{black}\bf 1/6 AB 2017','GFDL-CM4','CESM2-WACCM',...
    '\color{black}\bf 1/3 AB 2017','UKESM1-0-LL','GFDL-ESM4','IPSL-CM6A-LR',...
    'NorESM2-MM','CanESM5','NorESM2-LM','GISS-E2-1-G-CC',...
    'NorCPM1','\color{black}\bf BSOSE 2013-8',...
    '\color{black}\bf BSOSE 2013-4','\color{black}\bf BSOSE 2017'})
grid on
ax1.GridAlpha = 1;
ylim([0 29])
xlim([-3 32])
% text(10.5,1,'not reported','FontSize',20);
plot(13.*ones(100,1),linspace(0.6,6.9,100),'LineWidth',2.3,'Color','k')
text(8,7.53,'not reported','FontSize',20);
xlabel('heat [W/m^2]')
acc_movie_w
acc_2plots(1)
title('2010-2014 CMIP6 mean annual downward surface fluxes','FontWeight','Normal','FontSize',22)
hold off

ax2 = subplot(1,2,2);
barh(Yc,Xc,'FaceColor',Color(58,:),'LineWidth',1)
hold on
barh(Yb,Xbc,'FaceColor',Color(60,:),'LineWidth',2)
barh(Ya,Xac,0.25,'FaceColor',Color(59,:),'LineWidth',2)
grid on
ax2.GridAlpha = 1;
yticks(X)
ylim([0 29])
xlim([-0.008 0.026])
yticklabels({})
xlabel('carbon [kg C/m^2/yr]')
acc_movie_w
acc_2plots(2)
set(gcf,'InvertHardCopy','off'); 
print('-r200','CMIP6_2plot','-dpng')







toc()