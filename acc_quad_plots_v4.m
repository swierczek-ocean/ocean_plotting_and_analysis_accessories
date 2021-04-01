ax = gca;
yticklabels({})
colormap(ax4,cm)
outerpos = ax.OuterPosition;
ti = ax.TightInset;
% left = outerpos(1)-0.026;
left = outerpos(1)-0.047;
bottom = outerpos(2) + ti(2)-0.049;
% ax_width = outerpos(3) + 0.032;
ax_width = outerpos(3) + 0.084;
ax_height = outerpos(4) - ti(2) - ti(4) + 0.07;
ax.Position = [left bottom ax_width ax_height];
cbar = colorbar('Position', [left+ax_width+0.015 bottom 0.02 2.12*ax_height]);
cbar.LineWidth = 2;
cbar.FontSize = 22;
