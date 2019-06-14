
%% 64

tfield64 = 1;
sfield64 = 2;
wfield64 = 5;
tffield64 = 1;
sffield64 = 2;
cfield64 = 3;
ofield64 = 4;
efield64 = 1;

THETA_Series64 = zeros(384,260,213);
SALT_Series64 = zeros(384,260,213);
WVEL_Series64 = zeros(384,260,213);
TFLUX_Series64 = zeros(384,260,213);
SFLUX_Series64 = zeros(384,260,213);
CFLUX_Series64 = zeros(384,260,213);
OFLUX_Series64 = zeros(384,260,213);
ETAN_Series64 = zeros(384,260,213);

HC = rdmds('../MITgcm/verification/SO6_20190515/run/hFacC');
depth64 = 1;
str = '../MITgcm/verification/SO6_20190515/diag/';

for ii=1:1
    char64state = [str,'diag_state.00000000',num2str(60*ii)];
    temp64state = rdmds(char64state);
    THETA_Series64(:,:,ii) = temp64state(:,:,depth64,tfield64);
    SALT_Series64(:,:,ii) = temp64state(:,:,depth64,sfield64);
    WVEL_Series64(:,:,ii) = temp64state(:,:,depth64,wfield64);
    clear temp64state
    char64airsea = [str,'diag_airsea.00000000',num2str(60*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series64(:,:,ii) = temp64airsea(:,:,tffield64);
    SFLUX_Series64(:,:,ii) = temp64airsea(:,:,sffield64);
    CFLUX_Series64(:,:,ii) = temp64airsea(:,:,cfield64);
    OFLUX_Series64(:,:,ii) = temp64airsea(:,:,ofield64);
    clear temp64airsea
    char64surf = [str,'diag_surf.00000000',num2str(60*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series64(:,:,ii) = temp64surf(:,:,efield64); 
    clear temp64surf
end

for ii=2:16
    char64state = [str,'diag_state.0000000',num2str(60*ii)];
    temp64state = rdmds(char64state);
    THETA_Series64(:,:,ii) = temp64state(:,:,depth64,tfield64);
    SALT_Series64(:,:,ii) = temp64state(:,:,depth64,sfield64);
    WVEL_Series64(:,:,ii) = temp64state(:,:,depth64,wfield64);
    clear temp64state
    char64airsea = [str,'diag_airsea.0000000',num2str(60*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series64(:,:,ii) = temp64airsea(:,:,tffield64);
    SFLUX_Series64(:,:,ii) = temp64airsea(:,:,sffield64);
    CFLUX_Series64(:,:,ii) = temp64airsea(:,:,cfield64);
    OFLUX_Series64(:,:,ii) = temp64airsea(:,:,ofield64);
    clear temp64airsea
    char64surf = [str,'diag_surf.0000000',num2str(60*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series64(:,:,ii) = temp64surf(:,:,efield64); 
    clear temp64surf
end

for ii=17:166
    char64state = [str,'diag_state.000000',num2str(60*ii)];
    temp64state = rdmds(char64state);
    THETA_Series64(:,:,ii) = temp64state(:,:,depth64,tfield64);
    SALT_Series64(:,:,ii) = temp64state(:,:,depth64,sfield64);
    WVEL_Series64(:,:,ii) = temp64state(:,:,depth64,wfield64);
    clear temp64state
    char64airsea = [str,'diag_airsea.000000',num2str(60*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series64(:,:,ii) = temp64airsea(:,:,tffield64);
    SFLUX_Series64(:,:,ii) = temp64airsea(:,:,sffield64);
    CFLUX_Series64(:,:,ii) = temp64airsea(:,:,cfield64);
    OFLUX_Series64(:,:,ii) = temp64airsea(:,:,ofield64);
    clear temp64airsea
    char64surf = [str,'diag_surf.000000',num2str(60*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series64(:,:,ii) = temp64surf(:,:,efield64); 
    clear temp64surf
end

for ii=167:213
    char64state = [str,'diag_state.00000',num2str(60*ii)];
    temp64state = rdmds(char64state);
    THETA_Series64(:,:,ii) = temp64state(:,:,depth64,tfield64);
    SALT_Series64(:,:,ii) = temp64state(:,:,depth64,sfield64);
    WVEL_Series64(:,:,ii) = temp64state(:,:,depth64,wfield64);
    clear temp64state
    char64airsea = [str,'diag_airsea.00000',num2str(60*ii)];
    temp64airsea = rdmds(char64airsea); 
    TFLUX_Series64(:,:,ii) = temp64airsea(:,:,tffield64);
    SFLUX_Series64(:,:,ii) = temp64airsea(:,:,sffield64);
    CFLUX_Series64(:,:,ii) = temp64airsea(:,:,cfield64);
    OFLUX_Series64(:,:,ii) = temp64airsea(:,:,ofield64);
    clear temp64airsea
    char64surf = [str,'diag_surf.00000',num2str(60*ii)];
    temp64surf = rdmds(char64surf); 
    ETAN_Series64(:,:,ii) = temp64surf(:,:,efield64); 
    clear temp64surf
end

THETA_64_JJA_avg = mean(THETA_Series64(:,:,1:92),3);
SALT_64_JJA_avg = mean(SALT_Series64(:,:,1:92),3);
WVEL_64_JJA_avg = mean(WVEL_Series64(:,:,1:92),3);
WVEL_64_JJA_std = std(WVEL_Series64(:,:,1:92),0,3);
THETA_64_JN_avg = mean(THETA_Series64(:,:,1:182),3);
SALT_64_JN_avg = mean(SALT_Series64(:,:,1:182),3);
WVEL_64_JN_avg = mean(WVEL_Series64(:,:,1:182),3);
WVEL_64_JN_std = std(WVEL_Series64(:,:,1:182),0,3);
TFLUX_64_JJA_avg = mean(TFLUX_Series64(:,:,1:92),3);
SFLUX_64_JJA_avg = mean(SFLUX_Series64(:,:,1:92),3);
ETAN_64_JJA_avg = mean(ETAN_Series(:,:,1:92),3);
ETAN_64_JJA_std = std(ETAN_Series(:,:,1:92),0,3);
TFLUX_64_JN_avg = mean(TFLUX_Series64(:,:,1:182),3);
SFLUX_64_JN_avg = mean(SFLUX_Series64(:,:,1:182),3);
ETAN_64_JN_avg = mean(ETAN_Series(:,:,1:182),3);
ETAN_64_JN_std = std(ETAN_Series(:,:,1:182),0,3);
CFLUX_64_JJA_avg = mean(CFLUX_Series64(:,:,1:92),3);
OFLUX_64_JJA_avg = mean(OFLUX_Series64(:,:,1:92),3);
CFLUX_64_JN_avg = mean(CFLUX_Series64(:,:,1:182),3);
OFLUX_64_JN_avg = mean(OFLUX_Series64(:,:,1:182),3);



[m64,n64] = size(THETA_64_JJA_avg);

for ii=1:m64
    for jj=1:n64
        if (HC(ii,jj)==0)
            THETA_64_JJA_avg(ii,jj) = 99999999;
            SALT_64_JJA_avg(ii,jj) = 99999999;
            WVEL_64_JJA_avg(ii,jj) = 99999999;
            WVEL_64_JJA_std(ii,jj) = 99999999;
            THETA_64_JN_avg(ii,jj) = 99999999;
            SALT_64_JN_avg(ii,jj) = 99999999;
            WVEL_64_JN_avg(ii,jj) = 99999999;
            WVEL_64_JN_std(ii,jj) = 99999999;             
            TFLUX_64_JJA_avg(ii,jj) = 99999999;
            SFLUX_64_JJA_avg(ii,jj) = 99999999;
            ETAN_64_JJA_avg(ii,jj) = 99999999;
            ETAN_64_JJA_std(ii,jj) = 99999999;
            TFLUX_64_JN_avg(ii,jj) = 99999999;
            SFLUX_64_JN_avg(ii,jj) = 99999999;
            ETAN_64_JN_avg(ii,jj) = 99999999;
            ETAN_64_JN_std(ii,jj) = 99999999;            
            CFLUX_64_JJA_avg(ii,jj) = 99999999;
            OFLUX_64_JJA_avg(ii,jj) = 99999999;
            CFLUX_64_JN_avg(ii,jj) = 99999999;
            OFLUX_64_JN_avg(ii,jj) = 99999999;         
        end
    end
end

fid = fopen('THETA_64_JJA_avg.bin','w','b');
fwrite(fid,THETA_64_JJA_avg,'single');
fclose(fid);
fid = fopen('SALT_64_JJA_avg.bin','w','b');
fwrite(fid,SALT_64_JJA_avg,'single');
fclose(fid);
fid = fopen('WVEL_64_JJA_avg.bin','w','b');
fwrite(fid,WVEL_64_JJA_avg,'single');
fclose(fid);
fid = fopen('WVEL_64_JJA_std.bin','w','b');
fwrite(fid,WVEL_64_JJA_std,'single');
fclose(fid);
fid = fopen('THETA_64_JN_avg.bin','w','b');
fwrite(fid,THETA_64_JN_avg,'single');
fclose(fid);
fid = fopen('SALT_64_JN_avg.bin','w','b');
fwrite(fid,SALT_64_JN_avg,'single');
fclose(fid);
fid = fopen('WVEL_64_JN_avg.bin','w','b');
fwrite(fid,WVEL_64_JN_avg,'single');
fclose(fid);
fid = fopen('WVEL_64_JN_std.bin','w','b');
fwrite(fid,WVEL_64_JN_std,'single');
fclose(fid);
fid = fopen('TFLUX_64_JJA_avg.bin','w','b');
fwrite(fid,TFLUX_64_JJA_avg,'single');
fclose(fid);
fid = fopen('SFLUX_64_JJA_avg.bin','w','b');
fwrite(fid,SFLUX_64_JJA_avg,'single');
fclose(fid);
fid = fopen('ETAN_64_JJA_avg.bin','w','b');
fwrite(fid,ETAN_64_JJA_avg,'single');
fclose(fid);
fid = fopen('ETAN_64_JJA_std.bin','w','b');
fwrite(fid,ETAN_64_JJA_std,'single');
fclose(fid);
fid = fopen('TFLUX_64_JN_avg.bin','w','b');
fwrite(fid,TFLUX_64_JN_avg,'single');
fclose(fid);
fid = fopen('SFLUX_64_JN_avg.bin','w','b');
fwrite(fid,SFLUX_64_JN_avg,'single');
fclose(fid);
fid = fopen('ETAN_64_JN_avg.bin','w','b');
fwrite(fid,ETAN_64_JN_avg,'single');
fclose(fid);
fid = fopen('ETAN_64_JN_std.bin','w','b');
fwrite(fid,ETAN_64_JN_std,'single');
fclose(fid);
fid = fopen('CFLUX_64_JJA_avg.bin','w','b');
fwrite(fid,CFLUX_64_JJA_avg,'single');
fclose(fid);
fid = fopen('OFLUX_64_JJA_avg.bin','w','b');
fwrite(fid,OFLUX_64_JJA_avg,'single');
fclose(fid);
fid = fopen('CFLUX_64_JN_avg.bin','w','b');
fwrite(fid,CFLUX_64_JN_avg,'single');
fclose(fid);
fid = fopen('OFLUX_64_JN_avg.bin','w','b');
fwrite(fid,OFLUX_64_JN_avg,'single');
fclose(fid);

clear char64state temp64state *Series64 n64 m64  
save SO3_64_output

fprintf('finished 64 \n')

%% end 64


