clear
close all
clc
tic()

acc_settings

%%
load mask
load eddyt3calc
load eddyt6calc
load eddyt12calc
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
nlvls = 150;
%%

%% 

cm = acc_colormap('cmo_balance');

lb = -1e-4;
ub = 1e-4;
z = linspace(lb,ub,nlvls);

% z1 = -1.2e-3:0.0001:-4e-4;
z2 = -3.9e-4:0.00001:-1.1e-4;
z = [z2,z,-z2];

RF3 = abs(RF3);


for ii=1:52
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,eddyt3calc(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 mean ',num2str(RF3(ii)),'m w'' theta'' [deg C m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,eddyt6calc(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 mean ',num2str(RF3(ii)),'m w'' theta'' [deg C m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,eddyt12calc(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 mean ',num2str(RF3(ii)),'m w'' theta'' [deg C m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['EDDY_THETA/THETA_EDDY_',num2str(ii,'%02.f'),'_',num2str(RF3(ii)),'m'],'-dpng')
    close all
end

%% 

clear

acc_settings

%%
load mask
load eddyc3calc
load eddyc6calc
load eddyc12calc
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
nlvls = 150;
%%

%% 

cm = acc_colormap('cmo_balance');

lb = -6e-7;
ub = 6e-7;
z = linspace(lb,ub,nlvls);

z2 = -2.5e-6:0.0000001:-.7e-6;
z = [z2,z,-z2];

RF3 = abs(RF3);


for ii=1:52
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,eddyc3calc(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/3 mean ',num2str(RF3(ii)),'m w'' DIC'' [mol C/m^3 m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v2
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,eddyc6calc(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/6 mean ',num2str(RF3(ii)),'m w'' DIC'' [mol C/m^3 m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v3
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,eddyc12calc(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    contour(XCm,YCm,mask(:,:,ii),'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    title(['1/12 mean ',num2str(RF3(ii)),'m w'' DIC'' [mol C/m^3 m/s]'],'FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v4
    hold off
    set(gcf,'InvertHardCopy','off'); print('-r100',['EDDY_DIC/DIC_EDDY_',num2str(ii,'%02.f'),'_',num2str(RF3(ii)),'m'],'-dpng')
    close all
end

%% 
