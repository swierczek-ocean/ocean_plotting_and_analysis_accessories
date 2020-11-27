function acc_quad_movies(n)
if n==1
    ax = gca;
    xticklabels({})
    colorbar('off')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)-0.038;
    bottom = outerpos(2) + ti(2)-0.03;
    ax_width = outerpos(3) + 0.043;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.05;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    xticklabels({})
    yticklabels({})
    colorbar('off')
%    colormap(ax2,cm)
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)-0.039;
    bottom = outerpos(2) + ti(2)-0.03;
    ax_width = outerpos(3) + 0.023;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.05;
    ax.Position = [left bottom ax_width ax_height];
elseif n==3
    ax = gca;
    colorbar('off')
%    colormap(ax3,cm)
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)-0.04;
    bottom = outerpos(2) + ti(2)-0.045;
    ax_width = outerpos(3) + 0.032;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.07;
    ax.Position = [left bottom ax_width ax_height];
elseif n==4
    ax = gca;
    yticklabels({})
%    colormap(ax4,cm)
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)-0.046;
    bottom = outerpos(2) + ti(2)-0.045;
    ax_width = outerpos(3) + 0.089;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.07;
    ax.Position = [left bottom ax_width ax_height];
    colorbar('Position', [left+ax_width+0.010 bottom 0.02 2.12*ax_height])
end
end

