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

XC3 = XC(x,y);
YC3 = YC(x,y);
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

vol1000t = sum(volume(:,:,1:36),[1,2,3]);
vol1000 = volume(:,:,1:36);
A = (sum(mean(theta3(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
B = (sum(mean(salt3(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
C = (sum(mean(dic3(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
D = (sum(mean(do3(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
theta3 = theta3 - A;
salt3 = salt3 - B;
dic3 = dic3 - C;
do3 = do3 - D;
save mean_value_3 A B C D


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

mwtheta3 = mwtheta3(:,:,20);
etheta3 = etheta3(:,:,20);
wtheta3 = wtheta3(:,:,20);
wctheta3 = wctheta3(:,:,20);

mwsalt3 = mwsalt3(:,:,20);
esalt3 = esalt3(:,:,20);
wsalt3 = wsalt3(:,:,20);
wcsalt3 = wcsalt3(:,:,20);

mwdic3 = mwdic3(:,:,20);
edic3 = edic3(:,:,20);
wdic3 = wdic3(:,:,20);
wcdic3 = wcdic3(:,:,20);

mwdo3 = mwdo3(:,:,20);
edo3 = edo3(:,:,20);
wdo3 = wdo3(:,:,20);
wcdo3 = wcdo3(:,:,20);

save eddy_TSCO3_190m_sm mw*3 e*3 w*3 XC3 YC3

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

XC6 = XC(x,y);
YC6 = YC(x,y);
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

vol1000t = sum(volume(:,:,1:36),[1,2,3]);
vol1000 = volume(:,:,1:36);
A = (sum(mean(theta6(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
B = (sum(mean(salt6(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
C = (sum(mean(dic6(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
D = (sum(mean(do6(:,:,1:36,:),4).*vol1000,[1,2,3])./vol1000t);
theta6 = theta6 - A;
salt6 = salt6 - B;
dic6 = dic6 - C;
do6 = do6 - D;
save mean_value_6 A B C D

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

mwtheta6 = mwtheta6(:,:,20);
etheta6 = etheta6(:,:,20);
wtheta6 = wtheta6(:,:,20);
wctheta6 = wctheta6(:,:,20);

mwsalt6 = mwsalt6(:,:,20);
esalt6 = esalt6(:,:,20);
wsalt6 = wsalt6(:,:,20);
wcsalt6 = wcsalt6(:,:,20);

mwdic6 = mwdic6(:,:,20);
edic6 = edic6(:,:,20);
wdic6 = wdic6(:,:,20);
wcdic6 = wcdic6(:,:,20);

mwdo6 = mwdo6(:,:,20);
edo6 = edo6(:,:,20);
wdo6 = wdo6(:,:,20);
wcdo6 = wcdo6(:,:,20);

save eddy_TSCO6_190m_sm mw*6 e*6 w*6 XC6 YC6


RF6 = RF6(1:52);
save eddy_TSCO6 v*6 RC6 RF6

clear

toc()