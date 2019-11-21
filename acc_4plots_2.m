yticklabels({})
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1) - 0.05;
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3) + 0.05;
ax_height = outerpos(4) - ti(2) - ti(4) - 0.09;
ax.Position = [left bottom ax_width ax_height];