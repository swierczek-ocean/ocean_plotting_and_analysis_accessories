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

% dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
% areaWest = zeros(nx+1,ny,nz);
% areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
%     areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
%     areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
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

% wvel12 = zeros(660,362,52,4);
% theta12 = zeros(660,362,52,4);
% salt12 = zeros(660,362,52,4);
% dic12 = zeros(660,362,52,4);
% do12 = zeros(660,362,52,4);
% wtheta12 = zeros(660,362,52,4);
% wsalt12 = zeros(660,362,52,4);
% wdic12 = zeros(660,362,52,4);
% wdo12 = zeros(660,362,52,4);
% 
% wvel12t = zeros(660,362,52,365);
% theta12t = zeros(660,362,52,365);
% salt12t = zeros(660,362,52,365);
% dic12t = zeros(660,362,52,365);
% do12t = zeros(660,362,52,365);
% 
% 
% for jj=1:365
%     fprintf('1/12 model daily fields iter %g of 365 \n',jj)
%     charstate = [strs,'diag_state.',num2str(360*(jj+31),'%010.f')];
%     temp = rdmds(charstate,'rec',5);
%     
%     wvel12t(:,:,:,jj) = temp(x,y,1:2:104);
%     clear temp
%     temp = rdmds(charstate,'rec',1);
%     theta12t(:,:,:,jj) = temp(x,y,1:2:104);
%     clear temp
%     temp = rdmds(charstate,'rec',2);
%     salt12t(:,:,:,jj) = temp(x,y,1:2:104);
%     clear temp
%     charbgc = [strs,'diag_bgc.',num2str(360*(jj+31),'%010.f')];
%     temp = rdmds(charbgc,'rec',1);
%     dic12t(:,:,:,jj) = temp(x,y,1:2:104);
%     clear temp
%     temp = rdmds(charbgc,'rec',3);
%     do12t(:,:,:,jj) = temp(x,y,1:2:104);
%     clear temp
% end
% 
% clear char*
% 
% fprintf('1/12 model RD \n')
% 
% theta12t = theta12t - mean(theta12t,[1,2,4]);
% salt12t = salt12t - mean(salt12t,[1,2,4]);
% dic12t = dic12t - mean(dic12t,[1,2,4]);
% do12t = do12t - mean(do12t,[1,2,4]);
% 
% wtheta12t = wvel12t.*theta12t;
% wsalt12t = wvel12t.*salt12t;
% wdic12t = wvel12t.*dic12t;
% wdo12t = wvel12t.*do12t;
% 
% ind = [1,90,91,182,183,274,275,365];
% 
% for ii=1:4
%     wvel12(:,:,:,ii) = mean(wvel12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
%     theta12(:,:,:,ii) = mean(theta12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
%     salt12(:,:,:,ii) = mean(salt12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
%     dic12(:,:,:,ii) = mean(dic12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
%     do12(:,:,:,ii) = mean(do12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
%     wtheta12(:,:,:,ii) = mean(wtheta12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
%     wsalt12(:,:,:,ii) = mean(wsalt12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
%     wdic12(:,:,:,ii) = mean(wdic12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
%     wdo12(:,:,:,ii) = mean(wdo12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
% end
% 
% clear *12t
% 
% fprintf('1/12 model RD \n')
% mwtheta12 = wvel12.*theta12;
% mwsalt12 = wvel12.*salt12;
% mwdic12 = wvel12.*dic12;
% mwdo12 = wvel12.*do12;
% 
% etheta12 = wtheta12 - mwtheta12;
% esalt12 = wsalt12 - mwsalt12;
% edic12 = wdic12 - mwdic12;
% edo12 = wdo12 - mwdo12;


wvel12 = zeros(660,362,52,4);
theta12 = zeros(660,362,52,4);
salt12 = zeros(660,362,52,4);
wtheta12 = zeros(660,362,52,4);
wsalt12 = zeros(660,362,52,4);

wvel12t = zeros(660,362,52,365);
theta12t = zeros(660,362,52,365);
salt12t = zeros(660,362,52,365);


for jj=1:365
    fprintf('1/12 model daily fields iter %g of 365 \n',jj)
    charstate = [strs,'diag_state.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charstate,'rec',5);
    wvel12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
    temp = rdmds(charstate,'rec',1);
    theta12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
    temp = rdmds(charstate,'rec',2);
    salt12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
end

clear char*

fprintf('1/12 model RD \n')

theta12t = theta12t - mean(theta12t,[1,2,4]);
salt12t = salt12t - mean(salt12t,[1,2,4]);

wtheta12t = wvel12t.*theta12t;
wsalt12t = wvel12t.*salt12t;

ind = [1,90,91,182,183,274,275,365];

for ii=1:4
    wvel12(:,:,:,ii) = mean(wvel12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    theta12(:,:,:,ii) = mean(theta12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    salt12(:,:,:,ii) = mean(salt12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wtheta12(:,:,:,ii) = mean(wtheta12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wsalt12(:,:,:,ii) = mean(wsalt12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
end

clear *theta12t *salt12t

fprintf('1/12 model RD \n')

mwtheta12 = wvel12.*theta12;
mwsalt12 = wvel12.*salt12;

etheta12 = wtheta12 - mwtheta12;
esalt12 = wsalt12 - mwsalt12;


dic12 = zeros(660,362,52,4);
do12 = zeros(660,362,52,4);
wdic12 = zeros(660,362,52,4);
wdo12 = zeros(660,362,52,4);

dic12t = zeros(660,362,52,365);
do12t = zeros(660,362,52,365);


for jj=1:365
    fprintf('1/12 model 2 daily fields iter %g of 365 \n',jj)
    charbgc = [strs,'diag_bgc.',num2str(360*(jj+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    dic12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
    temp = rdmds(charbgc,'rec',3);
    do12t(:,:,:,jj) = temp(x,y,1:2:104);
    clear temp
end

clear char*

fprintf('1/12 model 2 RD \n')

dic12t = dic12t - mean(dic12t,[1,2,4]);
do12t = do12t - mean(do12t,[1,2,4]);

wdic12t = wvel12t.*dic12t;
wdo12t = wvel12t.*do12t;

for ii=1:4
    dic12(:,:,:,ii) = mean(dic12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    do12(:,:,:,ii) = mean(do12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wdic12(:,:,:,ii) = mean(wdic12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
    wdo12(:,:,:,ii) = mean(wdo12t(:,:,:,ind(2*ii-1):ind(2*ii)),4);
end

clear *dic12t *do12t wvel12t

mwdic12 = wvel12.*dic12;
mwdo12 = wvel12.*do12;

edic12 = wdic12 - mwdic12;
edo12 = wdo12 - mwdo12;


spd = 86400;
vttheta12 = zeros(52,4);
vtsalt12 = zeros(52,4);
vtdic12 = zeros(52,4);
vtdo12 = zeros(52,4);
vmtheta12 = zeros(52,4);
vmsalt12 = zeros(52,4);
vmdic12 = zeros(52,4);
vmdo12 = zeros(52,4);
vetheta12 = zeros(52,4);
vesalt12 = zeros(52,4);
vedic12 = zeros(52,4);
vedo12 = zeros(52,4);

areaTop = areaTop(:,:,1:2:104);
areaBox = areaBox(1:2:104);

for jj=1:4
    fprintf('C1 %g \n',jj)
    vttheta12(:,jj) = spd.*squeeze(sum(areaTop.*wtheta12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C2 %g \n',jj)
    vtsalt12(:,jj) = spd.*squeeze(sum(areaTop.*wsalt12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C3 %g \n',jj)
    vtdic12(:,jj) = spd.*squeeze(sum(areaTop.*wdic12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C4 %g \n',jj)
    vtdo12(:,jj) = spd.*squeeze(sum(areaTop.*wdo12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C5 %g \n',jj)
    vmtheta12(:,jj) = spd.*squeeze(sum(areaTop.*mwtheta12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C6 %g \n',jj)
    vmsalt12(:,jj) = spd.*squeeze(sum(areaTop.*mwsalt12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C7 %g \n',jj)
    vmdic12(:,jj) = spd.*squeeze(sum(areaTop.*mwdic12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C8 %g \n',jj)
    vmdo12(:,jj) = spd.*squeeze(sum(areaTop.*mwdo12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C9 %g \n',jj)
    vetheta12(:,jj) = spd.*squeeze(sum(areaTop.*etheta12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C10 %g \n',jj)
    vesalt12(:,jj) = spd.*squeeze(sum(areaTop.*esalt12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C11 %g \n',jj)
    vedic12(:,jj) = spd.*squeeze(sum(areaTop.*edic12(:,:,:,jj),[1,2]))./areaBox;
    fprintf('C12 %g \n',jj)
    vedo12(:,jj) = spd.*squeeze(sum(areaTop.*edo12(:,:,:,jj),[1,2]))./areaBox;
end

save eddy_TSCO12_a v*12 RC12 RF12

clear









toc()