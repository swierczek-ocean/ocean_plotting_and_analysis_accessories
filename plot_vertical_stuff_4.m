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
alpha = 0.8;
%%

load wvel3m
load wvel6m
load wvel12m
RF3 = RF3(1:52);
RF6 = RF6(1:52);
RF12 = RF12(1:104);

%% plot
yfull = [-6000 15];
y500 = [-500 10];
y1000 = [-1000 10];
y250 = [-255 10];

%% wvel

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(vert_wvel_3(:,1),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,1),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,1),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Jan 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(vert_wvel_3(:,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Feb 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylim(y500)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','wvel_plots/wvel_01','-dpng')

close all


figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(vert_wvel_3(:,3),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,3),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,3),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Mar 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(vert_wvel_3(:,4),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,4),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,4),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Apr 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylim(y500)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','wvel_plots/wvel_02','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(vert_wvel_3(:,5),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,5),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,5),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity May 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(vert_wvel_3(:,6),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,6),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,6),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Jun 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylim(y500)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','wvel_plots/wvel_03','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(vert_wvel_3(:,7),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,7),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,7),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Jul 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(vert_wvel_3(:,8),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,8),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,8),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Aug 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylim(y500)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','wvel_plots/wvel_04','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(vert_wvel_3(:,9),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,9),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,9),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Sep 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(vert_wvel_3(:,10),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,10),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,10),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Oct 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylim(y500)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','wvel_plots/wvel_05','-dpng')

close all

figure()
set(gcf, 'Position', [1, 1, 1600, 900])


subplot(1,2,1)
h7 = plot(vert_wvel_3(:,11),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,11),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,11),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Nov 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylabel('depth [m]')
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(vert_wvel_3(:,12),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(vert_wvel_6(:,12),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(vert_wvel_12(:,12),RF12,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
grid on
title('mean vertical velocity Dec 2017','FontWeight','Normal','FontSize',24)
xlabel('[cm/day]')
ylim(y500)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','wvel_plots/wvel_06','-dpng')

close all





clear

toc()