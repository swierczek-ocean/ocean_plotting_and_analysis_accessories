function acc_plots_ud(n)

if n==1
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.047;
    bottom = outerpos(2) + ti(2) - 0.005;
    ax_width = outerpos(3) - ti(1) - ti(3) - 0.077;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.005;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.014;
    bottom = outerpos(2) + ti(2) + 0.02;
    ax_width = outerpos(3) - ti(1) - ti(3) - 0.044;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.027;
    ax.Position = [left bottom ax_width ax_height];
end

end

