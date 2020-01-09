function newfield = interp_AB(field,gridx,gridy,newgridx,newgridy)
%% linear interpolation from one grid to another, after filling in NaNs
% input grids must be size of field (a la ndgrid)

field = fillmissingstan(field);
F = griddedInterpolant(gridx,gridy,field,'linear');
newfield = F(newgridx,newgridy);
end

