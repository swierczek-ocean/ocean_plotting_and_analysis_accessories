clear
close all
clc
tic()

load DIC_vert
load BSOSE_TSC_local bsdicv
load glodapdic
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
cg = 10;

ylimlo = [-500,-1000];

for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    h1 = plot(glodapdic,-Depth,'--','LineWidth',lw,'Color','k');
    hold on
    h2 = plot(mean(bsdicv,2).*1000000/1035,RC3,'LineWidth',lw,'Color','k');
    h3 = plot(dic3v,RC3,'LineWidth',lw,'Color',Color(c3,:));
    h4 = plot(dic6v,RC3,'LineWidth',lw,'Color',Color(c6,:));
    h5 = plot(dic12v,RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('2017 DIC profile vs. GLODAPv2 climatology [\mumol C/kg]','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1)],'GLODAPv2','BSOSE',...
        '1/3','1/6','1/12','FontSize',20,'Location','southwest')
    acc_movie_w
    acc_plots
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r200',['dic/DIC_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end









toc()