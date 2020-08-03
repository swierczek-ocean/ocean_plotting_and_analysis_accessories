clear
close all
clc
tic()

%%
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
cg = 10;
ylimlo = [-250,-500,-1000,-1500,-2000,-5500];
cmd = 100;
kgcm = 12/1000;
%%
load eddy_TSCO3
load eddy_TSCO6
load eddy_TSCO12


for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1900, 900])
    subplot(1,2,1)
    plot(cmd.*vttheta3,RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vttheta6,RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vttheta12,RF12,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vctheta3,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vctheta6,RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vctheta12,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('vertical heat transports','FontWeight','Normal','FontSize',26)
    ylabel('depth [m]')
    xlabel('[W/m^2]')
    ylim([ylimlo(jj) 3])
    xlim([-40 50])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_2plots_j(1)
    hold off
    
    subplot(1,2,2)
    h1 = plot(kgcm*cmd.*vtdic3,RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(kgcm*cmd.*vtdic6,RF3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(kgcm*cmd.*vtdic12,RF12,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(kgcm*cmd.*vcdic3,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(kgcm*cmd.*vcdic6,RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(kgcm*cmd.*vcdic12,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('vertical carbon transports','FontWeight','Normal','FontSize',26)
    xlabel('[kg C/m^2/day]')
    ylim([ylimlo(jj) 3])
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1)],...
        '1/3 mean + eddy','1/6 mean + eddy','1/12 mean + eddy',...
        '1/3 no filter','1/6 no filter','1/12 no filter',...
        'FontSize',22,'Location','eastoutside')
    acc_movie_w
    acc_2plots_j(2)
    hold off

    set(gcf,'InvertHardCopy','off');
    print('-r200',['paper/err_vert_TC_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end












toc()









