clear
close all
clc

tic()

%% initial stuff

acc_colors
set(0,'DefaultFigureVisible','on')

close all

hour_time = datenum('031515','mmddyy'):(1/24):datenum('012018','mmddyy');
hour_time = hour_time';

xdatesfull = [datenum('030115','mmddyy'),datenum('040115','mmddyy'),...
    datenum('050115','mmddyy'),...
    datenum('060115','mmddyy'),datenum('070115','mmddyy'),...
    datenum('080115','mmddyy'),datenum('090115','mmddyy'),...
    datenum('100115','mmddyy'),datenum('110115','mmddyy'),...
    datenum('120115','mmddyy'),datenum('010116','mmddyy'),...
    datenum('020116','mmddyy'),datenum('030116','mmddyy'),...
    datenum('040116','mmddyy'),datenum('050116','mmddyy'),...
    datenum('060116','mmddyy'),datenum('070116','mmddyy'),...
    datenum('080116','mmddyy'),datenum('090116','mmddyy'),...
    datenum('100116','mmddyy'),datenum('110116','mmddyy'),...
    datenum('120116','mmddyy'),datenum('010117','mmddyy'),...
    datenum('020117','mmddyy'),datenum('030117','mmddyy'),...
    datenum('040117','mmddyy'),datenum('050117','mmddyy'),...
    datenum('060117','mmddyy'),datenum('070117','mmddyy'),...
    datenum('080117','mmddyy'),datenum('090117','mmddyy'),...
    datenum('100117','mmddyy'),datenum('110117','mmddyy'),...
    datenum('120117','mmddyy'),datenum('010118','mmddyy'),...
    datenum('020118','mmddyy')];
ct = 52;
cd = 53;
cm = 54;
lwt = 1.1;
lwd = 1.2;
ms = 5;

cth = 79;
cdh = 58;

Color(cdh,:) = [127;191;123]/255;
% Color(cth,:) = [179;145;199]/255;
Color(cth,:) = 1.1.*Color(cth,:);


%% 30m

load GA_OOI_CTD_30mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_30mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_30mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_30mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_30mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_30mA_dep123(:,1),GA_OOI_CTD_30mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_30mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_30mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_30mA_dep123(:,1),GA_OOI_CTD_30mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 30m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_30mA_dep123(1,1) GA_OOI_CTD_30mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/30m/AB_OOI_Mooring_THETA_30m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_30mA_dep123(:,1),GA_OOI_CTD_30mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_30mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_30mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_30mA_dep123(:,1),GA_OOI_CTD_30mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33 36])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 30m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_30mA_dep123(1,1) GA_OOI_CTD_30mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/30m/AB_OOI_Mooring_SALT_30m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_30mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 30m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/30m/AB_OOI_Mooring_THETA_30m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring A 30m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/30m/AB_OOI_Mooring_SALT_30m_A_hourly','-dpng')



load GA_OOI_CTD_30mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_30mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_30mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_30mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_30mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_30mB_dep123(:,1),GA_OOI_CTD_30mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_30mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_30mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_30mB_dep123(:,1),GA_OOI_CTD_30mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 30m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_30mB_dep123(1,1) GA_OOI_CTD_30mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/30m/AB_OOI_Mooring_THETA_30m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_30mB_dep123(:,1),GA_OOI_CTD_30mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_30mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_30mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_30mB_dep123(:,1),GA_OOI_CTD_30mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 30m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_30mB_dep123(1,1) GA_OOI_CTD_30mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/30m/AB_OOI_Mooring_SALT_30m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_30mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 30m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/30m/AB_OOI_Mooring_THETA_30m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 30m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/30m/AB_OOI_Mooring_SALT_30m_B_hourly','-dpng')


close all
%% 30m


