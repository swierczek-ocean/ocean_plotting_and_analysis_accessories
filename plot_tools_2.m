clear
close all
clc

tic()
acc_settings

%% I had to make fake data, you can ignore this part
time = 736040:2:737050;
D = -5215:25:-160;
coords = [time(2) time(end-1) D(1) D(end)];
mm = length(D);
nn = length(time);
[time,D] = ndgrid(time,D);

T = unifrnd(-2,22,nn,mm);
T = smoothdata(T,2);
T = smoothdata(T,1);
T = sort(T,2);

P = unifrnd(-2,12,nn,mm);
P = smoothdata(P,2);
P = smoothdata(P,1);
P = sort(P,2);

%% end making fake data

pressure_levels = [0,4,6,8,9,10];
% you can specify what pressure contours to show. Look at the contour
% command below, it looks like
% contour(time,depth,pressure,pressure_levels,...)
% That way you can use 0.5 dbars for the lower part than move to whole
% dbars for the near surface



cm = acc_colormap('thermal');

ub = max(max(T));
lb = min(min(T));
nlvls = 121;
z = linspace(lb,ub,nlvls);
% I usually specify the color limits for my plots, but I'm not sure you
% need to do it for these profile contourfs


%% first plot

figure()
set(gcf, 'Position', [1, 1, 1600, 750])
% makes the figure bigger than the default

colormap(cm)
contourf(time,D,T,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
% I usually have issues with the colorbar, but you might not need the last
% two lines

[M,h2] = contour(time,D,P,pressure_levels,'w','ShowText','on');
h2.LineWidth = 2;
% this makes the contour lines bolder, easier to see

clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
% if you have a colormap that makes black font hard to read, you can change
% the color

title('Argentine Basin OOI mooring potential temperature profile')
dateFormat = 'mmm yyyy';
datetick('x',dateFormat)
% this lets you leave the time axis in datenum format, but you have to
% convert profile datenum to matlab (are they the same?)

axis(coords)

%% I explain all of these commands in the acc_plots_prof_contourf
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.035];
set(ax,'yticklabel',num2str(abs(get(ax,'ytick').')))
ax.LineWidth = 1.5;
ax.AmbientLightColor = Color(:,36)';
ax.Title.FontWeight = 'normal';
set(gca, 'defaultUicontrolFontName', 'Ubuntu')
set(gca, 'defaultUitableFontName', 'Ubuntu')
set(gca, 'defaultAxesFontName', 'Ubuntu')
set(gca, 'defaultTextFontName', 'Ubuntu')
set(gca, 'defaultUipanelFontName', 'Ubuntu')
ax.FontSize = 16; 
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1) + 0.01;
bottom = outerpos(2) + ti(2) + 0.01;
ax_width = outerpos(3) - ti(1) - ti(3) - 0.02;
ax_height = outerpos(4) - ti(2) - ti(4) - 0.02;
ax.Position = [left bottom ax_width ax_height];
%% 
legend('Temperature','Pressure')
legend('Location','southwest')
hold off
print('Argentine_Basin_OOI_Mooring_1','-dpng')

%% end first plot


%% second plot (same as first, but with a bunch of the commands 
%% in a separate script)

figure()
set(gcf, 'Position', [1, 1, 1600, 750])
colormap(cm)
contourf(time,D,T,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(time,D,P,pressure_levels,'w','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile')
dateFormat = 'mmm yyyy';
datetick('x',dateFormat)
axis(coords)
acc_plots_prof_contourf  % this has the commands from the first plot
legend('Temperature','Pressure')
legend('Location','southwest')
hold off
print('Argentine_Basin_OOI_Mooring_2','-dpng')

%% end second plot





cm = acc_colormap('balance');

ub = 22;
lb = -2;
nlvls = 121;
z = linspace(lb,ub,nlvls);


%% third plot

figure()
set(gcf, 'Position', [1, 1, 1600, 750])
colormap(cm)
contourf(time,D,T,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(time,D,P,pressure_levels,'k','ShowText','on');
h2.LineWidth = 2;
clabel(M,h2,'FontSize',16,'Color','k','FontName','Ubuntu')
title('Argentine Basin OOI mooring potential temperature profile')
dateFormat = 'mmm yyyy';
datetick('x',dateFormat)
axis(coords)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.035];
set(ax,'yticklabel',num2str(abs(get(ax,'ytick').')))
ax.LineWidth = 1.5;
ax.AmbientLightColor = Color(:,36)';
ax.Title.FontWeight = 'normal';
set(gca, 'defaultUicontrolFontName', 'Ubuntu')
set(gca, 'defaultUitableFontName', 'Ubuntu')
set(gca, 'defaultAxesFontName', 'Ubuntu')
set(gca, 'defaultTextFontName', 'Ubuntu')
set(gca, 'defaultUipanelFontName', 'Ubuntu')
ax.FontSize = 16; 
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1) + 0.01;
bottom = outerpos(2) + ti(2) + 0.01;
ax_width = outerpos(3) - ti(1) - ti(3) - 0.02;
ax_height = outerpos(4) - ti(2) - ti(4) - 0.02;
ax.Position = [left bottom ax_width ax_height];
legend('Temperature','Pressure')
legend('Location','southwest')
hold off
print('Argentine_Basin_OOI_Mooring_3','-dpng')

%% end third plot


%% fourth plot (same as third, but with various commands in a separate script)

figure()
set(gcf, 'Position', [1, 1, 1600, 750])
colormap(cm)
contourf(time,D,T,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
[M,h2] = contour(time,D,P,pressure_levels,'k','ShowText','on');
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
print('Argentine_Basin_OOI_Mooring_4','-dpng')

%% end fourth plot