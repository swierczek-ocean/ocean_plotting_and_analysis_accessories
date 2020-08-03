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

ylimlo = [-500,-1000,-2000];


%%
load month_3 RC3
load ODAmonthly RCt
load ECCOvert ecdepth
load SODAvert sodadepc
load WOAvert wdepth
load rgt depthrg
load BSOSE_TSC_local bssas bsths
load DIC_vert
load BSOSE_TSC_local bsdicv
load glodapdic
depthrg = -depthrg;
wdepth = -wdepth;
sodadepc = -sodadepc;
load theta_season_anom *s


for jj=2:2
    figure()
    set(gcf, 'Position', [1, 1, 1350, 1050])
    subplot(2,2,1)
    h4 = plot(mean(rgts,2),depthrg,'--','LineWidth',lw,'Color','r');
    hold on
    h5 = plot(mean(woth12s,2),wdepth,'--','LineWidth',lw,'Color','k');
    h6 = plot(mean(odats,2),RCt,'-.','LineWidth',lw,'Color','k');
    h7 = plot(mean(eccoth12s,2),ecdepth,'--o','LineWidth',lw,'Color','k');
    h8 = plot(mean(sodath12s,2),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    h9 = plot(mean(bsths,2),RC3,'LineWidth',lw,'Color','k');
    h1 = plot(mean(theta3s,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
    h2 = plot(mean(theta6s,2),RC3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(mean(theta12s,2),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('Temperature profile [deg C]','FontWeight','Normal','FontSize',20)
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    xlim([2 11.7])
    yticks([-1000,-800,-600,-400,-200,0])
    yticklabels(['1000','800','600','400','200','0'])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
        'FontSize',16,'Location','southeast')
    acc_movie_w
    acc_4plots_2v(1)
    hold off
    
    subplot(2,2,2)
    h2 = plot(mean(theta3s,2)-mean(theta12s,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h3 = plot(mean(theta6s,2)-mean(theta12s,2),RC3,'LineWidth',lw,'Color',Color(c6,:));
    yline(0)
    grid on
    title('Temp anomaly from 1/12^\circ [deg C]','FontWeight','Normal','FontSize',20)
    ylim([ylimlo(jj) 3])
    % set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h2(1),h3(1)],...
        '1/3 - 1/12','1/6 - 1/12',...
        'FontSize',16,'Location','southwest')
    acc_movie_w
    acc_4plots_2v(2)
    hold off
    
    subplot(2,2,3)
    h1 = plot(glodapdic,-Depth,'--','LineWidth',lw,'Color','k');
    hold on
    h2 = plot(mean(bsdicv,2).*1000000/1035,RC3,'LineWidth',lw,'Color','k');
    h3 = plot(dic3v,RC3,'LineWidth',lw,'Color',Color(c3,:));
    h4 = plot(dic6v,RC3,'LineWidth',lw,'Color',Color(c6,:));
    h5 = plot(dic12v,RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    ylabel('depth [m]')
    title('DIC profile [\mumol C/kg]','FontWeight','Normal','FontSize',20)
    ylim([ylimlo(jj) 3])
    xlim([2055 2220])
    yticks([-1000,-800,-600,-400,-200,0])
    yticklabels(['1000','800','600','400','200','0'])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1)],'GLODAPv2','BSOSE',...
        '1/3','1/6','1/12','FontSize',16,'Location','southwest')
    acc_movie_w
    acc_4plots_2v(3)
    hold off
    
    subplot(2,2,4)
    h2 = plot(dic3v-dic12v,RC3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h3 = plot(dic6v-dic12v,RC3,'LineWidth',lw,'Color',Color(c6,:));
    yline(0)
    grid on
    title('DIC anomaly from 1/12^\circ [\mumol C/kg]','FontWeight','Normal','FontSize',20)
    ylim([ylimlo(jj) 3])
    % set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h2(1),h3(1)],...
        '1/3 - 1/12','1/6 - 1/12',...
        'FontSize',16,'Location','southwest')
    acc_movie_w
    acc_4plots_2v(4)
    hold off
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['paper/THETA_DIC_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end


