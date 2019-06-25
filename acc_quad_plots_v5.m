ax = gca;
xticklabels({})
% colorbar('off')
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1)-0.0451;
bottom = outerpos(2) + ti(2)-0.03;
ax_width = outerpos(3) + 0.0451;
ax_height = outerpos(4) - ti(2) - ti(4) + 0.05;
ax.Position = [left bottom ax_width ax_height];