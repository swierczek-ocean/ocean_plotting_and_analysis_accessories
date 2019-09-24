clear
close all
clc
tic()

acc_settings


%%
lw = 2.8;
ms = 20;
cb = 85;
cbd = 36;
c3 = 86;
c6 = 87;
c12 = 88;
xdatesfull = [datenum('20161201','yyyymmdd'),...
    datenum('20170101','yyyymmdd'),datenum('20170201','yyyymmdd'),...
    datenum('20170301','yyyymmdd'),datenum('20170401','yyyymmdd'),...
    datenum('20170501','yyyymmdd'),datenum('20170601','yyyymmdd'),...
    datenum('20170701','yyyymmdd'),datenum('20170801','yyyymmdd'),...
    datenum('20170901','yyyymmdd'),datenum('20171001','yyyymmdd'),...
    datenum('20171101','yyyymmdd'),datenum('20171201','yyyymmdd')];
xdateswin2 = 736774:5:736839;
xdateswin3 = 736888:5:736969;
%%


%%
win2coords = [736774 736839];
win3coords = [736888 736969];


%% 1
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_30m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_30m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_30m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_30mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_30mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_30m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_30mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_30mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_30m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_30m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_30m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_30m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_30mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_30mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 30m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_30mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_30mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_30mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 30m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_30mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_30mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_30mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 30m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_30mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_30mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_30mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 30m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_30mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_30mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_30mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_30m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 30m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_30mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_30mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_30m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_30mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 30m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_30mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_40m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_40m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_40m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_40mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_40mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_40m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_40mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_40mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_40m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_40m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_40m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_40m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_40mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_40mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 40m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_40mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_40mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_40mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 40m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_40mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_40mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_40mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 40m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_40mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_40mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_40mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 40m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_40mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_40mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_40mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_40m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 40m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_40mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_40mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_40m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_40mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 40m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_40mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_60m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_60m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_60m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_60mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_60mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_60m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_60mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_60mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_60m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_60m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_60m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_60m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_60mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_60mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 60m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_60mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_60mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_60mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 60m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_60mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_60mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_60mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 60m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_60mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_60mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_60mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 60m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_60mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_60mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_60mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_60m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 60m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_60mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_60mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_60m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_60mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 60m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_60mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_90m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_90m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_90m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_90mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_90mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_90m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_90mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_90mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_90m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_90m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_90m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_90m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_90mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_90mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 90m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_90mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_90mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_90mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 90m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_90mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_90mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_90mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 90m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_90mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_90mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_90mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 90m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_90mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_90mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_90mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_90m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 90m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_90mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_90mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_90m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_90mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 90m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_90mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_130m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_130m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_130m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_130mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_130mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_130m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_130mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_130mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_130m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_130m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_130m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_130m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_130mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_130mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 130m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_130mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_130mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_130mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 130m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_130mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_130mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_130mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 130m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_130mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_130mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_130mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 130m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_130mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_130mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_130mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_130m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 130m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_130mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_130mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_130m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_130mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 130m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_130mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_180m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_180m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_180m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_180mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_180mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_180m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_180mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_180mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_180m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_180m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_180m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_180m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_180mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_180mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 180m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_180mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_180mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_180mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 180m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_180mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_180mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_180mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 180m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_180mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_180mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_180mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 180m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_180mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_180mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_180mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_180m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 180m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_180mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_180mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_180m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_180mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 180m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_180mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_250m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_250m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_250m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_250mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_250mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_250m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_250mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_250mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_250m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_250m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_250m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_250m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_250mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_250mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 250m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_250mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_250mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_250mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 250m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_250mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_250mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_250mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 250m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_250mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_250mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_250mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 250m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_250mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_250mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_250mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_250m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 250m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_250mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_250mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_250m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_250mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 250m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_250mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_350m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_350m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_350m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_350mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_350mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_350m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_350mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_350mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_350m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_350m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_350m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_350m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_350mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_350mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 350m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_350mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_350mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_350mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 350m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_350mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_350mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_350mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 350m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_350mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_350mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_350mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 350m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_350mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_350mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_350mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_350m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 350m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_350mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_350mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_350m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_350mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 350m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_350mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_500m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_500m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_500m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_500mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_500mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_500m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_500mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_500mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_500m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_500m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_500m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_500m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_500mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_500mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 500m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_500mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_500mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_500mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 500m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_500mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_500mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_500mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 500m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_500mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_500mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_500mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 500m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_500mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_500mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_500mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 500m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_500mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_500mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_500mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 500m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_500mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_750m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_750m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_750m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_750mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_750mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_750m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_750mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_750mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_750m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_750m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_750m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_750m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_750mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_750mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 750m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_750mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_750mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_750mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 750m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_750mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_750mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_750mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 750m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_750mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_750mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_750mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 750m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_750mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_750mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_750mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_750m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 750m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_750mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_750mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_750m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_750mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 750m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_750mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_1000m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_1000m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_1000m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_1000mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_1000mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_1000m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_1000mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_1000mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_1000m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_1000m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_1000m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_1000m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_1000mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_1000mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1000m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1000mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_1000mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_1000mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1000m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1000mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_1000mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_1000mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1000m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1000mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_1000mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_1000mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1000m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1000mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_1000mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_1000mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_1000m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1000m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1000mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_1000mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_1000m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_1000mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1000m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1000mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%