%% 40m
load GA_OOI_CTD_40mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_40mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_40mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_40mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_40mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_40mA_dep123(:,1),GA_OOI_CTD_40mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_40mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_40mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_40mA_dep123(:,1),GA_OOI_CTD_40mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 40m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_40mA_dep123(1,1) GA_OOI_CTD_40mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/40m/AB_OOI_Mooring_THETA_40m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_40mA_dep123(:,1),GA_OOI_CTD_40mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_40mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_40mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_40mA_dep123(:,1),GA_OOI_CTD_40mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33 36])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 40m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_40mA_dep123(1,1) GA_OOI_CTD_40mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/40m/AB_OOI_Mooring_SALT_40m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_40mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 40m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/40m/AB_OOI_Mooring_THETA_40m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring A 40m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/40m/AB_OOI_Mooring_SALT_40m_A_hourly','-dpng')



load GA_OOI_CTD_40mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_40mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_40mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_40mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_40mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_40mB_dep123(:,1),GA_OOI_CTD_40mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_40mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_40mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_40mB_dep123(:,1),GA_OOI_CTD_40mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 40m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_40mB_dep123(1,1) GA_OOI_CTD_40mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/40m/AB_OOI_Mooring_THETA_40m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_40mB_dep123(:,1),GA_OOI_CTD_40mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_40mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_40mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_40mB_dep123(:,1),GA_OOI_CTD_40mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 40m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_40mB_dep123(1,1) GA_OOI_CTD_40mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/40m/AB_OOI_Mooring_SALT_40m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_40mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 40m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/40m/AB_OOI_Mooring_THETA_40m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 40m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/40m/AB_OOI_Mooring_SALT_40m_B_hourly','-dpng')


close all
%% 40m


%% 60m
load GA_OOI_CTD_60mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_60mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_60mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_60mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_60mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_60mA_dep123(:,1),GA_OOI_CTD_60mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_60mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_60mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_60mA_dep123(:,1),GA_OOI_CTD_60mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 60m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_60mA_dep123(1,1) GA_OOI_CTD_60mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/60m/AB_OOI_Mooring_THETA_60m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_60mA_dep123(:,1),GA_OOI_CTD_60mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_60mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_60mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_60mA_dep123(:,1),GA_OOI_CTD_60mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33 36])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 60m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_60mA_dep123(1,1) GA_OOI_CTD_60mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/60m/AB_OOI_Mooring_SALT_60m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_60mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 60m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/60m/AB_OOI_Mooring_THETA_60m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring A 60m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/60m/AB_OOI_Mooring_SALT_60m_A_hourly','-dpng')



load GA_OOI_CTD_60mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_60mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_60mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_60mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_60mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_60mB_dep123(:,1),GA_OOI_CTD_60mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_60mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_60mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_60mB_dep123(:,1),GA_OOI_CTD_60mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 60m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_60mB_dep123(1,1) GA_OOI_CTD_60mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/60m/AB_OOI_Mooring_THETA_60m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_60mB_dep123(:,1),GA_OOI_CTD_60mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_60mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_60mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_60mB_dep123(:,1),GA_OOI_CTD_60mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 60m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_60mB_dep123(1,1) GA_OOI_CTD_60mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/60m/AB_OOI_Mooring_SALT_60m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_60mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 60m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/60m/AB_OOI_Mooring_THETA_60m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 60m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/60m/AB_OOI_Mooring_SALT_60m_B_hourly','-dpng')


close all
%% 60m


%% 90m
load GA_OOI_CTD_90mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_90mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_90mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_90mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_90mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_90mA_dep123(:,1),GA_OOI_CTD_90mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_90mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_90mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_90mA_dep123(:,1),GA_OOI_CTD_90mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 90m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_90mA_dep123(1,1) GA_OOI_CTD_90mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/90m/AB_OOI_Mooring_THETA_90m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_90mA_dep123(:,1),GA_OOI_CTD_90mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_90mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_90mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_90mA_dep123(:,1),GA_OOI_CTD_90mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33 36])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 90m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_90mA_dep123(1,1) GA_OOI_CTD_90mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/90m/AB_OOI_Mooring_SALT_90m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_90mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 90m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/90m/AB_OOI_Mooring_THETA_90m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring A 90m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/90m/AB_OOI_Mooring_SALT_90m_A_hourly','-dpng')



