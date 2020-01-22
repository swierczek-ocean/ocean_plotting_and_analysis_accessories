clear
close all
clc
tic()

load pco2_rmse

acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;

months = [datenum('20170101','yyyymmdd'),datenum('20170201','yyyymmdd'),...
    datenum('20170301','yyyymmdd'),datenum('20170401','yyyymmdd'),...
    datenum('20170501','yyyymmdd'),datenum('20170601','yyyymmdd'),...
    datenum('20170701','yyyymmdd'),datenum('20170801','yyyymmdd'),...
    datenum('20170901','yyyymmdd'),datenum('20171001','yyyymmdd'),...
    datenum('20171101','yyyymmdd'),datenum('20171201','yyyymmdd'),...
    datenum('20180101','yyyymmdd')];
midmonths = [datenum('20170115','yyyymmdd'),datenum('20170214','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd')];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

h7 = plot(midmonths,pco2_socat_rmse3(:,1),'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(midmonths,pco2_socat_rmse6(:,1),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(midmonths,pco2_socat_rmse12(:,1),'LineWidth',lw,'Color',Color(c12,:));
xticks(months)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171231','yyyymmdd')])
% ylim([-2.4 2])
grid on
title('RMSE of SOCAT climatology surf pCO2 misfit [\muatm]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
text(midmonths(1),12,'# of observations:','Color','k','FontSize',18);
for ii=1:12
    text(midmonths(ii),6,num2str(pco2_socat_rmse3(ii,2)),...
        'Color','k','FontSize',18,'HorizontalAlignment','center');
end
acc_movie_w
acc_plots
set(gcf,'InvertHardCopy','off');
print('-r300','SOCAT_RMSE_clim','-dpng')

close all
clear

load pco2_rmse_2017

acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;

months = [datenum('20170101','yyyymmdd'),datenum('20170201','yyyymmdd'),...
    datenum('20170301','yyyymmdd'),datenum('20170401','yyyymmdd'),...
    datenum('20170501','yyyymmdd'),datenum('20170601','yyyymmdd'),...
    datenum('20170701','yyyymmdd'),datenum('20170801','yyyymmdd'),...
    datenum('20170901','yyyymmdd'),datenum('20171001','yyyymmdd'),...
    datenum('20171101','yyyymmdd'),datenum('20171201','yyyymmdd'),...
    datenum('20180101','yyyymmdd')];
midmonths = [datenum('20170115','yyyymmdd'),datenum('20170214','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd')];


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

h7 = plot(midmonths,pco2_socat_rmse3(:,1),'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(midmonths,pco2_socat_rmse6(:,1),'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(midmonths,pco2_socat_rmse12(:,1),'LineWidth',lw,'Color',Color(c12,:));
xticks(months)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([datenum('20170101','yyyymmdd') datenum('20171231','yyyymmdd')])
ylim([2 105])
grid on
title('RMSE of SOCAT 2017 surf pCO2 misfit [\muatm]','FontWeight','Normal','FontSize',18)
legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','best')
text(midmonths(1),15,'# of observations:','Color','k','FontSize',18);
for ii=1:12
    text(midmonths(ii),9,num2str(pco2_socat_rmse3(ii,2)),...
        'Color','k','FontSize',18,'HorizontalAlignment','center');
end
acc_movie_w
acc_plots
set(gcf,'InvertHardCopy','off');
print('-r300','SOCAT_RMSE_2017','-dpng')


toc()