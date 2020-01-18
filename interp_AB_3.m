function newfield = interp_AB_3(field,gridx,gridy,gridz,newgridx,newgridy,newgridz)
%% linear interpolation from one grid to another, after filling in NaNs
% input grids must be size of field (a la ndgrid)
[~,~,nn] = size(field);
for ii=1:nn
    field(:,:,ii) = fillmissingstan(field(:,:,ii));
end
F = griddedInterpolant(gridx,gridy,gridz,field,'linear');
newfield = F(newgridx,newgridy,newgridz);
end


