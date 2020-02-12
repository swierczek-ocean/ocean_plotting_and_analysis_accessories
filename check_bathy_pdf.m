clear
close all
clc
tic()

acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;

%% 1/3
load XY3 Depth3
x = 6:170;
y = 29:119;
Depth3 = Depth3(x,y);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(Depth3,'BinEdges',10:10:500,'FaceColor',Color(c3,:))
xlabel('depth [m]')
ylabel('count')
xlim([10 500])
grid on
title('pdf of 1/3 bathymetry','FontWeight','Normal','FontSize',18)
acc_movie_w
acc_plots
set(gcf,'InvertHardCopy','off');
print('-r300','bathy_pdf_3_upper','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(Depth3,'BinEdges',0:100:6000,'FaceColor',Color(c3,:))
xlabel('depth [m]')
ylabel('count')
grid on
title('pdf of 1/3 bathymetry','FontWeight','Normal','FontSize',18)
acc_movie_w
acc_plots
set(gcf,'InvertHardCopy','off');
print('-r300','bathy_pdf_3_full','-dpng')
%% 1/3

%% 1/6
load XY6 Depth6
x = 11:340;
y = 54:235;
Depth6 = Depth6(x,y);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(Depth6,'BinEdges',10:10:500,'FaceColor',Color(c6,:))
xlabel('depth [m]')
ylabel('count')
xlim([10 500])
grid on
title('pdf of 1/6 bathymetry','FontWeight','Normal','FontSize',18)
acc_movie_w
acc_plots
set(gcf,'InvertHardCopy','off');
print('-r300','bathy_pdf_6_upper','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(Depth6,'BinEdges',0:100:6000,'FaceColor',Color(c6,:))
xlabel('depth [m]')
ylabel('count')
grid on
title('pdf of 1/6 bathymetry','FontWeight','Normal','FontSize',18)
acc_movie_w
acc_plots
set(gcf,'InvertHardCopy','off');
print('-r300','bathy_pdf_6_full','-dpng')
%% 1/6


%% 1/12
load XY12 Depth12
x = 17:676;
y = 106:467;
Depth12 = Depth12(x,y);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(Depth12,'BinEdges',10:10:500,'FaceColor',Color(c12,:))
xlabel('depth [m]')
ylabel('count')
xlim([10 500])
grid on
title('pdf of 1/12 bathymetry','FontWeight','Normal','FontSize',18)
acc_movie_w
acc_plots
set(gcf,'InvertHardCopy','off');
print('-r300','bathy_pdf_12_upper','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
histogram(Depth12,'BinEdges',0:100:6000,'FaceColor',Color(c12,:))
xlabel('depth [m]')
ylabel('count')
grid on
title('pdf of 1/12 bathymetry','FontWeight','Normal','FontSize',18)
acc_movie_w
acc_plots
set(gcf,'InvertHardCopy','off');
print('-r300','bathy_pdf_12_full','-dpng')
%% 1/12







toc()