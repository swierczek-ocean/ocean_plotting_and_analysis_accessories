clear 
close all
clc
tic()


load ../2019_06_June_analysis/BSOSE_ETAN SPEED* XCS YCS
num_snaps = 20;
load mask
mask = permute(mask,[2,1,3]);
XCm = XCm - 360;
XCS = XCS - 360;

index = randperm(395,num_snaps);
SPEED_BSOSE = squeeze(SPEED_BSOSE(:,:,1,index));
cm = flipud(acc_colormap('cmo_tempo'));

z = linspace(0,1.2,100);
z = [z,2];

for ii=1:num_snaps
    
    temp = SPEED_BSOSE(:,:,ii);
    temp(temp==0) = NaN;
    
    
    set(gcf, 'Position', [1, 1, 1500, 900])
    
    colormap(cm)
    m_proj('albers','longitudes',[-72.1 -7.8], ...
        'latitudes',[-60 -29.8]);
    
    m_contourf(XCS,YCS,temp,'LineStyle','none','LevelList',z)
    hold on
    m_contour(XCm,YCm,mask(:,:,1),'k','LineWidth',2)
    m_grid('fontsize',16);
    title('snapshot of surface currents in Argentine Basin [m/s]','FontWeight','Normal','FontSize',19)
    c = colorbar('eastoutside','FontSize',16);
    acc_mplots
    hold off
    set(gcf,'InvertHardCopy','off');
    print('-r300',['AB_currents_snap_',num2str(ii)],'-dpng')
    close all
end














toc()