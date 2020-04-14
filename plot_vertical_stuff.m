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
load vert_eddy
load vert_eddy_2
load vert_stuff
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
h1 = plot(w3tv,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(w6tv,RC,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(w12tv,RC,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(eddy3tv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(eddy6tv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(eddy12tv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(eddy3tv,RC,':','LineWidth',lw,'Color',Color(c3,:));
h8 = plot(eddy6tv,RC,':','LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12tv,RC,':','LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C m/s]')
ylabel('depth [m]')
% xlim([-0.5 11.5])
ylim(y250)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
'1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
'1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>',...
'1/3 <w''theta''>','1/6 <w''theta''>','1/12 <w''theta''>',...
'FontSize',12,'Location','best')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(w3cv,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(w6cv,RC,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(w12cv,RC,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(eddy3cv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(eddy6cv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(eddy12cv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(eddy3cv,RC,':','LineWidth',lw,'Color',Color(c3,:));
h8 = plot(eddy6cv,RC,':','LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12cv,RC,':','LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3 m/s]')
% xlim([-0.1 2])
ylim(y250)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
'1/3 <w*DIC>','1/6 <w*DIC>','1/12 <w*DIC>',...
'1/3 <w><DIC>','1/6 <w><DIC>','1/12 <w><DIC>',...
'1/3 <w''DIC''>','1/6 <w''DIC''>','1/12 <w''DIC''>',...
'FontSize',12,'Location','best')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_eddy/mean_vert_stuff_250','-dpng')







figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(w3tv,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(w6tv,RC,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(w12tv,RC,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(eddy3tv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(eddy6tv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(eddy12tv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(eddy3tv,RC,':','LineWidth',lw,'Color',Color(c3,:));
h8 = plot(eddy6tv,RC,':','LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12tv,RC,':','LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C m/s]')
ylabel('depth [m]')
% xlim([-0.5 11.5])
ylim(y500)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
'1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
'1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>',...
'1/3 <w''theta''>','1/6 <w''theta''>','1/12 <w''theta''>',...
'FontSize',12,'Location','best')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(w3cv,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(w6cv,RC,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(w12cv,RC,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(eddy3cv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(eddy6cv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(eddy12cv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(eddy3cv,RC,':','LineWidth',lw,'Color',Color(c3,:));
h8 = plot(eddy6cv,RC,':','LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12cv,RC,':','LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3 m/s]')
% xlim([-0.1 2])
ylim(y500)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
'1/3 <w*DIC>','1/6 <w*DIC>','1/12 <w*DIC>',...
'1/3 <w><DIC>','1/6 <w><DIC>','1/12 <w><DIC>',...
'1/3 <w''DIC''>','1/6 <w''DIC''>','1/12 <w''DIC''>',...
'FontSize',12,'Location','best')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_eddy/mean_vert_stuff_500','-dpng')



figure()
set(gcf, 'Position', [1, 1, 1600, 900])
subplot(1,2,1)
h1 = plot(w3tv,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(w6tv,RC,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(w12tv,RC,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(eddy3tv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(eddy6tv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(eddy12tv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(eddy3tv,RC,':','LineWidth',lw,'Color',Color(c3,:));
h8 = plot(eddy6tv,RC,':','LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12tv,RC,':','LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical heat transport','FontWeight','Normal','FontSize',24)
xlabel('[deg C m/s]')
ylabel('depth [m]')
% xlim([-0.5 11.5])
ylim(y1000)
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
'1/3 <w*theta>','1/6 <w*theta>','1/12 <w*theta>',...
'1/3 <w><theta>','1/6 <w><theta>','1/12 <w><theta>',...
'1/3 <w''theta''>','1/6 <w''theta''>','1/12 <w''theta''>',...
'FontSize',12,'Location','best')
acc_movie_w
acc_2plots(1)
hold off

subplot(1,2,2)
h1 = plot(w3cv,RC,'LineWidth',lw,'Color',Color(c3,:));
hold on
h2 = plot(w6cv,RC,'LineWidth',lw,'Color',Color(c6,:));
h3 = plot(w12cv,RC,'LineWidth',lw,'Color',Color(c12,:));
h4 = plot(eddy3cv2,RC,'--','LineWidth',lw,'Color',Color(c3,:));
h5 = plot(eddy6cv2,RC,'--','LineWidth',lw,'Color',Color(c6,:));
h6 = plot(eddy12cv2,RC,'--','LineWidth',lw,'Color',Color(c12,:));
h7 = plot(eddy3cv,RC,':','LineWidth',lw,'Color',Color(c3,:));
h8 = plot(eddy6cv,RC,':','LineWidth',lw,'Color',Color(c6,:));
h9 = plot(eddy12cv,RC,':','LineWidth',lw,'Color',Color(c12,:));
xline(0)
yline(0)
grid on
title('vertical DIC transport','FontWeight','Normal','FontSize',24)
xlabel('[mol C/m^3 m/s]')
% xlim([-0.1 2])
ylim(y1000)
legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],...
'1/3 <w*DIC>','1/6 <w*DIC>','1/12 <w*DIC>',...
'1/3 <w><DIC>','1/6 <w><DIC>','1/12 <w><DIC>',...
'1/3 <w''DIC''>','1/6 <w''DIC''>','1/12 <w''DIC''>',...
'FontSize',12,'Location','best')
acc_movie_w
acc_2plots(2)
hold off

set(gcf,'InvertHardCopy','off');
print('-r300','vert_eddy/mean_vert_stuff_1000','-dpng')