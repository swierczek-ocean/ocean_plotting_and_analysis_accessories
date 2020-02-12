function [f] = coriolisf(lat)
%CORIOLISF returns the Coriolis frequency (also known as the Coriolis
% parameter or Coriolis coefficient) in radians per second for any given
% point, array, or grid given by input latitude lat. You may enter
% longitude values into this function if you'd like, but the lon variable
% does go unused. The Coriolis frequency is a function of only latitude 
% and Earth's rate of rotation. 
% 
% Note: this function only applies to Earth or other celestial bodies whose
% rate of rotation is 7.2921 x 10^-5 radians per second. 
% 
% 
% Syntax
% f = coriolisf(lat) 
% f = coriolisf(lat,lon) 
% 
% 
% Description
% f = coriolisf(lat) returns the Coriolis frequency in radians per second
% for point(s) at latitude(s) lat.  
% 
% f = coriolisf(lat,lon) It can be weird to use latitudes while
% completely ignoring corresponding longitudes. If it makes you feel better
% to enter the longitude, go ahead, be my guest. Or you can ignore
% longitude.  That's completely up to you. 
% 
% 
% Written by Chad A. Greene of the University of Texas Institute for
% Geophysics (UTIG). July 2014. 
assert(max(abs(lat(:)))<=90,'Latitude value(s) out of realistic bounds. Check inputs.')
f = 2*(7.2921e-5).*sind(lat); 
end

