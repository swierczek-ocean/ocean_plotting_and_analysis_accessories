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

%%
load eddy_TSCO3_a
load eddy_TSCO6_a
load eddy_TSCO12_at
load eddy_TSCO12_as
load eddy_TSCO12_adic
load eddy_TSCO12_ado

RF3 = RF3(1:52);
RF12 = RF12(1:104);
cmd = 100;
%%


for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    subplot(1,4,1)
    h1 = plot(cmd.*vttheta3(:,1),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*vttheta6(:,1),RF3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*vttheta12(:,1),RF3,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*vmtheta3(:,1),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*vmtheta6(:,1),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*vmtheta12(:,1),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*vetheta3(:,1),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*vetheta6(:,1),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*vetheta12(:,1),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('JFM','FontWeight','Normal','FontSize',24)
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*T>','1/6 <w*T>','1/12 <w*T>',...
        '1/3 <w><T>','1/6 <w><T>','1/12 <w><T>',...
        '1/3 <w''T''>','1/6 <w''T''>','1/12 <w''T''>',...
        'FontSize',10,'Location','southwest')
    acc_movie_w
    acc_4vplots(1)
    hold off
    
    subplot(1,4,2)
    plot(cmd.*vttheta3(:,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vttheta6(:,2),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vttheta12(:,2),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmtheta3(:,2),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmtheta6(:,2),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmtheta12(:,2),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vetheta3(:,2),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vetheta6(:,2),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vetheta12(:,2),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('AMJ','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(2)
    hold off
    
    subplot(1,4,3)
    plot(cmd.*vttheta3(:,3),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vttheta6(:,3),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vttheta12(:,3),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmtheta3(:,3),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmtheta6(:,3),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmtheta12(:,3),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vetheta3(:,3),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vetheta6(:,3),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vetheta12(:,3),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('JAS','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(3)
    hold off
    
    subplot(1,4,4)
    plot(cmd.*vttheta3(:,4),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vttheta6(:,4),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vttheta12(:,4),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmtheta3(:,4),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmtheta6(:,4),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmtheta12(:,4),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vetheta3(:,4),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vetheta6(:,4),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vetheta12(:,4),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('OND','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(4)
    hold off
    
    sgtitle('mean 3 month vertical heat transport [deg C cm/day]','FontSize',18)
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['paper/ANOM_WT_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end


for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    subplot(1,4,1)
    h1 = plot(cmd.*vtdic3(:,1),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*vtdic6(:,1),RF3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*vtdic12(:,1),RF3,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*vmdic3(:,1),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*vmdic6(:,1),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*vmdic12(:,1),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*vedic3(:,1),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*vedic6(:,1),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*vedic12(:,1),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('JFM','FontWeight','Normal','FontSize',24)
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*dic>','1/6 <w*dic>','1/12 <w*dic>',...
        '1/3 <w><dic>','1/6 <w><dic>','1/12 <w><dic>',...
        '1/3 <w''dic''>','1/6 <w''dic''>','1/12 <w''dic''>',...
        'FontSize',12,'Location','southwest')
    acc_movie_w
    acc_4vplots(1)
    hold off
    
    subplot(1,4,2)
    plot(cmd.*vtdic3(:,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtdic6(:,2),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtdic12(:,2),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmdic3(:,2),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmdic6(:,2),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmdic12(:,2),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vedic3(:,2),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vedic6(:,2),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vedic12(:,2),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('AMJ','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(2)
    hold off
    
    subplot(1,4,3)
    plot(cmd.*vtdic3(:,3),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtdic6(:,3),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtdic12(:,3),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmdic3(:,3),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmdic6(:,3),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmdic12(:,3),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vedic3(:,3),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vedic6(:,3),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vedic12(:,3),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('JAS','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(3)
    hold off
    
    subplot(1,4,4)
    plot(cmd.*vtdic3(:,4),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtdic6(:,4),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtdic12(:,4),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmdic3(:,4),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmdic6(:,4),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmdic12(:,4),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vedic3(:,4),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vedic6(:,4),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vedic12(:,4),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('OND','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(4)
    hold off
    
    sgtitle('mean 3 month vertical DIC transport [mol C cm/day]','FontSize',18)
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['paper/ANOM_WDIC_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end




for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    subplot(1,4,1)
    h1 = plot(cmd.*vtsalt3(:,1),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*vtsalt6(:,1),RF3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*vtsalt12(:,1),RF3,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*vmsalt3(:,1),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*vmsalt6(:,1),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*vmsalt12(:,1),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*vesalt3(:,1),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*vesalt6(:,1),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*vesalt12(:,1),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('JFM','FontWeight','Normal','FontSize',24)
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*S>','1/6 <w*S>','1/12 <w*S>',...
        '1/3 <w><S>','1/6 <w><S>','1/12 <w><S>',...
        '1/3 <w''S''>','1/6 <w''S''>','1/12 <w''S''>',...
        'FontSize',10,'Location','southwest')
    acc_movie_w
    acc_4vplots(1)
    hold off
    
    subplot(1,4,2)
    plot(cmd.*vtsalt3(:,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtsalt6(:,2),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtsalt12(:,2),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmsalt3(:,2),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmsalt6(:,2),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmsalt12(:,2),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vesalt3(:,2),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vesalt6(:,2),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vesalt12(:,2),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('AMJ','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(2)
    hold off
    
    subplot(1,4,3)
    plot(cmd.*vtsalt3(:,3),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtsalt6(:,3),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtsalt12(:,3),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmsalt3(:,3),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmsalt6(:,3),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmsalt12(:,3),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vesalt3(:,3),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vesalt6(:,3),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vesalt12(:,3),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('JAS','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(3)
    hold off
    
    subplot(1,4,4)
    plot(cmd.*vtsalt3(:,4),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtsalt6(:,4),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtsalt12(:,4),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmsalt3(:,4),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmsalt6(:,4),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmsalt12(:,4),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vesalt3(:,4),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vesalt6(:,4),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vesalt12(:,4),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('OND','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(4)
    hold off
    
    sgtitle('mean 3 month vertical salt transport [psu cm/day]','FontSize',18)
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['paper/ANOM_WS_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end


for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    subplot(1,4,1)
    h1 = plot(cmd.*vtdo3(:,1),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*vtdo6(:,1),RF3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*vtdo12(:,1),RF3,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*vmdo3(:,1),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*vmdo6(:,1),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*vmdo12(:,1),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*vedo3(:,1),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*vedo6(:,1),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*vedo12(:,1),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('JFM','FontWeight','Normal','FontSize',24)
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*do>','1/6 <w*do>','1/12 <w*do>',...
        '1/3 <w><do>','1/6 <w><do>','1/12 <w><do>',...
        '1/3 <w''do''>','1/6 <w''do''>','1/12 <w''do''>',...
        'FontSize',12,'Location','southwest')
    acc_movie_w
    acc_4vplots(1)
    hold off
    
    subplot(1,4,2)
    plot(cmd.*vtdo3(:,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtdo6(:,2),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtdo12(:,2),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmdo3(:,2),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmdo6(:,2),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmdo12(:,2),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vedo3(:,2),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vedo6(:,2),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vedo12(:,2),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('AMJ','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(2)
    hold off
    
    subplot(1,4,3)
    plot(cmd.*vtdo3(:,3),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtdo6(:,3),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtdo12(:,3),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmdo3(:,3),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmdo6(:,3),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmdo12(:,3),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vedo3(:,3),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vedo6(:,3),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vedo12(:,3),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('JAS','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(3)
    hold off
    
    subplot(1,4,4)
    plot(cmd.*vtdo3(:,4),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    plot(cmd.*vtdo6(:,4),RF3,'LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vtdo12(:,4),RF3,'LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vmdo3(:,4),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vmdo6(:,4),RF3,'--','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vmdo12(:,4),RF3,'--','LineWidth',lw,'Color',Color(c12,:));
    plot(cmd.*vedo3(:,4),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    plot(cmd.*vedo6(:,4),RF3,':','LineWidth',lw,'Color',Color(c6,:));
    plot(cmd.*vedo12(:,4),RF3,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('OND','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    acc_movie_w
    acc_4vplots(4)
    hold off
    
    sgtitle('mean 3 month vertical dissolved oxygen transport [mol O cm/day]','FontSize',18)
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['paper/ANOM_WDO_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end




toc()