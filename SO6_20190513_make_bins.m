
%% 62

tfield62 = 1;
sfield62 = 2;
wfield62 = 5;
tffield62 = 1;
sffield62 = 2;
cfield62 = 3;
ofield62 = 4;
efield62 = 1;

THETA_Series62 = zeros(384,260,395);
SALT_Series62 = zeros(384,260,395);
WVEL_Series62 = zeros(384,260,395);
TFLUX_Series62 = zeros(384,260,395);
SFLUX_Series62 = zeros(384,260,395);
CFLUX_Series62 = zeros(384,260,395);
OFLUX_Series62 = zeros(384,260,395);
ETAN_Series62 = zeros(384,260,395);

HC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag/';

for ii=1:1
    char62state = [str,'diag_state.00000000',num2str(60*ii)];
    temp62state = rdmds(char62state);
    THETA_Series62(:,:,ii) = temp62state(:,:,depth62,tfield62);
    SALT_Series62(:,:,ii) = temp62state(:,:,depth62,sfield62);
    WVEL_Series62(:,:,ii) = temp62state(:,:,depth62,wfield62);
    clear temp62state
    char62airsea = [str,'diag_airsea.00000000',num2str(60*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series62(:,:,ii) = temp62airsea(:,:,tffield62);
    SFLUX_Series62(:,:,ii) = temp62airsea(:,:,sffield62);
    CFLUX_Series62(:,:,ii) = temp62airsea(:,:,cfield62);
    OFLUX_Series62(:,:,ii) = temp62airsea(:,:,ofield62);
    clear temp62airsea
    char62surf = [str,'diag_surf.00000000',num2str(60*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    clear temp62surf
end

for ii=2:16
    char62state = [str,'diag_state.0000000',num2str(60*ii)];
    temp62state = rdmds(char62state);
    THETA_Series62(:,:,ii) = temp62state(:,:,depth62,tfield62);
    SALT_Series62(:,:,ii) = temp62state(:,:,depth62,sfield62);
    WVEL_Series62(:,:,ii) = temp62state(:,:,depth62,wfield62);
    clear temp62state
    char62airsea = [str,'diag_airsea.0000000',num2str(60*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series62(:,:,ii) = temp62airsea(:,:,tffield62);
    SFLUX_Series62(:,:,ii) = temp62airsea(:,:,sffield62);
    CFLUX_Series62(:,:,ii) = temp62airsea(:,:,cfield62);
    OFLUX_Series62(:,:,ii) = temp62airsea(:,:,ofield62);
    clear temp62airsea
    char62surf = [str,'diag_surf.0000000',num2str(60*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    clear temp62surf
end

for ii=17:166
    char62state = [str,'diag_state.000000',num2str(60*ii)];
    temp62state = rdmds(char62state);
    THETA_Series62(:,:,ii) = temp62state(:,:,depth62,tfield62);
    SALT_Series62(:,:,ii) = temp62state(:,:,depth62,sfield62);
    WVEL_Series62(:,:,ii) = temp62state(:,:,depth62,wfield62);
    clear temp62state
    char62airsea = [str,'diag_airsea.000000',num2str(60*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series62(:,:,ii) = temp62airsea(:,:,tffield62);
    SFLUX_Series62(:,:,ii) = temp62airsea(:,:,sffield62);
    CFLUX_Series62(:,:,ii) = temp62airsea(:,:,cfield62);
    OFLUX_Series62(:,:,ii) = temp62airsea(:,:,ofield62);
    clear temp62airsea
    char62surf = [str,'diag_surf.000000',num2str(60*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    clear temp62surf
end

for ii=167:395
    char62state = [str,'diag_state.00000',num2str(60*ii)];
    temp62state = rdmds(char62state);
    THETA_Series62(:,:,ii) = temp62state(:,:,depth62,tfield62);
    SALT_Series62(:,:,ii) = temp62state(:,:,depth62,sfield62);
    WVEL_Series62(:,:,ii) = temp62state(:,:,depth62,wfield62);
    clear temp62state
    char62airsea = [str,'diag_airsea.00000',num2str(60*ii)];
    temp62airsea = rdmds(char62airsea); 
    TFLUX_Series62(:,:,ii) = temp62airsea(:,:,tffield62);
    SFLUX_Series62(:,:,ii) = temp62airsea(:,:,sffield62);
    CFLUX_Series62(:,:,ii) = temp62airsea(:,:,cfield62);
    OFLUX_Series62(:,:,ii) = temp62airsea(:,:,ofield62);
    clear temp62airsea
    char62surf = [str,'diag_surf.00000',num2str(60*ii)];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    clear temp62surf
end

THETA_62_DJF_avg = mean(THETA_Series62(:,:,1:91),3);
SALT_62_DJF_avg = mean(SALT_Series62(:,:,1:91),3);
WVEL_62_DJF_avg = mean(WVEL_Series62(:,:,1:91),3);
WVEL_62_DJF_std = std(WVEL_Series62(:,:,1:91),0,3);
THETA_62_DM_avg = mean(THETA_Series62(:,:,1:182),3);
SALT_62_DM_avg = mean(SALT_Series62(:,:,1:182),3);
WVEL_62_DM_avg = mean(WVEL_Series62(:,:,1:182),3);
WVEL_62_DM_std = std(WVEL_Series62(:,:,1:182),0,3);
THETA_62_DD_avg = mean(THETA_Series62(:,:,1:364),3);
SALT_62_DD_avg = mean(SALT_Series62(:,:,1:364),3);
WVEL_62_DD_avg = mean(WVEL_Series62(:,:,1:364),3);
WVEL_62_DD_std = std(WVEL_Series62(:,:,1:364),0,3);
TFLUX_62_DJF_avg = mean(TFLUX_Series62(:,:,1:91),3);
SFLUX_62_DJF_avg = mean(SFLUX_Series62(:,:,1:91),3);
ETAN_62_DJF_avg = mean(ETAN_Series(:,:,1:91),3);
ETAN_62_DJF_std = std(ETAN_Series(:,:,1:91),0,3);
TFLUX_62_DM_avg = mean(TFLUX_Series62(:,:,1:182),3);
SFLUX_62_DM_avg = mean(SFLUX_Series62(:,:,1:182),3);
ETAN_62_DM_avg = mean(ETAN_Series(:,:,1:182),3);
ETAN_62_DM_std = std(ETAN_Series(:,:,1:182),0,3);
TFLUX_62_DD_avg = mean(TFLUX_Series62(:,:,1:364),3);
SFLUX_62_DD_avg = mean(SFLUX_Series62(:,:,1:364),3);
ETAN_62_DD_avg = mean(ETAN_Series(:,:,1:364),3);
ETAN_62_DD_std = std(ETAN_Series(:,:,1:364),0,3);
CFLUX_62_DJF_avg = mean(CFLUX_Series62(:,:,1:91),3);
OFLUX_62_DJF_avg = mean(OFLUX_Series62(:,:,1:91),3);
CFLUX_62_DM_avg = mean(CFLUX_Series62(:,:,1:182),3);
OFLUX_62_DM_avg = mean(OFLUX_Series62(:,:,1:182),3);
CFLUX_62_DD_avg = mean(CFLUX_Series62(:,:,1:364),3);
OFLUX_62_DD_avg = mean(OFLUX_Series62(:,:,1:364),3);


[m62,n62] = size(THETA_62_DJF_avg);

for ii=1:m62
    for jj=1:n62
        if (HC(ii,jj)==0)
            THETA_62_DJF_avg(ii,jj) = 99999999;
            SALT_62_DJF_avg(ii,jj) = 99999999;
            WVEL_62_DJF_avg(ii,jj) = 99999999;
            WVEL_62_DJF_std(ii,jj) = 99999999;
            THETA_62_DM_avg(ii,jj) = 99999999;
            SALT_62_DM_avg(ii,jj) = 99999999;
            WVEL_62_DM_avg(ii,jj) = 99999999;
            WVEL_62_DM_std(ii,jj) = 99999999;            
            THETA_62_DD_avg(ii,jj) = 99999999;
            SALT_62_DD_avg(ii,jj) = 99999999;
            WVEL_62_DD_avg(ii,jj) = 99999999;
            WVEL_62_DD_std(ii,jj) = 99999999;  
            TFLUX_62_DJF_avg(ii,jj) = 99999999;
            SFLUX_62_DJF_avg(ii,jj) = 99999999;
            ETAN_62_DJF_avg(ii,jj) = 99999999;
            ETAN_62_DJF_std(ii,jj) = 99999999;
            TFLUX_62_DM_avg(ii,jj) = 99999999;
            SFLUX_62_DM_avg(ii,jj) = 99999999;
            ETAN_62_DM_avg(ii,jj) = 99999999;
            ETAN_62_DM_std(ii,jj) = 99999999;            
            TFLUX_62_DD_avg(ii,jj) = 99999999;
            SFLUX_62_DD_avg(ii,jj) = 99999999;
            ETAN_62_DD_avg(ii,jj) = 99999999;
            ETAN_62_DD_std(ii,jj) = 99999999;
            CFLUX_62_DJF_avg(ii,jj) = 99999999;
            OFLUX_62_DJF_avg(ii,jj) = 99999999;
            CFLUX_62_DM_avg(ii,jj) = 99999999;
            OFLUX_62_DM_avg(ii,jj) = 99999999;         
            CFLUX_62_DD_avg(ii,jj) = 99999999;
            OFLUX_62_DD_avg(ii,jj) = 99999999;
        end
    end
end

fid = fopen('THETA_62_DJF_avg.bin','w','b');
fwrite(fid,THETA_62_DJF_avg,'single');
fclose(fid);
fid = fopen('SALT_62_DJF_avg.bin','w','b');
fwrite(fid,SALT_62_DJF_avg,'single');
fclose(fid);
fid = fopen('WVEL_62_DJF_avg.bin','w','b');
fwrite(fid,WVEL_62_DJF_avg,'single');
fclose(fid);
fid = fopen('WVEL_62_DJF_std.bin','w','b');
fwrite(fid,WVEL_62_DJF_std,'single');
fclose(fid);
fid = fopen('THETA_62_DM_avg.bin','w','b');
fwrite(fid,THETA_62_DM_avg,'single');
fclose(fid);
fid = fopen('SALT_62_DM_avg.bin','w','b');
fwrite(fid,SALT_62_DM_avg,'single');
fclose(fid);
fid = fopen('WVEL_62_DM_avg.bin','w','b');
fwrite(fid,WVEL_62_DM_avg,'single');
fclose(fid);
fid = fopen('WVEL_62_DM_std.bin','w','b');
fwrite(fid,WVEL_62_DM_std,'single');
fclose(fid);
fid = fopen('THETA_62_DD_avg.bin','w','b');
fwrite(fid,THETA_62_DD_avg,'single');
fclose(fid);
fid = fopen('SALT_62_DD_avg.bin','w','b');
fwrite(fid,SALT_62_DD_avg,'single');
fclose(fid);
fid = fopen('WVEL_62_DD_avg.bin','w','b');
fwrite(fid,WVEL_62_DD_avg,'single');
fclose(fid);
fid = fopen('WVEL_62_DD_std.bin','w','b');
fwrite(fid,WVEL_62_DD_std,'single');
fclose(fid);
fid = fopen('TFLUX_62_DJF_avg.bin','w','b');
fwrite(fid,TFLUX_62_DJF_avg,'single');
fclose(fid);
fid = fopen('SFLUX_62_DJF_avg.bin','w','b');
fwrite(fid,SFLUX_62_DJF_avg,'single');
fclose(fid);
fid = fopen('ETAN_62_DJF_avg.bin','w','b');
fwrite(fid,ETAN_62_DJF_avg,'single');
fclose(fid);
fid = fopen('ETAN_62_DJF_std.bin','w','b');
fwrite(fid,ETAN_62_DJF_std,'single');
fclose(fid);
fid = fopen('TFLUX_62_DM_avg.bin','w','b');
fwrite(fid,TFLUX_62_DM_avg,'single');
fclose(fid);
fid = fopen('SFLUX_62_DM_avg.bin','w','b');
fwrite(fid,SFLUX_62_DM_avg,'single');
fclose(fid);
fid = fopen('ETAN_62_DM_avg.bin','w','b');
fwrite(fid,ETAN_62_DM_avg,'single');
fclose(fid);
fid = fopen('ETAN_62_DM_std.bin','w','b');
fwrite(fid,ETAN_62_DM_std,'single');
fclose(fid);
fid = fopen('TFLUX_62_DD_avg.bin','w','b');
fwrite(fid,TFLUX_62_DD_avg,'single');
fclose(fid);
fid = fopen('SFLUX_62_DD_avg.bin','w','b');
fwrite(fid,SFLUX_62_DD_avg,'single');
fclose(fid);
fid = fopen('ETAN_62_DD_avg.bin','w','b');
fwrite(fid,ETAN_62_DD_avg,'single');
fclose(fid);
fid = fopen('ETAN_62_DD_std.bin','w','b');
fwrite(fid,ETAN_62_DD_std,'single');
fclose(fid);
fid = fopen('CFLUX_62_DJF_avg.bin','w','b');
fwrite(fid,CFLUX_62_DJF_avg,'single');
fclose(fid);
fid = fopen('OFLUX_62_DJF_avg.bin','w','b');
fwrite(fid,OFLUX_62_DJF_avg,'single');
fclose(fid);
fid = fopen('CFLUX_62_DM_avg.bin','w','b');
fwrite(fid,CFLUX_62_DM_avg,'single');
fclose(fid);
fid = fopen('OFLUX_62_DM_avg.bin','w','b');
fwrite(fid,OFLUX_62_DM_avg,'single');
fclose(fid);
fid = fopen('CFLUX_62_DD_avg.bin','w','b');
fwrite(fid,CFLUX_62_DD_avg,'single');
fclose(fid);
fid = fopen('OFLUX_62_DD_avg.bin','w','b');
fwrite(fid,OFLUX_62_DD_avg,'single');
fclose(fid);

clear char62state temp62state *Series62 n62 m62  
save SO3_62_output

fprintf('finished 62 \n')

%% end 62


