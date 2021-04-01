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
c3s = 58;
c6s = 59;
c12s = 60;
cg = 10;

ylimlo = [-500,-1000,-2000];


%%
load month_3 RC3 theta312
load month_6 RC6 theta612
load month_12 RC12 theta1212
load ODAmonthly RCt odat
load ECCOvert ecdepth eccoth12
load SODAvert sodadepc sodath12
load WOAvert wdepth woth12
load rgt depthrg rgt
load BSOSE_TSC_local bssas bsths bsthv
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
    ax1 = subplot(2,2,1);
    h37 = plot(mean(rgts,2)+std(rgt,0,2),depthrg,'--','LineWidth',lw,'Color',Color(68,:));
    hold on
    h36 = plot(mean(woth12s,2)+std(woth12,0,2),wdepth,'--','LineWidth',lw,'Color',Color(17,:));
    h35 = plot(mean(odats,2)+std(odat,0,2),RCt,'-.','LineWidth',lw,'Color',Color(17,:));
    h34 = plot(mean(eccoth12s,2)+std(eccoth12,0,2),ecdepth,'--o','LineWidth',lw,'Color',Color(17,:));
    h33 = plot(mean(sodath12s,2)+std(sodath12,0,2),sodadepc,':','LineWidth',lw,'Color',Color(17,:));
    h32 = plot(mean(bsths,2)+std(bsthv,0,2),RC3,'LineWidth',lw,'Color',Color(17,:));
    h31 = plot(mean(theta3s,2)+std(theta312,0,2),RC3,'LineWidth',lw,'Color',Color(c3s,:));
    h30 = plot(mean(theta6s,2)+std(theta612,0,2),RC3,'LineWidth',lw,'Color',Color(c6s,:));
    h29 = plot(mean(theta12s,2)+std(theta1212,0,2),RC3,'LineWidth',lw,'Color',Color(c12s,:));
    h28 = plot(mean(rgts,2)-std(rgt,0,2),depthrg,'--','LineWidth',lw,'Color',Color(68,:));
    h27 = plot(mean(woth12s,2)-std(woth12,0,2),wdepth,'--','LineWidth',lw,'Color',Color(17,:));
    h26 = plot(mean(odats,2)-std(odat,0,2),RCt,'-.','LineWidth',lw,'Color',Color(17,:));
    h25 = plot(mean(eccoth12s,2)-std(eccoth12,0,2),ecdepth,'--o','LineWidth',lw,'Color',Color(17,:));
    h24 = plot(mean(sodath12s,2)-std(sodath12,0,2),sodadepc,':','LineWidth',lw,'Color',Color(17,:));
    h23 = plot(mean(bsths,2)-std(bsthv,0,2),RC3,'LineWidth',lw,'Color',Color(17,:));
    h22 = plot(mean(theta3s,2)-std(theta312,0,2),RC3,'LineWidth',lw,'Color',Color(c3s,:));
    h21 = plot(mean(theta6s,2)-std(theta612,0,2),RC3,'LineWidth',lw,'Color',Color(c6s,:));
    h20 = plot(mean(theta12s,2)-std(theta1212,0,2),RC3,'LineWidth',lw,'Color',Color(c12s,:));
    h20.Color(4) = 0.5;
    h21.Color(4) = 0.5;
    h22.Color(4) = 0.5;
    h23.Color(4) = 0.5;
    h24.Color(4) = 0.5;
    h25.Color(4) = 0.5;
    h26.Color(4) = 0.5;
    h27.Color(4) = 0.5;
    h28.Color(4) = 0.5;
    h29.Color(4) = 0.5;
    h30.Color(4) = 0.5;
    h31.Color(4) = 0.5;
    h32.Color(4) = 0.5;
    h33.Color(4) = 0.5;
    h34.Color(4) = 0.5;
    h35.Color(4) = 0.5;
    h36.Color(4) = 0.5;
    h4 = plot(mean(rgts,2),depthrg,'--','LineWidth',lw,'Color','r');
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
    ax1.GridAlpha = 0.5;
    title('Temperature profile [deg C]','FontWeight','Normal','FontSize',20)
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    xlim([2 11.7])
    yticks([-1000,-800,-600,-400,-200,0])
    yticklabels({'1000','800','600','400','200','0'})
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
        'FontSize',16,'Location','southeast')
    acc_movie_w
    acc_4plots_2v(1)
    hold off
    
    ax2 = subplot(2,2,2);
    h1 = plot(glodapdic,-Depth,'--','LineWidth',lw,'Color','k');
    hold on
    h2 = plot(mean(bsdicv,2).*1000000/1035,RC3,'LineWidth',lw,'Color','k');
    h3 = plot(dic3v,RC3,'LineWidth',lw,'Color',Color(c3,:));
    h4 = plot(dic6v,RC3,'LineWidth',lw,'Color',Color(c6,:));
    h5 = plot(dic12v,RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    ax2.GridAlpha = 0.5;
    title('DIC profile [\mumol C/kg]','FontWeight','Normal','FontSize',20)
    ylim([ylimlo(jj) 3])
    xlim([2055 2220])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1)],'GLODAPv2','BSOSE',...
        '1/3','1/6','1/12','FontSize',16,'Location','southwest')
    acc_movie_w
    acc_4plots_2v(2)
    hold off
    
    ax3 = subplot(2,2,3);
    h2 = plot(mean(theta3s,2)-mean(theta12s,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h3 = plot(mean(theta6s,2)-mean(theta12s,2),RC3,'LineWidth',lw,'Color',Color(c6,:));
    yline(0)
    grid on
    ax3.GridAlpha = 0.5;
    ylabel('depth [m]')
    title('Temp anomaly from 1/12^\circ [deg C]','FontWeight','Normal','FontSize',20)
    ylim([ylimlo(jj) 3])
    xlim([-0.3 0])
    yticks([-1000,-800,-600,-400,-200,0])
    yticklabels({'1000','800','600','400','200','0'})
    % set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h2(1),h3(1)],...
        '1/3 - 1/12','1/6 - 1/12',...
        'FontSize',16,'Location','southwest')
    acc_movie_w
    acc_4plots_2v(3)
    hold off
    
    ax4 = subplot(2,2,4);
    h2 = plot(dic3v-dic12v,RC3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h3 = plot(dic6v-dic12v,RC3,'LineWidth',lw,'Color',Color(c6,:));
    yline(0)
    grid on
    ax4.GridAlpha = 0.5;
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
    print('-r200',['paper/THETA_DIC_3_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end


