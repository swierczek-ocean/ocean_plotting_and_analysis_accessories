clear
% close all
clc
tic()

load woa_misfit_map

acc_settings
load mask
mask = permute(mask,[2,1,3]);

%% surf
% load XY12 Depth12 XC12 YC12
load Topo12

do_woa_misfit_y12 = sortrows(do_woa_misfit_y12,4);
% coords = [XC12(1) XC12(end) YC12(1) YC12(end) -10000 10000];
coords = [290 350 -60 -30 -10000 10000];

ZCM = linspace(-6000,0,1000);

cm1 = acc_colormap('cmo_topo');
cm1 = cm1(1:248,:);
cm2 = acc_colormap('cbr_diff');
sz = 20;
A = do_woa_misfit_y12;
ind = 1:(55444-87);
B = A(ind,4);
f = @(x)ceil((x+.05).*256./.1);
C = f(B);
for ii=1:length(C)
    if C(ii)<1
        C(ii) = 1;
    elseif C(ii)>256
        C(ii) = 256;
    end
end

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
colormap(cm1)
% surf(XC12,YC12,Topo12,'EdgeColor','interp')
surf(XC12,YC12,Topo12,'LineStyle','none','FaceLighting','none')
hold on
contour(XCm,YCm,mask(:,:,1),'Color','k')
scatter3(A(ind,1),A(ind,2),-A(ind,3),sz,cm2(C,:),'filled')
cbar = colorbar('eastoutside');
ytickformat('degrees')
ylabel('latitude')
xtickformat('degrees')
xlabel('longitude')
zticks([-6000 -4000 -2000 0 2000 4000])
zticklabels({'-6000','-4000','-2000','0','2000','4000'})
title('mean annual misfit from WOA dissolved oxygen [mol O/m^3]','FontWeight','Normal','FontSize',18)
axis(coords)
acc_movie_w
acc_plots
hold off
set(gcf,'InvertHardCopy','off');
print('-r300','SURF_WOA_DO_misfit_12','-dpng')










toc()
