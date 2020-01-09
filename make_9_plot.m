clear
close all
clc
tic()
acc_settings

%%
load mask
% load XY3 XC3 YC3
% load XY6  XC6 YC6
% load XY12 XC12 YC12
load pco2_misfits
load woa_misfits
sz = 35;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 349.9 -58.7 -32];
%%

%% giant plot
cm = acc_colormap('cbr_diff');

lbp = -120;
ubp = 120;
nlvls = 101;
zp = linspace(lbp,ubp,nlvls);

lbo = -0.05;
ubo = 0.05;
nlvls = 101;
zo = linspace(lbo,ubo,nlvls);

lbn = -0.01;
ubn = 0.01;
nlvls = 101;
zn = linspace(lbn,ubn,nlvls);

figure()
set(gcf, 'Position', [1, 1, 1400, 950])
colormap(cm)


ax1 = subplot(3,3,1);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(pco2_socat_misfit3(:,1),pco2_socat_misfit3(:,2),sz,...
    pco2_socat_misfit3(:,3),'filled')
caxis([lbp ubp])
axis(inside_coords)
title('1/3 pCO2 misfit (SOCAT) [\muatm]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(1)
hold off

ax2 = subplot(3,3,2);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(pco2_socat_misfit6(:,1),pco2_socat_misfit6(:,2),sz,...
    pco2_socat_misfit6(:,3),'filled')
caxis([lbp ubp])
axis(inside_coords)
title('1/6 pCO2 misfit (SOCAT) [\muatm]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(2)
hold off

ax3 = subplot(3,3,3);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(pco2_socat_misfit12(:,1),pco2_socat_misfit12(:,2),sz,...
    pco2_socat_misfit12(:,3),'filled')
caxis([lbp ubp])
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbp ubp]);
axis(inside_coords)
title('1/12 pCO2 misfit (SOCAT) [\muatm]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(3)
hold off

ax4 = subplot(3,3,4);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(do_woa_misfit3(:,1),do_woa_misfit3(:,2),sz,...
    do_woa_misfit3(:,3),'filled')
caxis([lbo ubo])
axis(inside_coords)
title('1/3 surf DO misfit (WOA) [mol O/m^3]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(4)
hold off

ax5 = subplot(3,3,5);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(do_woa_misfit6(:,1),do_woa_misfit6(:,2),sz,...
    do_woa_misfit6(:,3),'filled')
caxis([lbo ubo])
axis(inside_coords)
title('1/6 surf DO misfit (WOA) [mol O/m^3]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(5)
hold off

ax6 = subplot(3,3,6);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(do_woa_misfit12(:,1),do_woa_misfit12(:,2),sz,...
    do_woa_misfit12(:,3),'filled')
caxis([lbo ubo])
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbo ubo]);
axis(inside_coords)
title('1/12 surf DO misfit (WOA) [mol O/m^3]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(6)
hold off

ax7 = subplot(3,3,7);
contour(XCm,YCm,mask(:,:,4),'Color','k')
hold on
scatter(no3_woa_misfit3(:,1),no3_woa_misfit3(:,2),sz,...
    no3_woa_misfit3(:,3),'filled')
caxis([lbn ubn])
axis(inside_coords)
title('1/3 20m NO3 misfit (WOA) [mol N/m^3]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(7)
hold off

ax8 = subplot(3,3,8);
contour(XCm,YCm,mask(:,:,4),'Color','k')
hold on
scatter(no3_woa_misfit6(:,1),no3_woa_misfit6(:,2),sz,...
    no3_woa_misfit6(:,3),'filled')
caxis([lbn ubn])
axis(inside_coords)
title('1/6 20m NO3 misfit (WOA) [mol N/m^3]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(8)
hold off

ax9 = subplot(3,3,9);
contour(XCm,YCm,mask(:,:,4),'Color','k')
hold on
scatter(no3_woa_misfit12(:,1),no3_woa_misfit12(:,2),sz,...
    no3_woa_misfit12(:,3),'filled')
caxis([lbn ubn])
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbn ubn]);
axis(inside_coords)
title('1/12 20m NO3 misfit (WOA) [mol N/m^3]','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(9)
hold off

% sgtitle('misfits with gridded climatologies','FontWeight','Normal','FontSize',10)


set(gcf,'InvertHardCopy','off'); print('-r300','MISFIT_9_PLOT_1','-dpng')
clear
%% giant plot

%% giant plot
clear
close all
clc

acc_settings

%%
load mask
% load XY3 XC3 YC3
% load XY6  XC6 YC6
% load XY12 XC12 YC12
load norm_pco2_misfits
load norm_woa_misfits
sz = 35;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 349.9 -58.7 -32];
%%
cm = acc_colormap('cbr_diff');

lbp = -1;
ubp = 1;
nlvls = 101;
zp = linspace(lbp,ubp,nlvls);

lbo = -1;
ubo = 1;
nlvls = 101;
zo = linspace(lbo,ubo,nlvls);

lbn = -1;
ubn = 1;
nlvls = 101;
zn = linspace(lbn,ubn,nlvls);

figure()
set(gcf, 'Position', [1, 1, 1400, 950])
colormap(cm)


ax1 = subplot(3,3,1);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(norm_pco2_socat_misfit3(:,1),norm_pco2_socat_misfit3(:,2),sz,...
    norm_pco2_socat_misfit3(:,3),'filled')
caxis([lbp ubp])
axis(inside_coords)
title('1/3 pCO2 normalized misfit (SOCAT)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(1)
hold off

ax2 = subplot(3,3,2);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(norm_pco2_socat_misfit6(:,1),norm_pco2_socat_misfit6(:,2),sz,...
    norm_pco2_socat_misfit6(:,3),'filled')
caxis([lbp ubp])
axis(inside_coords)
title('1/6 pCO2 normalized misfit (SOCAT)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(2)
hold off

ax3 = subplot(3,3,3);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(norm_pco2_socat_misfit12(:,1),norm_pco2_socat_misfit12(:,2),sz,...
    norm_pco2_socat_misfit12(:,3),'filled')
caxis([lbp ubp])
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbp ubp]);
axis(inside_coords)
title('1/12 pCO2 normalized misfit (SOCAT)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(3)
hold off

ax4 = subplot(3,3,4);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(norm_do_woa_misfit3(:,1),norm_do_woa_misfit3(:,2),sz,...
    norm_do_woa_misfit3(:,3),'filled')
caxis([lbo ubo])
axis(inside_coords)
title('1/3 surf DO normalized misfit (WOA)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(4)
hold off

ax5 = subplot(3,3,5);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(norm_do_woa_misfit6(:,1),norm_do_woa_misfit6(:,2),sz,...
    norm_do_woa_misfit6(:,3),'filled')
caxis([lbo ubo])
axis(inside_coords)
title('1/6 surf DO normalized misfit (WOA)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(5)
hold off

ax6 = subplot(3,3,6);
contour(XCm,YCm,mask(:,:,1),'Color','k')
hold on
scatter(norm_do_woa_misfit12(:,1),norm_do_woa_misfit12(:,2),sz,...
    norm_do_woa_misfit12(:,3),'filled')
caxis([lbo ubo])
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbo ubo]);
axis(inside_coords)
title('1/12 surf DO normalized misfit (WOA)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(6)
hold off

ax7 = subplot(3,3,7);
contour(XCm,YCm,mask(:,:,4),'Color','k')
hold on
scatter(norm_no3_woa_misfit3(:,1),norm_no3_woa_misfit3(:,2),sz,...
    norm_no3_woa_misfit3(:,3),'filled')
caxis([lbn ubn])
axis(inside_coords)
title('1/3 20m NO3 normalized misfit (WOA)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(7)
hold off

ax8 = subplot(3,3,8);
contour(XCm,YCm,mask(:,:,4),'Color','k')
hold on
scatter(norm_no3_woa_misfit6(:,1),norm_no3_woa_misfit6(:,2),sz,...
    norm_no3_woa_misfit6(:,3),'filled')
caxis([lbn ubn])
axis(inside_coords)
title('1/6 20m NO3 normalized misfit (WOA)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(8)
hold off

ax9 = subplot(3,3,9);
contour(XCm,YCm,mask(:,:,4),'Color','k')
hold on
scatter(norm_no3_woa_misfit12(:,1),norm_no3_woa_misfit12(:,2),sz,...
    norm_no3_woa_misfit12(:,3),'filled')
caxis([lbn ubn])
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lbn ubn]);
axis(inside_coords)
title('1/12 20m NO3 normalized misfit (WOA)','FontWeight','Normal','FontSize',10)
acc_movie_9
acc_9plot(9)
hold off

% sgtitle('misfits with gridded climatologies','FontWeight','Normal','FontSize',10)


set(gcf,'InvertHardCopy','off'); print('-r300','NORM_MISFIT_9_PLOT_1','-dpng')

%% giant plot




toc()