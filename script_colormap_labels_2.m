clear
close all
clc
tic()


load stan_cmaps

A = whos;
z = 1:256;
X = repmat(z,10,1);
acc_colors


figure()
set(gcf, 'Position', [1, 1, 1000, 3000])
subplot(25,2,1)
colormap(eval(A(1).name))
contourf(X,'LineStyle','none','LevelList',z)
xticklabels({})
yticklabels({})
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1);% + 0.01;
bottom = outerpos(2) + ti(2) + 0.01;
ax_width = outerpos(3) - ti(1) - ti(3) + 0.01;% - 0.03;
ax_height = outerpos(4) - ti(2) - ti(4) - 0.01;
ax.Position = [left bottom ax_width ax_height];
ax.AmbientLightColor = Color(:,36)';
set(gca,'xtick',[])
set(gca,'ytick',[])
pbaspect([13 1 1])
title(A(1).name,'Interpreter','none','FontWeight','Normal','FontSize',15)
set(gca, 'defaultTextFontName', 'Ubuntu')


for ii=2:numel(A)
    ax2 = subplot(25,2,ii);
    cm = eval(A(ii).name);
    colormap(ax2,cm)
    contourf(X,'LineStyle','none','LevelList',z)
    xticklabels({})
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1);% + 0.01;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.01;% - 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.01;
    ax.Position = [left bottom ax_width ax_height];
    set(gca,'xtick',[])
    set(gca,'ytick',[])
    ax.AmbientLightColor = Color(:,36)';
    pbaspect([13 1 1])
    colormap(ax2,cm)
    title(A(ii).name,'Interpreter','none','FontWeight','Normal','FontSize',15)
    set(gca, 'defaultTextFontName', 'Ubuntu')
end

print('colormaps1','-dpng')




z = 1:16:256;



figure()
set(gcf, 'Position', [1, 1, 1000, 3000])
subplot(25,2,1)
colormap(eval(A(1).name))
contourf(X,'LineStyle','none','LevelList',z)
xticklabels({})
yticklabels({})
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1);% + 0.01;
bottom = outerpos(2) + ti(2) + 0.01;
ax_width = outerpos(3) - ti(1) - ti(3) + 0.01;% - 0.03;
ax_height = outerpos(4) - ti(2) - ti(4) - 0.01;
ax.Position = [left bottom ax_width ax_height];
set(gca,'xtick',[])
set(gca,'ytick',[])
ax.AmbientLightColor = Color(:,36)';
pbaspect([13 1 1])
title(A(1).name,'Interpreter','none','FontWeight','Normal','FontSize',15)
set(gca, 'defaultTextFontName', 'Ubuntu')


for ii=2:numel(A)
    ax2 = subplot(25,2,ii);
    cm = eval(A(ii).name);
    colormap(ax2,cm)
    contourf(X,'LineStyle','none','LevelList',z)
    xticklabels({})
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1);% + 0.01;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.01;% - 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.01;
    ax.Position = [left bottom ax_width ax_height];
    set(gca,'xtick',[])
    set(gca,'ytick',[])
    ax.AmbientLightColor = Color(:,36)';
    pbaspect([13 1 1])
    colormap(ax2,cm)
    title(A(ii).name,'Interpreter','none','FontWeight','Normal','FontSize',15)
    set(gca, 'defaultTextFontName', 'Ubuntu')
end

print('colormaps2','-dpng')










toc()