set(gca, 'defaultUicontrolFontName', 'Ubuntu')
set(gca, 'defaultUitableFontName', 'Ubuntu')
set(gca, 'defaultAxesFontName', 'Ubuntu')
set(gca, 'defaultTextFontName', 'Ubuntu')
set(gca, 'defaultUipanelFontName', 'Ubuntu')
% set(gca,'defaultAxesFontSize', 16)
% set(gca,'defaultTextFontSize', 16)
% fig = gcf;
% set(findall(fig, '-property', 'FontSize'), 'FontSize', 20)
ax = gca;
ax.FontSize = 22; 
set(gca, 'visible', 'on')
set(gca, 'color', Color(17,:))
set(gcf,'color','w'); 
ax.LineWidth = 2;
ax.GridAlpha = 1;
ax.TickLength = [.02, 0.02];