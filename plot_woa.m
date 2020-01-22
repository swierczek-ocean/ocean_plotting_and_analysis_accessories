clear
close all
clc
tic()

load WOA_O_N

DO_clim_count(isnan(DO_clim_count)==1) = 0;
NO3_clim_count(isnan(NO3_clim_count)==1) = 0;

for ii=1:57
    temp = DO_clim_count(:,:,ii,1);
    fprintf('%g DO obs at depth %g in January \n',sum(sum(temp)),woa_depth_o(ii))
end

for ii=1:43
    temp = NO3_clim_count(:,:,ii,1);
    fprintf('%g NO3 obs at depth %g in January \n',sum(sum(temp)),woa_depth_n(ii))
end


load WOA_O_N woa_depth*
load woa_rmse

depths_o = 0:50:1500;
counts_o = zeros(length(depths_o)-1,12);

for ii=1:(length(depths_o)-1)
    ind1 = find(woa_depth_o<depths_o(ii+1));
    ind2 = find(woa_depth_o>=depths_o(ii));
    ind = intersect(ind1,ind2);
    counts_o(ii,:) = sum(do_woa_rmse3(:,ind,2),2);
end

depths_n = 0:50:800;
counts_n = zeros(length(depths_n)-1,12);

for ii=1:(length(depths_n)-1)
    ind1 = find(woa_depth_n<depths_n(ii+1));
    ind2 = find(woa_depth_n>=depths_n(ii));
    ind = intersect(ind1,ind2);
    counts_n(ii,:) = sum(no3_woa_rmse3(:,ind,2),2);
end


acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;

months = [datenum('20170101','yyyymmdd'),datenum('20170201','yyyymmdd'),...
    datenum('20170301','yyyymmdd'),datenum('20170401','yyyymmdd'),...
    datenum('20170501','yyyymmdd'),datenum('20170601','yyyymmdd'),...
    datenum('20170701','yyyymmdd'),datenum('20170801','yyyymmdd'),...
    datenum('20170901','yyyymmdd'),datenum('20171001','yyyymmdd'),...
    datenum('20171101','yyyymmdd'),datenum('20171201','yyyymmdd'),...
    datenum('20180101','yyyymmdd')];
midmonths = [datenum('20170115','yyyymmdd'),datenum('20170214','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd')];

% for ii=1:12
%     figure()
%     set(gcf, 'Position', [1, 1, 1600, 900])
%     
%     h7 = plot(do_woa_rmse3(ii,:,1),woa_depth_o,'LineWidth',lw,'Color',Color(c3,:));
%     hold on
%     h8 = plot(do_woa_rmse6(ii,:,1),woa_depth_o,'LineWidth',lw,'Color',Color(c6,:));
%     h9 = plot(do_woa_rmse12(ii,:,1),woa_depth_o,'LineWidth',lw,'Color',Color(c12,:));
%     
%     grid on
%     title(['RMSE of WOA O2 ',datestr(midmonths(ii),'mmmm'),...
%         ' climatology misfit [mol O/m^3] (with # of observations at each depth)'],'FontWeight','Normal','FontSize',18)
%     x1 = xlim;
%     xrange = x1(2) - x1(1);
%     xlim([x1(1)-0.04*xrange x1(2)+0.05*xrange])
%     % text(x1(2)-0.15*xrange,700,'# of observations:','Color','k','FontSize',15,'HorizontalAlignment','right');
%     for jj=1:30
%         text(x1(2),depths_o(jj)+25,num2str(counts_o(jj,ii)),...
%             'Color','k','FontSize',15,'HorizontalAlignment','right');
%     end
%     legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','northwest')
%     set(gca, 'YDir','reverse')
%     ylim([-5 1505])
%     ylabel('depth [m]')
%     yticks(0:100:1500)
%     acc_movie_w
%     acc_plots
%     hold off
%     set(gcf,'InvertHardCopy','off');
%     print('-r300',['WOA_O2_RMSE_',num2str(ii,'%02.f'),...
%         '_',datestr(midmonths(ii),'mmmm')],'-dpng')
%     
%     close all
% end

do_woa_rmse_s3 = zeros(4,57);
do_woa_rmse_s6 = zeros(4,57);
do_woa_rmse_s12 = zeros(4,57);
count_os = zeros(30,4);
no3_woa_rmse_s3 = zeros(4,43);
no3_woa_rmse_s6 = zeros(4,43);
no3_woa_rmse_s12 = zeros(4,43);
count_ns = zeros(16,4);
A = [1,2,3;4,5,6;7,8,9;10,11,12];


for ii=1:4
    do_woa_rmse_s3(ii,:) = sum(do_woa_rmse3(A(ii,:),:,1).*...
        do_woa_rmse3(A(ii,:),:,2),1)./sum(do_woa_rmse3(A(ii,:),:,2),1);
    do_woa_rmse_s6(ii,:) = sum(do_woa_rmse6(A(ii,:),:,1).*...
        do_woa_rmse6(A(ii,:),:,2),1)./sum(do_woa_rmse6(A(ii,:),:,2),1);
    do_woa_rmse_s12(ii,:) = sum(do_woa_rmse12(A(ii,:),:,1).*...
        do_woa_rmse12(A(ii,:),:,2),1)./sum(do_woa_rmse12(A(ii,:),:,2),1);
    no3_woa_rmse_s3(ii,:) = sum(no3_woa_rmse3(A(ii,:),:,1).*...
        no3_woa_rmse3(A(ii,:),:,2),1)./sum(no3_woa_rmse3(A(ii,:),:,2),1);
    no3_woa_rmse_s6(ii,:) = sum(no3_woa_rmse6(A(ii,:),:,1).*...
        no3_woa_rmse6(A(ii,:),:,2),1)./sum(no3_woa_rmse6(A(ii,:),:,2),1);
    no3_woa_rmse_s12(ii,:) = sum(no3_woa_rmse12(A(ii,:),:,1).*...
        no3_woa_rmse12(A(ii,:),:,2),1)./sum(no3_woa_rmse12(A(ii,:),:,2),1);
    count_os(:,ii) = sum(counts_o(:,A(ii,:)),2);
    count_ns(:,ii) = sum(counts_n(:,A(ii,:)),2);
