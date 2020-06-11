clear
close all
clc
tic()

hFacC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO12_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO12_20190513/run/hFacS');
DXG = rdmds('../MITgcm/verification/SO12_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO12_20190513/run/DYG');
DXC = rdmds('../MITgcm/verification/SO12_20190513/run/DXC');
DYC = rdmds('../MITgcm/verification/SO12_20190513/run/DYC');
XC = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RC'));
RF12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RF'));
DRF = rdmds('../MITgcm/verification/SO12_20190513/run/DRF');
str = '../MITgcm/verification/SO12_20190513/old_diag/';
strb = '../MITgcm/verification/SO12_20190513/old_diag_budgets/';
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

% select area
x = 17:676;
y = 106:467;
z = 1:104; %

XC = XC(x,y);
YC = YC(x,y);
RC12 = RC(z);
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
        if hFacC(ii,jj,82)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

area = RAC(x,y);


wvel12 = zeros(660,362,52,4);
salt12 = zeros(660,362,52,4);
wsalt12 = zeros(660,362,52,4);

wvel12t = zeros(660,362,52,365);
salt12t = zeros(660,362,52,365);


for jj=1:365
    fprintf('1/12 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
end

clear char*

fprintf('1/12 model RD \n')

salt12t = salt12t - mean(sum(areaTop.*salt12t,[1,2])./areaBox,4);

wsalt12t = wvel12t.*salt12t;

ind = [1,90,91,182,183,274,275,365];

for ii=1:4
    wvel12(:,:,:,ii) = mean(wvel12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    salt12(:,:,:,ii) = mean(salt12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wsalt12(:,:,:,ii) = mean(wsalt12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
end

clear *salt12t

fprintf('1/12 model RD \n')

mwsalt12 = wvel12.*salt12;

esalt12 = wsalt12 - mwsalt12;


spd = 86400;
vtsalt12 = zeros(52,4);
vmsalt12 = zeros(52,4);
vesalt12 = zeros(52,4);

areaTop = areaTop(:,:,1:2:104);
areaBox = areaBox(1:2:104);

for jj=1:4
    fprintf('salt %g \n',jj)
    vtsalt12(:,jj) = spd.*squeeze(sum(areaTop.*wsalt12(:,:,:,jj),[1,2]))./areaBox;
    vmsalt12(:,jj) = spd.*squeeze(sum(areaTop.*mwsalt12(:,:,:,jj),[1,2]))./areaBox;
    vesalt12(:,jj) = spd.*squeeze(sum(areaTop.*esalt12(:,:,:,jj),[1,2]))./areaBox;
end

save eddy_TSCO12_as v*12

clear









toc()