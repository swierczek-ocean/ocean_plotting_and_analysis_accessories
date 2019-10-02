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
lwt = 1.6;
lwd = 1.5;
ms = 5;

cth = 79;
cdh = 58;

Color(cdh,:) = [127;191;123]/255;
% Color(cth,:) = [179;145;199]/255;
Color(cth,:) = 1.1.*Color(cth,:);
%% 1
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
ylim([33 36])
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
text(xdatesfull(datest),y1(1)+0.05*yrange,['mean sample frequency: ',...
    num2str(floor(mfreq)),' minutes'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.08*yrange,['mean sample depth: ',...
    num2str(-floor(mean_depth)),'m'],'FontSize',14,'Color','k')
text(xdatesfull(datest),y1(1)+0.11*yrange,['mode of sample depth: ',...
    num2str(-floor(mode_depth)),'m'],'FontSize',14,'Color','k')
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
ylabel('[C]')
ylim([33 36])
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
ylim([33 36])
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
ylabel('[C]')
ylim([33 36])
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
hold off
print('PLOTS/30m/AB_OOI_Mooring_SALT_30m_B_hourly','-dpng')


close all
%% 1











toc()