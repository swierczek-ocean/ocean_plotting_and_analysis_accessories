function acc_20_panel(ii)
if ii==1
    ax = gca;
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3);
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==2
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.065;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==3
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==4
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.034;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==5
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)- 0.02;
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) + 0.02;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==6
    ax = gca;
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3);
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==7
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.065;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==8
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==9
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.034;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==10
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)- 0.02;
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) + 0.02;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==11
    ax = gca;
    xticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3);
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==12
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.065;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==13
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==14
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.034;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==15
    ax = gca;
    xticklabels({})
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)- 0.02;
    bottom = outerpos(2) + ti(2) - 0.01;
    ax_width = outerpos(3) + 0.02;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.02;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==16
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) - 0.023;
    ax_width = outerpos(3);
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==17
    ax = gca;
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.065;
    bottom = outerpos(2) + ti(2) - 0.023;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==18
    ax = gca;
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.05;
    bottom = outerpos(2) + ti(2) - 0.023;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==19
    ax = gca;
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) - 0.034;
    bottom = outerpos(2) + ti(2) - 0.023;
    ax_width = outerpos(3) + 0.03;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
elseif ii==20
    ax = gca;
    yticklabels({})
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1)- 0.02;
    bottom = outerpos(2) + ti(2) - 0.023;
    ax_width = outerpos(3) + 0.02;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.025;
    ax.Position = [left bottom ax_width ax_height];
    colorbar('Position', [left+ax_width+0.010 bottom 0.02 4.76*ax_height])
end
end

