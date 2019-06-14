
%% 34

tfield34 = 1;
sfield34 = 2;
wfield34 = 5;
tffield34 = 1;
sffield34 = 2;
cfield34 = 3;
ofield34 = 4;
efield34 = 1;

THETA_Series34 = zeros(192,132,213);
SALT_Series34 = zeros(192,132,213);
WVEL_Series34 = zeros(192,132,213);
TFLUX_Series34 = zeros(192,132,213);
SFLUX_Series34 = zeros(192,132,213);
CFLUX_Series34 = zeros(192,132,213);
OFLUX_Series34 = zeros(192,132,213);
ETAN_Series34 = zeros(192,132,213);

HC = rdmds('../MITgcm/verification/SO3_20190515/run/hFacC');
depth34 = 1;
str = '../MITgcm/verification/SO3_20190515/diag/';

for ii=1:3
    char34state = [str,'diag_state.00000000',num2str(30*ii)];
    temp34state = rdmds(char34state);
    THETA_Series34(:,:,ii) = temp34state(:,:,depth34,tfield34);
    SALT_Series34(:,:,ii) = temp34state(:,:,depth34,sfield34);
    WVEL_Series34(:,:,ii) = temp34state(:,:,depth34,wfield34);
    clear temp34state
    char34airsea = [str,'diag_airsea.00000000',num2str(30*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series34(:,:,ii) = temp34airsea(:,:,tffield34);
    SFLUX_Series34(:,:,ii) = temp34airsea(:,:,sffield34);
    CFLUX_Series34(:,:,ii) = temp34airsea(:,:,cfield34);
    OFLUX_Series34(:,:,ii) = temp34airsea(:,:,ofield34);
    clear temp34airsea
    char34surf = [str,'diag_surf.00000000',num2str(30*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series34(:,:,ii) = temp34surf(:,:,efield34); 
    clear temp34surf
end

for ii=4:33
    char34state = [str,'diag_state.0000000',num2str(30*ii)];
    temp34state = rdmds(char34state);
    THETA_Series34(:,:,ii) = temp34state(:,:,depth34,tfield34);
    SALT_Series34(:,:,ii) = temp34state(:,:,depth34,sfield34);
    WVEL_Series34(:,:,ii) = temp34state(:,:,depth34,wfield34);
    clear temp34state
    char34airsea = [str,'diag_airsea.0000000',num2str(30*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series34(:,:,ii) = temp34airsea(:,:,tffield34);
    SFLUX_Series34(:,:,ii) = temp34airsea(:,:,sffield34);
    CFLUX_Series34(:,:,ii) = temp34airsea(:,:,cfield34);
    OFLUX_Series34(:,:,ii) = temp34airsea(:,:,ofield34);
    clear temp34airsea
    char34surf = [str,'diag_surf.0000000',num2str(30*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series34(:,:,ii) = temp34surf(:,:,efield34); 
    clear temp34surf
end

for ii=34:213
    char34state = [str,'diag_state.000000',num2str(30*ii)];
    temp34state = rdmds(char34state);
    THETA_Series34(:,:,ii) = temp34state(:,:,depth34,tfield34);
    SALT_Series34(:,:,ii) = temp34state(:,:,depth34,sfield34);
    WVEL_Series34(:,:,ii) = temp34state(:,:,depth34,wfield34);
    clear temp34state
    char34airsea = [str,'diag_airsea.000000',num2str(30*ii)];
    temp34airsea = rdmds(char34airsea); 
    TFLUX_Series34(:,:,ii) = temp34airsea(:,:,tffield34);
    SFLUX_Series34(:,:,ii) = temp34airsea(:,:,sffield34);
    CFLUX_Series34(:,:,ii) = temp34airsea(:,:,cfield34);
    OFLUX_Series34(:,:,ii) = temp34airsea(:,:,ofield34);
    clear temp34airsea
    char34surf = [str,'diag_surf.000000',num2str(30*ii)];
    temp34surf = rdmds(char34surf); 
    ETAN_Series34(:,:,ii) = temp34surf(:,:,efield34); 
    clear temp34surf
end

THETA_34_JJA_avg = mean(THETA_Series34(:,:,1:92),3);
SALT_34_JJA_avg = mean(SALT_Series34(:,:,1:92),3);
WVEL_34_JJA_avg = mean(WVEL_Series34(:,:,1:92),3);
WVEL_34_JJA_std = std(WVEL_Series34(:,:,1:92),0,3);
THETA_34_JN_avg = mean(THETA_Series34(:,:,1:182),3);
SALT_34_JN_avg = mean(SALT_Series34(:,:,1:182),3);
WVEL_34_JN_avg = mean(WVEL_Series34(:,:,1:182),3);
WVEL_34_JN_std = std(WVEL_Series34(:,:,1:182),0,3);
TFLUX_34_JJA_avg = mean(TFLUX_Series34(:,:,1:92),3);
SFLUX_34_JJA_avg = mean(SFLUX_Series34(:,:,1:92),3);
ETAN_34_JJA_avg = mean(ETAN_Series(:,:,1:92),3);
ETAN_34_JJA_std = std(ETAN_Series(:,:,1:92),0,3);
TFLUX_34_JN_avg = mean(TFLUX_Series34(:,:,1:182),3);
SFLUX_34_JN_avg = mean(SFLUX_Series34(:,:,1:182),3);
ETAN_34_JN_avg = mean(ETAN_Series(:,:,1:182),3);
ETAN_34_JN_std = std(ETAN_Series(:,:,1:182),0,3);
CFLUX_34_JJA_avg = mean(CFLUX_Series34(:,:,1:92),3);
OFLUX_34_JJA_avg = mean(OFLUX_Series34(:,:,1:92),3);
CFLUX_34_JN_avg = mean(CFLUX_Series34(:,:,1:182),3);
OFLUX_34_JN_avg = mean(OFLUX_Series34(:,:,1:182),3);



[m34,n34] = size(THETA_34_JJA_avg);

for ii=1:m34
    for jj=1:n34
        if (HC(ii,jj)==0)
            THETA_34_JJA_avg(ii,jj) = 99999999;
            SALT_34_JJA_avg(ii,jj) = 99999999;
            WVEL_34_JJA_avg(ii,jj) = 99999999;
            WVEL_34_JJA_std(ii,jj) = 99999999;
            THETA_34_JN_avg(ii,jj) = 99999999;
            SALT_34_JN_avg(ii,jj) = 99999999;
            WVEL_34_JN_avg(ii,jj) = 99999999;
            WVEL_34_JN_std(ii,jj) = 99999999;             
            TFLUX_34_JJA_avg(ii,jj) = 99999999;
            SFLUX_34_JJA_avg(ii,jj) = 99999999;
            ETAN_34_JJA_avg(ii,jj) = 99999999;
            ETAN_34_JJA_std(ii,jj) = 99999999;
            TFLUX_34_JN_avg(ii,jj) = 99999999;
            SFLUX_34_JN_avg(ii,jj) = 99999999;
            ETAN_34_JN_avg(ii,jj) = 99999999;
            ETAN_34_JN_std(ii,jj) = 99999999;            
            CFLUX_34_JJA_avg(ii,jj) = 99999999;
            OFLUX_34_JJA_avg(ii,jj) = 99999999;
            CFLUX_34_JN_avg(ii,jj) = 99999999;
            OFLUX_34_JN_avg(ii,jj) = 99999999;         
        end
    end
end

fid = fopen('THETA_34_JJA_avg.bin','w','b');
fwrite(fid,THETA_34_JJA_avg,'single');
fclose(fid);
fid = fopen('SALT_34_JJA_avg.bin','w','b');
fwrite(fid,SALT_34_JJA_avg,'single');
fclose(fid);
fid = fopen('WVEL_34_JJA_avg.bin','w','b');
fwrite(fid,WVEL_34_JJA_avg,'single');
fclose(fid);
fid = fopen('WVEL_34_JJA_std.bin','w','b');
fwrite(fid,WVEL_34_JJA_std,'single');
fclose(fid);
fid = fopen('THETA_34_JN_avg.bin','w','b');
fwrite(fid,THETA_34_JN_avg,'single');
fclose(fid);
fid = fopen('SALT_34_JN_avg.bin','w','b');
fwrite(fid,SALT_34_JN_avg,'single');
fclose(fid);
fid = fopen('WVEL_34_JN_avg.bin','w','b');
fwrite(fid,WVEL_34_JN_avg,'single');
fclose(fid);
fid = fopen('WVEL_34_JN_std.bin','w','b');
fwrite(fid,WVEL_34_JN_std,'single');
fclose(fid);
fid = fopen('TFLUX_34_JJA_avg.bin','w','b');
fwrite(fid,TFLUX_34_JJA_avg,'single');
fclose(fid);
fid = fopen('SFLUX_34_JJA_avg.bin','w','b');
fwrite(fid,SFLUX_34_JJA_avg,'single');
fclose(fid);
fid = fopen('ETAN_34_JJA_avg.bin','w','b');
fwrite(fid,ETAN_34_JJA_avg,'single');
fclose(fid);
fid = fopen('ETAN_34_JJA_std.bin','w','b');
fwrite(fid,ETAN_34_JJA_std,'single');
fclose(fid);
fid = fopen('TFLUX_34_JN_avg.bin','w','b');
fwrite(fid,TFLUX_34_JN_avg,'single');
fclose(fid);
fid = fopen('SFLUX_34_JN_avg.bin','w','b');
fwrite(fid,SFLUX_34_JN_avg,'single');
fclose(fid);
fid = fopen('ETAN_34_JN_avg.bin','w','b');
fwrite(fid,ETAN_34_JN_avg,'single');
fclose(fid);
fid = fopen('ETAN_34_JN_std.bin','w','b');
fwrite(fid,ETAN_34_JN_std,'single');
fclose(fid);
fid = fopen('CFLUX_34_JJA_avg.bin','w','b');
fwrite(fid,CFLUX_34_JJA_avg,'single');
fclose(fid);
fid = fopen('OFLUX_34_JJA_avg.bin','w','b');
fwrite(fid,OFLUX_34_JJA_avg,'single');
fclose(fid);
fid = fopen('CFLUX_34_JN_avg.bin','w','b');
fwrite(fid,CFLUX_34_JN_avg,'single');
fclose(fid);
fid = fopen('OFLUX_34_JN_avg.bin','w','b');
fwrite(fid,OFLUX_34_JN_avg,'single');
fclose(fid);

clear char34state temp34state *Series34 n34 m34  
save SO3_34_output

fprintf('finished 34 \n')

%% end 34