load GA_OOI_CTD_90mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_90mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_90mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_90mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_90mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_90mB_dep123(:,1),GA_OOI_CTD_90mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_90mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_90mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_90mB_dep123(:,1),GA_OOI_CTD_90mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 90m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_90mB_dep123(1,1) GA_OOI_CTD_90mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/90m/AB_OOI_Mooring_THETA_90m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_90mB_dep123(:,1),GA_OOI_CTD_90mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_90mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_90mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_90mB_dep123(:,1),GA_OOI_CTD_90mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 90m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_90mB_dep123(1,1) GA_OOI_CTD_90mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/90m/AB_OOI_Mooring_SALT_90m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_90mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 90m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/90m/AB_OOI_Mooring_THETA_90m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 90m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/90m/AB_OOI_Mooring_SALT_90m_B_hourly','-dpng')


close all
%% 90m


%% 130m
load GA_OOI_CTD_130mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_130mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_130mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_130mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_130mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_130mA_dep123(:,1),GA_OOI_CTD_130mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_130mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_130mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_130mA_dep123(:,1),GA_OOI_CTD_130mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 130m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_130mA_dep123(1,1) GA_OOI_CTD_130mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/130m/AB_OOI_Mooring_THETA_130m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_130mA_dep123(:,1),GA_OOI_CTD_130mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_130mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_130mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_130mA_dep123(:,1),GA_OOI_CTD_130mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33 36])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 130m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_130mA_dep123(1,1) GA_OOI_CTD_130mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/130m/AB_OOI_Mooring_SALT_130m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_130mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 130m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/130m/AB_OOI_Mooring_THETA_130m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring A 130m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
print('PLOTS/130m/AB_OOI_Mooring_SALT_130m_A_hourly','-dpng')



load GA_OOI_CTD_130mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_130mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_130mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_130mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_130mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_130mB_dep123(:,1),GA_OOI_CTD_130mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_130mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_130mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_130mB_dep123(:,1),GA_OOI_CTD_130mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 130m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_130mB_dep123(1,1) GA_OOI_CTD_130mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/130m/AB_OOI_Mooring_THETA_130m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_130mB_dep123(:,1),GA_OOI_CTD_130mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_130mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_130mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_130mB_dep123(:,1),GA_OOI_CTD_130mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 130m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_130mB_dep123(1,1) GA_OOI_CTD_130mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/130m/AB_OOI_Mooring_SALT_130m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_130mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 130m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/130m/AB_OOI_Mooring_THETA_130m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 36])
title('Argentine Basin OOI mooring B 130m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/130m/AB_OOI_Mooring_SALT_130m_B_hourly','-dpng')


close all
%% 130m


%% 180m
load GA_OOI_CTD_180mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_180mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_180mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_180mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_180mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_180mA_dep123(:,1),GA_OOI_CTD_180mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_180mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_180mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_180mA_dep123(:,1),GA_OOI_CTD_180mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 180m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_180mA_dep123(1,1) GA_OOI_CTD_180mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/180m/AB_OOI_Mooring_THETA_180m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_180mA_dep123(:,1),GA_OOI_CTD_180mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_180mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_180mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_180mA_dep123(:,1),GA_OOI_CTD_180mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33 35.5])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 180m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_180mA_dep123(1,1) GA_OOI_CTD_180mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/180m/AB_OOI_Mooring_SALT_180m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_180mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 180m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/180m/AB_OOI_Mooring_THETA_180m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 35.5])
title('Argentine Basin OOI mooring A 180m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/180m/AB_OOI_Mooring_SALT_180m_A_hourly','-dpng')



