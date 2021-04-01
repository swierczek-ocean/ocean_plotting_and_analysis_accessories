ax = gca;
xticklabels({})
yticklabels({})
colorbar('off')
colormap(ax2,cm)
outerpos = ax.OuterPosition;
ti = ax.TightInset;
% left = outerpos(1)-0.03;
left = outerpos(1)-0.041;
bottom = outerpos(2) + ti(2)-0.03;
% ax_width = outerpos(3) + 0.08;
ax_width = outerpos(3) + 0.015;
ax_height = outerpos(4) - ti(2) - ti(4) + 0.05;
ax.Position = [left bottom ax_width ax_height];
% colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)  0.1  hp4(2)+hp4(3)*2.1])