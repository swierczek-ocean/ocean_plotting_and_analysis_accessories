clear
close all
clc
tic()

load ADVr_3
load ADVr_6
load ADVr_12
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
alpha = 0.6;

yfull = [-6000 15];
y500 = [-500 10];
y1000 = [-1000 10];
y250 = [-255 10];

RF3 = RF3(1:52);
RF6 = RF6(1:52);
RF12 = RF12(1:104);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_wvel_3,2)./(1e6),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_wvel_6,2)./(1e6),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_wvel_12,2)./(1e6),RF12,'LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_wvel_3,0,2)./(1e6),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_wvel_6,0,2)./(1e6),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_wvel_12,0,2)./(1e6),RF12,'LineWidth',lw,'Color',Color(c12,:));
h7.Color(4) = alpha;
h8.Color(4) = alpha;
h9.Color(4) = alpha;
h10.Color(4) = alpha;
h11.Color(4) = alpha;
h12.Color(4) = alpha;
yline(0)
xline(0)
ylim([-500 20])
title('mean 2017 vertical volume flux [Sv]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h7(1),h8(1),h9(1)],...
    '1/3 mean','1/6 mean','1/12 mean','1/3 std','1/6 std',...
    '1/12 std','Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_00_VOLUME_500m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_wvel_3,2)./(1e6),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_wvel_6,2)./(1e6),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_wvel_12,2)./(1e6),RF12,'LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_wvel_3,0,2)./(1e6),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_wvel_6,0,2)./(1e6),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_wvel_12,0,2)./(1e6),RF12,'LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-1000 20])
title('mean 2017 vertical volume flux [Sv]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h7(1),h8(1),h9(1)],...
    '1/3 mean','1/6 mean','1/12 mean','1/3 std','1/6 std',...
    '1/12 std','Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_00_VOLUME_1000m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_wvel_3,2)./(1e6),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_wvel_6,2)./(1e6),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_wvel_12,2)./(1e6),RF12,'LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_wvel_3,0,2)./(1e6),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_wvel_6,0,2)./(1e6),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_wvel_12,0,2)./(1e6),RF12,'LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-6000 20])
