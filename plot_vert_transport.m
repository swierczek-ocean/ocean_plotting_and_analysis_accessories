clear
close all
clc
tic()

%%
acc_colors
lw = 3.6;
c3 = 55;
c6 = 56;
c12 = 57;
cg = 10;
ylimlo = [-250,-500,-1000,-1500,-2000,-5500];
cmd = 100;
gcm = 12;
%%
load eddy_TSCO3
load eddy_TSCO6
load eddy_TSCO12

for jj=3:3
    figure()
    set(gcf, 'Position', [1, 1, 1900, 900])
    ax1 = subplot(1,2,1);
    xline(0,'LineWidth',1.6)
    hold on
    plot(cmd.*vttheta3,RF3,'LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vttheta6,RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vttheta12,RF12,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmtheta3,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmtheta6,RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmtheta12,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vetheta3,RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vetheta6,RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vetheta12,RF12,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    ax1.GridAlpha = 0.5;
    title('vertical heat transport','FontWeight','Normal','FontSize',26)
    ylabel('depth [m]')
    xlabel('[deg C cm/day]')
    ylim([ylimlo(jj) 3])
    xlim([-40 50])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_2plots_j(1)
    hold off
    
    ax2 = subplot(1,2,2);
    xline(0,'LineWidth',1.6)
    hold on
    h1 = plot(gcm*cmd.*vtdic3,RF3,'LineWidth',lw,'Color',Color(c3,:));
    h2 = plot(gcm*cmd.*vtdic6,RF3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(gcm*cmd.*vtdic12,RF12,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(gcm*cmd.*vmdic3,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(gcm*cmd.*vmdic6,RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(gcm*cmd.*vmdic12,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(gcm*cmd.*vedic3,RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(gcm*cmd.*vedic6,RF3,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(gcm*cmd.*vedic12,RF12,':','LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    ax2.GridAlpha = 0.5;
    title('vertical carbon transport','FontWeight','Normal','FontSize',26)
    xlabel('[kg C cm/day]')
    ylim([ylimlo(jj) 3])
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3  total','1/6  total','1/12 total',...
        '1/3  mean','1/6  mean','1/12 mean',...
        '1/3  eddy','1/6  eddy','1/12 eddy',...
        'FontSize',22,'Location','eastoutside')
    acc_movie_w
    acc_2plots_j(2)
    hold off

    set(gcf,'InvertHardCopy','off');
    print('-r300',['paper2/vert_TC_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end



%%
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
cg = 10;
ylimlo = [-250,-500,-1000,-1500,-2000,-5500];
cmd = 1;
gcm = 12/1000;
%%
load eddy_TSCO3
load eddy_TSCO6
load eddy_TSCO12
DRF = squeeze(rdmds('../Grids/3/DRF'));

for jj=3:3
    figure()
    set(gcf, 'Position', [1, 1, 1900, 900])
    subplot(1,2,1)
    plot(cmd.*vttheta3./DRF,RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vttheta6./DRF,RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vttheta12./DRF,RF12,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmtheta3./DRF,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmtheta6./DRF,RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmtheta12./DRF,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vetheta3./DRF,RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vetheta6./DRF,RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vetheta12./DRF,RF12,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('vertical heat transport','FontWeight','Normal','FontSize',26)
    ylabel('depth [m]')
    xlabel('[deg C/day]')
    ylim([ylimlo(jj) 3])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_2plots_j(1)
    hold off
    
    subplot(1,2,2)
    h1 = plot(gcm*cmd.*vtdic3./DRF,RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(gcm*cmd.*vtdic6./DRF,RF3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(gcm*cmd.*vtdic12./DRF,RF12,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(gcm*cmd.*vmdic3./DRF,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(gcm*cmd.*vmdic6./DRF,RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(gcm*cmd.*vmdic12./DRF,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(gcm*cmd.*vedic3./DRF,RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(gcm*cmd.*vedic6./DRF,RF3,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(gcm*cmd.*vedic12./DRF,RF12,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('vertical carbon transport','FontWeight','Normal','FontSize',26)
    xlabel('[kg C/day]')
    ylim([ylimlo(jj) 3])
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3  total','1/6  total','1/12 total',...
        '1/3  mean','1/6  mean','1/12 mean',...
        '1/3  eddy','1/6  eddy','1/12 eddy',...
        'FontSize',22,'Location','eastoutside')
    acc_movie_w
    acc_2plots_j(2)
    hold off

    set(gcf,'InvertHardCopy','off');
    print('-r300',['paper2/grif_vert_TC_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end








toc()