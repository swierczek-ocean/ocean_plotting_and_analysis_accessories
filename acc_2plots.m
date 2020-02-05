function acc_2plots(n)
%% plotting tool

if n==1
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.065;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.09;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.045;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1) - 0.005;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3) + 0.025;
    ax_height = outerpos(4) - ti(2) - ti(4) - 0.045;
    ax.Position = [left bottom ax_width ax_height];
end

end

