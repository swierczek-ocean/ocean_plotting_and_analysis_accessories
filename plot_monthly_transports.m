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

ylimlo = [-250,-500,-1000,-1500,-2000,-3000];
names = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';...
    'Oct';'Nov';'Dec';'JFM';'AMJ';'JAS';'OND'];
%%
load eddy3new
load eddy6new
load eddy12new
cmd = 100;
%%

%% plot


for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    h1 = plot(cmd.*mean(advrth3(:,1:12),2),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*mean(advrth6(:,1:12),2),RF6,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*mean(advrth12(:,1:12),2),RF12,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*mean(mwtheta3(:,1:12),2),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*mean(mwtheta6(:,1:12),2),RF6,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*mean(mwtheta12(:,1:12),2),RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*mean(eddyth3(:,1:12),2),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*mean(eddyth6(:,1:12),2),RF6,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*mean(eddyth12(:,1:12),2),RF12,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('mean 2017 vertical heat transport','FontWeight','Normal','FontSize',24)
    xlabel('[deg C cm/day]')
    ylabel('depth [m]')
    ylim([ylimlo(jj) 10])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
        '1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>',...
        '1/3 <w''theta''>','1/6 <w''theta''>','1/12 <w''theta''>',...
        'FontSize',18,'Location','eastoutside')
    acc_movie_w
    acc_plots
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['total_heat_transport/',num2str(abs(ylimlo(jj))),...
        '/heat_01_17_2017_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end

for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    h1 = plot(cmd.*mean(advrth3(:,1:12),2)./DRF3,RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*mean(advrth6(:,1:12),2)./DRF6,RF6,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*mean(advrth12(:,1:12),2)./DRF12,RF12,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*mean(mwtheta3(:,1:12),2)./DRF3,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*mean(mwtheta6(:,1:12),2)./DRF6,RF6,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*mean(mwtheta12(:,1:12),2)./DRF12,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*mean(eddyth23(:,1:12),2),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*mean(eddyth26(:,1:12),2),RF6,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*mean(eddyth212(:,1:12),2),RF12,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('mean 2017 vertical heat transport','FontWeight','Normal','FontSize',24)
    xlabel('[deg C/day]')
    ylabel('depth [m]')
    ylim([ylimlo(jj) 10])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
        '1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>',...
        '1/3 <w''theta''>','1/6 <w''theta''>','1/12 <w''theta''>',...
        'FontSize',18,'Location','eastoutside')
    acc_movie_w
    acc_plots
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['total_heat_transport/',num2str(abs(ylimlo(jj))),...
        '/heat_02_17_2017_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end




for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    h1 = plot(cmd.*mean(advrdic3(:,1:12),2),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*mean(advrdic6(:,1:12),2),RF6,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*mean(advrdic12(:,1:12),2),RF12,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*mean(mwdic3(:,1:12),2),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*mean(mwdic6(:,1:12),2),RF6,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*mean(mwdic12(:,1:12),2),RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*mean(eddydic3(:,1:12),2),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*mean(eddydic6(:,1:12),2),RF6,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*mean(eddydic12(:,1:12),2),RF12,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('mean 2017 vertical DIC transport','FontWeight','Normal','FontSize',24)
    xlabel('[mol C cm/day]')
    ylabel('depth [m]')
    ylim([ylimlo(jj) 10])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*dic>','1/6 <w*dic>','1/12 <w*dic>',...
        '1/3 <w><dic>','1/6 <w><dic>','1/12 <w><dic>',...
        '1/3 <w''dic''>','1/6 <w''dic''>','1/12 <w''dic''>',...
        'FontSize',18,'Location','eastoutside')
    acc_movie_w
    acc_plots
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['total_dic_transport/',num2str(abs(ylimlo(jj))),...
        '/DIC_01_17_2017_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end



for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    h1 = plot(cmd.*mean(advrdic3(:,1:12),2)./DRF3,RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*mean(advrdic6(:,1:12),2)./DRF6,RF6,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*mean(advrdic12(:,1:12),2)./DRF12,RF12,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*mean(mwdic3(:,1:12),2)./DRF3,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*mean(mwdic6(:,1:12),2)./DRF6,RF6,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*mean(mwdic12(:,1:12),2)./DRF12,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*mean(eddydic23(:,1:12),2),RF3,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*mean(eddydic26(:,1:12),2),RF6,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*mean(eddydic212(:,1:12),2),RF12,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('mean 2017 vertical DIC transport','FontWeight','Normal','FontSize',24)
    xlabel('[mol C/day]')
    ylabel('depth [m]')
    ylim([ylimlo(jj) 10])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*dic>','1/6 <w*dic>','1/12 <w*dic>',...
        '1/3 <w><dic>','1/6 <w><dic>','1/12 <w><dic>',...
        '1/3 <w''dic''>','1/6 <w''dic''>','1/12 <w''dic''>',...
        'FontSize',18,'Location','eastoutside')
    acc_movie_w
    acc_plots
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['total_dic_transport/',num2str(abs(ylimlo(jj))),...
        '/DIC_02_17_2017_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end





for ii=1:16
    for jj=1:6
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        h1 = plot(cmd.*advrth3(:,ii),RF3,'LineWidth',lw,'Color',Color(c3,:));
        hold on
        h2 = plot(cmd.*advrth6(:,ii),RF6,'LineWidth',lw,'Color',Color(c6,:));
        h3 = plot(cmd.*advrth12(:,ii),RF12,'LineWidth',lw,'Color',Color(c12,:));
        h4 = plot(cmd.*mwtheta3(:,ii),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
        h5 = plot(cmd.*mwtheta6(:,ii),RF6,'--','LineWidth',lw,'Color',Color(c6,:));
        h6 = plot(cmd.*mwtheta12(:,ii),RF12,'--','LineWidth',lw,'Color',Color(c12,:));
        h7 = plot(cmd.*eddyth3(:,ii),RF3,':','LineWidth',lw,'Color',Color(c3,:));
        h8 = plot(cmd.*eddyth6(:,ii),RF6,':','LineWidth',lw,'Color',Color(c6,:));
        h9 = plot(cmd.*eddyth12(:,ii),RF12,':','LineWidth',lw,'Color',Color(c12,:));
        xline(0)
        yline(0)
        grid on
        title([names(ii,:),' 2017 vertical heat transport'],'FontWeight','Normal','FontSize',24)
        xlabel('[deg C cm/day]')
        ylabel('depth [m]')
        ylim([ylimlo(jj) 10])
        set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
            '1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>',...
            '1/3 <w''theta''>','1/6 <w''theta''>','1/12 <w''theta''>',...
            'FontSize',18,'Location','eastoutside')
        acc_movie_w
        acc_plots
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r200',['total_heat_transport/',num2str(abs(ylimlo(jj))),...
            '/heat_01_',num2str(ii,'%02.f'),'_',names(ii,:),'_',num2str(abs(ylimlo(jj)))],'-dpng')
        close all
    end
end

for ii=1:16
    for jj=1:6
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        h1 = plot(cmd.*advrth3(:,ii)./DRF3,RF3,'LineWidth',lw,'Color',Color(c3,:));
        hold on
        h2 = plot(cmd.*advrth6(:,ii)./DRF6,RF6,'LineWidth',lw,'Color',Color(c6,:));
        h3 = plot(cmd.*advrth12(:,ii)./DRF12,RF12,'LineWidth',lw,'Color',Color(c12,:));
        h4 = plot(cmd.*mwtheta3(:,ii)./DRF3,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
        h5 = plot(cmd.*mwtheta6(:,ii)./DRF6,RF6,'--','LineWidth',lw,'Color',Color(c6,:));
        h6 = plot(cmd.*mwtheta12(:,ii)./DRF12,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
        h7 = plot(cmd.*eddyth23(:,ii),RF3,':','LineWidth',lw,'Color',Color(c3,:));
        h8 = plot(cmd.*eddyth26(:,ii),RF6,':','LineWidth',lw,'Color',Color(c6,:));
        h9 = plot(cmd.*eddyth212(:,ii),RF12,':','LineWidth',lw,'Color',Color(c12,:));
        xline(0)
        yline(0)
        grid on
        title([names(ii,:),' 2017 vertical heat transport'],'FontWeight','Normal','FontSize',24)
        xlabel('[deg C/day]')
        ylabel('depth [m]')
        ylim([ylimlo(jj) 10])
        set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
            '1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>',...
            '1/3 <w''theta''>','1/6 <w''theta''>','1/12 <w''theta''>',...
            'FontSize',18,'Location','eastoutside')
        acc_movie_w
        acc_plots
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r200',['total_heat_transport/',num2str(abs(ylimlo(jj))),...
            '/heat_02_',num2str(ii,'%02.f'),'_',names(ii,:),'_',num2str(abs(ylimlo(jj)))],'-dpng')
        close all
    end
end


for ii=1:16
    for jj=1:6
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        h1 = plot(cmd.*advrdic3(:,ii),RF3,'LineWidth',lw,'Color',Color(c3,:));
        hold on
        h2 = plot(cmd.*advrdic6(:,ii),RF6,'LineWidth',lw,'Color',Color(c6,:));
        h3 = plot(cmd.*advrdic12(:,ii),RF12,'LineWidth',lw,'Color',Color(c12,:));
        h4 = plot(cmd.*mwdic3(:,ii),RF3,'--','LineWidth',lw,'Color',Color(c3,:));
        h5 = plot(cmd.*mwdic6(:,ii),RF6,'--','LineWidth',lw,'Color',Color(c6,:));
        h6 = plot(cmd.*mwdic12(:,ii),RF12,'--','LineWidth',lw,'Color',Color(c12,:));
        h7 = plot(cmd.*eddydic3(:,ii),RF3,':','LineWidth',lw,'Color',Color(c3,:));
        h8 = plot(cmd.*eddydic6(:,ii),RF6,':','LineWidth',lw,'Color',Color(c6,:));
        h9 = plot(cmd.*eddydic12(:,ii),RF12,':','LineWidth',lw,'Color',Color(c12,:));
        xline(0)
        yline(0)
        grid on
        title([names(ii,:),' 2017 vertical DIC transport'],'FontWeight','Normal','FontSize',24)
        xlabel('[mol C cm/day]')
        ylabel('depth [m]')
        ylim([ylimlo(jj) 10])
        set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3 <w*dic>','1/6 <w*dic>','1/12 <w*dic>',...
            '1/3 <w><dic>','1/6 <w><dic>','1/12 <w><dic>',...
            '1/3 <w''dic''>','1/6 <w''dic''>','1/12 <w''dic''>',...
            'FontSize',18,'Location','eastoutside')
        acc_movie_w
        acc_plots
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r200',['total_dic_transport/',num2str(abs(ylimlo(jj))),...
            '/DIC_01_',num2str(ii,'%02.f'),'_',names(ii,:),'_',num2str(abs(ylimlo(jj)))],'-dpng')
        close all
    end
