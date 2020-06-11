clear
close all
clc
tic()

load CMIP6_TFLX_m

acc_colors
lw = 2.9;

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
h1 = plot(dates,accessc_hfds_m(:,1),'LineWidth',lw,'Color',Color(84,:));
hold on
h2 = plot(dates,accesse_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(84,:));
h3 = plot(dates,awic_hfds_m(:,1),'LineWidth',lw,'Color',Color(89,:));
h4 = plot(dates,awie_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(89,:));
h5 = plot(dates,cams_hfds_m(:,1),'LineWidth',lw,'Color',Color(81,:));
h6 = plot(dates,can_hfds_m(:,1),'LineWidth',lw,'Color',Color(85,:));
h8 = plot(dates,cesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(46,:));
h9 = plot(dates,cesw_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(46,:));
h32 = plot(dates,cnrmc_hfds_m(:,1),'LineWidth',lw,'Color',Color(32,:));
h33 = plot(dates,cnrme_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(32,:));
h10 = plot(dates,ciesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(51,:));
h11 = plot(dates,e3sm_hfds_m(:,1),'LineWidth',lw,'Color',Color(44,:));
h12 = plot(dates,ec_hfds_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h13 = plot(dates,ecv_hfds_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h14 = plot(dates,fgoalsf_hfds_m(:,1),'LineWidth',lw,'Color',Color(21,:));
h15 = plot(dates,fgoalsg_hfds_m(:,1),'LineWidth',lw,'Color',Color(21,:));
h16 = plot(dates,fio_hfds_m(:,1),'LineWidth',lw,'Color',Color(24,:));
h17 = plot(dates,gfdlc_hfds_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h18 = plot(dates,gfdle_hfds_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h19 = plot(dates,gisscc_hfds_m(:,1),'LineWidth',lw,'Color',Color(86,:));
h20 = plot(dates,gissg_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(86,:));
h21 = plot(dates,gissh_hfds_m(:,1),':','LineWidth',lw,'Color',Color(86,:));
h34 = plot(dates,hadll_hfds_m(:,1),'LineWidth',lw,'Color',Color(42,:));
h35 = plot(dates,hadmm_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(42,:));
h22 = plot(dates,ipsl_hfds_m(:,1),'LineWidth',lw,'Color',Color(10,:));
h23 = plot(dates,mcm_hfds_m(:,1),'LineWidth',lw,'Color',Color(34,:));
h24 = plot(dates,mpiham_hfds_m(:,1),'LineWidth',lw,'Color',Color(3,:));
h25 = plot(dates,mpihr_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(3,:));
h26 = plot(dates,mpilr_hfds_m(:,1),':','LineWidth',lw,'Color',Color(3,:));
h27 = plot(dates,nesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(44,:));
h28 = plot(dates,norc_hfds_m(:,1),'LineWidth',lw,'Color',Color(54,:));
h29 = plot(dates,norelm_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(54,:));
h30 = plot(dates,noremm_hfds_m(:,1),':','LineWidth',lw,'Color',Color(54,:));
h31 = plot(dates,-samo_hfds_m(:,1),'LineWidth',lw,'Color',Color(49,:));
h36 = plot(dates,ukesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(1,:));
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-155 185])
acc_movie
acc_plots
title('2010-2014 CMIP6 mean monthly downward surface heat flux [W/m^2]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h8(1),h9(1),h32(1),h33(1),h10(1),...
    h11(1),h12(1),h13(1),h14(1),h15(1),h16(1),h17(1),h18(1),h19(1),...
    h20(1),h21(1),h34(1),h35(1),h22(1),h23(1),h24(1),h25(1),h26(1),h27(1),h28(1),...
    h29(1),h30(1),h31(1),h36(1)],...
    'ACCESS-CM2','ACCESS-ESM1-5','AWI-CM-1-1-MR','AWI-ESM-1-1-LR',...
    'CAMS-CSM1-0','CanESM5','CESM2','CESM2-WACCM',...
    'CIESM','CNRM-CM6-1','CNRM-ESM2-1',...
    'E3SM-1-0','EC-Earth3','EC-Earth3-Veg','FGOALS-f3-L',...
    'FGOALS-g3','FIO-ESM-2-0','GFDL-CM4','GFDL-ESM4','GISS-E2-1-G-CC',...
    'GISS-E2-1-G','GISS-E2-1-H','HadGEM3-GC31-LL',...
    'HadGEM3-GC31-MM','IPSL-CM6A-LR','MCM-UA-1-0',...
    'MPI-ESM-1-2-HAM','MPI-ESM1-2-HR','MPI-ESM1-2-LR','NESM3',...
    'NorCPM1','NorESM2-LM','NorESM2-MM','SAM0-UNICON',...
    'UKESM1-0-LL','Location','eastoutside','FontSize',14.5)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','CMIP6_TFLX_1','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(dates,accessc_hfds_m(:,1),'LineWidth',lw,'Color',Color(84,:));
hold on
h2 = plot(dates,accesse_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(84,:));
h3 = plot(dates,awic_hfds_m(:,1),'LineWidth',lw,'Color',Color(89,:));
h4 = plot(dates,awie_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(89,:));
h5 = plot(dates,cams_hfds_m(:,1),'LineWidth',lw,'Color',Color(81,:));
h6 = plot(dates,can_hfds_m(:,1),'LineWidth',lw,'Color',Color(85,:));
h8 = plot(dates,cesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(46,:));
h9 = plot(dates,cesw_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(46,:));
h32 = plot(dates,cnrmc_hfds_m(:,1),'LineWidth',lw,'Color',Color(32,:));
h33 = plot(dates,cnrme_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(32,:));
h10 = plot(dates,ciesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(51,:));
h11 = plot(dates,e3sm_hfds_m(:,1),'LineWidth',lw,'Color',Color(44,:));
h12 = plot(dates,ec_hfds_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h13 = plot(dates,ecv_hfds_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h14 = plot(dates,fgoalsf_hfds_m(:,1),'LineWidth',lw,'Color',Color(21,:));
h15 = plot(dates,fgoalsg_hfds_m(:,1),'LineWidth',lw,'Color',Color(21,:));
h16 = plot(dates,fio_hfds_m(:,1),'LineWidth',lw,'Color',Color(24,:));
h17 = plot(dates,gfdlc_hfds_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h18 = plot(dates,gfdle_hfds_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h19 = plot(dates,gisscc_hfds_m(:,1),'LineWidth',lw,'Color',Color(86,:));
h20 = plot(dates,gissg_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(86,:));
h21 = plot(dates,gissh_hfds_m(:,1),':','LineWidth',lw,'Color',Color(86,:));
h34 = plot(dates,hadll_hfds_m(:,1),'LineWidth',lw,'Color',Color(42,:));
h35 = plot(dates,hadmm_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(42,:));
h22 = plot(dates,ipsl_hfds_m(:,1),'LineWidth',lw,'Color',Color(10,:));
h23 = plot(dates,mcm_hfds_m(:,1),'LineWidth',lw,'Color',Color(34,:));
h24 = plot(dates,mpiham_hfds_m(:,1),'LineWidth',lw,'Color',Color(3,:));
h25 = plot(dates,mpihr_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(3,:));
h26 = plot(dates,mpilr_hfds_m(:,1),':','LineWidth',lw,'Color',Color(3,:));
h27 = plot(dates,nesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(44,:));
h28 = plot(dates,norc_hfds_m(:,1),'LineWidth',lw,'Color',Color(54,:));
h29 = plot(dates,norelm_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(54,:));
h30 = plot(dates,noremm_hfds_m(:,1),':','LineWidth',lw,'Color',Color(54,:));
h31 = plot(dates,-samo_hfds_m(:,1),'LineWidth',lw,'Color',Color(49,:));
h36 = plot(dates,ukesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(1,:));
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-155 185])
acc_movie
acc_plots
title('2010-2014 CMIP6 mean monthly downward surface heat flux [W/m^2]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h8(1),h9(1),h32(1),h33(1),h10(1),...
    h11(1),h12(1),h13(1),h14(1),h15(1),h16(1),h17(1),h18(1),h19(1),...
    h20(1),h21(1),h34(1),h35(1),h22(1),h23(1),h24(1),h25(1),h26(1),h27(1),h28(1),...
    h29(1),h30(1),h31(1),h36(1)],...
    'ACCESS-CM2: 4.98','ACCESS-ESM1-5: 7.83','AWI-CM-1-1-MR: -6.35','AWI-ESM-1-1-LR:12.83',...
    'CAMS-CSM1-0: 3.65','CanESM5: 7.86','CESM2: 1.82','CESM2-WACCM: 3.67',...
    'CIESM: 0.12','CNRM-CM6-1: 10.55','CNRM-ESM2-1: 12.79',...
    'E3SM-1-0: 13.52','EC-Earth3: 1.75','EC-Earth3-Veg: 1.35','FGOALS-f3-L: -1.51',...
    'FGOALS-g3: 11.69','FIO-ESM-2-0: -1.56','GFDL-CM4: 3.59','GFDL-ESM4: 5.71','GISS-E2-1-G-CC: 17.53',...
    'GISS-E2-1-G: 16.86','GISS-E2-1-H: -4.31','HadGEM3-GC31-LL: 3.80',...
    'HadGEM3-GC31-MM: -18.89','IPSL-CM6A-LR: 6.16','MCM-UA-1-0: 18.01',...
    'MPI-ESM-1-2-HAM: 0.38','MPI-ESM1-2-HR: -1.53','MPI-ESM1-2-LR: -1.10','NESM3: 0.17',...
    'NorCPM1: 23.12','NorESM2-LM: 7.88','NorESM2-MM: 6.93','SAM0-UNICON: -2.67',...
    'UKESM1-0-LL: 4.62','Location','eastoutside','FontSize',14.5)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','CMIP6_TFLX_2','-dpng')



load ../2020_01_January_analysis/Budgets_surf
load ../2020_04_April_analysis/areas

heat_surf3 = heat_surf3./area3;
heat_surf6 = heat_surf6./area6;
heat_surf12 = heat_surf12./area12;

load BSOSE_m_flx

c3 = 55;
c6 = 56;
c12 = 57;

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(dates,accessc_hfds_m(:,1),'LineWidth',lw,'Color',Color(84,:));
hold on
h2 = plot(dates,accesse_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(84,:));
h3 = plot(dates,awic_hfds_m(:,1),'LineWidth',lw,'Color',Color(89,:));
h4 = plot(dates,awie_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(89,:));
h5 = plot(dates,cams_hfds_m(:,1),'LineWidth',lw,'Color',Color(81,:));
h6 = plot(dates,can_hfds_m(:,1),'LineWidth',lw,'Color',Color(85,:));
h8 = plot(dates,cesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(46,:));
h9 = plot(dates,cesw_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(46,:));
h32 = plot(dates,cnrmc_hfds_m(:,1),'LineWidth',lw,'Color',Color(32,:));
h33 = plot(dates,cnrme_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(32,:));
h10 = plot(dates,ciesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(51,:));
h11 = plot(dates,e3sm_hfds_m(:,1),'LineWidth',lw,'Color',Color(44,:));
h12 = plot(dates,ec_hfds_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h13 = plot(dates,ecv_hfds_m(:,1),'LineWidth',lw,'Color',Color(39,:));
h14 = plot(dates,fgoalsf_hfds_m(:,1),'LineWidth',lw,'Color',Color(21,:));
h15 = plot(dates,fgoalsg_hfds_m(:,1),'LineWidth',lw,'Color',Color(21,:));
h16 = plot(dates,fio_hfds_m(:,1),'LineWidth',lw,'Color',Color(24,:));
h17 = plot(dates,gfdlc_hfds_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h18 = plot(dates,gfdle_hfds_m(:,1),'LineWidth',lw,'Color',Color(75,:));
h19 = plot(dates,gisscc_hfds_m(:,1),'LineWidth',lw,'Color',Color(86,:));
h20 = plot(dates,gissg_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(86,:));
h21 = plot(dates,gissh_hfds_m(:,1),':','LineWidth',lw,'Color',Color(86,:));
h34 = plot(dates,hadll_hfds_m(:,1),'LineWidth',lw,'Color',Color(42,:));
h35 = plot(dates,hadmm_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(42,:));
h22 = plot(dates,ipsl_hfds_m(:,1),'LineWidth',lw,'Color',Color(10,:));
h23 = plot(dates,mcm_hfds_m(:,1),'LineWidth',lw,'Color',Color(34,:));
h24 = plot(dates,mpiham_hfds_m(:,1),'LineWidth',lw,'Color',Color(3,:));
h25 = plot(dates,mpihr_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(3,:));
h26 = plot(dates,mpilr_hfds_m(:,1),':','LineWidth',lw,'Color',Color(3,:));
h27 = plot(dates,nesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(44,:));
h28 = plot(dates,norc_hfds_m(:,1),'LineWidth',lw,'Color',Color(54,:));
h29 = plot(dates,norelm_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(54,:));
h30 = plot(dates,noremm_hfds_m(:,1),':','LineWidth',lw,'Color',Color(54,:));
h31 = plot(dates,-samo_hfds_m(:,1),'LineWidth',lw,'Color',Color(49,:));
h36 = plot(dates,ukesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(1,:));
h37 = plot(dates,heat_surf3,'--o','LineWidth',lw,'Color',Color(c3,:));
h38 = plot(dates,heat_surf6,'--o','LineWidth',lw,'Color',Color(c6,:));
h39 = plot(dates,heat_surf12,'--o','LineWidth',lw,'Color',Color(c12,:));
h40 = plot(dates,bsose_hfds_7,'LineWidth',lw,'Color','k');
h41 = plot(dates,bsose_hfds_34,'--','LineWidth',lw,'Color','k');
h42 = plot(dates,bsose_hfds_clim,':','LineWidth',lw,'Color','k');
yline(0,'LineWidth',1.5)
grid on
xticks(dates2)
dateFormat = 'mmm';
datetick('x',dateFormat,'keepticks')
xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
ylim([-155 185])
acc_movie
acc_plots
title('2010-2014 CMIP6 mean monthly downward surface heat flux [W/m^2]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h8(1),h9(1),h32(1),h33(1),h10(1),...
    h11(1),h12(1),h13(1),h14(1),h15(1),h16(1),h17(1),h18(1),h19(1),...
    h20(1),h21(1),h34(1),h35(1),h22(1),h23(1),h24(1),h25(1),h26(1),h27(1),h28(1),...
    h29(1),h30(1),h31(1),h36(1),h37(1),h38(1),h39(1),h40(1),h41(1),h42(1)],...
    'ACCESS-CM2: 4.98','ACCESS-ESM1-5: 7.83','AWI-CM-1-1-MR: -6.35','AWI-ESM-1-1-LR:12.83',...
    'CAMS-CSM1-0: 3.65','CanESM5: 7.86','CESM2: 1.82','CESM2-WACCM: 3.67',...
    'CIESM: 0.12','CNRM-CM6-1: 10.55','CNRM-ESM2-1: 12.79',...
    'E3SM-1-0: 13.52','EC-Earth3: 1.75','EC-Earth3-Veg: 1.35','FGOALS-f3-L: -1.51',...
    'FGOALS-g3: 11.69','FIO-ESM-2-0: -1.56','GFDL-CM4: 3.59','GFDL-ESM4: 5.71','GISS-E2-1-G-CC: 17.53',...
    'GISS-E2-1-G: 16.86','GISS-E2-1-H: -4.31','HadGEM3-GC31-LL: 3.80',...
    'HadGEM3-GC31-MM: -18.89','IPSL-CM6A-LR: 6.16','MCM-UA-1-0: 18.01',...
    'MPI-ESM-1-2-HAM: 0.38','MPI-ESM1-2-HR: -1.53','MPI-ESM1-2-LR: -1.10','NESM3: 0.17',...
    'NorCPM1: 23.12','NorESM2-LM: 7.88','NorESM2-MM: 6.93','SAM0-UNICON: -2.67',...
    'UKESM1-0-LL: 4.62','1/3 2017: 3.95','1/6 2017: 3.41',...
    '1/12 2017: -1.30','BSOSE 2017: 30.65',...
    'BSOSE 2013-4: 24.17','BSOSE 2013-8: 23.78',...
    'Location','eastoutside','FontSize',12)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r300','CMIP6_TFLX_3','-dpng')




% figure()
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = plot(dates,accessc_hfds_m(:,1),'LineWidth',lw,'Color',Color(84,:));
% hold on
% h2 = plot(dates,accesse_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(84,:));
% h3 = plot(dates,awic_hfds_m(:,1),'LineWidth',lw,'Color',Color(89,:));
% h4 = plot(dates,awie_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(89,:));
% h5 = plot(dates,cams_hfds_m(:,1),'LineWidth',lw,'Color',Color(81,:));
% h6 = plot(dates,can_hfds_m(:,1),'LineWidth',lw,'Color',Color(85,:));
% h7 = plot(dates,cas_hfds_m(:,1),'LineWidth',lw,'Color',Color(88,:));
% h8 = plot(dates,cesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(46,:));
% h9 = plot(dates,cesw_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(46,:));
% h10 = plot(dates,ciesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(51,:));
% h11 = plot(dates,e3sm_hfds_m(:,1),'LineWidth',lw,'Color',Color(44,:));
% h12 = plot(dates,ec_hfds_m(:,1),'LineWidth',lw,'Color',Color(39,:));
% h13 = plot(dates,ecv_hfds_m(:,1),'LineWidth',lw,'Color',Color(39,:));
% h14 = plot(dates,fgoalsf_hfds_m(:,1),'LineWidth',lw,'Color',Color(21,:));
% h15 = plot(dates,fgoalsg_hfds_m(:,1),'LineWidth',lw,'Color',Color(21,:));
% h16 = plot(dates,fio_hfds_m(:,1),'LineWidth',lw,'Color',Color(24,:));
% h17 = plot(dates,gfdlc_hfds_m(:,1),'LineWidth',lw,'Color',Color(75,:));
% h18 = plot(dates,gfdle_hfds_m(:,1),'LineWidth',lw,'Color',Color(75,:));
% h19 = plot(dates,gisscc_hfds_m(:,1),'LineWidth',lw,'Color',Color(86,:));
% h20 = plot(dates,gissg_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(86,:));
% h21 = plot(dates,gissh_hfds_m(:,1),':','LineWidth',lw,'Color',Color(86,:));
% h22 = plot(dates,ipsl_hfds_m(:,1),'LineWidth',lw,'Color',Color(59,:));
% h23 = plot(dates,mcm_hfds_m(:,1),'LineWidth',lw,'Color',Color(34,:));
% h24 = plot(dates,mpiham_hfds_m(:,1),'LineWidth',lw,'Color',Color(3,:));
% h25 = plot(dates,mpihr_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(3,:));
% h26 = plot(dates,mpilr_hfds_m(:,1),':','LineWidth',lw,'Color',Color(3,:));
% h27 = plot(dates,nesm_hfds_m(:,1),'LineWidth',lw,'Color',Color(44,:));
% h28 = plot(dates,norc_hfds_m(:,1),'LineWidth',lw,'Color',Color(54,:));
% h29 = plot(dates,norelm_hfds_m(:,1),'--','LineWidth',lw,'Color',Color(54,:));
% h30 = plot(dates,noremm_hfds_m(:,1),':','LineWidth',lw,'Color',Color(54,:));
% h31 = plot(dates,-samo_hfds_m(:,1),'LineWidth',lw,'Color',Color(49,:));
% yline(0,'LineWidth',1.5)
% grid on
% xticks(dates2)
% dateFormat = 'mmm';
% datetick('x',dateFormat,'keepticks')
% xlim([datenum('20170101','yyyymmdd') datenum('20171230','yyyymmdd')])
% ylim([-155 185])
% acc_movie
% acc_plots
% title('2010-2014 CMIP6 mean monthly downward surface heat flux [W/m^2]','FontWeight','Normal','FontSize',20)
% legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),...
%     h11(1),h12(1),h13(1),h14(1),h15(1),h16(1),h17(1),h18(1),h19(1),...
%     h20(1),h21(1),h22(1),h23(1),h24(1),h25(1),h26(1),h27(1),h28(1),...
%     h29(1),h30(1),h31(1)],...
%     'ACCESS-CM2','ACCESS-ESM1-5','AWI-CM-1-1-MR','AWI-ESM-1-1-LR',...
%     'CAMS-CSM1-0','CanESM5','CAS-ESM2-0','CESM2','CESM2-WACCM',...
%     'CIESM','E3SM-1-0','EC-Earth3','EC-Earth3-Veg','FGOALS-f3-L',...
%     'FGOALS-g3','FIO-ESM-2-0','GFDL-CM4','GFDL-ESM4','GISS-E2-1-G-CC',...
%     'GISS-E2-1-G','GISS-E2-1-H','IPSL-CM6A-LR','MCM-UA-1-0',...
%     'MPI-ESM-1-2-HAM','MPI-ESM1-2-HR','MPI-ESM1-2-LR','NESM3',...
%     'NorCPM1','NorESM2-LM','NorESM2-MM','SAM0-UNICON',...
% 'Location','eastoutside','FontSize',16)
% hold off
% set(gcf,'InvertHardCopy','off'); 
% print('-r200','CMIP6_TFLX_3','-dpng')




close all









toc()