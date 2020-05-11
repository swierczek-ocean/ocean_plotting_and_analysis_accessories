clear
close all
clc
tic()

strs = 'soda3.4.2_mn_ocean_reg_2017.nc';

ncdisp(strs);

XCS = ncread(strs,'xt_ocean');
YCS = ncread(strs,'yt_ocean');
XGS = ncread(strs,'xu_ocean');
YGS = ncread(strs,'yu_ocean');
sodatemp = ncread(strs,'temp');
sodasalt = ncread(strs,'salt');
sodau = ncread(strs,'u');
sodav = ncread(strs,'v');
sodaw = ncread(strs,'wt');
sodadepc = ncread(strs,'st_ocean');
sodadepf = ncread(strs,'sw_ocean');
sodamlt = ncread(strs,'mlt');
sodamlp = ncread(strs,'mlp');
sodamls = ncread(strs,'mls');
sodatflux = ncread(strs,'net_heating');
sodataux = ncread(strs,'taux');
sodatauy = ncread(strs,'tauy');
sodaprho = ncread(strs,'prho');

XCS = XCS(571:710);
XGS = XGS(570:709);
YCS = YCS(21:100);
YGS = YGS(20:99);

sodatemp = sodatemp(571:710,21:100,:,:);
sodasalt = sodasalt(571:710,21:100,:,:);
sodaw = sodaw(571:710,21:100,:,:);
sodau = sodau(570:709,20:99,:,:);
sodav = sodav(570:709,20:99,:,:);


sodaprho = sodaprho(571:710,21:100,:,:);
sodamlt = sodamlt(571:710,21:100,:);
sodamlp = sodamlp(571:710,21:100,:);
sodamls = sodamls(571:710,21:100,:);
sodataux = sodataux(571:710,21:100,:);
sodatauy = sodatauy(571:710,21:100,:);
sodatflux = sodatflux(571:710,21:100,:);


clear str

save SODA3






toc()