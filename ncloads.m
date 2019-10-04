function ncloads(theNetCDFFile, varargin)
% ncloads('theNetCDFFile', 'var1', 'var2', ...): if narg > 1, loads only arguments 
% listed.  Otherwise loads all variables in theNetCDFFile.
% 2016-04-20  modified form Ian Eisenman's ncload2.m
%      - added error messages
%      - changed assignin from 'base' to 'caller' so variable would be in the caller workspace.
%
% ncload2('theNetCDFFile', 'var1', 'var2', ...): load variables from
% 'theNetCDFFile' into the Matlab workspace. Functionality is based on
% "ncload" from the old NetCDF Toolbox, but this script uses the native
% Matlab netCDF functions introduced in version R2010b. Note that
% missing_value and _FillValue are replaced by NaN, and data is multiplied
% by scale_factor if present.
%
% Example:
%   ncloads('file.nc','lat','temp')		# loads only variables listed
%   ncloads('file.nc')				# loads all variables
%
% Ian Eisenman, 2011

if nargin<1
    disp('Example: ncloads(''file.nc'',''lat'',''temp'')')
    return
end

f = netcdf.open(theNetCDFFile,'NC_NOWRITE');
if isempty(f)
    display(['ERROR:  Can not open the file ',theNetCDFFile]); 
    return;
end

if isempty(varargin) % variables not specified in input: get all variables
    varIDs=netcdf.inqVarIDs(f);
    vars=cell(size(varIDs));
    for i=1:length(vars)
        vars{i}=netcdf.inqVar(f,varIDs(i));
    end
else % variables specified in input
    vars=varargin;
end

for i = 1:length(vars)
    
    varid = netcdf.inqVarID(f,vars{i});
    var0 = netcdf.getVar(f, varid);
    
    % replace missing_value and _FillValue with NAN; multiply by scale_factor
    [~,~,~,NumAtts] = netcdf.inqVar(f,varid);
    offset=0;
    for numA=1:NumAtts
        attName = netcdf.inqAttName(f,varid,numA-1);
        switch lower(attName)
            case {'fillvalue_','_fillvalue','missing_value','missingvalue'}
                mv = netcdf.getAtt(f,varid,attName); var0(var0==mv)=nan;
            case {'scale_factor','scalefactor'}
                sf = netcdf.getAtt(f,varid,attName); var0=double(var0)*double(sf);
            case {'add_offset'}
                offset=double(netcdf.getAtt(f,varid,attName));
            otherwise
                % do nothing
        end
    end
    var0=var0+offset;
    
    % convert data type to double
    if ~strcmp(class(var0),'double')
        var0=double(var0);
    end
    
    var0=permute(var0,length(size(var0)):-1:1);
    % above makes 1-dim variables 1 x dim; make them dim x 1
    if size(var0,1)==1 && size(var0,2)>1, var0=var0'; end
    
    %assignin('base',vars{i},var0)
    assignin('caller',vars{i},var0)
    
end

netcdf.close(f);