load GA_OOI_CTD_180mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_180mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_180mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_180mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_180mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_180mB_dep123(:,1),GA_OOI_CTD_180mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_180mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_180mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_180mB_dep123(:,1),GA_OOI_CTD_180mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 180m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_180mB_dep123(1,1) GA_OOI_CTD_180mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/180m/AB_OOI_Mooring_THETA_180m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_180mB_dep123(:,1),GA_OOI_CTD_180mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_180mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_180mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_180mB_dep123(:,1),GA_OOI_CTD_180mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 35.6])
title('Argentine Basin OOI mooring B 180m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_180mB_dep123(1,1) GA_OOI_CTD_180mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/180m/AB_OOI_Mooring_SALT_180m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_180mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 180m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/180m/AB_OOI_Mooring_THETA_180m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 35.6])
title('Argentine Basin OOI mooring B 180m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/180m/AB_OOI_Mooring_SALT_180m_B_hourly','-dpng')


close all
%% 180m


%% 250m
load GA_OOI_CTD_250mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_250mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_250mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_250mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_250mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_250mA_dep123(:,1),GA_OOI_CTD_250mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_250mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_250mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_250mA_dep123(:,1),GA_OOI_CTD_250mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 250m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_250mA_dep123(1,1) GA_OOI_CTD_250mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/250m/AB_OOI_Mooring_THETA_250m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_250mA_dep123(:,1),GA_OOI_CTD_250mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_250mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_250mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_250mA_dep123(:,1),GA_OOI_CTD_250mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([32.8 35.5])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 250m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_250mA_dep123(1,1) GA_OOI_CTD_250mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/250m/AB_OOI_Mooring_SALT_250m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_250mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 250m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/250m/AB_OOI_Mooring_THETA_250m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([32.8 35.5])
title('Argentine Basin OOI mooring A 250m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/250m/AB_OOI_Mooring_SALT_250m_A_hourly','-dpng')



load GA_OOI_CTD_250mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_250mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_250mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_250mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_250mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_250mB_dep123(:,1),GA_OOI_CTD_250mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_250mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_250mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_250mB_dep123(:,1),GA_OOI_CTD_250mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 250m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_250mB_dep123(1,1) GA_OOI_CTD_250mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/250m/AB_OOI_Mooring_THETA_250m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_250mB_dep123(:,1),GA_OOI_CTD_250mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_250mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_250mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_250mB_dep123(:,1),GA_OOI_CTD_250mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([32.8 35.5])
title('Argentine Basin OOI mooring B 250m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_250mB_dep123(1,1) GA_OOI_CTD_250mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/250m/AB_OOI_Mooring_SALT_250m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_250mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 250m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/250m/AB_OOI_Mooring_THETA_250m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([32.8 35.5])
title('Argentine Basin OOI mooring B 250m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/250m/AB_OOI_Mooring_SALT_250m_B_hourly','-dpng')


close all
%% 250m


%% 350m
load GA_OOI_CTD_350mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_350mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_350mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_350mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_350mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_350mA_dep123(:,1),GA_OOI_CTD_350mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_350mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_350mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_350mA_dep123(:,1),GA_OOI_CTD_350mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 350m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_350mA_dep123(1,1) GA_OOI_CTD_350mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/350m/AB_OOI_Mooring_THETA_350m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_350mA_dep123(:,1),GA_OOI_CTD_350mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_350mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_350mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_350mA_dep123(:,1),GA_OOI_CTD_350mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33 35.5])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 350m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_350mA_dep123(1,1) GA_OOI_CTD_350mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/350m/AB_OOI_Mooring_SALT_350m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_350mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 350m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.79*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.76*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.85*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.82*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/350m/AB_OOI_Mooring_THETA_350m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 35.5])
title('Argentine Basin OOI mooring A 350m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/350m/AB_OOI_Mooring_SALT_350m_A_hourly','-dpng')



