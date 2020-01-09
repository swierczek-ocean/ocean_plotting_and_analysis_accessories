% This is an updated matlab code to load SOCAT V3-V2019 netcdf files into matlab.
% There are several gridded files available (decadal, monthly, etc.), so
% this code willl ask the user in a first step to select the desired 
% file and in a second step to pick the variables desired for the file chosen. 
% This code is based on read_SOCAT from Denis Pierrot (denis.pierrot@noaa.gov
% and has been adjusted to read gridded files 
% by Peter Landschutzer 2013-06-16 (peter.landschuetzer@usys.ethz.ch)

clear all
%--------------------------------------------------------------------------
% Step 1: find all gridded .nc files in the folder
%--------------------------------------------------------------------------

D = dir('*_gridded_*.nc');

%--------------------------------------------------------------------------
% Step 2: user selects the file desired
%--------------------------------------------------------------------------

    for tt=1:length(D) % CHECK FOR ALL FILES IN THE SAME FOLDER
    hdrs{tt}=D(tt,1).name; % Store the filenames
    end
    % open window to select the desired file to load
    [scrsz]=get(0,'ScreenSize');   ht=150;wd=600;
    fig = figure('position', [(scrsz(3)-wd)/2 (scrsz(4)-ht)/2 wd ht]);
    set(gcf,'color',[0.95 0.95 0.95]);
    uicontrol ('Style','text','position', [150 120 200 20],'String','Select file to read');
    %set(gcf,'color','w');
    uicontrol ('Style','text','position', [20 100 500 20],'String','(Warning: Coastal arrays are large and will use a lot of memory to be imported)');
    % check all filenames in the folder and display them as list objects in
    % the dropdown menu of the window
    if length(D)>=1
        for i=1:length(D) 
            if i==1
                strings=hdrs{i};
            else
                strings=[strings '|' hdrs{i}];
            end
        end
    else
        strings='no netCDF file available. Please press OK and read Command Window text in MATLAB'; % if there is no netCDF file
    end
    c = uicontrol ('Style','popupmenu','position', [20 40 500 50],'String',strings);

    % create OK and Cancel button
    okb=uicontrol ('Style','togglebutton','position', [(wd-50) 20 30 20],'String','OK','Callback','uiresume(gcbf)');
    ccb=uicontrol ('Style','togglebutton','position', [(wd-100) 20 40 20],'String','Cancel','Callback','close all');
    uiwait(fig);
    set(fig,'visible','off');
    
    % check which file has been selected and use its name for further steps
    if length(D)>=1
    bv=get(c,'Value');
    file_2_use = D(bv,1).name;

%--------------------------------------------------------------------------
% Step 3: load the data from desired file
%--------------------------------------------------------------------------

    % check the content of the file (names, units, attributes, etc.)
    file=ncinfo(file_2_use);
    
    dflt=[3,4]; % default ticks
    % get the varible names from the file to be displayed in window
    for tt=1:length(file.Variables)
    hdrs{tt}=file.Variables(1,tt).Name;
    end
    % open 2nd window with all variables from the file. User can chose as
    % many as desired to load
    [scrsz]=get(0,'ScreenSize');   ht=500;wd=600;
    fig = figure('position', [(scrsz(3)-wd)/2 (scrsz(4)-ht)/2 wd ht]);cols=[50 300];spc=50;ctrln=8;
    set(gcf,'color',[0.95 0.95 0.95]);
    uicontrol ('Style','text','position', [(wd-200)/2 ht-30 200 20],'String','Select Variables to Import');
    % display variables with check boxes
    for i=1:length(file.Variables)    
    c(i) = uicontrol ('Style','checkbox','position', [cols((i>ctrln)+1) ht-50-spc*i+(ctrln*spc*(i>ctrln)) 50+length(char(hdrs{i}))*10 50],'String',hdrs{i});
    set(c(i),'Value',ismember(i,dflt));
    end
    % create OK and Cancel button
    okb=uicontrol ('Style','togglebutton','position', [(wd-50) 20 30 20],'String','OK','Callback','uiresume(gcbf)');
    ccb=uicontrol ('Style','togglebutton','position', [(wd-100) 20 40 20],'String','Cancel','Callback','close all');
    uiwait(fig);
    set(fig,'visible','off');
    
%--------------------------------------------------------------------------
% Step 4: load the checked data and assign the correct name to it
%--------------------------------------------------------------------------

    disp('All DONE! Array(s)')% are in your workspace');

    for i=1:length(file.Variables),bv(i)=get(c(i),'Value');
    
        if bv(i)==1
        data_in = ncread(file_2_use,file.Variables(1,i).Name);
        eval([char(file.Variables(1,i).Name) '=data_in;']);
        disp(['"' char(file.Variables(1,i).Name) '"']);
        end
    end
        if sum(bv)>0
            disp(['from "' file_2_use '"']);
            disp('imported into your workspace'); 
        else
            disp('are NOT imported in your workspace') 
            disp('=> no array was selected')
            disp('Please run again and select variable(s) to import')
        end
    else
        disp('There are no gridded SOCAT netCDF files in your current folder.')
        disp('Please follow the steps below:')
        disp('1) Download a gridded netCDF file from socat.info => Data Download')
        disp('   => Gridded files from CDIAC SOCAT V3.')  
        disp('2) Download 1 or more netCDF file(s) into the same folder as this file and run again.')
        disp('3) Select the file in the first window then press OK.')
        disp('4) Select the variable(s) you want to import in the second window and press OK.')
    end
    
    clear D data_in c bv i tt file file_name okb ccb cols ctrln dflt fig
    clear file_2_use ht scrsz spc wd hdrs strings
    
   %--------------------------------------------------------------------------
% code example to plot a variable (plotv) on a map
% to run code, highlight lines in between the "if" statement 
% and press F9
% It will create one 2-D plot and one 3-D plot
%--------------------------------------------------------------------------
runcode=0;
if runcode==1
    close all;dotsize=3;
    
%replace "fco2_ave_weighted_decade" by variable name to be plotted.--------
% VARIABLE HAS TO BE 2D. 
%Here, the last index represents the decade. User can change that too.
    plotv=fco2_ave_weighted_decade(:,:,1)';  
%--------------------------------------------------------------------------

    [xx,yy] = meshgrid(xlon,ylat);
    mx=max(max(plotv));mnx=min(min(plotv));    plotvc=plotv/mx;
    figure
    s=pcolor(xx,yy,plotv);
    s.EdgeColor='none';
    caxis([mnx mx]);
    %Color Bar
    colormap jet; hcb=colorbar; set(hcb,'location','eastoutside','yaxislocation','right');
    hold (gca,'on');
    load coast;
    plot(long,lat,'Parent',gca, 'Marker','none', 'MarkerSize',dotsize, 'MarkerEdgeColor','b', 'MarkerFaceColor','none','LineStyle','-');

    
    figure
    mesh(plotv);
    hold (gca,'on');

    long=long+180;lat=lat+90;
    map_height=mean(plotv(~isnan(plotv))); % average of plotted data 
    plot3(long,lat,zeros(size(long,1),1)+map_height,'Parent',gca, 'Marker','none', 'MarkerSize',dotsize, 'MarkerEdgeColor','b', 'MarkerFaceColor','none','LineStyle','-');
    colormap jet; hcb=colorbar; set(hcb,'location','eastoutside','yaxislocation','right');

    clear plotv xx yy mx mnx plotvc s hcb  map_height long lat dotsize ;
end

 
    