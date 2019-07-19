clear
close all
clc

tic()
acc_settings

load New_Array5

mm = length(my_D);
nn = length(my_time);
[my_time,my_D] = ndgrid(my_time,my_D);

T = New_Array5(:,:,1);
S = New_Array5(:,:,2);
P = New_Array5(:,:,3);
SA = gsw_SA_from_SP(S,P,-42.52,-42.98);
CT = gsw_CT_from_pt(SA,T);
rho = gsw_rho(SA,CT,P)-1000;
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
ub = 3.1;
lb = min(CT(isnan(CT)==0));
nlvls = 121;
z = linspace(lb,ub,nlvls);
rho_levels = 50:-2:30;
coords = [my_time(1) my_time(end) -5100 -1000];

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_1a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_1b','-dpng')
hold off
%% end full plot

%% deep plot
ub = 2.6;
lb = min(CT(isnan(CT)==0));
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [my_time(1) my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_2a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_2b','-dpng')
hold off
%% end deep plot

%% shallow plot
ub = 9.4;
lb = 2.2;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [my_time(1) 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_3a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_3b','-dpng')
hold off
%% end shallow plot

%% full plot
ub = 3.1;
lb = min(CT(isnan(CT)==0));
nlvls = 121;
z = linspace(lb,ub,nlvls);
rho_levels = 50:-2:30;
coords = [my_time(1) 736490 -5100 -1000];

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_4a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_4b','-dpng')
hold off
%% end full plot

%% deep plot
ub = 2.6;
lb = min(CT(isnan(CT)==0));
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [my_time(1) 736490 -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_5a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_5b','-dpng')
hold off
%% end deep plot

%% shallow plot
ub = 9.4;
lb = 2.2;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [my_time(1) 736490 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_6a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_6b','-dpng')
hold off
%% end shallow plot

%% full plot
ub = 3.1;
lb = min(CT(isnan(CT)==0));
nlvls = 121;
z = linspace(lb,ub,nlvls);
rho_levels = 50:-2:30;
coords = [736625 my_time(end) -5100 -1000];

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_7a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_7b','-dpng')
hold off
%% end full plot

%% deep plot
ub = 2.6;
lb = min(CT(isnan(CT)==0));
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [736625 my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_8a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_8b','-dpng')
hold off
%% end deep plot

%% shallow plot
ub = 9.4;
lb = 2.2;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [736625 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_9a','-dpng')
hold off

cm = acc_colormap('balance');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,CT','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_T_prof_9b','-dpng')
hold off
%% end shallow plot
close all

%% full plot
ub = 35;
lb = 34.3;
nlvls = 121;
z = linspace(lb,ub,nlvls);
rho_levels = 50:-2:30;
coords = [my_time(1) my_time(end) -5100 -1000];

cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_1a','-dpng')
hold off

%% end full plot

%% deep plot
ub = 35;
lb = 34.4;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [my_time(1) my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_2a','-dpng')
hold off

%% end deep plot

%% shallow plot
ub = 35;
lb = 34.2;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [my_time(1) 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_3a','-dpng')
hold off

%% end shallow plot

%% full plot
ub = 35;
lb = 34.2;
nlvls = 121;
z = linspace(lb,ub,nlvls);
rho_levels = 50:-2:30;
coords = [my_time(1) 736490 -5100 -1000];

cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_4a','-dpng')
hold off

%% end full plot

%% deep plot
ub = 35;
lb = 34.4;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [my_time(1) 736490 -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_5a','-dpng')
hold off

%% end deep plot

%% shallow plot
ub = 35;
lb = 34.2;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [my_time(1) 736490 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_6a','-dpng')
hold off

%% end shallow plot

%% full plot
ub = 35;
lb = 34.4;
nlvls = 121;
z = linspace(lb,ub,nlvls);
rho_levels = 50:-2:30;
coords = [736625 my_time(end) -5100 -1000];

cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_7a','-dpng')
hold off

%% end full plot

%% deep plot
ub = 35;
lb = 34.7;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [736625 my_time(end) -5100 -2600];
rho_levels = 50:-1:40;
cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_8a','-dpng')
hold off

%% end deep plot

%% shallow plot
ub = 35;
lb = 34.2;
nlvls = 121;
z = linspace(lb,ub,nlvls);
coords = [736625 737000 -2600 -150];
rho_levels = 40:-1:26;
cm = acc_colormap('salt2');

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
contourf(my_time,my_D,SA','LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
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
print('Argentine_Basin_OOI_Mooring_S_prof_9a','-dpng')
hold off

%% end shallow plot
close all


toc()