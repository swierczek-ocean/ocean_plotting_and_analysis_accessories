clear
close all
clc
tic()


%% 1/3

hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
XC = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC'));
DRF = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/DRF'));
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';

%% prelim

% select area
x = 6:170;
y = 29:119;
z = 1:52; %
% z = 1:36; % top 1000 m
zlist = [9,13,20,23];

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);

for ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,21)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

volume = zeros(nx,ny,nz);
areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

TSW3_60m = zeros(nx,ny,365);
TSW3_100m = zeros(nx,ny,365);
TSW3_190m = zeros(nx,ny,365);
TSW3_250m = zeros(nx,ny,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    temp = temp(x,y,zlist);
    TSW3_60m(:,:,ii) = temp(:,:,1);
    TSW3_100m(:,:,ii) = temp(:,:,2);
    TSW3_190m(:,:,ii) = temp(:,:,3);
    TSW3_250m(:,:,ii) = temp(:,:,4);
    clear temp
end

%% end 1/3

%% 1/6

hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
XC = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
DRF = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/DRF'));
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim

% select area
x = 11:340;
y = 54:235;
z = 1:52; %
% z = 1:36; % top 1000 m
zlist = [9,13,20,23];

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

for ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,21)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

volume = zeros(nx,ny,nz);
areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end
area = sum(sum(areaTop(:,:,1)));

TSW6_60m = zeros(nx,ny,365);
TSW6_100m = zeros(nx,ny,365);
TSW6_190m = zeros(nx,ny,365);
TSW6_250m = zeros(nx,ny,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    temp = temp(x,y,zlist);
    TSW6_60m(:,:,ii) = temp(:,:,1);
    TSW6_100m(:,:,ii) = temp(:,:,2);
    TSW6_190m(:,:,ii) = temp(:,:,3);
    TSW6_250m(:,:,ii) = temp(:,:,4);
    clear temp
end

%% end 1/6


%% 1/12

hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
XC = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
DRF = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/DRF'));
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

% select area
x = 17:676;
y = 106:467;
z = 1:104; %
% z = 1:36; % top 1000 m
zlist = [17,25,39,45];

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
hFacC_ind = hFacC;
[nx,ny,nz] = size(hFacC);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

for ii=1:nx
    for jj=1:ny
        for kk=1:nz
            if hFacC(ii,jj,kk)>0
                hFacC_ind(ii,jj,kk) = 1;
            end
        end
        if hFacC(ii,jj,41)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

volume = zeros(nx,ny,nz);
areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end



TSW12_60m = zeros(nx,ny,365);
TSW12_100m = zeros(nx,ny,365);
TSW12_190m = zeros(nx,ny,365);
TSW12_250m = zeros(nx,ny,365);

for ii=1:365
    charstate = [strs,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    temp = temp(x,y,zlist);
    TSW12_60m(:,:,ii) = temp(:,:,1);
    TSW12_100m(:,:,ii) = temp(:,:,2);
    TSW12_190m(:,:,ii) = temp(:,:,3);
    TSW12_250m(:,:,ii) = temp(:,:,4);
    clear temp
end


%% end 1/12

save PSD_WVEL TSW*

clear






toc()