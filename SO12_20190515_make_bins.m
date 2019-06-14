
%% 124

tfield124 = 1;
sfield124 = 2;
wfield124 = 5;
tffield124 = 1;
sffield124 = 2;
cfield124 = 3;
ofield124 = 4;
efield124 = 1;

THETA_Series124 = zeros(756,512,213);
SALT_Series124 = zeros(756,512,213);
WVEL_Series124 = zeros(756,512,213);
TFLUX_Series124 = zeros(756,512,213);
SFLUX_Series124 = zeros(756,512,213);
CFLUX_Series124 = zeros(756,512,213);
OFLUX_Series124 = zeros(756,512,213);
ETAN_Series124 = zeros(756,512,213);

HC = rdmds('../MITgcm/verification/SO12_20190515/run/hFacC');
depth124 = 1;
str = '../MITgcm/verification/SO12_20190515/diag/';

for ii=1:4
    char124state = [str,'diag_state.0000000',num2str(240*ii)];
    temp124state = rdmds(char124state);
    THETA_Series124(:,:,ii) = temp124state(:,:,depth124,tfield124);
    SALT_Series124(:,:,ii) = temp124state(:,:,depth124,sfield124);
    WVEL_Series124(:,:,ii) = temp124state(:,:,depth124,wfield124);
    clear temp124state
    char124airsea = [str,'diag_airsea.0000000',num2str(240*ii)];
    temp124airsea = rdmds(char124airsea); 
    TFLUX_Series124(:,:,ii) = temp124airsea(:,:,tffield124);
    SFLUX_Series124(:,:,ii) = temp124airsea(:,:,sffield124);
    CFLUX_Series124(:,:,ii) = temp124airsea(:,:,cfield124);
    OFLUX_Series124(:,:,ii) = temp124airsea(:,:,ofield124);
    clear temp124airsea
    char124surf = [str,'diag_surf.0000000',num2str(240*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series124(:,:,ii) = temp124surf(:,:,efield124); 
    clear temp124surf
end

for ii=5:41
    char124state = [str,'diag_state.000000',num2str(240*ii)];
    temp124state = rdmds(char124state);
    THETA_Series124(:,:,ii) = temp124state(:,:,depth124,tfield124);
    SALT_Series124(:,:,ii) = temp124state(:,:,depth124,sfield124);
    WVEL_Series124(:,:,ii) = temp124state(:,:,depth124,wfield124);
    clear temp124state
    char124airsea = [str,'diag_airsea.000000',num2str(240*ii)];
    temp124airsea = rdmds(char124airsea); 
    TFLUX_Series124(:,:,ii) = temp124airsea(:,:,tffield124);
    SFLUX_Series124(:,:,ii) = temp124airsea(:,:,sffield124);
    CFLUX_Series124(:,:,ii) = temp124airsea(:,:,cfield124);
    OFLUX_Series124(:,:,ii) = temp124airsea(:,:,ofield124);
    clear temp124airsea
    char124surf = [str,'diag_surf.000000',num2str(240*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series124(:,:,ii) = temp124surf(:,:,efield124); 
    clear temp124surf
end

for ii=42:213
    char124state = [str,'diag_state.00000',num2str(240*ii)];
    temp124state = rdmds(char124state);
    THETA_Series124(:,:,ii) = temp124state(:,:,depth124,tfield124);
    SALT_Series124(:,:,ii) = temp124state(:,:,depth124,sfield124);
    WVEL_Series124(:,:,ii) = temp124state(:,:,depth124,wfield124);
    clear temp124state
    char124airsea = [str,'diag_airsea.00000',num2str(240*ii)];
    temp124airsea = rdmds(char124airsea); 
    TFLUX_Series124(:,:,ii) = temp124airsea(:,:,tffield124);
    SFLUX_Series124(:,:,ii) = temp124airsea(:,:,sffield124);
    CFLUX_Series124(:,:,ii) = temp124airsea(:,:,cfield124);
    OFLUX_Series124(:,:,ii) = temp124airsea(:,:,ofield124);
    clear temp124airsea
    char124surf = [str,'diag_surf.00000',num2str(240*ii)];
    temp124surf = rdmds(char124surf); 
    ETAN_Series124(:,:,ii) = temp124surf(:,:,efield124); 
    clear temp124surf
end

THETA_124_JJA_avg = mean(THETA_Series124(:,:,1:92),3);
SALT_124_JJA_avg = mean(SALT_Series124(:,:,1:92),3);
WVEL_124_JJA_avg = mean(WVEL_Series124(:,:,1:92),3);
WVEL_124_JJA_std = std(WVEL_Series124(:,:,1:92),0,3);
THETA_124_JN_avg = mean(THETA_Series124(:,:,1:182),3);
SALT_124_JN_avg = mean(SALT_Series124(:,:,1:182),3);
WVEL_124_JN_avg = mean(WVEL_Series124(:,:,1:182),3);
WVEL_124_JN_std = std(WVEL_Series124(:,:,1:182),0,3);
TFLUX_124_JJA_avg = mean(TFLUX_Series124(:,:,1:92),3);
SFLUX_124_JJA_avg = mean(SFLUX_Series124(:,:,1:92),3);
ETAN_124_JJA_avg = mean(ETAN_Series(:,:,1:92),3);
ETAN_124_JJA_std = std(ETAN_Series(:,:,1:92),0,3);
TFLUX_124_JN_avg = mean(TFLUX_Series124(:,:,1:182),3);
SFLUX_124_JN_avg = mean(SFLUX_Series124(:,:,1:182),3);
ETAN_124_JN_avg = mean(ETAN_Series(:,:,1:182),3);
ETAN_124_JN_std = std(ETAN_Series(:,:,1:182),0,3);
CFLUX_124_JJA_avg = mean(CFLUX_Series124(:,:,1:92),3);
OFLUX_124_JJA_avg = mean(OFLUX_Series124(:,:,1:92),3);
CFLUX_124_JN_avg = mean(CFLUX_Series124(:,:,1:182),3);
OFLUX_124_JN_avg = mean(OFLUX_Series124(:,:,1:182),3);



[m124,n124] = size(THETA_124_JJA_avg);

for ii=1:m124
    for jj=1:n124
        if (HC(ii,jj)==0)
            THETA_124_JJA_avg(ii,jj) = 99999999;
            SALT_124_JJA_avg(ii,jj) = 99999999;
            WVEL_124_JJA_avg(ii,jj) = 99999999;
            WVEL_124_JJA_std(ii,jj) = 99999999;
            THETA_124_JN_avg(ii,jj) = 99999999;
            SALT_124_JN_avg(ii,jj) = 99999999;
            WVEL_124_JN_avg(ii,jj) = 99999999;
            WVEL_124_JN_std(ii,jj) = 99999999;             
            TFLUX_124_JJA_avg(ii,jj) = 99999999;
            SFLUX_124_JJA_avg(ii,jj) = 99999999;
            ETAN_124_JJA_avg(ii,jj) = 99999999;
            ETAN_124_JJA_std(ii,jj) = 99999999;
            TFLUX_124_JN_avg(ii,jj) = 99999999;
            SFLUX_124_JN_avg(ii,jj) = 99999999;
            ETAN_124_JN_avg(ii,jj) = 99999999;
            ETAN_124_JN_std(ii,jj) = 99999999;            
            CFLUX_124_JJA_avg(ii,jj) = 99999999;
            OFLUX_124_JJA_avg(ii,jj) = 99999999;
            CFLUX_124_JN_avg(ii,jj) = 99999999;
            OFLUX_124_JN_avg(ii,jj) = 99999999;         
        end
    end
end

fid = fopen('THETA_124_JJA_avg.bin','w','b');
fwrite(fid,THETA_124_JJA_avg,'single');
fclose(fid);
fid = fopen('SALT_124_JJA_avg.bin','w','b');
fwrite(fid,SALT_124_JJA_avg,'single');
fclose(fid);
fid = fopen('WVEL_124_JJA_avg.bin','w','b');
fwrite(fid,WVEL_124_JJA_avg,'single');
fclose(fid);
fid = fopen('WVEL_124_JJA_std.bin','w','b');
fwrite(fid,WVEL_124_JJA_std,'single');
fclose(fid);
fid = fopen('THETA_124_JN_avg.bin','w','b');
fwrite(fid,THETA_124_JN_avg,'single');
fclose(fid);
fid = fopen('SALT_124_JN_avg.bin','w','b');
fwrite(fid,SALT_124_JN_avg,'single');
fclose(fid);
fid = fopen('WVEL_124_JN_avg.bin','w','b');
fwrite(fid,WVEL_124_JN_avg,'single');
fclose(fid);
fid = fopen('WVEL_124_JN_std.bin','w','b');
fwrite(fid,WVEL_124_JN_std,'single');
fclose(fid);
fid = fopen('TFLUX_124_JJA_avg.bin','w','b');
fwrite(fid,TFLUX_124_JJA_avg,'single');
fclose(fid);
fid = fopen('SFLUX_124_JJA_avg.bin','w','b');
fwrite(fid,SFLUX_124_JJA_avg,'single');
fclose(fid);
fid = fopen('ETAN_124_JJA_avg.bin','w','b');
fwrite(fid,ETAN_124_JJA_avg,'single');
fclose(fid);
fid = fopen('ETAN_124_JJA_std.bin','w','b');
fwrite(fid,ETAN_124_JJA_std,'single');
fclose(fid);
fid = fopen('TFLUX_124_JN_avg.bin','w','b');
fwrite(fid,TFLUX_124_JN_avg,'single');
fclose(fid);
fid = fopen('SFLUX_124_JN_avg.bin','w','b');
fwrite(fid,SFLUX_124_JN_avg,'single');
fclose(fid);
fid = fopen('ETAN_124_JN_avg.bin','w','b');
fwrite(fid,ETAN_124_JN_avg,'single');
fclose(fid);
fid = fopen('ETAN_124_JN_std.bin','w','b');
fwrite(fid,ETAN_124_JN_std,'single');
fclose(fid);
fid = fopen('CFLUX_124_JJA_avg.bin','w','b');
fwrite(fid,CFLUX_124_JJA_avg,'single');
fclose(fid);
fid = fopen('OFLUX_124_JJA_avg.bin','w','b');
fwrite(fid,OFLUX_124_JJA_avg,'single');
fclose(fid);
fid = fopen('CFLUX_124_JN_avg.bin','w','b');
fwrite(fid,CFLUX_124_JN_avg,'single');
fclose(fid);
fid = fopen('OFLUX_124_JN_avg.bin','w','b');
fwrite(fid,OFLUX_124_JN_avg,'single');
fclose(fid);

clear char124state temp124state *Series124 n124 m124  
save SO3_124_output

fprintf('finished 124 \n')

%% end 124