load GA_OOI_CTD_350mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_350mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_350mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_350mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_350mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_350mB_dep123(:,1),GA_OOI_CTD_350mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_350mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_350mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_350mB_dep123(:,1),GA_OOI_CTD_350mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 350m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_350mB_dep123(1,1) GA_OOI_CTD_350mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/350m/AB_OOI_Mooring_THETA_350m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_350mB_dep123(:,1),GA_OOI_CTD_350mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_350mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_350mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_350mB_dep123(:,1),GA_OOI_CTD_350mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 35.6])
title('Argentine Basin OOI mooring B 350m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_350mB_dep123(1,1) GA_OOI_CTD_350mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/350m/AB_OOI_Mooring_SALT_350m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_350mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 350m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.80*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.77*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.86*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.83*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/350m/AB_OOI_Mooring_THETA_350m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 35.6])
title('Argentine Basin OOI mooring B 350m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/350m/AB_OOI_Mooring_SALT_350m_B_hourly','-dpng')


close all
%% 350m


%% 500m
load GA_OOI_CTD_500mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_500mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_500mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_500mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_500mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_500mA_dep123(:,1),GA_OOI_CTD_500mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_500mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_500mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_500mA_dep123(:,1),GA_OOI_CTD_500mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 500m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_500mA_dep123(1,1) GA_OOI_CTD_500mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/500m/AB_OOI_Mooring_THETA_500m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_500mA_dep123(:,1),GA_OOI_CTD_500mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_500mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_500mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_500mA_dep123(:,1),GA_OOI_CTD_500mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33 35.5])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 500m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_500mA_dep123(1,1) GA_OOI_CTD_500mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/500m/AB_OOI_Mooring_SALT_500m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_500mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 500m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.86*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.83*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.92*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.89*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/500m/AB_OOI_Mooring_THETA_500m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33 35.5])
title('Argentine Basin OOI mooring A 500m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest+1),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest+1),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest+1),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest+1),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/500m/AB_OOI_Mooring_SALT_500m_A_hourly','-dpng')



load GA_OOI_CTD_500mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_500mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_500mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_500mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_500mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_500mB_dep123(:,1),GA_OOI_CTD_500mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_500mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_500mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_500mB_dep123(:,1),GA_OOI_CTD_500mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 500m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_500mB_dep123(1,1) GA_OOI_CTD_500mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/500m/AB_OOI_Mooring_THETA_500m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_500mB_dep123(:,1),GA_OOI_CTD_500mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_500mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_500mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_500mB_dep123(:,1),GA_OOI_CTD_500mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([32 35.2])
title('Argentine Basin OOI mooring B 500m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_500mB_dep123(1,1) GA_OOI_CTD_500mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/500m/AB_OOI_Mooring_SALT_500m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_500mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 500m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.86*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.83*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.92*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.89*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/500m/AB_OOI_Mooring_THETA_500m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([32 35.2])
title('Argentine Basin OOI mooring B 500m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest+18),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest+18),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest+18),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest+18),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/500m/AB_OOI_Mooring_SALT_500m_B_hourly','-dpng')


close all
%% 500m


%% 750m
load GA_OOI_CTD_750mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_750mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_750mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_750mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_750mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_750mA_dep123(:,1),GA_OOI_CTD_750mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_750mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_750mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_750mA_dep123(:,1),GA_OOI_CTD_750mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 750m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_750mA_dep123(1,1) GA_OOI_CTD_750mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/750m/AB_OOI_Mooring_THETA_750m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_750mA_dep123(:,1),GA_OOI_CTD_750mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_750mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_750mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_750mA_dep123(:,1),GA_OOI_CTD_750mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([33.5 35])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 750m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_750mA_dep123(1,1) GA_OOI_CTD_750mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/750m/AB_OOI_Mooring_SALT_750m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_750mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 750m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.79*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.76*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.85*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.82*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/750m/AB_OOI_Mooring_THETA_750m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33.5 35])
title('Argentine Basin OOI mooring A 750m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/750m/AB_OOI_Mooring_SALT_750m_A_hourly','-dpng')



