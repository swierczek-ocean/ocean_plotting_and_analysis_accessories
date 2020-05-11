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
RF = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RF'));
DRF = rdmds('../MITgcm/verification/SO3_20190513/run/DRF');
str = '../MITgcm/verification/SO3_20190513/old_diag/';
strb = '../MITgcm/verification/SO3_20190513/old_diag_budgets/';

%% prelim

% select area
x = 6:170;
y = 29:119;
z = 1:52; %
% z = 1:36; % top 1000 m

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



dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

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

theta = zeros(165,91,52,12);
wvel = zeros(165,91,52,12);
dic = zeros(165,91,52,12);
advrth = zeros(165,91,52,12);
advrdic = zeros(165,91,52,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,:,ii) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',5);
    wvel(:,:,:,ii) = temp(x,y,z);
    clear temp
    charbgc = [str,'diag_bgc.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic(:,:,:,ii) = temp(x,y,z);
    clear temp
    charbgc = [strb,'diag_dic_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    advrdic(:,:,:,ii) = temp(x,y,z).*DRF;
    fprintf('size of temp: %g %g %g   size of DRF: %g %g \n',size(temp(x,y,z)),...
        size(DRF))
    clear temp
    charheat = [strb,'diag_T_budget.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charheat,'rec',3);
    advrth(:,:,:,ii) = temp(x,y,z)./area;
    fprintf('size of temp: %g %g %g   size of area: %g %g \n',size(temp(x,y,z)),...
        size(area))
    clear temp
end


wt = theta.*wvel;
wdic = dic.*wvel;
eddyth = advrth - wt;
eddyth2 = eddyth./DRF;
eddydic = advrdic - wdic;
eddydic2 = advrdic./DRF - wdic.*area;


advrth3 = zeros(52,17);
advrdic3 = zeros(52,17);
mwdic3 = zeros(52,17);
mwtheta3 = zeros(52,17);
eddyth3 = zeros(52,17);
eddyth23 = zeros(52,17);
eddydic3 = zeros(52,17);
eddydic23 = zeros(52,17);
spd = 86400;

for ii=1:12
    advrth3(:,ii) = spd.*squeeze(sum(hFacC_ind.*advrth(:,:,:,ii),[1,2]))./areaBox;
    advrdic3(:,ii) = spd.*squeeze(sum(hFacC_ind.*advrdic(:,:,:,ii),[1,2]))./areaBox;
    mwtheta3(:,ii) = spd.*squeeze(sum(areaTop.*wt(:,:,:,ii),[1,2]))./areaBox;
    mwdic3(:,ii) = spd.*squeeze(sum(areaTop.*wdic(:,:,:,ii),[1,2]))./areaBox;
    eddyth3(:,ii) = spd.*squeeze(sum(areaTop.*eddyth(:,:,:,ii),[1,2]))./areaBox;
    eddyth23(:,ii) = spd.*squeeze(sum(hFacC_ind.*eddyth2(:,:,:,ii),[1,2]));
    eddydic3(:,ii) = spd.*squeeze(sum(areaTop.*eddydic(:,:,:,ii),[1,2]))./areaBox;
    eddydic23(:,ii) = spd.*squeeze(sum(hFacC_ind.*eddydic2(:,:,:,ii),[1,2]));
end
A = [1,2,3;4,5,6;7,8,9;10,11,12];

for ii=1:4
    advrth3(:,ii+12) = mean(advrth3(:,A(ii,:)),2);
    advrdic3(:,ii+12) = mean(advrdic3(:,A(ii,:)),2);
    mwtheta3(:,ii+12) = mean(mwtheta3(:,A(ii,:)),2);
    mwdic3(:,ii+12) = mean(mwdic3(:,A(ii,:)),2);
    eddyth3(:,ii+12) = mean(eddyth3(:,A(ii,:)),2);
    eddyth23(:,ii+12) = mean(eddyth23(:,A(ii,:)),2);
    eddydic3(:,ii+12) = mean(eddydic3(:,A(ii,:)),2);
    eddydic23(:,ii+12) = mean(eddydic23(:,A(ii,:)),2);
end

advrth3(:,17) = mean(advrth3(:,1:12),2);
advrdic3(:,17) = mean(advrdic3(:,1:12),2);
mwtheta3(:,17) = mean(mwtheta3(:,1:12),2);
mwdic3(:,17) = mean(mwdic3(:,1:12),2);
eddyth3(:,17) = mean(eddyth3(:,1:12),2);
eddyth23(:,17) = mean(eddyth23(:,1:12),2);
eddydic3(:,17) = mean(eddydic3(:,1:12),2);
eddydic23(:,17) = mean(eddydic23(:,1:12),2);

RC3 = RC;
RF3 = RF(1:52);
DRF3 = squeeze(DRF);

save eddy3new advr*3 mw*3 eddy*3 RF3 DRF3

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
RF = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RF'));
DRF = rdmds('../MITgcm/verification/SO6_20190513/run/DRF');
str = '../MITgcm/verification/SO6_20190513/old_diag/';
strb = '../MITgcm/verification/SO6_20190513/old_diag_budgets/';

%% prelim

% select area
x = 11:340;
y = 54:235;
z = 1:52; %
% z = 1:36; % top 1000 m

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

dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

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

theta = zeros(330,182,52,12);
wvel = zeros(330,182,52,12);
dic = zeros(330,182,52,12);
advrth = zeros(330,182,52,12);
advrdic = zeros(330,182,52,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,:,ii) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',5);
    wvel(:,:,:,ii) = temp(x,y,z);
    clear temp
    charbgc = [str,'diag_bgc.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic(:,:,:,ii) = temp(x,y,z);
    clear temp
    charbgc = [strb,'diag_dic_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    advrdic(:,:,:,ii) = temp(x,y,z).*DRF;
    fprintf('size of temp: %g %g %g   size of DRF: %g %g \n',size(temp(x,y,z)),...
        size(DRF))
    clear temp
    charheat = [strb,'diag_T_budget.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charheat,'rec',3);
    advrth(:,:,:,ii) = temp(x,y,z)./area;
    fprintf('size of temp: %g %g %g   size of area: %g %g \n',size(temp(x,y,z)),...
        size(area))
    clear temp
end


wt = theta.*wvel;
wdic = dic.*wvel;
eddyth = advrth - wt;
eddyth2 = eddyth./DRF;
eddydic = advrdic - wdic;
eddydic2 = advrdic./DRF - wdic.*area;


advrth6 = zeros(52,17);
advrdic6 = zeros(52,17);
mwdic6 = zeros(52,17);
mwtheta6 = zeros(52,17);
eddyth6 = zeros(52,17);
eddyth26 = zeros(52,17);
eddydic6 = zeros(52,17);
eddydic26 = zeros(52,17);
spd = 86400;

for ii=1:12
    advrth6(:,ii) = spd.*squeeze(sum(hFacC_ind.*advrth(:,:,:,ii),[1,2]))./areaBox;
    advrdic6(:,ii) = spd.*squeeze(sum(hFacC_ind.*advrdic(:,:,:,ii),[1,2]))./areaBox;
    mwtheta6(:,ii) = spd.*squeeze(sum(areaTop.*wt(:,:,:,ii),[1,2]))./areaBox;
    mwdic6(:,ii) = spd.*squeeze(sum(areaTop.*wdic(:,:,:,ii),[1,2]))./areaBox;
    eddyth6(:,ii) = spd.*squeeze(sum(areaTop.*eddyth(:,:,:,ii),[1,2]))./areaBox;
    eddyth26(:,ii) = spd.*squeeze(sum(hFacC_ind.*eddyth2(:,:,:,ii),[1,2]));
    eddydic6(:,ii) = spd.*squeeze(sum(areaTop.*eddydic(:,:,:,ii),[1,2]))./areaBox;
    eddydic26(:,ii) = spd.*squeeze(sum(hFacC_ind.*eddydic2(:,:,:,ii),[1,2]));
end

A = [1,2,3;4,5,6;7,8,9;10,11,12];

for ii=1:4
    advrth6(:,ii+12) = mean(advrth6(:,A(ii,:)),2);
    advrdic6(:,ii+12) = mean(advrdic6(:,A(ii,:)),2);
    mwtheta6(:,ii+12) = mean(mwtheta6(:,A(ii,:)),2);
    mwdic6(:,ii+12) = mean(mwdic6(:,A(ii,:)),2);
    eddyth6(:,ii+12) = mean(eddyth6(:,A(ii,:)),2);
    eddyth26(:,ii+12) = mean(eddyth26(:,A(ii,:)),2);
    eddydic6(:,ii+12) = mean(eddydic6(:,A(ii,:)),2);
    eddydic26(:,ii+12) = mean(eddydic26(:,A(ii,:)),2);
end

advrth6(:,17) = mean(advrth6(:,1:12),2);
advrdic6(:,17) = mean(advrdic6(:,1:12),2);
mwtheta6(:,17) = mean(mwtheta6(:,1:12),2);
mwdic6(:,17) = mean(mwdic6(:,1:12),2);
eddyth6(:,17) = mean(eddyth6(:,1:12),2);
eddyth26(:,17) = mean(eddyth26(:,1:12),2);
eddydic6(:,17) = mean(eddydic6(:,1:12),2);
eddydic26(:,17) = mean(eddydic26(:,1:12),2);

RC6 = RC;
RF6 = RF(1:52);
DRF6 = squeeze(DRF);

save eddy6new advr*6 mw*6 eddy*6 RF6 DRF6

clear

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
RF = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RF'));
DRF = rdmds('../MITgcm/verification/SO12_20190513/run/DRF');
str = '../MITgcm/verification/SO12_20190513/old_diag/';
strb = '../MITgcm/verification/SO12_20190513/old_diag_budgets/';

%% prelim
nt = 12;

% select area
x = 17:676;
y = 106:467;
z = 1:104; %
% z = 1:36; % top 1000 m

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
        if hFacC(ii,jj,82)<1
            hFacC_ind(ii,jj,:) = 0;
        end
    end
end

dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

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

theta = zeros(660,362,104,12);
wvel = zeros(660,362,104,12);
dic = zeros(660,362,104,12);
advrth = zeros(660,362,104,12);
advrdic = zeros(660,362,104,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,:,ii) = temp(x,y,z);
    clear temp
    temp = rdmds(charstate,'rec',5);
    wvel(:,:,:,ii) = temp(x,y,z);
    clear temp
    charbgc = [str,'diag_bgc.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic(:,:,:,ii) = temp(x,y,z);
    clear temp
    charbgc = [strb,'diag_dic_budget.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charbgc,'rec',3);
    advrdic(:,:,:,ii) = temp(x,y,z).*DRF;
    fprintf('size of temp: %g %g %g   size of DRF: %g %g \n',size(temp(x,y,z)),...
        size(DRF))
    clear temp
    charheat = [strb,'diag_T_budget.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charheat,'rec',3);
    advrth(:,:,:,ii) = temp(x,y,z)./area;
    fprintf('size of temp: %g %g %g   size of area: %g %g \n',size(temp(x,y,z)),...
        size(area))
    clear temp
end


wt = theta.*wvel;
wdic = dic.*wvel;
eddyth = advrth - wt;
eddyth2 = eddyth./DRF;
eddydic = advrdic - wdic;
eddydic2 = advrdic./DRF - wdic.*area;


advrth12 = zeros(104,17);
advrdic12 = zeros(104,17);
mwdic12 = zeros(104,17);
mwtheta12 = zeros(104,17);
eddyth12 = zeros(104,17);
eddyth212 = zeros(104,17);
eddydic12 = zeros(104,17);
eddydic212 = zeros(104,17);
spd = 86400;

for ii=1:12
    advrth12(:,ii) = spd.*squeeze(sum(hFacC_ind.*advrth(:,:,:,ii),[1,2]))./areaBox;
    advrdic12(:,ii) = spd.*squeeze(sum(hFacC_ind.*advrdic(:,:,:,ii),[1,2]))./areaBox;
    mwtheta12(:,ii) = spd.*squeeze(sum(areaTop.*wt(:,:,:,ii),[1,2]))./areaBox;
    mwdic12(:,ii) = spd.*squeeze(sum(areaTop.*wdic(:,:,:,ii),[1,2]))./areaBox;
    eddyth12(:,ii) = spd.*squeeze(sum(areaTop.*eddyth(:,:,:,ii),[1,2]))./areaBox;
    eddyth212(:,ii) = spd.*squeeze(sum(hFacC_ind.*eddyth2(:,:,:,ii),[1,2]));
    eddydic12(:,ii) = spd.*squeeze(sum(areaTop.*eddydic(:,:,:,ii),[1,2]))./areaBox;
    eddydic212(:,ii) = spd.*squeeze(sum(hFacC_ind.*eddydic2(:,:,:,ii),[1,2]));
end

A = [1,2,3;4,5,6;7,8,9;10,11,12];

for ii=1:4
    advrth12(:,ii+12) = mean(advrth12(:,A(ii,:)),2);
    advrdic12(:,ii+12) = mean(advrdic12(:,A(ii,:)),2);
    mwtheta12(:,ii+12) = mean(mwtheta12(:,A(ii,:)),2);
    mwdic12(:,ii+12) = mean(mwdic12(:,A(ii,:)),2);
    eddyth12(:,ii+12) = mean(eddyth12(:,A(ii,:)),2);
    eddyth212(:,ii+12) = mean(eddyth212(:,A(ii,:)),2);
    eddydic12(:,ii+12) = mean(eddydic12(:,A(ii,:)),2);
    eddydic212(:,ii+12) = mean(eddydic212(:,A(ii,:)),2);
end

advrth12(:,17) = mean(advrth12(:,1:12),2);
advrdic12(:,17) = mean(advrdic12(:,1:12),2);
mwtheta12(:,17) = mean(mwtheta12(:,1:12),2);
mwdic12(:,17) = mean(mwdic12(:,1:12),2);
eddyth12(:,17) = mean(eddyth12(:,1:12),2);
eddyth212(:,17) = mean(eddyth212(:,1:12),2);
eddydic12(:,17) = mean(eddydic12(:,1:12),2);
eddydic212(:,17) = mean(eddydic212(:,1:12),2);

RC12 = RC;
RF12 = RF(1:52);
DRF12 = squeeze(DRF);

save eddy12new advr*12 mw*12 eddy*12 RF12 DRF12

clear


toc()