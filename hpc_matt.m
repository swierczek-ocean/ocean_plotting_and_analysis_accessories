clear
close all
clc
tic()

hFacC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO3_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO3_20190513/run/hFacS');
DXG = rdmds('../MITgcm/verification/SO3_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO3_20190513/run/DYG');
DXC = rdmds('../MITgcm/verification/SO3_20190513/run/DXC');
DYC = rdmds('../MITgcm/verification/SO3_20190513/run/DYC');
XC = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RC'));
RF3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RF'));
DRF = rdmds('../MITgcm/verification/SO3_20190513/run/DRF');
str = '../MITgcm/verification/SO3_20190513/diag/';
strb = '../MITgcm/verification/SO3_20190513/diag_budgets/';
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';

%% prelim

% select area
x = 6:170;
y = 29:119;
z = 1:52; %
% z = 1:36; % top 1000 m

XC = XC(x,y);
YC = YC(x,y);
RC3 = RC(z);
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


wvel3 = zeros(165,91,52,365);
theta3 = zeros(165,91,52,365);
salt3 = zeros(165,91,52,365);
dic3 = zeros(165,91,52,365);
do3 = zeros(165,91,52,365);
wtheta3 = zeros(165,91,52);
wsalt3 = zeros(165,91,52);
wdic3 = zeros(165,91,52);
wdo3 = zeros(165,91,52);
wctheta3 = zeros(165,91,52);
wcsalt3 = zeros(165,91,52);
wcdic3 = zeros(165,91,52);
wcdo3 = zeros(165,91,52);
etheta3 = zeros(165,91,52);
esalt3 = zeros(165,91,52);
edic3 = zeros(165,91,52);
edo3 = zeros(165,91,52);
mwtheta3 = zeros(165,91,52);
mwsalt3 = zeros(165,91,52);
mwdic3 = zeros(165,91,52);
mwdo3 = zeros(165,91,52);


