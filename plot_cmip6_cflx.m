clear
close all
clc
tic()

load CMIP6_CFLX_m

acc_colors
lw = 2.9;
syr = 60*60*24*365.25;
mmolkg = 12.0107*1000*1000000;

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

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(dates,syr.*accesse_fgco2_m(:,1),'LineWidth',lw,'Color',Color(84,:));
hold on
h2 = plot(dates,(-syr/1000).*bccc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(89,:));
h3 = plot(dates,syr.*bcce_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(89,:));
h4 = plot(dates,syr.*can_fgco2_m(:,1),'LineWidth',lw,'Color',Color(85,:));
h5 = plot(dates,syr.*cesmfv_fgco2_m(:,1),'LineWidth',lw,'Color',Color(46,:));
h6 = plot(dates,syr.*cesm_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(46,:));
h7 = plot(dates,syr.*ceswfv_fgco2_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h8 = plot(dates,syr.*cesw_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(39,:));
h9 = plot(dates,syr.*gfdlc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h10 = plot(dates,syr.*gfdle_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(75,:));
h11 = plot(dates,(syr/mmolkg).*gisscc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(86,:));
h12 = plot(dates,syr.*inm4_fgco2_m(:,1),'LineWidth',lw,'Color',Color(42,:));
h13 = plot(dates,syr.*inm5_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(42,:));
h14 = plot(dates,syr.*ipsl_fgco2_m(:,1),'LineWidth',lw,'Color',Color(10,:));
h15 = plot(dates,syr.*miroc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(34,:));
h16 = plot(dates,syr.*mpiham_fgco2_m(:,1),'LineWidth',lw,'Color',Color(3,:));
h17 = plot(dates,syr.*mpihr_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(3,:));
h18 = plot(dates,syr.*mpilr_fgco2_m(:,1),':','LineWidth',lw,'Color',Color(3,:));
h19 = plot(dates,syr.*norc_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(54,:));
h20 = plot(dates,syr.*norelm_fgco2_m(:,1),':','LineWidth',lw,'Color',Color(54,:));
h21 = plot(dates,syr.*noremm_fgco2_m(:,1),'LineWidth',lw,'Color',Color(54,:));
h22 = plot(dates,syr.*ukesm_fgco2_m(:,1),'LineWidth',lw,'Color',Color(1,:));
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-155 185])
acc_movie
acc_plots
title('2010-2014 CMIP6 mean monthly downward surface carbon flux [kg C/m^2/yr]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),...
    h11(1),h12(1),h13(1),h14(1),h15(1),h16(1),h17(1),h18(1),h19(1),...
    h20(1),h21(1),h22(1)],...
    'ACCESS-ESM1-5','BCC-CSM2-MR','BCC-ESM1',...
    'CanESM5','CESM2-FV2','CESM2','CESM2-WACCM-FV2',...
    'CESM2-WACCM','GFDL-CM4','GFDL-ESM4',...
    'GISS-E2-1-G-CC','INM-CM4-8',...
    'INM-CM5-0','IPSL-CM6A-LR','MIROC-ES2L',...
    'MPI-ESM-1-2-HAM','MPI-ESM1-2-HR','MPI-ESM1-2-LR',...
    'NorCPM1','NorESM2-LM','NorESM2-MM','UKESM1-0-LL',...
    'Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','CMIP6_CFLX_1','-dpng')





