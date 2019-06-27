clear
close all
clc

tic()
acc_settings
cm = acc_colormap('thermal');

load New_Array1

coords = [my_time(1) my_time(end) my_D(1) my_D(end)];
mm = length(my_D);
nn = length(my_time);
[my_time,my_D] = ndgrid(my_time,my_D);

pres_levels = [0,4,6,8,9,10];
T = New_Array(:,:,1);
S = New_Array(:,:,2);
P = New_Array(:,:,3);

ub = max(T(isnan(T)==0));
lb = min(T(isnan(T)==0));
nlvls = 121;
z = linspace(lb,ub,nlvls);

figure()
set(gcf, 'Position', [1, 1, 1600, 750])
colormap(cm)
contourf(my_time,my_D,T,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,P,pressure_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile')
dateFormat = 'mmm yyyy';
datetick('x',dateFormat)
axis(coords)
acc_plots_prof_contourf 
legend('Temperature','Pressure')
legend('Location','southwest')
hold off
print('Argentine_Basin_OOI_Mooring_T_prof_1','-dpng')

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 1600, 750])
colormap(cm)
contourf(my_time,my_D,T,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,P,pressure_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile')
dateFormat = 'mmm yyyy';
datetick('x',dateFormat)
axis(coords)
acc_plots_prof_contourf 
legend('Temperature','Pressure')
legend('Location','southwest')
hold off
print('Argentine_Basin_OOI_Mooring_T_prof_2','-dpng')








toc()