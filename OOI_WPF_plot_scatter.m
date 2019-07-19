clear
close all
clc

tic()
acc_settings

load New_Array5
load Full_Array_2

mm = length(my_D);
nn = length(my_time);
[my_time,my_D] = ndgrid(my_time,my_D);

T = New_Array5(:,:,1);
S = New_Array5(:,:,2);
P = New_Array5(:,:,3);
% DO = New_Array5(:,:,4);
% EOC = New_Array5(:,:,5);
SA = gsw_SA_from_SP(S,P,-42.52,-42.98);
CT = gsw_CT_from_pt(SA,T);
rho = gsw_rho(SA,CT,P)-1000;

load Full_Array_2
jump = 12;
D = D(1:jump:end);
T = T(1:jump:end);
S = S(1:jump:end);
P = P(1:jump:end);
time = time(1:jump:end);

SA = gsw_SA_from_SP(S,P,-42.52,-42.98);
CT = gsw_CT_from_pt(SA,T);

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

xdateslong = [datenum('040115','mmddyy'),datenum('060115','mmddyy'),...
    datenum('080115','mmddyy'),datenum('100115','mmddyy'),...
    datenum('120115','mmddyy'),datenum('020116','mmddyy'),...
    datenum('040116','mmddyy'),datenum('060116','mmddyy'),...
    datenum('080116','mmddyy'),datenum('100116','mmddyy'),...
    datenum('120116','mmddyy'),datenum('020117','mmddyy'),...
    datenum('040117','mmddyy'),datenum('060117','mmddyy'),...
    datenum('080117','mmddyy'),datenum('100117','mmddyy'),...
    datenum('120117','mmddyy'),];


%% full plot
rho_levels = 50:-2:28;
coords = [my_time(1) my_time(end) -5100 -150];
option = 9;
[lb,ub] = get_color_bounds_s(CT,option);
cm = acc_colormap('coolwarm');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time,D,5,CT,'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_0a','-dpng')
hold off
close all
%% end full plot

%% full plot
rho_levels = 50:-2:28;
coords = [my_time(1) my_time(end) -5100 -1000];
ind = find(D<-1000);
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);
cm = acc_colormap('coolwarm');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile (1000-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_1a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [my_time(1) my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('coolwarm');
ind = find(D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_2a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [my_time(1) 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('coolwarm');
ind = find(D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_3a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:30;
coords = [my_time(1) 736490 -5100 -150];
ind = find(time<736490);
cm = acc_colormap('coolwarm');
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_4a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [my_time(1) 736490 -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('coolwarm');
ind = find(time<736490&D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_5a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [my_time(1) 736490 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('coolwarm');
ind = find(time<736490&D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_6a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:30;
coords = [736625 my_time(end) -5100 -150];
ind = find(time>736625);
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);
cm = acc_colormap('coolwarm');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_7a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [736625 my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('coolwarm');
ind = find(time>736625&D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_8a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [736625 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('coolwarm');
ind = find(time>736625&time<737000&D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(CT(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,CT(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring conservative temperature profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_CT_prof_9a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:28;
coords = [my_time(1) my_time(end) -5100 -150];

option = 9;
[lb,ub] = get_color_bounds_s(SA,option);
cm = acc_colormap('salt3');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time,D,10,SA,'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_0a','-dpng')
hold off
close all
%% end full plot

%% full plot
rho_levels = 50:-2:28;
coords = [my_time(1) my_time(end) -5100 -1000];
ind = find(D<-1000);
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);
cm = acc_colormap('salt3');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile (1000-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_1a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [my_time(1) my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt3');
ind = find(D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_2a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [my_time(1) 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt3');
ind = find(D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_3a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:30;
coords = [my_time(1) 736490 -5100 -150];
ind = find(time<736490);
cm = acc_colormap('salt3');
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_4a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [my_time(1) 736490 -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt3');
ind = find(time<736490&D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_5a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [my_time(1) 736490 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt3');
ind = find(time<736490&D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_6a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:30;
coords = [736625 my_time(end) -5100 -150];
ind = find(time>736625);
cm = acc_colormap('salt3');
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_7a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [736625 my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt3');
ind = find(time>736625);
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);
lb = 34.7;

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_8a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [736625 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt3');
ind = find(time>736625&time<737000&D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(SA(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,SA(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring absolute salinity profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_SA_prof_9a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:28;
coords = [my_time(1) my_time(end) -5100 -150];
option = 9;
[lb,ub] = get_color_bounds_s(T,option);
cm = acc_colormap('coolwarm');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time,D,5,T,'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_0a','-dpng')
hold off
close all
%% end full plot

%% full plot
rho_levels = 50:-2:28;
coords = [my_time(1) my_time(end) -5100 -1000];
ind = find(D<-1000);
cm = acc_colormap('coolwarm');
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile (1000-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_1a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [my_time(1) my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('coolwarm');
ind = find(D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_2a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [my_time(1) 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('coolwarm');
ind = find(D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_3a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:30;
coords = [my_time(1) 736490 -5100 -150];
ind = find(time<736490);
cm = acc_colormap('coolwarm');
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_4a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [my_time(1) 736490 -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('coolwarm');
ind = find(time<736490&D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_5a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [my_time(1) 736490 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('coolwarm');
ind = find(time<736490&D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_6a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:30;
coords = [736625 my_time(end) -5100 -150];
ind = find(time>736625);
cm = acc_colormap('coolwarm');
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_7a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [736625 my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('coolwarm');
ind = find(time>736625&D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_8a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [736625 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('coolwarm');
ind = find(time>736625&time<737000&D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(T(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,T(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('temperature','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PT_prof_9a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:28;
coords = [my_time(1) my_time(end) -5100 -150];
option = 9;
[lb,ub] = get_color_bounds_s(S,option);
cm = acc_colormap('salt3');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time,D,10,S,'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_0a','-dpng')
hold off
close all
%% end full plot

%% full plot
rho_levels = 50:-2:28;
coords = [my_time(1) my_time(end) -5100 -1000];
ind = find(D<-1000);
cm = acc_colormap('salt3');
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile (1000-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_1a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [my_time(1) my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt3');
ind = find(D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_2a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [my_time(1) 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt3');
ind = find(D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_3a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:30;
coords = [my_time(1) 736490 -5100 -150];
ind = find(time<736490);
cm = acc_colormap('salt3');
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_4a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [my_time(1) 736490 -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt3');
ind = find(time<736490&D<-2600);
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_5a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [my_time(1) 736490 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt3');
ind = find(time<736490&D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_6a','-dpng')
hold off
close all
%% end shallow plot

%% full plot
rho_levels = 50:-2:30;
coords = [736625 my_time(end) -5100 -150];
ind = find(time>736625);
cm = acc_colormap('salt3');
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_7a','-dpng')
hold off
close all
%% end full plot

%% deep plot
coords = [736625 my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt3');
ind = find(time>736625);
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);
lb = 34.4;

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile (2600-5100m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf_2 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_8a','-dpng')
hold off
close all
%% end deep plot

%% shallow plot
coords = [736625 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt3');
ind = find(time>736625&time<737000&D>-2600);
option = 9;
[lb,ub] = get_color_bounds_s(S(ind),option);

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time(ind),D(ind),8,S(ind),'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 1.1;
clabel(M,h2,'FontSize',12,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring practical salinity profile (180-2600m)')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
legend('salinity','potential density')
legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_PS_prof_9a','-dpng')
hold off
close all
%% end shallow plot

toc()