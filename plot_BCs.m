clear
close all
clc
tic()
 
acc_settings


%% boundary heat fluxes

lwc = 1.6;

cm = acc_colormap('cmo_balance');


nlvls = 100;


z = linspace(lb,ub,nlvls+1);
coords = [-58.9 -31.79 -5000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(YC3e,RC3e,THETA3E,'LineStyle','none','LevelList',z);
hold on
plot(YC3e,-Depth3(186,7:126),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 10W pot temp advective flux [deg C m^3/s]','FontWeight','Normal','FontSize',16)
text(-54,-4300,['mean annual flux: ',num2str(THETA3Eavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(YC6e,RC6e,THETA6E,'LineStyle','none','LevelList',z);
hold on
plot(YC6e,-Depth6(371,10:249),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(-54,-4300,['mean annual flux: ',num2str(THETA6Eavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(YC12e,RC12e,THETA12E,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(YC12e,-Depth12(737,18:496),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(-54,-4300,['mean annual flux: ',num2str(THETA12Eavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s3
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/THETAEB','-dpng')





toc()