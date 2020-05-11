clear
close all
clc
tic()

load XY12 hFacC12
load XY6 hFacC6
load XY3 hFacC3

load XY3 X*3 Y*3
RC3 = squeeze(rdmds('../Grids/3/RC'));
% [XC3,RC3] = ndgrid(XC3,RC3);
% [YC3,RC3] = ndgrid(YC3,RC3);
fid = fopen('AB3_BCs/THETA_SBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
THETA3S = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/THETA_NBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
THETA3N = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/THETA_EBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
THETA3E = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/THETA_WBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
THETA3W = U(:,:,49:60);
clear U

for jj=1:52
    for ii=1:192
        if hFacC3(ii,132,jj)==0
            THETA3N(ii,jj,:) = NaN;
        end
        if hFacC3(ii,1,jj)==0
            THETA3S(ii,jj,:) = NaN;
        end
    end
    for kk=1:132
        if hFacC3(1,kk,jj)==0
            THETA3W(kk,jj,:) = NaN;
        end
        if hFacC3(192,kk,jj)==0
            THETA3E(kk,jj,:) = NaN;
        end
    end
end

save BCs/THETA3BC THETA3* XC3 YC3 RC3
clear THETA*

fid = fopen('AB3_BCs/SALT_SBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
SALT3S = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/SALT_NBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
SALT3N = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/SALT_EBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
SALT3E = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/SALT_WBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
SALT3W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:192
        if hFacC3(ii,132,jj)==0
            SALT3N(ii,jj,:) = NaN;
        end
        if hFacC3(ii,1,jj)==0
            SALT3S(ii,jj,:) = NaN;
        end
    end
    for kk=1:132
        if hFacC3(1,kk,jj)==0
            SALT3W(kk,jj,:) = NaN;
        end
        if hFacC3(192,kk,jj)==0
            SALT3E(kk,jj,:) = NaN;
        end
    end
end
save BCs/SALT3BC SALT3* XC3 YC3 RC3
clear SALT* 

fid = fopen('AB3_BCs/DIC_SBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
DIC3S = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/DIC_NBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
DIC3N = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/DIC_EBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
DIC3E = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/DIC_WBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
DIC3W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:192
        if hFacC3(ii,132,jj)==0
            DIC3N(ii,jj,:) = NaN;
        end
        if hFacC3(ii,1,jj)==0
            DIC3S(ii,jj,:) = NaN;
        end
    end
    for kk=1:132
        if hFacC3(1,kk,jj)==0
            DIC3W(kk,jj,:) = NaN;
        end
        if hFacC3(192,kk,jj)==0
            DIC3E(kk,jj,:) = NaN;
        end
    end
end
save BCs/DIC3BC DIC3* XC3 YC3 RC3
clear DIC*

fid = fopen('AB3_BCs/UVEL_SBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
UVEL3S = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/UVEL_NBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
UVEL3N = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/UVEL_EBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
UVEL3E = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/UVEL_WBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
UVEL3W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:192
        if hFacC3(ii,132,jj)==0
            UVEL3N(ii,jj,:) = NaN;
        end
        if hFacC3(ii,1,jj)==0
            UVEL3S(ii,jj,:) = NaN;
        end
    end
    for kk=1:132
        if hFacC3(1,kk,jj)==0
            UVEL3W(kk,jj,:) = NaN;
        end
        if hFacC3(192,kk,jj)==0
            UVEL3E(kk,jj,:) = NaN;
        end
    end
end
save BCs/UVEL3BC UVEL3* X*3 Y*3 RC3
clear UVEL*

fid = fopen('AB3_BCs/VVEL_SBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
VVEL3S = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/VVEL_NBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[192,52,72]);
fclose(fid);
VVEL3N = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/VVEL_EBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
VVEL3E = U(:,:,49:60);
clear U
fid = fopen('AB3_BCs/VVEL_WBC_2013to2018_monthly_3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[132,52,72]);
fclose(fid);
VVEL3W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:192
        if hFacC3(ii,132,jj)==0
            VVEL3N(ii,jj,:) = NaN;
        end
        if hFacC3(ii,1,jj)==0
            VVEL3S(ii,jj,:) = NaN;
        end
    end
    for kk=1:132
        if hFacC3(1,kk,jj)==0
            VVEL3W(kk,jj,:) = NaN;
        end
        if hFacC3(192,kk,jj)==0
            VVEL3E(kk,jj,:) = NaN;
        end
    end
end
save BCs/VVEL3BC VVEL3* X*3 Y*3 RC3
clear VVEL*

load XY6 X*6 Y*6
RC6 = squeeze(rdmds('../Grids/6/RC'));
% [XC6,RC6] = ndgrid(XC6,RC6);
% [YC6,RC6] = ndgrid(YC6,RC6);
fid = fopen('AB6_BCs/THETA_SBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
THETA6S = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/THETA_NBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
THETA6N = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/THETA_EBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
THETA6E = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/THETA_WBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
THETA6W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:384
        if hFacC6(ii,260,jj)==0
            THETA6N(ii,jj,:) = NaN;
        end
        if hFacC6(ii,1,jj)==0
            THETA6S(ii,jj,:) = NaN;
        end
    end
    for kk=1:260
        if hFacC6(1,kk,jj)==0
            THETA6W(kk,jj,:) = NaN;
        end
        if hFacC6(384,kk,jj)==0
            THETA6E(kk,jj,:) = NaN;
        end
    end
end
save BCs/THETA6BC THETA6* XC6 YC6 RC6
clear THETA*

fid = fopen('AB6_BCs/SALT_SBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
SALT6S = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/SALT_NBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
SALT6N = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/SALT_EBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
SALT6E = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/SALT_WBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
SALT6W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:384
        if hFacC6(ii,260,jj)==0
            SALT6N(ii,jj,:) = NaN;
        end
        if hFacC6(ii,1,jj)==0
            SALT6S(ii,jj,:) = NaN;
        end
    end
    for kk=1:260
        if hFacC6(1,kk,jj)==0
            SALT6W(kk,jj,:) = NaN;
        end
        if hFacC6(384,kk,jj)==0
            SALT6E(kk,jj,:) = NaN;
        end
    end
end
save BCs/SALT6BC SALT6* XC6 YC6 RC6
clear SALT* 

fid = fopen('AB6_BCs/DIC_SBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
DIC6S = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/DIC_NBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
DIC6N = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/DIC_EBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
DIC6E = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/DIC_WBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
DIC6W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:384
        if hFacC6(ii,260,jj)==0
            DIC6N(ii,jj,:) = NaN;
        end
        if hFacC6(ii,1,jj)==0
            DIC6S(ii,jj,:) = NaN;
        end
    end
    for kk=1:260
        if hFacC6(1,kk,jj)==0
            DIC6W(kk,jj,:) = NaN;
        end
        if hFacC6(384,kk,jj)==0
            DIC6E(kk,jj,:) = NaN;
        end
    end
end
save BCs/DIC6BC DIC6* XC6 YC6 RC6
clear DIC*

fid = fopen('AB6_BCs/UVEL_SBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
UVEL6S = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/UVEL_NBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
UVEL6N = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/UVEL_EBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
UVEL6E = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/UVEL_WBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
UVEL6W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:384
        if hFacC6(ii,260,jj)==0
            UVEL6N(ii,jj,:) = NaN;
        end
        if hFacC6(ii,1,jj)==0
            UVEL6S(ii,jj,:) = NaN;
        end
    end
    for kk=1:260
        if hFacC6(1,kk,jj)==0
            UVEL6W(kk,jj,:) = NaN;
        end
        if hFacC6(384,kk,jj)==0
            UVEL6E(kk,jj,:) = NaN;
        end
    end
end
save BCs/UVEL6BC UVEL6* X*6 Y*6 RC6
clear UVEL*

fid = fopen('AB6_BCs/VVEL_SBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
VVEL6S = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/VVEL_NBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[384,52,72]);
fclose(fid);
VVEL6N = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/VVEL_EBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
VVEL6E = U(:,:,49:60);
clear U
fid = fopen('AB6_BCs/VVEL_WBC_2013to2018_monthly_6.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[260,52,72]);
fclose(fid);
VVEL6W = U(:,:,49:60);
clear U
for jj=1:52
    for ii=1:384
        if hFacC6(ii,260,jj)==0
            VVEL6N(ii,jj,:) = NaN;
        end
        if hFacC6(ii,1,jj)==0
            VVEL6S(ii,jj,:) = NaN;
        end
    end
    for kk=1:260
        if hFacC6(1,kk,jj)==0
            VVEL6W(kk,jj,:) = NaN;
        end
        if hFacC6(384,kk,jj)==0
            VVEL6E(kk,jj,:) = NaN;
        end
    end
end
save BCs/VVEL6BC VVEL6* X*6 Y*6 RC6
clear VVEL*

load XY12 X*12 Y*12
RC12 = squeeze(rdmds('../Grids/12/RC'));
% [XC12,RC12] = ndgrid(XC12,RC12);
% [YC12,RC12] = ndgrid(YC12,RC12);
fid = fopen('AB12_BCs/THETA_SBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
THETA12S = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/THETA_NBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
THETA12N = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/THETA_EBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
THETA12E = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/THETA_WBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
THETA12W = U(:,:,49:60);
clear U
for jj=1:104
    for ii=1:756
        if hFacC12(ii,512,jj)==0
            THETA12N(ii,jj,:) = NaN;
        end
        if hFacC12(ii,1,jj)==0
            THETA12S(ii,jj,:) = NaN;
        end
    end
    for kk=1:512
        if hFacC12(1,kk,jj)==0
            THETA12W(kk,jj,:) = NaN;
        end
        if hFacC12(756,kk,jj)==0
            THETA12E(kk,jj,:) = NaN;
        end
    end
end
save BCs/THETA12BC THETA12* XC12 YC12 RC12
clear THETA*

fid = fopen('AB12_BCs/SALT_SBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
SALT12S = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/SALT_NBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
SALT12N = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/SALT_EBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
SALT12E = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/SALT_WBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
SALT12W = U(:,:,49:60);
clear U
for jj=1:104
    for ii=1:756
        if hFacC12(ii,512,jj)==0
            SALT12N(ii,jj,:) = NaN;
        end
        if hFacC12(ii,1,jj)==0
            SALT12S(ii,jj,:) = NaN;
        end
    end
    for kk=1:512
        if hFacC12(1,kk,jj)==0
            SALT12W(kk,jj,:) = NaN;
        end
        if hFacC12(756,kk,jj)==0
            SALT12E(kk,jj,:) = NaN;
        end
    end
end
save BCs/SALT12BC SALT12* XC12 YC12 RC12
clear SALT* 

fid = fopen('AB12_BCs/DIC_SBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
DIC12S = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/DIC_NBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
DIC12N = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/DIC_EBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
DIC12E = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/DIC_WBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
DIC12W = U(:,:,49:60);
clear U
for jj=1:104
    for ii=1:756
        if hFacC12(ii,512,jj)==0
            DIC12N(ii,jj,:) = NaN;
        end
        if hFacC12(ii,1,jj)==0
            DIC12S(ii,jj,:) = NaN;
        end
    end
    for kk=1:512
        if hFacC12(1,kk,jj)==0
            DIC12W(kk,jj,:) = NaN;
        end
        if hFacC12(756,kk,jj)==0
            DIC12E(kk,jj,:) = NaN;
        end
    end
end
save BCs/DIC12BC DIC12* XC12 YC12 RC12
clear DIC*

fid = fopen('AB12_BCs/UVEL_SBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
UVEL12S = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/UVEL_NBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
UVEL12N = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/UVEL_EBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
UVEL12E = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/UVEL_WBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
UVEL12W = U(:,:,49:60);
clear U
for jj=1:104
    for ii=1:756
        if hFacC12(ii,512,jj)==0
            UVEL12N(ii,jj,:) = NaN;
        end
        if hFacC12(ii,1,jj)==0
            UVEL12S(ii,jj,:) = NaN;
        end
    end
    for kk=1:512
        if hFacC12(1,kk,jj)==0
            UVEL12W(kk,jj,:) = NaN;
        end
        if hFacC12(756,kk,jj)==0
            UVEL12E(kk,jj,:) = NaN;
        end
    end
end
save BCs/UVEL12BC UVEL12* X*12 Y*12 RC12
clear UVEL*

fid = fopen('AB12_BCs/VVEL_SBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
VVEL12S = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/VVEL_NBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[756,104,72]);
fclose(fid);
VVEL12N = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/VVEL_EBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
VVEL12E = U(:,:,49:60);
clear U
fid = fopen('AB12_BCs/VVEL_WBC_2013to2018_monthly_12.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[512,104,72]);
fclose(fid);
VVEL12W = U(:,:,49:60);
clear U
for jj=1:104
    for ii=1:756
        if hFacC12(ii,512,jj)==0
            VVEL12N(ii,jj,:) = NaN;
        end
        if hFacC12(ii,1,jj)==0
            VVEL12S(ii,jj,:) = NaN;
        end
    end
    for kk=1:512
        if hFacC12(1,kk,jj)==0
            VVEL12W(kk,jj,:) = NaN;
        end
        if hFacC12(756,kk,jj)==0
            VVEL12E(kk,jj,:) = NaN;
        end
    end
end
save BCs/VVEL12BC VVEL12* X*12 Y*12 RC12
clear VVEL*


%%




toc()