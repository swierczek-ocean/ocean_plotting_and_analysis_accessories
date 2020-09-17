clear
close all
clc
tic()

str = 'gcb_load_A_2019-fesom.nc';

ncdisp(str)

PX = ncread(str,'X');
PY = ncread(str,'Y');
PT = ncread(str,'T');
PY = PY(1:90);
PT = PT(625:732);

cmems_cf = ncread(str,'cmems_fgco2_1x1_A',[1,1,625],[360,90,108]);
land_cf = ncread(str,'land_fgco2_1x1_A',[1,1,625],[360,90,108]);
roeden_cf = ncread(str,'roeden_fgco2_1x1_A',[1,1,625],[360,90,108]);
ipsl_cf = ncread(str,'ipsl_fgco2_1x1_A',[1,1,625],[360,90,108]);
csiro_cf = ncread(str,'csiro_fgco2_1x1_A',[1,1,625],[360,90,108]);
princeton_cf = ncread(str,'princeton_fgco2_1x1_A',[1,1,625],[360,90,108]);
planktom_cf = ncread(str,'planktom_fgco2_1x1_A',[1,1,625],[360,90,108]);
noresm_cf = ncread(str,'noresm_fgco2_1x1_A',[1,1,625],[360,90,108]);
cnrm_cf = ncread(str,'cnrm_fgco2_1x1_A',[1,1,625],[360,90,108]);
mpi_cf = ncread(str,'mpi_fgco2_1x1_A',[1,1,625],[360,90,108]);
fesom_cf = ncread(str,'fesom_fgco2_1x1_A',[1,1,625],[360,90,108]);
recom_jra_cf = ncread(str,'recom_jra_fgco2_1x1_A',[1,1,625],[360,90,108]);
cesm_cf = ncread(str,'cesm_fgco2_1x1_A',[1,1,625],[360,90,108]);

WOA_seamask = ncread(str,'WOA_seamask');
WOA_seamask = WOA_seamask(:,1:90);
TAKA_seamask400 = ncread(str,'TAKA_seamask400');
TAKA_seamask400 = TAKA_seamask400(:,1:90);

clear str

save PANGAEA_CF





toc()