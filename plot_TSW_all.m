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

ylimlo = [-250,-500,-1000,-1500];
dates = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];
%%

% %%
% load month_3 RC3 theta312
% load month_6 theta612
% load month_12 theta1212
% load ODAmonthly odat RCt
% load ECCOvert ecdepth eccoth12
% load SODAvert sodath12 sodadepc
% load WOAvert wdepth woth12
% load rgt rgt depthrg
% depthrg = -depthrg;
% wdepth = -wdepth;
% sodadepc = -sodadepc;
% load theta_season_anom
% text = ['JFM';'AMJ';'JAS';'OND'];
% %%
% 
% for jj=4:4
%     figure()
%     set(gcf, 'Position', [1, 1, 1600, 900])
%     subplot(1,2,1)
%     h1 = plot(mean(theta312,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
%     hold on
%     h2 = plot(mean(theta612,2),RC3,'LineWidth',lw,'Color',Color(c6,:));
%     h3 = plot(mean(theta1212,2),RC3,'LineWidth',lw,'Color',Color(c12,:));
%     h4 = plot(mean(rgt,2),depthrg,'LineWidth',lw,'Color','k');
%     h5 = plot(mean(woth12,2),wdepth,'--','LineWidth',lw,'Color','k');
%     h6 = plot(mean(odat,2),RCt,'-.','LineWidth',lw,'Color','k');
%     h7 = plot(mean(eccoth12,2),ecdepth,'--o','LineWidth',lw,'Color','k');
%     h8 = plot(mean(sodath12,2),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
%     yline(0)
%     grid on
%     title('mean 2017 temperature profile','FontWeight','Normal','FontSize',24)
%     xlabel('[deg C]')
%     ylabel('depth [m]')
%     ylim([ylimlo(jj) 3])
%     set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
%     legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
%         '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
%         'FontSize',20,'Location','southeast')
%     acc_movie_w
%     acc_2plots(1)
%     hold off
%     
%     subplot(1,2,2)
%     h1 = plot(mean(int3t,2),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
%     hold on
%     h2 = plot(mean(int6t,2),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
%     h3 = plot(mean(int12t,2),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
%     h4 = plot(mean(intrgt,2),anom_depth,'LineWidth',lw,'Color','k');
%     h5 = plot(mean(intwoat,2),anom_depth,'--','LineWidth',lw,'Color','k');
%     h6 = plot(mean(intodat,2),anom_depth,'-.','LineWidth',lw,'Color','k');
%     h7 = plot(mean(inteccot,2),anom_depth,'--o','LineWidth',lw,'Color','k');
%     h8 = plot(mean(intsodat,2),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
%     xline(0)
%     yline(0)
%     grid on
%     title('mean 2017 temperature anomaly from R&G','FontWeight','Normal','FontSize',24)
%     xlabel('[deg C]')
%     ylim([ylimlo(jj) 3])
%     legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
%         '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
%         'FontSize',20,'Location','southwest')
%     acc_movie_w
%     acc_2plots(2)
%     hold off
%     
%     set(gcf,'InvertHardCopy','off');
%     print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/THETA_MEAN_',num2str(abs(ylimlo(jj)))],'-dpng')
%     close all
%     for ii=1:16
%         if ii<13
%             figure()
%             set(gcf, 'Position', [1, 1, 1600, 900])
%             subplot(1,2,1)
%             h1 = plot(theta312(:,ii),RC3,'LineWidth',lw,'Color',Color(c3,:));
%             hold on
%             h2 = plot(theta612(:,ii),RC3,'LineWidth',lw,'Color',Color(c6,:));
%             h3 = plot(theta1212(:,ii),RC3,'LineWidth',lw,'Color',Color(c12,:));
%             h4 = plot(rgt(:,ii),depthrg,'LineWidth',lw,'Color','k');
%             h5 = plot(woth12(:,ii),wdepth,'--','LineWidth',lw,'Color','k');
%             h6 = plot(odat(:,ii),RCt,'-.','LineWidth',lw,'Color','k');
%             h7 = plot(eccoth12(:,ii),ecdepth,'--o','LineWidth',lw,'Color','k');
%             h8 = plot(sodath12(:,ii),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
%             yline(0)
%             grid on
%             title([datestr(dates(ii),'mmm yyyy'),' temperature profile'],'FontWeight','Normal','FontSize',24)
%             xlabel('[deg C]')
%             ylabel('depth [m]')
%             ylim([ylimlo(jj) 3])
%             set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
%             legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
%                 '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
%                 'FontSize',20,'Location','southeast')
%             acc_movie_w
%             acc_2plots(1)
%             hold off
%             
%             subplot(1,2,2)
%             h1 = plot(int3t(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
%             hold on
%             h2 = plot(int6t(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
%             h3 = plot(int12t(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
%             h4 = plot(intrgt(:,ii),anom_depth,'LineWidth',lw,'Color','k');
%             h5 = plot(intwoat(:,ii),anom_depth,'--','LineWidth',lw,'Color','k');
%             h6 = plot(intodat(:,ii),anom_depth,'-.','LineWidth',lw,'Color','k');
%             h7 = plot(inteccot(:,ii),anom_depth,'--o','LineWidth',lw,'Color','k');
%             h8 = plot(intsodat(:,ii),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
%             xline(0)
%             yline(0)
%             grid on
%             title([datestr(dates(ii),'mmm yyyy'),' temperature anomaly from R&G'],'FontWeight','Normal','FontSize',24)
%             xlabel('[deg C]')
%             ylim([ylimlo(jj) 3])
%             legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
%                 '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
%                 'FontSize',20,'Location','southwest')
%             acc_movie_w
%             acc_2plots(2)
%             hold off
%             
%             set(gcf,'InvertHardCopy','off');
%             print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/THETA_',num2str(ii,'%02.f'),'_',datestr(dates(ii),'mmm'),'_',num2str(abs(ylimlo(jj)))],'-dpng')
%             close all
%         else
%             figure()
%             set(gcf, 'Position', [1, 1, 1600, 900])
%             subplot(1,2,1)
%             h1 = plot(theta3s(:,ii-12),RC3,'LineWidth',lw,'Color',Color(c3,:));
%             hold on
%             h2 = plot(theta6s(:,ii-12),RC3,'LineWidth',lw,'Color',Color(c6,:));
%             h3 = plot(theta12s(:,ii-12),RC3,'LineWidth',lw,'Color',Color(c12,:));
%             h4 = plot(rgts(:,ii-12),depthrg,'LineWidth',lw,'Color','k');
%             h5 = plot(woth12s(:,ii-12),wdepth,'--','LineWidth',lw,'Color','k');
%             h6 = plot(odats(:,ii-12),RCt,'-.','LineWidth',lw,'Color','k');
%             h7 = plot(eccoth12s(:,ii-12),ecdepth,'--o','LineWidth',lw,'Color','k');
%             h8 = plot(sodath12s(:,ii-12),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
%             yline(0)
%             grid on
%             title([text(ii-12,:),' ',datestr(dates(ii-12),'yyyy'),' temperature profile'],'FontWeight','Normal','FontSize',24)
%             xlabel('[deg C]')
%             ylabel('depth [m]')
%             ylim([ylimlo(jj) 3])
%             set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
%             legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
%                 '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
%                 'FontSize',20,'Location','southeast')
%             acc_movie_w
%             acc_2plots(1)
%             hold off
%             
%             subplot(1,2,2)
%             h1 = plot(int3ts(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
%             hold on
%             h2 = plot(int6ts(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
%             h3 = plot(int12ts(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
%             h4 = plot(intrgts(:,ii-12),anom_depth,'LineWidth',lw,'Color','k');
%             h5 = plot(intwoats(:,ii-12),anom_depth,'--','LineWidth',lw,'Color','k');
%             h6 = plot(intodats(:,ii-12),anom_depth,'-.','LineWidth',lw,'Color','k');
%             h7 = plot(inteccots(:,ii-12),anom_depth,'--o','LineWidth',lw,'Color','k');
%             h8 = plot(intsodats(:,ii-12),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
%             xline(0)
%             yline(0)
%             grid on
%             title([text(ii-12,:),' ',datestr(dates(ii-12),'yyyy'),' temperature anomaly from R&G'],'FontWeight','Normal','FontSize',24)
%             xlabel('[deg C]')
%             ylim([ylimlo(jj) 3])
%             legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
%                 '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
%                 'FontSize',20,'Location','southwest')
%             acc_movie_w
%             acc_2plots(2)
%             hold off
%             
%             set(gcf,'InvertHardCopy','off');
%             print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/THETA_',num2str(ii,'%02.f'),'_',text(ii-12,:),'_',num2str(abs(ylimlo(jj)))],'-dpng')
%             close all
%         end
%     end
% end
% 
% clear

%%
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
cg = 10;

ylimlo = [-250,-500,-1000,-1500];
dates = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];
%%

%%
load month_3 RC3 salt312
load month_6 salt612
load month_12 salt1212
load ODAmonthly odas RCt
load ECCOvert ecdepth eccosa12
load SODAvert sodasa12 sodadepc
load WOAvert wdepth wosa12
load rgs rgs depthrg
depthrg = -depthrg;
wdepth = -wdepth;
sodadepc = -sodadepc;
load salt_season_anom
text = ['JFM';'AMJ';'JAS';'OND'];
%%

for jj=4:4
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    subplot(1,2,1)
    h1 = plot(mean(salt312,2),RC3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(mean(salt612,2),RC3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(mean(salt1212,2),RC3,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(mean(rgs,2),depthrg,'LineWidth',lw,'Color','k');
    h5 = plot(mean(wosa12,2),wdepth,'--','LineWidth',lw,'Color','k');
    h6 = plot(mean(odas,2),RCt,'-.','LineWidth',lw,'Color','k');
    h7 = plot(mean(eccosa12,2),ecdepth,'--o','LineWidth',lw,'Color','k');
    h8 = plot(mean(sodasa12,2),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
    yline(0)
    grid on
    title('mean 2017 salinity profile','FontWeight','Normal','FontSize',24)
    xlabel('[psu]')
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
        '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
        'FontSize',20,'Location','east')
    acc_movie_w
    acc_2plots(1)
    hold off
    
    subplot(1,2,2)
    h1 = plot(mean(int3s,2),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(mean(int6s,2),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(mean(int12s,2),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(mean(intrgs,2),anom_depth,'LineWidth',lw,'Color','k');
    h5 = plot(mean(intwoas,2),anom_depth,'--','LineWidth',lw,'Color','k');
    h6 = plot(mean(intodas,2),anom_depth,'-.','LineWidth',lw,'Color','k');
    h7 = plot(mean(inteccos,2),anom_depth,'--o','LineWidth',lw,'Color','k');
    h8 = plot(mean(intsodas,2),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
    xline(0)
    yline(0)
    grid on
    title('mean 2017 salinity anomaly from R&G','FontWeight','Normal','FontSize',24)
    xlabel('[psu]')
    ylim([ylimlo(jj) 3])
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
        '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
        'FontSize',20,'Location','southwest')
    acc_movie_w
    acc_2plots(2)
    hold off
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/SALT_MEAN_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
    for ii=1:16
        if ii<13
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            subplot(1,2,1)
            h1 = plot(salt312(:,ii),RC3,'LineWidth',lw,'Color',Color(c3,:));
            hold on
            h2 = plot(salt612(:,ii),RC3,'LineWidth',lw,'Color',Color(c6,:));
            h3 = plot(salt1212(:,ii),RC3,'LineWidth',lw,'Color',Color(c12,:));
            h4 = plot(rgs(:,ii),depthrg,'LineWidth',lw,'Color','k');
            h5 = plot(wosa12(:,ii),wdepth,'--','LineWidth',lw,'Color','k');
            h6 = plot(odas(:,ii),RCt,'-.','LineWidth',lw,'Color','k');
            h7 = plot(eccosa12(:,ii),ecdepth,'--o','LineWidth',lw,'Color','k');
            h8 = plot(sodasa12(:,ii),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
            yline(0)
            grid on
            title([datestr(dates(ii),'mmm yyyy'),' salinity profile'],'FontWeight','Normal','FontSize',24)
            xlabel('[psu]')
            ylabel('depth [m]')
            ylim([ylimlo(jj) 3])
            set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
            legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
                '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
                'FontSize',20,'Location','west')
            acc_movie_w
            acc_2plots(1)
            hold off
            
            subplot(1,2,2)
            h1 = plot(int3s(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
            hold on
            h2 = plot(int6s(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
            h3 = plot(int12s(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
            h4 = plot(intrgs(:,ii),anom_depth,'LineWidth',lw,'Color','k');
            h5 = plot(intwoas(:,ii),anom_depth,'--','LineWidth',lw,'Color','k');
            h6 = plot(intodas(:,ii),anom_depth,'-.','LineWidth',lw,'Color','k');
            h7 = plot(inteccos(:,ii),anom_depth,'--o','LineWidth',lw,'Color','k');
            h8 = plot(intsodas(:,ii),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
            xline(0)
            yline(0)
            grid on
            title([datestr(dates(ii),'mmm yyyy'),' salinity anomaly from R&G'],'FontWeight','Normal','FontSize',24)
            xlabel('[psu]')
            ylim([ylimlo(jj) 3])
            legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
                '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
                'FontSize',20,'Location','southwest')
            acc_movie_w
            acc_2plots(2)
            hold off
            
            set(gcf,'InvertHardCopy','off');
            print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/SALT_',num2str(ii,'%02.f'),'_',datestr(dates(ii),'mmm'),'_',num2str(abs(ylimlo(jj)))],'-dpng')
            close all
        else
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            subplot(1,2,1)
            h1 = plot(salt3s(:,ii-12),RC3,'LineWidth',lw,'Color',Color(c3,:));
            hold on
            h2 = plot(salt6s(:,ii-12),RC3,'LineWidth',lw,'Color',Color(c6,:));
            h3 = plot(salt12s(:,ii-12),RC3,'LineWidth',lw,'Color',Color(c12,:));
            h4 = plot(rgss(:,ii-12),depthrg,'LineWidth',lw,'Color','k');
            h5 = plot(wosa12s(:,ii-12),wdepth,'--','LineWidth',lw,'Color','k');
            h6 = plot(odass(:,ii-12),RCt,'-.','LineWidth',lw,'Color','k');
            h7 = plot(eccosa12s(:,ii-12),ecdepth,'--o','LineWidth',lw,'Color','k');
            h8 = plot(sodasa12s(:,ii-12),sodadepc,':','LineWidth',lw,'Color',Color(cg,:));
            yline(0)
            grid on
            title([text(ii-12,:),' ',datestr(dates(ii-12),'yyyy'),' salinity profile'],'FontWeight','Normal','FontSize',24)
            xlabel('[psu]')
            ylabel('depth [m]')
            ylim([ylimlo(jj) 3])
            set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
            legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
                '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
                'FontSize',20,'Location','southeast')
            acc_movie_w
            acc_2plots(1)
            hold off
            
            subplot(1,2,2)
            h1 = plot(int3ss(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
            hold on
            h2 = plot(int6ss(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
            h3 = plot(int12ss(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
            h4 = plot(intrgss(:,ii-12),anom_depth,'LineWidth',lw,'Color','k');
            h5 = plot(intwoass(:,ii-12),anom_depth,'--','LineWidth',lw,'Color','k');
            h6 = plot(intodass(:,ii-12),anom_depth,'-.','LineWidth',lw,'Color','k');
            h7 = plot(inteccoss(:,ii-12),anom_depth,'--o','LineWidth',lw,'Color','k');
            h8 = plot(intsodass(:,ii-12),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
            xline(0)
            yline(0)
            grid on
            title([text(ii-12,:),' ',datestr(dates(ii-12),'yyyy'),' salinity anomaly from R&G'],'FontWeight','Normal','FontSize',24)
            xlabel('[psu]')
            ylim([ylimlo(jj) 3])
            legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1)],...
                '1/3','1/6','1/12','R&G Argo','WOA18','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
                'FontSize',20,'Location','southwest')
            acc_movie_w
            acc_2plots(2)
            hold off
            
            set(gcf,'InvertHardCopy','off');
            print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/SALT_',num2str(ii,'%02.f'),'_',text(ii-12,:),'_',num2str(abs(ylimlo(jj)))],'-dpng')
            close all
        end
    end
end

clear

%%
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
cg = 10;

ylimlo = [-250,-500,-1000,-1500];
dates = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];
%%

%%
load month_3 RF3 wvel312
load month_6 wvel612
load month_12 wvel1212
load ODAmonthly odaw RFt
load ECCOvert efdepth eccow12
load SODAvert sodaw12 sodadepf
sodadepf = -sodadepf;
load wvel_season_anom
text = ['JFM';'AMJ';'JAS';'OND'];
RF3 = RF3(1:52);
%%

for jj=1:4
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    subplot(1,2,1)
    h1 = plot(mean(wvel312,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(mean(wvel612,2),RF3,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(mean(wvel1212,2),RF3,'LineWidth',lw,'Color',Color(c12,:));
    h6 = plot(mean(odaw,2),RFt,'-.','LineWidth',lw,'Color','k');
    h7 = plot(mean(eccow12,2),efdepth,'--o','LineWidth',lw,'Color','k');
    h8 = plot(mean(sodaw12,2),sodadepf,':','LineWidth',lw,'Color',Color(cg,:));
    yline(0)
    grid on
    title('mean 2017 vertical velocity profile','FontWeight','Normal','FontSize',24)
    xlabel('[m/s]')
    ylabel('depth [m]')
    ylim([ylimlo(jj) 3])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
    legend([h1(1),h2(1),h3(1),h6(1),h7(1),h8(1)],...
        '1/3','1/6','1/12','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
        'FontSize',20,'Location','northeast')
    acc_movie_w
    acc_2plots(1)
    hold off
    
    subplot(1,2,2)
    h1 = plot(mean(int3w,2),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(mean(int6w,2),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(mean(int12w,2),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
    h6 = plot(mean(intodaw,2),anom_depth,'-.','LineWidth',lw,'Color','k');
    h7 = plot(mean(inteccow,2),anom_depth,'--o','LineWidth',lw,'Color','k');
    h8 = plot(mean(intsodaw,2),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
    xline(0)
    yline(0)
    grid on
    title('mean vertical velocity anomaly from SODA3','FontWeight','Normal','FontSize',24)
    xlabel('[m/s]')
    ylim([ylimlo(jj) 3])
%     legend([h1(1),h2(1),h3(1),h6(1),h7(1),h8(1)],...
%         '1/3','1/6','1/12','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
%         'FontSize',20,'Location','best')
    acc_movie_w
    acc_2plots(2)
    hold off
    
    set(gcf,'InvertHardCopy','off');
    print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/WVEL_MEAN_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
    for ii=1:16
        if ii<13
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            subplot(1,2,1)
            h1 = plot(wvel312(:,ii),RF3,'LineWidth',lw,'Color',Color(c3,:));
            hold on
            h2 = plot(wvel612(:,ii),RF3,'LineWidth',lw,'Color',Color(c6,:));
            h3 = plot(wvel1212(:,ii),RF3,'LineWidth',lw,'Color',Color(c12,:));
            h6 = plot(odaw(:,ii),RFt,'-.','LineWidth',lw,'Color','k');
            h7 = plot(eccow12(:,ii),efdepth,'--o','LineWidth',lw,'Color','k');
            h8 = plot(sodaw12(:,ii),sodadepf,':','LineWidth',lw,'Color',Color(cg,:));
            yline(0)
            grid on
            title([datestr(dates(ii),'mmm yyyy'),' vertical velocity profile'],'FontWeight','Normal','FontSize',24)
            xlabel('[m/s]')
            ylabel('depth [m]')
            ylim([ylimlo(jj) 3])
            set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
            legend([h1(1),h2(1),h3(1),h6(1),h7(1),h8(1)],...
                '1/3','1/6','1/12','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
                'FontSize',20,'Location','southwest')
            acc_movie_w
            acc_2plots(1)
            hold off
            
            subplot(1,2,2)
            h1 = plot(int3w(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
            hold on
            h2 = plot(int6w(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
            h3 = plot(int12w(:,ii),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
            h6 = plot(intodaw(:,ii),anom_depth,'-.','LineWidth',lw,'Color','k');
            h7 = plot(inteccow(:,ii),anom_depth,'--o','LineWidth',lw,'Color','k');
            h8 = plot(intsodaw(:,ii),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
            xline(0)
            yline(0)
            grid on
            title([datestr(dates(ii),'mmm yyyy'),' vertical velocity anomaly from SODA3'],'FontWeight','Normal','FontSize',24)
            xlabel('[m/s]')
            ylim([ylimlo(jj) 3])
            legend([h1(1),h2(1),h3(1),h6(1),h7(1),h8(1)],...
                '1/3','1/6','1/12','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
                'FontSize',20,'Location','best')
            acc_movie_w
            acc_2plots(2)
            hold off
            
            set(gcf,'InvertHardCopy','off');
            print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/WVEL_',num2str(ii,'%02.f'),'_',datestr(dates(ii),'mmm'),'_',num2str(abs(ylimlo(jj)))],'-dpng')
            close all
        else
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            subplot(1,2,1)
            h1 = plot(wvel3w(:,ii-12),RF3,'LineWidth',lw,'Color',Color(c3,:));
            hold on
            h2 = plot(wvel6w(:,ii-12),RF3,'LineWidth',lw,'Color',Color(c6,:));
            h3 = plot(wvel12w(:,ii-12),RF3,'LineWidth',lw,'Color',Color(c12,:));
            h6 = plot(odaws(:,ii-12),RFt,'-.','LineWidth',lw,'Color','k');
            h7 = plot(eccow12w(:,ii-12),efdepth,'--o','LineWidth',lw,'Color','k');
            h8 = plot(sodaw12w(:,ii-12),sodadepf,':','LineWidth',lw,'Color',Color(cg,:));
            yline(0)
            grid on
            title([text(ii-12,:),' ',datestr(dates(ii-12),'yyyy'),' vertical velocity profile'],'FontWeight','Normal','FontSize',24)
            xlabel('[m/s]')
            ylabel('depth [m]')
            ylim([ylimlo(jj) 3])
            set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
            legend([h1(1),h2(1),h3(1),h6(1),h7(1),h8(1)],...
                '1/3','1/6','1/12','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
                'FontSize',20,'Location','southwest')
            acc_movie_w
            acc_2plots(1)
            hold off
            
            subplot(1,2,2)
            h1 = plot(int3ws(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c3,:));
            hold on
            h2 = plot(int6ws(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c6,:));
            h3 = plot(int12ws(:,ii-12),anom_depth,'LineWidth',lw,'Color',Color(c12,:));
            h6 = plot(intodaws(:,ii-12),anom_depth,'-.','LineWidth',lw,'Color','k');
            h7 = plot(inteccows(:,ii-12),anom_depth,'--o','LineWidth',lw,'Color','k');
            h8 = plot(intsodaws(:,ii-12),anom_depth,':','LineWidth',lw,'Color',Color(cg,:));
            xline(0)
            yline(0)
            grid on
            title([text(ii-12,:),' ',datestr(dates(ii-12),'yyyy'),' vertical velocity anomaly from SODA3'],'FontWeight','Normal','FontSize',24)
            xlabel('[m/s]')
            ylim([ylimlo(jj) 3])
            legend([h1(1),h2(1),h3(1),h6(1),h7(1),h8(1)],...
                '1/3','1/6','1/12','GFDL ECDA3.1','ECCO4v4','SODA3.4.2',...
                'FontSize',20,'Location','best')
            acc_movie_w
            acc_2plots(2)
            hold off
            
            set(gcf,'InvertHardCopy','off');
            print('-r200',['monthly_vert/',num2str(abs(ylimlo(jj))),'/WVEL_',num2str(ii,'%02.f'),'_',text(ii-12,:),'_',num2str(abs(ylimlo(jj)))],'-dpng')
            close all
        end
    end
end

clear

toc()