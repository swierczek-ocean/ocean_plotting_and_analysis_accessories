ax = gca;
xticklabels({})
% set(gca,'yticklabel',num2str(abs(get(gca,'ytick').')))
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + 0.07;
bottom = outerpos(2) + ti(2)-0.035;
ax_width = outerpos(3) - 0.15;
ax_height = outerpos(4) - ti(2) - ti(4) + 0.055;
ax.Position = [left bottom ax_width ax_height];
