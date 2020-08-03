function acc_4vplots(n)
if n==1
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.065;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.06;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.07;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.04;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.06;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.07;
    ax.Position = [left bottom ax_width ax_height];
elseif n==3
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.012;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.06;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.07;
    ax.Position = [left bottom ax_width ax_height];
elseif n==4
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.02;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.04;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.07;
    ax.Position = [left bottom ax_width ax_height];
end
end

