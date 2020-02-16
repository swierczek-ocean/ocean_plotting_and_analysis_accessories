function [] = metrics_profiles_sose_norm(varargin);
%% 

close all
%%% NOTE we will want to move this to an independent site.
addpath('/data/validation/SOSE_web/CASE_analy/New_Naming_Scheme/')

if nargin==6;
    label=varargin{1};
    iter=varargin{2};
    prof_data=varargin{3};
    dir_model_output_netcdf=varargin{4};
    figure_out=varargin{5};
    whichgrid=varargin{6};
else;
   display('Incorrect input for metrics_profiles_sose')
end;


display('normalized plots')


%WRITE TEXT DIAGNOSTIC OUTPUT
delete([figure_out '*.txt'])
fidm=fopen([figure_out label '_ValidOut_' num2str(iter) '.txt'],'a','b');
fprintf(fidm, '%s\n', ['OUTPUT DIAGNOSTICS FOR METRICS_PRODILES_SOSE']);


addpath valid_matlab_needs
load cmap

% read model grid
% load(['/data/validation/SOSE_web/soccom/grid_' whichgrid(1) '/grid'],'XC','YC','Depth','DRF');
load(['/home/stan.swierczek/PROFILES/AB' whichgrid '/grid/grid' whichgrid],'XC','YC','Depth','DRF');

XC=XC(:,1); YC=YC(1,:);
lox = find(XC>290.5,1)-1;
hix = find(XC>350.2,1)+1;
loy = find(YC>-58.7,1)-1;
hiy = find(YC>-32,1)+1;
XC = XC(lox:hix);
YC = YC(loy:hiy);
Depth = Depth(lox:hix,loy:hiy);

% divcolormap = cmap;
% gradcolormap = 'default';
divcolormap = acc_colormap('cbr_diff');
gradcolormap = acc_colormap('cmo_tempo');
gradcolormap = gradcolormap(25:2:end,:);
gradcolormap = [gradcolormap;gradcolormap];

dpath = prof_data;
mpath = dir_model_output_netcdf;

%---------------------- ORIGINAL CODE NOTES -----------------
% 
%------------------------ UPDATED 7/16/2012 -------------------

% new naming scheme of:
% The first 3 or 4 letters shows the source
% domain here either CA or SO
% the year
% last string is 3 letters giving the observational platform -- e.g.
% CTD  each string is separated by '_' delimitor
% current name se_misfit_new.m
% Usage:
% status = se_misfit_new(label,iteration,data_input_path_root,data_output_path_root)
%------------------------ END UPDATED 7/16/2012 -------------------

%------------------------ BEGIN PLOTS initialization -------------------

% fontname is Ubuntu by default

%----------------------------------------
% fontsize for all plots
if ~exist('ifont','var') || isempty(ifont)
  ifont = 15;
end

%----------------------------------------
% legends use smaller font
if ~exist('ifontl','var') || isempty(ifontl)
  ifontl = 12;
end

%----------------------------------------
% colorbars use smaller font
if ~exist('ifontc','var') || isempty(ifontc)
  ifontc = 15;
end

%----------------------------------------
% to set linewidth
if ~exist('w_line','var') || isempty(w_line)
  w_line = 2;
end

%----------------------------------------
if ~exist('ipause','var') || isempty(ipause)
% ipause: 0 = no, 1 = yes pause after plots
  ipause = 0;
end

%----------------------------------------
if ~exist('iprint','var') || isempty(iprint)
% iprint: 0 = no, 1 = yes print plots
  iprint = 1;
end

%----------------------------------------
% plot type for matlab (not file extension)
% 'meta' doesn't work on unix
  % plt_typ = 'epsc';
  plt_typ = 'png';

