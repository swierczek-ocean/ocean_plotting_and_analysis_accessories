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

%%
load vert_eddy_2
RC = rdmds('../Grids/3/RF');
RC = squeeze(RC(1:52));
%%

%% plot
yfull = [-6000 15];
y500 = [-500 10];
y1000 = [-1000 10];
y250 = [-255 10];



figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h7 = plot(eddy3tv2,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(eddy6tv2,RC,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12tv2,RC,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean <w><theta>','FontWeight','Normal','FontSize',24)
xlabel('[deg C m/s]')
ylabel('depth [m]')
% xlim([-0.5 11.5])
ylim(y250)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(eddy3cv2,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(eddy6cv2,RC,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12cv2,RC,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean <w><DIC>','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3 m/s]')
% xlim([-0.1 2])
ylim(y250)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','northwest')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_eddy/mean_vert_flux_250','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h7 = plot(eddy3tv2,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(eddy6tv2,RC,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12tv2,RC,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean <w><theta>','FontWeight','Normal','FontSize',24)
xlabel('[deg C m/s]')
ylabel('depth [m]')
% xlim([-0.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southwest')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h7 = plot(eddy3cv2,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(eddy6cv2,RC,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12cv2,RC,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean <w><DIC>','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3 m/s]')
% xlim([-0.1 2])
ylim(y500)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','northwest')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_eddy/mean_vert_flux_500','-dpng')


figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h7 = plot(eddy3tv2,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(eddy6tv2,RC,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12tv2,RC,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean <w><theta>','FontWeight','Normal','FontSize',24)
xlabel('[deg C m/s]')
ylabel('depth [m]')
% xlim([-0.5 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','southeast')
acc_movie_w
acc_2plots(1)
hold off
subplot(1,2,2)
h7 = plot(eddy3cv2,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h8 = plot(eddy6cv2,RC,'LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12cv2,RC,'LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('mean <w><DIC>','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3 m/s]')
% xlim([-0.1 2])
ylim(y1000)
legend([h7(1),h8(1),h9(1)],'1/3','1/6',...
    '1/12','FontSize',20,'Location','northwest')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_eddy/mean_vert_flux_1000','-dpng')

toc()