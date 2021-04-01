clear
close all
clc
tic()

coords = [286 359 -66 -26 -6000 4000];
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

load XY3 XC3 YC3
load XY12 XC12 YC12
load Current
j = 4;
X = XC12(1:j:end);
Y = YC12(1:j:end);
U = uvel12(1:j:end,1:j:end);
V = vvel12(1:j:end,1:j:end);

Z = zeros(size(U));
[X,Y] = ndgrid(X,Y);

% Depth(Depth>0) = Depth(Depth>0)./130;
Depth(Depth>0) = 0;

X1 = linspace(288,352,100);
Y1 = -60.*ones(100,1);
Z1 = zeros(100,1);
X2 = linspace(288,352,100);
Y2 = -30.*ones(100,1);
X3 = 352.*ones(100,1);
Y3 = linspace(-60,-30,100);
X4 = 288.*ones(100,1);

cm(257,:) = [0.73,0.73,0.73];

ACC_X = [288.8,291.4,293.7,294.7,295.7,297.3,299,300.7,303.4,...
    305.7,308.4,311,312.7,314.7,317.4,320,323.7,327.7,331,333.4,...
    335.7,337.7,340.4,342.7,345.4,347.4,349.4,351.4];
ACC_Y = [-58.5,-57.5,-57.4,-56.5,-55.9,-55.25,-55,-55.4,-55.2,...
    -54.6,-54.2,-53.6,-52.2,-52.02,-52,-50.1,-48.8,-48.6,-49.1,-49.5,...
    -49.27,-49.9,-49.9,-48.8,-49.3,-49.5,-50.4,-49.7];
PX = linspace(288.8,351.4,120);
P = pchip(ACC_X,ACC_Y,PX);

BCX = [310.4,310.4,310.35,310,309.7,309.4,309,308.5,308,...
    307.7,307,306.4,306];
BCY = [-30.8,-31.4,-32.26,-33.1,-33.66,-33.94,-34.5,-34.75,-35.3,...
    -35.85,-36.7,-37.46,-38.51];

MCX = [304.7,305,305,304.7,305,305.4,305.7,305.7,305.4,...
    305,304.4,303.7,302.7,302,301.4,301,301,301,301.3,...
    302,303,304.4];
MCY = [-54.6,-54,-53.4,-52.6,-51.8,-50.55,-49.7,-49.1,-48.8,...
    -48.6,-48.4,-48.2,-47.9,-47.7,-47.5,-46.6,-45.9,-44.7,-43.8,...
    -43,-42.1,-40.8];
ZAX = linspace(309,325,100);
ZAX = [ZAX,fliplr(ZAX)];
ZAY = zeros(1,200);
for ii=1:100
    ZAY(ii) = sqrt(16-0.25*(ZAX(ii)-317)^2) - 45;
end
for ii=101:200
    ZAY(ii) = -sqrt(16-0.25*(ZAX(ii)-317)^2) - 45;
end
cw = 7;
cc = 11;

set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
surf(XC,YC,Depth,'LineStyle','none')
hold on
contour(XC,YC,single(Depth<0),'Color','k','LineWidth',0.6)
plot3(X1,Y1,Z1,'Color','k','LineWidth',lwb)
plot3(X2,Y2,Z1,'Color','k','LineWidth',lwb)
plot3(X3,Y3,Z1,'Color','k','LineWidth',lwb)
plot3(X4,Y3,Z1,'Color','k','LineWidth',lwb)
% quiver3(X,Y,Z,U,V,Z,2,'Color',Color(11,:))
h1 = plot3(PX,P,1.*ones(1,120),'Color',Color(79,:),'LineWidth',cw+4);
h2 = plot3(BCX,BCY,1.*ones(1,13),'Color',Color(75,:),'LineWidth',cw+4);
h3 = plot3(MCX,MCY,1.*ones(1,22),'Color',Color(78,:),'LineWidth',cw+4);
h4 = plot3(ZAX,ZAY,1.*ones(1,200),'Color',Color(76,:),'LineWidth',cw+4);
% plot3(PX,P,25.*ones(1,120),'Color',Color(60,:),'LineWidth',cw)
% plot3(BCX,BCY,25.*ones(1,13),'Color',Color(59,:),'LineWidth',cw)
% plot3(MCX,MCY,25.*ones(1,22),'Color',Color(58,:),'LineWidth',cw)
plot3([305 303],[-40.31 -40.56],[1 1],'Color',Color(78,:),'LineWidth',cw)
plot3([305 304.5],[-40.31 -42.07],[1 1],'Color',Color(78,:),'LineWidth',cw)
plot3([305.7 305.7],[-39.29 -37.19],[1 1],'Color',Color(75,:),'LineWidth',cw)
plot3([305.7 307],[-39.29 -37.98],[1 1],'Color',Color(75,:),'LineWidth',cw)
plot3([352 350.4],[-49.39 -49.27],[1 1],'Color',Color(79,:),'LineWidth',cw)
plot3([352 351.4],[-49.39 -50.77],[1 1],'Color',Color(79,:),'LineWidth',cw)
plot3([314.3 313.7],[-48.77 -49.0],[1 1],'Color',Color(76,:),'LineWidth',cw)
plot3([314.3 313.7],[-48.77 -48.17],[1 1],'Color',Color(76,:),'LineWidth',cw)
plot3([317.9 318.4],[-41.02 -41.5],[1 1],'Color',Color(76,:),'LineWidth',cw)
plot3([317.9 318.5],[-41.02 -40.6],[1 1],'Color',Color(76,:),'LineWidth',cw)
grid off
axis(coords)
xtickformat('degrees')
ytickformat('degrees')
xlabel('longitude')
ylabel('latitude')
zticks([-6000,-4000,-2000,0])
zticklabels({'6km','4km','2km','0'})
xticks([290,300,310,320,330,340,350])
xticklabels({'70\circW','60\circW','50\circW','40\circW',...
    '30\circW','20\circW','10\circW',})
yticks([-60,-50,-40,-30])
yticklabels({'60\circS','50\circS','40\circS','30\circS'})
legend([h2(1),h4(1),h3(1),h1(1)],'Brazil Current','Zapiola Anticyclone','Malvinas Current','Antarctic Circumpolar Current','Location','northeast')
% acc_plots
acc_movie_w
ax = gca;
ax.LineWidth = 2;
ax.GridAlpha = 1;
set(gcf,'InvertHardCopy','off');
print('-r200','AB_surf_currents','-dpng')
close all



%% 

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

