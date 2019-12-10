clear
close all
clc
tic()

acc_settings


lw = 4;
ms = 20;
cb = 85;
cbd = 36;
c3 = 55;
c6 = 56;
c12 = 57;
qw = 7;
oas = 17;
ias = 14;
oase = 17;
iase = 14;

load AB122_output THETA_122_JD_avg
load mask
load XY12 XC12 YC12
[XC12,YC12] = ndgrid(XC12,YC12);
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
% c1 = 13;
c1 = 61;
c2 = 13;
cs = 61;
elw = 4;

THETA_122_JD_avg(THETA_122_JD_avg>100) = NaN;


cm = acc_colormap('es_coolwarm');

% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% colormap(cm)
% contourf(XC12,YC12,THETA_122_JD_avg,100,'LineStyle','none');
% hold on
% cbar = colorbar('eastoutside');
% contour(XCm,YCm,mask(:,:,1),'Color','k')
% 
% line([290 290],[-55 -34],'Color','k','LineWidth',lw+3)
% line([290 345.15],[-55 -55],'Color','k','LineWidth',lw+3)
% line([290 345.15],[-34 -34],'Color','k','LineWidth',lw+3)
% line([345 345],[-55.15 -33.85],'Color','k','LineWidth',lw+3)
% 
% line([290 290],[-55 -34],'Color',Color(c1,:),'LineWidth',lw)
% line([290 345.1],[-55 -55],'Color',Color(c1,:),'LineWidth',lw)
% line([290 345.1],[-34 -34],'Color',Color(c1,:),'LineWidth',lw)
% line([345 345],[-55 -34],'Color',Color(c1,:),'LineWidth',lw)
% 
% 
% %% top of AB
% arrow([315.5,-32.9],[315.5,-35.6],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% h1 = arrow([315.5,-33],[315.5,-35.5],ias,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw);
% arrow([317.5,-32.9],[317.5,-35.6],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% h2 = arrow([317.5,-33],[317.5,-35.5],ias,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw);
% arrow([319.5,-32.9],[319.5,-35.6],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% h3 = arrow([319.5,-33],[319.5,-35.5],ias,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw);
% text(310,-34,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
% text(310,-35.5,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
% text(310,-37,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
% %% 
% 
% %% bottom of AB
% arrow([315.5,-53.9],[315.5,-56.6],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% arrow([315.5,-54],[315.5,-56.5],ias,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
% arrow([317.5,-53.9],[317.5,-56.6],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% arrow([317.5,-54],[317.5,-56.5],ias,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
% arrow([319.5,-53.9],[319.5,-56.6],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% arrow([319.5,-54],[319.5,-56.5],ias,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
% text(310,-52,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
% text(310,-53.5,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
% text(310,-55,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
% %% 
% 
% %% east of AB
% arrow([343.9,-42.5],[347.1,-42.5],oase,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% arrow([344,-42.5],[347,-42.5],iase,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
% arrow([343.9,-44],[347.1,-44],oase,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% arrow([344,-44],[347,-44],iase,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
% arrow([343.9,-45.5],[347.1,-45.5],oase,'BaseAngle',90,'Color','k','LineWidth',qw+2)
% arrow([344,-45.5],[347,-45.5],iase,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
% text(339.8,-42.5,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c3,:),'LineWidth',elw)
% text(339.8,-44,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c6,:),'LineWidth',elw)
% text(339.8,-45.5,'xyz PW','Color','k','FontSize',19,...
%     'BackgroundColor','w','EdgeColor',Color(c12,:),'LineWidth',elw)
% %% 
% 
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('model heat budgets','FontWeight','Normal','FontSize',16)
% legend([h1(1),h2(1),h3(1)],' 1/3',' 1/6',' 1/12','Location','best')
% acc_movie_gray
% acc_plots
% hold off
% set(gcf,'InvertHardCopy','off'); 
% print('-r300','MITgcm_heat_budget_1','-dpng')


%% three heat plots
oas = 10;
ias = 8;
oasv = 9;
iasv = 7;
elw = 2.4;
figure()
set(gcf, 'Position', [1, 1, 1200, 2000])
colormap(cm)

ax1 = subplot(3,1,1);
contourf(XC12,YC12,THETA_122_JD_avg,100,'LineStyle','none');
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')

line([290 290],[-55 -34],'Color','k','LineWidth',lw+3)
line([290 345.15],[-55 -55],'Color','k','LineWidth',lw+3)
line([290 345.15],[-34 -34],'Color','k','LineWidth',lw+3)
line([345 345],[-55.15 -33.85],'Color','k','LineWidth',lw+3)

line([290 290],[-55 -34],'Color',Color(c1,:),'LineWidth',lw)
line([290 345.1],[-55 -55],'Color',Color(c1,:),'LineWidth',lw)
line([290 345.1],[-34 -34],'Color',Color(c1,:),'LineWidth',lw)
line([345 345],[-55 -34],'Color',Color(c1,:),'LineWidth',lw)


%% top of AB
arrow([317.5,-32.9],[317.5,-35.6],oasv,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([317.5,-33],[317.5,-35.5],iasv,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
text(311,-34,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%% 

%% bottom of AB
arrow([317.5,-53.9],[317.5,-56.6],oasv,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([317.5,-54],[317.5,-56.5],iasv,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
text(311,-55,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%% 

%% east of east of AB
arrow([343.9,-44],[347.1,-44],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([344,-44],[347,-44],ias,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
text(338.4,-44,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%% 

axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/3 model heat budget','FontWeight','Normal','FontSize',16)
acc_movie_gray
acc_3splots_1
hold off

ax2 = subplot(3,1,2);
contourf(XC12,YC12,THETA_122_JD_avg,100,'LineStyle','none');
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')

line([290 290],[-55 -34],'Color','k','LineWidth',lw+3)
line([290 345.15],[-55 -55],'Color','k','LineWidth',lw+3)
line([290 345.15],[-34 -34],'Color','k','LineWidth',lw+3)
line([345 345],[-55.15 -33.85],'Color','k','LineWidth',lw+3)

line([290 290],[-55 -34],'Color',Color(c1,:),'LineWidth',lw)
line([290 345.1],[-55 -55],'Color',Color(c1,:),'LineWidth',lw)
line([290 345.1],[-34 -34],'Color',Color(c1,:),'LineWidth',lw)
line([345 345],[-55 -34],'Color',Color(c1,:),'LineWidth',lw)

%% top of AB
arrow([317.5,-32.9],[317.5,-35.6],oasv,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([317.5,-33],[317.5,-35.5],iasv,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
text(311,-34,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%% 

%% bottom of AB
arrow([317.5,-53.9],[317.5,-56.6],oasv,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([317.5,-54],[317.5,-56.5],iasv,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
text(311,-55,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%%  

%% east of east of AB
arrow([343.9,-44],[347.1,-44],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([344,-44],[347,-44],ias,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
text(338.4,-44,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%%  

axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 model heat budget','FontWeight','Normal','FontSize',16)
acc_movie_gray
acc_3splots_2
hold off

ax3 = subplot(3,1,3);
contourf(XC12,YC12,THETA_122_JD_avg,100,'LineStyle','none');
hold on
cbar = colorbar('southoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')

line([290 290],[-55 -34],'Color','k','LineWidth',lw+3)
line([290 345.15],[-55 -55],'Color','k','LineWidth',lw+3)
line([290 345.15],[-34 -34],'Color','k','LineWidth',lw+3)
line([345 345],[-55.15 -33.85],'Color','k','LineWidth',lw+3)

line([290 290],[-55 -34],'Color',Color(c1,:),'LineWidth',lw)
line([290 345.1],[-55 -55],'Color',Color(c1,:),'LineWidth',lw)
line([290 345.1],[-34 -34],'Color',Color(c1,:),'LineWidth',lw)
line([345 345],[-55 -34],'Color',Color(c1,:),'LineWidth',lw)

%% top of AB
arrow([317.5,-32.9],[317.5,-35.6],oasv,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([317.5,-33],[317.5,-35.5],iasv,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
text(311,-34,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%% 

%% bottom of AB
arrow([317.5,-53.9],[317.5,-56.6],oasv,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([317.5,-54],[317.5,-56.5],iasv,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
text(311,-55,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%% 

%% east of east of AB
arrow([343.9,-44],[347.1,-44],oas,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([344,-44],[347,-44],ias,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
text(338.4,-44,'xyz PW','Color','k','FontSize',18,...
    'BackgroundColor','w','EdgeColor','k','LineWidth',elw)
%% 

axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 model heat budget','FontWeight','Normal','FontSize',16)
acc_movie_gray
acc_3splots_3
hold off

set(gcf,'InvertHardCopy','off'); 
print('-r200','MITgcm_heat_budget_2','-dpng')

%% end three heat plots







toc()