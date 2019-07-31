clear
close all
clc

tic()
acc_settings

% load array_full_qc
load array_partial_qc
% load array_full_stuck_qc

%% array_* = [time,lat,lon,temp,salt,pres,dens,depth];

coords_a = [min(array_a(:,1)) max(array_a(:,1)) -2100 -200];
coords_b = [min(array_b(:,1)) max(array_b(:,1)) -2100 -200];
option = 6;
cm = acc_colormap('thermal');
[lb,ub] = get_color_bounds_s(array_a(:,4),option);
ub = 5;

xdatesfull = [datenum('040115','mmddyy'),datenum('050115','mmddyy'),...
    datenum('060115','mmddyy'),datenum('070115','mmddyy'),...
    datenum('080115','mmddyy'),datenum('090115','mmddyy'),...
    datenum('100115','mmddyy'),datenum('110115','mmddyy'),...
    datenum('120115','mmddyy'),datenum('010116','mmddyy'),...
    datenum('020116','mmddyy'),datenum('030116','mmddyy'),...
    datenum('040116','mmddyy'),datenum('050116','mmddyy'),...
    datenum('060116','mmddyy'),datenum('070116','mmddyy'),...
    datenum('080116','mmddyy'),datenum('090116','mmddyy'),...
    datenum('100116','mmddyy'),datenum('110116','mmddyy'),...
    datenum('120116','mmddyy'),datenum('010117','mmddyy'),...
    datenum('020117','mmddyy'),datenum('030117','mmddyy'),...
    datenum('040117','mmddyy'),datenum('050117','mmddyy'),...
    datenum('060117','mmddyy'),datenum('070117','mmddyy'),...
    datenum('080117','mmddyy'),datenum('090117','mmddyy'),...
    datenum('100117','mmddyy'),datenum('110117','mmddyy'),...
    datenum('120117','mmddyy'),];


figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(array_a(:,1),array_a(:,8),30,array_a(:,4),'filled');
hold on
grid on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
title('Argentine Basin OOI mooring A fixed CTD potential temperature')
xtickangle(45)
yticks(-2100:100:-200)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords_a)
acc_plots_prof_contourf 
print('Argentine_Basin_OOI_Mooring_CTD_A','-dpng')
hold off
close all
%% end full plot


cm = acc_colormap('thermal');
[lb,ub] = get_color_bounds_s(array_b(:,4),option);
ub = 5;

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(array_b(:,1),array_b(:,8),30,array_b(:,4),'filled');
hold on
grid on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
title('Argentine Basin OOI mooring B fixed CTD potential temperature')
xtickangle(45)
yticks(-2100:100:-200)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords_b)
acc_plots_prof_contourf 
print('Argentine_Basin_OOI_Mooring_CTD_B','-dpng')
hold off
close all
%% end full plot







toc()