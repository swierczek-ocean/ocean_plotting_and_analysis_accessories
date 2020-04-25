clear
close all
clc
tic()

acc_settings

%%
load mask
load eddyt3
load eddyt6
load eddyt12
RF3 = squeeze(rdmds('../Grids/3/RF'));
RF3 = RF3(1:52);
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
nlvls = 150;
%%

%% 

cm = acc_colormap('cmo_balance');

lb = -6e-4;
ub = 6e-4;
z = linspace(lb,ub,nlvls);

z1 = -2e-3:0.0001:-1.1e-3;
z2 = -1e-3:0.00001:-6.1e-4;
z = [z1,z2,z,-z2,-z1];

RF3 = abs(RF3);


for ii=1:52
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,wtheta3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 ',num2str(RF3(ii)),'m <w*theta> [deg C m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,wtheta6(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 ',num2str(RF3(ii)),'m <w*theta> [deg C m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,wtheta12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 ',num2str(RF3(ii)),'m <w*theta> [deg C m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['TOTAL_WTHETA/WTHETA_MEAN_',num2str(ii,'%02.f'),'_',num2str(RF3(ii)),'m'],'-dpng')
    close all
end

%% 

clear

acc_settings

%%
load mask
load eddyc3
load eddyc6
load eddyc12
RF3 = squeeze(rdmds('../Grids/3/RF'));
RF3 = RF3(1:52);
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
nlvls = 150;
%%

%% 

cm = acc_colormap('cmo_balance');

lb = -6e-4;
ub = 6e-4;
z = linspace(lb,ub,nlvls);

z1 = -2e-3:0.0001:-1.1e-3;
z2 = -1e-3:0.00001:-6.1e-4;
z = [z1,z2,z,-z2,-z1];

RF3 = abs(RF3);


for ii=1:52
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,wdic3(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 ',num2str(RF3(ii)),'m <w*DIC> [mol C/m^3 m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,wdic6(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 ',num2str(RF3(ii)),'m <w*DIC> [mol C/m^3 m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,wdic12(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 ',num2str(RF3(ii)),'m <w*DIC> [mol C/m^3 m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['TOTAL_WDIC/WDIC_MEAN_',num2str(ii,'%02.f'),'_',num2str(RF3(ii)),'m'],'-dpng')
    close all
end

%% 
