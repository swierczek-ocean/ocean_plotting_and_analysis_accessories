clear
close all
clc
tic()

acc_settings

%%
load mask
load XY3 XC3 YC3 hFacC3
load XY6 XC6 YC6 hFacC6
load XY12 XC12 YC12 hFacC12
load ../2020_02_February_analysis/MLD_Series122
load ../2020_02_February_analysis/MLD_Series62
load ../2020_02_February_analysis/MLD_Series32

mld3 = mean(MLD_Series32(:,:,32:end),3);
mld6 = mean(MLD_Series62(:,:,32:end),3);
mld12 = mean(MLD_Series122(:,:,32:end),3);

for ii=1:192
    for jj=1:132
        if hFacC3(ii,jj,1)~=0
            if isnan(mld3(ii,jj))==1
                temp = MLD_Series32(ii,jj,32:end); 
                temp = temp(isnan(temp)==0);
                mld3(ii,jj) = mean(temp);
            end
        end
    end
end

for ii=1:384
    for jj=1:260
        if hFacC6(ii,jj,1)~=0
            if isnan(mld6(ii,jj))==1
                temp = MLD_Series62(ii,jj,32:end); 
                temp = temp(isnan(temp)==0);
                mld6(ii,jj) = mean(temp);
            end
        end
    end
end

for ii=1:756
    for jj=1:512
        if hFacC12(ii,jj,1)~=0
            if isnan(mld12(ii,jj))==1
                temp = MLD_Series122(ii,jj,32:end); 
                temp = temp(isnan(temp)==0);
                mld12(ii,jj) = mean(temp);
            end
        end
    end
end

clear MLD_Series*

load ../2019_06_June_analysis/AB122_output THETA_*JD* TFLUX*JD* CFLUX*JD* DIC_*JD* 
load ../2019_06_June_analysis/AB62_output THETA_*JD* TFLUX*JD* CFLUX*JD* DIC_*JD*
load ../2019_06_June_analysis/AB32_output THETA_*JD* TFLUX*JD* CFLUX*JD* DIC_*JD*
load ph3
load ph6
load ph12
load alk3
load alk6
load alk12
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
% [XC3,YC3] = ndgrid(XC3,YC3);
% [XC6,YC6] = ndgrid(XC6,YC6);
% [XC12,YC12] = ndgrid(XC12,YC12);
nlvls = 100;
%%

%% 

mld3 = fillmissingstan(mld3);
mld6 = fillmissingstan(mld6);
mld12 = fillmissingstan(mld12);

sst12 = fillmissingstan(THETA_122_JD_avg);
sst6 = fillmissingstan(THETA_62_JD_avg);
sst3 = fillmissingstan(THETA_32_JD_avg);

clear THETA*

tflux12 = fillmissingstan(TFLUX_122_JD_avg);
tflux6 = fillmissingstan(TFLUX_62_JD_avg);
tflux3 = fillmissingstan(TFLUX_32_JD_avg);

clear TFLUX*

cflux12 = fillmissingstan(CFLUX_122_JD_avg);
cflux6 = fillmissingstan(CFLUX_62_JD_avg);
cflux3 = fillmissingstan(CFLUX_32_JD_avg);

clear CFLUX*

dic12 = fillmissingstan(DIC_122_JD_avg);
dic6 = fillmissingstan(DIC_62_JD_avg);
dic3 = fillmissingstan(DIC_32_JD_avg);

clear DIC*

alk12 = fillmissingstan(alk12);
alk6 = fillmissingstan(alk6);
alk3 = fillmissingstan(alk3);


ph12 = fillmissingstan(ph12);
ph6 = fillmissingstan(ph6);
ph3 = fillmissingstan(ph3);


F = griddedInterpolant(XC12,YC12,mld12,'linear');
mld12_6 = F(XC6,YC6);
mld12_3 = F(XC3,YC3);
F = griddedInterpolant(XC6,YC6,mld6,'linear');
mld6_3 = F(XC3,YC3);

F = griddedInterpolant(XC12,YC12,sst12,'linear');
sst12_6 = F(XC6,YC6);
sst12_3 = F(XC3,YC3);
F = griddedInterpolant(XC6,YC6,sst6,'linear');
sst6_3 = F(XC3,YC3);

F = griddedInterpolant(XC12,YC12,tflux12,'linear');
tflux12_6 = F(XC6,YC6);
tflux12_3 = F(XC3,YC3);
F = griddedInterpolant(XC6,YC6,tflux6,'linear');
tflux6_3 = F(XC3,YC3);

F = griddedInterpolant(XC12,YC12,cflux12,'linear');
cflux12_6 = F(XC6,YC6);
cflux12_3 = F(XC3,YC3);
F = griddedInterpolant(XC6,YC6,cflux6,'linear');
cflux6_3 = F(XC3,YC3);

F = griddedInterpolant(XC12,YC12,dic12,'linear');
dic12_6 = F(XC6,YC6);
dic12_3 = F(XC3,YC3);
F = griddedInterpolant(XC6,YC6,dic6,'linear');
dic6_3 = F(XC3,YC3);

F = griddedInterpolant(XC12,YC12,ph12,'linear');
ph12_6 = F(XC6,YC6);
ph12_3 = F(XC3,YC3);
F = griddedInterpolant(XC6,YC6,ph6,'linear');
ph6_3 = F(XC3,YC3);

F = griddedInterpolant(XC12,YC12,alk12,'linear');
alk12_6 = F(XC6,YC6);
alk12_3 = F(XC3,YC3);
F = griddedInterpolant(XC6,YC6,alk6,'linear');
alk6_3 = F(XC3,YC3);

clear sst12 tflux12 cflux12 dic12 alk12 ph12

