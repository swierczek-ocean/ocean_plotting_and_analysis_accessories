function acc_plots_ud_2(n)

if n==1
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.007;
    bottom = outerpos(2) + ti(2) -0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) - 0.057;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.005;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) + 0.026;
    bottom = outerpos(2) + ti(2) - 0.05;
    ax_width = outerpos(3) - ti(1) - ti(3) - 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.06;
    ax.Position = [left bottom ax_width ax_height];
end

end


