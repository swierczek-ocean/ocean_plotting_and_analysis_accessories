function cm = acc_colormap_2(str)
%% 2nd try of colormap function

load stan_cmaps

clearvars -except eval(str)
cm = eval(str);
end

