% create metrics plots for B-SOSE validation
%
% scripts called:
%   MITprof_gcm2nc.m
%   metrics_profiles_sose_lvls.m
%   metrics_profiles_sose_norm.m 
%   metrics_gridded2D_sose.m 
%   metrics_gridded3D_levels_sose.m 
%   metrics_gridded3D_slice_sose.m 
%


%cd /home/stan.swierczek/PROFILES/

whichgrid = '6';
% -------------------------------------------------------
%whichgrid = '32';
%whichgrid = '34';
%whichgrid = '62';
%whichgrid = '64';
%whichgrid = '122';
%whichgrid = '124';

recompose_profiles = 0;
plot_profiles = 1;
plot_gridded_2d = 0;
plot_gridded_3d = 0;

% -------------------------------------------------------

addpath /home/stan.swierczek/PROFILES/valid_matlab_needs
addpath /home/stan.swierczek/PROFILES/matlab_profile_scripts

% where the profile files are located
% prof_data = '/home/stan.swierczek/PROFILES/BSOSE122/PROF/';
prof_data = '/data/validation/SOSE_web/soccom/metrics/profiles/';
dir_model_output = '/data/validation/SOSE_web/soccom/metrics/OUTPUT007/PROF/';
dir_model_prof_output = '/data/SO6/runs/ITERATION007/PROF/';
post_process_out = '/home/stan.swierczek/PROFILES/BSOSE122/';

figure_dir = [post_process_out 'figures/'];
if ~exist(figure_dir, 'dir')
 mkdir(post_process_out,'figures/')
end

% current working directory 
current_path = pwd;


% -------------------------------------------------------
% profiles

if plot_profiles || recompose_profiles

 % find profiles files to process
 files_list = dir([prof_data '*.nc'])

 % loop over files
 for f_cur = 1:size(files_list,1)
  [~,fileCur,~] = fileparts(files_list(f_cur).name) 
  list_model(f_cur) = {[ fileCur ]}
  label_list(f_cur) = {[ fileCur ] }
 end

 dir_model_output_netcdf = [ post_process_out 'PROF/' ]
 if ~exist(dir_model_output_netcdf, 'dir')
  mkdir(post_process_out,'PROF')
 end

end % if plot_profiles


if recompose_profiles
 % print all of inputs
 prof_data
 dir_model_prof_output
 dir_model_output_netcdf
 list_model
 MITprof_gcm2nc(prof_data,dir_model_prof_output,dir_model_output_netcdf,list_model);

end % if recompose_profiles || recompose_profiles
 

if plot_profiles

 display('------ PROFILES ------')

 % where figures are saved
 figure_profile_dir=[figure_dir 'profiles/'];
 if ~exist(figure_profile_dir, 'dir')
  mkdir(figure_dir,'profiles');
 end