close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(dates,syr.*accesse_fgco2_m(:,1),'LineWidth',lw,'Color',Color(84,:));
hold on
h2 = plot(dates,(-syr/1000).*bccc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(89,:));
h3 = plot(dates,syr.*bcce_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(89,:));
h4 = plot(dates,syr.*can_fgco2_m(:,1),'LineWidth',lw,'Color',Color(85,:));
h5 = plot(dates,syr.*cesmfv_fgco2_m(:,1),'LineWidth',lw,'Color',Color(46,:));
h6 = plot(dates,syr.*cesm_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(46,:));
h7 = plot(dates,syr.*ceswfv_fgco2_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h8 = plot(dates,syr.*cesw_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(39,:));
h9 = plot(dates,syr.*gfdlc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h10 = plot(dates,syr.*gfdle_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(75,:));
h11 = plot(dates,(syr/mmolkg).*gisscc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(86,:));
h12 = plot(dates,syr.*inm4_fgco2_m(:,1),'LineWidth',lw,'Color',Color(42,:));
h13 = plot(dates,syr.*inm5_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(42,:));
h14 = plot(dates,syr.*ipsl_fgco2_m(:,1),'LineWidth',lw,'Color',Color(10,:));
h15 = plot(dates,syr.*miroc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(34,:));
h16 = plot(dates,syr.*mpiham_fgco2_m(:,1),'LineWidth',lw,'Color',Color(3,:));
h17 = plot(dates,syr.*mpihr_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(3,:));
h18 = plot(dates,syr.*mpilr_fgco2_m(:,1),':','LineWidth',lw,'Color',Color(3,:));
h19 = plot(dates,syr.*norc_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(54,:));
h20 = plot(dates,syr.*norelm_fgco2_m(:,1),':','LineWidth',lw,'Color',Color(54,:));
h21 = plot(dates,syr.*noremm_fgco2_m(:,1),'LineWidth',lw,'Color',Color(54,:));
h22 = plot(dates,syr.*ukesm_fgco2_m(:,1),'LineWidth',lw,'Color',Color(1,:));
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-155 185])
acc_movie
acc_plots
title('2010-2014 CMIP6 mean monthly downward surface carbon flux [kg C/m^2/yr]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),...
    h11(1),h12(1),h13(1),h14(1),h15(1),h16(1),h17(1),h18(1),h19(1),...
    h20(1),h21(1),h22(1)],...
    'ACCESS-ESM1-5: 0.0106','BCC-CSM2-MR: 0.0169','BCC-ESM1: 0.018',...
    'CanESM5: 0.0119','CESM2-FV2: 0.0146','CESM2: 0.0159','CESM2-WACCM-FV2: 0.0156',...
    'CESM2-WACCM: 0.0147','GFDL-CM4: 0.0252','GFDL-ESM4: 0.0218',...
    'GISS-E2-1-G-CC: 0.0477','INM-CM4-8: 0.0138',...
    'INM-CM5-0: -0.00723','IPSL-CM6A-LR: 0.0159','MIROC-ES2L: 0.0138',...
    'MPI-ESM-1-2-HAM: 0.0106','MPI-ESM1-2-HR: 0.0162','MPI-ESM1-2-LR: 0.0107',...
    'NorCPM1: 0.0172','NorESM2-LM: 0.0117','NorESM2-MM: 0.0112','UKESM1-0-LL: 0.0202',...
    'Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','CMIP6_CFLX_2','-dpng')

close all

load ../2020_01_January_analysis/Budgets_surf
load ../2020_04_April_analysis/areas

syr = 60*60*24*365.25;
molkg = 12.0107/1000;
gty = 31536000/1000000000000;

carbon_surf3 = syr*1000.*carbon_surf3./gty./12.0107;
carbon_surf6 = syr*1000.*carbon_surf6./gty./12.0107;
carbon_surf12 = syr*1000.*carbon_surf12./gty./12.0107;

carbon_surf3 = molkg.*carbon_surf3./area3;
carbon_surf6 = molkg.*carbon_surf6./area6;
carbon_surf12 = molkg.*carbon_surf12./area12;

load BSOSE_m_flx

