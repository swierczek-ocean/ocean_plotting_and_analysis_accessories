clear
close all
clc
tic()

% name = 'RG_ArgoClim_Temperature_2019.nc';
% names = 'RG_ArgoClim_Salinity_2019.nc';
% 
% ncdisp(name);
% 
% saltm = ncread(names,'ARGO_SALINITY_MEAN');
% salta = ncread(names,'ARGO_SALINITY_ANOMALY');
% longrg = ncread(name,'LONGITUDE');
% latrg = ncread(name,'LATITUDE');
% pres = ncread(name,'PRESSURE');
% time = ncread(name,'TIME');
% tempm = ncread(name,'ARGO_TEMPERATURE_MEAN');
% tempa = ncread(name,'ARGO_TEMPERATURE_ANOMALY');
% longrg = longrg(266:335);
% latrg = latrg(1:40);
% tempm = tempm(266:335,1:40,:);
% tempa = tempa(266:335,1:40,:,157:168);
% saltm = saltm(266:335,1:40,:);
% salta = salta(266:335,1:40,:,157:168);
% 
% temp2017 = zeros(70,40,58,12);
% salt2017 = zeros(70,40,58,12);
% 
% for ii=1:12
%     temp2017(:,:,:,ii) = tempm + tempa(:,:,:,ii);
%     salt2017(:,:,:,ii) = saltm + salta(:,:,:,ii);
% end
% 
% z = gsw_z_from_p(pres,-50);
% depthrg = z;
% 
% clear name* ii pres time tempm saltm tempa salta
% 
% save RG2017

load RG2017

latrg = latrg(6:35);
longrg = longrg(4:66);
salt2017 = salt2017(4:66,6:35,:,:);
temp2017 = temp2017(4:66,6:35,:,:);
depthrg = -depthrg;

THETARGE = squeeze(temp2017(63,:,:,:));
THETARGW = squeeze(temp2017(1,:,:,:));
THETARGN = squeeze(temp2017(:,30,:,:));
THETARGS = squeeze(temp2017(:,1,:,:));

SALTRGE = squeeze(salt2017(63,:,:,:));
SALTRGW = squeeze(salt2017(1,:,:,:));
SALTRGN = squeeze(salt2017(:,30,:,:));
SALTRGS = squeeze(salt2017(:,1,:,:));

load BCs/THETA12BC *C12 THETA*
load BCs/SALT12BC SALT*
XC12 = double(XC12);
YC12 = double(YC12);
RC12 = -RC12(1:83);
[YC12es,RC12es] = ndgrid(YC12,RC12);
[XC12ss,RC12ss] = ndgrid(XC12,RC12);
clear *C12 

SALT12E = SALT12E(:,1:83,:);
SALT12W = SALT12W(:,1:83,:);
SALT12N = SALT12N(:,1:83,:);
SALT12S = SALT12S(:,1:83,:);

THETA12E = THETA12E(:,1:83,:);
THETA12W = THETA12W(:,1:83,:);
THETA12N = THETA12N(:,1:83,:);
THETA12S = THETA12S(:,1:83,:);

rgthetade = zeros(512,83,12);
rgthetadw = zeros(512,83,12);
rgthetads = zeros(756,83,12);
rgthetadn = zeros(756,83,12);

rgsaltde = zeros(512,83,12);
rgsaltdw = zeros(512,83,12);
rgsaltds = zeros(756,83,12);
rgsaltdn = zeros(756,83,12);

[exts,edts] = ndgrid(longrg,depthrg);
[eyte,edte] = ndgrid(latrg,depthrg);

for ii=1:12
    F = griddedInterpolant(eyte,edte,THETARGE(:,:,ii),'linear');
    rgthetade(:,:,ii) = F(YC12es,RC12es) - THETA12E(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,THETARGW(:,:,ii),'linear');
    rgthetadw(:,:,ii) = F(YC12es,RC12es) - THETA12W(:,:,ii);
    
    F = griddedInterpolant(exts,edts,THETARGS(:,:,ii),'linear');
    rgthetads(:,:,ii) = F(XC12ss,RC12ss) - THETA12S(:,:,ii);
    
    F = griddedInterpolant(exts,edts,THETARGN(:,:,ii),'linear');
    rgthetadn(:,:,ii) = F(XC12ss,RC12ss) - THETA12N(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,SALTRGE(:,:,ii),'linear');
    rgsaltde(:,:,ii) = F(YC12es,RC12es) - SALT12E(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,SALTRGW(:,:,ii),'linear');
    rgsaltdw(:,:,ii) = F(YC12es,RC12es) - SALT12W(:,:,ii);
    
    F = griddedInterpolant(exts,edts,SALTRGS(:,:,ii),'linear');
    rgsaltds(:,:,ii) = F(XC12ss,RC12ss) - SALT12S(:,:,ii);
    
    F = griddedInterpolant(exts,edts,SALTRGN(:,:,ii),'linear');
    rgsaltdn(:,:,ii) = F(XC12ss,RC12ss) - SALT12N(:,:,ii);
end


RC12ss = -RC12ss;
RC12es = -RC12es;
save RGdiffs rg*d* XC12* RC12* YC12*

clear

load RGdiffs

toc()