% label_list = {'GLO_SO_0000_v2','SOC_SO_0000_v5','HDO_SO_2013_CTD','MEO_SO_2013_MEO_D','NODC_SO_2013_MRB','SIO_SO_2013_XBT','USGO_SO_2013_PFL_D','UWO2_SO_2013_FO2','VIZ_SO_2014_PFL'}; 
% label_list = {'GLODAPv2','SOCATv5_pCO2_RegWeight','USGO_SO_2013_PFL_D','UWO2_SO_2013_FO2','VIZ_SO_2014_PFL','HDO_SO_2013_CTD','MEO_SO_2013_MEO_D','NODC_SO_2013_MRB','SIO_SO_2013_XBT','GLODAPv2climyr2013'}
%NEED TO MAKE GLODAP WORK
%label_list = {'GLODAPv2climyr2013'}
% label_list = {'SOCATv4_pCO2_model','USGO_SO_2008_PFL_D','UWO2_SO_2008_FO2','VIZ_SO_2008_PFL','HDO_SO_2008_CTD','MEO_SO_2008_MEO_D','NODC_SO_2008_MRB','SIO_SO_2008_XBT','GLODAPv2climyr2008'}
% label_list = {'SOCATv4_pCO2'}
 label_list = {'VIZ_SO_2017_PFL','GLODAPv2climyr2016','USGO_SO_2017_PFL_D','SOCATv5_pCO2_RegWeight.nc'}
 iter = 1;
 for ff=1:length(label_list);
 
  label=label_list{ff}
  
  % check that model equivalent file exists
  tmpexst = exist([post_process_out 'PROF/' label_list{ff} '_model.nc'])
  iter = 122;
  % if it doesn't, either was not used or need to recompose; otherwise proceed:
  if tmpexst > 0
  
   % where figures are saved
   figure_out=[figure_profile_dir  label_list{ff} '/'];
   if ~exist(figure_out, 'dir')
    mkdir(figure_profile_dir,label_list{ff});
   end
   metrics_profiles_sose_lvls_bsose(label,iter,prof_data,dir_model_output_netcdf,figure_out,whichgrid);
   cd(current_path);
   
   metrics_profiles_sose_norm_bsose(label,iter,prof_data,dir_model_output_netcdf,figure_out,whichgrid);
   cd(current_path);
   
  end
 end

 close all

end % if plot_profiles



% -------------------------------------------------------
% gridded products


if plot_gridded_3d

 display('------ GRIDDED 3D ------')

 var_list={'THETA','SALT','DIC','ALK','pH','O2','NO3','PO4'};
% var_list={'SALT'};

 % plot horizontal slices
 % which depth levels used for plotting:
 k_levels=[2,20,40];
 display(k_levels)

 % plot zonal and meridional sections
 if strcmp(whichgrid,'3')
  % which longitude  
  x = 630; % 150W
  % which latitude
  y = 161; % 60S
 elseif strcmp(whichgrid(1),'6')
  % which longitude  
  x = 630*2; % 150W
  % which latitude
  y = 161*2; % 60S
 end
 display(x) 
 display(y)

 % where figures are saved
 figure_gridded3D_dir=[figure_dir 'gridded3D/'];
 if ~exist(figure_gridded3D_dir, 'dir')
  mkdir(figure_dir,'gridded3D');
 end
 
 for ff=1:length(var_list)

  % where figures are saved
  figure_out=[figure_gridded3D_dir  var_list{ff} '/'];
  if ~exist(figure_out, 'dir')
   mkdir(figure_gridded3D_dir,var_list{ff});
  end
  metrics_gridded3D_sose(var_list{ff},dir_model_output,figure_out,k_levels,x,y,whichgrid);
  cd(current_path);

 end

 close all

end % if plot_gridded_3d



if plot_gridded_2d

 display('------ GRIDDED 2D ------')

 var_list={'xx','pCO2','CO2flux','SSH','SST','ICE','CHL','POC'};
% var_list={'ICE','CHL','POC'};
 var_list={'CO2flux','pCO2','SST','ICE','CHL','POC','SSH','xx'};
% var_list={'CO2flux','pCO2','CHL','POC','SSH','xx'}
 var_list={'CO2flux','pCO2','SST','ICE','CHL','POC','xx'};
%var_list={'SSH'}

 if iter == 0; var_list(1) = []; end

 % where figures are saved
 figure_gridded2D_dir=[figure_dir 'gridded2D/'];
 if ~exist(figure_gridded2D_dir, 'dir')
  mkdir(figure_dir,'gridded2D');
 end
 
 for ff=1:length(var_list)

  % where figures are saved
  figure_out=[figure_gridded2D_dir  var_list{ff} '/'];
  if ~exist(figure_out, 'dir')
   mkdir(figure_gridded2D_dir,var_list{ff});
  end
  
  var=var_list{ff};

  metrics_gridded2D_sose(var,dir_model_output,figure_out,iter,whichgrid,yr_start);
  
  cd(current_path);
  
 end

 close all

end % if plot_gridded_2d




clear
close all
