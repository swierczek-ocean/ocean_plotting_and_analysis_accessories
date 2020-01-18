function [boron_concentration,method] = bor(Salinity,string_method)
%% description here: https://rdrr.io/cran/seacarb/man/bor.html
% three formulations possible Lee et al. (2010) : 'l10'; 
% Uppstrom (1974) : 'u74'; "Kulinski et al. (2018)" : 'k18'
% output units are mol/kg

%--------------- choice between the formulations -------------------
if (string_method=='l10')
    boron_concentration = 0.1336.*Salinity;
    method = "Lee et al. (2010)";
elseif = (string_method=='u74')
    boron_concentration = 0.1284.*Salinity;
    method = "Uppstrom (1974)";
elseif = (string_method=='k18')
    boron_concentration = (11.405.*Salinity + 11.869).*10.811.*10.^-3;
    method = "Kulinski et al. (2018)";
end

% conversion from mg/kg to mol/kg
boron_concentration = boron_concentration.*10.^(-3)./10.811;

end

