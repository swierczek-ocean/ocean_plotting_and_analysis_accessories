function make_mitgcm_profiles_bgc(raw_data)

% input: structured array


% !! no weight assigned to FE
% !! no weight assigned to CHL
% !! no weight assigned to TOC


display([' writing ' raw_data(1).filename '.nc'])


% vertical levels
z_std = raw_data(1).depth;


% missing values
% changing this so missing aren't converted to NaNs
fillval = double(-99999999);


% path
dirOut='./';


% check if netcdf file exists
fileOut = [dirOut raw_data(1).filename '.nc'];
if exist(fileOut, 'file')
    % ask user if overwrite
    reply = input([raw_data(1).filename '.nc file exists; overwrite? Y/N [N]: '], 's');
    if isempty(reply)
        reply = 'N';
    end
    if reply=='N', return, end
else
    reply='N';
end


% initialize "master" variable
MITprof_buffer = struct;



nprofiles = length(raw_data);



% extract and process individual profiles
% loop through profiles

np2=0;

for np=1:nprofiles;
        
    % read 1 profile:
    profileCur = raw_data(np);
    
    % model wants values, but will not be used
    profileCur.point=0;
    profileCur.basin=0;
    if isfield(profileCur,'t'); profileCur.t_ERR = 0*profileCur.t; end % profileCur.t_equi=0; end
    if isfield(profileCur,'s'); profileCur.s_ERR = 0*profileCur.t; end % profileCur.s_equi=0; end
    
    % check lat/lon ranges:
    if profileCur.lat<-90 || profileCur.lat>90; disp('bad latitude'); return, end
    if profileCur.lon<-180 || profileCur.lon>360; disp('bad longitude'); return, end
    
    % fix lon range if necessary:
    if profileCur.lon<0; profileCur.lon=profileCur.lon+360; end;    
    
    % carry basic tests:
    % test for "absurd" temperature values :
    if isfield(profileCur,'t')
        profileCur.t_test=zeros(size(profileCur.t));
        profileCur.t_test(( (profileCur.t>40)&(profileCur.t~=fillval) ))=2;
        profileCur.t_test(( (profileCur.t<0 )&(profileCur.t~=fillval) ))=2;
    end
    % test for "absurd" salinity values :
    if isfield(profileCur,'s')
        profileCur.s_test=zeros(size(profileCur.s));
        profileCur.s_test(( (profileCur.s>42)&(profileCur.s~=fillval) ))=2;
        profileCur.s_test(( (profileCur.s<25)&(profileCur.s~=fillval) ))=2;
    end

        
    % check that the profile is not empty
    isnotempty = 0;
    if isfield(profileCur,'t'); if ~isnan(nanmean(profileCur.t)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'s'); if ~isnan(nanmean(profileCur.s)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'dic'); if ~isnan(nanmean(profileCur.dic)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'alk'); if ~isnan(nanmean(profileCur.alk)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'po4'); if ~isnan(nanmean(profileCur.po4)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'no3'); if ~isnan(nanmean(profileCur.no3)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'o2'); if ~isnan(nanmean(profileCur.o2)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'fe'); if ~isnan(nanmean(profileCur.fe)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'pco2'); if ~isnan(nanmean(profileCur.pco2)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'ph'); if ~isnan(nanmean(profileCur.ph)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'chla'); if ~isnan(nanmean(profileCur.chla)); isnotempty=isnotempty+1; end; end
    if isfield(profileCur,'toc'); if ~isnan(nanmean(profileCur.toc)); isnotempty=isnotempty+1; end; end

    
    % store profile data
    if isnotempty>0
        
        np2=np2+1;
        
        MITprof_buffer.prof_YYYYMMDD(np2)=profileCur.ymd;
        MITprof_buffer.prof_HHMMSS(np2)=profileCur.hms;
    	MITprof_buffer.prof_date(np2)=datenum(num2str(MITprof_buffer.prof_YYYYMMDD(np2)*...
            1e6+MITprof_buffer.prof_HHMMSS(np2)),'yyyymmddHHMMSS');
        MITprof_buffer.prof_lon(np2)=profileCur.lon;
        MITprof_buffer.prof_lat(np2)=profileCur.lat;
        MITprof_buffer.prof_point(np2)=profileCur.point;
        MITprof_buffer.prof_basin(np2)=profileCur.basin;
        
        % descr: 30 characters
        prof_descr=profileCur.descr{1};
        nb_char = 30;
        if size(prof_descr,2)<nb_char,
            prof_descr(:,size(prof_descr,2)+1:nb_char)=' ';
        elseif size(prof_descr,2)>nb_char
            disp('some profile descriptive strings have been shortened');
            prof_descr=prof_descr(:,1:nb_char);
        end
        MITprof_buffer.prof_descr(np2,:) = prof_descr;
        
        if isfield(profileCur,'t')
            MITprof_buffer.prof_T(np2,:)=profileCur.t;
            MITprof_buffer.prof_Tflag(np2,:)=profileCur.t_test;
            MITprof_buffer.prof_Tweight(np2,:)=profileCur.t_w;
            % not using
            MITprof_buffer.prof_Terr(np2,:)=0*profileCur.t;
            MITprof_buffer.prof_Testim(np2,:)=0*profileCur.t;
        end
        if isfield(profileCur,'s')
            MITprof_buffer.prof_S(np2,:)=profileCur.s;
            MITprof_buffer.prof_Sflag(np2,:)=profileCur.s_test;
            MITprof_buffer.prof_Sweight(np2,:)=profileCur.s_w;
            % not using
            MITprof_buffer.prof_Serr(np2,:)=0*profileCur.s;
            MITprof_buffer.prof_Sestim(np2,:)=0*profileCur.s;
        end;
        if isfield(profileCur,'dic')
            MITprof_buffer.prof_DIC(np2,:)=profileCur.dic;
            MITprof_buffer.prof_DICweight(np2,:)=profileCur.dic_w;
        end
        if isfield(profileCur,'alk')
            MITprof_buffer.prof_ALK(np2,:)=profileCur.alk;
            MITprof_buffer.prof_ALKweight(np2,:)=profileCur.alk_w;
        end
        if isfield(profileCur,'po4')
            MITprof_buffer.prof_PO4(np2,:)=profileCur.po4;
            MITprof_buffer.prof_PO4weight(np2,:)=profileCur.po4_w;
        end
        if isfield(profileCur,'no3')
            MITprof_buffer.prof_NO3(np2,:)=profileCur.no3;
            MITprof_buffer.prof_NO3weight(np2,:)=profileCur.no3_w;
        end
        if isfield(profileCur,'o2')
            MITprof_buffer.prof_O2(np2,:)=profileCur.o2;
            MITprof_buffer.prof_O2weight(np2,:)=profileCur.o2_w;
        end
        if isfield(profileCur,'fe')
            MITprof_buffer.prof_FE(np2,:)=profileCur.fe;
            MITprof_buffer.prof_FEweight(np2,:)=profileCur.fe_w;
        end
        if isfield(profileCur,'pco2')
            MITprof_buffer.prof_PCO(np2,:)=profileCur.pco2;
            MITprof_buffer.prof_PCOweight(np2,:)=profileCur.pco2_w;
        end
        if isfield(profileCur,'ph')
            MITprof_buffer.prof_PH(np2,:)=profileCur.ph;
            MITprof_buffer.prof_PHweight(np2,:)=profileCur.ph_w;
        end
        if isfield(profileCur,'chla')
            MITprof_buffer.prof_CHL(np2,:)=profileCur.chla;
            MITprof_buffer.prof_CHLweight(np2,:)=profileCur.chla_w;
        end
        if isfield(profileCur,'toc')
            MITprof_buffer.prof_ptr(np2,:)=profileCur.toc;
            MITprof_buffer.prof_ptrweight(np2,:)=profileCur.toc_w;
        end
        
    end
    