title('mean 2017 vertical volume flux [Sv]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h7(1),h8(1),h9(1)],...
    '1/3 mean','1/6 mean','1/12 mean','1/3 std','1/6 std',...
    '1/12 std','Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_00_VOLUME_FULL','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_heat_adv_3,2)./(1e15),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_adv_6,2)./(1e15),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_adv_12,2)./(1e15),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_heat_dif_3,2)./(1e15),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_heat_dif_6,2)./(1e15),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_heat_dif_12,2)./(1e15),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_heat_adv_3,0,2)./(1e15),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_heat_adv_6,0,2)./(1e15),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_heat_adv_12,0,2)./(1e15),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_heat_dif_3,0,2)./(1e15),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_heat_dif_6,0,2)./(1e15),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_heat_dif_12,0,2)./(1e15),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-500 20])
title('mean 2017 vertical heat flux [PW]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_heat_adv_3,2)./(1e15),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_adv_6,2)./(1e15),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_adv_12,2)./(1e15),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_heat_dif_3,2)./(1e15),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_heat_dif_6,2)./(1e15),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_heat_dif_12,2)./(1e15),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_heat_adv_3,0,2)./(1e15),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_heat_adv_6,0,2)./(1e15),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_heat_adv_12,0,2)./(1e15),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_heat_dif_3,0,2)./(1e15),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_heat_dif_6,0,2)./(1e15),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_heat_dif_12,0,2)./(1e15),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-1000 20])
title('mean 2017 vertical heat flux [PW]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_1000m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_heat_adv_3,2)./(1e15),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_heat_adv_6,2)./(1e15),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_heat_adv_12,2)./(1e15),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_heat_dif_3,2)./(1e15),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_heat_dif_6,2)./(1e15),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_heat_dif_12,2)./(1e15),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_heat_adv_3,0,2)./(1e15),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_heat_adv_6,0,2)./(1e15),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_heat_adv_12,0,2)./(1e15),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_heat_dif_3,0,2)./(1e15),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_heat_dif_6,0,2)./(1e15),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_heat_dif_12,0,2)./(1e15),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-6000 20])
title('mean 2017 vertical heat flux [PW]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_01_HEAT_FULL','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_salt_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_salt_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_salt_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_salt_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_salt_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_salt_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_salt_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_salt_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_salt_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_salt_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-500 20])
title('mean 2017 vertical salt flux [kg/s]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_salt_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_salt_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_salt_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_salt_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_salt_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_salt_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_salt_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_salt_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_salt_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_salt_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-1000 20])
title('mean 2017 vertical salt flux [kg/s]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_1000m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_salt_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_salt_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_salt_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_salt_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_salt_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_salt_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_salt_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_salt_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_salt_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_salt_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_salt_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_salt_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-6000 20])
title('mean 2017 vertical salt flux [kg/s]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_02_SALT_FULL','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_carbon_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_carbon_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_carbon_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_carbon_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_carbon_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_carbon_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_carbon_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_carbon_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_carbon_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_carbon_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-500 20])
title('mean 2017 vertical carbon flux [Gt C/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_03_DIC_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_carbon_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_carbon_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_carbon_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_carbon_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_carbon_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_carbon_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_carbon_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_carbon_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_carbon_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_carbon_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-1000 20])
title('mean 2017 vertical carbon flux [Gt C/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_03_DIC_1000m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_carbon_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_carbon_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_carbon_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_carbon_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_carbon_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_carbon_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_carbon_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_carbon_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_carbon_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_carbon_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_carbon_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_carbon_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-6000 20])
title('mean 2017 vertical carbon flux [Gt C/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_03_DIC_FULL','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_oxygen_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_oxygen_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_oxygen_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_oxygen_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_oxygen_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_oxygen_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_oxygen_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_oxygen_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_oxygen_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_oxygen_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-500 20])
title('mean 2017 vertical oxygen flux [Gt O/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_04_O2_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_oxygen_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_oxygen_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_oxygen_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_oxygen_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_oxygen_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_oxygen_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_oxygen_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_oxygen_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_oxygen_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_oxygen_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-1000 20])
title('mean 2017 vertical oxygen flux [Gt O/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_04_O2_1000m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_oxygen_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_oxygen_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_oxygen_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_oxygen_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_oxygen_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_oxygen_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_oxygen_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_oxygen_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_oxygen_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_oxygen_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_oxygen_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_oxygen_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-6000 20])
title('mean 2017 vertical oxygen flux [Gt O/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_04_O2_FULL','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_nitrate_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_nitrate_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_nitrate_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_nitrate_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_nitrate_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_nitrate_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_nitrate_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_nitrate_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_nitrate_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_nitrate_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-500 20])
title('mean 2017 vertical nitrate flux [Gt N/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_05_NO3_500m','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_nitrate_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_nitrate_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_nitrate_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_nitrate_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_nitrate_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_nitrate_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_nitrate_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_nitrate_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_nitrate_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_nitrate_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-1000 20])
title('mean 2017 vertical nitrate flux [Gt N/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_05_NO3_1000m','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(mean(vert_nitrate_adv_3,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(mean(vert_nitrate_adv_6,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(mean(vert_nitrate_adv_12,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(mean(vert_nitrate_dif_3,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(mean(vert_nitrate_dif_6,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(mean(vert_nitrate_dif_12,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(std(vert_nitrate_adv_3,0,2),RF3,'LineWidth',lw,'Color',Color(c3,:));
h8 = plot(std(vert_nitrate_adv_6,0,2),RF6,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(std(vert_nitrate_adv_12,0,2),RF12,'LineWidth',lw,'Color',Color(c12,:));
h10 = plot(std(vert_nitrate_dif_3,0,2),RC3,'-.','LineWidth',lw,'Color',Color(c3,:));
h11 = plot(std(vert_nitrate_dif_6,0,2),RC6,'-.','LineWidth',lw,'Color',Color(c6,:));
h12 = plot(std(vert_nitrate_dif_12,0,2),RC12,'-.','LineWidth',lw,'Color',Color(c12,:));
yline(0)
xline(0)
ylim([-6000 20])
title('mean 2017 vertical nitrate flux [Gt N/yr]','FontWeight','Normal','FontSize',18)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1),h10(1),h11(1),h12(1)],...
    '1/3 mean adv','1/6 mean adv','1/12 mean adv','1/3 mean diff',...
    '1/6 mean diff','1/12 mean diff','1/3 std adv','1/6 std adv',...
    '1/12 std adv','1/3 std diff','1/6 std diff','1/12 std diff',...
    'Location','southeast')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('-r200','VERT_FLX/AB_VERTFLX_05_NO3_FULL','-dpng')

toc()

