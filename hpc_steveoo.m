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
str = '../MITgcm/verification/SO3_20190513/old_diag/';
strb = '../MITgcm/verification/SO3_20190513/old_diag_budgets/';
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


advrth_t = zeros(165,91,52,12);
advrsa_t = zeros(165,91,52,12);
advrdic_t = zeros(165,91,52,12);
advrdo_t = zeros(165,91,52,12);

for ii=1:12
    fprintf('1/3 model advr fields iter %g of 12 \n',ii)
    charbgc = [strb,'diag_dic_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    advrdic_t(:,:,:,ii) = temp(x,y,z);
    clear temp
    charheat = [strb,'diag_T_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charheat,'rec',3);
    advrth_t(:,:,:,ii) = temp(x,y,z);
    clear temp
    charsalt = [strb,'diag_S_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charheat,'rec',3);
    advrsa_t(:,:,:,ii) = temp(x,y,z);
    clear temp
    charbgc = [strb,'diag_o2_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    advrdo_t(:,:,:,ii) = temp(x,y,z);
    clear temp
end

clear char*

advrth3 = zeros(165,91,52,4);
advrsa3 = zeros(165,91,52,4);
advrdic3 = zeros(165,91,52,4);
advrdo3 = zeros(165,91,52,4);

A = [1,2,3;4,5,6;7,8,9;10,11,12];

for ii=1:4
    fprintf('1/3 model advr fields averaging iter %g of 4 \n',ii)
    advrth3(:,:,:,ii) = mean(advrth_t(:,:,:,A(ii,:)),4);
    advrsa3(:,:,:,ii) = mean(advrsa_t(:,:,:,A(ii,:)),4);
    advrdic3(:,:,:,ii) = mean(advrdic_t(:,:,:,A(ii,:)),4);
    advrdo3(:,:,:,ii) = mean(advrdo_t(:,:,:,A(ii,:)),4);
end

clear advr*_t

wvel3 = zeros(165,91,52,4);
theta3 = zeros(165,91,52,4);
salt3 = zeros(165,91,52,4);
dic3 = zeros(165,91,52,4);
do3 = zeros(165,91,52,4);
wtheta3 = zeros(165,91,52,4);
wsalt3 = zeros(165,91,52,4);
wdic3 = zeros(165,91,52,4);
wdo3 = zeros(165,91,52,4);

wvel3t = zeros(165,91,52,365);
theta3t = zeros(165,91,52,365);
salt3t = zeros(165,91,52,365);
dic3t = zeros(165,91,52,365);
do3t = zeros(165,91,52,365);


for jj=1:365
    fprintf('1/3 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(48*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    
    wvel3t(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta3t(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt3t(:,:,:,jj) = temp(x,y,z);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(48*(jj+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic3t(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do3t(:,:,:,jj) = temp(x,y,z);
    clear temp
end

clear char*

fprintf('1/3 model RD \n')

theta3t = theta3t - mean(sum(areaTop.*theta3t,[1,2])./areaBox,4);
salt3t = salt3t - mean(sum(areaTop.*salt3t,[1,2])./areaBox,4);
dic3t = dic3t - mean(sum(areaTop.*dic3t,[1,2])./areaBox,4);
do3t = do3t - mean(sum(areaTop.*do3t,[1,2])./areaBox,4);

wtheta3t = wvel3t.*theta3t;
wsalt3t = wvel3t.*salt3t;
wdic3t = wvel3t.*dic3t;
wdo3t = wvel3t.*do3t;

ind = [1,90,91,182,183,274,275,365];

for ii=1:4
    wvel3(:,:,:,ii) = mean(wvel3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    theta3(:,:,:,ii) = mean(theta3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    salt3(:,:,:,ii) = mean(salt3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    dic3(:,:,:,ii) = mean(dic3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    do3(:,:,:,ii) = mean(do3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wtheta3(:,:,:,ii) = mean(wtheta3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wsalt3(:,:,:,ii) = mean(wsalt3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wdic3(:,:,:,ii) = mean(wdic3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wdo3(:,:,:,ii) = mean(wdo3t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
end


clear *3t


mwtheta3 = wvel3.*theta3;
mwsalt3 = wvel3.*salt3;
mwdic3 = wvel3.*dic3;
mwdo3 = wvel3.*do3;

etheta3 = wtheta3 - mwtheta3;
esalt3 = wsalt3 - mwsalt3;
edic3 = wdic3 - mwdic3;
edo3 = wdo3 - mwdo3;

spd = 86400;
vttheta3 = zeros(52,4);
vtsalt3 = zeros(52,4);
vtdic3 = zeros(52,4);
vtdo3 = zeros(52,4);
vmtheta3 = zeros(52,4);
vmsalt3 = zeros(52,4);
vmdic3 = zeros(52,4);
vmdo3 = zeros(52,4);
vetheta3 = zeros(52,4);
vesalt3 = zeros(52,4);
vedic3 = zeros(52,4);
vedo3 = zeros(52,4);

for jj=1:4
    fprintf('A1 %g \n',jj)
    vttheta3(:,jj) = spd.*squeeze(sum(areaTop.*wtheta3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A2 %g \n',jj)
    vtsalt3(:,jj) = spd.*squeeze(sum(areaTop.*wsalt3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A3 %g \n',jj)
    vtdic3(:,jj) = spd.*squeeze(sum(areaTop.*wdic3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A4 %g \n',jj)
    vtdo3(:,jj) = spd.*squeeze(sum(areaTop.*wdo3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A5 %g \n',jj)
    vmtheta3(:,jj) = spd.*squeeze(sum(areaTop.*mwtheta3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A6 %g \n',jj)
    vmsalt3(:,jj) = spd.*squeeze(sum(areaTop.*mwsalt3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A7 %g \n',jj)
    vmdic3(:,jj) = spd.*squeeze(sum(areaTop.*mwdic3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A8 %g \n',jj)
    vmdo3(:,jj) = spd.*squeeze(sum(areaTop.*mwdo3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A9 %g \n',jj)
    vetheta3(:,jj) = spd.*squeeze(sum(areaTop.*etheta3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A10 %g \n',jj)
    vesalt3(:,jj) = spd.*squeeze(sum(areaTop.*esalt3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A11 %g \n',jj)
    vedic3(:,jj) = spd.*squeeze(sum(areaTop.*edic3(:,:,:,jj),[1,2]))./areaBox;
    fprintf('A12 %g \n',jj)
    vedo3(:,jj) = spd.*squeeze(sum(areaTop.*edo3(:,:,:,jj),[1,2]))./areaBox;
end

save eddy_TSCO3_a v*3 RC3 RF3

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


advrth_t = zeros(330,182,52,12);
advrsa_t = zeros(330,182,52,12);
advrdic_t = zeros(330,182,52,12);
advrdo_t = zeros(330,182,52,12);

for ii=1:12
    fprintf('1/6 model advr fields iter %g of 12 \n',ii)
    charbgc = [strb,'diag_dic_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    advrdic_t(:,:,:,ii) = temp(x,y,z);
    clear temp
    charheat = [strb,'diag_T_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charheat,'rec',3);
    advrth_t(:,:,:,ii) = temp(x,y,z);
    clear temp
    charsalt = [strb,'diag_S_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charheat,'rec',3);
    advrsa_t(:,:,:,ii) = temp(x,y,z);
    clear temp
    charbgc = [strb,'diag_o2_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    advrdo_t(:,:,:,ii) = temp(x,y,z);
    clear temp
end

clear char*

advrth6 = zeros(330,182,52,4);
advrsa6 = zeros(330,182,52,4);
advrdic6 = zeros(330,182,52,4);
advrdo6 = zeros(330,182,52,4);

A = [1,2,3;4,5,6;7,8,9;10,11,12];

for ii=1:4
    fprintf('1/6 model advr seasonal averaging iter %g of 4 \n',ii)
    advrth6(:,:,:,ii) = mean(advrth_t(:,:,:,A(ii,:)),4);
    advrsa6(:,:,:,ii) = mean(advrsa_t(:,:,:,A(ii,:)),4);
    advrdic6(:,:,:,ii) = mean(advrdic_t(:,:,:,A(ii,:)),4);
    advrdo6(:,:,:,ii) = mean(advrdo_t(:,:,:,A(ii,:)),4);
end

clear advr*_t

wvel6 = zeros(330,182,52,4);
theta6 = zeros(330,182,52,4);
salt6 = zeros(330,182,52,4);
dic6 = zeros(330,182,52,4);
do6 = zeros(330,182,52,4);
wtheta6 = zeros(330,182,52,4);
wsalt6 = zeros(330,182,52,4);
wdic6 = zeros(330,182,52,4);
wdo6 = zeros(330,182,52,4);

wvel6t = zeros(330,182,52,365);
theta6t = zeros(330,182,52,365);
salt6t = zeros(330,182,52,365);
dic6t = zeros(330,182,52,365);
do6t = zeros(330,182,52,365);


for jj=1:365
    fprintf('1/6 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(72*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    
    wvel6t(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta6t(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt6t(:,:,:,jj) = temp(x,y,z);
    clear temp
    charbgc = [strs,'diag_bgc.',num2str(72*(jj+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic6t(:,:,:,jj) = temp(x,y,z);
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do6t(:,:,:,jj) = temp(x,y,z);
    clear temp
end

clear char*

fprintf('1/6 model RD \n')

theta6t = theta6t - mean(sum(areaTop.*theta6t,[1,2])./areaBox,4);
salt6t = salt6t - mean(sum(areaTop.*salt6t,[1,2])./areaBox,4);
dic6t = dic6t - mean(sum(areaTop.*dic6t,[1,2])./areaBox,4);
do6t = do6t - mean(sum(areaTop.*do6t,[1,2])./areaBox,4);

wtheta6t = wvel6t.*theta6t;
wsalt6t = wvel6t.*salt6t;
wdic6t = wvel6t.*dic6t;
wdo6t = wvel6t.*do6t;

ind = [1,90,91,182,183,274,275,365];

for ii=1:4
    wvel6(:,:,:,ii) = mean(wvel6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    theta6(:,:,:,ii) = mean(theta6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    salt6(:,:,:,ii) = mean(salt6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    dic6(:,:,:,ii) = mean(dic6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    do6(:,:,:,ii) = mean(do6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wtheta6(:,:,:,ii) = mean(wtheta6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wsalt6(:,:,:,ii) = mean(wsalt6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wdic6(:,:,:,ii) = mean(wdic6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wdo6(:,:,:,ii) = mean(wdo6t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
end

clear *6t

mwtheta6 = wvel6.*theta6;
mwsalt6 = wvel6.*salt6;
mwdic6 = wvel6.*dic6;
mwdo6 = wvel6.*do6;

etheta6 = wtheta6 - mwtheta6;
esalt6 = wsalt6 - mwsalt6;
edic6 = wdic6 - mwdic6;
edo6 = wdo6 - mwdo6;

spd = 86400;
vttheta6 = zeros(52,4);
vtsalt6 = zeros(52,4);
vtdic6 = zeros(52,4);
vtdo6 = zeros(52,4);
vmtheta6 = zeros(52,4);
vmsalt6 = zeros(52,4);
vmdic6 = zeros(52,4);
vmdo6 = zeros(52,4);
vetheta6 = zeros(52,4);
vesalt6 = zeros(52,4);
vedic6 = zeros(52,4);
vedo6 = zeros(52,4);

for jj=1:4
    fprintf('B1 %g \n',jj)
    vttheta6(:,jj) = spd.*squeeze(sum(areaTop.*wtheta6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B2 %g \n',jj)
    vtsalt6(:,jj) = spd.*squeeze(sum(areaTop.*wsalt6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B3 %g \n',jj)
    vtdic6(:,jj) = spd.*squeeze(sum(areaTop.*wdic6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B4 %g \n',jj)
    vtdo6(:,jj) = spd.*squeeze(sum(areaTop.*wdo6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B5 %g \n',jj)
    vmtheta6(:,jj) = spd.*squeeze(sum(areaTop.*mwtheta6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B6 %g \n',jj)
    vmsalt6(:,jj) = spd.*squeeze(sum(areaTop.*mwsalt6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B7 %g \n',jj)
    vmdic6(:,jj) = spd.*squeeze(sum(areaTop.*mwdic6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B8 %g \n',jj)
    vmdo6(:,jj) = spd.*squeeze(sum(areaTop.*mwdo6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B9 %g \n',jj)
    vetheta6(:,jj) = spd.*squeeze(sum(areaTop.*etheta6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B10 %g \n',jj)
    vesalt6(:,jj) = spd.*squeeze(sum(areaTop.*esalt6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B11 %g \n',jj)
    vedic6(:,jj) = spd.*squeeze(sum(areaTop.*edic6(:,:,:,jj),[1,2]))./areaBox;
    fprintf('B12 %g \n',jj)
    vedo6(:,jj) = spd.*squeeze(sum(areaTop.*edo6(:,:,:,jj),[1,2]))./areaBox;
end

save eddy_TSCO6_a v*6 RC6


toc()