end


% TEMP FIX
MITprof_buffer.np = np2;

% standard depths
MITprof_buffer.prof_depth = profileCur.depth;


% check that there is at least one profile
if isempty(MITprof_buffer.prof_lon), return, end




% make list of fields to write in netcdf file
list1=fieldnames(MITprof_buffer); list_vars={};
I=strfind(list1,'prof_');
for kk=1:length(I),
    if I{kk}==1
        list_vars{end+1}=list1{kk};
    end
end
list_vars=sort(list_vars);




%==========masters table of variables, units, names and dimensions=============%

mt_v={'prof_depth'}; mt_u={'me'}; mt_n={'depth'}; mt_d={'iDEPTH'};
mt_v=[mt_v 'prof_date']; mt_u=[mt_u ' ']; mt_n=[mt_n 'Julian day since Jan-1-0000']; mt_d=[mt_d 'iPROF'];
mt_v=[mt_v 'prof_YYYYMMDD']; mt_u=[mt_u ' ']; mt_n=[mt_n 'year (4 digits), month (2 digits), day (2 digits)']; mt_d=[mt_d 'iPROF'];
mt_v=[mt_v 'prof_HHMMSS']; mt_u=[mt_u ' ']; mt_n=[mt_n 'hour (2 digits), minute (2 digits), second (2 digits)']; mt_d=[mt_d 'iPROF'];
mt_v=[mt_v 'prof_lon']; mt_u=[mt_u ' ']; mt_n=[mt_n 'Longitude (degree East)']; mt_d=[mt_d 'iPROF'];
mt_v=[mt_v 'prof_lat']; mt_u=[mt_u ' ']; mt_n=[mt_n 'Latitude (degree North)']; mt_d=[mt_d 'iPROF'];
mt_v=[mt_v 'prof_basin']; mt_u=[mt_u ' ']; mt_n=[mt_n 'ocean basin index (ecco 4g)']; mt_d=[mt_d 'iPROF'];
mt_v=[mt_v 'prof_point']; mt_u=[mt_u ' ']; mt_n=[mt_n 'grid point index (ecco 4g)']; mt_d=[mt_d 'iPROF'];
%
mt_v=[mt_v 'prof_T']; mt_u=[mt_u 'degree C']; mt_n=[mt_n 'potential temperature']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Tweight']; mt_u=[mt_u '(degree C)^-2']; mt_n=[mt_n 'pot. temp. least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Testim']; mt_u=[mt_u 'degree C']; mt_n=[mt_n 'pot. temp. estimate (e.g. from atlas)']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Terr']; mt_u=[mt_u 'degree C']; mt_n=[mt_n 'pot. temp. instrumental error']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Tflag']; mt_u=[mt_u ' ']; mt_n=[mt_n 'flag = i > 0 means test i rejected data.']; mt_d=[mt_d 'iPROF,iDEPTH'];
%
mt_v=[mt_v 'prof_S']; mt_u=[mt_u 'psu']; mt_n=[mt_n 'salinity']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Sweight']; mt_u=[mt_u '(psu)^-2']; mt_n=[mt_n 'salinity least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Sestim']; mt_u=[mt_u 'psu']; mt_n=[mt_n 'salinity estimate (e.g. from atlas)']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Serr']; mt_u=[mt_u 'psu']; mt_n=[mt_n 'salinity instrumental error']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Sflag']; mt_u=[mt_u ' ']; mt_n=[mt_n 'flag = i > 0 means test i rejected data.']; mt_d=[mt_d 'iPROF,iDEPTH'];
%
mt_v=[mt_v 'prof_U']; mt_u=[mt_u 'm/s']; mt_n=[mt_n 'eastward velocity comp.']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Uweight']; mt_u=[mt_u '(m/s)^-2']; mt_n=[mt_n 'east. v. least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_V']; mt_u=[mt_u 'm/s']; mt_n=[mt_n 'northward velocity comp.']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_Vweight']; mt_u=[mt_u '(m/s)^-2']; mt_n=[mt_n 'north. v. least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
%
mt_v=[mt_v 'prof_DIC']; mt_u=[mt_u 'mol/m3']; mt_n=[mt_n 'dissolved inorganic carbon']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_DICweight']; mt_u=[mt_u '(mol/m3)^-2']; mt_n=[mt_n 'dic least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_ALK']; mt_u=[mt_u 'mol/m3']; mt_n=[mt_n 'alkalinity']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_ALKweight']; mt_u=[mt_u '(mol/m3)^-2']; mt_n=[mt_n 'alk least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_PO4']; mt_u=[mt_u 'mol/m3']; mt_n=[mt_n 'phosphate']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_PO4weight']; mt_u=[mt_u '(mol/m3)^-2']; mt_n=[mt_n 'po4 least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_NO3']; mt_u=[mt_u 'mol/m3']; mt_n=[mt_n 'nitrate']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_NO3weight']; mt_u=[mt_u '(mol/m3)^-2']; mt_n=[mt_n 'no3 least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_O2']; mt_u=[mt_u 'mol/m3']; mt_n=[mt_n 'oxygen']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_O2weight']; mt_u=[mt_u '(mol/m3)^-2']; mt_n=[mt_n 'oxygen least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_FE']; mt_u=[mt_u 'mol/m3']; mt_n=[mt_n 'iron']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_FEweight']; mt_u=[mt_u '(mol/m3)^-2']; mt_n=[mt_n 'iron least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_PCO']; mt_u=[mt_u '?']; mt_n=[mt_n 'ocean pco2']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_PCOweight']; mt_u=[mt_u '(?)^-2']; mt_n=[mt_n 'pco2 least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_PH']; mt_u=[mt_u '?']; mt_n=[mt_n 'ocean pH']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_PHweight']; mt_u=[mt_u '(?)^-2']; mt_n=[mt_n 'pH least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_CHL']; mt_u=[mt_u '?']; mt_n=[mt_n 'chlorophyll-a']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_CHLweight']; mt_u=[mt_u '(?)^-2']; mt_n=[mt_n 'chla least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_ptr']; mt_u=[mt_u '?']; mt_n=[mt_n 'tracer no. 7 (TOC)']; mt_d=[mt_d 'iPROF,iDEPTH'];
mt_v=[mt_v 'prof_ptrweight']; mt_u=[mt_u '(?)^-2']; mt_n=[mt_n 'toc least-square weight']; mt_d=[mt_d 'iPROF,iDEPTH'];