%%
load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_1500m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_1500m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_1500m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_1500mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_1500mB_dep3

time_MITgcm = MITgcm3_OOI_CTD_1500m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_1500mA_dep3(:,1);
ooi_timeB = Proc_GA_OOI_CTD_1500mB_dep3(:,1);
time_ind_startA = find(MITgcm3_OOI_CTD_1500m(:,1)>ooi_timeA(1),1)-1;
time_ind_startB = find(MITgcm3_OOI_CTD_1500m(:,1)>ooi_timeB(1),1)-1;
time_ind_endA = find(MITgcm3_OOI_CTD_1500m(:,1)>ooi_timeA(end-3),1);
time_ind_endB = find(MITgcm3_OOI_CTD_1500m(:,1)>ooi_timeB(end-3),1);
coords = [ooi_timeA(1) ooi_timeA(end)];

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_1500mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_1500mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1500m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1500mA','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_1500mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_1500mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1500m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1500mB','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_1500mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_1500mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1500m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1500mA_window2','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_1500mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_1500mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin2)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win2coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1500m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1500mB_window2','-dpng')

fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
plot(ooi_timeA,Proc_GA_OOI_CTD_1500mA_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
hold on
ylabel('depth of OOI mooring [m]')
yyaxis right
h1 = plot(ooi_timeA,Proc_GA_OOI_CTD_1500mA_dep3(:,4),...
    'LineWidth',lw,'Color',Color(cb,:));
h2 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm3_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm6_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startA:time_ind_endA),...
    MITgcm12_OOI_CTD_1500m(time_ind_startA:time_ind_endA,2),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1500m theta at mooring A','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1500mA_window3','-dpng')


fig = figure;
left_color = [0.5 0.5 0.5];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis right
h1 = plot(ooi_timeB,Proc_GA_OOI_CTD_1500mB_dep3(:,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(cb,:));
hold on
h2 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm3_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c3,:));
h3 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm6_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time_MITgcm(time_ind_startB:time_ind_endB),...
    MITgcm12_OOI_CTD_1500m(time_ind_startB:time_ind_endB,4),...
    'LineStyle','-','Marker','none','LineWidth',lw,'Color',Color(c12,:));
ylabel('[C]')
yyaxis left
plot(ooi_timeB,Proc_GA_OOI_CTD_1500mB_dep3(:,8),'LineWidth',lw-1.5,'Color',Color(cbd,:))
ylabel('depth of OOI mooring [m]')
set(gca, 'SortMethod', 'depth')
xticks(xdateswin3)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim(win3coords)
set(gca, 'SortMethod', 'depth')
title('OOI vs MITgcm 1500m theta at mooring B','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1)],'OOI','1/3','1/6','1/12')
acc_movie
acc_plots
hold off
print('OOI_vs_MITgcm_CTD_1500mB_window3','-dpng')

close all
clear MITgcm* Proc*
%%





toc()
