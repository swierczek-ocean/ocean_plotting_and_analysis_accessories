function acc_2mplots(n,axn,cm,lbcb1,ubcb1,lbcb2,ubcb2)
%% plotting tool

if n==1
    ax = gca;
    colormap(axn,cm)
    xtickformat('degrees')
    ytickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.07;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.09;
    ax_height = outerpos(4) - ti(2) - ti(4);
    ax.Position = [left bottom ax_width ax_height];
    cbar = colorbar('southoutside');
    set(cbar,'XLim',[lbcb1 ubcb1]);
elseif n==2
    ax = gca;
    colormap(axn,cm)
    xtickformat('degrees')
    ytickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.04;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.09;
    ax_height = outerpos(4) - ti(2) - ti(4);
    ax.Position = [left bottom ax_width ax_height];
    cbar = colorbar('southoutside');
    set(cbar,'XLim',[lbcb2 ubcb2]);
end

end