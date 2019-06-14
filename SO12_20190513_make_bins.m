
%% 122

tfield122 = 1;
sfield122 = 2;
wfield122 = 5;
tffield122 = 1;
sffield122 = 2;
cfield122 = 3;
ofield122 = 4;
efield122 = 1;

THETA_Series122 = zeros(756,512,395);
SALT_Series122 = zeros(756,512,395);
WVEL_Series122 = zeros(756,512,395);
TFLUX_Series122 = zeros(756,512,395);
SFLUX_Series122 = zeros(756,512,395);
CFLUX_Series122 = zeros(756,512,395);
OFLUX_Series122 = zeros(756,512,395);
ETAN_Series122 = zeros(756,512,395);

HC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag/';

for ii=1:4
    char122state = [str,'diag_state.0000000',num2str(240*ii)];
    temp122state = rdmds(char122state);
    THETA_Series122(:,:,ii) = temp122state(:,:,depth122,tfield122);
    SALT_Series122(:,:,ii) = temp122state(:,:,depth122,sfield122);
    WVEL_Series122(:,:,ii) = temp122state(:,:,depth122,wfield122);
    clear temp122state
    char122airsea = [str,'diag_airsea.0000000',num2str(240*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series122(:,:,ii) = temp122airsea(:,:,tffield122);
    SFLUX_Series122(:,:,ii) = temp122airsea(:,:,sffield122);
    CFLUX_Series122(:,:,ii) = temp122airsea(:,:,cfield122);
    OFLUX_Series122(:,:,ii) = temp122airsea(:,:,ofield122);
    clear temp122airsea
    char122surf = [str,'diag_surf.0000000',num2str(240*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,efield122); 
    clear temp122surf
end

for ii=5:41
    char122state = [str,'diag_state.000000',num2str(240*ii)];
    temp122state = rdmds(char122state);
    THETA_Series122(:,:,ii) = temp122state(:,:,depth122,tfield122);
    SALT_Series122(:,:,ii) = temp122state(:,:,depth122,sfield122);
    WVEL_Series122(:,:,ii) = temp122state(:,:,depth122,wfield122);
    clear temp122state
    char122airsea = [str,'diag_airsea.000000',num2str(240*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series122(:,:,ii) = temp122airsea(:,:,tffield122);
    SFLUX_Series122(:,:,ii) = temp122airsea(:,:,sffield122);
    CFLUX_Series122(:,:,ii) = temp122airsea(:,:,cfield122);
    OFLUX_Series122(:,:,ii) = temp122airsea(:,:,ofield122);
    clear temp122airsea
    char122surf = [str,'diag_surf.000000',num2str(240*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,efield122); 
    clear temp122surf
end

for ii=42:395
    char122state = [str,'diag_state.00000',num2str(240*ii)];
    temp122state = rdmds(char122state);
    THETA_Series122(:,:,ii) = temp122state(:,:,depth122,tfield122);
    SALT_Series122(:,:,ii) = temp122state(:,:,depth122,sfield122);
    WVEL_Series122(:,:,ii) = temp122state(:,:,depth122,wfield122);
    clear temp122state
    char122airsea = [str,'diag_airsea.00000',num2str(240*ii)];
    temp122airsea = rdmds(char122airsea); 
    TFLUX_Series122(:,:,ii) = temp122airsea(:,:,tffield122);
    SFLUX_Series122(:,:,ii) = temp122airsea(:,:,sffield122);
    CFLUX_Series122(:,:,ii) = temp122airsea(:,:,cfield122);
    OFLUX_Series122(:,:,ii) = temp122airsea(:,:,ofield122);
    clear temp122airsea
    char122surf = [str,'diag_surf.00000',num2str(240*ii)];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,efield122); 
    clear temp122surf
end

THETA_122_DJF_avg = mean(THETA_Series122(:,:,1:91),3);
SALT_122_DJF_avg = mean(SALT_Series122(:,:,1:91),3);
WVEL_122_DJF_avg = mean(WVEL_Series122(:,:,1:91),3);
WVEL_122_DJF_std = std(WVEL_Series122(:,:,1:91),0,3);
THETA_122_DM_avg = mean(THETA_Series122(:,:,1:182),3);
SALT_122_DM_avg = mean(SALT_Series122(:,:,1:182),3);
WVEL_122_DM_avg = mean(WVEL_Series122(:,:,1:182),3);
WVEL_122_DM_std = std(WVEL_Series122(:,:,1:182),0,3);
THETA_122_DD_avg = mean(THETA_Series122(:,:,1:364),3);
SALT_122_DD_avg = mean(SALT_Series122(:,:,1:364),3);
WVEL_122_DD_avg = mean(WVEL_Series122(:,:,1:364),3);
WVEL_122_DD_std = std(WVEL_Series122(:,:,1:364),0,3);
TFLUX_122_DJF_avg = mean(TFLUX_Series122(:,:,1:91),3);
SFLUX_122_DJF_avg = mean(SFLUX_Series122(:,:,1:91),3);
ETAN_122_DJF_avg = mean(ETAN_Series(:,:,1:91),3);
ETAN_122_DJF_std = std(ETAN_Series(:,:,1:91),0,3);
TFLUX_122_DM_avg = mean(TFLUX_Series122(:,:,1:182),3);
SFLUX_122_DM_avg = mean(SFLUX_Series122(:,:,1:182),3);
ETAN_122_DM_avg = mean(ETAN_Series(:,:,1:182),3);
ETAN_122_DM_std = std(ETAN_Series(:,:,1:182),0,3);
TFLUX_122_DD_avg = mean(TFLUX_Series122(:,:,1:364),3);
SFLUX_122_DD_avg = mean(SFLUX_Series122(:,:,1:364),3);
ETAN_122_DD_avg = mean(ETAN_Series(:,:,1:364),3);
ETAN_122_DD_std = std(ETAN_Series(:,:,1:364),0,3);
CFLUX_122_DJF_avg = mean(CFLUX_Series122(:,:,1:91),3);
OFLUX_122_DJF_avg = mean(OFLUX_Series122(:,:,1:91),3);
CFLUX_122_DM_avg = mean(CFLUX_Series122(:,:,1:182),3);
OFLUX_122_DM_avg = mean(OFLUX_Series122(:,:,1:182),3);
CFLUX_122_DD_avg = mean(CFLUX_Series122(:,:,1:364),3);
OFLUX_122_DD_avg = mean(OFLUX_Series122(:,:,1:364),3);


[m122,n122] = size(THETA_122_DJF_avg);

for ii=1:m122
    for jj=1:n122
        if (HC(ii,jj)==0)
            THETA_122_DJF_avg(ii,jj) = 99999999;
            SALT_122_DJF_avg(ii,jj) = 99999999;
            WVEL_122_DJF_avg(ii,jj) = 99999999;
            WVEL_122_DJF_std(ii,jj) = 99999999;
            THETA_122_DM_avg(ii,jj) = 99999999;
            SALT_122_DM_avg(ii,jj) = 99999999;
            WVEL_122_DM_avg(ii,jj) = 99999999;
            WVEL_122_DM_std(ii,jj) = 99999999;            
            THETA_122_DD_avg(ii,jj) = 99999999;
            SALT_122_DD_avg(ii,jj) = 99999999;
            WVEL_122_DD_avg(ii,jj) = 99999999;
            WVEL_122_DD_std(ii,jj) = 99999999;  
            TFLUX_122_DJF_avg(ii,jj) = 99999999;
            SFLUX_122_DJF_avg(ii,jj) = 99999999;
            ETAN_122_DJF_avg(ii,jj) = 99999999;
            ETAN_122_DJF_std(ii,jj) = 99999999;
            TFLUX_122_DM_avg(ii,jj) = 99999999;
            SFLUX_122_DM_avg(ii,jj) = 99999999;
            ETAN_122_DM_avg(ii,jj) = 99999999;
            ETAN_122_DM_std(ii,jj) = 99999999;            
            TFLUX_122_DD_avg(ii,jj) = 99999999;
            SFLUX_122_DD_avg(ii,jj) = 99999999;
            ETAN_122_DD_avg(ii,jj) = 99999999;
            ETAN_122_DD_std(ii,jj) = 99999999;
            CFLUX_122_DJF_avg(ii,jj) = 99999999;
            OFLUX_122_DJF_avg(ii,jj) = 99999999;
            CFLUX_122_DM_avg(ii,jj) = 99999999;
            OFLUX_122_DM_avg(ii,jj) = 99999999;         
            CFLUX_122_DD_avg(ii,jj) = 99999999;
            OFLUX_122_DD_avg(ii,jj) = 99999999;
        end
    end
end

fid = fopen('THETA_122_DJF_avg.bin','w','b');
fwrite(fid,THETA_122_DJF_avg,'single');
fclose(fid);
fid = fopen('SALT_122_DJF_avg.bin','w','b');
fwrite(fid,SALT_122_DJF_avg,'single');
fclose(fid);
fid = fopen('WVEL_122_DJF_avg.bin','w','b');
fwrite(fid,WVEL_122_DJF_avg,'single');
fclose(fid);
fid = fopen('WVEL_122_DJF_std.bin','w','b');
fwrite(fid,WVEL_122_DJF_std,'single');
fclose(fid);
fid = fopen('THETA_122_DM_avg.bin','w','b');
fwrite(fid,THETA_122_DM_avg,'single');
fclose(fid);
fid = fopen('SALT_122_DM_avg.bin','w','b');
fwrite(fid,SALT_122_DM_avg,'single');
fclose(fid);
fid = fopen('WVEL_122_DM_avg.bin','w','b');
fwrite(fid,WVEL_122_DM_avg,'single');
fclose(fid);
fid = fopen('WVEL_122_DM_std.bin','w','b');
fwrite(fid,WVEL_122_DM_std,'single');
fclose(fid);
fid = fopen('THETA_122_DD_avg.bin','w','b');
fwrite(fid,THETA_122_DD_avg,'single');
fclose(fid);
fid = fopen('SALT_122_DD_avg.bin','w','b');
fwrite(fid,SALT_122_DD_avg,'single');
fclose(fid);
fid = fopen('WVEL_122_DD_avg.bin','w','b');
fwrite(fid,WVEL_122_DD_avg,'single');
fclose(fid);
fid = fopen('WVEL_122_DD_std.bin','w','b');
fwrite(fid,WVEL_122_DD_std,'single');
fclose(fid);
fid = fopen('TFLUX_122_DJF_avg.bin','w','b');
fwrite(fid,TFLUX_122_DJF_avg,'single');
fclose(fid);
fid = fopen('SFLUX_122_DJF_avg.bin','w','b');
fwrite(fid,SFLUX_122_DJF_avg,'single');
fclose(fid);
fid = fopen('ETAN_122_DJF_avg.bin','w','b');
fwrite(fid,ETAN_122_DJF_avg,'single');
fclose(fid);
fid = fopen('ETAN_122_DJF_std.bin','w','b');
fwrite(fid,ETAN_122_DJF_std,'single');
fclose(fid);
fid = fopen('TFLUX_122_DM_avg.bin','w','b');
fwrite(fid,TFLUX_122_DM_avg,'single');
fclose(fid);
fid = fopen('SFLUX_122_DM_avg.bin','w','b');
fwrite(fid,SFLUX_122_DM_avg,'single');
fclose(fid);
fid = fopen('ETAN_122_DM_avg.bin','w','b');
fwrite(fid,ETAN_122_DM_avg,'single');
fclose(fid);
fid = fopen('ETAN_122_DM_std.bin','w','b');
fwrite(fid,ETAN_122_DM_std,'single');
fclose(fid);
fid = fopen('TFLUX_122_DD_avg.bin','w','b');
fwrite(fid,TFLUX_122_DD_avg,'single');
fclose(fid);
fid = fopen('SFLUX_122_DD_avg.bin','w','b');
fwrite(fid,SFLUX_122_DD_avg,'single');
fclose(fid);
fid = fopen('ETAN_122_DD_avg.bin','w','b');
fwrite(fid,ETAN_122_DD_avg,'single');
fclose(fid);
fid = fopen('ETAN_122_DD_std.bin','w','b');
fwrite(fid,ETAN_122_DD_std,'single');
fclose(fid);
fid = fopen('CFLUX_122_DJF_avg.bin','w','b');
fwrite(fid,CFLUX_122_DJF_avg,'single');
fclose(fid);
fid = fopen('OFLUX_122_DJF_avg.bin','w','b');
fwrite(fid,OFLUX_122_DJF_avg,'single');
fclose(fid);
fid = fopen('CFLUX_122_DM_avg.bin','w','b');
fwrite(fid,CFLUX_122_DM_avg,'single');
fclose(fid);
fid = fopen('OFLUX_122_DM_avg.bin','w','b');
fwrite(fid,OFLUX_122_DM_avg,'single');
fclose(fid);
fid = fopen('CFLUX_122_DD_avg.bin','w','b');
fwrite(fid,CFLUX_122_DD_avg,'single');
fclose(fid);
fid = fopen('OFLUX_122_DD_avg.bin','w','b');
fwrite(fid,OFLUX_122_DD_avg,'single');
fclose(fid);

clear char122state temp122state *Series122 n122 m122  
save SO3_122_output

fprintf('finished 122 \n')

%% end 122


