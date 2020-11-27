clear
close all
clc
tic()

acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;

load transports_3
load transports_6
load transports_12

clear uvel*

date1 = datenum('12312016','mmddyyyy');
date2 = datenum('11312017','mmddyyyy');

dates = date1:date2;


figure()
set(gcf, 'Position', [1, 1, 1200, 900])

ax2 = subplot(3,1,1);
h1 = plot(dates,udic3e,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,udic6e,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,udic12e,'LineWidth',lw,'Color',Color(c12,:));
ylabel('east')
title('Lateral DIC Transport Variations across boundary','FontWeight','Normal','FontSize',16)
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
h1 = plot(dates,vdic3n,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,vdic6n,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,vdic12n,'LineWidth',lw,'Color',Color(c12,:));
ylabel('north')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
h1 = plot(dates,vdic3s,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(dates,vdic6s,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(dates,vdic12s,'LineWidth',lw,'Color',Color(c12,:));
ylabel('east')
acc_movie
acc_tri_plots_s3
hold off
set(gcf,'InvertHardCopy','off'); 
print('lattrans/lat_dic','-dpng')

close all




toc()