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

dic12 = zeros(660,362,52,4);
wdic12 = zeros(660,362,52,4);

dic12t = zeros(660,362,52,365);


for jj=1:365
    fprintf('1/12 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
    fprintf('1/12 model 2 daily fields iter %g of 365 \n',jj)
    charbgc = [strs,'diag_bgc.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
end

clear char*

fprintf('1/12 model 2 RD \n')

dic12t = dic12t - mean(sum(areaTop.*dic12t,[1,2])./areaBox,4);

wdic12t = wvel12t.*dic12t;

for ii=1:4
    wvel12(:,:,:,ii) = mean(wvel12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    dic12(:,:,:,ii) = mean(dic12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wdic12(:,:,:,ii) = mean(wdic12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
end

clear *dic12t  wvel12t

mwdic12 = wvel12.*dic12;

edic12 = wdic12 - mwdic12;


spd = 86400;
vtdic12 = zeros(52,4);
vmdic12 = zeros(52,4);
vedic12 = zeros(52,4);

areaTop = areaTop(:,:,1:2:104);
areaBox = areaBox(1:2:104);

for jj=1:4
    fprintf('dic %g \n',jj)
    vtdic12(:,jj) = spd.*squeeze(sum(areaTop.*wdic12(:,:,:,jj),[1,2]))./areaBox;
    vmdic12(:,jj) = spd.*squeeze(sum(areaTop.*mwdic12(:,:,:,jj),[1,2]))./areaBox;
    vedic12(:,jj) = spd.*squeeze(sum(areaTop.*edic12(:,:,:,jj),[1,2]))./areaBox;
end

save eddy_TSCO12_adic v*12 RC12 RF12

clear









toc()