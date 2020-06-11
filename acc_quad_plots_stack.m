function acc_quad_plots_stack(n,axn,cm1,cm2,ub1,lb1,ub2,lb2)
if n==1
    ax = gca;
    colormap(axn,cm1)
    cbar = colorbar('eastoutside');
    set(cbar,'XLim',[lb1 ub1]);
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.01;
    bottom = outerpos(2) + ti(2) - 0.03;
    ax_width = outerpos(3) - ti(1) - ti(3) - 0.04;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    colormap(axn,cm2)
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.018;
    bottom = outerpos(2) + ti(2) - 0.045;
    ax_width = outerpos(3) - ti(1) - ti(3) - 0.089;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
elseif n==3
    ax = gca;
    colormap(axn,cm2)
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.018;
    bottom = outerpos(2) + ti(2) - 0.0545;
    ax_width = outerpos(3) - ti(1) - ti(3) - 0.089;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
elseif n==4
    ax = gca;
    colormap(axn,cm2)
    xtickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.01;
    bottom = outerpos(2) + ti(2) - 0.07;
    ax_width = outerpos(3) - ti(1) - ti(3) - 0.04;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
    cbar = colorbar('Position', [left+ax_width+0.005 bottom 0.015 3.53*ax_height])
    set(cbar,'XLim',[lb2 ub2]);
elseif n==5
    ax = gca;
    colormap(axn,cm2)
    xtickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.01;
    bottom = outerpos(2) + ti(2) - 0.07;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.0048;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
    cbar = colorbar('Position', [left+ax_width+0.005 bottom 0.015 3.53*ax_height])
    set(cbar,'XLim',[lb2 ub2]);
end