
%% 122

UVEL_Series122 = zeros(756,512,395);
VVEL_Series122 = zeros(756,512,395);
ETAN_Series122 = zeros(756,512,395);

HC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag/';

for ii=1:2
    char122state = [str,'diag_vel.0000000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    UVEL_Series122(:,:,ii) = temp122state(:,:,1,1);
    VVEL_Series122(:,:,ii) = temp122state(:,:,1,2);
    clear temp122state
    char122surf = [str,'diag_surf.0000000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,1); 
    clear temp122surf
end

for ii=3:27
    char122state = [str,'diag_vel.000000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    UVEL_Series122(:,:,ii) = temp122state(:,:,1,1);
    VVEL_Series122(:,:,ii) = temp122state(:,:,1,2);
    clear temp122state
    char122surf = [str,'diag_surf.000000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,1); 
    clear temp122surf
end

for ii=28:277
    char122state = [str,'diag_vel.00000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    UVEL_Series122(:,:,ii) = temp122state(:,:,1,1);
    VVEL_Series122(:,:,ii) = temp122state(:,:,1,2);
    clear temp122state
    char122surf = [str,'diag_surf.00000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,1); 
    clear temp122surf
end

for ii=278:395
    char122state = [str,'diag_vel.0000',num2str(360*ii)];
    temp122state = rdmds(char122state);
    UVEL_Series122(:,:,ii) = temp122state(:,:,1,1);
    VVEL_Series122(:,:,ii) = temp122state(:,:,1,2);
    clear temp122state
    char122surf = [str,'diag_surf.0000',num2str(360*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,1); 
    clear temp122surf
end



%% 62

UVEL_Series62 = zeros(384,260,395);
VVEL_Series62 = zeros(384,260,395);
ETAN_Series62 = zeros(384,260,395);

HC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag/';

for ii=1:1
    char62state = [str,'diag_vel.00000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    UVEL_Series62(:,:,ii) = temp62state(:,:,1,1);
    VVEL_Series62(:,:,ii) = temp62state(:,:,1,2);
    clear temp62state
    char62surf = [str,'diag_surf.00000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,1); 
    clear temp62surf
end

for ii=2:13
    char62state = [str,'diag_vel.0000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    UVEL_Series62(:,:,ii) = temp62state(:,:,1,1);
    VVEL_Series62(:,:,ii) = temp62state(:,:,1,2);
    clear temp62state
    char62surf = [str,'diag_surf.0000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,1); 
    clear temp62surf
end

for ii=14:138
    char62state = [str,'diag_vel.000000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    UVEL_Series62(:,:,ii) = temp62state(:,:,1,1);
    VVEL_Series62(:,:,ii) = temp62state(:,:,1,2);
    clear temp62state
    char62surf = [str,'diag_surf.000000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,1); 
    clear temp62surf
end

for ii=139:395
    char62state = [str,'diag_vel.00000',num2str(72*ii)];
    temp62state = rdmds(char62state);
    UVEL_Series62(:,:,ii) = temp62state(:,:,1,1);
    VVEL_Series62(:,:,ii) = temp62state(:,:,1,2);
    clear temp62state
    char62surf = [str,'diag_surf.00000',num2str(72*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,1); 
    clear temp62surf
end


%% 32

UVEL_Series32 = zeros(192,132,395);
VVEL_Series32 = zeros(192,132,395);
ETAN_Series32 = zeros(192,132,395);

HC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
depth32 = 1;
str = '../MITgcm/verification/SO3_20190513/diag/';

for ii=1:2
    char32state = [str,'diag_vel.00000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    UVEL_Series32(:,:,ii) = temp32state(:,:,1,1);
    VVEL_Series32(:,:,ii) = temp32state(:,:,1,2);
    clear temp32state
    char32surf = [str,'diag_surf.00000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,1); 
    clear temp32surf
end

for ii=3:20
    char32state = [str,'diag_vel.0000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    UVEL_Series32(:,:,ii) = temp32state(:,:,1,1);
    VVEL_Series32(:,:,ii) = temp32state(:,:,1,2);
    clear temp32state
    char32surf = [str,'diag_surf.0000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,1); 
    clear temp32surf
end

for ii=21:208
    char32state = [str,'diag_vel.000000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    UVEL_Series32(:,:,ii) = temp32state(:,:,1,1);
    VVEL_Series32(:,:,ii) = temp32state(:,:,1,2);
    clear temp32state
    char32surf = [str,'diag_surf.000000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,1); 
    clear temp32surf
end

for ii=209:395
    char32state = [str,'diag_vel.00000',num2str(48*ii)];
    temp32state = rdmds(char32state);
    UVEL_Series32(:,:,ii) = temp32state(:,:,1,1);
    VVEL_Series32(:,:,ii) = temp32state(:,:,1,2);
    clear temp32state
    char32surf = [str,'diag_surf.00000',num2str(48*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,1); 
    clear temp32surf
end

SPEED_Series32 = sqrt(UVEL_Series32.^2 + VVEL_Series32.^2);
SPEED_Series62 = sqrt(UVEL_Series62.^2 + VVEL_Series62.^2);
SPEED_Series122 = sqrt(UVEL_Series122.^2 + VVEL_Series122.^2);

clearvars -except SPEED* ETAN*

save ETAN_CURRENTS









