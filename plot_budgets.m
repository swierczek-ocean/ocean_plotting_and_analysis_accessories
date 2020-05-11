clear
close all
clc
tic()
 
acc_settings

load SO3_BUDGETS TFLUX_TS* CFLUX_TS*
load SO6_BUDGETS TFLUX_TS* CFLUX_TS*
load SO12_BUDGETS TFLUX_TS* CFLUX_TS*

%%
lw = 2.2;
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

time = datenum('20161201','yyyymmdd'):datenum('20171230','yyyymmdd');
%%

%% surface fluxes
figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,TFLUX_TS3,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,TFLUX_TS6,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,TFLUX_TS12,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[W]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin total heat flux','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/MITgcm_SurfTFLUX','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,CFLUX_TS3.*1.0368,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,CFLUX_TS6.*1.0368,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,CFLUX_TS12.*1.0368,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[Mg C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin total carbon flux','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/MITgcm_SurfCFLUX','-dpng')

clear CFLUX_TS* TFLUX_TS*
%%

%% boundary carbon fluxes
load SO3_BUDGETS DIC3* YC3* XC3* RC3
load SO6_BUDGETS DIC6* YC6* XC6* RC6
load SO12_BUDGETS DIC12* YC12* XC12* RC12
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3
RC3 = squeeze(RC3);
RC6 = squeeze(RC6);
RC12 = squeeze(RC12);
option = 1;
lwc = 1.6;

[YC3e,RC3e] = ndgrid(YC3e,RC3);
[YC6e,RC6e] = ndgrid(YC6e,RC6);
[YC12e,RC12e] = ndgrid(YC12e,RC12);

cm = acc_colormap('cmo_balance');
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(DIC3E,...
    DIC3E,DIC6E,DIC12E,option);
nlvls = 41;
DIC3E(DIC3E==0) = NaN;
DIC6E(DIC6E==0) = NaN;
DIC12E(DIC12E==0) = NaN;

DIC3Eavg = mean(DIC3Ets(2:13));
DIC6Eavg = mean(DIC6Ets(2:13));
DIC12Eavg = mean(DIC12Ets(2:13));


z = linspace(lb,ub,nlvls+1);
coords = [-58.9 -31.79 -5000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(YC3e,RC3e,DIC3E,'LineStyle','none','LevelList',z);
hold on
plot(YC3e,-Depth3(186,7:126),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 10W DIC advective flux [mol C/m*m^3/s]','FontWeight','Normal','FontSize',16)
text(-54,-4300,['mean annual flux: ',num2str(DIC3Eavg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(YC6e,RC6e,DIC6E,'LineStyle','none','LevelList',z);
hold on
plot(YC6e,-Depth6(371,10:249),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(-54,-4300,['mean annual flux: ',num2str(DIC6Eavg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(YC12e,RC12e,DIC12E,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(YC12e,-Depth12(737,18:496),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(-54,-4300,['mean annual flux: ',num2str(DIC12Eavg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s3
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/DICEB','-dpng')

[YC3w,RC3w] = ndgrid(YC3w,RC3);
[YC6w,RC6w] = ndgrid(YC6w,RC6);
[YC12w,RC12w] = ndgrid(YC12w,RC12);

cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(DIC3W,...
    DIC3W,DIC6W,DIC12W,option);
nlvls = 41;
DIC3W(DIC3W==0) = NaN;
DIC6W(DIC6W==0) = NaN;
DIC12W(DIC12W==0) = NaN;

DIC3Wavg = mean(DIC3Wts(2:13));
DIC6Wavg = mean(DIC6Wts(2:13));
DIC12Wavg = mean(DIC12Wts(2:13));


z = linspace(lb,ub,nlvls+1);
coords = [-58.9 -54 -5000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(YC3w,RC3w,DIC3W,'LineStyle','none','LevelList',z);
hold on
plot(YC3w,-Depth3(6,7:126),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 70W DIC advective flux [mol C/m*m^3/s]','FontWeight','Normal','FontSize',16)
text(-56,-2500,['mean annual flux: ',num2str(DIC3Wavg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(YC6w,RC6w,DIC6W,'LineStyle','none','LevelList',z);
hold on
plot(YC6w,-Depth6(11,10:249),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(-56,-2500,['mean annual flux: ',num2str(DIC6Wavg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(YC12w,RC12w,DIC12W,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(YC12w,-Depth12(17,18:496),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(-56,-2500,['mean annual flux: ',num2str(DIC12Wavg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s4
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/DICWB','-dpng')

[XC3s,RC3s] = ndgrid(XC3s,RC3);
[XC6s,RC6s] = ndgrid(XC6s,RC6);
[XC12s,RC12s] = ndgrid(XC12s,RC12);

cm = acc_colormap('cmo_balance');
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(DIC3S,...
    DIC3S,DIC6S,DIC12S,option);
nlvls = 41;
DIC3S(DIC3S==0) = NaN;
DIC6S(DIC6S==0) = NaN;
DIC12S(DIC12S==0) = NaN;

DIC3Savg = mean(DIC3Sts(2:13));
DIC6Savg = mean(DIC6Sts(2:13));
DIC12Savg = mean(DIC12Sts(2:13));


z = linspace(lb,ub,nlvls+1);
coords = [290.2 349.8 -6000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(XC3s,RC3s,DIC3S,'LineStyle','none','LevelList',z);
hold on
plot(XC3s,-Depth3(6:185,7),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-5000 -4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 59S DIC advective flux [mol C/m*m^3/s]','FontWeight','Normal','FontSize',16)
text(315,-5000,['mean annual flux: ',num2str(DIC3Savg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(XC6s,RC6s,DIC6S,'LineStyle','none','LevelList',z);
hold on
plot(XC6s,-Depth6(11:370,10),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-5000 -4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(315,-5000,['mean annual flux: ',num2str(DIC6Savg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(XC12s,RC12s,DIC12S,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(XC12s,-Depth12(17:736,18),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-5000 -4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(315,-5000,['mean annual flux: ',num2str(DIC12Savg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s3
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/DICSB','-dpng')

[XC3n,RC3n] = ndgrid(XC3n,RC3);
[XC6n,RC6n] = ndgrid(XC6n,RC6);
[XC12n,RC12n] = ndgrid(XC12n,RC12);

cm = acc_colormap('cmo_balance');
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(DIC3N,...
    DIC3N,DIC6N,DIC12N,option);
nlvls = 41;
DIC3N(DIC3N==0) = NaN;
DIC6N(DIC6N==0) = NaN;
DIC12N(DIC12N==0) = NaN;

DIC3Navg = mean(DIC3Nts(2:13));
DIC6Navg = mean(DIC6Nts(2:13));
DIC12Navg = mean(DIC12Nts(2:13));


z = linspace(lb,ub,nlvls+1);
coords = [305 349.8 -5000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(XC3n,RC3n,DIC3N,'LineStyle','none','LevelList',z);
hold on
plot(XC3n,-Depth3(6:185,127),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 32S DIC advective flux [mol C/m*m^3/s]','FontWeight','Normal','FontSize',16)
text(306,-4350,['mean annual flux: ',num2str(DIC3Navg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(XC6n,RC6n,DIC6N,'LineStyle','none','LevelList',z);
hold on
plot(XC6n,-Depth6(11:370,250),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(306,-4350,['mean annual flux: ',num2str(DIC6Navg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(XC12n,RC12n,DIC12N,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(XC12n,-Depth12(17:736,497),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(306,-4350,['mean annual flux: ',num2str(DIC12Navg,4),' mol C m^2/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s3
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/DICNB','-dpng')

clear DIC*
%%

%% boundary heat fluxes
load SO3_BUDGETS THETA3* YC3* XC3* RC3
load SO6_BUDGETS THETA6* YC6* XC6* RC6
load SO12_BUDGETS THETA12* YC12* XC12* RC12
load XY12 Depth12
load XY6 Depth6
load XY3 Depth3
RC3 = squeeze(RC3);
RC6 = squeeze(RC6);
RC12 = squeeze(RC12);
option = 1;
lwc = 1.6;

[YC3e,RC3e] = ndgrid(YC3e,RC3);
[YC6e,RC6e] = ndgrid(YC6e,RC6);
[YC12e,RC12e] = ndgrid(YC12e,RC12);

cm = acc_colormap('cmo_balance');
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA3E,...
    THETA3E,THETA6E,THETA12E,option);
nlvls = 41;
THETA3E(THETA3E==0) = NaN;
THETA6E(THETA6E==0) = NaN;
THETA12E(THETA12E==0) = NaN;

THETA3Eavg = mean(THETA3Ets(2:13));
THETA6Eavg = mean(THETA6Ets(2:13));
THETA12Eavg = mean(THETA12Ets(2:13));


z = linspace(lb,ub,nlvls+1);
coords = [-58.9 -31.79 -5000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(YC3e,RC3e,THETA3E,'LineStyle','none','LevelList',z);
hold on
plot(YC3e,-Depth3(186,7:126),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 10W pot temp advective flux [deg C m^3/s]','FontWeight','Normal','FontSize',16)
text(-54,-4300,['mean annual flux: ',num2str(THETA3Eavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(YC6e,RC6e,THETA6E,'LineStyle','none','LevelList',z);
hold on
plot(YC6e,-Depth6(371,10:249),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(-54,-4300,['mean annual flux: ',num2str(THETA6Eavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(YC12e,RC12e,THETA12E,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(YC12e,-Depth12(737,18:496),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(-54,-4300,['mean annual flux: ',num2str(THETA12Eavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s3
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/THETAEB','-dpng')

[YC3w,RC3w] = ndgrid(YC3w,RC3);
[YC6w,RC6w] = ndgrid(YC6w,RC6);
[YC12w,RC12w] = ndgrid(YC12w,RC12);

cm = acc_colormap('cmo_balance');

[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA3W,...
    THETA3W,THETA6W,THETA12W,option);
nlvls = 41;
THETA3W(THETA3W==0) = NaN;
THETA6W(THETA6W==0) = NaN;
THETA12W(THETA12W==0) = NaN;

THETA3Wavg = mean(THETA3Wts(2:13));
THETA6Wavg = mean(THETA6Wts(2:13));
THETA12Wavg = mean(THETA12Wts(2:13));


z = linspace(lb,ub,nlvls+1);
coords = [-58.9 -54 -5000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(YC3w,RC3w,THETA3W,'LineStyle','none','LevelList',z);
hold on
plot(YC3w,-Depth3(6,7:126),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 70W pot temp advective flux [deg C m^3/s]','FontWeight','Normal','FontSize',16)
text(-56,-2500,['mean annual flux: ',num2str(THETA3Wavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(YC6w,RC6w,THETA6W,'LineStyle','none','LevelList',z);
hold on
plot(YC6w,-Depth6(11,10:249),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(-56,-2500,['mean annual flux: ',num2str(THETA6Wavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(YC12w,RC12w,THETA12W,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(YC12w,-Depth12(17,18:496),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(-56,-2500,['mean annual flux: ',num2str(THETA12Wavg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s4
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/THETAWB','-dpng')

[XC3s,RC3s] = ndgrid(XC3s,RC3);
[XC6s,RC6s] = ndgrid(XC6s,RC6);
[XC12s,RC12s] = ndgrid(XC12s,RC12);

cm = acc_colormap('cmo_balance');
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA3S,...
    THETA3S,THETA6S,THETA12S,option);
nlvls = 41;
THETA3S(THETA3S==0) = NaN;
THETA6S(THETA6S==0) = NaN;
THETA12S(THETA12S==0) = NaN;

THETA3Savg = mean(THETA3Sts(2:13));
THETA6Savg = mean(THETA6Sts(2:13));
THETA12Savg = mean(THETA12Sts(2:13));


z = linspace(lb,ub,nlvls+1);
coords = [290.2 349.8 -6000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(XC3s,RC3s,THETA3S,'LineStyle','none','LevelList',z);
hold on
plot(XC3s,-Depth3(6:185,7),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-5000 -4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 59S pot temp advective flux [deg C m^3/s]','FontWeight','Normal','FontSize',16)
text(315,-5000,['mean annual flux: ',num2str(THETA3Savg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(XC6s,RC6s,THETA6S,'LineStyle','none','LevelList',z);
hold on
plot(XC6s,-Depth6(11:370,10),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-5000 -4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(315,-5000,['mean annual flux: ',num2str(THETA6Savg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(XC12s,RC12s,THETA12S,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(XC12s,-Depth12(17:736,18),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-5000 -4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(315,-5000,['mean annual flux: ',num2str(THETA12Savg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s3
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/THETASB','-dpng')

[XC3n,RC3n] = ndgrid(XC3n,RC3);
[XC6n,RC6n] = ndgrid(XC6n,RC6);
[XC12n,RC12n] = ndgrid(XC12n,RC12);

cm = acc_colormap('cmo_balance');
[lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance_alt(THETA3N,...
    THETA3N,THETA6N,THETA12N,option);
nlvls = 41;
THETA3N(THETA3N==0) = NaN;
THETA6N(THETA6N==0) = NaN;
THETA12N(THETA12N==0) = NaN;

THETA3Navg = mean(THETA3Nts(2:13));
THETA6Navg = mean(THETA6Nts(2:13));
THETA12Navg = mean(THETA12Nts(2:13));


z = linspace(lb,ub,nlvls+1);
coords = [305 349.8 -5000 0];

figure()
set(gcf, 'Position', [1, 1, 2000, 1500])
colormap(cm)

ax2 = subplot(3,1,1);
contourf(XC3n,RC3n,THETA3N,'LineStyle','none','LevelList',z);
hold on
plot(XC3n,-Depth3(6:185,127),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/3')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
title('MITgcm+BLING mean 2017 32S pot temp advective flux [deg C m^3/s]','FontWeight','Normal','FontSize',16)
text(306,-4350,['mean annual flux: ',num2str(THETA3Navg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s1
hold off

ax3 = subplot(3,1,2);
contourf(XC6n,RC6n,THETA6N,'LineStyle','none','LevelList',z);
hold on
plot(XC6n,-Depth6(11:370,250),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/6')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
text(306,-4350,['mean annual flux: ',num2str(THETA6Navg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s2
hold off

ax4 = subplot(3,1,3);
contourf(XC12n,RC12n,THETA12N,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbcb ubcb]);
plot(XC12n,-Depth12(17:736,497),'Color','k','LineWidth',lwc)
caxis([lb ub])
axis(coords)
ylabel('1/12')
yticks([-4000 -3000 -2000 -1000 0])
set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
xtickformat('degrees')
text(306,-4350,['mean annual flux: ',num2str(THETA12Navg,4),' deg C m^3/s'],...
    'FontSize',14,'Color','w')
acc_movie
acc_tri_plots_s3
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/THETANB','-dpng')
clear THETA*

close all
%%

%% avg surface temp & DIC
load SO3_BUDGETS *Series9m *Series100m
load SO6_BUDGETS *Series9m *Series100m
load SO12_BUDGETS *Series9m *Series100m

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,THETA3_Series9m,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,THETA6_Series9m,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,THETA12_Series9m,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[deg C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin mean temp of top 9m','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/MITgcm_TEMP9m','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,THETA3_Series100m,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,THETA6_Series100m,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,THETA12_Series100m,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[deg C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin mean temp of top 100m','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/MITgcm_TEMP100m','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,DIC3_Series9m,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,DIC6_Series9m,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,DIC12_Series9m,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[mol C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin total DIC of top 9m','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/MITgcm_DIC9m','-dpng')

figure;
set(gcf, 'Position', [1, 1, 1600, 900])
h2 = plot(time,DIC3_Series100m,'LineWidth',lw,'Color',Color(c3,:));
hold on
h3 = plot(time,DIC6_Series100m,'LineWidth',lw,'Color',Color(c6,:));
h4 = plot(time,DIC12_Series100m,'LineWidth',lw,'Color',Color(c12,:));
ylabel('[mol C]')
xticks(xdatesfull)
dateFormat = 'mm/dd/yy';
datetick('x',dateFormat,'keepticks')
xtickangle(45)
xlim([xdatesfull(1) xdatesfull(end)])
title('MITgcm Argentine Basin total DIC of top 100m','FontWeight','Normal','FontSize',18)
legend([h2(1),h3(1),h4(1)],'1/3','1/6','1/12')
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off'); print('BUDGET_PLOTS/MITgcm_DIC100m','-dpng')
%%




toc()