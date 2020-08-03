clear
close all
clc
tic()

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
m_proj('stereographic','lat',-90,'long',0,'radius',60);
m_grid('xtick',6,'tickdir','in','ytick',[-90 -68 -52],...
    'linest',':','fontsize',16);
m_coast('patch',[.7 .7 .7],'edgecolor','k');
acc_mplots



m_proj('stereographic','lat',90,'long',30,'radius',25);
m_elev('contour',[-3500:1000:-500],'edgecolor','b');
m_grid('xtick',12,'tickdir','out','ytick',[70 80],'linest','-');
m_coast('patch',[.7 .7 .7],'edgecolor','r');









toc()