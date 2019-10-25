ax = gca;
% set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
colormap(ax4,cm)
outerpos = ax.OuterPosition;
ti = ax.TightInset;
% left = outerpos(1)-0.026;
left = outerpos(1) + 0.0645;
bottom = outerpos(2) + ti(2)-0.05;
% ax_width = outerpos(3) + 0.032;
ax_width = outerpos(3) - 0.1111;
ax_height = outerpos(4) - ti(2) - ti(4) + 0.07;
ax.Position = [left bottom ax_width ax_height];
cbar = colorbar('Position', [left+ax_width+0.015 bottom 0.02 3.071*ax_height]);
set(cbar,'XLim',[lbcb ubcb]);