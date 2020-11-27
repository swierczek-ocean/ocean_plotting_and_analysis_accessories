clear
close all
clc
tic()

%% state 

NX = 756;
NY = 512;
NZ = 104;
NR = 5;

SNX = 36;
SNY = 32;
NPX = 21;
NPY = 16;

% state 5, bgc 4, surf 4, airsea 9

lvl = 1;
rec = 1;

iter = 21960:180:109620;

% 1: control

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_state/diag_state';
sst12c = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NZ*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NZ,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            sst12c(rx1:rx2,ry1:ry2,ii) = A(:,:,lvl,rec);
            clear A
        end
    end
    fprintf('SST control completed iteration %g \n',ii)
end

% 2: pert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_state/diag_state';
sst12p = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NZ*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NZ,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            sst12p(rx1:rx2,ry1:ry2,ii) = A(:,:,lvl,rec);
            clear A
        end
    end
    fprintf('SST pert completed iteration %g \n',ii)
end

% 3: npert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_state/diag_state';
sst12n = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NZ*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NZ,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            sst12n(rx1:rx2,ry1:ry2,ii) = A(:,:,lvl,rec);
            clear A
        end
    end
    fprintf('SST negative pert completed iteration %g \n',ii)
end

save SST12 sst12*

clear

%% bgc 

NX = 756;
NY = 512;
NZ = 104;
NR = 4;

SNX = 36;
SNY = 32;
NPX = 21;
NPY = 16;

% state 5, bgc 4, surf 4, airsea 9

lvl = 1;
rec = 1;

iter = 21960:180:109620;

% 1: control

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_bgc/diag_bgc';
dic12c = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NZ*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NZ,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            dic12c(rx1:rx2,ry1:ry2,ii) = A(:,:,lvl,rec);
            clear A
        end
    end
    fprintf('DIC control completed iteration %g \n',ii)
end

% 2: pert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_bgc/diag_bgc';
dic12p = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NZ*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NZ,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            dic12p(rx1:rx2,ry1:ry2,ii) = A(:,:,lvl,rec);
            clear A
        end
    end
    fprintf('DIC pert completed iteration %g \n',ii)
end

% 3: npert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_bgc/diag_bgc';
dic12n = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NZ*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NZ,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            dic12n(rx1:rx2,ry1:ry2,ii) = A(:,:,lvl,rec);
            clear A
        end
    end
    fprintf('DIC negative pert completed iteration %g \n',ii)
end

save DIC12 dic12*

clear

%% surf 

NX = 756;
NY = 512;
NR = 4;

SNX = 36;
SNY = 32;
NPX = 21;
NPY = 16;

% state 5, bgc 4, surf 4, airsea 9

lvl = 1;
rec = 1;

iter = 21960:180:109620;

% 1: control

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_surf/diag_surf';
ssh12c = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            ssh12c(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('SSH control completed iteration %g \n',ii)
end

% 2: pert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_surf/diag_surf';
ssh12p = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            ssh12p(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('SSH pert completed iteration %g \n',ii)
end

% 3: npert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_surf/diag_surf';
ssh12n = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            ssh12n(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('SSH negative pert completed iteration %g \n',ii)
end

save SSH12 ssh12*

clear

%% airsea

NX = 756;
NY = 512;
NR = 9;

SNX = 36;
SNY = 32;
NPX = 21;
NPY = 16;

% state 5, bgc 4, surf 4, airsea 9

lvl = 1;
rec = 3;

iter = 21960:180:109620;

% 1: control

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_airsea/diag_airsea';
cf12c = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            cf12c(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('CF control completed iteration %g \n',ii)
end

% 2: pert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_airsea/diag_airsea';
cf12p = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            cf12p(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('CF pert completed iteration %g \n',ii)
end

% 3: npert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_airsea/diag_airsea';
cf12n = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            cf12n(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('CF negative pert completed iteration %g \n',ii)
end

save CF12 cf12*

clear

%% airsea

NX = 756;
NY = 512;
NR = 9;

SNX = 36;
SNY = 32;
NPX = 21;
NPY = 16;

% state 5, bgc 4, surf 4, airsea 9

lvl = 1;
rec = 1;

iter = 21960:180:109620;

% 1: control

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_02_ctrl/diag_airsea/diag_airsea';
tf12c = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            tf12c(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('TF control completed iteration %g \n',ii)
end

% 2: pert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_03_pert/diag_airsea/diag_airsea';
tf12p = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            tf12p(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('TF pert completed iteration %g \n',ii)
end

% 3: npert

filename = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_airsea/diag_airsea';
tf12n = zeros([NX,NY,488],'single');

for ii=1:488
    for jj=1:NPX
        for kk=1:NPY
            procstr = sprintf('.%010d.%03d.%03d.data',iter(ii),jj,kk);
            
            fid = fopen([filename procstr],'r','b');
            A = fread(fid,SNX*SNY*NR,'single');
            fclose(fid);
            A = reshape(A,[SNX,SNY,NR]);
            rx1 = (jj-1)*SNX+1;
            rx2 = jj*SNX;
            
            ry1 = (kk-1)*SNY+1;
            ry2 = kk*SNY;
            
            tf12n(rx1:rx2,ry1:ry2,ii) = A(:,:,rec);
            clear A
        end
    end
    fprintf('TF negative pert completed iteration %g \n',ii)
end

save TF12 tf12*

clear

toc()