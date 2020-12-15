clear
close all
clc
tic()

load sPERT_RESPONSE *sst* *dic*

slin_dic12 = lin_dic12;
slin_dic3 = lin_dic3;
snonlin_dic12 = nonlin_dic12;
snonlin_dic3 = nonlin_dic3;

slin_sst12 = lin_sst12;
slin_sst3 = lin_sst3;
snonlin_sst12 = nonlin_sst12;
snonlin_sst3 = nonlin_sst3;

load PERT_RESPONSE *sst* *dic* six_hours

%% 

acc_colors
lw = 2.9;
c1 = 75;
c2 = 76;
c3 = 78;
c4 = 79;

dates2 = [datenum('20170101','yyyymmdd'),datenum('20170116','yyyymmdd'),...
    datenum('20170131','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170302','yyyymmdd'),datenum('20170317','yyyymmdd'),...
    datenum('20170401','yyyymmdd'),datenum('20170416','yyyymmdd'),...
    datenum('20170501','yyyymmdd')];
dates2 = dates2 - dates2(1);

six_hours = six_hours - six_hours(1);

figure();
set(gcf, 'Position', [1, 1, 1400, 1000])
subplot(2,1,1)
h1 = semilogy(six_hours,lin_sst3,'LineWidth',lw,'Color',Color(c1,:));
hold on
h2 = semilogy(six_hours,lin_sst12,'LineWidth',lw,'Color',Color(c4,:));
h3 = semilogy(six_hours,nonlin_sst3,':','LineWidth',lw,'Color',Color(c1,:));
h4 = semilogy(six_hours,nonlin_sst12,':','LineWidth',lw,'Color',Color(c4,:));
h5 = semilogy(six_hours,slin_sst3,'LineWidth',lw,'Color',Color(c2,:));
h6 = semilogy(six_hours,slin_sst12,'LineWidth',lw,'Color',Color(c3,:));
h7 = semilogy(six_hours,snonlin_sst3,':','LineWidth',lw,'Color',Color(c2,:));
h8 = semilogy(six_hours,snonlin_sst12,':','LineWidth',lw,'Color',Color(c3,:));
h9 = plot(1:10,NaN.*ones(10,1),'w');
h10 = plot(11:20,NaN.*ones(10,1),'w');
h11 = plot(11:20,NaN.*ones(10,1),'w');
h12 = plot(11:20,NaN.*ones(10,1),'w');
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
xlim([0 110])
ylim([5e-11 6e-7])
acc_movie_wh
acc_2_stack(1)
title('SST response to wind perturbation [deg C]','FontWeight','Normal','FontSize',20)
legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
    'large area','perturbation',...
    '1/3 linear','1/12 linear','1/3 nonlinear','1/12 nonlinear',...
    'small area','perturbation',...
    '1/3 linear','1/12 linear','1/3 nonlinear','1/12 nonlinear',...
    'Location','eastoutside','FontSize',16)
hold off

subplot(2,1,2)
h1 = semilogy(six_hours,1000000.*lin_dic3,'LineWidth',lw,'Color',Color(c1,:));
hold on
h2 = semilogy(six_hours,1000000.*lin_dic12,'LineWidth',lw,'Color',Color(c4,:));
h3 = semilogy(six_hours,1000000.*nonlin_dic3,':','LineWidth',lw,'Color',Color(c1,:));
h4 = semilogy(six_hours,1000000.*nonlin_dic12,':','LineWidth',lw,'Color',Color(c4,:));
h5 = semilogy(six_hours,1000000.*slin_dic3,'LineWidth',lw,'Color',Color(c2,:));
h6 = semilogy(six_hours,1000000.*slin_dic12,'LineWidth',lw,'Color',Color(c3,:));
h7 = semilogy(six_hours,1000000.*snonlin_dic3,':','LineWidth',lw,'Color',Color(c2,:));
h8 = semilogy(six_hours,1000000.*snonlin_dic12,':','LineWidth',lw,'Color',Color(c3,:));
h9 = plot(1:10,NaN.*ones(10,1),'w');
h10 = plot(11:20,NaN.*ones(10,1),'w');
h11 = plot(11:20,NaN.*ones(10,1),'w');
h12 = plot(11:20,NaN.*ones(10,1),'w');
grid on
ax = gca;
ax.GridAlpha = 1;
xticks(dates2)
xlabel('days')
xlim([0 110])
ylim([4e-7 0.006])
acc_movie_wh
acc_2_stack(2)
title('surface DIC response to wind perturbation [\mumol C/m^3]','FontWeight','Normal','FontSize',20)
legend([h9(1),h10(1),h1(1),h2(1),h3(1),h4(1),h11(1),h12(1),h5(1),h6(1),h7(1),h8(1)],...
    'large area','perturbation',...
    '1/3 linear','1/12 linear','1/3 nonlinear','1/12 nonlinear',...
    'small area','perturbation',...
    '1/3 linear','1/12 linear','1/3 nonlinear','1/12 nonlinear',...
    'Location','eastoutside','FontSize',16)
hold off



set(gcf,'InvertHardCopy','off'); 
print('-r200','plots/double_plot_SST_DIC','-dpng')




toc()