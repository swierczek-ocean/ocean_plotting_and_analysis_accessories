tic()
clc
clear
close all


load XY6
DRF6 = repmat(DRF6,1,260)';
EDYG6 = repmat(EDYG6,52,1)';
WDYG6 = repmat(WDYG6,52,1)';
NDXG6 = repmat(NDXG6,1,52);
SDXG6 = repmat(SDXG6,1,52);

HC = hFacC6;
HS = hFacS6;
HW = hFacW6;

[XU,YU] = ndgrid(XG6,YC6);
[XV,YV] = ndgrid(XC6,YG6);
[XC6,YC6] = ndgrid(XC6,YC6);

%% DIC
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_DIC.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
%%

%% UVEL
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_Uvel.nc';

XCS = ncread(str,'XG');
YCS = ncread(str,'YC');
hFacW = ncread(str,'hFacW');
% X = XCS;
% Y = YCS;
% lox = find(X>288.3,1)-5;
% hix = find(X>352,1)+5;
% loy = find(Y>-60.1,1)-5;
% hiy = find(Y>-30.7,1)+5;
% YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacW = hFacW(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



UVEL_temp = ncread(str,'UVEL',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        UVEL_temp_temp = UVEL_temp(:,:,jj,ii);
        UVEL_temp_temp(hFacW(:,:,jj)==0) = NaN;
        UVEL_temp_temp = fillmissingstan(UVEL_temp_temp);
        UVEL_temp(:,:,jj,ii) = UVEL_temp_temp;
    end
end
UVEL = zeros(384,260,52,72);

fprintf('UVEL grid = [%g,%g]x[%g,%g] \n UVEL nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,UVEL_temp(:,:,ii,jj),'linear');
        UVEL(:,:,ii,jj) = F(XU,YU);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = UVEL(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of UVEL mistakes = %g \n',num_mistakes)

UVELN = UVEL(:,250,:,:);
UVELS = UVEL(:,11,:,:);
UVELE = UVEL(374,:,:,:);
UVELW = UVEL(11,:,:,:);

UVELN = squeeze(UVELN);
UVELS = squeeze(UVELS);
UVELE = squeeze(UVELE);
UVELW = squeeze(UVELW);

UVEL_temp = ncread(str,'UVEL',[1,1,1,1],[2160,588,52,72]);
XCS = ncread(str,'XG');
YCS = ncread(str,'YC');
hFacW = ncread(str,'hFacW');
DYG = ncread(str,'dyG');
DRF = ncread(str,'drF');
DRF = repmat(DRF,1,249)';
bsinde = find(XCS>XG6(374),1)-1;
temp1 = abs(XCS(bsinde)-XG6(374));
temp2 = abs(XCS(bsinde+1)-XG6(374));
if temp2<temp1
    bsinde = bsinde + 1;
end
bsindw = find(XCS>XG6(10),1);
temp1 = abs(XCS(bsindw)-XG6(10));
temp2 = abs(XCS(bsindw-1)-XG6(10));
if temp2<temp1
    bsindw = bsindw - 1;
end
bsindn = find(YCS>YG6(250),1);
temp1 = abs(YCS(bsindn)-YC6(250));
temp2 = abs(YCS(bsindn-1)-YC6(250));
if temp2<temp1
    bsindn = bsindn - 1;
end
bsinds = find(YCS>YC6(10),1)-1;
temp1 = abs(YCS(bsinds)-YC6(10));
temp2 = abs(YCS(bsinds+1)-YC6(10));
if temp2<temp1
    bsinds = bsinds + 1;
end
DYGE = DYG(bsinde,bsinds:bsindn);
DYGE = repmat(DYGE,52,1)';
DYGW = DYG(bsindw,bsinds:bsindn);
DYGW = repmat(DYGW,52,1)';
cross_sec_area_e = sum(sum(EUMASK6.*DRF6.*EDYG6));
cross_sec_area_w = sum(sum(WUMASK6.*DRF6.*WDYG6));

for ii=1:72
    myfluxe = sum(sum(UVELE(:,:,ii).*EUMASK6.*DRF6.*EDYG6));
    myfluxw = sum(sum(UVELW(:,:,ii).*WUMASK6.*DRF6.*WDYG6));
    bsosefluxe = sum(sum(squeeze(UVEL_temp(bsinde,bsinds:bsindn,:,ii)).*...
        squeeze(hFacW(bsinde,bsinds:bsindn,:)).*DRF.*DYGE));
    bsosefluxw = sum(sum(squeeze(UVEL_temp(bsindw,bsinds:bsindn,:,ii)).*...
        squeeze(hFacW(bsindw,bsinds:bsindn,:)).*DRF.*DYGW));
    fprintf('my east flux is %g \n',myfluxe);
    fprintf('my west flux is %g \n',myfluxw);
    fprintf('bsose east flux is %g \n',bsosefluxe);
    fprintf('bsose west flux is %g \n',bsosefluxw);
    efluxdiff = bsosefluxe - myfluxe;
    wfluxdiff = bsosefluxw - myfluxw;
    UVELE(:,:,ii) = UVELE(:,:,ii) + ...
        efluxdiff/cross_sec_area_e;
    UVELW(:,:,ii) = UVELW(:,:,ii) + ...
        wfluxdiff/cross_sec_area_w;
    myfluxe = sum(sum(UVELE(:,:,ii).*EUMASK6.*DRF6.*EDYG6));
    myfluxw = sum(sum(UVELW(:,:,ii).*WUMASK6.*DRF6.*WDYG6));
    fprintf('now my east flux is %g \n',myfluxe);
    fprintf('now my west flux is %g \n',myfluxw);    
end


for ii=1:10
    UVELN(ii,:,:) = UVELN(11,:,:);
    UVELN(374+ii,:,:) = UVELN(374,:,:);
    UVELS(ii,:,:) = UVELS(11,:,:);
    UVELS(374+ii,:,:) = UVELS(374,:,:);
    UVELE(ii,:,:) = UVELE(11,:,:);
    UVELE(250+ii,:,:) = UVELE(250,:,:);
    UVELW(ii,:,:) = UVELW(11,:,:);
    UVELW(250+ii,:,:) = UVELW(250,:,:);
end

fprintf('UVELN has %g NaNs \n',sum(sum(sum(isnan(UVELN)))));
fprintf('UVELS has %g NaNs \n',sum(sum(sum(isnan(UVELS)))));
fprintf('UVELE has %g NaNs \n',sum(sum(sum(isnan(UVELE)))));
fprintf('UVELW has %g NaNs \n',sum(sum(sum(isnan(UVELW)))));

fid = fopen('UVEL_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,UVELN,'single');
fclose(fid);

fid = fopen('UVEL_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,UVELS,'single');
fclose(fid);

fid = fopen('UVEL_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,UVELE,'single');
fclose(fid);

fid = fopen('UVEL_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,UVELW,'single');
fclose(fid);

clear UVEL*
%% end UVEL

%% VVEL
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_Vvel.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YG');
hFacS = ncread(str,'hFacS');
% X = XCS;
% Y = YCS;
% lox = find(X>288.3,1)-5;
% hix = find(X>352,1)+5;
% loy = find(Y>-60.1,1)-5;
% hiy = find(Y>-30.7,1)+5;
% YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacS = hFacS(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



VVEL_temp = ncread(str,'VVEL',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        VVEL_temp_temp = VVEL_temp(:,:,jj,ii);
        VVEL_temp_temp(hFacS(:,:,jj)==0) = NaN;
        VVEL_temp_temp = fillmissingstan(VVEL_temp_temp);
        VVEL_temp(:,:,jj,ii) = VVEL_temp_temp;
    end
end
VVEL = zeros(384,260,52,72);

fprintf('VVEL grid = [%g,%g]x[%g,%g] \n VVEL nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,VVEL_temp(:,:,ii,jj),'linear');
        VVEL(:,:,ii,jj) = F(XV,YV);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = VVEL(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of VVEL mistakes = %g \n',num_mistakes)

VVELN = VVEL(:,250,:,:);
VVELS = VVEL(:,11,:,:);
VVELE = VVEL(374,:,:,:);
VVELW = VVEL(11,:,:,:);

VVELN = squeeze(VVELN);
VVELS = squeeze(VVELS);
VVELE = squeeze(VVELE);
VVELW = squeeze(VVELW);

VVEL_temp = ncread(str,'VVEL',[1,1,1,1],[2160,588,52,72]);
XCS = ncread(str,'XC');
YCS = ncread(str,'YG');
hFacS = ncread(str,'hFacS');
DXG = ncread(str,'dxG');
DRF = ncread(str,'drF');
DRF = repmat(DRF,1,365)';
bsinde = find(XCS>XC6(374),1)-1;
temp1 = abs(XCS(bsinde)-XC6(374));
temp2 = abs(XCS(bsinde+1)-XC6(374));
if temp2<temp1
    bsinde = bsinde + 1;
end
bsindw = find(XCS>XC6(10),1);
temp1 = abs(XCS(bsindw)-XC6(10));
temp2 = abs(XCS(bsindw-1)-XC6(10));
if temp2<temp1
    bsindw = bsindw - 1;
end
bsindn = find(YCS>YG6(250),1);
temp1 = abs(YCS(bsindn)-YG6(250));
temp2 = abs(YCS(bsindn-1)-YG6(250));
if temp2<temp1
    bsindn = bsindn - 1;
end
bsinds = find(YCS>YG6(10),1)-1;
temp1 = abs(YCS(bsinds)-YG6(10));
temp2 = abs(YCS(bsinds+1)-YG6(10));
if temp2<temp1
    bsinds = bsinds + 1;
end
DXGS = DXG(bsindw:bsinde,bsinds);
DXGS = repmat(DXGS,1,52);
DXGN = DXG(bsindw:bsinde,bsindn);
DXGN = repmat(DXGN,1,52);
DRF6 = repmat(DRF6(1,:),384,1);
cross_sect_area_n = sum(sum(NVMASK6.*DRF6.*NDXG6));
cross_sect_area_s = sum(sum(SVMASK6.*DRF6.*SDXG6));

for ii=1:72
    myfluxn = sum(sum(VVELN(:,:,ii).*NVMASK6.*DRF6.*NDXG6));
    myfluxs = sum(sum(VVELS(:,:,ii).*SVMASK6.*DRF6.*SDXG6));
    bsosefluxn = sum(sum(squeeze(VVEL_temp(bsindw:bsinde,bsindn,:,ii)).*...
        squeeze(hFacS(bsindw:bsinde,bsindn,:)).*DRF.*DXGN));
    bsosefluxs = sum(sum(squeeze(VVEL_temp(bsindw:bsinde,bsinds,:,ii)).*...
        squeeze(hFacS(bsindw:bsinde,bsinds,:)).*DRF.*DXGS));
    fprintf('my north flux is %g \n',myfluxn);
    fprintf('my south flux is %g \n',myfluxs);
    fprintf('bsose north flux is %g \n',bsosefluxn);
    fprintf('bsose south flux is %g \n',bsosefluxs);
    nfluxdiff = bsosefluxn - myfluxn;
    sfluxdiff = bsosefluxs - myfluxs;
    VVELN(:,:,ii) = VVELN(:,:,ii) + ...
        nfluxdiff/cross_sect_area_n;
    VVELS(:,:,ii) = VVELS(:,:,ii) + ...
        sfluxdiff/cross_sect_area_s;
    myfluxn = sum(sum(VVELN(:,:,ii).*NVMASK6.*DRF6.*NDXG6));
    myfluxs = sum(sum(VVELS(:,:,ii).*SVMASK6.*DRF6.*SDXG6));   
    fprintf('now my north flux is %g \n',myfluxn);
    fprintf('now my south flux is %g \n',myfluxs);    
end


for ii=1:10
    VVELN(ii,:,:) = VVELN(11,:,:);
    VVELN(374+ii,:,:) = VVELN(374,:,:);
    VVELS(ii,:,:) = VVELS(11,:,:);
    VVELS(374+ii,:,:) = VVELS(374,:,:);
    VVELE(ii,:,:) = VVELE(11,:,:);
    VVELE(250+ii,:,:) = VVELE(250,:,:);
    VVELW(ii,:,:) = VVELW(11,:,:);
    VVELW(250+ii,:,:) = VVELW(250,:,:);
end

fprintf('VVELN has %g NaNs \n',sum(sum(sum(isnan(VVELN)))));
fprintf('VVELS has %g NaNs \n',sum(sum(sum(isnan(VVELS)))));
fprintf('VVELE has %g NaNs \n',sum(sum(sum(isnan(VVELE)))));
fprintf('VVELW has %g NaNs \n',sum(sum(sum(isnan(VVELW)))));

fid = fopen('VVEL_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,VVELN,'single');
fclose(fid);

fid = fopen('VVEL_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,VVELS,'single');
fclose(fid);

fid = fopen('VVEL_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,VVELE,'single');
fclose(fid);

fid = fopen('VVEL_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,VVELW,'single');
fclose(fid);

clear VVEL*
%% end VVEL


%% DIC
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_DIC.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



DIC_temp = ncread(str,'TRAC01',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        DIC_temp_temp = DIC_temp(:,:,jj,ii);
        DIC_temp_temp(hFacC(:,:,jj)==0) = NaN;
        DIC_temp_temp = fillmissingstan(DIC_temp_temp);
        DIC_temp(:,:,jj,ii) = DIC_temp_temp;
    end
end
DIC = zeros(384,260,52,72);

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,DIC_temp(:,:,ii,jj),'linear');
        DIC(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = DIC(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of DIC mistakes = %g \n',num_mistakes)

fprintf('DIC grid = [%g,%g]x[%g,%g] \n DIC nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));


DICN = DIC(:,250,:,:);
DICS = DIC(:,11,:,:);
DICE = DIC(374,:,:,:);
DICW = DIC(11,:,:,:);
for ii=1:10
    DICN(ii,:,:,:) = DICN(11,:,:,:);
    DICN(374+ii,:,:,:) = DICN(374,:,:,:);
    DICS(ii,:,:,:) = DICS(11,:,:,:);
    DICS(374+ii,:,:,:) = DICS(374,:,:,:);
    DICE(:,ii,:,:) = DICE(:,11,:,:);
    DICE(:,250+ii,:,:) = DICE(:,250,:,:);
    DICW(:,ii,:,:) = DICW(:,11,:,:);
    DICW(:,250+ii,:,:) = DICW(:,250,:,:);
end

DICN = squeeze(DICN);
DICS = squeeze(DICS);
DICE = squeeze(DICE);
DICW = squeeze(DICW);

fprintf('DICN has %g NaNs \n',sum(sum(sum(isnan(DICN)))));
fprintf('DICS has %g NaNs \n',sum(sum(sum(isnan(DICS)))));
fprintf('DICE has %g NaNs \n',sum(sum(sum(isnan(DICE)))));
fprintf('DICW has %g NaNs \n',sum(sum(sum(isnan(DICW)))));

fid = fopen('DIC_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DICN,'single');
fclose(fid);

fid = fopen('DIC_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DICS,'single');
fclose(fid);

fid = fopen('DIC_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DICE,'single');
fclose(fid);

fid = fopen('DIC_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DICW,'single');
fclose(fid);

clear DIC*
%% end DIC


%% ALK
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_Alk.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



ALK_temp = ncread(str,'TRAC02',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        ALK_temp_temp = ALK_temp(:,:,jj,ii);
        ALK_temp_temp(hFacC(:,:,jj)==0) = NaN;
        ALK_temp_temp = fillmissingstan(ALK_temp_temp);
        ALK_temp(:,:,jj,ii) = ALK_temp_temp;
    end
end
ALK = zeros(384,260,52,72);

fprintf('ALK grid = [%g,%g]x[%g,%g] \n ALK nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,ALK_temp(:,:,ii,jj),'linear');
        ALK(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = ALK(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of ALK mistakes = %g \n',num_mistakes)

ALKN = ALK(:,250,:,:);
ALKS = ALK(:,11,:,:);
ALKE = ALK(374,:,:,:);
ALKW = ALK(11,:,:,:);
for ii=1:10
    ALKN(ii,:,:,:) = ALKN(11,:,:,:);
    ALKN(374+ii,:,:,:) = ALKN(374,:,:,:);
    ALKS(ii,:,:,:) = ALKS(11,:,:,:);
    ALKS(374+ii,:,:,:) = ALKS(374,:,:,:);
    ALKE(:,ii,:,:) = ALKE(:,11,:,:);
    ALKE(:,250+ii,:,:) = ALKE(:,250,:,:);
    ALKW(:,ii,:,:) = ALKW(:,11,:,:);
    ALKW(:,250+ii,:,:) = ALKW(:,250,:,:);
end

ALKN = squeeze(ALKN);
ALKS = squeeze(ALKS);
ALKE = squeeze(ALKE);
ALKW = squeeze(ALKW);

fprintf('ALKN has %g NaNs \n',sum(sum(sum(isnan(ALKN)))));
fprintf('ALKS has %g NaNs \n',sum(sum(sum(isnan(ALKS)))));
fprintf('ALKE has %g NaNs \n',sum(sum(sum(isnan(ALKE)))));
fprintf('ALKW has %g NaNs \n',sum(sum(sum(isnan(ALKW)))));

fid = fopen('ALK_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,ALKN,'single');
fclose(fid);

fid = fopen('ALK_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,ALKS,'single');
fclose(fid);

fid = fopen('ALK_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,ALKE,'single');
fclose(fid);

fid = fopen('ALK_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,ALKW,'single');
fclose(fid);

clear ALK*
%% end ALK

%% O2
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_O2.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



O2_temp = ncread(str,'TRAC03',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        O2_temp_temp = O2_temp(:,:,jj,ii);
        O2_temp_temp(hFacC(:,:,jj)==0) = NaN;
        O2_temp_temp = fillmissingstan(O2_temp_temp);
        O2_temp(:,:,jj,ii) = O2_temp_temp;
    end
end
O2 = zeros(384,260,52,72);

fprintf('O2 grid = [%g,%g]x[%g,%g] \n O2 nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,O2_temp(:,:,ii,jj),'linear');
        O2(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = O2(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of O2 mistakes = %g \n',num_mistakes)

O2N = O2(:,250,:,:);
O2S = O2(:,11,:,:);
O2E = O2(374,:,:,:);
O2W = O2(11,:,:,:);
for ii=1:10
    O2N(ii,:,:,:) = O2N(11,:,:,:);
    O2N(374+ii,:,:,:) = O2N(374,:,:,:);
    O2S(ii,:,:,:) = O2S(11,:,:,:);
    O2S(374+ii,:,:,:) = O2S(374,:,:,:);
    O2E(:,ii,:,:) = O2E(:,11,:,:);
    O2E(:,250+ii,:,:) = O2E(:,250,:,:);
    O2W(:,ii,:,:) = O2W(:,11,:,:);
    O2W(:,250+ii,:,:) = O2W(:,250,:,:);
end

O2N = squeeze(O2N);
O2S = squeeze(O2S);
O2E = squeeze(O2E);
O2W = squeeze(O2W);

fprintf('O2N has %g NaNs \n',sum(sum(sum(isnan(O2N)))));
fprintf('O2S has %g NaNs \n',sum(sum(sum(isnan(O2S)))));
fprintf('O2E has %g NaNs \n',sum(sum(sum(isnan(O2E)))));
fprintf('O2W has %g NaNs \n',sum(sum(sum(isnan(O2W)))));

fid = fopen('O2_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,O2N,'single');
fclose(fid);

fid = fopen('O2_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,O2S,'single');
fclose(fid);

fid = fopen('O2_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,O2E,'single');
fclose(fid);

fid = fopen('O2_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,O2W,'single');
fclose(fid);

clear O2*
%% end O2

%% NO3
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_NO3.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



NO3_temp = ncread(str,'TRAC04',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        NO3_temp_temp = NO3_temp(:,:,jj,ii);
        NO3_temp_temp(hFacC(:,:,jj)==0) = NaN;
        NO3_temp_temp = fillmissingstan(NO3_temp_temp);
        NO3_temp(:,:,jj,ii) = NO3_temp_temp;
    end
end
NO3 = zeros(384,260,52,72);

fprintf('NO3 grid = [%g,%g]x[%g,%g] \n NO3 nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,NO3_temp(:,:,ii,jj),'linear');
        NO3(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = NO3(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of NO3 mistakes = %g \n',num_mistakes)

NO3N = NO3(:,250,:,:);
NO3S = NO3(:,11,:,:);
NO3E = NO3(374,:,:,:);
NO3W = NO3(11,:,:,:);
for ii=1:10
    NO3N(ii,:,:,:) = NO3N(11,:,:,:);
    NO3N(374+ii,:,:,:) = NO3N(374,:,:,:);
    NO3S(ii,:,:,:) = NO3S(11,:,:,:);
    NO3S(374+ii,:,:,:) = NO3S(374,:,:,:);
    NO3E(:,ii,:,:) = NO3E(:,11,:,:);
    NO3E(:,250+ii,:,:) = NO3E(:,250,:,:);
    NO3W(:,ii,:,:) = NO3W(:,11,:,:);
    NO3W(:,250+ii,:,:) = NO3W(:,250,:,:);
end

NO3N = squeeze(NO3N);
NO3S = squeeze(NO3S);
NO3E = squeeze(NO3E);
NO3W = squeeze(NO3W);

fprintf('NO3N has %g NaNs \n',sum(sum(sum(isnan(NO3N)))));
fprintf('NO3S has %g NaNs \n',sum(sum(sum(isnan(NO3S)))));
fprintf('NO3E has %g NaNs \n',sum(sum(sum(isnan(NO3E)))));
fprintf('NO3W has %g NaNs \n',sum(sum(sum(isnan(NO3W)))));

fid = fopen('NO3_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,NO3N,'single');
fclose(fid);

fid = fopen('NO3_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,NO3S,'single');
fclose(fid);

fid = fopen('NO3_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,NO3E,'single');
fclose(fid);

fid = fopen('NO3_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,NO3W,'single');
fclose(fid);

clear NO3*
%% end NO3

%% PO4
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_PO4.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



PO4_temp = ncread(str,'TRAC05',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        PO4_temp_temp = PO4_temp(:,:,jj,ii);
        PO4_temp_temp(hFacC(:,:,jj)==0) = NaN;
        PO4_temp_temp = fillmissingstan(PO4_temp_temp);
        PO4_temp(:,:,jj,ii) = PO4_temp_temp;
    end
end
PO4 = zeros(384,260,52,72);

fprintf('PO4 grid = [%g,%g]x[%g,%g] \n PO4 nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,PO4_temp(:,:,ii,jj),'linear');
        PO4(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = PO4(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of PO4 mistakes = %g \n',num_mistakes)

PO4N = PO4(:,250,:,:);
PO4S = PO4(:,11,:,:);
PO4E = PO4(374,:,:,:);
PO4W = PO4(11,:,:,:);
for ii=1:10
    PO4N(ii,:,:,:) = PO4N(11,:,:,:);
    PO4N(374+ii,:,:,:) = PO4N(374,:,:,:);
    PO4S(ii,:,:,:) = PO4S(11,:,:,:);
    PO4S(374+ii,:,:,:) = PO4S(374,:,:,:);
    PO4E(:,ii,:,:) = PO4E(:,11,:,:);
    PO4E(:,250+ii,:,:) = PO4E(:,250,:,:);
    PO4W(:,ii,:,:) = PO4W(:,11,:,:);
    PO4W(:,250+ii,:,:) = PO4W(:,250,:,:);
end

PO4N = squeeze(PO4N);
PO4S = squeeze(PO4S);
PO4E = squeeze(PO4E);
PO4W = squeeze(PO4W);

fprintf('PO4N has %g NaNs \n',sum(sum(sum(isnan(PO4N)))));
fprintf('PO4S has %g NaNs \n',sum(sum(sum(isnan(PO4S)))));
fprintf('PO4E has %g NaNs \n',sum(sum(sum(isnan(PO4E)))));
fprintf('PO4W has %g NaNs \n',sum(sum(sum(isnan(PO4W)))));

fid = fopen('PO4_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,PO4N,'single');
fclose(fid);

fid = fopen('PO4_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,PO4S,'single');
fclose(fid);

fid = fopen('PO4_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,PO4E,'single');
fclose(fid);

fid = fopen('PO4_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,PO4W,'single');
fclose(fid);

clear PO4*
%% end PO4

%% FE
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_Fe.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



FE_temp = ncread(str,'TRAC06',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        FE_temp_temp = FE_temp(:,:,jj,ii);
        FE_temp_temp(hFacC(:,:,jj)==0) = NaN;
        FE_temp_temp = fillmissingstan(FE_temp_temp);
        FE_temp(:,:,jj,ii) = FE_temp_temp;
    end
end
FE = zeros(384,260,52,72);

fprintf('FE grid = [%g,%g]x[%g,%g] \n FE nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,FE_temp(:,:,ii,jj),'linear');
        FE(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = FE(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of FE mistakes = %g \n',num_mistakes)

FEN = FE(:,250,:,:);
FES = FE(:,11,:,:);
FEE = FE(374,:,:,:);
FEW = FE(11,:,:,:);
for ii=1:10
    FEN(ii,:,:,:) = FEN(11,:,:,:);
    FEN(374+ii,:,:,:) = FEN(374,:,:,:);
    FES(ii,:,:,:) = FES(11,:,:,:);
    FES(374+ii,:,:,:) = FES(374,:,:,:);
    FEE(:,ii,:,:) = FEE(:,11,:,:);
    FEE(:,250+ii,:,:) = FEE(:,250,:,:);
    FEW(:,ii,:,:) = FEW(:,11,:,:);
    FEW(:,250+ii,:,:) = FEW(:,250,:,:);
end

FEN = squeeze(FEN);
FES = squeeze(FES);
FEE = squeeze(FEE);
FEW = squeeze(FEW);

fprintf('FEN has %g NaNs \n',sum(sum(sum(isnan(FEN)))));
fprintf('FES has %g NaNs \n',sum(sum(sum(isnan(FES)))));
fprintf('FEE has %g NaNs \n',sum(sum(sum(isnan(FEE)))));
fprintf('FEW has %g NaNs \n',sum(sum(sum(isnan(FEW)))));

fid = fopen('FE_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,FEN,'single');
fclose(fid);

fid = fopen('FE_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,FES,'single');
fclose(fid);

fid = fopen('FE_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,FEE,'single');
fclose(fid);

fid = fopen('FE_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,FEW,'single');
fclose(fid);

clear FE*
%% end FE

%% DON
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_DON.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



DON_temp = ncread(str,'TRAC07',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        DON_temp_temp = DON_temp(:,:,jj,ii);
        DON_temp_temp(hFacC(:,:,jj)==0) = NaN;
        DON_temp_temp = fillmissingstan(DON_temp_temp);
        DON_temp(:,:,jj,ii) = DON_temp_temp;
    end
end
DON = zeros(384,260,52,72);

fprintf('DON grid = [%g,%g]x[%g,%g] \n DON nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,DON_temp(:,:,ii,jj),'linear');
        DON(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = DON(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of DON mistakes = %g \n',num_mistakes)

DONN = DON(:,250,:,:);
DONS = DON(:,11,:,:);
DONE = DON(374,:,:,:);
DONW = DON(11,:,:,:);
for ii=1:10
    DONN(ii,:,:,:) = DONN(11,:,:,:);
    DONN(374+ii,:,:,:) = DONN(374,:,:,:);
    DONS(ii,:,:,:) = DONS(11,:,:,:);
    DONS(374+ii,:,:,:) = DONS(374,:,:,:);
    DONE(:,ii,:,:) = DONE(:,11,:,:);
    DONE(:,250+ii,:,:) = DONE(:,250,:,:);
    DONW(:,ii,:,:) = DONW(:,11,:,:);
    DONW(:,250+ii,:,:) = DONW(:,250,:,:);
end

DONN = squeeze(DONN);
DONS = squeeze(DONS);
DONE = squeeze(DONE);
DONW = squeeze(DONW);

fprintf('DONN has %g NaNs \n',sum(sum(sum(isnan(DONN)))));
fprintf('DONS has %g NaNs \n',sum(sum(sum(isnan(DONS)))));
fprintf('DONE has %g NaNs \n',sum(sum(sum(isnan(DONE)))));
fprintf('DONW has %g NaNs \n',sum(sum(sum(isnan(DONW)))));

fid = fopen('DON_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DONN,'single');
fclose(fid);

fid = fopen('DON_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DONS,'single');
fclose(fid);

fid = fopen('DON_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DONE,'single');
fclose(fid);

fid = fopen('DON_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DONW,'single');
fclose(fid);

clear DON*
%% end DON

%% DOP
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_DOP.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



DOP_temp = ncread(str,'TRAC08',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        DOP_temp_temp = DOP_temp(:,:,jj,ii);
        DOP_temp_temp(hFacC(:,:,jj)==0) = NaN;
        DOP_temp_temp = fillmissingstan(DOP_temp_temp);
        DOP_temp(:,:,jj,ii) = DOP_temp_temp;
    end
end
DOP = zeros(384,260,52,72);

fprintf('DOP grid = [%g,%g]x[%g,%g] \n DOP nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,DOP_temp(:,:,ii,jj),'linear');
        DOP(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = DOP(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of DOP mistakes = %g \n',num_mistakes)

DOPN = DOP(:,250,:,:);
DOPS = DOP(:,11,:,:);
DOPE = DOP(374,:,:,:);
DOPW = DOP(11,:,:,:);
for ii=1:10
    DOPN(ii,:,:,:) = DOPN(11,:,:,:);
    DOPN(374+ii,:,:,:) = DOPN(374,:,:,:);
    DOPS(ii,:,:,:) = DOPS(11,:,:,:);
    DOPS(374+ii,:,:,:) = DOPS(374,:,:,:);
    DOPE(:,ii,:,:) = DOPE(:,11,:,:);
    DOPE(:,250+ii,:,:) = DOPE(:,250,:,:);
    DOPW(:,ii,:,:) = DOPW(:,11,:,:);
    DOPW(:,250+ii,:,:) = DOPW(:,250,:,:);
end

DOPN = squeeze(DOPN);
DOPS = squeeze(DOPS);
DOPE = squeeze(DOPE);
DOPW = squeeze(DOPW);

fprintf('DOPN has %g NaNs \n',sum(sum(sum(isnan(DOPN)))));
fprintf('DOPS has %g NaNs \n',sum(sum(sum(isnan(DOPS)))));
fprintf('DOPE has %g NaNs \n',sum(sum(sum(isnan(DOPE)))));
fprintf('DOPW has %g NaNs \n',sum(sum(sum(isnan(DOPW)))));

fid = fopen('DOP_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DOPN,'single');
fclose(fid);

fid = fopen('DOP_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DOPS,'single');
fclose(fid);

fid = fopen('DOP_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DOPE,'single');
fclose(fid);

fid = fopen('DOP_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,DOPW,'single');
fclose(fid);

clear DOP*
%% end DOP

%% THETA
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_Theta.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



THETA_temp = ncread(str,'THETA',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        THETA_temp_temp = THETA_temp(:,:,jj,ii);
        THETA_temp_temp(hFacC(:,:,jj)==0) = NaN;
        THETA_temp_temp = fillmissingstan(THETA_temp_temp);
        THETA_temp(:,:,jj,ii) = THETA_temp_temp;
    end
end
THETA = zeros(384,260,52,72);

fprintf('THETA grid = [%g,%g]x[%g,%g] \n DOP nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,THETA_temp(:,:,ii,jj),'linear');
        THETA(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = THETA(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of THETA mistakes = %g \n',num_mistakes)

THETAN = THETA(:,250,:,:);
THETAS = THETA(:,11,:,:);
THETAE = THETA(374,:,:,:);
THETAW = THETA(11,:,:,:);
for ii=1:10
    THETAN(ii,:,:,:) = THETAN(11,:,:,:);
    THETAN(374+ii,:,:,:) = THETAN(374,:,:,:);
    THETAS(ii,:,:,:) = THETAS(11,:,:,:);
    THETAS(374+ii,:,:,:) = THETAS(374,:,:,:);
    THETAE(:,ii,:,:) = THETAE(:,11,:,:);
    THETAE(:,250+ii,:,:) = THETAE(:,250,:,:);
    THETAW(:,ii,:,:) = THETAW(:,11,:,:);
    THETAW(:,250+ii,:,:) = THETAW(:,250,:,:);
end

THETAN = squeeze(THETAN);
THETAS = squeeze(THETAS);
THETAE = squeeze(THETAE);
THETAW = squeeze(THETAW);

fprintf('THETAN has %g NaNs \n',sum(sum(sum(isnan(THETAN)))));
fprintf('THETAS has %g NaNs \n',sum(sum(sum(isnan(THETAS)))));
fprintf('THETAE has %g NaNs \n',sum(sum(sum(isnan(THETAE)))));
fprintf('THETAW has %g NaNs \n',sum(sum(sum(isnan(THETAW)))));

fid = fopen('THETA_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,THETAN,'single');
fclose(fid);

fid = fopen('THETA_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,THETAS,'single');
fclose(fid);

fid = fopen('THETA_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,THETAE,'single');
fclose(fid);

fid = fopen('THETA_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,THETAW,'single');
fclose(fid);

clear THETA*
%% end THETA


%% SALT
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_Salt.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



SALT_temp = ncread(str,'SALT',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        SALT_temp_temp = SALT_temp(:,:,jj,ii);
        SALT_temp_temp(hFacC(:,:,jj)==0) = NaN;
        SALT_temp_temp = fillmissingstan(SALT_temp_temp);
        SALT_temp(:,:,jj,ii) = SALT_temp_temp;
    end
end
SALT = zeros(384,260,52,72);

fprintf('SALT grid = [%g,%g]x[%g,%g] \n SALT nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,SALT_temp(:,:,ii,jj),'linear');
        SALT(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = SALT(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of SALT mistakes = %g \n',num_mistakes)

SALTN = SALT(:,250,:,:);
SALTS = SALT(:,11,:,:);
SALTE = SALT(374,:,:,:);
SALTW = SALT(11,:,:,:);
for ii=1:10
    SALTN(ii,:,:,:) = SALTN(11,:,:,:);
    SALTN(374+ii,:,:,:) = SALTN(374,:,:,:);
    SALTS(ii,:,:,:) = SALTS(11,:,:,:);
    SALTS(374+ii,:,:,:) = SALTS(374,:,:,:);
    SALTE(:,ii,:,:) = SALTE(:,11,:,:);
    SALTE(:,250+ii,:,:) = SALTE(:,250,:,:);
    SALTW(:,ii,:,:) = SALTW(:,11,:,:);
    SALTW(:,250+ii,:,:) = SALTW(:,250,:,:);
end

SALTN = squeeze(SALTN);
SALTS = squeeze(SALTS);
SALTE = squeeze(SALTE);
SALTW = squeeze(SALTW);

fprintf('SALTN has %g NaNs \n',sum(sum(sum(isnan(SALTN)))));
fprintf('SALTS has %g NaNs \n',sum(sum(sum(isnan(SALTS)))));
fprintf('SALTE has %g NaNs \n',sum(sum(sum(isnan(SALTE)))));
fprintf('SALTW has %g NaNs \n',sum(sum(sum(isnan(SALTW)))));

fid = fopen('SALT_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,SALTN,'single');
fclose(fid);

fid = fopen('SALT_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,SALTS,'single');
fclose(fid);

fid = fopen('SALT_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,SALTE,'single');
fclose(fid);

fid = fopen('SALT_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,SALTW,'single');
fclose(fid);

% clear SALT*
%% end SALT

%% PHYTO_SM
str = '/data/SOSE/SOSE/SO6/ITER126/bsose_i126_2013to2018_monthly_PhytoSm.nc';

XCS = ncread(str,'XC');
YCS = ncread(str,'YC');
hFacC = ncread(str,'hFacC');
X = XCS;
Y = YCS;
lox = find(X>288.3,1)-5;
hix = find(X>352,1)+5;
loy = find(Y>-60.1,1)-5;
hiy = find(Y>-30.7,1)+5;
YY = find(Y>-32.1,1);
XCS = XCS(lox:hix);
YCS = YCS(loy:hiy);
hFacC = hFacC(lox:hix,loy:hiy,:);
nn = length(XCS);
mm = length(YCS);
[XCS,YCS] = ndgrid(XCS,YCS);



PHYTO_SM_temp = ncread(str,'BLGPSM',[lox,loy,1,1],[nn,mm,52,72]);
for ii=1:72
    for jj=1:52
        PHYTO_SM_temp_temp = PHYTO_SM_temp(:,:,jj,ii);
        PHYTO_SM_temp_temp(hFacC(:,:,jj)==0) = NaN;
        PHYTO_SM_temp_temp = fillmissingstan(PHYTO_SM_temp_temp);
        PHYTO_SM_temp(:,:,jj,ii) = PHYTO_SM_temp_temp;
    end
end
PHYTO_SM = zeros(384,260,52,72);

fprintf('PHYTO_SM grid = [%g,%g]x[%g,%g] \n PHYTO_SM nbc loc = %g \n',X(lox),X(hix),Y(loy),Y(hiy),Y(YY));

for ii=1:52
    for jj=1:72
        F = griddedInterpolant(XCS,YCS,PHYTO_SM_temp(:,:,ii,jj),'linear');
        PHYTO_SM(:,:,ii,jj) = F(XC6,YC6);
    end
end

num_mistakes = 0;
for kk=1:72
    Logic = PHYTO_SM(:,:,:,kk)==0&HC~=0;
    num_mistakes = num_mistakes + sum(reshape(Logic,[384*260*52,1]));
end
fprintf('number of PHYTO_SM mistakes = %g \n',num_mistakes)

PHYTO_SMN = PHYTO_SM(:,250,:,:);
PHYTO_SMS = PHYTO_SM(:,11,:,:);
PHYTO_SME = PHYTO_SM(374,:,:,:);
PHYTO_SMW = PHYTO_SM(11,:,:,:);
for ii=1:10
    PHYTO_SMN(ii,:,:,:) = PHYTO_SMN(11,:,:,:);
    PHYTO_SMN(374+ii,:,:,:) = PHYTO_SMN(374,:,:,:);
    PHYTO_SMS(ii,:,:,:) = PHYTO_SMS(11,:,:,:);
    PHYTO_SMS(374+ii,:,:,:) = PHYTO_SMS(374,:,:,:);
    PHYTO_SME(:,ii,:,:) = PHYTO_SME(:,11,:,:);
    PHYTO_SME(:,250+ii,:,:) = PHYTO_SME(:,250,:,:);
    PHYTO_SMW(:,ii,:,:) = PHYTO_SMW(:,11,:,:);
    PHYTO_SMW(:,250+ii,:,:) = PHYTO_SMW(:,250,:,:);
end

PHYTO_SMN = squeeze(PHYTO_SMN);
PHYTO_SMS = squeeze(PHYTO_SMS);
PHYTO_SME = squeeze(PHYTO_SME);
PHYTO_SMW = squeeze(PHYTO_SMW);

fprintf('PHYTO_SMN has %g NaNs \n',sum(sum(sum(isnan(PHYTO_SMN)))));
fprintf('PHYTO_SMS has %g NaNs \n',sum(sum(sum(isnan(PHYTO_SMS)))));
fprintf('PHYTO_SME has %g NaNs \n',sum(sum(sum(isnan(PHYTO_SME)))));
fprintf('PHYTO_SMW has %g NaNs \n',sum(sum(sum(isnan(PHYTO_SMW)))));

fid = fopen('PHYTO_SM_NBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,PHYTO_SMN,'single');
fclose(fid);

fid = fopen('PHYTO_SM_SBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,PHYTO_SMS,'single');
fclose(fid);

fid = fopen('PHYTO_SM_EBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,PHYTO_SME,'single');
fclose(fid);

fid = fopen('PHYTO_SM_WBC_2013to2018_monthly_6.bin','w','b');
fwrite(fid,PHYTO_SMW,'single');
fclose(fid);

clear PHYTO_SM*
%% end PHYTO_SM

%% AGE
AGEN = zeros(384,52,61);
AGEN(:,2:52,48) = 1;
AGEN(:,2:52,49) = 2629800;
AGEN(:,2:52,50) = 2*2629800;
AGEN(:,2:52,51) = 3*2629800;
AGEN(:,2:52,52) = 4*2629800;
AGEN(:,2:52,53) = 5*2629800;
AGEN(:,2:52,54) = 6*2629800;
AGEN(:,2:52,55) = 7*2629800;
AGEN(:,2:52,56) = 8*2629800;
AGEN(:,2:52,57) = 9*2629800;
AGEN(:,2:52,58) = 10*2629800;
AGEN(:,2:52,59) = 11*2629800;
AGEN(:,2:52,60) = 12*2629800;
AGEN(:,2:52,61) = 13*2629800;

AGES = AGEN;

AGEE = zeros(260,52,61);
AGEE(:,2:52,48) = 1;
AGEE(:,2:52,49) = 2629800;
AGEE(:,2:52,50) = 2*2629800;
AGEE(:,2:52,51) = 3*2629800;
AGEE(:,2:52,52) = 4*2629800;
AGEE(:,2:52,53) = 5*2629800;
AGEE(:,2:52,54) = 6*2629800;
AGEE(:,2:52,55) = 7*2629800;
AGEE(:,2:52,56) = 8*2629800;
AGEE(:,2:52,57) = 9*2629800;
AGEE(:,2:52,58) = 10*2629800;
AGEE(:,2:52,59) = 11*2629800;
AGEE(:,2:52,60) = 12*2629800;
AGEE(:,2:52,61) = 13*2629800;

AGEW = AGEE;

fid = fopen('AGE_NBC_2013to2018_monthly_62.bin','w','b');
fwrite(fid,AGEN,'single');
fclose(fid);

fid = fopen('AGE_SBC_2013to2018_monthly_62.bin','w','b');
fwrite(fid,AGES,'single');
fclose(fid);

fid = fopen('AGE_EBC_2013to2018_monthly_62.bin','w','b');
fwrite(fid,AGEE,'single');
fclose(fid);

fid = fopen('AGE_WBC_2013to2018_monthly_62.bin','w','b');
fwrite(fid,AGEW,'single');
fclose(fid);

clear AGE*
%% end AGE

%% AGE
AGEN = zeros(384,52,61);

AGEN(:,2:52,54) = 1;
AGEN(:,2:52,55) = 2629800;
AGEN(:,2:52,56) = 2*2629800;
AGEN(:,2:52,57) = 3*2629800;
AGEN(:,2:52,58) = 4*2629800;
AGEN(:,2:52,59) = 5*2629800;
AGEN(:,2:52,60) = 6*2629800;
AGEN(:,2:52,61) = 7*2629800;

AGES = AGEN;

AGEE = zeros(260,52,61);
AGEE(:,2:52,54) = 1;
AGEE(:,2:52,55) = 2629800;
AGEE(:,2:52,56) = 2*2629800;
AGEE(:,2:52,57) = 3*2629800;
AGEE(:,2:52,58) = 4*2629800;
AGEE(:,2:52,59) = 5*2629800;
AGEE(:,2:52,60) = 6*2629800;
AGEE(:,2:52,61) = 7*2629800;

AGEW = AGEE;

fid = fopen('AGE_NBC_2013to2018_monthly_64.bin','w','b');
fwrite(fid,AGEN,'single');
fclose(fid);

fid = fopen('AGE_SBC_2013to2018_monthly_64.bin','w','b');
fwrite(fid,AGES,'single');
fclose(fid);

fid = fopen('AGE_EBC_2013to2018_monthly_64.bin','w','b');
fwrite(fid,AGEE,'single');
fclose(fid);

fid = fopen('AGE_WBC_2013to2018_monthly_64.bin','w','b');
fwrite(fid,AGEW,'single');
fclose(fid);

clear AGE*
%% end AGE




