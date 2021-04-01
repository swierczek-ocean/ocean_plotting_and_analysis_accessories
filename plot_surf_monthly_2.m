clear
close all
clc
tic()

load ../2020_01_January_analysis/Budgets_surf
load areas
load eratflx
load co2flx
load flux2
load BSOSE_m_flx
load jflux
load ../2020_07_July_Analysis/pangaeaflx
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
syr = 60*60*24*365.25;
molkg = 12.0107/1000;
gty = 31536000/1000000000000;

carbon_surf3 = syr*1000.*carbon_surf3./gty./12.0107;
carbon_surf6 = syr*1000.*carbon_surf6./gty./12.0107;
carbon_surf12 = syr*1000.*carbon_surf12./gty./12.0107;

carbon_surf3 = molkg.*carbon_surf3./area3;
carbon_surf6 = molkg.*carbon_surf6./area6;
carbon_surf12 = molkg.*carbon_surf12./area12;

heat_surf3 = heat_surf3./area3;
heat_surf6 = heat_surf6./area6;
heat_surf12 = heat_surf12./area12;


dates = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];
dates2 = [datenum('20170101','yyyymmdd'),datenum('20170201','yyyymmdd'),...
    datenum('20170301','yyyymmdd'),datenum('20170401','yyyymmdd'),...
    datenum('20170501','yyyymmdd'),datenum('20170601','yyyymmdd'),...
    datenum('20170701','yyyymmdd'),datenum('20170801','yyyymmdd'),...
    datenum('20170901','yyyymmdd'),datenum('20171001','yyyymmdd'),...
    datenum('20171101','yyyymmdd'),datenum('20171201','yyyymmdd'),...
    datenum('20180101','yyyymmdd')];

% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% ax1 = subplot(2,1,1);
% h13 = plot(dates,eratflx,'--o','LineWidth',lw,'Color','k');
% hold on
% h14 = plot(dates,sodatflux,'--','LineWidth',lw,'Color','k');
% h15 = plot(dates,eccotflux,':','LineWidth',lw,'Color','k');
% h16 = plot(dates,bsose_hfds_7,'LineWidth',lw,'Color','k');
% h10 = plot(dates,heat_surf3,'LineWidth',lw,'Color',Color(c3,:));
% h11 = plot(dates,heat_surf6,'LineWidth',lw,'Color',Color(c6,:));
% h12 = plot(dates,heat_surf12,'LineWidth',lw,'Color',Color(c12,:));
% yline(0,'LineWidth',1.5)
% grid on
% ax1.GridAlpha = 0.5;
% xticks(dates2)
% dateFormat = 'mmm yyyy';
% datetick('x',dateFormat,'keepticks')
% xticklabels({})
% xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-130 165])
% acc_movie_w
% acc_plots_ud(1)
% title('2017 surface heat flux [W/m^2]','FontWeight','Normal','FontSize',24)
% legend([h10(1),h11(1),h12(1),h13(1),h14(1),h15(1),h16(1)],...
%     '1/3       | mean:   3.95','1/6       | mean:   3.41','1/12     | mean:  -1.30',...
%     'ERA5    | mean: 14.27','SODA3 | mean: 17.33',...
%     'ECCO4 | mean:  3.22','BSOSE | mean: 30.65',...
% 'Location','north','FontSize',16)
% hold off
% 
% 
% ax2 = subplot(2,1,2);
% h13 = plot(dates,1000.*landflxm12,'--','LineWidth',lw,'Color','k');
% hold on
% h15 = plot(dates,1000.*jflxm12,'--o','LineWidth',lw,'Color','k');
% h16 = plot(dates,1000.*roedenflxm12,':','LineWidth',lw,'Color','k');
% h17 = plot(dates,1000.*cmemsflxm12,'-.','LineWidth',lw,'Color','k');
% h14 = plot(dates,1000.*bsose_fgco2_7,'LineWidth',lw,'Color','k');
% h10 = plot(dates,1000.*carbon_surf3,'LineWidth',lw,'Color',Color(c3,:));
% h11 = plot(dates,1000.*carbon_surf6,'LineWidth',lw,'Color',Color(c6,:));
% h12 = plot(dates,1000.*carbon_surf12,'LineWidth',lw,'Color',Color(c12,:));
% yline(0,'LineWidth',1.5)
% grid on
% ax2.GridAlpha = 0.5;
% xticks(dates2)
% dateFormat = 'mmm';
% datetick('x',dateFormat,'keepticks')
% xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-12 45])
% yticks([0,10,20,30,40])
% acc_movie_w
% acc_plots_ud(2)
% title('2017 surface carbon flux [g/m^2/yr]','FontWeight','Normal','FontSize',24)
% legend([h10(1),h11(1),h12(1),h13(1),h15(1),h16(1),h17(1),h14(1)],...
%     '1/3                  | mean: 25.6',...
%     '1/6                  | mean: 25.4',...
%     '1/12                | mean: 25.8',...
%     'Landschutzer  | mean: 26.8',...
%     'JMA                 | mean: 31.0',...
%     'Rodenbeck     | mean: 33.9',...
%     'CMEMS            | mean: 33.5',...
%     'BSOSE            | mean: 9.9',...
%     'Location','southeast','FontSize',16)
% set(gcf,'InvertHardCopy','off'); 
% print('-r200','FLUX_ALL','-dtiff')


