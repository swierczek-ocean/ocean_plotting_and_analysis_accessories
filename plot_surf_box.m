clear
close all
clc
tic()

coords = [285 355 -60 -28 -6000 4000];
acc_colors
lwb = 3.1;


lw = 2.9;
ms = 20;
cb = 85;
cbd = 36;
c3 = 55;
c6 = 56;
c12 = 57;
qw = 7;
load new_depth
z = -6000:20:60;
cm = flipud(acc_colormap('bc_grays'));
% cm = cm(1:129,:);

% Depth(Depth>0) = Depth(Depth>0)./130;
Depth(Depth>0) = 0;

X1 = linspace(294,345,100);
Y1 = -55.*ones(100,1);
Z1 = zeros(100,1);
Z2 = -300.*ones(100,1);
X2 = linspace(307,345,100);
Y2 = -33.6.*ones(100,1);
X3 = 345.*ones(100,1);
Y3 = linspace(-55,-33.6,100);

x1 = 345.1.*ones(50,1);
y1 = -33.66.*ones(50,1);
z1 = linspace(-300,0,50);
x2 = 345.1.*ones(50,1);
y2 = -54.99.*ones(50,1);
z2 = linspace(-300,0,50);
x3 = 300.*ones(50,1);
y3 = -33.6.*ones(50,1);
z3 = linspace(-300,0,50);
x4 = 290.*ones(50,1);
y4 = -55.*ones(50,1);
z4 = linspace(-300,0,50);

cm(257,:) = Color(17,:);


set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
surf(XC,YC,Depth,'LineStyle','none')
hold on
contour(XC,YC,single(Depth<0),'Color','k','LineWidth',0.6)
% contour(XC,YC,Budget,'Color','k','LineWidth',lwb)
% contour3(XC,YC,Budget-300,'Color','k','LineWidth',lwb)
plot3(X1,Y1,Z1,'Color','k','LineWidth',lwb)
plot3(X1,Y1,Z2,'Color','k','LineWidth',lwb)
plot3(X2,Y2,Z1,'Color','k','LineWidth',lwb)
plot3(X2,Y2,Z2,'Color','k','LineWidth',lwb)
plot3(X3,Y3,Z1,'Color','k','LineWidth',lwb)
plot3(X3,Y3,Z2,'Color','k','LineWidth',lwb)


plot3(x1,y1,z1,'Color','k','LineWidth',lwb)
plot3(x2,y2,z2,'Color','k','LineWidth',lwb)
plot3(x3,y3,z3,'Color','k','LineWidth',lwb)
plot3(x4,y4,z4,'Color','k','LineWidth',lwb)
grid off
axis(coords)
xtickformat('degrees')
ytickformat('degrees')

%% top of AB
% arrow([315,-28.5,0],[315,-33.1,0],24,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
h1 = arrow([315,-29,0],[315,-33,0],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw,'NormalDir',1);
% arrow([325,-28.5,0],[325,-33.1,0],24,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
h2 = arrow([325,-29,0],[325,-33,0],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw,'NormalDir',1);
% arrow([335,-28.5,0],[335,-33.1,0],24,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
h3 = arrow([335,-29,0],[335,-33,0],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw,'NormalDir',1);
%% 

%% bottom of AB
% arrow([315,-59.9,0],[315,-55.5,0],24,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
arrow([315,-60,0],[315,-55.6,0],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw,'NormalDir',1)
% arrow([325,-59.9,0],[325,-55.5,0],24,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
arrow([325,-60,0],[325,-55.6,0],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw,'NormalDir',1)
% arrow([335,-59.9,0],[335,-55.5,0],24,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
arrow([335,-60,0],[335,-55.6,0],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw,'NormalDir',1)
%% 


%% east of AB
% arrow([345.9,-41,0],[350.6,-41,0],22,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
arrow([346,-41,0],[350.5,-41,0],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw,'NormalDir',1)
% arrow([345.9,-45,0],[350.6,-45,0],22,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
arrow([346,-45,0],[350.5,-45,0],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw,'NormalDir',1)
% arrow([345.9,-49,0],[350.6,-49,0],22,'BaseAngle',90,'Color','k','LineWidth',qw+2,'NormalDir',1)
arrow([346,-49,0],[350.5,-49,0],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw,'NormalDir',1)
%% 


zticks([-6000,-4000,-2000,0])
% acc_plots
acc_movie
legend([h1(1),h2(1),h3(1)],' 1/3',' 1/6',' 1/12','Location','southeast')
set(gcf,'InvertHardCopy','off');
print('-r200','AB_surf_box','-dpng')
close all