c3 = 55;
c6 = 56;
c12 = 57;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(dates,syr.*accesse_fgco2_m(:,1),'LineWidth',lw,'Color',Color(84,:));
hold on
h2 = plot(dates,(-syr/1000).*bccc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(89,:));
h3 = plot(dates,syr.*bcce_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(89,:));
h4 = plot(dates,syr.*can_fgco2_m(:,1),'LineWidth',lw,'Color',Color(85,:));
h5 = plot(dates,syr.*cesmfv_fgco2_m(:,1),'LineWidth',lw,'Color',Color(46,:));
h6 = plot(dates,syr.*cesm_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(46,:));
h7 = plot(dates,syr.*ceswfv_fgco2_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h8 = plot(dates,syr.*cesw_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(39,:));
h9 = plot(dates,syr.*gfdlc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h10 = plot(dates,syr.*gfdle_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(75,:));
h11 = plot(dates,(syr/mmolkg).*gisscc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(86,:));
h12 = plot(dates,syr.*inm4_fgco2_m(:,1),'LineWidth',lw,'Color',Color(42,:));
h13 = plot(dates,syr.*inm5_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(42,:));
h14 = plot(dates,syr.*ipsl_fgco2_m(:,1),'LineWidth',lw,'Color',Color(10,:));
h15 = plot(dates,syr.*miroc_fgco2_m(:,1),'LineWidth',lw,'Color',Color(34,:));
h16 = plot(dates,syr.*mpiham_fgco2_m(:,1),'LineWidth',lw,'Color',Color(3,:));
h17 = plot(dates,syr.*mpihr_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(3,:));
h18 = plot(dates,syr.*mpilr_fgco2_m(:,1),':','LineWidth',lw,'Color',Color(3,:));
h19 = plot(dates,syr.*norc_fgco2_m(:,1),'--','LineWidth',lw,'Color',Color(54,:));
h20 = plot(dates,syr.*norelm_fgco2_m(:,1),':','LineWidth',lw,'Color',Color(54,:));
h21 = plot(dates,syr.*noremm_fgco2_m(:,1),'LineWidth',lw,'Color',Color(54,:));
h22 = plot(dates,syr.*ukesm_fgco2_m(:,1),'LineWidth',lw,'Color',Color(1,:));
h23 = plot(dates,carbon_surf3,'--o','LineWidth',lw,'Color',Color(c3,:));
h24 = plot(dates,carbon_surf6,'--o','LineWidth',lw,'Color',Color(c6,:));
h25 = plot(dates,carbon_surf12,'--o','LineWidth',lw,'Color',Color(c12,:));
h26 = plot(dates,bsose_fgco2_7,'LineWidth',lw,'Color','k');
h27 = plot(dates,bsose_fgco2_34,'--','LineWidth',lw,'Color','k');
h28 = plot(dates,bsose_fgco2_clim,':','LineWidth',lw,'Color','k');
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-155 185])
acc_movie
acc_plots
title('2010-2014 CMIP6 mean monthly downward surface carbon flux [kg C/m^2/yr]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),...
    h11(1),h12(1),h13(1),h14(1),h15(1),h16(1),h17(1),h18(1),h19(1),...
    h20(1),h21(1),h22(1),h23(1),h24(1),h25(1),h26(1),h27(1),h28(1)],...
    'ACCESS-ESM1-5: 0.0106','BCC-CSM2-MR: 0.0169','BCC-ESM1: 0.018',...
    'CanESM5: 0.0119','CESM2-FV2: 0.0146','CESM2: 0.0159','CESM2-WACCM-FV2: 0.0156',...
    'CESM2-WACCM: 0.0147','GFDL-CM4: 0.0252','GFDL-ESM4: 0.0218',...
    'GISS-E2-1-G-CC: 0.0477','INM-CM4-8: 0.0138',...
    'INM-CM5-0: -0.0072','IPSL-CM6A-LR: 0.0159','MIROC-ES2L: 0.0138',...
    'MPI-ESM-1-2-HAM: 0.0106','MPI-ESM1-2-HR: 0.0162','MPI-ESM1-2-LR: 0.0107',...
    'NorCPM1: 0.0172','NorESM2-LM: 0.0117','NorESM2-MM: 0.0112','UKESM1-0-LL: 0.0202',...
    '1/3 2017: 0.0256','1/6 2017: 0.0254','1/12 2017: 0.0258','BSOSE 2017: 0.0099',...
    'BSOSE 2013-4: 0.0128','BSOSE 2013-8: 0.0114','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r300','CMIP6_CFLX_3','-dpng')


toc()