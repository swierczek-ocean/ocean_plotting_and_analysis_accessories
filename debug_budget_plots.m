clear
close all
clc
tic()

lw = 2.5;
load SALT3_budget

t=2; x1=88; y1=84;

fprintf('making 1st salt budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(salttend_calc(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(saltres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1),h4(1)],'tend','mix','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_saltbudget_box_3_1','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd salt budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-salttend_calc(x1,y1,:,t)+saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltres(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_saltbudget_box_3_2','-dpng')

fprintf('making 1st salt budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(salttend_calc(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
h4 = plot(squeeze(saltres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1),h4(1)],'tend','mix','adv','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_saltbudget_box_3_3','-dpng')
% top 150m
% bundle tend and adv into "material derivative"

fprintf('making 2nd salt budget at single point \n')
figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(squeeze(-salttend_calc(x1,y1,:,t)+saltadv(x1,y1,:,t)),RC,'LineWidth',lw);
hold on
h2 = plot(squeeze(saltmix(x1,y1,:,t)),RC,'LineWidth',lw);
h3 = plot(squeeze(saltres1(x1,y1,:,t)),RC,'--k','LineWidth',lw);
ylim([-150 0])
ylabel('depth'); xlabel('psu/s');
legend([h1(1),h2(1),h3(1)],'mat deriv','mix','res')
acc_movie
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','single_saltbudget_box_3_4','-dpng')














toc()