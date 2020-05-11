function area = area_degree(deg_lat,del_lon,del_lat)
%% you give delta degree lon, delta degree lat,
% and degree lat, and it returns area in square meters
% takes only scalars

lat_met = del_lat*111100;
a = 6378100;
b = 6356800;
e = (a^2 - b^2)/(a^2);

lon_met_1 = del_lon*((pi*a/180).*cosd(deg_lat)./sqrt(1 - (e.*sind(deg_lat)).^2));
lon_met_2 = del_lon*((pi*a/180).*cosd(deg_lat-del_lat)./sqrt(1 - (e.*sind(deg_lat-del_lat)).^2));

area = 0.5*(lon_met_1+lon_met_2)*lat_met;
end

