clear
close all
clc

tic()
acc_settings

%%
load ../2019_11_November_analysis/mask
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load MLD_Series32 MLD*
load MLD_Series62 MLD*
load MLD_Series122 MLD*
%%


%%
numdate = datenum('12012016','mmddyyyy');
option = 9;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str *DYG* *DXG* *DRF*
%%

%% AGE 65
cm = acc_colormap('cmo_deep');
cm = cm.^2;
lb = 0;
ub = 400;


nlvls = 201;
z = linspace(lb,ub,nlvls);
z = [z,2000];

% temp32 = MLD_Series32(:,:,1);
% temp62 = MLD_Series62(:,:,1);
% temp122 = MLD_Series122(:,:,1);
% 
% figure()
% set(gcf, 'Position', [1, 1, 1500, 900])
% colormap(cm)
% 
% subplot(2,2,1)
% ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
% axis off
% 
% 
% ax2 = subplot(2,2,2);
% contourf(XC3,YC3,-temp32,'LineStyle','none','LevelList',z);
% hold on
% contour(XCm,YCm,mask(:,:,9),'Color','k')
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% caxis([lb ub])
% title('1/3 mixed layer depth','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v13
% hold off
% 
% ax3 = subplot(2,2,3);
% contourf(XC6,YC6,-temp62,'LineStyle','none','LevelList',z);
% hold on
% contour(XCm,YCm,mask(:,:,9),'Color','k')
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% caxis([lb ub])
% title('1/6 mixed layer depth','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v14
% hold off
% 
% ax4 = subplot(2,2,4);
% contourf(XC12,YC12,-temp122,'LineStyle','none','LevelList',z);
% hold on
% contour(XCm,YCm,mask(:,:,9),'Color','k')
% axis(inside_coords)
% xtickformat('degrees')
% ytickformat('degrees')
% caxis([lb ub])
% title('1/12 mixed layer depth','FontWeight','Normal','FontSize',16)
% acc_movie
% acc_quad_plots_v15
% hold off
% 
% 
% set(gca, 'nextplot','replacechildren', 'Visible','on');
% vidObj = VideoWriter('MLD.avi');
% vidObj.Quality = 100;
% vidObj.FrameRate = 18;
% open(vidObj);
% writeVideo(vidObj, getframe(gcf));
% 
% for ii=2:396
%     numdate = numdate + 1;
%     
%     temp32 = MLD_Series32(:,:,ii);
%     temp62 = MLD_Series62(:,:,ii);
%     temp122 = MLD_Series122(:,:,ii);
%     
%     subplot(2,2,1)
%     delete(ht)
%     ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
%     axis off
%     
%     ax2 = subplot(2,2,2);
%     contourf(XC3,YC3,-temp32,'LineStyle','none','LevelList',z);
%     hold on
%     contour(XCm,YCm,mask(:,:,9),'Color','k')
%     axis(inside_coords)
%     xtickformat('degrees')
%     ytickformat('degrees')
%     caxis([lb ub])
%     title('1/3 mixed layer depth','FontWeight','Normal','FontSize',16)
%     acc_movie
%     acc_quad_plots_v13
%     hold off
%     
%     ax3 = subplot(2,2,3);
%     contourf(XC6,YC6,-temp62,'LineStyle','none','LevelList',z);
%     hold on
%     contour(XCm,YCm,mask(:,:,9),'Color','k')
%     axis(inside_coords)
%     xtickformat('degrees')
%     ytickformat('degrees')
%     caxis([lb ub])
%     title('1/6 mixed layer depth','FontWeight','Normal','FontSize',16)
%     acc_movie
%     acc_quad_plots_v14
%     hold off
%     
%     ax4 = subplot(2,2,4);
%     contourf(XC12,YC12,-temp122,'LineStyle','none','LevelList',z);
%     hold on
%     contour(XCm,YCm,mask(:,:,9),'Color','k')
%     axis(inside_coords)
%     xtickformat('degrees')
%     ytickformat('degrees')
%     caxis([lb ub])
%     title('1/12 mixed layer depth','FontWeight','Normal','FontSize',16)
%     acc_movie
%     acc_quad_plots_v15
%     hold off
%     
%     
%     drawnow()
%     writeVideo(vidObj, getframe(gcf));
%     
%     
% end
% close(vidObj);
% 
% 
% 
% %% END AGE 65

numdate = datenum('12012016','mmddyyyy');
option = 9;
%mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str *DYG* *DXG* *DRF*
%%

%% AGE 65
cm = acc_colormap('cmo_deep');

lb = 0;
ub = 200;
numdate = datenum('12012016','mmddyyyy');

nlvls = 201;
z = linspace(lb,ub,nlvls);
z = [z,2000];

mld32 = MLD_Series32(:,:,1);
mld62 = MLD_Series62(:,:,1);
mld122 = MLD_Series122(:,:,1);

figure()
set(gcf, 'Position', [1, 1, 1500, 900])
colormap(cm)

subplot(2,2,1)
ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
axis off


ax2 = subplot(2,2,2);
contourf(XC3,YC3,-mld32,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,9),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/3 mixed layer depth','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v13
hold off

ax3 = subplot(2,2,3);
contourf(XC6,YC6,-mld62,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,9),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/6 mixed layer depth','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v14
hold off

ax4 = subplot(2,2,4);
contourf(XC12,YC12,-mld122,'LineStyle','none','LevelList',z);
hold on
contour(XCm,YCm,mask(:,:,9),'Color','k')
axis(inside_coords)
xtickformat('degrees')
ytickformat('degrees')
caxis([lb ub])
title('1/12 mixed layer depth','FontWeight','Normal','FontSize',16)
acc_movie
acc_quad_plots_v15
hold off


set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('MLD_SAT.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 18;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for ii=2:396
    numdate = numdate + 1;
    
    mld32 = MLD_Series32(:,:,ii);
    mld62 = MLD_Series62(:,:,ii);
    mld122 = MLD_Series122(:,:,ii);
    
    subplot(2,2,1)
    delete(ht)
    ht = text(0.2,0.45,datestr(numdate,'yyyy mmm dd'),'FontSize',21,'Color','k');
    axis off
    
    ax2 = subplot(2,2,2);
    contourf(XC3,YC3,-mld32,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,9),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/3 mixed layer depth','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v13
    hold off
    
    ax3 = subplot(2,2,3);
    contourf(XC6,YC6,-mld62,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,9),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/6 mixed layer depth','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v14
    hold off
    
    ax4 = subplot(2,2,4);
    contourf(XC12,YC12,-mld122,'LineStyle','none','LevelList',z);
    hold on
    contour(XCm,YCm,mask(:,:,9),'Color','k')
    axis(inside_coords)
    xtickformat('degrees')
    ytickformat('degrees')
    caxis([lb ub])
    title('1/12 mixed layer depth','FontWeight','Normal','FontSize',16)
    acc_movie
    acc_quad_plots_v15
    hold off
    
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
    
    
end
close(vidObj);

clear MLD*

%% END AGE 65