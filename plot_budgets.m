clear
close all
clc
tic()

acc_settings


lw = 2.9;
ms = 20;
cb = 85;
cbd = 36;
c3 = 86;
c6 = 87;
c12 = 88;
qw = 7;

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
% line([290 290],[-58.96 -31.72],'Color',Color(c1,:),'LineWidth',lw)
% % line([350 350],[-58.96 -31.72],'Color',Color(c1,:),'LineWidth',lw)
% line([290 350],[-58.96 -58.96],'Color',Color(c1,:),'LineWidth',lw)
% line([290 350],[-31.72 -31.72],'Color',Color(c1,:),'LineWidth',lw)
% 
% line([300 300],[-52 -36.15],'Color',Color(c1,:),'LineWidth',lw)
% line([335 335],[-52 -36.15],'Color',Color(c1,:),'LineWidth',lw)
% line([300 345],[-52 -52],'Color',Color(c1,:),'LineWidth',lw)
% line([300 345],[-36.15 -36.15],'Color',Color(c1,:),'LineWidth',lw)
% line([345 345],[-52 -36.15],'Color',Color(c1,:),'LineWidth',lw)
% 
% % line([290 290],[-58.96 -31.72],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% % % line([350 350],[-58.96 -31.72],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% % line([290 350],[-58.96 -58.96],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% % line([290 350],[-31.72 -31.72],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% % 
% % line([300 300],[-52 -36.15],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% % line([335 335],[-52 -36.15],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% % line([300 345],[-52 -52],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% % line([300 345],[-36.15 -36.15],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% % line([345 345],[-52 -36.15],'LineStyle','--','Color',Color(c2,:),'LineWidth',lw)
% 
% %% top of AB
% h1 = arrow([307.5,-35],[307.5,-37.5],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw);
% h2 = arrow([317.5,-35],[317.5,-37.5],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw);
% h3 = arrow([327.5,-35],[327.5,-37.5],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw);
% %% 
% 
% %% bottom of AB
% arrow([307.5,-51],[307.5,-53.5],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
% arrow([317.5,-51],[317.5,-53.5],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
% arrow([327.5,-51],[327.5,-53.5],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
% %% 
% 
% %% west of AB
% arrow([299,-40],[301.5,-40],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
% arrow([299,-44],[301.5,-44],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
% arrow([299,-48],[301.5,-48],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
% %% 
% 
% %% east of AB
% arrow([334,-40],[336.5,-40],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
% arrow([334,-44],[336.5,-44],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
% arrow([334,-48],[336.5,-48],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
% %% 
% 
% %% east of east of AB
% arrow([344,-40],[346.5,-40],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
% arrow([344,-44],[346.5,-44],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
% arrow([344,-48],[346.5,-48],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
% %% 
% 
% %% top of east of AB
% arrow([337.33,-35],[337.33,-37.5],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
% arrow([339.67,-35],[339.67,-37.5],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
% arrow([342,-35],[342,-37.5],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
% %% 
% 
% %% bottom of east of AB
% arrow([337.33,-51],[337.33,-53.5],20,'BaseAngle',90,'Color',Color(c3,:),'LineWidth',qw)
% arrow([339.67,-51],[339.67,-53.5],20,'BaseAngle',90,'Color',Color(c6,:),'LineWidth',qw)
% arrow([342,-51],[342,-53.5],20,'BaseAngle',90,'Color',Color(c12,:),'LineWidth',qw)
% %% 
% 
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% title('MITgcm heat budgets','FontWeight','Normal','FontSize',16)
% legend([h1(1),h2(1),h3(1)],'1/3','1/6','1/12','Location','northwest')
% acc_movie_gray
% acc_plots
% hold off
% set(gcf,'InvertHardCopy','off'); 
% print('-r300','MITgcm_heat_budget_1','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
contourf(XC12,YC12,THETA_122_JD_avg,100,'LineStyle','none');
hold on
cbar = colorbar('eastoutside');
contour(XCm,YCm,mask(:,:,1),'Color','k')


line([290 290],[-58.96 -31.72],'Color','k','LineWidth',lw+2)
line([290 350],[-58.96 -58.96],'Color','k','LineWidth',lw+2)
line([290 350],[-31.72 -31.72],'Color','k','LineWidth',lw+2)

line([300 300],[-52 -36.15],'Color','k','LineWidth',lw+2)
line([335 335],[-52 -36.15],'Color','k','LineWidth',lw+2)
line([300 345],[-52 -52],'Color','k','LineWidth',lw+2)
line([300 345],[-36.15 -36.15],'Color','k','LineWidth',lw+2)
line([345 345],[-52 -36.15],'Color','k','LineWidth',lw+2)

line([290 290],[-58.96 -31.72],'Color',Color(c1,:),'LineWidth',lw)
line([290 350],[-58.96 -58.96],'Color',Color(c1,:),'LineWidth',lw)
line([290 350],[-31.72 -31.72],'Color',Color(c1,:),'LineWidth',lw)

line([300 300],[-52 -36.15],'Color',Color(c1,:),'LineWidth',lw)
line([335 335],[-52 -36.15],'Color',Color(c1,:),'LineWidth',lw)
line([300 345],[-52 -52],'Color',Color(c1,:),'LineWidth',lw)
line([300 345],[-36.15 -36.15],'Color',Color(c1,:),'LineWidth',lw)
line([345 345],[-52 -36.15],'Color',Color(c1,:),'LineWidth',lw)


%% top of AB
arrow([317.5,-34.9],[317.5,-37.6],24,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([317.5,-35],[317.5,-37.5],20,'BaseAngle',90,'Color',Color(cs,:),'LineWidth',qw)
%% 

%% bottom of AB
arrow([317.5,-50.9],[317.5,-53.6],24,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([317.5,-51],[317.5,-53.5],20,'BaseAngle',90,'Color',Color(cs,:),'LineWidth',qw)
%% 

%% west of AB
arrow([298.9,-44],[301.6,-44],24,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([299,-44],[301.5,-44],20,'BaseAngle',90,'Color',Color(cs,:),'LineWidth',qw)
%% 

%% east of AB
arrow([333.9,-44],[336.6,-44],24,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([334,-44],[336.5,-44],20,'BaseAngle',90,'Color',Color(cs,:),'LineWidth',qw)
%% 

%% east of east of AB
arrow([343.9,-44],[346.6,-44],24,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([344,-44],[346.5,-44],20,'BaseAngle',90,'Color',Color(cs,:),'LineWidth',qw)
%% 

%% top of east of AB
arrow([339.67,-34.9],[339.67,-37.6],24,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([339.67,-35],[339.67,-37.5],20,'BaseAngle',90,'Color',Color(cs,:),'LineWidth',qw)
%% 

%% bottom of east of AB
arrow([339.67,-50.9],[339.67,-53.6],24,'BaseAngle',90,'Color','k','LineWidth',qw+2)
arrow([339.67,-51],[339.67,-53.5],20,'BaseAngle',90,'Color',Color(cs,:),'LineWidth',qw)
%% 

axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('MITgcm heat budgets','FontWeight','Normal','FontSize',16)
acc_movie_gray
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r300','MITgcm_heat_budget_2','-dpng')









toc()