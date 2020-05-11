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
%%
load vert_eddy_2000
load vert_eddy_2_2000
load vert_stuff_2000
load ECCOeddy
load SODAvert
load ODA_wt
RC = rdmds('../Grids/3/RF');
RC = squeeze(RC(1:52));
sodadepf = -sodadepf;
cmd = 100*60*60*24;
%%

%% plot


for jj=1:6
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    h1 = plot(cmd.*w3tv,RC,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*w6tv,RC,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*w12tv,RC,'LineWidth',lw,'Color',Color(c12,:));
    % h4 = plot(cmd.*eccoedv,efdepth,'LineWidth',lw,'Color','k');
    h5 = plot(cmd.*eddy3tv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
    h6 = plot(cmd.*eddy6tv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
    h7 = plot(cmd.*eddy12tv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
    h8 = plot(cmd.*odawt,RFt,'--','LineWidth',lw,'Color',Color(7,:));
    h9 = plot(cmd.*eccomwtv,efdepth,'--','LineWidth',lw,'Color',Color(37,:));
    h10 = plot(cmd.*sodawtv,sodadepf,'--','LineWidth',lw,'Color',Color(10,:));
    h11 = plot(cmd.*eddy3tv,RC,':','LineWidth',lw,'Color',Color(c3,:));
    h12 = plot(cmd.*eddy6tv,RC,':','LineWidth',lw,'Color',Color(c6,:));
    h13 = plot(cmd.*eddy12tv,RC,':','LineWidth',lw,'Color',Color(c12,:));
    % h14 = plot(cmd.*eccotwtv,efdepth,':','LineWidth',lw,'Color',Color(cg,:));
    xline(0)
    yline(0)
    grid on
    title('vertical heat transport','FontWeight','Normal','FontSize',24)
    xlabel('[deg C cm/day]')
    ylabel('depth [m]')
    ylim([ylimlo(jj) 10])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
%     legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),...
%         h10(1),h11(1),h12(1),h13(1),h14(1)],...
%         '1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>','ECCO4v4 <w*theta>',...
%         '1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>','ECDA3.1 <w><theta>',...
%         'ECCO4v4 <w><theta>','SODA3.4.2 <w><theta>','1/3 <w''theta''>',...
%         '1/6 <w''theta''>','1/12 <w''theta''>','ECCO4v4 <w''theta''>',...
%         'FontSize',18,'Location','eastoutside')
        legend([h1(1),h2(1),h3(1),h5(1),h6(1),h7(1),h8(1),h9(1),...
        h10(1),h11(1),h12(1),h13(1)],...
        '1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
        '1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>','ECDA3.1 <w><theta>',...
        'ECCO4v4 <w><theta>','SODA3.4.2 <w><theta>','1/3 <w''theta''>',...
        '1/6 <w''theta''>','1/12 <w''theta''>',...
        'FontSize',18,'Location','eastoutside')
    acc_movie_w
    acc_plots
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r300',['vert_eddy/others/mean_vert_2000_all_heat_',num2str(abs(ylimlo(jj)))],'-dpng')
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    h1 = plot(cmd.*w3tv,RC,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*w6tv,RC,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*w12tv,RC,'LineWidth',lw,'Color',Color(c12,:));
%     h4 = plot(cmd.*eccoedv,efdepth,'LineWidth',lw,'Color','k');
    h5 = plot(cmd.*eddy3tv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
    h6 = plot(cmd.*eddy6tv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
    h7 = plot(cmd.*eddy12tv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
%     h8 = plot(cmd.*odawt,RFt,'--','LineWidth',lw,'Color',Color(7,:));
%     h9 = plot(cmd.*eccomwtv,efdepth,'--','LineWidth',lw,'Color',Color(37,:));
%     h10 = plot(cmd.*sodawtv,sodadepf,'--','LineWidth',lw,'Color',Color(10,:));
    h11 = plot(cmd.*eddy3tv,RC,':','LineWidth',lw,'Color',Color(c3,:));
    h12 = plot(cmd.*eddy6tv,RC,':','LineWidth',lw,'Color',Color(c6,:));
    h13 = plot(cmd.*eddy12tv,RC,':','LineWidth',lw,'Color',Color(c12,:));
%     h14 = plot(cmd.*eccotwtv,efdepth,':','LineWidth',lw,'Color',Color(cg,:));
    xline(0)
    yline(0)
    grid on
    title('vertical heat transport','FontWeight','Normal','FontSize',24)
    xlabel('[deg C cm/day]')
    ylabel('depth [m]')
    ylim([ylimlo(jj) 10])
    set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
%     legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),...
%         h10(1),h11(1),h12(1),h13(1),h14(1)],...
%         '1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>','ECCO4v4 <w*theta>',...
%         '1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>','ECDA3.1 <w><theta>',...
%         'ECCO4v4 <w><theta>','SODA3.4.2 <w><theta>','1/3 <w''theta''>',...
%         '1/6 <w''theta''>','1/12 <w''theta''>','ECCO4v4 <w''theta''>',...
%         'FontSize',18,'Location','eastoutside')
        legend([h1(1),h2(1),h3(1),h5(1),h6(1),h7(1),...
        h11(1),h12(1),h13(1)],...
        '1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
        '1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>',...
        '1/3 <w''theta''>','1/6 <w''theta''>','1/12 <w''theta''>',...
        'FontSize',18,'Location','eastoutside')
    acc_movie_w
    acc_plots
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r300',['vert_eddy/others/mean_vert_2000_heat_',num2str(abs(ylimlo(jj)))],'-dpng')
    
    
    
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    h1 = plot(cmd.*w3cv,RC,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h2 = plot(cmd.*w6cv,RC,'LineWidth',lw,'Color',Color(c6,:));
    h3 = plot(cmd.*w12cv,RC,'LineWidth',lw,'Color',Color(c12,:));
    h4 = plot(cmd.*eddy3cv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
    h5 = plot(cmd.*eddy6cv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
    h6 = plot(cmd.*eddy12cv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
    h7 = plot(cmd.*eddy3cv,RC,':','LineWidth',lw,'Color',Color(c3,:));
    h8 = plot(cmd.*eddy6cv,RC,':','LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(cmd.*eddy12cv,RC,':','LineWidth',lw,'Color',Color(c12,:));
    xline(0)
    yline(0)
    grid on
    title('vertical DIC transport','FontWeight','Normal','FontSize',24)
    xlabel('[mol C/m^3 cm/day]')
    ylim([ylimlo(jj) 10])
    legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
        '1/3 <w*DIC>','1/6 <w*DIC>','1/12 <w*DIC>',...
        '1/3 <w><DIC>','1/6 <w><DIC>','1/12 <w><DIC>',...
        '1/3 <w''DIC''>','1/6 <w''DIC''>','1/12 <w''DIC''>',...
        'FontSize',18,'Location','eastoutside')
    acc_movie_w
    acc_plots
    hold off
    
    set(gcf,'InvertHardCopy','off');
    print('-r300',['vert_eddy/others/mean_vert_2000_DIC_',num2str(abs(ylimlo(jj)))],'-dpng')
    close all
end