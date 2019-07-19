
ax = gca;               
% grabs the current axis, which is an object

ax.TickDir = 'out';
% makes the axis tick marks stick out rather than in

ax.TickLength = [0.005 0.035];
% makes the tick marks a little shorter than usual

set(ax,'yticklabel',num2str(abs(get(ax,'ytick').')))
% gets rid of the negative signs on the y axis, so depth reads as positive

ax.LineWidth = 1.5;
% makes the axis and tick marks a little bolder

ax.AmbientLightColor = Color(:,36)';
% makes the outside of the plot a soft gray color rather than white
% you should turn this off for any figures for publication

ax.Title.FontWeight = 'normal';
% un-bolds the title

set(gca, 'defaultUicontrolFontName', 'Ubuntu')
set(gca, 'defaultUitableFontName', 'Ubuntu')
set(gca, 'defaultAxesFontName', 'Ubuntu')
set(gca, 'defaultTextFontName', 'Ubuntu')
set(gca, 'defaultUipanelFontName', 'Ubuntu')
% changes the font for all text associated with the figure

ax.FontSize = 16; 
% changes all font sizes on the figure
% there is probably a way to change it for each place, i.e., 
% make the title one size, the x labels and y labels another size, etc.

outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1) + 0.01;
bottom = outerpos(2) + ti(2) + 0.025;
ax_width = outerpos(3) - ti(1) - ti(3) - 0.04;
ax_height = outerpos(4) - ti(2) - ti(4) - 0.035;
ax.Position = [left bottom ax_width ax_height];
% these commands make the plot fit tight with very little white space.
% sometimes you need to fiddle with the decimals added or subtracted
% on the right. Notice you set the left and bottom positions, and then the 
% width and height. So for example, if the image is too wide, subtract a
% bigger number from ax_width. If the image has the correct width, but is
% offset to the left, subtract more from the 'left' line.



%% NOTE
% You might need to modify or comment out some of these options for
% different types of plots. I make several of these and give them unhelpful
% names like "acc_plots_1", "acc_plots_2", "acc_plots_3", etc. 
% and try to remember what types of plots need which one.
% For example, your profile 17 plot doesn't need some of these. 






