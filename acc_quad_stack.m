function acc_quad_stack(n)
if n==1
    ax = gca;
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)+0.065;
    bottom = outerpos(2) + ti(2)-0.03;
    ax_width = outerpos(3) + 0.030;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.05;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)+0.065;
    bottom = outerpos(2) + ti(2)-0.03;
    ax_width = outerpos(3) + 0.030;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.05;
    ax.Position = [left bottom ax_width ax_height];
elseif n==3
    ax = gca;
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)+0.065;
    bottom = outerpos(2) + ti(2)-0.03;
    ax_width = outerpos(3) + 0.030;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.05;
    ax.Position = [left bottom ax_width ax_height];
elseif n==4
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)+0.065;
    bottom = outerpos(2) + ti(2)-0.03;
    ax_width = outerpos(3) + 0.030;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.05;
    ax.Position = [left bottom ax_width ax_height];
end
end