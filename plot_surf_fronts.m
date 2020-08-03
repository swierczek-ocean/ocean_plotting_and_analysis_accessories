clear
close all
clc
tic()

acc_settings
load mask
mask = permute(mask,[2,1,3]);
load ../2020_02_February_analysis/FRONTS
acc_colors

lw = 4;
c3 = 55;
c6 = 56;
c12 = 57;

STF_X = STF_X(60:200);
STF_Y = STF_Y(60:200);
SACCF_X = SACCF_X(200:700);
SACCF_Y = SACCF_Y(200:700);
%% surf
load Topo12
coords = [XC12(350,1) XC12(end) YC12(1) YC12(end) -10000 10000];
XCL = XC12(223,:);
YCL = YC12(223,:);
ZCL = Topo12(223,:) + 10;

XCMA = (360 - 42.8917).*ones(1000,1);
YCMA = -42.4932.*ones(1000,1);
XCMB = (360 - 42.1371).*ones(1000,1);
YCMB = -42.4947.*ones(1000,1);
XCMP = (360 - 42.5083).*ones(1000,1);
YCMP = -42.9799.*ones(1000,1);


ZCM = linspace(-6000,0,1000);





cm = acc_colormap('cmo_topo');
cm = cm(1:248,:);
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
surf(XC12,YC12,Topo12,'EdgeColor','interp')
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
% line(PF_X+360,PF_Y,'Color','w','LineWidth',lw+3);
% h3 = line(PF_X+360,PF_Y,'Color',Color(72,:),'LineWidth',lw);
% 
% 
% line(SAF_X+360,SAF_Y,'Color','w','LineWidth',lw+3);
% h2 = line(SAF_X+360,SAF_Y,'Color',Color(73,:),'LineWidth',lw);
% 
% line(STF_X+360,STF_Y,'Color','w','LineWidth',lw+3);
% h1 = line(STF_X+360,STF_Y,'Color',Color(74,:),'LineWidth',lw);
% line(SBDY_X+360,SBDY_Y,'Color','w','LineWidth',lw+3);
% h5 = line(SBDY_X+360,SBDY_Y,'Color',Color(70,:),'LineWidth',lw);
% line(SACCF_X+360,SACCF_Y,'Color','w','LineWidth',lw+3);
% h4 = line(SACCF_X+360,SACCF_Y,'Color',Color(71,:),'LineWidth',lw);
cbar = colorbar('eastoutside');
% cbar.Direction = 'reverse';
ytickformat('degrees')
ylabel('latitude')
xtickformat('degrees')
xlabel('longitude')
zticks([-6000 -4000 -2000 0 2000 4000])
zticklabels({'-6000','-4000','-2000','0','2000','4000'})
% zticks([-6000 -4000 -2000 0 2000 ])
% zticklabels({'-6000','-4000','-2000','0','4000'})
axis(coords)
acc_movie
acc_plots
title('Argentine Basin Bathymetry','FontWeight','Normal','FontSize',28)
% legend([h1(1),h2(1),h3(1),h4(1),h5(1)],'STF','SAF','PF',...
%     'SACCF','SBDY','Location','southeast','FontSize',24,'Color',Color(91,:))
hold off
set(gcf,'InvertHardCopy','off'); 
% print('AB_BATHY_surf','-dpng')

%% surf




toc()