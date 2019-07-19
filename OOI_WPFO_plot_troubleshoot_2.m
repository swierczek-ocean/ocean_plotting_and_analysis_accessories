clear
close all
clc

tic()
acc_settings

load Full_Array

% mm = length(my_D);
% nn = length(my_time);
% [my_time,my_D] = ndgrid(my_time,my_D);
% 
% T = O2_Array1(:,:,1);
% S = O2_Array1(:,:,2);
% P = O2_Array1(:,:,3);
% DO = O2_Array1(:,:,4);
% EOC = O2_Array1(:,:,5);
% SA = gsw_SA_from_SP(S,P,-42.52,-42.98);
% CT = gsw_CT_from_pt(SA,T);
% rho = gsw_rho(SA,CT,P)-1000;
xdatesfull = [datenum('040115','mmddyy'),datenum('050115','mmddyy'),...
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
    datenum('120117','mmddyy'),];

xdateslong = [datenum('040115','mmddyy'),datenum('060115','mmddyy'),...
    datenum('080115','mmddyy'),datenum('100115','mmddyy'),...
    datenum('120115','mmddyy'),datenum('020116','mmddyy'),...
    datenum('040116','mmddyy'),datenum('060116','mmddyy'),...
    datenum('080116','mmddyy'),datenum('100116','mmddyy'),...
    datenum('120116','mmddyy'),datenum('020117','mmddyy'),...
    datenum('040117','mmddyy'),datenum('060117','mmddyy'),...
    datenum('080117','mmddyy'),datenum('100117','mmddyy'),...
    datenum('120117','mmddyy'),];


%% full plot
% ub = max(DO(isnan(DO)==0));
% lb = min(DO(isnan(DO)==0));
lb = 158;
ub = 245;
nlvls = 121;
z = linspace(lb,ub,nlvls);
rho_levels = 50:-2:28;
coords = [time(1) time(end) -4600 -150];

cm = flipud(acc_colormap('tempo'));

figure()
set(gcf, 'Position', [1, 1, 2000, 1000])
colormap(cm)
scatter(time,D,7,DO,'filled');
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
caxis([lb ub])
% [M,h2] = contour(my_time,my_D,rho',rho_levels,'w','ShowText','on');
% h2.LineWidth = 1.5;
% clabel(M,h2,'FontSize',14,'Color','w','FontName','Ubuntu')
title('Argentine Basin OOI mooring dissolved oxygen profile')
xtickangle(45)
yticks(-5000:250:0)
xticks(xdatesfull)
dateFormat = 'mm/yy';
datetick('x',dateFormat,'keepticks')
axis(coords)
acc_plots_prof_contourf 
% legend('temperature','potential density')
% legend('Location','southeast')
print('Argentine_Basin_OOI_Mooring_DO_prof_sc','-dpng')
hold off
%% end full plot