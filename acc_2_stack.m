function acc_2_stack(n)
if n==1
    ax = gca;
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)+0.06;
    bottom = outerpos(2) + ti(2)-0.005;
    ax_width = outerpos(3) - 0.068;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.005;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)+0.06;
    bottom = outerpos(2) + ti(2)-0.015;
    ax_width = outerpos(3) - 0.068;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.045;
    ax.Position = [left bottom ax_width ax_height];
end
end

