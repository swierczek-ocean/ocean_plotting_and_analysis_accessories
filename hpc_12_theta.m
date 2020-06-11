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
% z = 1:36; % top 1000 m

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

volume = zeros(nx,ny,nz);
areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

area = RAC(x,y);


% advrth_t = zeros(660,362,52,12);
% advrsa_t = zeros(660,362,52,12);
% advrdic_t = zeros(660,362,52,12);
% advrdo_t = zeros(660,362,52,12);
% 
% for ii=1:12
%     fprintf('1/12 model advr fields iter %g of 12 \n',ii)
%     charbgc = [strb,'diag_dic_budget.',num2str(10950*(ii+1),'%010.f')];
%     temp = rdmds(charbgc,'rec',3);
%     advrdic_t(:,:,:,ii) = temp(x,y,z);
%     clear temp
%     charheat = [strb,'diag_T_budget.',num2str(10950*(ii+1),'%010.f')];
%     temp = rdmds(charheat,'rec',3);
%     advrth_t(:,:,:,ii) = temp(x,y,z);
%     clear temp
%     charsalt = [strb,'diag_S_budget.',num2str(10950*(ii+1),'%010.f')];
%     temp = rdmds(charheat,'rec',3);
%     advrsa_t(:,:,:,ii) = temp(x,y,z);
%     clear temp
%     charbgc = [strb,'diag_o2_budget.',num2str(10950*(ii+1),'%010.f')];
%     temp = rdmds(charbgc,'rec',3);
%     advrdo_t(:,:,:,ii) = temp(x,y,z);
%     clear temp
% end
% 
% clear char*
% 
% advrth12 = zeros(660,362,52,4);
% advrsa12 = zeros(660,362,52,4);
% advrdic12 = zeros(660,362,52,4);
% advrdo12 = zeros(660,362,52,4);
% 
% A = [1,2,3;4,5,6;7,8,9;10,11,12];
% 
% for ii=1:4
%     fprintf('1/12 model advr seasonal iter %g of 4 \n',ii)
%     advrth12(:,:,:,ii) = mean(advrth_t(:,:,1:2:104,A(ii,:)),4);
%     advrsa12(:,:,:,ii) = mean(advrsa_t(:,:,1:2:104,A(ii,:)),4);
%     advrdic12(:,:,:,ii) = mean(advrdic_t(:,:,1:2:104,A(ii,:)),4);
%     advrdo12(:,:,:,ii) = mean(advrdo_t(:,:,1:2:104,A(ii,:)),4);
% end
% 
% clear advr*_t
% clear advr*


wvel12 = zeros(660,362,52,4);
theta12 = zeros(660,362,52,4);
wtheta12 = zeros(660,362,52,4);

wvel12t = zeros(660,362,52,365);
theta12t = zeros(660,362,52,365);


for jj=1:365
    fprintf('1/12 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
end

clear char*

fprintf('1/12 model RD \n')

theta12t = theta12t - mean(sum(areaTop.*theta12t,[1,2])./areaBox,4);

wtheta12t = wvel12t.*theta12t;

ind = [1,90,91,182,183,274,275,365];

for ii=1:4
    wvel12(:,:,:,ii) = mean(wvel12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    theta12(:,:,:,ii) = mean(theta12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wtheta12(:,:,:,ii) = mean(wtheta12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
end

clear *theta12t

fprintf('1/12 model RD \n')

mwtheta12 = wvel12.*theta12;

etheta12 = wtheta12 - mwtheta12;

spd = 86400;
vttheta12 = zeros(52,4);
vmtheta12 = zeros(52,4);
vetheta12 = zeros(52,4);

areaTop = areaTop(:,:,1:2:104);
areaBox = areaBox(1:2:104);

for jj=1:4
    fprintf('theta %g \n',jj)
    vttheta12(:,jj) = spd.*squeeze(sum(areaTop.*wtheta12(:,:,:,jj),[1,2]))./areaBox;
    vmtheta12(:,jj) = spd.*squeeze(sum(areaTop.*mwtheta12(:,:,:,jj),[1,2]))./areaBox;
    vetheta12(:,jj) = spd.*squeeze(sum(areaTop.*etheta12(:,:,:,jj),[1,2]))./areaBox;
end

save eddy_TSCO12_at v*12

clear









toc()