difmld126 = mld12_6 - mld6;
difmld123 = mld12_3 - mld3;
difmld63 = mld6_3 - mld3;

difsst126 = sst12_6 - sst6;
difsst123 = sst12_3 - sst3;
difsst63 = sst6_3 - sst3;

diftf126 = tflux12_6 - tflux6;
diftf123 = tflux12_3 - tflux3;
diftf63 = tflux6_3 - tflux3;

difcf126 = cflux12_6 - cflux6;
difcf123 = cflux12_3 - cflux3;
difcf63 = cflux6_3 - cflux3;

difdic126 = dic12_6 - dic6;
difdic123 = dic12_3 - dic3;
difdic63 = dic6_3 - dic3;

difalk126 = alk12_6 - alk6;
difalk123 = alk12_3 - alk3;
difalk63 = alk6_3 - alk3;

difph126 = ph12_6 - ph6;
difph123 = ph12_3 - ph3;
difph63 = ph6_3 - ph3;

for ii=1:384
    for jj=1:260
        if hFacC6(ii,jj,1)==0
            difsst126(ii,jj) = NaN;
            diftf126(ii,jj) = NaN;
            difcf126(ii,jj) = NaN;
            difdic126(ii,jj) = NaN;
            difph126(ii,jj) = NaN;
            difalk126(ii,jj) = NaN;
            difmld126(ii,jj) = NaN;
        end
    end
end

for ii=1:192
    for jj=1:132
        if hFacC3(ii,jj,1)==0
            difsst123(ii,jj) = NaN;
            diftf123(ii,jj) = NaN;
            difcf123(ii,jj) = NaN;
            difdic123(ii,jj) = NaN;
            difalk123(ii,jj) = NaN;
            difph123(ii,jj) = NaN;
            difmld123(ii,jj) = NaN;
            difmld63(ii,jj) = NaN;
            difsst63(ii,jj) = NaN;
            diftf63(ii,jj) = NaN;
            difcf63(ii,jj) = NaN;
            difdic63(ii,jj) = NaN;
            difalk63(ii,jj) = NaN;
            difph63(ii,jj) = NaN;
        end
    end
end

%% 

cm = acc_colormap('cmo_balance');
lb = -50;
ub = 50;
z = linspace(lb,ub,nlvls);
z = [-100,-90,-80,-70,-60,z,60,70,80,90,100];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,difmld63,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - 1/3 mean MLD','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC3,YC3,difmld123,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/3 mean MLD','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC6,YC6,difmld126,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/6 mean MLD','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r150','diff_mld','-dpng')
close all


cm = acc_colormap('cmo_balance');
lb = -0.02;
ub = 0.02;
z = linspace(lb,ub,nlvls);
z = [-0.035,-0.03,-0.025,z,0.025,0.03,0.035];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,difph63,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - 1/3 mean surface pH','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC3,YC3,difph123,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/3 mean surface pH','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC6,YC6,difph126,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/6 mean surface pH','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r150','diff_ph','-dpng')
close all




cm = acc_colormap('cmo_balance');
lb = -0.02;
ub = 0.02;
z = linspace(lb,ub,nlvls);
z = [-0.055,-0.045,-0.035,-0.03,-0.025,z,0.025,0.03,0.035,0.045,0.055];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,difalk63,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - 1/3 mean surface alk [mol eq]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC3,YC3,difalk123,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/3 mean surface alk [mol eq]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC6,YC6,difalk126,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/6 mean surface alk [mol eq]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r150','diff_alk','-dpng')
close all


cm = acc_colormap('cmo_balance');
lb = -0.02;
ub = 0.02;
z = linspace(lb,ub,nlvls);
z = [-0.035,-0.03,-0.025,z,0.025,0.03,0.035];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,difdic63,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - 1/3 mean surface DIC [mol C/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC3,YC3,difdic123,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/3 mean surface DIC [mol C/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC6,YC6,difdic126,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/6 mean surface DIC [mol C/m^3]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r150','diff_dic','-dpng')
close all

cm = acc_colormap('cmo_balance');
lb = -1.75;
ub = 1.75;
z = linspace(lb,ub,nlvls);
z = [-5,-2.5,z,2.5,5];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,difsst63,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - 1/3 mean SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC3,YC3,difsst123,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/3 mean SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC6,YC6,difsst126,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/6 mean SST [deg C]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r150','diff_sst','-dpng')
close all


cm = acc_colormap('cmo_balance');
lb = -80;
ub = 80;
z = linspace(lb,ub,nlvls);
z = [-125,-110,-100,-90,z,90,100,110,125];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,diftf63,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - 1/3 mean heat flux [W/m^2]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC3,YC3,diftf123,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/3 mean heat flux [W/m^2]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC6,YC6,diftf126,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/6 mean heat flux [W/m^2]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r150','diff_tflux','-dpng')
close all


cm = acc_colormap('cmo_balance');
lb = -5e-8;
ub = 5e-8;
z = linspace(lb,ub,nlvls);
z = [-1e-7,-7e-8,-6e-8,z,6e-8,7e-8,1e-7];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)

ax2 = subplot(2,2,2);
contourf(XC3,YC3,difcf63,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/6 - 1/3 mean carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v2
hold off

ax3 = subplot(2,2,3);
contourf(XC3,YC3,difcf123,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/3 mean carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v3
hold off

ax4 = subplot(2,2,4);
contourf(XC6,YC6,difcf126,'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
contour(XCm,YCm,mask(:,:,1),'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
title('1/12 - 1/6 mean carbon flux [mol C/m^2/s]','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v4
hold off
set(gcf,'InvertHardCopy','off'); print('-r150','diff_cflux','-dpng')
close all


toc()