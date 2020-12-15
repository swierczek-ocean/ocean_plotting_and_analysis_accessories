clear
close all
clc
tic()

load SST_DIC_panels

load mask
load XY3 XC3 YC3
load XY12 XC12 YC12

acc_colors
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC12,YC12] = ndgrid(XC12,YC12);


p3 = zeros(size(XC3));
p32 = zeros(size(XC3));
p12 = zeros(size(XC12));
p122 = zeros(size(XC12));

p3(36:140,18:100) = 1;
p32(102:107,80:87) = 1;
p12(137:556,63:391) = 1;
p122(401:424,310:342) = 1;

%% DIC
cm = acc_colormap('cmo_balance');
ub = 10;
lb = -ub;
nlvls = 20;
z = linspace(lb,ub,nlvls);
z = [-1000,z,1000];
lw = 1.7;


figure()
set(gcf, 'Position', [1, 1, 1700, 980])
colormap(cm)

ax1 = subplot(4,5,1);
contourf(XC3,YC3,dic3linsm(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(1)
% text(291,-33.7,'1 Day','FontSize',21,'Color','w')
hold off

ax2 = subplot(4,5,2);
contourf(XC3,YC3,dic3linsm(:,:,2),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(2)
% text(291,-33.7,'7 Days','FontSize',21,'Color','w')
hold off

ax3 = subplot(4,5,3);
contourf(XC3,YC3,dic3linsm(:,:,3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 DIC LINEAR RESPONSE [\mumol C/m^3]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(3)
% text(291,-33.7,'14 Days','FontSize',21,'Color','w')
hold off

ax4 = subplot(4,5,4);
contourf(XC3,YC3,dic3linsm(:,:,4),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(4)
% text(291,-33.7,'45 Days','FontSize',21,'Color','w')
hold off

ax5 = subplot(4,5,5);
contourf(XC3,YC3,dic3linsm(:,:,5),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(5)
% text(291,-33.7,'60 Days','FontSize',21,'Color','w')
hold off

ax6 = subplot(4,5,6);
contourf(XC12,YC12,dic12linsm(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(6)
% text(291,-33.7,'1 Day','FontSize',21,'Color','w')
hold off

ax7 = subplot(4,5,7);
contourf(XC12,YC12,dic12linsm(:,:,2),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(7)
% text(291,-33.7,'7 Days','FontSize',21,'Color','w')
hold off

ax8 = subplot(4,5,8);
contourf(XC12,YC12,dic12linsm(:,:,3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/12 DIC LINEAR RESPONSE [\mumol C/m^3]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(8)
% text(291,-33.7,'14 Days','FontSize',21,'Color','w')
hold off

ax9 = subplot(4,5,9);
contourf(XC12,YC12,dic12linsm(:,:,4),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(9)
% text(291,-33.7,'45 Days','FontSize',21,'Color','w')
hold off

ax10 = subplot(4,5,10);
contourf(XC12,YC12,dic12linsm(:,:,5),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(10)
% text(291,-33.7,'60 Days','FontSize',21,'Color','w')
hold off


ax11 = subplot(4,5,11);
contourf(XC3,YC3,dic3nonlinsm(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(11)
% text(291,-33.7,'1 Day','FontSize',21,'Color','w')
hold off

ax12 = subplot(4,5,12);
contourf(XC3,YC3,dic3nonlinsm(:,:,2),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(12)
% text(291,-33.7,'7 Days','FontSize',21,'Color','w')
hold off

ax13 = subplot(4,5,13);
contourf(XC3,YC3,dic3nonlinsm(:,:,3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title('1/3 DIC NONLINEAR RESPONSE [\mumol C/m^3]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(13)
% text(291,-33.7,'14 Days','FontSize',21,'Color','w')
hold off

ax14 = subplot(4,5,14);
contourf(XC3,YC3,dic3nonlinsm(:,:,4),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(14)
% text(291,-33.7,'45 Days','FontSize',21,'Color','w')
hold off

ax15 = subplot(4,5,15);
contourf(XC3,YC3,dic3nonlinsm(:,:,5),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(15)
% text(291,-33.7,'60 Days','FontSize',21,'Color','w')
hold off

ax16 = subplot(4,5,16);
contourf(XC12,YC12,dic12nonlinsm(:,:,1),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
xticks([295,320,345])
ytickformat('degrees')
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(16)
% text(291,-33.7,'1 Day','FontSize',21,'Color','w')
hold off

ax17 = subplot(4,5,17);
contourf(XC12,YC12,dic12nonlinsm(:,:,2),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
xticks([295,320,345])
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(17)
% text(291,-33.7,'7 Days','FontSize',21,'Color','w')
hold off

ax18 = subplot(4,5,18);
contourf(XC12,YC12,dic12nonlinsm(:,:,3),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
xticks([295,320,345])
xlabel(' 1 Day                           7 Days                        14 Days                       45 Days                         60 Days  ',...
    'FontWeight','Normal','FontSize',16)
title('1/12 DIC NONLINEAR RESPONSE [\mumol C/m^3]','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(18)
% text(291,-33.7,'14 Days','FontSize',21,'Color','w')
hold off

ax19 = subplot(4,5,19);
contourf(XC12,YC12,dic12nonlinsm(:,:,4),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
xticks([295,320,345])
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(19)
% text(291,-33.7,'45 Days','FontSize',21,'Color','w')
hold off

ax20 = subplot(4,5,20);
contourf(XC12,YC12,dic12nonlinsm(:,:,5),'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% contour(XC12,YC12,p12,'Color','k','LineWidth',lw)
% contour(XC12,YC12,p122,'Color','k','LineWidth',lw)
caxis([lb ub])
axis(inside_coords)
ytickformat('degrees')
xticks([295,320,345])
title(' ','FontWeight','Normal','FontSize',16)
acc_movie_w
acc_20_panel(20)
% text(291,-33.7,'60 Days','FontSize',21,'Color','w')
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/response_dic_small','-dpng')

close all

toc()