end


B = ['JFM','AMJ','JAS','OND'];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])

for ii=1:4
    subplot(1,4,ii)
    h7 = plot(do_woa_rmse_s3(ii,:),woa_depth_o,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h8 = plot(do_woa_rmse_s6(ii,:),woa_depth_o,'LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(do_woa_rmse_s12(ii,:),woa_depth_o,'LineWidth',lw,'Color',Color(c12,:));
    
    grid on
    title(B(A(ii,:)),'FontWeight','Normal','FontSize',18)
    x1 = xlim;
    xrange = x1(2) - x1(1);
    xlim([max([x1(1)-0.01*xrange 0]) x1(2)+0.1*xrange])
    for jj=1:30
        text(x1(2)+0.06*xrange,depths_o(jj)+25,num2str(count_os(jj,ii)),...
            'Color','k','FontSize',15,'HorizontalAlignment','right');
    end
    if ii==1
        ylabel('depth [m]')
    end
    if ii==2
        legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12',...
            'Location','north')
    end
    set(gca, 'YDir','reverse')
    ylim([-5 1505])
    yticks(0:100:1500)
    acc_movie_w
    acc_4vplots(ii)
    hold off
end
sgtitle('RMSE of WOA dissolved oxygen misfit [mol O/m^3] (with # of observations at each depth)',...
    'FontWeight','Normal','FontSize',18)
set(gcf,'InvertHardCopy','off');
print('-r300','WOA_O2_RMSE_seasonal','-dpng')

% close all

% for ii=1:12
%     figure()
%     set(gcf, 'Position', [1, 1, 1600, 900])
%     
%     h7 = plot(no3_woa_rmse3(ii,:,1),woa_depth_n,'LineWidth',lw,'Color',Color(c3,:));
%     hold on
%     h8 = plot(no3_woa_rmse6(ii,:,1),woa_depth_n,'LineWidth',lw,'Color',Color(c6,:));
%     h9 = plot(no3_woa_rmse12(ii,:,1),woa_depth_n,'LineWidth',lw,'Color',Color(c12,:));
%     
%     grid on
%     title(['RMSE of WOA NO3 ',datestr(midmonths(ii),'mmmm'),...
%         ' climatology misfit [mol N/m^3] (with # of observations at each depth)'],'FontWeight','Normal','FontSize',18)
%     x1 = xlim;
%     xrange = x1(2) - x1(1);
%     xlim([x1(1)-0.04*xrange x1(2)+0.05*xrange])
%     % text(x1(2)-0.15*xrange,700,'# of observations:','Color','k','FontSize',15,'HorizontalAlignment','right');
%     for jj=1:16
%         text(x1(2),depths_n(jj)+25,num2str(counts_n(jj,ii)),...
%             'Color','k','FontSize',15,'HorizontalAlignment','right');
%     end
%     legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12','Location','northwest')
%     set(gca, 'YDir','reverse')
%     ylim([-5 805])
%     yticks(0:50:800)
%     ylabel('depth [m]')
%     ax = gca;
%     ax.XRuler.Exponent = 0;
%     acc_movie_w
%     acc_plots
%     hold off
%     set(gcf,'InvertHardCopy','off');
%     print('-r300',['WOA_NO3_RMSE_',num2str(ii,'%02.f'),...
%         '_',datestr(midmonths(ii),'mmmm')],'-dpng')
%     
%     close all
% end


figure()
set(gcf, 'Position', [1, 1, 1600, 900])

for ii=1:4
    subplot(1,4,ii)
    h7 = plot(no3_woa_rmse_s3(ii,:),woa_depth_n,'LineWidth',lw,'Color',Color(c3,:));
    hold on
    h8 = plot(no3_woa_rmse_s6(ii,:),woa_depth_n,'LineWidth',lw,'Color',Color(c6,:));
    h9 = plot(no3_woa_rmse_s12(ii,:),woa_depth_n,'LineWidth',lw,'Color',Color(c12,:));
    
    grid on
    title(B(A(ii,:)),'FontWeight','Normal','FontSize',18)
    x1 = xlim;
    xrange = x1(2) - x1(1);
    xlim([max([x1(1)-0.01*xrange 0]) x1(2)+0.1*xrange])
    for jj=1:16
        text(x1(2)+0.06*xrange,depths_n(jj)+25,num2str(count_ns(jj,ii)),...
            'Color','k','FontSize',15,'HorizontalAlignment','right');
    end
    if ii==1
        ylabel('depth [m]')
    end
    if ii==2
        legend([h7(1),h8(1),h9(1)],'1/3','1/6','1/12',...
            'Location','north')
    end
    ax = gca;
    ax.XRuler.Exponent = 0;
    set(gca, 'YDir','reverse')
    ylim([-5 805])
    yticks(0:50:800)
    acc_movie_w
    acc_4vplots(ii)
    hold off
end
sgtitle('RMSE of WOA nitrate misfit [mol N/m^3] (with # of observations at each depth)',...
    'FontWeight','Normal','FontSize',18)
set(gcf,'InvertHardCopy','off');
print('-r300','WOA_NO3_RMSE_seasonal','-dpng')




toc()