end

for ii=1:16
    for jj=1:6
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        h1 = plot(cmd.*advrdic3(:,ii)./DRF3,RF3,'LineWidth',lw,'Color',Color(c3,:));
        hold on
        h2 = plot(cmd.*advrdic6(:,ii)./DRF6,RF6,'LineWidth',lw,'Color',Color(c6,:));
        h3 = plot(cmd.*advrdic12(:,ii)./DRF12,RF12,'LineWidth',lw,'Color',Color(c12,:));
        h4 = plot(cmd.*mwdic3(:,ii)./DRF3,RF3,'--','LineWidth',lw,'Color',Color(c3,:));
        h5 = plot(cmd.*mwdic6(:,ii)./DRF6,RF6,'--','LineWidth',lw,'Color',Color(c6,:));
        h6 = plot(cmd.*mwdic12(:,ii)./DRF12,RF12,'--','LineWidth',lw,'Color',Color(c12,:));
        h7 = plot(cmd.*eddydic23(:,ii),RF3,':','LineWidth',lw,'Color',Color(c3,:));
        h8 = plot(cmd.*eddydic26(:,ii),RF6,':','LineWidth',lw,'Color',Color(c6,:));
        h9 = plot(cmd.*eddydic212(:,ii),RF12,':','LineWidth',lw,'Color',Color(c12,:));
        xline(0)
        yline(0)
        grid on
        title([names(ii,:),' 2017 vertical DIC transport'],'FontWeight','Normal','FontSize',24)
        xlabel('[mol C/day]')
        ylabel('depth [m]')
        ylim([ylimlo(jj) 10])
        set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3 <w*dic>','1/6 <w*dic>','1/12 <w*dic>',...
            '1/3 <w><dic>','1/6 <w><dic>','1/12 <w><dic>',...
            '1/3 <w''dic''>','1/6 <w''dic''>','1/12 <w''dic''>',...
            'FontSize',18,'Location','eastoutside')
        acc_movie_w
        acc_plots
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r200',['total_dic_transport/',num2str(abs(ylimlo(jj))),...
            '/DIC_02_',num2str(ii,'%02.f'),'_',names(ii,:),'_',num2str(abs(ylimlo(jj)))],'-dpng')
        close all
    end
end



toc()