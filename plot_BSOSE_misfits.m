clear
close all
clc
tic()

load BSOSE_misfits

USGO_S(USGO_S>1.9714) = 1.9714;

cm = acc_colormap('cmo_balance');

figure()
colormap(cm)
set(gcf, 'Position', [1, 1, 1600, 900])
m_proj('stereographic','lat',-90,'long',0,'radius',60);
m_scatter(prof_lon,prof_lat,30,USGO_S,'filled');
m_grid('xtick',6,'tickdir','in','ytick',[-90 -60 -45],...
    'linest',':','fontsize',1);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
cbar = colorbar('eastoutside');
cbar.FontSize = 22;
title('2017 BSOSE-Argo mean salinity misfit in upper 100m [psu]',...
    'FontWeight','Normal','FontSize',20)
acc_mplots
set(gcf,'InvertHardCopy','off'); 
print('-r200','BSOSE_salt_misfit','-dpng')


USGO_T(USGO_T>5) = 5;
USGO_T(USGO_T<-5) = -5;

figure()
colormap(cm)
set(gcf, 'Position', [1, 1, 1600, 900])
m_proj('stereographic','lat',-90,'long',0,'radius',60);
m_scatter(prof_lon,prof_lat,30,USGO_T,'filled');
m_grid('xtick',6,'tickdir','in','ytick',[-90 -60 -45],...
    'linest',':','fontsize',1);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
cbar = colorbar('eastoutside');
cbar.FontSize = 22;
title('2017 BSOSE-Argo mean pot temp misfit in upper 100m [deg C]',...
    'FontWeight','Normal','FontSize',20)
acc_mplots
set(gcf,'InvertHardCopy','off'); 
print('-r200','BSOSE_temp_misfit','-dpng')


VIZ_O2(VIZ_O2<-0.0757) = -0.0757;
mukg = 1000000/1035;

figure()
colormap(cm)
set(gcf, 'Position', [1, 1, 1600, 900])
m_proj('stereographic','lat',-90,'long',0,'radius',60);
m_scatter(prof_lonv,prof_latv,45,mukg.*VIZ_O2,'filled');
m_grid('xtick',6,'tickdir','in','ytick',[-90 -60 -45],...
    'linest',':','fontsize',1);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
cbar = colorbar('eastoutside');
cbar.FontSize = 22;
title('2017 BSOSE-Argo mean dissolved oxygen misfit in upper 100m [\mumol Okg]',...
    'FontWeight','Normal','FontSize',20)
acc_mplots
set(gcf,'InvertHardCopy','off'); 
print('-r200','BSOSE_O2_misfit','-dpng')


figure()
colormap(cm)
set(gcf, 'Position', [1, 1, 1600, 900])
m_proj('stereographic','lat',-90,'long',0,'radius',60);
m_scatter(prof_lonv,prof_latv,45,mukg.*VIZ_NO3,'filled');
m_grid('xtick',6,'tickdir','in','ytick',[-90 -60 -45],...
    'linest',':','fontsize',1);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
cbar = colorbar('eastoutside');
cbar.FontSize = 22;
title('2017 BSOSE-Argo mean nitrate misfit in upper 100m [\mumol N/kg]',...
    'FontWeight','Normal','FontSize',20)
acc_mplots
set(gcf,'InvertHardCopy','off'); 
print('-r200','BSOSE_NO3_misfit','-dpng')

VIZ_DIC(VIZ_DIC<-0.0501) = -0.0501;

figure()
colormap(cm)
set(gcf, 'Position', [1, 1, 1600, 900])
m_proj('stereographic','lat',-90,'long',0,'radius',60);
m_scatter(prof_lonv,prof_latv,45,mukg.*VIZ_DIC,'filled');
m_grid('xtick',6,'tickdir','in','ytick',[-90 -60 -45],...
    'linest',':','fontsize',1);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
cbar = colorbar('eastoutside');
cbar.FontSize = 22;
title('2017 BSOSE-Argo mean DIC misfit in upper 100m [\mumol C/kg]',...
    'FontWeight','Normal','FontSize',20)
acc_mplots
set(gcf,'InvertHardCopy','off'); 
print('-r200','BSOSE_DIC_misfit','-dpng')

VIZ_CHL(VIZ_CHL<-0.2162) = -0.2162;

figure()
colormap(cm)
set(gcf, 'Position', [1, 1, 1600, 900])
m_proj('stereographic','lat',-90,'long',0,'radius',60);
m_scatter(prof_lonv,prof_latv,45,VIZ_CHL,'filled');
m_grid('xtick',6,'tickdir','in','ytick',[-90 -60 -45],...
    'linest',':','fontsize',1);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
cbar = colorbar('eastoutside');
cbar.FontSize = 22;
title('2017 BSOSE-Argo mean chlorophyll misfit in upper 100m [g/m^3]',...
    'FontWeight','Normal','FontSize',24)
acc_mplots
set(gcf,'InvertHardCopy','off'); 
print('-r200','BSOSE_CHL_misfit','-dpng')

close all

toc()