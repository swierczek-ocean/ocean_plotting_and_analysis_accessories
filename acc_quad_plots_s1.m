ax = gca;
xticklabels({})
colorbar('off')
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1)-0.035;
bottom = outerpos(2) + ti(2)-0.041;
ax_width = outerpos(3) + 0.04;
ax_height = outerpos(4) - ti(2) - ti(4) + 0.065;
ax.Position = [left bottom ax_width ax_height];