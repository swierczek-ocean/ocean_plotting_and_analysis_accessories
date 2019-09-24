clear
close all
clc

tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12
load BSOSE_slice_avgs O2_series YCS
load MAT_files/AB122_output_O2_slice_vert O2_Series_slice_122
load MAT_files/AB62_output_O2_slice_vert O2_Series_slice_62
load MAT_files/AB32_output_O2_slice_vert O2_Series_slice_32

RC3 = -cumsum(DRF3);
RC6 = -cumsum(DRF6);
RC12 = -cumsum(DRF12);
RCS = RC6;
RCm = -cumsum(DRF6);

%%


%%
numdate = datenum('12012016','mmddyyyy');
option = 1;
mask = permute(mask,[2,1,3]);
inside_coords = [-58.7 -32 -6000 0];
[YC3,RC3] = ndgrid(YC3,RC3);
[YC6,RC6] = ndgrid(YC6,RC6);
[YC12,RC12] = ndgrid(YC12,RC12);
[YCS,RCS] = ndgrid(YCS,RCS);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str *DYG* *DXG* *DRF*

slice_mask = squeeze(mask(:,236,:));
YCm = YCm';
[YCm,RCm] = ndgrid(YCm,RCm);
%%

%% O2
cm = flipud(acc_colormap('cmo_tempo'));
cm = [cm;Color(46,:)];
[lb,ub,nlvls] = get_color_bounds_standard(O2_series,...
    O2_Series_slice_32,O2_Series_slice_62,O2_Series_slice_122,option);
nlvls = 8*(nlvls - 1) +1;
z = linspace(lb,ub,nlvls);
z = [-100000,z,9999998];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm)
ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_series(:,:,1),'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees'):)
title('1/6 B-SOSE O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_Series_slice_32(:,:,1),'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees'):)
title('1/3 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_Series_slice_62(:,:,1),'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees'):)
title('1/6 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_Series_slice_122(:,:,1),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees'):)
title('1/12 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('O2_slice.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 30;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

ax1 = subplot(2,2,1);
contourf(YCS,RCS,O2_series(:,:,1),'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
% ytickformat('degrees'):)
title('1/6 B-SOSE O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s1
text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax2 = subplot(2,2,2);
contourf(YC3,RC3,O2_Series_slice_32(:,:,1),'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees'):)
title('1/3 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s2
text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax3 = subplot(2,2,3);
contourf(YC6,RC6,O2_Series_slice_62(:,:,1),'LineStyle','none','LevelList',z);
hold on
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees'):)
title('1/6 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s3
text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

ax4 = subplot(2,2,4);
contourf(YC12,RC12,O2_Series_slice_122(:,:,1),'LineStyle','none','LevelList',z);
hold on
cbar = colorbar('eastoutside');
set(cbar,'XLim',[lb ub]);
% contour(YCm,RCm,slice_mask,'Color','k')
caxis([lb ub])
axis(inside_coords)
xtickformat('degrees')
% ytickformat('degrees'):)
title('1/12 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_s4
text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
hold off

drawnow()
writeVideo(vidObj, getframe(gcf));

for ii=2:395
    numdate = numdate + 1;
    
    ax1 = subplot(2,2,1);
    contourf(YCS,RCS,O2_series(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    % contour(YCm,RCm,slice_mask,'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    % ytickformat('degrees'):)
    title('1/6 B-SOSE O2 at 307 E','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_s1
    text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax2 = subplot(2,2,2);
    contourf(YC3,RC3,O2_Series_slice_32(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    % contour(YCm,RCm,slice_mask,'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    % ytickformat('degrees'):)
    title('1/3 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_s2
    text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC6,RC6,O2_Series_slice_62(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    % contour(YCm,RCm,slice_mask,'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    % ytickformat('degrees'):)
    title('1/6 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_s3
    text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12,RC12,O2_Series_slice_122(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    % contour(YCm,RCm,slice_mask,'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    % ytickformat('degrees'):)
    title('1/12 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_s4
    text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
    
    ax1 = subplot(2,2,1);
    contourf(YCS,RCS,O2_series(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    % contour(YCm,RCm,slice_mask,'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    % ytickformat('degrees'):)
    title('1/6 B-SOSE O2 at 307 E','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_s1
    text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax2 = subplot(2,2,2);
    contourf(YC3,RC3,O2_Series_slice_32(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    % contour(YCm,RCm,slice_mask,'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    % ytickformat('degrees'):)
    title('1/3 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_s2
    text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(YC6,RC6,O2_Series_slice_62(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    % contour(YCm,RCm,slice_mask,'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    % ytickformat('degrees'):)
    title('1/6 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_s3
    text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(YC12,RC12,O2_Series_slice_122(:,:,ii),'LineStyle','none','LevelList',z);
    hold on
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb ub]);
    % contour(YCm,RCm,slice_mask,'Color','k')
    caxis([lb ub])
    axis(inside_coords)
    xtickformat('degrees')
    % ytickformat('degrees'):)
    title('1/12 MITgcm+BLING O2 at 307 E','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_s4
    text(-39,-5500,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','w')
    hold off
    
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end
close(vidObj);

%% END O2