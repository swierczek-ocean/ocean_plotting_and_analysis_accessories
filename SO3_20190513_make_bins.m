
%% 32

tfield32 = 1;
sfield32 = 2;
wfield32 = 5;
tffield32 = 1;
sffield32 = 2;
cfield32 = 3;
ofield32 = 4;
efield32 = 1;

THETA_Series32 = zeros(192,132,395);
SALT_Series32 = zeros(192,132,395);
WVEL_Series32 = zeros(192,132,395);
TFLUX_Series32 = zeros(192,132,395);
SFLUX_Series32 = zeros(192,132,395);
CFLUX_Series32 = zeros(192,132,395);
OFLUX_Series32 = zeros(192,132,395);
ETAN_Series32 = zeros(192,132,395);

HC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
depth32 = 1;
str = '../MITgcm/verification/SO3_20190513/diag/';

for ii=1:3
    char32state = [str,'diag_state.00000000',num2str(30*ii)];
    temp32state = rdmds(char32state);
    THETA_Series32(:,:,ii) = temp32state(:,:,depth32,tfield32);
    SALT_Series32(:,:,ii) = temp32state(:,:,depth32,sfield32);
    WVEL_Series32(:,:,ii) = temp32state(:,:,depth32,wfield32);
    clear temp32state
    char32airsea = [str,'diag_airsea.00000000',num2str(30*ii)];
    temp32airsea = rdmds(char32airsea); 
    TFLUX_Series32(:,:,ii) = temp32airsea(:,:,tffield32);
    SFLUX_Series32(:,:,ii) = temp32airsea(:,:,sffield32);
    CFLUX_Series32(:,:,ii) = temp32airsea(:,:,cfield32);
    OFLUX_Series32(:,:,ii) = temp32airsea(:,:,ofield32);
    clear temp32airsea
    char32surf = [str,'diag_surf.00000000',num2str(30*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    clear temp32surf
end

for ii=4:33
    char32state = [str,'diag_state.0000000',num2str(30*ii)];
    temp32state = rdmds(char32state);
    THETA_Series32(:,:,ii) = temp32state(:,:,depth32,tfield32);
    SALT_Series32(:,:,ii) = temp32state(:,:,depth32,sfield32);
    WVEL_Series32(:,:,ii) = temp32state(:,:,depth32,wfield32);
    clear temp32state
    char32airsea = [str,'diag_airsea.0000000',num2str(30*ii)];
    temp32airsea = rdmds(char32airsea); 
    TFLUX_Series32(:,:,ii) = temp32airsea(:,:,tffield32);
    SFLUX_Series32(:,:,ii) = temp32airsea(:,:,sffield32);
    CFLUX_Series32(:,:,ii) = temp32airsea(:,:,cfield32);
    OFLUX_Series32(:,:,ii) = temp32airsea(:,:,ofield32);
    clear temp32airsea
    char32surf = [str,'diag_surf.0000000',num2str(30*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    clear temp32surf
end

for ii=34:333
    char32state = [str,'diag_state.000000',num2str(30*ii)];
    temp32state = rdmds(char32state);
    THETA_Series32(:,:,ii) = temp32state(:,:,depth32,tfield32);
    SALT_Series32(:,:,ii) = temp32state(:,:,depth32,sfield32);
    WVEL_Series32(:,:,ii) = temp32state(:,:,depth32,wfield32);
    clear temp32state
    char32airsea = [str,'diag_airsea.000000',num2str(30*ii)];
    temp32airsea = rdmds(char32airsea); 
    TFLUX_Series32(:,:,ii) = temp32airsea(:,:,tffield32);
    SFLUX_Series32(:,:,ii) = temp32airsea(:,:,sffield32);
    CFLUX_Series32(:,:,ii) = temp32airsea(:,:,cfield32);
    OFLUX_Series32(:,:,ii) = temp32airsea(:,:,ofield32);
    clear temp32airsea
    char32surf = [str,'diag_surf.000000',num2str(30*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    clear temp32surf
end

for ii=334:395
    char32state = [str,'diag_state.00000',num2str(30*ii)];
    temp32state = rdmds(char32state);
    THETA_Series32(:,:,ii) = temp32state(:,:,depth32,tfield32);
    SALT_Series32(:,:,ii) = temp32state(:,:,depth32,sfield32);
    WVEL_Series32(:,:,ii) = temp32state(:,:,depth32,wfield32);
    clear temp32state
    char32airsea = [str,'diag_airsea.00000',num2str(30*ii)];
    temp32airsea = rdmds(char32airsea); 
    TFLUX_Series32(:,:,ii) = temp32airsea(:,:,tffield32);
    SFLUX_Series32(:,:,ii) = temp32airsea(:,:,sffield32);
    CFLUX_Series32(:,:,ii) = temp32airsea(:,:,cfield32);
    OFLUX_Series32(:,:,ii) = temp32airsea(:,:,ofield32);
    clear temp32airsea
    char32surf = [str,'diag_surf.00000',num2str(30*ii)];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    clear temp32surf
end

THETA_32_DJF_avg = mean(THETA_Series32(:,:,1:91),3);
SALT_32_DJF_avg = mean(SALT_Series32(:,:,1:91),3);
WVEL_32_DJF_avg = mean(WVEL_Series32(:,:,1:91),3);
WVEL_32_DJF_std = std(WVEL_Series32(:,:,1:91),0,3);
THETA_32_DM_avg = mean(THETA_Series32(:,:,1:182),3);
SALT_32_DM_avg = mean(SALT_Series32(:,:,1:182),3);
WVEL_32_DM_avg = mean(WVEL_Series32(:,:,1:182),3);
WVEL_32_DM_std = std(WVEL_Series32(:,:,1:182),0,3);
THETA_32_DD_avg = mean(THETA_Series32(:,:,1:364),3);
SALT_32_DD_avg = mean(SALT_Series32(:,:,1:364),3);
WVEL_32_DD_avg = mean(WVEL_Series32(:,:,1:364),3);
WVEL_32_DD_std = std(WVEL_Series32(:,:,1:364),0,3);
TFLUX_32_DJF_avg = mean(TFLUX_Series32(:,:,1:91),3);
SFLUX_32_DJF_avg = mean(SFLUX_Series32(:,:,1:91),3);
ETAN_32_DJF_avg = mean(ETAN_Series(:,:,1:91),3);
ETAN_32_DJF_std = std(ETAN_Series(:,:,1:91),0,3);
TFLUX_32_DM_avg = mean(TFLUX_Series32(:,:,1:182),3);
SFLUX_32_DM_avg = mean(SFLUX_Series32(:,:,1:182),3);
ETAN_32_DM_avg = mean(ETAN_Series(:,:,1:182),3);
ETAN_32_DM_std = std(ETAN_Series(:,:,1:182),0,3);
TFLUX_32_DD_avg = mean(TFLUX_Series32(:,:,1:364),3);
SFLUX_32_DD_avg = mean(SFLUX_Series32(:,:,1:364),3);
ETAN_32_DD_avg = mean(ETAN_Series(:,:,1:364),3);
ETAN_32_DD_std = std(ETAN_Series(:,:,1:364),0,3);
CFLUX_32_DJF_avg = mean(CFLUX_Series32(:,:,1:91),3);
OFLUX_32_DJF_avg = mean(OFLUX_Series32(:,:,1:91),3);
CFLUX_32_DM_avg = mean(CFLUX_Series32(:,:,1:182),3);
OFLUX_32_DM_avg = mean(OFLUX_Series32(:,:,1:182),3);
CFLUX_32_DD_avg = mean(CFLUX_Series32(:,:,1:364),3);
OFLUX_32_DD_avg = mean(OFLUX_Series32(:,:,1:364),3);


[m32,n32] = size(THETA_32_DJF_avg);

for ii=1:m32
    for jj=1:n32
        if (HC(ii,jj)==0)
            THETA_32_DJF_avg(ii,jj) = 99999999;
            SALT_32_DJF_avg(ii,jj) = 99999999;
            WVEL_32_DJF_avg(ii,jj) = 99999999;
            WVEL_32_DJF_std(ii,jj) = 99999999;
            THETA_32_DM_avg(ii,jj) = 99999999;
            SALT_32_DM_avg(ii,jj) = 99999999;
            WVEL_32_DM_avg(ii,jj) = 99999999;
            WVEL_32_DM_std(ii,jj) = 99999999;            
            THETA_32_DD_avg(ii,jj) = 99999999;
            SALT_32_DD_avg(ii,jj) = 99999999;
            WVEL_32_DD_avg(ii,jj) = 99999999;
            WVEL_32_DD_std(ii,jj) = 99999999;  
            TFLUX_32_DJF_avg(ii,jj) = 99999999;
            SFLUX_32_DJF_avg(ii,jj) = 99999999;
            ETAN_32_DJF_avg(ii,jj) = 99999999;
            ETAN_32_DJF_std(ii,jj) = 99999999;
            TFLUX_32_DM_avg(ii,jj) = 99999999;
            SFLUX_32_DM_avg(ii,jj) = 99999999;
            ETAN_32_DM_avg(ii,jj) = 99999999;
            ETAN_32_DM_std(ii,jj) = 99999999;            
            TFLUX_32_DD_avg(ii,jj) = 99999999;
            SFLUX_32_DD_avg(ii,jj) = 99999999;
            ETAN_32_DD_avg(ii,jj) = 99999999;
            ETAN_32_DD_std(ii,jj) = 99999999;
            CFLUX_32_DJF_avg(ii,jj) = 99999999;
            OFLUX_32_DJF_avg(ii,jj) = 99999999;
            CFLUX_32_DM_avg(ii,jj) = 99999999;
            OFLUX_32_DM_avg(ii,jj) = 99999999;         
            CFLUX_32_DD_avg(ii,jj) = 99999999;
            OFLUX_32_DD_avg(ii,jj) = 99999999;
        end
    end
end

fid = fopen('THETA_32_DJF_avg.bin','w','b');
fwrite(fid,THETA_32_DJF_avg,'single');
fclose(fid);
fid = fopen('SALT_32_DJF_avg.bin','w','b');
fwrite(fid,SALT_32_DJF_avg,'single');
fclose(fid);
fid = fopen('WVEL_32_DJF_avg.bin','w','b');
fwrite(fid,WVEL_32_DJF_avg,'single');
fclose(fid);
fid = fopen('WVEL_32_DJF_std.bin','w','b');
fwrite(fid,WVEL_32_DJF_std,'single');
fclose(fid);
fid = fopen('THETA_32_DM_avg.bin','w','b');
fwrite(fid,THETA_32_DM_avg,'single');
fclose(fid);
fid = fopen('SALT_32_DM_avg.bin','w','b');
fwrite(fid,SALT_32_DM_avg,'single');
fclose(fid);
fid = fopen('WVEL_32_DM_avg.bin','w','b');
fwrite(fid,WVEL_32_DM_avg,'single');
fclose(fid);
fid = fopen('WVEL_32_DM_std.bin','w','b');
fwrite(fid,WVEL_32_DM_std,'single');
fclose(fid);
fid = fopen('THETA_32_DD_avg.bin','w','b');
fwrite(fid,THETA_32_DD_avg,'single');
fclose(fid);
fid = fopen('SALT_32_DD_avg.bin','w','b');
fwrite(fid,SALT_32_DD_avg,'single');
fclose(fid);
fid = fopen('WVEL_32_DD_avg.bin','w','b');
fwrite(fid,WVEL_32_DD_avg,'single');
fclose(fid);
fid = fopen('WVEL_32_DD_std.bin','w','b');
fwrite(fid,WVEL_32_DD_std,'single');
fclose(fid);
fid = fopen('TFLUX_32_DJF_avg.bin','w','b');
fwrite(fid,TFLUX_32_DJF_avg,'single');
fclose(fid);
fid = fopen('SFLUX_32_DJF_avg.bin','w','b');
fwrite(fid,SFLUX_32_DJF_avg,'single');
fclose(fid);
fid = fopen('ETAN_32_DJF_avg.bin','w','b');
fwrite(fid,ETAN_32_DJF_avg,'single');
fclose(fid);
fid = fopen('ETAN_32_DJF_std.bin','w','b');
fwrite(fid,ETAN_32_DJF_std,'single');
fclose(fid);
fid = fopen('TFLUX_32_DM_avg.bin','w','b');
fwrite(fid,TFLUX_32_DM_avg,'single');
fclose(fid);
fid = fopen('SFLUX_32_DM_avg.bin','w','b');
fwrite(fid,SFLUX_32_DM_avg,'single');
fclose(fid);
fid = fopen('ETAN_32_DM_avg.bin','w','b');
fwrite(fid,ETAN_32_DM_avg,'single');
fclose(fid);
fid = fopen('ETAN_32_DM_std.bin','w','b');
fwrite(fid,ETAN_32_DM_std,'single');
fclose(fid);
fid = fopen('TFLUX_32_DD_avg.bin','w','b');
fwrite(fid,TFLUX_32_DD_avg,'single');
fclose(fid);
fid = fopen('SFLUX_32_DD_avg.bin','w','b');
fwrite(fid,SFLUX_32_DD_avg,'single');
fclose(fid);
fid = fopen('ETAN_32_DD_avg.bin','w','b');
fwrite(fid,ETAN_32_DD_avg,'single');
fclose(fid);
fid = fopen('ETAN_32_DD_std.bin','w','b');
fwrite(fid,ETAN_32_DD_std,'single');
fclose(fid);
fid = fopen('CFLUX_32_DJF_avg.bin','w','b');
fwrite(fid,CFLUX_32_DJF_avg,'single');
fclose(fid);
fid = fopen('OFLUX_32_DJF_avg.bin','w','b');
fwrite(fid,OFLUX_32_DJF_avg,'single');
fclose(fid);
fid = fopen('CFLUX_32_DM_avg.bin','w','b');
fwrite(fid,CFLUX_32_DM_avg,'single');
fclose(fid);
fid = fopen('OFLUX_32_DM_avg.bin','w','b');
fwrite(fid,OFLUX_32_DM_avg,'single');
fclose(fid);
fid = fopen('CFLUX_32_DD_avg.bin','w','b');
fwrite(fid,CFLUX_32_DD_avg,'single');
fclose(fid);
fid = fopen('OFLUX_32_DD_avg.bin','w','b');
fwrite(fid,OFLUX_32_DD_avg,'single');
fclose(fid);

clear char32state temp32state *Series32 n32 m32  
save SO3_32_output

fprintf('finished 32 \n')

%% end 32


