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
load month_3 RC3
load ODAmonthly RCt
load ECCOvert ecdepth
load SODAvert sodadepc
load WOAvert wdepth
load rgt depthrg
load BSOSE_TSC_local bssas bsths
depthrg = -depthrg;
wdepth = -wdepth;
sodadepc = -sodadepc;
load salt_season_anom *s
text = ['JFM';'AMJ';'JAS';'OND'];
lbs = [34.41,34.35,34.3,34.3,34.3;34.45,34.35,34.3,34.3,34.3;...
    34.49,34.36,34.31,34.31,34.3;34.44,34.36,34.31,34.31,34.3];


for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    subplot(1,4,1)
    h4 = plot(rgss(:,1),depthrg,'LineWidth',lw,'Color','k');
    hold on
    h5 = plot(wosa12s(:,1),wdepth,'--','LineWidth',lw,'Color','k');
    h6 = plot(odass(:,1),RCt,'-.','LineWidth',lw,'Color','k');
    h7 = plot(eccosa12s(:,1),ecdepth,'--o','LineWidth',lw,'Color','k');
    h8 = plot(sodasa12s(:,1),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    h9 = plot(bssas(:,1),RC3,'LineWidth',lw,'Color','r');
    h1 = plot(salt3s(:,1),RC3,'LineWidth',lw,'Color',Color(c3,:));
    h2 = plot(salt6s(:,1),RC3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(salt12s(:,1),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('JFM','FontWeight','Normal','FontSize',24)
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    if jj<6
        xlim([lbs(1,jj) 34.82])
    else
        xlim([lbs(1,5) 34.88])
    end
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    if jj==1
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
            'FontSize',13,'Location','west')
    elseif jj==2
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
            'FontSize',13,'Location','southeast')
    elseif jj==3
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
            'FontSize',13,'Location','southeast')
    elseif jj==4
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
            'FontSize',13,'Location','east')
    elseif jj==5
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
            'FontSize',13,'Location','southwest')
    elseif jj==6
        legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
            '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
            'FontSize',13,'Location','southwest')
    end
    acc_movie_w
    acc_4vplots(1)
    hold off
    
    subplot(1,4,2)
    plot(rgss(:,2),depthrg,'LineWidth',lw,'Color','k');
    hold on
    plot(wosa12s(:,2),wdepth,'--','LineWidth',lw,'Color','k');
    plot(odass(:,2),RCt,'-.','LineWidth',lw,'Color','k');
    plot(eccosa12s(:,2),ecdepth,'--o','LineWidth',lw,'Color','k');
    plot(sodasa12s(:,2),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    plot(bssas(:,2),RC3,'LineWidth',lw,'Color','r');
    plot(salt3s(:,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
    plot(salt6s(:,2),RC3,'LineWidth',lw,'Color',Color(c6,:));
    plot(salt12s(:,2),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('AMJ','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    if jj<6
        xlim([lbs(2,jj) 34.82])
    else
        xlim([lbs(2,5) 34.88])
    end
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_4vplots(2)
    hold off
    
    subplot(1,4,3)
    plot(rgss(:,3),depthrg,'LineWidth',lw,'Color','k');
    hold on
    plot(wosa12s(:,3),wdepth,'--','LineWidth',lw,'Color','k');
    plot(odass(:,3),RCt,'-.','LineWidth',lw,'Color','k');
    plot(eccosa12s(:,3),ecdepth,'--o','LineWidth',lw,'Color','k');
    plot(sodasa12s(:,3),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    plot(bssas(:,3),RC3,'LineWidth',lw,'Color','r');
    plot(salt3s(:,3),RC3,'LineWidth',lw,'Color',Color(c3,:));
    plot(salt6s(:,3),RC3,'LineWidth',lw,'Color',Color(c6,:));
    plot(salt12s(:,3),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('JAS','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    if jj<6
        xlim([lbs(3,jj) 34.79])
    else
        xlim([lbs(3,5) 34.88])
    end
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_4vplots(3)
    hold off
    
    subplot(1,4,4)
    plot(rgss(:,4),depthrg,'LineWidth',lw,'Color','k');
    hold on
    plot(wosa12s(:,4),wdepth,'--','LineWidth',lw,'Color','k');
    plot(odass(:,4),RCt,'-.','LineWidth',lw,'Color','k');
    plot(eccosa12s(:,4),ecdepth,'--o','LineWidth',lw,'Color','k');
    plot(sodasa12s(:,4),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    plot(bssas(:,4),RC3,'LineWidth',lw,'Color','r');
    plot(salt3s(:,4),RC3,'LineWidth',lw,'Color',Color(c3,:));
    plot(salt6s(:,4),RC3,'LineWidth',lw,'Color',Color(c6,:));
    plot(salt12s(:,4),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('OND','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    if jj<6
        xlim([lbs(4,jj) 34.78])
    else
        xlim([lbs(4,5) 34.88])
    end
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_4vplots(4)
    hold off
    
    sgtitle('mean 3 month salinity [psu]','FontSize',18)
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['paper/SALT_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end



%%
load month_3 RC3
load ODAmonthly RCt
load ECCOvert ecdepth
load SODAvert sodadepc
load WOAvert wdepth
load rgt depthrg
depthrg = -depthrg;
wdepth = -wdepth;
sodadepc = -sodadepc;
load theta_season_anom *s
text = ['JFM';'AMJ';'JAS';'OND'];
lbs = [6,4,2,2,2,0;6,4,2,2,2,0;6.5,4.1,2.2,2.05,2.01,0;6.5,4.1,2.2,2.05,2.01,0];


for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    subplot(1,4,1)
    h4 = plot(rgts(:,1),depthrg,'LineWidth',lw,'Color','k');
    hold on
    h5 = plot(woth12s(:,1),wdepth,'--','LineWidth',lw,'Color','k');
    h6 = plot(odats(:,1),RCt,'-.','LineWidth',lw,'Color','k');
    h7 = plot(eccoth12s(:,1),ecdepth,'--o','LineWidth',lw,'Color','k');
    h8 = plot(sodath12s(:,1),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    h9 = plot(bsths(:,1),RC3,'LineWidth',lw,'Color','r');
    h1 = plot(theta3s(:,1),RC3,'LineWidth',lw,'Color',Color(c3,:));
    h2 = plot(theta6s(:,1),RC3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(theta12s(:,1),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('JFM','FontWeight','Normal','FontSize',24)
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    xlim([lbs(1,jj) 13.9])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3','1/6','1/12','R&G Argo','WOA18','ECDA3.1','ECCO4v4','SODA3.4.2','BSOSE',...
        'FontSize',15,'Location','southeast')
    acc_movie_w
    acc_4vplots(1)
    hold off
    
    subplot(1,4,2)
    plot(rgts(:,2),depthrg,'LineWidth',lw,'Color','k');
    hold on
    plot(woth12s(:,2),wdepth,'--','LineWidth',lw,'Color','k');
    plot(odats(:,2),RCt,'-.','LineWidth',lw,'Color','k');
    plot(eccoth12s(:,2),ecdepth,'--o','LineWidth',lw,'Color','k');
    plot(sodath12s(:,2),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    plot(bsths(:,2),RC3,'LineWidth',lw,'Color','r');
    plot(theta3s(:,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
    plot(theta6s(:,2),RC3,'LineWidth',lw,'Color',Color(c6,:));
    plot(theta12s(:,2),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('AMJ','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    xlim([lbs(2,jj) 12])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_4vplots(2)
    hold off
    
    subplot(1,4,3)
    plot(rgts(:,3),depthrg,'LineWidth',lw,'Color','k');
    hold on
    plot(woth12s(:,3),wdepth,'--','LineWidth',lw,'Color','k');
    plot(odats(:,3),RCt,'-.','LineWidth',lw,'Color','k');
    plot(eccoth12s(:,3),ecdepth,'--o','LineWidth',lw,'Color','k');
    plot(sodath12s(:,3),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    plot(bsths(:,3),RC3,'LineWidth',lw,'Color','r');
    plot(theta3s(:,3),RC3,'LineWidth',lw,'Color',Color(c3,:));
    plot(theta6s(:,3),RC3,'LineWidth',lw,'Color',Color(c6,:));
    plot(theta12s(:,3),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('JAS','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    xlim([lbs(3,jj) 10])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_4vplots(3)
    hold off
    
    subplot(1,4,4)
    plot(rgts(:,4),depthrg,'LineWidth',lw,'Color','k');
    hold on
    plot(woth12s(:,4),wdepth,'--','LineWidth',lw,'Color','k');
    plot(odats(:,4),RCt,'-.','LineWidth',lw,'Color','k');
    plot(eccoth12s(:,4),ecdepth,'--o','LineWidth',lw,'Color','k');
    plot(sodath12s(:,4),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    plot(bsths(:,4),RC3,'LineWidth',lw,'Color','r');
    plot(theta3s(:,4),RC3,'LineWidth',lw,'Color',Color(c3,:));
    plot(theta6s(:,4),RC3,'LineWidth',lw,'Color',Color(c6,:));
    plot(theta12s(:,4),RC3,'LineWidth',lw,'Color',Color(c12,:));
    yline(0)
    grid on
    title('OND','FontWeight','Normal','FontSize',24)
    ylim([ylimlo(jj) 3])
    xlim([lbs(4,jj) 11.5])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    acc_movie_w
    acc_4vplots(4)
    hold off
    
    sgtitle('mean 3 month potential temperature [deg C]','FontSize',18)
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['paper/THETA_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end









toc()