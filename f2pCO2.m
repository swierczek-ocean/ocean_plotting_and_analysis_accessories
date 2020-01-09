function pCO2 = f2pCO2(T,Patm,P,fCO2)
tk = 273.15;           % [K] (for conversion [deg C] <-> [K])
TK = T + tk;           % TK [K]; T[C]

% Corrected approach to compute the fugacity coefficient, with which we convert pCO2 <-> fCO2
Phydro_atm = P./1.01325;  % convert hydrostatic pressure from bar to atm (1.01325 bar / atm)
Ptot = Patm + Phydro_atm;  % total pressure (in atm)
R = 82.05736;              % (cm3 * atm) / (mol * K)  CODATA (2006)

% To compute fugcoeff, we need 3 other terms (B, Del, xc2) in addition to 3 others above (TK, Ptot, R)
B   = -1636.75 + 12.0408.*TK - 0.0327957.*TK.^2 + 0.0000316528.*TK.^3;
Del = 57.7-0.118.*TK;

% "x2" term often neglected (assumed = 1) in applications of Weiss's (1974) equation 9
% x2 = 1 - x1 = 1 - xCO2 (it is close to 1, but not quite)
% Let's assume that xCO2 = fCO2. Resulting fugcoeff is identical to 8th digit after the decimal.
xCO2approx = fCO2;
xc2 = (1 - xCO2approx.*1e-6).^2;

fugcoeff = exp( Ptot.*(B + 2.*xc2.*Del)/(82.057*TK) );
pCO2 = fCO2./fugcoeff;

end

