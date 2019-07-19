acc_settings
figure()
set(gcf, 'Position', [1, 1, 1600, 750])
colormap(acc_colormap('thermal'))
scatter(time(1:1:20000),D(1:1:20000),30,T(1:1:20000),'filled')
hold on
title('Argentine Basin OOI mooring wire profiler location')
dateFormat = 'dd';
datetick('x',dateFormat)
acc_plots_prof_contourf 
hold off
print('Argentine_Basin_OOI_Mooring_s','-dpng')





