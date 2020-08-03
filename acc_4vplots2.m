function acc_4vplots2(n)
if n==1
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.065;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.02;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.07;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.08;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.02;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.07;
    ax.Position = [left bottom ax_width ax_height];
elseif n==3
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.09;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.02;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.07;
    ax.Position = [left bottom ax_width ax_height];
elseif n==4
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.105;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.16;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.07;
    ax.Position = [left bottom ax_width ax_height];
end
end

