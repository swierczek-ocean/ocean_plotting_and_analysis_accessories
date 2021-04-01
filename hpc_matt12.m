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
str = '../MITgcm/verification/SO12_20190513/diag/';
strb = '../MITgcm/verification/SO12_20190513/diag_budgets/';
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

%% prelim

% select area
x = 17:676;
y = 106:467;
z = 1:2:104; %
% z = 1:36; % top 1000 m

XC12 = XC(x,y);
YC12 = YC(x,y);
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
        if hFacC(ii,jj,41)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

% dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end

area = RAC(x,y);

wvel12 = single(zeros(660,362,52,365));
theta12 = single(zeros(660,362,52,365));
salt12 = single(zeros(660,362,52,365));
dic12 = single(zeros(660,362,52,365));
do12 = single(zeros(660,362,52,365));
wtheta12 = single(zeros(660,362,52));
wsalt12 = single(zeros(660,362,52));
wdic12 = single(zeros(660,362,52));
wdo12 = single(zeros(660,362,52));
wctheta12 = single(zeros(660,362,52));
wcsalt12 = single(zeros(660,362,52));
wcdic12 = single(zeros(660,362,52));
wcdo12 = single(zeros(660,362,52));
etheta12 = single(zeros(660,362,52));
esalt12 = single(zeros(660,362,52));
edic12 = single(zeros(660,362,52));
edo12 = single(zeros(660,362,52));
mwtheta12 = single(zeros(660,362,52));
mwsalt12 = single(zeros(660,362,52));
mwdic12 = single(zeros(660,362,52));
mwdo12 = single(zeros(660,362,52));


for jj=1:365
    fprintf('1/12 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    temp_wvel = single(temp(x,y,z));
    wvel12(:,:,:,jj) = single(temp(x,y,z));
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta12(:,:,:,jj) = single(temp(x,y,z));
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt12(:,:,:,jj) = single(temp(x,y,z));
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12(:,:,:,jj) = single(temp(x,y,z));
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do12(:,:,:,jj) = single(temp(x,y,z));
    clear temp
end

clear char*

vol1000t = sum(volume(:,:,1:36),[1,2,3]);
vol1000 = volume(:,:,1:36);
A = (sum(mean(theta12(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
B = (sum(mean(salt12(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
C = (sum(mean(dic12(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
D = (sum(mean(do12(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
theta12 = theta12 - A;
salt12 = salt12 - B;
dic12 = dic12 - C;
do12 = do12 - D;
save mean_value_12 A B C D

for ii=1:660
    for jj=1:362
        for kk=1:52
            [mwtheta12(ii,jj,kk),etheta12(ii,jj,kk),wtheta12(ii,jj,kk),...
                wctheta12(ii,jj,kk)] = hilo_pass(squeeze(wvel12(ii,jj,kk,:)),...
                squeeze(theta12(ii,jj,kk,:)));
            [mwsalt12(ii,jj,kk),esalt12(ii,jj,kk),wsalt12(ii,jj,kk),...
                wcsalt12(ii,jj,kk)] = hilo_pass(squeeze(wvel12(ii,jj,kk,:)),...
                squeeze(salt12(ii,jj,kk,:)));
            [mwdic12(ii,jj,kk),edic12(ii,jj,kk),wdic12(ii,jj,kk),...
                wcdic12(ii,jj,kk)] = hilo_pass(squeeze(wvel12(ii,jj,kk,:)),...
                squeeze(dic12(ii,jj,kk,:)));
            [mwdo12(ii,jj,kk),edo12(ii,jj,kk),wdo12(ii,jj,kk),...
                wcdo12(ii,jj,kk)] = hilo_pass(squeeze(wvel12(ii,jj,kk,:)),...
                squeeze(do12(ii,jj,kk,:)));
            fprintf('1/12 model hilo pass  ii = %g of 660, jj = %g of 362, kk = %g of 52 \n',ii,jj,kk)
        end
    end
end

clear wvel12 theta12 salt12 dic12 do12

spd = 86400;

vctheta12 = spd.*squeeze(sum(areaTop.*wctheta12,[1,2]))./areaBox;
vcsalt12 = spd.*squeeze(sum(areaTop.*wcsalt12,[1,2]))./areaBox;
vcdic12 = spd.*squeeze(sum(areaTop.*wcdic12,[1,2]))./areaBox;
vcdo12 = spd.*squeeze(sum(areaTop.*wcdo12,[1,2]))./areaBox;
vttheta12 = spd.*squeeze(sum(areaTop.*wtheta12,[1,2]))./areaBox;
vtsalt12 = spd.*squeeze(sum(areaTop.*wsalt12,[1,2]))./areaBox;
vtdic12 = spd.*squeeze(sum(areaTop.*wdic12,[1,2]))./areaBox;
vtdo12 = spd.*squeeze(sum(areaTop.*wdo12,[1,2]))./areaBox;
vmtheta12 = spd.*squeeze(sum(areaTop.*mwtheta12,[1,2]))./areaBox;
vmsalt12 = spd.*squeeze(sum(areaTop.*mwsalt12,[1,2]))./areaBox;
vmdic12 = spd.*squeeze(sum(areaTop.*mwdic12,[1,2]))./areaBox;
vmdo12 = spd.*squeeze(sum(areaTop.*mwdo12,[1,2]))./areaBox;
vetheta12 = spd.*squeeze(sum(areaTop.*etheta12,[1,2]))./areaBox;
vesalt12 = spd.*squeeze(sum(areaTop.*esalt12,[1,2]))./areaBox;
vedic12 = spd.*squeeze(sum(areaTop.*edic12,[1,2]))./areaBox;
vedo12 = spd.*squeeze(sum(areaTop.*edo12,[1,2]))./areaBox;

mwtheta12 = mwtheta12(:,:,20);
etheta12 = etheta12(:,:,20);
wtheta12 = wtheta12(:,:,20);
wctheta12 = wctheta12(:,:,20);

mwsalt12 = mwsalt12(:,:,20);
esalt12 = esalt12(:,:,20);
wsalt12 = wsalt12(:,:,20);
wcsalt12 = wcsalt12(:,:,20);

mwdic12 = mwdic12(:,:,20);
edic12 = edic12(:,:,20);
wdic12 = wdic12(:,:,20);
wcdic12 = wcdic12(:,:,20);

mwdo12 = mwdo12(:,:,20);
edo12 = edo12(:,:,20);
wdo12 = wdo12(:,:,20);
wcdo12 = wcdo12(:,:,20);

save eddy_TSCO3_190m_sm mw*12 e*12 w*12 XC12 YC12

RF12 = RF12(1:2:104);
save eddy_TSCO12 v*12 RC12 RF12

clear









toc()
