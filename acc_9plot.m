function acc_9plot(n)
%% makes pretty plots

if n==1
    ax = gca;
    xticklabels({})
    ytickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) + 0.025;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.03;
    ax.Position = [left bottom ax_width ax_height];
elseif n==2
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.055;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) + 0.045;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.03;
    ax.Position = [left bottom ax_width ax_height];
elseif n==3
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.04;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) + 0.075;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.03;
    ax.Position = [left bottom ax_width ax_height];
elseif n==4
    ax = gca;
    xticklabels({})
    ytickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) + 0.025;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.03;
    ax.Position = [left bottom ax_width ax_height];
elseif n==5
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.055;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) + 0.045;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.03;
    ax.Position = [left bottom ax_width ax_height];
elseif n==6
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.04;
    bottom = outerpos(2) + ti(2) - 0.04;
    ax_width = outerpos(3) + 0.075;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.03;
    ax.Position = [left bottom ax_width ax_height];
elseif n==7
    ax = gca;
    ytickformat('degrees')    
    xtickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) - 0.05;
    ax_width = outerpos(3) + 0.025;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.04;
    ax.Position = [left bottom ax_width ax_height];
elseif n==8
    ax = gca;
    yticklabels({})    
    xtickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.055;
    bottom = outerpos(2) + ti(2) - 0.05;
    ax_width = outerpos(3) + 0.045;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.04;
    ax.Position = [left bottom ax_width ax_height];
elseif n==9
    ax = gca;
    yticklabels({})    
    xtickformat('degrees')
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.04;
    bottom = outerpos(2) + ti(2) - 0.05;
    ax_width = outerpos(3) + 0.075;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.04;
    ax.Position = [left bottom ax_width ax_height];
end

end