for jj=1:365
    fprintf('1/3 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(48*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel3(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta3(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt3(:,:,:,jj) = temp(x,y,z);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(48*(jj+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic3(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do3(:,:,:,jj) = temp(x,y,z);
    clear temp
end

clear char*

for ii=1:165
    for jj=1:91
        for kk=1:52
            [mwtheta3(ii,jj,kk),etheta3(ii,jj,kk),wtheta3(ii,jj,kk),...
                wctheta3(ii,jj,kk)] = hilo_pass(squeeze(wvel3(ii,jj,kk,:)),...
                squeeze(theta3(ii,jj,kk,:)));
            [mwsalt3(ii,jj,kk),esalt3(ii,jj,kk),wsalt3(ii,jj,kk),...
                wcsalt3(ii,jj,kk)] = hilo_pass(squeeze(wvel3(ii,jj,kk,:)),...
                squeeze(salt3(ii,jj,kk,:)));
            [mwdic3(ii,jj,kk),edic3(ii,jj,kk),wdic3(ii,jj,kk),...
                wcdic3(ii,jj,kk)] = hilo_pass(squeeze(wvel3(ii,jj,kk,:)),...
                squeeze(dic3(ii,jj,kk,:)));
            [mwdo3(ii,jj,kk),edo3(ii,jj,kk),wdo3(ii,jj,kk),...
                wcdo3(ii,jj,kk)] = hilo_pass(squeeze(wvel3(ii,jj,kk,:)),...
                squeeze(do3(ii,jj,kk,:)));
        end
    end
end

spd = 86400;

vctheta3 = spd.*squeeze(sum(areaTop.*wctheta3,[1,2]))./areaBox;
vcsalt3 = spd.*squeeze(sum(areaTop.*wcsalt3,[1,2]))./areaBox;
vcdic3 = spd.*squeeze(sum(areaTop.*wcdic3,[1,2]))./areaBox;
vcdo3 = spd.*squeeze(sum(areaTop.*wcdo3,[1,2]))./areaBox;
vttheta3 = spd.*squeeze(sum(areaTop.*wtheta3,[1,2]))./areaBox;
vtsalt3 = spd.*squeeze(sum(areaTop.*wsalt3,[1,2]))./areaBox;
vtdic3 = spd.*squeeze(sum(areaTop.*wdic3,[1,2]))./areaBox;
vtdo3 = spd.*squeeze(sum(areaTop.*wdo3,[1,2]))./areaBox;
vmtheta3 = spd.*squeeze(sum(areaTop.*mwtheta3,[1,2]))./areaBox;
vmsalt3 = spd.*squeeze(sum(areaTop.*mwsalt3,[1,2]))./areaBox;
vmdic3 = spd.*squeeze(sum(areaTop.*mwdic3,[1,2]))./areaBox;
vmdo3 = spd.*squeeze(sum(areaTop.*mwdo3,[1,2]))./areaBox;
vetheta3 = spd.*squeeze(sum(areaTop.*etheta3,[1,2]))./areaBox;
vesalt3 = spd.*squeeze(sum(areaTop.*esalt3,[1,2]))./areaBox;
vedic3 = spd.*squeeze(sum(areaTop.*edic3,[1,2]))./areaBox;
vedo3 = spd.*squeeze(sum(areaTop.*edo3,[1,2]))./areaBox;

RF3 = RF3(1:52);
save eddy_TSCO3 v*3 RC3 RF3

clear

hFacC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
hFacW = rdmds('../MITgcm/verification/SO6_20190513/run/hFacW');
hFacS = rdmds('../MITgcm/verification/SO6_20190513/run/hFacS');
DXG = rdmds('../MITgcm/verification/SO6_20190513/run/DXG');
DYG = rdmds('../MITgcm/verification/SO6_20190513/run/DYG');
DXC = rdmds('../MITgcm/verification/SO6_20190513/run/DXC');
DYC = rdmds('../MITgcm/verification/SO6_20190513/run/DYC');
XC = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
RAC = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RAC'));
RC = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RC'));
RF6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RF'));
DRF = rdmds('../MITgcm/verification/SO6_20190513/run/DRF');
str = '../MITgcm/verification/SO6_20190513/old_diag/';
strb = '../MITgcm/verification/SO6_20190513/old_diag_budgets/';
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

%% prelim

% select area
x = 11:340;
y = 54:235;
z = 1:52; %
% z = 1:36; % top 1000 m

XC = XC(x,y);
YC = YC(x,y);
RC6 = RC(z);
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

wvel6 = zeros(330,182,52,365);
theta6 = zeros(330,182,52,365);
salt6 = zeros(330,182,52,365);
dic6 = zeros(330,182,52,365);
do6 = zeros(330,182,52,365);
wtheta6 = zeros(330,182,52);
wsalt6 = zeros(330,182,52);
wdic6 = zeros(330,182,52);
wdo6 = zeros(330,182,52);
wctheta6 = zeros(330,182,52);
wcsalt6 = zeros(330,182,52);
wcdic6 = zeros(330,182,52);
wcdo6 = zeros(330,182,52);
etheta6 = zeros(330,182,52);
esalt6 = zeros(330,182,52);
edic6 = zeros(330,182,52);
edo6 = zeros(330,182,52);
mwtheta6 = zeros(330,182,52);
mwsalt6 = zeros(330,182,52);
mwdic6 = zeros(330,182,52);
mwdo6 = zeros(330,182,52);


for jj=1:365
    fprintf('1/6 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(72*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel6(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta6(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt6(:,:,:,jj) = temp(x,y,z);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(72*(jj+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic6(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do6(:,:,:,jj) = temp(x,y,z);
    clear temp
end

clear char*

for ii=1:330
    for jj=1:182
        for kk=1:52
            [mwtheta6(ii,jj,kk),etheta6(ii,jj,kk),wtheta6(ii,jj,kk),...
                wctheta6(ii,jj,kk)] = hilo_pass(squeeze(wvel6(ii,jj,kk,:)),...
                squeeze(theta6(ii,jj,kk,:)));
            [mwsalt6(ii,jj,kk),esalt6(ii,jj,kk),wsalt6(ii,jj,kk),...
                wcsalt6(ii,jj,kk)] = hilo_pass(squeeze(wvel6(ii,jj,kk,:)),...
                squeeze(salt6(ii,jj,kk,:)));
            [mwdic6(ii,jj,kk),edic6(ii,jj,kk),wdic6(ii,jj,kk),...
                wcdic6(ii,jj,kk)] = hilo_pass(squeeze(wvel6(ii,jj,kk,:)),...
                squeeze(dic6(ii,jj,kk,:)));
            [mwdo6(ii,jj,kk),edo6(ii,jj,kk),wdo6(ii,jj,kk),...
                wcdo6(ii,jj,kk)] = hilo_pass(squeeze(wvel6(ii,jj,kk,:)),...
                squeeze(do6(ii,jj,kk,:)));
        end
    end
end

spd = 86400;

vctheta6 = spd.*squeeze(sum(areaTop.*wctheta6,[1,2]))./areaBox;
vcsalt6 = spd.*squeeze(sum(areaTop.*wcsalt6,[1,2]))./areaBox;
vcdic6 = spd.*squeeze(sum(areaTop.*wcdic6,[1,2]))./areaBox;
vcdo6 = spd.*squeeze(sum(areaTop.*wcdo6,[1,2]))./areaBox;
vttheta6 = spd.*squeeze(sum(areaTop.*wtheta6,[1,2]))./areaBox;
vtsalt6 = spd.*squeeze(sum(areaTop.*wsalt6,[1,2]))./areaBox;
vtdic6 = spd.*squeeze(sum(areaTop.*wdic6,[1,2]))./areaBox;
vtdo6 = spd.*squeeze(sum(areaTop.*wdo6,[1,2]))./areaBox;
vmtheta6 = spd.*squeeze(sum(areaTop.*mwtheta6,[1,2]))./areaBox;
vmsalt6 = spd.*squeeze(sum(areaTop.*mwsalt6,[1,2]))./areaBox;
vmdic6 = spd.*squeeze(sum(areaTop.*mwdic6,[1,2]))./areaBox;
vmdo6 = spd.*squeeze(sum(areaTop.*mwdo6,[1,2]))./areaBox;
vetheta6 = spd.*squeeze(sum(areaTop.*etheta6,[1,2]))./areaBox;
vesalt6 = spd.*squeeze(sum(areaTop.*esalt6,[1,2]))./areaBox;
vedic6 = spd.*squeeze(sum(areaTop.*edic6,[1,2]))./areaBox;
vedo6 = spd.*squeeze(sum(areaTop.*edo6,[1,2]))./areaBox;

RF6 = RF6(1:52);
save eddy_TSCO6 v*6 RC6 RF6

clear

toc()