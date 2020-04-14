clear
close all
clc
tic()

%%
acc_settings
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
%% 

%% 
load Model_OOI_equiv/WVEL_OOI_32
load Model_OOI_equiv/WVEL_OOI_62
load Model_OOI_equiv/WVEL_OOI_122
load wvel3 RF3
RF3 = abs(RF3);
%% 

%%
NT = 8760;
A = 732:9491;


for ii=2:50
    count = 0;
    dt = 1200;
    
    TS3 = wvel_ooia_32(ii+1,A)';
    TS6 = wvel_ooia_62(ii+1,A)';
    TS12 = wvel_ooia_122(2*ii,A)';
    
    
    for jj = 1:dt/2:(NT-dt)
        tmp2 = TS3(jj:jj+dt-1);
        tmp3 = TS6(jj:jj+dt-1);
        tmp4 = TS12(jj:jj+dt-1);
        if isfinite(sum(tmp2))
            count = count + 1;
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
    psd_3A = zeros(1,dt/2);
    psd_6A=psd_3A;psd_12A=psd_3A;
    for t = 1:NW
        k = fft(tmp3M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_3A = psd_3A + psd/NW;
        k = fft(tmp6M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_6A = psd_6A + psd/NW;
        k = fft(tmp12M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_12A = psd_12A + psd/NW;
    end
    clear psd
    %  freq = 1*([1:nfft]-1)/Xper;
    
    count = 0;
    dt = 1200;
    
    TS3 = wvel_ooip_32(ii+1,A)';
    TS6 = wvel_ooip_62(ii+1,A)';
    TS12 = wvel_ooip_122(2*ii,A)';
    
    for jj = 1:dt/2:(NT-dt)
        tmp2 = TS3(jj:jj+dt-1);
        tmp3 = TS6(jj:jj+dt-1);
        tmp4 = TS12(jj:jj+dt-1);
        if isfinite(sum(tmp2))
            count = count + 1;
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
    psd_3P = zeros(1,dt/2);
    psd_6P=psd_3P;psd_12P=psd_3P;
    for t = 1:NW
        k = fft(tmp3M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_3P = psd_3P + psd/NW;
        k = fft(tmp6M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_6P = psd_6P + psd/NW;
        k = fft(tmp12M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_12P = psd_12P + psd/NW;
    end
    clear psd
    %  freq = 1*([1:nfft]-1)/Xper;
    
    count = 0;
    dt = 1200;
    
    TS3 = wvel_ooib_32(ii+1,A)';
    TS6 = wvel_ooib_62(ii+1,A)';
    TS12 = wvel_ooib_122(2*ii,A)';
    
    
    for jj = 1:dt/2:(NT-dt)
        tmp2 = TS3(jj:jj+dt-1);
        tmp3 = TS6(jj:jj+dt-1);
        tmp4 = TS12(jj:jj+dt-1);
        if isfinite(sum(tmp2))
            count = count + 1;
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
    psd_3B = zeros(1,dt/2);
    psd_6B=psd_3B;psd_12B=psd_3B;
    for t = 1:NW
        k = fft(tmp3M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_3B = psd_3B + psd/NW;
        k = fft(tmp6M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_6B = psd_6B + psd/NW;
        k = fft(tmp12M(:,t))/NW;
        nfft = length(k); nfft = floor((nfft)/2);
        psd(1) = (abs(k(1)).^2)*Xper;%IS Xper correct?
        psd(2:nfft) = (abs(k(2:nfft)).^2)*Xper*2;%
        psd_12B = psd_12B + psd/NW;
    end
    clear psd
    %  freq = 1*([1:nfft]-1)/Xper;
    
    psd_3 = (psd_3A + psd_3B + psd_3P)./3;
    psd_6 = (psd_6A + psd_6B + psd_6P)./3;
    psd_12 = (psd_12A + psd_12B + psd_12P)./3;
    
    figure();
    set(gcf, 'Position', [1, 1, 1600, 900])
    
    h2 = loglog(freq,psd_3,'Color',Color(c3,:),'LineWidth',lw);
    hold on
    h3 = loglog(freq,psd_6,'Color',Color(c6,:),'LineWidth',lw);
    h4 = loglog(freq,psd_12,'Color',Color(c12,:),'LineWidth',lw);
    
    legend('1/3','1/6','1/12','location','southwest')
    xlabel('cpd')
    ylabel('[m^2/s^2/cpd]')
    ylim([5e-16 3e-8])
    xlim([2e-2 12])
    title([num2str(RF3(ii)),'m vertical velocity PSD'],...
        'Interpreter','none','FontWeight','Normal')
    set(gca,'fontsize',18)
    grid on;
    acc_plots
    acc_movie
    hold off
    print(['WVEL_SPECTRA/WVEL_PSD_',num2str(ii,'%02.f'),'_',num2str(RF3(ii)),'m'],'-dpng')
    close all
end


toc()