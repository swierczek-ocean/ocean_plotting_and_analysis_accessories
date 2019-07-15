function [lon_met,lat_met] = latlon_to_meters(X,Y)
%% Takes arrays in degrees and converts to meters

if size(X)~=size(Y)
    [X,Y] = ndgrid(X,Y);
end

lat_met = 111100.*(Y-min(min(Y)));
a = 6378100;
b = 6356800;
e = (a^2 - b^2)/(a^2);

lon_met = ((pi*a/180).*cosd(Y)./sqrt(1 - (e.*sind(Y)).^2)).*(X-min(min(X)));
    
end

