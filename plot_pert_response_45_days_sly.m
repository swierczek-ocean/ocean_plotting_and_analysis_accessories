clear
close all
clc
tic()

load PERT_RESPONSE


lin_sss12(123) = NaN;
nonlin_sss12(123) = NaN;
lin_dic12(123) = NaN;
nonlin_dic12(123) = NaN;
lin_no12(123) = NaN;
nonlin_no12(123) = NaN;
lin_do12(123) = NaN;
nonlin_do12(123) = NaN;
lin_ssh12(123) = NaN;
nonlin_ssh12(123) = NaN;
lin_sst12(123) = NaN;
nonlin_sst12(123) = NaN;
lin_mld12(123) = NaN;
nonlin_mld12(123) = NaN;
lin_tf12(123) = NaN;
nonlin_tf12(123) = NaN;
lin_cf12(123) = NaN;
nonlin_cf12(123) = NaN;


acc_colors
lw = 2.9;
c3 = 56;
c12 = 57;

dates2 = [datenum('20170101','yyyymmdd'),datenum('20170106','yyyymmdd'),...
    datenum('20170111','yyyymmdd'),datenum('20170116','yyyymmdd'),...
    datenum('20170121','yyyymmdd'),datenum('20170126','yyyymmdd'),...
    datenum('20170131','yyyymmdd'),datenum('20170205','yyyymmdd'),...
    datenum('20170210','yyyymmdd'),datenum('20170216','yyyymmdd')];
dates2 = dates2 - dates2(1);

six_hours = six_hours - six_hours(1);

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_sst3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_sst12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_sst3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_sst12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('SST response to finite wind perturbation [deg C]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_01_SST','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_ssh3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_ssh12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_ssh3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_ssh12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('SSH response to finite wind perturbation [m]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_02_SSH','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_tf3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_tf12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_tf3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_tf12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('heat flux response to finite wind perturbation [W/m^2]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_03_TF','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_cf3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_cf12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_cf3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_cf12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('carbon flux response to finite wind perturbation [mol C/m^2/s]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_04_CF','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_dic3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_dic12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_dic3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_dic12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('surface DIC response to finite wind perturbation [mol C/m^3]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_05_DIC','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_do3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_do12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_do3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_do12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('surface dissolved oxygen response to finite wind perturbation [mol O/m^3]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_06_DO','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_no3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_no12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_no3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_no12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('surface nitrate response to finite wind perturbation [mol N/m^3]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_07_NO','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_mld3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_mld12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_mld3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_mld12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('mixed layer depth response to finite wind perturbation [m]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_08_MLD','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(six_hours,lin_sss3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = semilogy(six_hours,lin_sss12,'LineWidth',lw,'Color',Color(c12,:));
h3 = semilogy(six_hours,nonlin_sss3,'--','LineWidth',lw,'Color',Color(c3,:));
h4 = semilogy(six_hours,nonlin_sss12,'--','LineWidth',lw,'Color',Color(c12,:));
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
% dateFormat = 'mmm dd';
% datetick('x',dateFormat,'keepticks')
xlim([0 47])
xlabel('days')
acc_movie_wh
acc_plots
title('surface salinity response to finite wind perturbation [psu]','FontWeight','Normal','FontSize',20)
legend([h1(1),h2(1),h3(1),h4(1)],...
    '1/3 linear','1/12 linear','1/3 nonlinear',...
    '1/12 nonlinear','Location','eastoutside','FontSize',16)
hold off
set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/pert_response_45_sly_09_SSS','-dpng')

close all






toc()