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
wvel12t = zeros(660,362,52,365);

ind = [1,90,91,182,183,274,275,365];

do12 = zeros(660,362,52,4);
wdo12 = zeros(660,362,52,4);

do12t = zeros(660,362,52,365);

for jj=1:365
    fprintf('1/12 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
    fprintf('1/12 model 2 daily fields iter %g of 365 \n',jj)
    charbgc = [strs,'diag_bgc.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    do12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
end

clear char*

fprintf('1/12 model 2 RD \n')

do12t = do12t - mean(sum(areaTop.*do12t,[1,2])./areaBox,4);

wdo12t = wvel12t.*do12t;

for ii=1:4
    wvel12(:,:,:,ii) = mean(wvel12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    do12(:,:,:,ii) = mean(do12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wdo12(:,:,:,ii) = mean(wdo12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
end

clear *do12t  wvel12t

mwdo12 = wvel12.*do12;

edo12 = wdo12 - mwdo12;


spd = 86400;
vtdo12 = zeros(52,4);
vmdo12 = zeros(52,4);
vedo12 = zeros(52,4);

areaTop = areaTop(:,:,1:2:104);
areaBox = areaBox(1:2:104);

for jj=1:4
    fprintf('do %g \n',jj)
    vtdo12(:,jj) = spd.*squeeze(sum(areaTop.*wdo12(:,:,:,jj),[1,2]))./areaBox;
    vmdo12(:,jj) = spd.*squeeze(sum(areaTop.*mwdo12(:,:,:,jj),[1,2]))./areaBox;
    vedo12(:,jj) = spd.*squeeze(sum(areaTop.*edo12(:,:,:,jj),[1,2]))./areaBox;
end

save eddy_TSCO12_ado v*12 RC12 RF12

clear









toc()