% create netcdf
if reply=='Y'
    ncid = netcdf.create(fileOut,'NC_CLOBBER');
else
    ncid = netcdf.create(fileOut,'NC_NOCLOBBER');
end

aa=sprintf(['Format: MITprof netcdf. This file was created using \n' ...
    'the matlab toolbox which can be obtained (see README) from \n'...
    'http://mitgcm.org/viewvc/MITgcm/MITgcm_contrib/gael/profilesMatlabProcessing/']);
netcdf.putAtt(ncid,-1,'description',aa);
netcdf.putAtt(ncid,-1,'date',date);



% define dimensions
profdim_id = netcdf.defDim(ncid,'iPROF',length(MITprof_buffer.prof_lon));
depthdim_id = netcdf.defDim(ncid,'iDEPTH',length(MITprof_buffer.prof_depth));
txtdim_id = netcdf.defDim(ncid,'lTXT',nb_char);



% define variables
for ii=1:length(list_vars);
    jj=find(strcmp(mt_v,list_vars{ii}));
    if ~isempty(jj);
        if strcmp(mt_d{jj},'iPROF,iDEPTH')
            % ncdefVar(ncid,mt_v{jj},'double',{'iDEPTH','iPROF'}); % note the direction flip
            netcdf.defVar(ncid,mt_v{jj},'double',[depthdim_id profdim_id]); % note the direction flip
        elseif strcmp(mt_d{jj},'iPROF')
            % netcdf.defVar(ncid,mt_v{jj},'double',[depthdim_id profdim_id]);
            netcdf.defVar(ncid,mt_v{jj},'double',profdim_id);
        elseif strcmp(mt_d{jj},'iDEPTH')
            netcdf.defVar(ncid,mt_v{jj},'double',depthdim_id);
        else
            display('PROBLEM WITH DIMENSIONS')
        end
        %ncputAtt(ncid,mt_v{jj},'long_name',mt_n{jj});
        %ncputAtt(ncid,mt_v{jj},'units',mt_u{jj});
        %ncputAtt(ncid,mt_v{jj},'missing_value',fillval);
        %ncputAtt(ncid,mt_v{jj},'_FillValue',fillval);

        varid=netcdf.inqVarID(ncid,mt_v{jj});
        netcdf.putAtt(ncid,varid,'long_name',mt_n{jj});
        netcdf.putAtt(ncid,varid,'units',mt_u{jj});
        netcdf.putAtt(ncid,varid,'missing_value',fillval);
        netcdf.putAtt(ncid,varid,'_FillValue',fillval);

    else
        if strcmp(list_vars{ii},'prof_descr')
            netcdf.defVar(ncid,'prof_descr','char',[txtdim_id profdim_id]);
            %ncputAtt(ncid,'prof_descr','long_name','profile description');
            varid=netcdf.inqVarID(ncid,'prof_descr');
            netcdf.putAtt(ncid,varid,'long_name','profile description');
        else
            display([list_vars{ii} ' not included -- it is not a MITprof variable'])
        end
    end
end

% leave define mode and enter data mode
netcdf.endDef(ncid);

% write data
for ii=1:length(list_vars);
    ii
    varname=list_vars{ii}
    data=getfield(MITprof_buffer,varname);
    size(data)
    if isnumeric(data)
        data(isnan(data))=fillval;
    end
    
    % ncputvar(ncid,varname,data);
    % get variable id
    vv = netcdf.inqVarID(ncid,varname);
    %flip order of dimensions:
    bb=length(size(data)); data=permute(data,(bb:-1:1));
    % write to file
    netcdf.putVar(ncid,vv,data);
    
end

% ncputvar(ncid,'prof_depth',MITprof_buffer.prof_depth);
% get variable id
vv = netcdf.inqVarID(ncid,'prof_depth');
%flip order of dimensions:
bb=length(size(MITprof_buffer.prof_depth));
MITprof_buffer.prof_depth=permute(MITprof_buffer.prof_depth,(bb:-1:1));
% write to file
netcdf.putVar(ncid,vv,MITprof_buffer.prof_depth);


netcdf.close(ncid);