load GA_OOI_CTD_750mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_750mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_750mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_750mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_750mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_750mB_dep123(:,1),GA_OOI_CTD_750mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_750mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_750mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_750mB_dep123(:,1),GA_OOI_CTD_750mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 750m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_750mB_dep123(1,1) GA_OOI_CTD_750mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/750m/AB_OOI_Mooring_THETA_750m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_750mB_dep123(:,1),GA_OOI_CTD_750mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_750mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_750mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_750mB_dep123(:,1),GA_OOI_CTD_750mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33.5 35])
title('Argentine Basin OOI mooring B 750m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_750mB_dep123(1,1) GA_OOI_CTD_750mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/750m/AB_OOI_Mooring_SALT_750m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_750mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 750m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.79*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.76*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.85*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.82*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/750m/AB_OOI_Mooring_THETA_750m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([33.5 35])
title('Argentine Basin OOI mooring B 750m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.84*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.81*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.90*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.87*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/750m/AB_OOI_Mooring_SALT_750m_B_hourly','-dpng')


close all
%% 750m


%% 1000m
load GA_OOI_CTD_1000mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_1000mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_1000mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_1000mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_1000mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_1000mA_dep123(:,1),GA_OOI_CTD_1000mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_1000mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_1000mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_1000mA_dep123(:,1),GA_OOI_CTD_1000mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 1000m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_1000mA_dep123(1,1) GA_OOI_CTD_1000mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/1000m/AB_OOI_Mooring_THETA_1000m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_1000mA_dep123(:,1),GA_OOI_CTD_1000mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_1000mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_1000mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_1000mA_dep123(:,1),GA_OOI_CTD_1000mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([34 35])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 1000m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_1000mA_dep123(1,1) GA_OOI_CTD_1000mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/1000m/AB_OOI_Mooring_SALT_1000m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_1000mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 1000m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.86*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.83*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.92*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.89*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/1000m/AB_OOI_Mooring_THETA_1000m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([34 35])
title('Argentine Basin OOI mooring A 1000m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/1000m/AB_OOI_Mooring_SALT_1000m_A_hourly','-dpng')



load GA_OOI_CTD_1000mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_1000mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_1000mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_1000mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_1000mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_1000mB_dep123(:,1),GA_OOI_CTD_1000mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_1000mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_1000mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_1000mB_dep123(:,1),GA_OOI_CTD_1000mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 1000m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_1000mB_dep123(1,1) GA_OOI_CTD_1000mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/1000m/AB_OOI_Mooring_THETA_1000m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_1000mB_dep123(:,1),GA_OOI_CTD_1000mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_1000mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_1000mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_1000mB_dep123(:,1),GA_OOI_CTD_1000mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([34 35])
title('Argentine Basin OOI mooring B 1000m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_1000mB_dep123(1,1) GA_OOI_CTD_1000mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/1000m/AB_OOI_Mooring_SALT_1000m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_1000mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 1000m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.86*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.83*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.92*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.89*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/1000m/AB_OOI_Mooring_THETA_1000m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([34 35])
title('Argentine Basin OOI mooring B 1000m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/1000m/AB_OOI_Mooring_SALT_1000m_B_hourly','-dpng')


close all
%% 1000m


%% 1500m
load GA_OOI_CTD_1500mA_dep123
datest = find(xdatesfull>GA_OOI_CTD_1500mA_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_1500mA_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_1500mA_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_1500mA_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_1500mA_dep123(:,1),GA_OOI_CTD_1500mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_1500mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_1500mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_1500mA_dep123(:,1),GA_OOI_CTD_1500mA_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 1500m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_1500mA_dep123(1,1) GA_OOI_CTD_1500mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/1500m/AB_OOI_Mooring_THETA_1500m_A_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_1500mA_dep123(:,1),GA_OOI_CTD_1500mA_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_1500mA_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_1500mA_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_1500mA_dep123(:,1),GA_OOI_CTD_1500mA_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
% ylim([34 35])
ylabel('[psu]')
title('Argentine Basin OOI mooring A 1500m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_1500mA_dep123(1,1) GA_OOI_CTD_1500mA_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/1500m/AB_OOI_Mooring_SALT_1500m_A_full_QC','-dpng')


processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_1500mA_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring A 1500m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.80*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.76*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.86*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.83*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/1500m/AB_OOI_Mooring_THETA_1500m_A_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([34 35])
title('Argentine Basin OOI mooring A 1500m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/1500m/AB_OOI_Mooring_SALT_1500m_A_hourly','-dpng')



load GA_OOI_CTD_1500mB_dep123
datest = find(xdatesfull>GA_OOI_CTD_1500mB_dep123(1,1),1);
datend = find(xdatesfull>GA_OOI_CTD_1500mB_dep123(end,1),1)-1;
sza = length(GA_OOI_CTD_1500mB_dep123(:,8));

[mfreq,depth_l,depth_h,mean_depth,mode_depth,mean_theta,...
    std_theta,mean_salt,std_salt] = get_array_stats(GA_OOI_CTD_1500mB_dep123);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_1500mB_dep123(:,1),GA_OOI_CTD_1500mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_1500mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_1500mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_1500mB_dep123(:,1),GA_OOI_CTD_1500mB_dep123(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 1500m potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_1500mB_dep123(1,1) GA_OOI_CTD_1500mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','theta','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/1500m/AB_OOI_Mooring_THETA_1500m_B_full_QC','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(GA_OOI_CTD_1500mB_dep123(:,1),GA_OOI_CTD_1500mB_dep123(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
h3 = scatter(GA_OOI_CTD_1500mB_dep123(:,1),(depth_l)*ones(sza,1),...
    (GA_OOI_CTD_1500mB_dep123(:,9)./2)+0.1,Color(cm,:),'filled');
ylim([depth_l-3 depth_h])
grid on
yyaxis right
h2 = plot(GA_OOI_CTD_1500mB_dep123(:,1),GA_OOI_CTD_1500mB_dep123(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([34 35])
title('Argentine Basin OOI mooring B 1500m salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([GA_OOI_CTD_1500mB_dep123(1,1) GA_OOI_CTD_1500mB_dep123(end,1)])
legend([h1(1),h2(1),h3(1)],'depth','salinity','QC flag','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
hold off
print('PLOTS/1500m/AB_OOI_Mooring_SALT_1500m_B_full_QC','-dpng')

processed_ooi_array = process_OOI_hourly(GA_OOI_CTD_1500mB_dep123,hour_time);

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cd,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,4),...
    'LineWidth',lwd,'Color',Color(ct,:));
ylabel('[C]')
title('Argentine Basin OOI mooring B 1500m hourly potential temperature','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','theta','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest+17),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest+17),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest+17),y1(1)+0.14*yrange,['mean theta: ',...
    num2str(mean_theta,4),' C'],'FontSize',14,'Color','k')
text(xdatesfull(datest+17),y1(1)+0.11*yrange,['theta st. dev.: ',...
    num2str(std_theta,4),' C'],'FontSize',14,'Color','k')
hold off
print('PLOTS/1500m/AB_OOI_Mooring_THETA_1500m_B_hourly','-dpng')

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
yyaxis left
h1 = plot(processed_ooi_array(:,1),processed_ooi_array(:,8),...
    'LineWidth',lwd,'Color',Color(cdh,:));
hold on
ylabel('depth [m]')
ylim([depth_l-5 depth_h])
grid on
yyaxis right
h2 = plot(processed_ooi_array(:,1),processed_ooi_array(:,5),...
    'LineWidth',lwd,'Color',Color(cth,:));
ylabel('[psu]')
% ylim([34 35])
title('Argentine Basin OOI mooring B 1500m hourly salinity','FontWeight','Normal')
xtickangle(45)
xticks(xdatesfull(datest:datend))
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
xlim([processed_ooi_array(1,1) processed_ooi_array(end,1)])
legend([h1(1),h2(1)],'depth','salinity','Location','Southeast')
acc_plots_ctd
acc_movie
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
y1 = ylim;
yrange = y1(2) - y1(1);
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.05*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.14*yrange,['mean salinity: ',...
    num2str(mean_salt,4),' psu'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['salinity st. dev.: ',...
    num2str(std_salt,3),' psu'],'FontSize',14,'Color','k')
hold off
print('PLOTS/1500m/AB_OOI_Mooring_SALT_1500m_B_hourly','-dpng')


close all
%% 1500m


clear








toc()