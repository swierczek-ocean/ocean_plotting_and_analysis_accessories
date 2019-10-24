clear
close all
clc
tic()

acc_settings

%%
lw = 2.8;
ms = 20;
cb = 85;
cbd = 36;
c3 = 86;
c6 = 87;
c12 = 88;
%%


%% try on 350m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_350m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_350m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_350m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_350mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_350mB_dep3
% 
% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_350m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_350mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_350m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_350mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['350m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_350m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 350m depth for A in Dec
% 
% %% try on 350m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_350mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_350mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['350m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_350m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 350m depth for B in Dec

%% try on 350m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_350m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_350mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_350m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_350mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['350m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_350m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 350m depth for A in Mar

%% try on 350m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_350mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_350mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['350m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_350m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 350m depth for B in Mar

%% try on 350m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_350m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_350mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_350m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_350mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['350m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_350m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 350m depth for A in Jul

%% try on 350m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_350mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_350mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_350m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['350m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_350m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 350m depth for B in Jul

%% try on 500m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_500m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_500m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_500m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_500mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_500mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_500m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_500mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_500m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_500mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['500m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_500m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 500m depth for A in Dec
% 
% %% try on 500m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_500mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_500mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['500m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_500m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 500m depth for B in Dec

%% try on 500m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_500m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_500mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_500m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_500mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['500m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_500m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 500m depth for A in Mar

%% try on 500m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_500mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_500mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['500m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_500m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 500m depth for B in Mar

%% try on 500m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_500m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_500mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_500m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_500mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['500m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_500m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 500m depth for A in Jul

%% try on 500m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_500mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_500mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_500m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['500m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_500m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 500m depth for B in Jul


%% try on 750m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_750m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_750m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_750m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_750mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_750mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_750m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_750mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_750m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_750mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['750m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_750m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 750m depth for A in Dec
% 
% %% try on 750m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_750mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_750mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['750m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_750m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 750m depth for B in Dec

%% try on 750m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_750m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_750mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_750m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_750mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['750m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_750m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 750m depth for A in Mar

%% try on 750m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_750mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_750mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['750m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_750m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 750m depth for B in Mar

%% try on 750m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_750m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_750mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_750m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_750mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['750m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_750m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 750m depth for A in Jul

%% try on 750m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_750mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_750mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_750m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['750m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_750m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 750m depth for B in Jul


%% try on 1500m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_1500m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_1500m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_1500m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_1500mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_1500mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_1500m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_1500mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_1500m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_1500mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['1500m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_1500m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 1500m depth for A in Dec
% 
% %% try on 1500m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_1500mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_1500mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['1500m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_1500m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 1500m depth for B in Dec

%% try on 1500m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_1500m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_1500mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_1500m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_1500mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['1500m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_1500m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 1500m depth for A in Mar

%% try on 1500m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_1500mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_1500mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['1500m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_1500m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 1500m depth for B in Mar

%% try on 1500m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_1500m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_1500mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_1500m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_1500mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['1500m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_1500m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 1500m depth for A in Jul

%% try on 1500m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_1500mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_1500mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_1500m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['1500m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_1500m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 1500m depth for B in Jul


%% try on 250m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_250m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_250m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_250m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_250mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_250mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_250m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_250mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_250m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_250mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['250m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_250m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 250m depth for A in Dec
% 
% %% try on 250m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_250mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_250mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['250m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_250m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 250m depth for B in Dec

%% try on 250m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_250m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_250mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_250m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_250mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['250m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_250m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 250m depth for A in Mar

%% try on 250m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_250mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_250mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['250m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_250m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 250m depth for B in Mar

%% try on 250m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_250m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_250mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_250m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_250mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['250m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_250m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 250m depth for A in Jul

%% try on 250m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_250mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_250mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_250m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['250m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_250m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 250m depth for B in Jul


%% try on 180m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_180m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_180m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_180m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_180mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_180mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_180m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_180mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_180m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_180mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['180m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_180m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 180m depth for A in Dec
% 
% %% try on 180m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_180mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_180mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['180m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_180m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 180m depth for B in Dec

%% try on 180m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_180m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_180mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_180m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_180mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['180m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_180m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 180m depth for A in Mar

%% try on 180m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_180mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_180mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['180m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_180m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 180m depth for B in Mar

%% try on 180m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_180m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_180mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_180m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_180mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['180m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_180m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 180m depth for A in Jul

%% try on 180m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_180mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_180mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_180m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['180m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_180m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 180m depth for B in Jul


%% try on 130m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_130m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_130m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_130m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_130mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_130mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_130m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_130mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_130m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_130mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['130m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_130m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 130m depth for A in Dec
% 
% %% try on 130m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_130mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_130mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['130m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_130m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 130m depth for B in Dec

%% try on 130m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_130m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_130mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_130m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_130mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['130m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_130m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 130m depth for A in Mar

%% try on 130m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_130mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_130mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['130m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_130m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 130m depth for B in Mar

%% try on 130m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_130m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_130mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_130m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_130mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['130m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_130m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 130m depth for A in Jul

%% try on 130m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_130mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_130mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_130m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['130m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_130m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 130m depth for B in Jul


%% try on 90m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_90m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_90m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_90m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_90mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_90mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_90m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_90mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_90m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_90mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['90m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_90m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 90m depth for A in Dec
% 
% %% try on 90m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_90mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_90mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['90m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_90m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 90m depth for B in Dec

%% try on 90m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_90m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_90mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_90m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_90mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['90m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_90m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 90m depth for A in Mar

%% try on 90m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_90mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_90mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['90m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_90m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 90m depth for B in Mar

%% try on 90m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_90m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_90mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_90m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_90mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['90m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_90m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 90m depth for A in Jul

%% try on 90m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_90mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_90mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_90m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['90m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_90m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 90m depth for B in Jul


%% try on 60m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_60m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_60m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_60m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_60mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_60mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_60m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_60mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_60m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_60mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['60m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_60m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 60m depth for A in Dec
% 
% %% try on 60m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_60mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_60mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['60m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_60m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 60m depth for B in Dec

%% try on 60m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_60m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_60mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_60m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_60mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['60m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_60m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 60m depth for A in Mar

%% try on 60m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_60mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_60mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['60m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_60m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 60m depth for B in Mar

%% try on 60m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_60m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_60mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_60m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_60mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['60m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_60m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 60m depth for A in Jul

%% try on 60m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_60mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_60mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_60m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['60m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_60m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 60m depth for B in Jul


%% try on 40m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_40m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_40m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_40m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_40mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_40mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_40m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_40mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_40m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_40mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['40m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_40m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 40m depth for A in Dec
% 
% %% try on 40m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_40mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_40mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['40m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_40m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 40m depth for B in Dec

%% try on 40m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_40m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_40mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_40m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_40mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['40m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_40m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 40m depth for A in Mar

%% try on 40m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_40mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_40mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['40m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_40m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 40m depth for B in Mar

%% try on 40m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_40m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_40mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_40m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_40mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['40m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_40m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 40m depth for A in Jul

%% try on 40m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_40mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_40mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_40m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['40m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_40m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 40m depth for B in Jul


%% try on 30m depth for A in Dec

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_30m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_30m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_30m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_30mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_30mB_dep3

% startday = 'Dec 15 2016';
% startnum = datenum(startday,'mmm dd yyyy');
% NT = 1440;
% 
% time_MITgcm = MITgcm3_OOI_CTD_30m(:,1);
% ooi_timeA = Proc_GA_OOI_CTD_30mA_dep3(:,1);
% time_ind_startM = find(MITgcm3_OOI_CTD_30m(:,1)>startnum,1);
% time_ind_startOA = find(ooi_timeA>startnum,1);
% 
% time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));
% 
% if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% datefmt = 'mmm dd yyyy';
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_30mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_6M = MITgcm6_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);
% dyn_12M = MITgcm12_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI A','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['30m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_30m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% %% end try on 30m depth for A in Dec
% 
% %% try on 30m depth for B in Dec
% ooi_timeB = Proc_GA_OOI_CTD_30mB_dep3(:,1);
% time_ind_startOB = find(ooi_timeB>startnum,1);
% 
% if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
%     fprintf('pick a different start date \n')
%     return
% end
% 
% fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
%     '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])
% 
% dyn_OOI = Proc_GA_OOI_CTD_30mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
% dyn_3M = MITgcm3_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_6M = MITgcm6_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);
% dyn_12M = MITgcm12_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);
% 
% 
% %  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
% count = 0;
% dt = 480;
% for i = 1:dt/2:(NT-dt)
%     tmp1 = dyn_OOI(i:i+dt-1);
%     tmp2 = dyn_3M(i:i+dt-1);
%     tmp3 = dyn_6M(i:i+dt-1);
%     tmp4 = dyn_12M(i:i+dt-1);
%     if isfinite(sum(tmp1))
%         count = count + 1;
%         tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
%         tmp3M(:,count) = detrend(tmp2).*hanning(dt);
%         tmp6M(:,count) = detrend(tmp3).*hanning(dt);
%         tmp12M(:,count) = detrend(tmp4).*hanning(dt);
%     end
% end
% NW = count;
%  fprintf('number of windows = %g \n',NW)
% ts =1/24;
% df = 1/ts/dt;
% Xper = 1/dt;% 1 /NT for normalization
% nfft = floor(dt/2);
% freq = 1*([1:nfft]-1)*df;
% %  ts =1/24;
% %  Xper = ts*dt%*NW;% period
% %GET FFT FOR EACH AND AVERAGE TOGETHER
% psd_OOI = zeros(1,dt/2);
% psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
% for t = 1:NW
%     k = fft(tmpOOI(:,t))/NW;
%     %    nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_OOI = psd_OOI + psd/NW;
%     k = fft(tmp3M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_3M = psd_3M + psd/NW;
%     k = fft(tmp6M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_6M = psd_6M + psd/NW;
%     k = fft(tmp12M(:,t))/NW;
%     nfft = length(k); nfft = floor((nfft)/2);
%     psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
%     psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
%     psd_12M = psd_12M + psd/NW;
% end
% clear psd
% %  freq = 1*([1:nfft]-1)/Xper;
% 
% %GET ERROR BARS
% nu=1.95*NW;
% err_high = nu/chi2inv(.05/2,nu);
% err_low = nu/chi2inv(1-.05/2,nu);
% myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];
% 
% figure();
% set(gcf, 'Position', [1, 1, 1600, 900])
% h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
% hold on
% h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
% h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
% h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
% l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
% set(l,'linewidth',3);
% legend('OOI B','1/3','1/6','1/12','location','southwest')
% xlabel('cpd')
% ylabel('[psu^2/cpd]')
% title(['30m salinity 60 day PSD starting on ',startday],...
%     'Interpreter','none','FontWeight','Normal')
% set(gca,'fontsize',18)
% grid on;
% acc_plots
% acc_movie
% hold off
% print(['PSD_OOI_vs_MITgcm_SALT_30m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
% 
% %% end try on 30m depth for B in Dec

%% try on 30m depth for A in Mar

startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_30m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_30mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_30m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_30mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['30m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_30m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 30m depth for A in Mar

%% try on 30m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_30mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_30mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['30m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_30m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 30m depth for B in Mar

%% try on 30m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_30m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_30mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_30m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_30mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['30m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_30m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 30m depth for A in Jul

%% try on 30m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_30mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_30mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_30m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['30m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_30m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 30m depth for B in Jul


%% try on 1000m depth for A in Mar

load MITgcm_OOI_equiv/MITgcm3_OOI_CTD_1000m
load MITgcm_OOI_equiv/MITgcm6_OOI_CTD_1000m
load MITgcm_OOI_equiv/MITgcm12_OOI_CTD_1000m
load OOI_CTDs_processed/Proc_GA_OOI_CTD_1000mA_dep3
load OOI_CTDs_processed/Proc_GA_OOI_CTD_1000mB_dep3


startday = 'Mar 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_1000m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_1000mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_1000m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_1000mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['1000m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_1000m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 1000m depth for A in Mar

%% try on 1000m depth for B in Mar
ooi_timeB = Proc_GA_OOI_CTD_1000mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_1000mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['1000m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_1000m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

%% end try on 1000m depth for B in Mar

%% try on 1000m depth for A in Jul

startday = 'Jul 15 2017';
startnum = datenum(startday,'mmm dd yyyy');
NT = 1440;

time_MITgcm = MITgcm3_OOI_CTD_1000m(:,1);
ooi_timeA = Proc_GA_OOI_CTD_1000mA_dep3(:,1);
time_ind_startM = find(MITgcm3_OOI_CTD_1000m(:,1)>startnum,1);
time_ind_startOA = find(ooi_timeA>startnum,1);

time_of_exp = time_MITgcm(time_ind_startM:(time_ind_startM+NT-1));

if ooi_timeA(time_ind_startOA)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

datefmt = 'mmm dd yyyy';
fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeA(time_ind_startOA),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_1000mA_dep3(time_ind_startOA:(time_ind_startOA+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_6M = MITgcm6_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),3);
dyn_12M = MITgcm12_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),3);

%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI A','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['1000m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_1000m_A_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')
%% end try on 1000m depth for A in Jul

%% try on 1000m depth for B in Jul

ooi_timeB = Proc_GA_OOI_CTD_1000mB_dep3(:,1);
time_ind_startOB = find(ooi_timeB>startnum,1);

if ooi_timeB(time_ind_startOB)~=time_of_exp(1)
    fprintf('pick a different start date \n')
    return
end

fprintf(['first model obs at ',datestr(time_of_exp(1),datefmt),...
    '; first OOI obs at ',datestr(ooi_timeB(time_ind_startOB),datefmt),'\n'])

dyn_OOI = Proc_GA_OOI_CTD_1000mB_dep3(time_ind_startOB:(time_ind_startOB+NT-1),5);
dyn_3M = MITgcm3_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_6M = MITgcm6_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),5);
dyn_12M = MITgcm12_OOI_CTD_1000m(time_ind_startM:(time_ind_startM+NT-1),5);


%  %LETS DO 10 DAY WINDOWS WITH 50% OVERLAP
count = 0;
dt = 480;
for i = 1:dt/2:(NT-dt)
    tmp1 = dyn_OOI(i:i+dt-1);
    tmp2 = dyn_3M(i:i+dt-1);
    tmp3 = dyn_6M(i:i+dt-1);
    tmp4 = dyn_12M(i:i+dt-1);
    if isfinite(sum(tmp1))
        count = count + 1;
        tmpOOI(:,count) = detrend(tmp1).*hanning(dt);
        tmp3M(:,count) = detrend(tmp2).*hanning(dt);
        tmp6M(:,count) = detrend(tmp3).*hanning(dt);
        tmp12M(:,count) = detrend(tmp4).*hanning(dt);
    end
end
NW = count;
 fprintf('number of windows = %g \n',NW)
ts =1/24;
df = 1/ts/dt;
Xper = 1/dt;% 1 /NT for normalization
nfft = floor(dt/2);
freq = 1*([1:nfft]-1)*df;
%  ts =1/24;
%  Xper = ts*dt%*NW;% period
%GET FFT FOR EACH AND AVERAGE TOGETHER
psd_OOI = zeros(1,dt/2);
psd_3M=psd_OOI;psd_6M=psd_OOI;psd_12M=psd_OOI;
for t = 1:NW
    k = fft(tmpOOI(:,t))/NW;
    %    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_OOI = psd_OOI + psd/NW;
    k = fft(tmp3M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_3M = psd_3M + psd/NW;
    k = fft(tmp6M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_6M = psd_6M + psd/NW;
    k = fft(tmp12M(:,t))/NW;
    nfft = length(k); nfft = floor((nfft)/2);
    psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
    psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
    psd_12M = psd_12M + psd/NW;
end
clear psd
%  freq = 1*([1:nfft]-1)/Xper;

%GET ERROR BARS
nu=1.95*NW;
err_high = nu/chi2inv(.05/2,nu);
err_low = nu/chi2inv(1-.05/2,nu);
myColorOrder = [Color(cb,:);Color(c3,:);Color(c6,:);Color(c12,:)];

figure();
set(gcf, 'Position', [1, 1, 1600, 900])
h1 = semilogy(freq,psd_OOI,'Color',Color(cb,:),'LineWidth',lw);
hold on
h2 = semilogy(freq,psd_3M,'Color',Color(c3,:),'LineWidth',lw);
h3 = semilogy(freq,psd_6M,'Color',Color(c6,:),'LineWidth',lw);
h4 = semilogy(freq,psd_12M,'Color',Color(c12,:),'LineWidth',lw);
l = line([freq(3) freq(3)],[err_low err_high]*psd_OOI(3),'Color','k');
set(l,'linewidth',3);
legend('OOI B','1/3','1/6','1/12','location','southwest')
xlabel('cpd')
ylabel('[psu^2/cpd]')
title(['1000m salinity 60 day PSD starting on ',startday],...
    'Interpreter','none','FontWeight','Normal')
set(gca,'fontsize',18)
grid on;
acc_plots
acc_movie
hold off
print(['PSD_OOI_vs_MITgcm_SALT_1000m_B_',datestr(startnum,'yyyymmdd'),'_20d_sly'],'-dpng')

close all
%% end try on 1000m depth for B in Jul





toc()