close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
ax1 = subplot(2,1,1);
h13 = plot(dates,eratflx,'--o','LineWidth',lw,'Color','k');
hold on
h14 = plot(dates,sodatflux,'--','LineWidth',lw,'Color','k');
h15 = plot(dates,eccotflux,':','LineWidth',lw,'Color','k');
h16 = plot(dates,bsose_hfds_7,'LineWidth',lw,'Color','k');
h10 = plot(dates,heat_surf3,'LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,heat_surf6,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,heat_surf12,'LineWidth',lw,'Color',Color(c12,:));
yline(0,'LineWidth',1.5)
grid on
ax1.GridAlpha = 0.5;
xticks(dates2)
dateFormat = 'mmm yyyy';
datetick('x',dateFormat,'keepticks')
xticklabels({})
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-130 165])
acc_movie_w
acc_plots_ud_2(1)
title('2017 surface heat flux [W/m^2]','FontWeight','Normal','FontSize',24)
legend([h10(1),h11(1),h12(1),h13(1),h14(1),h15(1),h16(1)],...
    '1/3       | mean:   3.95','1/6       | mean:   3.41','1/12     | mean:  -1.30',...
    'ERA5    | mean: 14.27','SODA3 | mean: 17.33',...
    'ECCO4 | mean:  3.22','BSOSE | mean: 30.65',...
'Location','eastoutside','FontSize',20)
hold off


ax2 = subplot(2,1,2);
h13 = plot(dates,1000.*landflxm12,'--','LineWidth',lw,'Color','k');
hold on
h15 = plot(dates,1000.*jflxm12,'--o','LineWidth',lw,'Color','k');
h16 = plot(dates,1000.*roedenflxm12,':','LineWidth',lw,'Color','k');
h17 = plot(dates,1000.*cmemsflxm12,'-.','LineWidth',lw,'Color','k');
h14 = plot(dates,1000.*bsose_fgco2_7,'LineWidth',lw,'Color','k');
h10 = plot(dates,1000.*carbon_surf3,'LineWidth',lw,'Color',Color(c3,:));
h11 = plot(dates,1000.*carbon_surf6,'LineWidth',lw,'Color',Color(c6,:));
h12 = plot(dates,1000.*carbon_surf12,'LineWidth',lw,'Color',Color(c12,:));
yline(0,'LineWidth',1.5)
grid on
ax2.GridAlpha = 0.5;
xticks(dates2)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-9 45])
yticks([0,10,20,30,40])
acc_movie_w
acc_plots_ud_2(2)
title('2017 surface carbon flux [g/m^2/yr]','FontWeight','Normal','FontSize',24)
legend([h10(1),h11(1),h12(1),h13(1),h15(1),h16(1),h17(1),h14(1)],...
    '1/3                  | mean: 25.6',...
    '1/6                  | mean: 25.4',...
    '1/12                | mean: 25.8',...
    'Landschutzer  | mean: 26.8',...
    'JMA                 | mean: 31.0',...
    'Rodenbeck     | mean: 33.9',...
    'CMEMS           | mean: 33.5',...
    'BSOSE            | mean: 9.9',...
    'Location','eastoutside','FontSize',20)
set(gcf,'InvertHardCopy','off'); 
print('-r200','FLUX_ALL_2','-dtiff')

close all

toc()