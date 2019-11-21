clear
close all
clc

tic()
acc_settings

load AVISO_DIFF_movie

etan32_l2 = zeros(1,395);
etan62_l2 = zeros(1,395);
etan122_l2 = zeros(1,395);

etan32_l1 = zeros(1,395);
etan62_l1 = zeros(1,395);
etan122_l1 = zeros(1,395);

etan32_linf = zeros(1,395);
etan62_linf = zeros(1,395);
etan122_linf = zeros(1,395);

for ii=1:395
    temp32 = ETAN32DIFF(:,:,ii);
    temp62 = ETAN62DIFF(:,:,ii);
    temp122 = ETAN122DIFF(:,:,ii);
    
    temp32 = temp32(temp32<10000);
    temp62 = temp62(temp62<10000);
    temp122 = temp122(temp122<10000);
    
    s1 = length(temp32);
    s2 = length(temp62);
    s3 = length(temp122);
    
    etan32_linf(ii) = max(abs(temp32));
    etan62_linf(ii) = max(abs(temp62));
    etan122_linf(ii) = max(abs(temp122));
    
    etan32_l1(ii) = sum(abs(temp32))/s1;
    etan62_l1(ii) = sum(abs(temp62))/s2;
    etan122_l1(ii) = sum(abs(temp122))/s3;
    
    etan32_l2(ii) = sqrt(sum(temp32.^2)/s1);
    etan62_l2(ii) = sqrt(sum(temp62.^2)/s2);
    etan122_l2(ii) = sqrt(sum(temp122.^2)/s3);
    
end

time = T_AVISO(1:395);

c32 = 86;
c62 = 87;
c122 = 88;
lw = 2.5;
coords = [time(1) time(end) 0 2.7];

set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = plot(time,etan32_l2,'LineWidth',lw,'Color',Color(c32,:));
% hold on
% h2 = plot(time,etan62_l2,'LineWidth',lw,'Color',Color(c62,:));
% h3 = plot(time,etan122_l2,'LineWidth',lw,'Color',Color(c122,:));
% h4 = plot(time,etan32_l1,'LineStyle','--','LineWidth',lw,'Color',Color(c32,:));
% h5 = plot(time,etan62_l1,'LineStyle','--','LineWidth',lw,'Color',Color(c62,:));
% h6 = plot(time,etan122_l1,'LineStyle','--','LineWidth',lw,'Color',Color(c122,:));
h7 = plot(time,etan32_linf,'LineStyle','-.','LineWidth',lw,'Color',Color(c32,:));
hold on
h8 = plot(time,etan62_linf,'LineStyle','-.','LineWidth',lw,'Color',Color(c62,:));
h9 = plot(time,etan122_linf,'LineStyle','-.','LineWidth',lw,'Color',Color(c122,:));
title('RMSE, L1, and max misfits of interpolated MITgcm+BLING to AVISO')
xtickangle(45)
% xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
legend([h7(1),h8(1),h9(1)],'1/3 |max misfit|',...
    '1/6 |max misfit|','1/12 |max misfit|')
legend('Location','southeast')
acc_movie
acc_plots
hold off
print('-r300','AVISO_max_misfits','-dpng')


set(gcf, 'Position', [1, 1, 1600, 900])
h1 = plot(time,etan32_l2,'LineWidth',lw,'Color',Color(c32,:));
hold on
h2 = plot(time,etan62_l2,'LineWidth',lw,'Color',Color(c62,:));
h3 = plot(time,etan122_l2,'LineWidth',lw,'Color',Color(c122,:));
title('RMSE misfits of interpolated MITgcm + BLING to AVISO (m)','FontWeight','normal')
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
legend([h1(1),h2(1),h3(1)],'1/3 RMSE',...
    '1/6 RMSE','1/12 RMSE')
legend('Location','northwest')
acc_movie
acc_plots
hold off
print('-r300','AVISO_misfit_RMSE','-dpng')

% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = plot(time,etan32_l2,'LineWidth',lw,'Color',Color(c32,:));
% hold on
% h2 = plot(time,etan62_l2,'LineWidth',lw,'Color',Color(c62,:));
% h3 = plot(time,etan122_l2,'LineWidth',lw,'Color',Color(c122,:));
% h4 = plot(time,etan32_l1,'LineStyle','--','LineWidth',lw,'Color',Color(c32,:));
% h5 = plot(time,etan62_l1,'LineStyle','--','LineWidth',lw,'Color',Color(c62,:));
% h6 = plot(time,etan122_l1,'LineStyle','--','LineWidth',lw,'Color',Color(c122,:));
% h7 = plot(time,etan32_linf,'LineStyle','-.','LineWidth',lw,'Color',Color(c32,:));
% h8 = plot(time,etan62_linf,'LineStyle','-.','LineWidth',lw,'Color',Color(c62,:));
% h9 = plot(time,etan122_linf,'LineStyle','-.','LineWidth',lw,'Color',Color(c122,:));
% title('RMSE, L1, and max misfits of interpolated MITgcm+BLING to AVISO')
% xtickangle(45)
% % xticks(xdatesfull)
% dateFormat = 'mm/yy';
% datetick('x',dateFormat,'keepticks')
% legend([h1(1),h2(1),h3(1),h4(1),h5(1),h6(1),h7(1),h8(1),h9(1)],'1/3 RMSE',...
%     '1/6 RMSE','1/12 RMSE','1/3 L1/n','1/6 L1/n','1/12 L1/n','1/3 |max misfit|',...
%     '1/6 |max misfit|','1/12 |max misfit|')
% legend('Location','southeast')
% acc_movie
% acc_plots
% hold off
% print('AVISO_all_misfits','-dpng')

toc()