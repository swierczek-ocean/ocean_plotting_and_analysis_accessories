clear
close all
clc
tic()

load PERT_RESPONSE


acc_colors
lw = 2.9;
c3 = 56;
c12 = 57;

dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
    datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
    datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
    datenum('20170501','yyyymmdd')];
dates2 = dates2 - dates2(1);

six_hours = six_hours - six_hours(1);

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_sst3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_sst12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_sst3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_sst12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('SST response to finite wind perturbation [deg C]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_01_SST','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_ssh3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_ssh12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_ssh3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_ssh12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('SSH response to finite wind perturbation [m]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_02_SSH','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_tf3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_tf12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_tf3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_tf12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('heat flux response to finite wind perturbation [W/m^2]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_03_TF','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_cf3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_cf12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_cf3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_cf12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('carbon flux response to finite wind perturbation [mol C/m^2/s]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_04_CF','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_dic3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_dic12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_dic3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_dic12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('surface DIC response to finite wind perturbation [mol C/m^3]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_05_DIC','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_do3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_do12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_do3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_do12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('surface dissolved oxygen response to finite wind perturbation [mol O/m^3]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_06_DO','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_no3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_no12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_no3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_no12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('surface nitrate response to finite wind perturbation [mol N/m^3]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_07_NO','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_mld3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_mld12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_mld3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_mld12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('mixed layer depth response to finite wind perturbation [m]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_08_MLD','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(six_hours,lin_sss3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(six_hours,lin_sss12,'LineWidth',lw,'Color',Color(c12,:));
h3 = plot(six_hours,nonlin_sss3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = plot(six_hours,nonlin_sss12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 120])
xlabel('days')
acc_movie_w
acc_plots
title('surface salinity response to finite wind perturbation [psu]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_09_SSS','-dpng')

close all






toc()