% plot file extension (macs and pc's need .ps or .eps)
  plt_ext = 'png';

% choose whether or not to plot all data locations
  iplot_locs = 1;

newDefaultColors = [0.1 0.3 0.7 ; 0.7 0.8 1 ; 1 0.75 0.1 ; 1 0.75 0.1];

%------------------------ END PLOTS initialization -------------------


label_lst = {label};
label_string=label;
label_lst_fields = regexp(label_lst,'_','split');
label_lst_length = length(label_lst_fields{1});

label_shortname = char(label_lst_fields{1}(1));

 % short label
 tmpc = char(label_lst_fields{1}(1));
 if strcmp(tmpc(1:3),'GLO')
  short_label = 'GLODAP';
 elseif strcmp(tmpc(1:3),'SOC')
  short_label = 'SOCAT';
 elseif strcmp(tmpc(1:3),'SIO')
%  if strcmp(char(label_lst_fields{1}(4)),'XBT')
%   short_label = 'XBT';
%  elseif strcmp(char(label_lst_fields{1}(4)),'SPR')
%   short_label = 'Spray';
%  end
  short_label = 'XBT';
 elseif strcmp(tmpc(1:3),'MEO')
  short_label = 'MEOP';
  short_label = 'Argo';
 elseif strcmp(tmpc(1:3),'VIZ')
  short_label = 'SOCCOM';
 elseif strcmp(tmpc(1:3),'HDO')
  short_label = 'CCHDO';
 elseif length(tmpc)>3
   if strcmp(tmpc(1:4),'USGO')
    short_label = 'Argo';
   elseif strcmp(tmpc(1:4),'UWO2')
    short_label = 'UWO2';
   elseif strcmp(tmpc(1:4),'NODC')
    short_label = 'MRB';
   end
 end

 surfonly = 0;
 if strcmp(tmpc(1:3),'SOC')
  surfonly = 1;
 end

%------------------------ BEGIN OBS load -------------------

prof_yr = 2017;
prof_yr_max = 2017;
% if label_lst_length > 2
%   prof_yr = str2num(char(label_lst_fields{1}(3)))
% elseif length(tmpc)>13
%   if strcmp(tmpc(1:14),'GLODAPv2climyr')
%     prof_yr = 2013
%   end
% end

% if isequal(prof_yr,[])
%   prof_yr = -999;
%   prof_yr_max = -999;
% elseif prof_yr==0
%  prof_yr_max = 0;
% else
%  prof_yr_max = 2017;
% end

% initialize counter for obs with multiple years
count = 0;

for t = prof_yr:prof_yr_max

 % read observations and weights
 % fname_obs = [dpath label_lst{1} '.nc'];
 if t==0
  tmp='0000';
 else
  tmp=num2str(t);
 end
 
 if label_lst_length==5
   fname_obs = [dpath char(label_lst_fields{1}(1)) '_' char(label_lst_fields{1}(2)) '_' tmp '_' char(label_lst_fields{1}(4)) '_' char(label_lst_fields{1}(5)) '.nc'];
   fname_mod = [mpath char(label_lst_fields{1}(1)) '_' char(label_lst_fields{1}(2)) '_' tmp '_' char(label_lst_fields{1}(4)) '_' char(label_lst_fields{1}(5)) '_model.nc'];
 elseif label_lst_length==4
   fname_obs = [dpath char(label_lst_fields{1}(1)) '_' char(label_lst_fields{1}(2)) '_' tmp '_' char(label_lst_fields{1}(4)) '.nc'];
   fname_mod = [mpath char(label_lst_fields{1}(1)) '_' char(label_lst_fields{1}(2)) '_' tmp '_' char(label_lst_fields{1}(4)) '_model.nc'];
 elseif label_lst_length==3
   fname_obs = [dpath char(label_lst_fields{1}(1)) '_' char(label_lst_fields{1}(2)) '_' char(label_lst_fields{1}(3)) '.nc'];
   fname_mod = [mpath char(label_lst_fields{1}(1)) '_' char(label_lst_fields{1}(2)) '_' char(label_lst_fields{1}(3)) '_model.nc'];
 elseif label_lst_length==2
   fname_obs = [dpath char(label_lst_fields{1}(1)) '_' char(label_lst_fields{1}(2)) '.nc'];
   fname_mod = [mpath char(label_lst_fields{1}(1)) '_' char(label_lst_fields{1}(2)) '_model.nc'];
 else
   fname_obs = [dpath char(label_lst_fields{1}(1)) '.nc'];
   fname_mod = [mpath char(label_lst_fields{1}(1)) '_model.nc'];
   if length(tmpc)>13
     if strcmp(tmpc(1:14),'GLODAPv2climyr')
        fname_obs = [dpath tmpc(1:14) tmp '.nc'];
        fname_mod = [mpath tmpc(1:14) tmp '_model.nc'];
     end
   end
 end

 if exist(fname_obs)>0 & exist(fname_mod)>0

  ncid = netcdf.open(fname_obs,'NC_NOWRITE');
  [numdims, numvars, numglobalatts, unlimdimID] = netcdf.inq(ncid);
  disp(['reading ' fname_obs])
  for varid =1:numvars
     varlist(varid) = {netcdf.inqVar(ncid,varid-1)} ;
  end
  ind = find(ismember(varlist,'prof_HHMMSS'));
  prof_HHMMSS = single(netcdf.getVar(ncid,ind-1));
  NTmp = length(prof_HHMMSS);
  prof_HHMMSS(count+1:count+NTmp) = single(netcdf.getVar(ncid,ind-1));
  ind = find(ismember(varlist,'prof_descr'));
  %prof_descr = single(netcdf.getVar(ncid,ind-1));
  prof_descr(:,count+1:count+NTmp) = (netcdf.getVar(ncid,ind-1));
  ind = find(ismember(varlist,'prof_YYYYMMDD'));
  prof_YYYYMMDD(count+1:count+NTmp) = single(netcdf.getVar(ncid,ind-1));
  ind = find(ismember(varlist,'prof_lat'));
  prof_lat(count+1:count+NTmp) = single(netcdf.getVar(ncid,ind-1));
  ind = find(ismember(varlist,'prof_lon'));
  prof_lon(count+1:count+NTmp) = single(netcdf.getVar(ncid,ind-1));
  ind = find(ismember(varlist,'prof_date'));
  if (ind >= 0)
    prof_date = single(netcdf.getVar(ncid,ind-1));
  end
  ind = find(ismember(varlist,'prof_depth'));
  if (ind >= 0)
    prof_depth = single(netcdf.getVar(ncid,ind-1));
    depth = prof_depth;
  else
    ind = find(ismember(varlist,'depth'));
    depth = single(netcdf.getVar(ncid,ind-1));
  end
  prof_depth = depth;
  ind = find(ismember(varlist,'prof_T'));
  if (ind >= 0)
    prof_Tobs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_Tweight'));
    prof_Tweight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_S'));
  if (ind >= 0)
    prof_Sobs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_Sweight'));
    prof_Sweight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_DIC'));
  if (ind >= 0)
    prof_DICobs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
% TMP
    %ind = find(ismember(varlist,'prof_DICweight'));
    ind = find(ismember(varlist,'prof_ALKweight'));
    prof_DICweight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_ALK'));
  if (ind >= 0)
    prof_ALKobs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_ALKweight'));
    prof_ALKweight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_O2'));
  if (ind >= 0)
    prof_O2obs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_O2weight'));
    prof_O2weight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_NO3'));
  if (ind >= 0)
    prof_NO3obs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_NO3weight'));
    prof_NO3weight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_PO4'));
  if (ind >= 0)
    prof_PO4obs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_PO4weight'));
    prof_PO4weight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_CHL'));
  if (ind >= 0)
    prof_CHLobs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_CHLweight'));
    prof_CHLweight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_POC'));
  if (ind >= 0)
    prof_POCobs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_POCweight'));
    prof_POCweight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_PH'));
  if (ind >= 0)
    prof_PHobs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_PHweight'));
    prof_PHweight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_PCO'));
  if (ind >= 0)
    % VIZ pCO2 is not surf only
    % prof_PCOobs(count+1:count+NTmp,1) = single(netcdf.getVar(ncid,ind-1)');
    tmp = single(netcdf.getVar(ncid,ind-1)'); nztmp=size(tmp,2);
    prof_PCOobs(count+1:count+NTmp,1:nztmp) = tmp;
    ind = find(ismember(varlist,'prof_PCOweight'));
    prof_PCOweight(count+1:count+NTmp,1:nztmp)=single(netcdf.getVar(ncid,ind-1)');
  end
  ind = find(ismember(varlist,'prof_FE'));
  if (ind >= 0)
    prof_FEobs(count+1:count+NTmp,:) = single(netcdf.getVar(ncid,ind-1)');
    ind = find(ismember(varlist,'prof_FEweight'));
    prof_FEweight(count+1:count+NTmp,:)=single(netcdf.getVar(ncid,ind-1)');
  end
  netcdf.close(ncid);

  NP = length(prof_lat);
  NZ = length(prof_depth);
  % display(['Number of profiles = ' num2str(NP)])
  % 97 standard depths
  if NZ~=97
    display(['Warning: number of depth levels = ' num2str(NZ)])
  end
%------------------------ END OBS load -------------------

%------------------------ BEGIN model output load -------------------
%disp(['reading ' fname_mod])
ncid_mod = netcdf.open(fname_mod,'NC_NOWRITE');
[numdims, numvars, numglobalatts, unlimdimID] = netcdf.inq(ncid_mod);

for varid = 1:numvars
  varlist_mod(varid) = {netcdf.inqVar(ncid_mod,varid-1)};
end
%display('This dataset includes ')
ind = find(ismember(varlist_mod,'prof_Testim'));
Tconstraints = 0;
Sconstraints = 0;
if strcmp(label_shortname(1:3),'GLO') | strcmp(label_shortname,'UWO2')
  %DONT USE T AND S FROM THESE
else
if (ind >= 0)
  prof_Tmod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  Tconstraints = 1;
  %display('Temperature observations');
end
ind = find(ismember(varlist_mod,'prof_Sestim'));
if (ind >= 0)
  prof_Smod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  Sconstraints = 1;
  %display('Salinity observations');
end
end
ind = find(ismember(varlist_mod,'prof_DICestim'));
% TMP 
if length(ind)>1
 ind=ind(1);
end
DICconstraints = 0;
if (ind >= 0)
  prof_DICmod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  DICconstraints = 1;
  %display('Carbon observations');
end
ind = find(ismember(varlist_mod,'prof_ALKestim'));
ALKconstraints = 0;
if (ind >= 0)
  prof_ALKmod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  ALKconstraints = 1;
  %display('Alkalinity observations');
end
ind = find(ismember(varlist_mod,'prof_O2estim'));
O2constraints = 0;
if (ind >= 0)
  prof_O2mod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  O2constraints = 1;
  %display('Oxygen observations');
end
ind = find(ismember(varlist_mod,'prof_NO3estim'));
NO3constraints = 0;
if (ind >= 0)
  prof_NO3mod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  NO3constraints = 1;
  %display('Nitrate observations');
end
ind = find(ismember(varlist_mod,'prof_PO4estim'));
PO4constraints = 0;
if (ind >= 0)
  prof_PO4mod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  PO4constraints = 1;
  %display('Phosphate observations');
end
ind = find(ismember(varlist_mod,'prof_CHLestim'));
CHLconstraints = 0;
if (ind >= 0)
  prof_CHLmod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  CHLconstraints = 1;
  %display('Chlorophyll observations');
end
ind = find(ismember(varlist_mod,'prof_POCestim'));
POCconstraints = 0;
if (ind >= 0)
  prof_POCmod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  POCconstraints = 1;
  %display('POC observations');
end
ind = find(ismember(varlist_mod,'prof_PHestim'));
PHconstraints = 0;
if (ind >= 0)
  prof_PHmod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  PHconstraints = 1;
  %display('pH observations');
end
ind = find(ismember(varlist_mod,'prof_PCOestim'));
PCOconstraints = 0;
if (ind >= 0)
  prof_PCOmod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  PCOconstraints = 1;
  %display('pCO2 observations');
end
ind = find(ismember(varlist_mod,'prof_FEestim'));
FEconstraints = 0;
if (ind >= 0)
  prof_FEmod(count+1:count+NTmp,1:NZ) = single(netcdf.getVar(ncid_mod,ind-1)');
  FEconstraints = 1;
  %display('FE observations');
end
netcdf.close(ncid);

count = count + NTmp;
%------------------------ END model output LOAD -------------------

end % if exist(fname_obs)>0

end % for t = prof_yr:prof_yr_max



%------------------------ OPTIONS ------------------------  

if length(prof_YYYYMMDD)>0

% convert from yyyymmddhhmmss to matlab time
sdate = [num2str(prof_YYYYMMDD') num2str(1.e6+round(prof_HHMMSS))];
sdate(:,9) = repmat('T',length(prof_HHMMSS),1);	
mltime = datenum(sdate,'yyyymmddTHHMMSS');

%CAV - use only time period where there are obs and model values
ind_tmp = zeros(size(mltime));
if Tconstraints
 ind_tmp = ind_tmp + sum(prof_Tmod>-9990,2)>0;
end
if Sconstraints
 ind_tmp = ind_tmp + sum(prof_Smod>-9990,2)>0;
end
if DICconstraints
 ind_tmp = ind_tmp + sum(prof_DICmod>-9990,2)>0;
end
if ALKconstraints
 ind_tmp = ind_tmp + sum(prof_ALKmod>-9990,2)>0;
end
if O2constraints
 ind_tmp = ind_tmp + sum(prof_O2mod>-9990,2)>0;
end
if NO3constraints
 ind_tmp = ind_tmp + sum(prof_NO3mod>-9990,2)>0;
end
if PO4constraints
 ind_tmp = ind_tmp + sum(prof_PO4mod>-9990,2)>0;
end
if CHLconstraints
 ind_tmp = ind_tmp + sum(prof_CHLmod>-9990,2)>0;
end
if POCconstraints
 ind_tmp = ind_tmp + sum(prof_POCmod>-9990,2)>0;
end
if PHconstraints
 ind_tmp = ind_tmp + sum(prof_PHmod>-9990,2)>0;
end
if PCOconstraints
 ind_tmp = ind_tmp + sum(prof_PCOmod>-9990,2)>0;
end
if FEconstraints
 ind_tmp = ind_tmp + sum(prof_FEmod>-9990,2)>0;
end
ind_tmp(ind_tmp>0)=1;
mltime2 = mltime(ind_tmp');

%APPLY MASKS
if Tconstraints;[prof_Tweight, prof_Tobs, prof_Tmod, prof_Trms] = ....
           metrics_profiles_ApplyMsk(prof_Tweight, prof_Tobs, prof_Tmod);
           if isnan(max(prof_Tweight(:))); Tconstraints=0;end;end
if Sconstraints;[prof_Sweight, prof_Sobs, prof_Smod, prof_Srms] = ....
           metrics_profiles_ApplyMsk(prof_Sweight, prof_Sobs, prof_Smod);
           if isnan(max(prof_Sweight(:))); Sconstraints=0;end;end
if DICconstraints;[prof_DICweight, prof_DICobs, prof_DICmod, prof_DICrms] = ....
           metrics_profiles_ApplyMsk(prof_DICweight, prof_DICobs, prof_DICmod);
           if isnan(max(prof_DICweight(:))); DICconstraints=0;end;end
if ALKconstraints;[prof_ALKweight, prof_ALKobs, prof_ALKmod, prof_ALKrms] = ....
           metrics_profiles_ApplyMsk(prof_ALKweight, prof_ALKobs, prof_ALKmod);
           if isnan(max(prof_ALKweight(:))); ALKconstraints=0;end;end
if O2constraints;[prof_O2weight, prof_O2obs, prof_O2mod, prof_O2rms] = ....
           metrics_profiles_ApplyMsk(prof_O2weight, prof_O2obs, prof_O2mod);
           if isnan(max(prof_O2weight(:))); O2constraints=0;end;end
if NO3constraints;[prof_NO3weight, prof_NO3obs, prof_NO3mod, prof_NO3rms] = ....
           metrics_profiles_ApplyMsk(prof_NO3weight, prof_NO3obs, prof_NO3mod);
           if isnan(max(prof_NO3weight(:))); NO3constraints=0;end;end
if PO4constraints;[prof_PO4weight, prof_PO4obs, prof_PO4mod, prof_PO4rms] = ....
           metrics_profiles_ApplyMsk(prof_PO4weight, prof_PO4obs, prof_PO4mod);
           if isnan(max(prof_PO4weight(:))); PO4constraints=0;end;end
if CHLconstraints;[prof_CHLweight, prof_CHLobs, prof_CHLmod, prof_CHLrms] = ....
           metrics_profiles_ApplyMsk(prof_CHLweight, prof_CHLobs, prof_CHLmod);
           if isnan(max(prof_CHLweight(:))); CHLconstraints=0;end;end
if POCconstraints;[prof_POCweight, prof_POCobs, prof_POCmod, prof_POCrms] = ....
           metrics_profiles_ApplyMsk(prof_POCweight, prof_POCobs, prof_POCmod);
           if isnan(max(prof_POCweight(:))); POCconstraints=0;end;end
if PHconstraints;[prof_PHweight, prof_PHobs, prof_PHmod, prof_PHrms] = ....
           metrics_profiles_ApplyMsk(prof_PHweight, prof_PHobs, prof_PHmod);
           if isnan(max(prof_PHweight(:))); PHconstraints=0;end;end
if PCOconstraints;[prof_PCOweight, prof_PCOobs, prof_PCOmod, prof_PCOrms] = ....
           metrics_profiles_ApplyMsk(prof_PCOweight, prof_PCOobs, prof_PCOmod);
           if isnan(max(prof_PCOweight(:))); PCOconstraints=0;end;end
if FEconstraints;[prof_FEweight, prof_FEobs, prof_FEmod, prof_FErms] = ....
           metrics_profiles_ApplyMsk(prof_FEweight, prof_FEobs, prof_FEmod);
           if isnan(max(prof_FEweight(:))); FEconstraints=0;end;end


% SOCCOM: don't plot T, S
if strcmp(char(label_lst_fields{1}(1)),'VIZ')
 Tconstraints = 0;
 Sconstraints = 0;
end


% CHOOSE BIN RESOLUTION FOR PLOTTING:
% (hardcoded to 2 deg for now)
% xb = [min(prof_lon):2:(max(prof_lon)+1.99)];
xb = 290:0.25:350;
NX = length(xb);
% (hardcoded to 0.5 deg for now)
% yb = [min(prof_lat):0.5:(max(prof_lat)+.49)];
yb = -60:0.25:-32;
NY = length(yb);
% (hardcoded to 1 day for now)
% tb = [min(mltime2):1:(max(mltime2)+.99)];
if (max(mltime2)-min(mltime2))<400
  dt = 5;
elseif (max(mltime2)-min(mltime2))>1100
  dt = 365.25/12;
else
  dt = 10;
end
tb = [min(mltime2):dt:(max(mltime2)+dt-.01)];
NT = length(tb);  

% if sparse use scatter plot
sctrplt = -1;
% sctrplt = 1 will always use scatter plot
% sctrplt = 0 will always use imagescnan; better for non-sparse obs
% sctrplt = -1 will choose betweem scatter and imagesc depending on number of obs
spmsz_cst = 31;   % size of the scatter plot markers. 
                 % If 0, automatic based on number of obs.

% Now make difference obs - model:
%   prof_Xdif = prof_Xobs - prof_Xmod
% weighted (normalized) differences:
%   prof_Xdifn = prof_Xdif./prof_Xrms
if Tconstraints
  prof_Tdif = prof_Tmod - prof_Tobs;
  prof_Tdifn = prof_Tdif./prof_Trms;
end
if Sconstraints
  prof_Sdif = prof_Smod - prof_Sobs;
  prof_Sdifn = prof_Sdif./prof_Srms;
end
if DICconstraints
  prof_DICdif = prof_DICmod - prof_DICobs;
  prof_DICdifn = prof_DICdif./prof_DICrms;
end
if ALKconstraints
  prof_ALKdif = prof_ALKmod - prof_ALKobs;
  prof_ALKdifn = prof_ALKdif./prof_ALKrms;
end
if O2constraints
  prof_O2dif = prof_O2mod - prof_O2obs;
  prof_O2difn = prof_O2dif./prof_O2rms;
end
if NO3constraints
  prof_NO3dif = prof_NO3mod - prof_NO3obs;
  prof_NO3difn = prof_NO3dif./prof_NO3rms;
end
if PO4constraints
  prof_PO4dif = prof_PO4mod - prof_PO4obs;
  prof_PO4difn = prof_PO4dif./prof_PO4rms;
end
if CHLconstraints
  prof_CHLdif = prof_CHLmod - prof_CHLobs;
  prof_CHLdifn = prof_CHLdif./prof_CHLrms;
end
if POCconstraints
  prof_POCdif = prof_POCmod - prof_POCobs;
  prof_POCdifn = prof_POCdif./prof_POCrms;
end
if PHconstraints
  prof_PHdif = prof_PHmod - prof_PHobs;
  prof_PHdifn = prof_PHdif./prof_PHrms;
end
if PCOconstraints
  prof_PCOdif = prof_PCOmod - prof_PCOobs;
  prof_PCOdifn = prof_PCOdif./prof_PCOrms;
end
if FEconstraints
  prof_FEdif = prof_FEmod - prof_FEobs;
  prof_FEdifn = prof_FEdif./prof_FErms;
end
%--------------------------- NOW PREPARE TO PLOT -------------------------------
spath = figure_out;

ALLconstraints = [Tconstraints Sconstraints DICconstraints ALKconstraints O2constraints NO3constraints PO4constraints CHLconstraints POCconstraints PHconstraints PCOconstraints FEconstraints];
ALLobs = {'THETA' 'SALT' 'DIC' 'ALK' 'O2' 'NO3' 'PO4' 'CHL' 'POC' 'PH' 'PCO' 'FE'};
numobs = sum(ALLconstraints);
%display([num2str(numobs) ' variables will be plotted'])

  for ic = 1:numobs
    tmp = find(ALLconstraints>0);
    obstype = tmp(ic);
    obstypestr = char(ALLobs(obstype));
    %display(char(ALLobs(obstype)))
    plottypestr = '_norm';
    ttlstr = ['normalized ' obstypestr ' misfit (model-obs)'];
    customaxis = 1;
    ufac =  1;
    unitstr = ' ';
    diagoutfac = 1;
    if obstype == 1 % T
      Q = prof_Tdifn; 
      cv = [-1:.1:1]*10;
      diagoutfac = 2;
    elseif obstype == 2 % S
      Q = prof_Sdifn;
      cv = [-1:.1:1]*10;
      diagoutfac = 2;
    elseif obstype == 3 % DIC
      Q = prof_DICdifn;
      cv = [-1:.1:1]*10;
    elseif obstype == 4 % ALK
      Q = prof_ALKdifn;
      cv = [-1:.1:1]*10;
    elseif obstype == 5 % O2
      Q = prof_O2difn;
      cv = [-1:.1:1]*10;
    elseif obstype == 6 % NO3
      Q = prof_NO3difn;
      cv = [-1:.1:1]*10;
    elseif obstype == 7 % PO4
      Q = prof_PO4difn;
      cv = [-1:.1:1]*10;
    elseif obstype == 8 % CHL
      Q = prof_CHLdifn;
      cv = [-1:.1:1]*10;
    elseif obstype == 9 % POC
      Q = prof_CHLdifn;
      cv = [-1:.1:1]*10;
    elseif obstype == 10 % PH
      Q = prof_PHdifn;
      cv = [-1:.1:1]*10;
    elseif obstype == 11 % PCO2
      Q = prof_PCOdifn;
      cv = [-1:.1:1]*10;
    elseif obstype == 12 % FE
      Q = prof_FEdifn;
      cv = [-1:.1:1]*10;
    end

    % need to collapse in depth: plot vs prof #...not sure we want to see this
    pbarQ = nanmean(Q,2);
    pstdQ = nanstd(Q,0,2);
    pmaxQ = max(Q,[],2);
    pminQ = min(Q,[],2);

    % need to collapse in prof num: plot vs depth
    zbarQ = nanmean(Q,1);
    zstdQ = nanstd(Q,0,1);
    zmaxQ = max(Q,[],1);
    zminQ = min(Q,[],1);
    % and use this to find deepest observations
    maxz = depth(find(~isnan(zbarQ)>0,1,'last'));
    maxz = max([maxz 5]);

%WRITE OUT MAX NORM MISFIT
     nrmcstthrshld = 7;
     if 0
      [tI,tJ] = find(Q == max(Q(:)));
      fprintf(fidm, '%s\n', [obstypestr ': Max Norm Misfit is at ' num2str(prof_lon(tI),5) ', ' ...
                             num2str(prof_lat(tI),5) ', ' num2str(depth(tJ),4) ...
                             'm. date: ' num2str(prof_YYYYMMDD(tI),8)  ...
                             '. float ' prof_descr(:,tI)']);
      [tI,tJ] = find(Q == min(Q(:)));
      fprintf(fidm, '%s\n', [obstypestr ': Min Norm Misfit is at ' num2str(prof_lon(tI),5)  ', ' ...
                             num2str(prof_lat(tI),5) ', ' num2str(depth(tJ),4) ...
                             'm. date: ' num2str(prof_YYYYMMDD(tI),8)  ...
                             '. float ' prof_descr(:,tI)']);
     else 
      [tI,tJ] = find(abs(Q) > nrmcstthrshld*diagoutfac);
      if length(tI) > 0 
       tmp = zeros(length(tI),1);
       for ilier = 1:length(tI)
         tmp(ilier) = Q(tI(ilier),tJ(ilier));
       end
       [junk,tK]=sort(abs(tmp),'descend'); clear junk tmp
       for ilier = 1:length(tI)
         si = tK(ilier);
         fprintf(fidm, '%s\n', [obstypestr ': Norm Cost is ' ...
                             num2str(Q(tI(si),tJ(si))/diagoutfac,4)  ' at x,y,z ' ...
                             num2str(prof_lon(tI(si)),4)  ', ' ...
                             num2str(prof_lat(tI(si)),4)  ', ' ...
                             num2str(depth(tJ(si)),4) ...
                             'm. date: ' num2str(prof_YYYYMMDD(tI(si)),8)  ...
                             '. float ' prof_descr(:,tI(si))']);
       end 
if 1
%CMM(
       %NOW MAKE HTML TABLE OF 30 LARGEST COSTS
       tblname = [figure_out label '_' obstypestr 'Table_Iter' num2str(iter) '.html']
       tbltmp = [obstypestr];%GTHTMLtable crashing with anything fancy...
       clear tblmat
       for ilier = 1:[min([30,length(tI)])];
         si = tK(ilier);
         tbyr = floor(prof_YYYYMMDD(tI(si))/10000);
         tbmn = floor((prof_YYYYMMDD(tI(si)) - tbyr*10000)/100);
         tbdy = prof_YYYYMMDD(tI(si)) - tbyr*10000 - tbmn*100;
%         tblmat(ilier,:) = [Q(tI(si),tJ(si))/diagoutfac, prof_lon(tI(si)), prof_lat(tI(si)), depth(tJ(si)),tbyr,tbmn,tbdy];
         tblmat(ilier,1) = {Q(tI(si),tJ(si))/diagoutfac};
         tblmat(ilier,2) = {prof_lon(tI(si))};
         tblmat(ilier,3) = {prof_lat(tI(si))};
         tblmat(ilier,4) = {depth(tJ(si))};
         tblmat(ilier,5) = {tbyr};
         tblmat(ilier,6) = {tbmn};
         tblmat(ilier,7) = {tbdy};         
         tblmat(ilier,8) = {prof_descr(:,tI(si))'};
       end
       tblclm = [1:ilier];
       tblrow = {'Norm misfit','long','lat','depth','year','month','day','meta'};
       GTHTMLtable([tbltmp],tblmat,tblrow,tblclm,'save');
       eval(['!mv TABLE_' tbltmp '.html ' tblname])
%CMM)
end
       else
        fprintf(fidm, '%s\n', [obstypestr ': No misfits > ' num2str(nrmcstthrshld)]);
      end
clear ik
  ik = 1:NZ;
  bNZ = NZ;
bQ = Q(:,ik);

  % need to bin prof num to long
  [xbarQ,xstdQ,xmaxQ,xminQ,xzbarQ,xzstdQ,xzmaxQ,xzminQ] = metrics_profiles_Bin1(NX,bNZ,bQ,prof_lon,xb);

  % need to bin prof num to lat 
  [ybarQ,ystdQ,ymaxQ,yminQ,yzbarQ,yzstdQ,yzmaxQ,yzminQ] = metrics_profiles_Bin1(NY,bNZ,bQ,prof_lat,yb);

  % need to bin prof num to time
  [tbarQ,tstdQ,tmaxQ,tminQ,tzbarQ,tzstdQ,tzmaxQ,tzminQ] = metrics_profiles_Bin1(NT,bNZ,bQ,mltime,tb);

  %BIN IN LAT LONG
  [xybarQ,xystdQ,xymaxQ,xyminQ] = metrics_profiles_Bin2(NX,NY,bQ,prof_lon,prof_lat,xb,yb);
  % NOW BIN IN long and time
   if size(prof_lon,1)~=size(mltime,1)
     mltime = mltime';
   end
  [xtbarQ,xtstdQ,xtmaxQ,xtminQ] = metrics_profiles_Bin2(NX,NT,bQ,prof_lon,mltime,xb,tb);
   % NOW BIN IN lat and time
  [ytbarQ,ytstdQ,ytmaxQ,ytminQ] = metrics_profiles_Bin2(NY,NT,bQ,prof_lat,mltime,yb,tb);

%SAVE
%if iter >= 0
%  save([ figure_out 'diag_profiles_iter_' num2str(iter)])
%end

%--------------------------- MAKE PLOTS -------------------------------

% FIRST LINE PLOTS

if 0 % redundant
%figure;  Misfit as function of time
figure('visible','off'); set(gcf, 'Position', [1, 1, 1920, 1080])
ax1 = subplot(2,1,1); 
  set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
  plot(tb,tbarQ*ufac,'Linewidth',w_line); datetick
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  title([label ': ' obstypestr ' normalized misfit, spatial mean']);
  title(['mean normalized misfit']);
  xlim([tb(1) tb(end)]);
  % acc_plot
ax2 = subplot(2,1,2); 
  set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
  plot(tb,tstdQ*ufac,'Linewidth',w_line); datetick
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
  %title(['            ' label ': ' obstypestr ' normalized misfit, spatial std. dev.']);
  title(['std. dev. normalized misfit']);
  xlim([tb(1) tb(end)]);
  % acc_plot
if (iprint >= 1)
  set(gcf,'Paperposition',[.5 .5 16 9])%  set(gcf,'PaperOrientation','landscape');
  plt_fn = [ figure_out 'prof' short_label '_'  obstypestr '_misfitTime' plottypestr '.' plt_ext];
  print(['-d' plt_typ],plt_fn)
  %disp(['plot file = ' plt_fn])
end

figure('visible','off'); set(gcf, 'Position', [1, 1, 1920, 1080])
  set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
  plot(tb,tbarQ*ufac,tb,tstdQ*ufac,tb,tmaxQ*ufac,tb,tminQ*ufac,'Linewidth',w_line); datetick
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  %title([label ': ' obstypestr ' normalized misfit, spatial mean']);
  title(['mean normalized misfit']);
  xlim([tb(1) tb(end)]);
  l = legend('mean','std','min/max');%,'Location','Best');
  % acc_plot
if (iprint >= 1)
  set(gcf,'Paperposition',[.5 .5 16 9])%  set(gcf,'PaperOrientation','landscape');
  plt_fn = [ figure_out 'prof' short_label '_'  obstypestr '_misfitTime' plottypestr '_MaxMin.' plt_ext];
  print(['-d' plt_typ],plt_fn)
  %disp(['plot file = ' plt_fn])
end
end % if 0

%------------------
lnstyl = '+-';
for iip = 1:2
  if iip == 1; pstr = 'minmax'; pcnst = 1; lim1 = max([abs(xminQ); abs(xmaxQ)])*1*ufac;
  elseif iip == 2; pstr = ''; pcnst = nan; lim1 = max([abs(xstdQ); abs(xbarQ)])*1*ufac;
  end
%figure;
  figure('visible','off');
  set(gcf, 'Position', [1, 1, 1920, 1080])
ax1 = subplot(2,2,1);
  set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
  p = plot(zbarQ*ufac,-prof_depth,lnstyl,zstdQ*ufac,-prof_depth,lnstyl,...
             pcnst*zmaxQ*ufac,-prof_depth,lnstyl,pcnst*zminQ*ufac,-prof_depth,lnstyl);
  set(p,'Linewidth',w_line);
  if iip == 1
    l = legend('mean','std','min/max');%,'Location','Best');
  else
    l = legend('mean','std');%,'Location','Best');
  end
  set(l,'Location','southeast')
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  xlabel([unitstr],'Interpreter','tex')
  ylabel('depth [m]')
%  title(['            ' label ':  ' obstypestr ' normalized misfit (model-obs)' ],'Interpreter','none')
  title(['            ' label ':  ' obstypestr ' norm. misfit' ],'Interpreter','none')  
  title(['normalized misfit']);

  xlim([-lim1 lim1]);ylim([-maxz 0])
  grid on
  box on
  % acc_plot
ax2 = subplot(2,2,2);
  set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
  p = plot(xbarQ*ufac,xb,lnstyl,xstdQ*ufac,xb,lnstyl,...
             pcnst*xmaxQ*ufac,xb,lnstyl,pcnst*xminQ*ufac,xb,lnstyl);
  set(p,'Linewidth',w_line);
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  xlabel([unitstr],'Interpreter','tex')
  ylabel('longitude')
  xlim([-lim1 lim1]);ylim([min(xb) max(xb)])
  grid on
  box on
  % acc_plot
  subplot(2,2,3)
  set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
  p = plot(ybarQ*ufac,yb,lnstyl,ystdQ*ufac,yb,lnstyl,...
             pcnst*ymaxQ*ufac,yb,lnstyl,pcnst*yminQ*ufac,yb,lnstyl);
  set(p,'Linewidth',w_line);
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  xlabel([unitstr],'Interpreter','tex')
  ylabel('latitude')
  xlim([-lim1 lim1]);ylim([min(yb) max(yb)])
  grid on
  box on
  % acc_plot
  subplot(2,2,4)
  set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
  p = plot(tbarQ*ufac,tb,lnstyl,tstdQ*ufac,tb,lnstyl,...
             pcnst*tmaxQ*ufac,tb,lnstyl,pcnst*tminQ*ufac,tb,lnstyl);
  set(p,'Linewidth',w_line);
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  xlabel([unitstr],'Interpreter','tex')
  ylabel('date')
  
  xlim([-lim1 lim1]);ylim([min(tb) max(tb)])
  set(gca,'ytick',linspace(min(tb),max(tb),5))
  datetick('y',12,'keeplimits','keepticks')
  % acc_plot
  grid on
  box on
  if (iprint >= 1)
    set(gcf,'Paperposition',[.5 .5 16 9])
    plt_fn = [ figure_out 'prof' short_label '_'  obstypestr '_misfit1d' pstr plottypestr  '.' plt_ext];
    print(['-d' plt_typ],plt_fn)
    %disp(['plot file = ' plt_fn])
  end
end  %for iip = 1:2 

%-------------------- -----------------------------------------------------
% do probability distribution and cumulative distribution plots
lnstyl = '-.';
% make pdf and cdf for Q
tmp = Q(:);I = isfinite(tmp); tmp = tmp(I);
%figure;
idx = 0.5;
figure('visible','off');
subplot(1,2,1);
  hx = [-20:idx:20];
  histT = hist(tmp,hx);
  histT=histT/trapz(hx,histT); %normalize to 1
%  bar(hx,histT,1,'FaceColor',[0.1 .2 .5],'EdgeColor',[1 1 1],'LineWidth',1);
  bar(hx,histT,1,'FaceColor',[0.8 0.6 0.8],'EdgeColor',[0.8 0.6 0.8],'LineWidth',1);
  hold on
  Ampl1 = gaussian(nanmean(tmp),nanstd(tmp),hx);%std dev of 1
  Ampl1 = Ampl1/trapz(hx,Ampl1); %normalize to 1
  p = plot(hx,Ampl1,'color',[0.1 0.3 0.7]);  set(p,'Linewidth',3);
  Ampl2 = gaussian(0,1,hx);%std dev of 1
  Ampl2 = Ampl2/trapz(hx,Ampl2);
  p = plot(hx,Ampl2,'color',[1 0 0]);  set(p,'Linewidth',w_line);
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b','xtick',-20:10:20)
  title(['  ' label ':  ' obstypestr ' norm. misfit PDF '],'Interpreter','none')
  title(['normalized misfit PDF']);
  ylabel('prob. dens.');
  xlabel('norm. misfit (model-obs)');
  xlim([-20 20]);ylim([0 .2]);  grid on;   box on
  % acc_plot
 subplot(1,2,2)
   tmp2 = cumsum(idx*histT);%*((max(hx)-min(hx))/length(hx)); % tmp2=tmp2/tmp2(end);
   p = plot(hx,tmp2,hx,cumsum(idx*Ampl1),hx,cumsum(idx*Ampl2));
   set(p(1),'color',[0.8 0.6 0.8]);   set(p(2),'color',[0.1 0.3 0.7]);   set(p(3),'color',[1 0 0]);
   set(p,'Linewidth',w_line);
   xlim([-20 20]);ylim([-.5 1.05]);grid on;   box on
   set(p,'Linewidth',w_line);
   set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b','xtick',-20:10:20,'ytick',0:.2:1);
   %l = legend('cost','Gaussian fit','Ideal fit','fontname','Ubuntu','fontsize',ifont);
   l = legend('cost','Gaussian fit','Ideal fit');
   set(l,'location','southeast','fontname','Ubuntu','fontsize',ifont);
   ylabel([unitstr],'Interpreter','tex');
   xlabel('norm. misfit (model-obs)');
   ylabel('cum. dens.');
   title(' and CDF');
   % acc_plot
   if (iprint >= 1)
     set(gcf,'position',[360 260 870 415],'paperpositionmode','auto')
     plt_fn = [ figure_out 'prof' short_label '_' obstypestr '_densfunc' plottypestr  '.' plt_ext];
     print(['-d' plt_typ],plt_fn)
     %disp(['plot file = ' plt_fn])
   end

%-------------------------------------------------------------------------
% NOW DO BY MEAN, STD, MAX, MIN
% DO MEAN STD AS XY XT, AND THEN MAX MIN 
% DO MEAN STD AS YZ YT, AND THEN MAX MIN 
% DO MEAN STD AS XZ ZT, AND THEN MAX MIN 

  for iip = 1:6 % 1:3
  switch iip
  case 1; Q1=xybarQ;Q2=xtbarQ;Q3=xystdQ;Q4=xtstdQ; psvnm = '_misfitX';
    x=xb;xlbl='longitude';
    y1=yb;ylbl1='latitude'; ydts1=0;y2=tb;ylbl2='date'; ydts2=1;
    t1str='mean';t2str='std dev';
  case 2; Q1=yzbarQ;Q2=ytbarQ;Q3=yzstdQ;Q4=ytstdQ; psvnm = '_misfitY';
    x=yb;xlbl='latitude';
    y1=-prof_depth;
    ylbl1='depth';ydts1=0;y2=tb;ylbl2='date';ydts2=1;
    t1str='mean';t2str='std dev';
  case 3; Q1=xzbarQ';Q2=tzbarQ';Q3=xzstdQ';Q4=tzstdQ'; psvnm = '_misfitZ';
    x=-prof_depth; xlbl='depth';
    y1=xb;ylbl1='longitude';ydts1=0;y2=tb;ylbl2='date'; ydts2=1;
    t1str='mean';t2str='std dev';
  case 4; Q1=xymaxQ;Q2=xtmaxQ;Q3=xyminQ;Q4=xtminQ; psvnm = '_misfitXminmax';
    x=xb;xlbl='longitude';
    y1=yb;ylbl1='latitude'; ydts1=0;y2=tb;ylbl2='date'; ydts2=1;
    t1str='max';t2str='min';
  case 5; Q1=yzmaxQ;Q2=ytmaxQ;Q3=yzminQ;Q4=ytminQ; psvnm = '_misfitYminmax';
    x=yb;xlbl='latitude';
    y1=-prof_depth;
    ylbl1='depth';ydts1=0;y2=tb;ylbl2='date';ydts2=1;
    t1str='max';t2str='min';
  case 6; Q1=xzmaxQ';Q2=tzmaxQ';Q3=xzminQ';Q4=tzminQ'; psvnm = '_misfitZminmax';
    x=-prof_depth; xlbl='depth';
    y1=xb;ylbl1='longitude';ydts1=0;y2=tb;ylbl2='date'; ydts2=1;
    t1str='max';t2str='min';
  end
  if iip < 4
    cvscl = 1;
  else
    cvscl = 5;
  end
  [NXC, NYC] = size(Q1);
  Q1=Q1*ufac; Q2=Q2*ufac; Q3=Q3*ufac; Q4=Q4*ufac;
  [y2d1,x2d1] = meshgrid(y1,x); x2d1 = x2d1(:); y2d1 = y2d1(:);
  [y2d2,x2d2] = meshgrid(y2,x); x2d2 = x2d2(:); y2d2 = y2d2(:);
  Q1tmp = Q1(:);Q2tmp = Q2(:);Q3tmp = Q3(:);Q4tmp = Q4(:);
  I1 = find(isfinite(Q1tmp));
  I2 = find(isfinite(Q2tmp));
  I3 = find(isfinite(Q3tmp));
  I4 = find(isfinite(Q4tmp));
if length(I1)*length(I2)*length(I3)*length(I4)==0
  display(['skipping figure: prof' label '_' obstypestr psvnm plottypestr  '.' plt_ext])
else
%figure;
figure('visible','off');  set(gcf, 'Position', [1, 1, 1920, 1080])
ax1 = subplot(2,2,1);
  if sctrplt==1
    nobstmp=size(Q1tmp(I1),1);
      spmsz = spmsz_cst; if spmsz<=0 spmsz=max(2,20-nobstmp/1000); end
    scatter_custom(x2d1(I1),y2d1(I1), spmsz, Q1(I1),'filled');
  elseif sctrplt==0
    imagescnan(x,y1,Q1','nancolor',[.6 .6 .6]); axis xy
  elseif sctrplt==-1
    nobstmp=length(I1);
    if ( (length(x)>1) & (length(y1)>1) & (nobstmp>(length(x)*length(y1)/2)) ) 
      imagescnan(x,y1,Q1','nancolor',[1 1 1]); axis xy
    else
      spmsz = spmsz_cst; if spmsz<=0 spmsz=max(2,20-nobstmp/1000); end
      scatter_custom(x2d1(I1),y2d1(I1), spmsz, Q1tmp(I1),'filled');
    end
  end
     hold on
     if iip==1 | iip==4
       contour(XC,YC,Depth',[0 1],'k','linewidth',2)
     end
  if customaxis 
    caxis([cv(1) cv(end)]*cvscl);
  else
    axsave1 = caxis;
    caxis([-max(abs([Q1tmp; Q3tmp])) max(abs([Q1tmp; Q3tmp]))]);
  end       
  colormap(ax1,divcolormap);%
  hc = colorbar; %
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  xlabel([xlbl]); ylabel([ylbl1]); 
  if ydts1
    set(gca,'ytick',linspace(min(tb),max(tb),5))
    datetick('y',12,'keeplimits','keepticks')
  end
%AV  title([label ' ' obstypestr ' ' t1str ' norm. misfit '],'Interpreter','none');
  %title([label ' ' obstypestr ' ' t1str],'Interpreter','none');
  title([t1str],'Interpreter','none');
  axis tight; grid on; box on
  if strcmp(xlbl,'latitude'); xlim([min(yb) max(yb)]);
  elseif strcmp(xlbl,'depth'); xlim([-maxz 0]);end
  if strcmp(ylbl1,'longitude'); ylim([min(xb) max(xb)]);
  elseif strcmp(ylbl1,'depth'); ylim([-maxz 0]);
  end
  % acc_plot
ax2 = subplot(2,2,2);
  if sctrplt == 1
    nobstmp=size(Q2tmp(I2),1);
      spmsz = spmsz_cst; if spmsz<=0 spmsz=max(2,20-nobstmp/1000); end
    scatter_custom(x2d2(I2),y2d2(I2), spmsz, Q2(I2),'filled');
  elseif sctrplt == 0
    imagescnan(x,y2,Q2','nancolor',[.6 .6 .6]); axis xy
  elseif sctrplt == -1
    nobstmp=length(I2);
    if ( (length(x)>1) & (length(y2)>1) & (nobstmp>(length(x)*length(y2)/2)) )
      imagescnan(x,y2,Q2','nancolor',[1 1 1]); axis xy
    else
      spmsz = spmsz_cst; if spmsz<=0 spmsz=max(2,20-nobstmp/1000); end
      scatter_custom(x2d2(I2),y2d2(I2), spmsz, Q2tmp(I2),'filled');
    end
  end
  if customaxis
    caxis([cv(1) cv(end)]*cvscl);
  else
    axsave2 = caxis;
    caxis([-max(abs([Q2tmp; Q4tmp])) max(abs([Q2tmp; Q4tmp]))]);
  end
  colormap(ax2,divcolormap);%
  hc=colorbar; %
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  xlabel([xlbl]);      ylabel([ylbl2])
  if ydts2
    set(gca,'ytick',linspace(min(tb),max(tb),5))
    datetick('y',12,'keeplimits','keepticks')
  end 
    axis tight; grid on; box on
  if strcmp(xlbl,'depth'); xlim([-maxz 0]);
  elseif strcmp(ylbl2,'depth'); ylim([-maxz 0]);
  end
  % acc_plot
ax3 = subplot(2,2,3);
  if sctrplt == 1
    nobstmp=size(Q3tmp(I3),1);
      spmsz = spmsz_cst; if spmsz<=0 spmsz=max(2,20-nobstmp/1000); end
    scatter_custom(x2d1(I3),y2d1(I3), spmsz, Q3(I3),'filled');
  elseif sctrplt == 0
    imagescnan(x,y1,Q3','nancolor',[.6 .6 .6]); axis xy   
  elseif sctrplt == -1
    nobstmp=size(Q3tmp(I3),1);
    if ( (length(x)>1) & (length(y1)>1) & (nobstmp>(length(x)*length(y1)/2)) )
      imagescnan(x,y1,Q3','nancolor',[1 1 1]); axis xy
    else
      spmsz = spmsz_cst; if spmsz<=0 spmsz=max(2,20-nobstmp/1000); end
      scatter_custom(x2d1(I3),y2d1(I3), spmsz, Q3tmp(I3),'filled');
    end
  end
     hold on
     if iip==1 | iip==4
       contour(XC,YC,Depth',[0 1],'k','linewidth',2)
     end
  if customaxis
   caxis([cv(1) cv(end)]*cvscl);
  else
   axsave3 = caxis;
    if iip<4
     caxis([0 max(abs([Q3tmp; Q4tmp]))]);
    else
     caxis([-max(abs([Q1tmp; Q3tmp])) max(abs([Q1tmp; Q3tmp]))]);
    end
  end
  if iip<4
    colormap(ax3,gradcolormap);%
  else
    colormap(ax3,divcolormap);%
  end
  hc=colorbar;%
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  xlabel([xlbl]);      ylabel([ylbl1])
  if ydts1
    set(gca,'ytick',linspace(min(tb),max(tb),5))
    datetick('y',12,'keeplimits','keepticks')
  end
%AV    title([label ' ' obstypestr ' ' t2str ' misfit '],'Interpreter','none');
  %title([label ' ' obstypestr ' ' t2str],'Interpreter','none');
  title([t2str],'Interpreter','none');
  axis tight; grid on; box on
  if strcmp(xlbl,'latitude'); xlim([min(yb) max(yb)]);
  elseif strcmp(xlbl,'depth'); xlim([-maxz 0]);end
  if strcmp(ylbl1,'longitude'); ylim([min(xb) max(xb)]);
  elseif strcmp(ylbl1,'depth'); ylim([-maxz 0]);
  end
  % acc_plot
ax4 = subplot(2,2,4);
  if sctrplt == 1
    nobstmp=size(Q4tmp(I4),1);
      spmsz = spmsz_cst; if spmsz<=0 spmsz=max(2,20-nobstmp/1000); end
    scatter_custom(x2d2(I4),y2d2(I4), spmsz, Q4(I4),'filled');
  elseif sctrplt == 0
    imagescnan(x,y2,Q4','nancolor',[.6 .6 .6]); axis xy
  elseif sctrplt == -1 
    nobstmp=size(Q4tmp(I4),1);
    if ( (length(x)>1) & (length(y2)>1) & (nobstmp>(length(x)*length(y2)/2)) )
      imagescnan(x,y2,Q4','nancolor',[1 1 1]); axis xy
    else
      spmsz = spmsz_cst; if spmsz<=0 spmsz=max(2,20-nobstmp/1000); end
      scatter_custom(x2d2(I4),y2d2(I4), spmsz, Q4tmp(I4),'filled');
    end
  end
  if customaxis
   caxis([cv(1) cv(end)]*cvscl);
  else
   axsave4 = caxis; 
    if iip<4
     caxis([0 max(abs([Q3tmp; Q4tmp]))]);
    else
     caxis([-max(abs([Q2tmp; Q4tmp])) max(abs([Q2tmp; Q4tmp]))]);
    end
  end
  if iip<4
    colormap(ax4,gradcolormap);%
  else
    colormap(ax4,divcolormap);%
  end
  hc=colorbar;%
  set(gca,'fontname','Ubuntu','fontsize',ifont,'fontweight','b')
  xlabel([xlbl]);      ylabel([ylbl2])
  if ydts2
    set(gca,'ytick',linspace(min(tb),max(tb),5))
    datetick('y',12,'keeplimits','keepticks')
  end 
  axis tight; grid on; box on
  if strcmp(xlbl,'depth'); xlim([-maxz 0]);
  elseif strcmp(ylbl2,'depth'); ylim([-maxz 0]);
  end
  % acc_plot
if (iprint >= 1)
    set(gcf,'Paperposition',[.5 .5 16 9])
    plt_fn = [ figure_out 'prof' short_label '_' obstypestr psvnm plottypestr  '.' plt_ext];
    print(['-d' plt_typ],['-opengl'],plt_fn)
    %disp(['plot file = ' plt_fn])
end
end %MADE A PLOT
end % iip
end
end % ic %num obs

%CLOSE OUTPUT
     fclose(fidm);
%return

end % if length(prof_YYYYMMDD)>0


status = 1;


