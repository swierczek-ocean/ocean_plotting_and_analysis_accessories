function acc_9plots2(n,axn,cm,lbcb1,ubcb1,lbcb2,ubcb2)
%% plotting tool
if n==1
    ax = gca;
    colormap(axn,cm)
    xticklabels({})
    ytickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.09;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.07;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.055;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    colormap(axn,cm)
    yticklabels({})
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.06;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.06;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.055;
    ax.Position = [left bottom ax_width ax_height];
elseif n==3
    ax = gca;
    colormap(axn,cm)
    yticklabels({})
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.04;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.04;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.055;
    ax.Position = [left bottom ax_width ax_height];
elseif n==4
    ax = gca;
    colormap(axn,cm)
    xticklabels({})
    ytickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.09;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.07;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.065;
    ax.Position = [left bottom ax_width ax_height];
elseif n==5
    ax = gca;
    yticklabels({})
    colormap(axn,cm)
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.06;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.06;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.065;
    ax.Position = [left bottom ax_width ax_height];
elseif n==6
    ax = gca;
    colormap(axn,cm)
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.043;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.081;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.065;
    ax.Position = [left bottom ax_width ax_height];
    cbar = colorbar('Position', [left+ax_width+0.015 bottom 0.02 2.08*ax_height]);    
    set(cbar,'XLim',[lbcb1 ubcb1]);
    cbar.LineWidth = 2;
    cbar.FontSize = 22;
elseif n==7
    ax = gca;
    colormap(axn,cm)
    xtickformat('degrees')
    ytickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.09;
    bottom = outerpos(2) + ti(2) - 0.07;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.072;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.065;
    ax.Position = [left bottom ax_width ax_height];
elseif n==8
    ax = gca;
    yticklabels({})
    colormap(axn,cm)
    xtickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.06;
    bottom = outerpos(2) + ti(2) - 0.07;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.062;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.065;
    ax.Position = [left bottom ax_width ax_height];
elseif n==9
    ax = gca;
    colormap(axn,cm)
    xtickformat('degrees')
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.042;
    bottom = outerpos(2) + ti(2) - 0.07;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.087;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.065;
    ax.Position = [left bottom ax_width ax_height];
    cbar = colorbar('Position', [left+ax_width+0.015 bottom 0.02 1.00*ax_height]);
    set(cbar,'XLim',[lbcb2 ubcb2]);
    cbar.LineWidth = 2;
    cbar.FontSize = 22;
    set(cbar,'YTick',-15:5:15)
end

end



