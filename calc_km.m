function km = calc_km(lat,frac)
a = 6378100;
b = 6356800;
e = (a^2 - b^2)/(a^2);

km = frac*((pi*a/180).*cosd(lat)./sqrt(1 - (e.*sind(lat)).^2))/1000;
end

