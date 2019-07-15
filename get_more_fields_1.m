
load XY3 
load XY6 
load XY12

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);

%% 122

UVEL_Series122 = zeros(756,512,395);
VVEL_Series122 = zeros(756,512,395);
WVEL190_Series122 = zeros(756,512,395);
PCO2_Series122 = zeros(756,512,395);

HC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag/';

for ii=1:2
    char122state = [str,'diag_vel.0000000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    UVEL_Series122(:,:,ii) = temp122state(:,:,1,1);
    VVEL_Series122(:,:,ii) = temp122state(:,:,1,2);
    WVEL190_Series122(:,:,ii) = temp122state(:,:,3,3);
    clear temp122state
    char122surf = [str,'diag_surf.0000000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    PCO2_Series122(:,:,ii) = temp122surf(:,:,2); 
    clear temp122surf
end

for ii=3:27
    char122state = [str,'diag_vel.000000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    UVEL_Series122(:,:,ii) = temp122state(:,:,1,1);
    VVEL_Series122(:,:,ii) = temp122state(:,:,1,2);
    WVEL190_Series122(:,:,ii) = temp122state(:,:,3,3);
    clear temp122state
    char122surf = [str,'diag_surf.000000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    PCO2_Series122(:,:,ii) = temp122surf(:,:,2); 
    clear temp122surf
end

for ii=28:277
    char122state = [str,'diag_vel.00000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    UVEL_Series122(:,:,ii) = temp122state(:,:,1,1);
    VVEL_Series122(:,:,ii) = temp122state(:,:,1,2);
    WVEL190_Series122(:,:,ii) = temp122state(:,:,3,3);
    clear temp122state
    char122surf = [str,'diag_surf.00000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    PCO2_Series122(:,:,ii) = temp122surf(:,:,2); 
    clear temp122surf
end

for ii=278:395
    char122state = [str,'diag_vel.0000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    UVEL_Series122(:,:,ii) = temp122state(:,:,1,1);
    VVEL_Series122(:,:,ii) = temp122state(:,:,1,2);
    WVEL190_Series122(:,:,ii) = temp122state(:,:,3,3);
    clear temp122state
    char122surf = [str,'diag_surf.0000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    PCO2_Series122(:,:,ii) = temp122surf(:,:,2); 
    clear temp122surf
end



%% 62

UVEL_Series62 = zeros(384,260,395);
VVEL_Series62 = zeros(384,260,395);
WVEL190_Series62 = zeros(384,260,395);
PCO2_Series62 = zeros(384,260,395);

HC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag/';

for ii=1:1
    char62state = [str,'diag_vel.00000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    UVEL_Series62(:,:,ii) = temp62state(:,:,1,1);
    VVEL_Series62(:,:,ii) = temp62state(:,:,1,2);
    WVEL190_Series62(:,:,ii) = temp62state(:,:,3,3);
    clear temp62state
    char62surf = [str,'diag_surf.00000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    PCO2_Series62(:,:,ii) = temp62surf(:,:,2); 
    clear temp62surf
end

for ii=2:13
    char62state = [str,'diag_vel.0000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    UVEL_Series62(:,:,ii) = temp62state(:,:,1,1);
    VVEL_Series62(:,:,ii) = temp62state(:,:,1,2);
    WVEL190_Series62(:,:,ii) = temp62state(:,:,3,3);
    clear temp62state
    char62surf = [str,'diag_surf.0000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    PCO2_Series62(:,:,ii) = temp62surf(:,:,2); 
    clear temp62surf
end

for ii=14:138
    char62state = [str,'diag_vel.000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    UVEL_Series62(:,:,ii) = temp62state(:,:,1,1);
    VVEL_Series62(:,:,ii) = temp62state(:,:,1,2);
    WVEL190_Series62(:,:,ii) = temp62state(:,:,3,3);
    clear temp62state
    char62surf = [str,'diag_surf.000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    PCO2_Series62(:,:,ii) = temp62surf(:,:,2); 
    clear temp62surf
end

for ii=139:395
    char62state = [str,'diag_vel.00000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    UVEL_Series62(:,:,ii) = temp62state(:,:,1,1);
    VVEL_Series62(:,:,ii) = temp62state(:,:,1,2);
    WVEL190_Series62(:,:,ii) = temp62state(:,:,3,3);
    clear temp62state
    char62surf = [str,'diag_surf.00000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    PCO2_Series62(:,:,ii) = temp62surf(:,:,2); 
    clear temp62surf
end


%% 32

UVEL_Series32 = zeros(192,132,395);
VVEL_Series32 = zeros(192,132,395);
WVEL190_Series32 = zeros(192,132,395);
PCO2_Series32 = zeros(192,132,395);

HC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
depth32 = 1;
str = '../MITgcm/verification/SO3_20190513/diag/';

for ii=1:2
    char32state = [str,'diag_vel.00000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    UVEL_Series32(:,:,ii) = temp32state(:,:,1,1);
    VVEL_Series32(:,:,ii) = temp32state(:,:,1,2);
    WVEL190_Series32(:,:,ii) = temp32state(:,:,3,3);
    clear temp32state
    char32surf = [str,'diag_surf.00000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    PCO2_Series32(:,:,ii) = temp32surf(:,:,2); 
    clear temp32surf
end

for ii=3:20
    char32state = [str,'diag_vel.0000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    UVEL_Series32(:,:,ii) = temp32state(:,:,1,1);
    VVEL_Series32(:,:,ii) = temp32state(:,:,1,2);
    WVEL190_Series32(:,:,ii) = temp32state(:,:,3,3);
    clear temp32state
    char32surf = [str,'diag_surf.0000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    PCO2_Series32(:,:,ii) = temp32surf(:,:,2); 
    clear temp32surf
end

for ii=21:208
    char32state = [str,'diag_vel.000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    UVEL_Series32(:,:,ii) = temp32state(:,:,1,1);
    VVEL_Series32(:,:,ii) = temp32state(:,:,1,2);
    WVEL190_Series32(:,:,ii) = temp32state(:,:,3,3);
    clear temp32state
    char32surf = [str,'diag_surf.000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    PCO2_Series32(:,:,ii) = temp32surf(:,:,2); 
    clear temp32surf
end

for ii=209:395
    char32state = [str,'diag_vel.00000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    UVEL_Series32(:,:,ii) = temp32state(:,:,1,1);
    VVEL_Series32(:,:,ii) = temp32state(:,:,1,2);
    WVEL190_Series32(:,:,ii) = temp32state(:,:,3,3);
    clear temp32state
    char32surf = [str,'diag_surf.00000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    PCO2_Series32(:,:,ii) = temp32surf(:,:,2); 
    clear temp32surf
end

CURL_Series32 = zeros(size(UVEL_Series32));
CAV_Series32 = CURL_Series32;
CURL_Series62 = zeros(size(UVEL_Series62));
CAV_Series62 = CURL_Series62;
CURL_Series122 = zeros(size(UVEL_Series122));
CAV_Series122 = CURL_Series122;

[lon_met3,lat_met3] = latlon_to_meters(XC3,YC3);
[lon_met6,lat_met6] = latlon_to_meters(XC6,YC6);
[lon_met12,lat_met12] = latlon_to_meters(XC12,YC12);





for ii=1:395
    [CURL_Series32(:,:,ii),CAV_Series32(:,:,ii)] = ...
        curl(lon_met3,lat_met3,UVEL_Series32(:,:,ii),VVEL_Series32(:,:,ii));
    [CURL_Series62(:,:,ii),CAV_Series62(:,:,ii)] = ...
        curl(lon_met6,lat_met6,UVEL_Series62(:,:,ii),VVEL_Series62(:,:,ii));
    [CURL_Series122(:,:,ii),CAV_Series122(:,:,ii)] = ...
        curl(lon_met12,lat_met12,UVEL_Series122(:,:,ii),VVEL_Series122(:,:,ii));
end

for ii=1:395
    CURL_temp32 = CURL_Series32(:,:,ii);
    CURL_temp62 = CURL_Series62(:,:,ii);
    CURL_temp122 = CURL_Series122(:,:,ii);
    CAV_temp32 = CAV_Series32(:,:,ii);
    CAV_temp62 = CAV_Series62(:,:,ii);
    CAV_temp122 = CAV_Series122(:,:,ii); 
    PCO2_temp32 = PCO2_Series32(:,:,ii);
    PCO2_temp62 = PCO2_Series62(:,:,ii);
    PCO2_temp122 = PCO2_Series122(:,:,ii);
    WVEL190_temp32 = WVEL190_Series32(:,:,ii);
    WVEL190_temp62 = WVEL190_Series62(:,:,ii);
    WVEL190_temp122 = WVEL190_Series122(:,:,ii);
    
    CURL_temp32(HC3(:,:,1)==0) = 99999999999;
    CURL_temp62(HC6(:,:,1)==0) = 99999999999;
    CURL_temp122(HC12(:,:,1)==0) = 99999999999;
    CAV_temp32(HC3(:,:,1)==0) = 99999999999;
    CAV_temp62(HC6(:,:,1)==0) = 99999999999;
    CAV_temp122(HC12(:,:,1)==0) = 99999999999;
    PCO2_temp32(HC3(:,:,1)==0) = 99999999999;
    PCO2_temp62(HC6(:,:,1)==0) = 99999999999;
    PCO2_temp122(HC12(:,:,1)==0) = 99999999999;
    WVEL190_temp32(HC3(:,:,20)==0) = 99999999999;
    WVEL190_temp62(HC6(:,:,20)==0) = 99999999999;
    WVEL190_temp122(HC12(:,:,40)==0) = 99999999999;
    
    CURL_Series32(:,:,ii) = CURL_temp32;
    CURL_Series62(:,:,ii) = CURL_temp62;
    CURL_Series122(:,:,ii) = CURL_temp122;
    CAV_Series32(:,:,ii) = CAV_temp32;
    CAV_Series62(:,:,ii) = CAV_temp62;
    CAV_Series122(:,:,ii) = CAV_temp122;
    PCO2_Series32(:,:,ii) = PCO2_temp32;
    PCO2_Series62(:,:,ii) = PCO2_temp62;
    PCO2_Series122(:,:,ii) = PCO2_temp122;
    WVEL190_Series32(:,:,ii) = WVEL190_temp32;
    WVEL190_Series62(:,:,ii) = WVEL190_temp62;
    WVEL190_Series122(:,:,ii) = WVEL190_temp122;
end



clear *temp*

clearvars -except CURL* PCO2* CAV* WVEL190*

save PCO2_CURL_WVEL









