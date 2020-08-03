clear
close all
clc
tic()

acc_colors
lw = 5;

x1 = [0,5,10];
y1 = [2,4.8,3.9];

X1 = linspace(0,10,100);
Y1 = interp1(x1,y1,X1,'makima');

x2 = [10,17,23];
y2 = [5.7,3.7,6.4];

X2 = linspace(10,23,100);
Y2 = interp1(x2,y2,X2,'makima');


x3 = [23,26,31,34];
y3 = [4.7,6.5,5.7,6.2];

X3 = linspace(23,34,100);
Y3 = interp1(x3,y3,X3,'makima');

XS = [0,10,10,23,23,34];
YS = [2,3.9,5.7,6.4,4.7,6.2];

XO = [10,23,34];
YO = [6.3,3.98,7.56];

x = [10,23,34];
y = [3.9,6.4,6.2];
u = [0,0,0];
v = [1.3,-1.2,1.1];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h3 = quiver(x,y,u,v,0,'LineWidth',lw,'Color',Color(54,:),...
    'Marker','.','MarkerSize',28);
hold on
h1 = plot(X1,Y1,'LineWidth',lw,'Color',Color(70,:));
plot(X2,Y2,'LineWidth',lw,'Color',Color(70,:))
plot(X3,Y3,'LineWidth',lw,'Color',Color(70,:))
scatter(XS,YS,90,Color(70,:),'filled')
h2 = scatter(XO,YO,270,Color(74,:),'d','filled');
grid on
xticks([0,10,23,34])
xticklabels({'start time','first obs','second obs','third obs'})
yticks([2,3,4,5,6,7,8])
yticklabels({'IC','2','3','4','5','6','7'})
axis([0 35 1.5 8.5])
legend([h1(1),h2(1),h3(1)],'model','observations',...
    'correction/filter','Location','southeast','FontSize',24)
title('Kalman Filter cartoon',...
    'FontWeight','Normal','FontSize',22)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','KF_cartoon','-dpng')

x = [0,5,11,15,23,26,31,34];
y = [2,7,5.5,3,5,4.6,7,6.2];
X1 = linspace(0,34,200);
Y1 = interp1(x,y,X1,'makima');

x = [0,5,10,15,23,31,34];
y = [4,6.5,6,3.8,4.5,7.4,6.75];
Y2 = interp1(x,y,X1,'makima');

XS1 = [0,34];
YS1 = [2,6.2];
XS2 = [0,34];
YS2 = [4,6.75];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(X1,Y1,'LineWidth',lw,'Color',Color(70,:));
hold on
h3 = plot(X1,Y2,'LineWidth',lw,'Color',Color(54,:));
scatter(XS1,YS1,90,Color(70,:),'filled')
scatter(XS2,YS2,90,Color(54,:),'filled')
h2 = scatter(XO,YO,270,Color(74,:),'d','filled');
grid on
xticks([0,10,23,34])
xticklabels({'start time','first obs','second obs','third obs'})
yticks([2,3,4,5,6,7,8])
yticklabels({'1st IC','2','2nd IC','4','5','6','7'})
axis([0 35 1.7 8.1])
legend([h1(1),h2(1),h3(1)],'1st model iteration','observations',...
    '2nd model iteration','Location','southeast','FontSize',24)
title('Adjoint method cartoon',...
    'FontWeight','Normal','FontSize',22)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','AD_cartoon','-dpng')





toc()