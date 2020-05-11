clear
close all
clc
tic()

%% theta
load month_3 RC3 theta312
load month_6 theta612
load month_12 theta1212
load ODAmonthly odat RCt
load ECCOvert ecdepth eccoth12
load SODAvert sodath12 sodadepc
load WOAvert wdepth woth12
load rgt rgt depthrg
depthrg = -depthrg;
wdepth = -wdepth;
sodadepc = -sodadepc;
%%

anom_depth = ([-5:-5:-200,-210:-10:-400,-420:-20:-1500])';

intodat = zeros(115,12);
intwoat = zeros(115,12);
intrgt = zeros(115,12);
inteccot = zeros(115,12);
intsodat = zeros(115,12);
int3t = zeros(115,12);
int6t = zeros(115,12);
int12t = zeros(115,12);

for ii=1:12
    intodat(:,ii) = interp1(RCt,odat(:,ii),anom_depth,'linear');
    intwoat(:,ii) = interp1(wdepth,woth12(:,ii),anom_depth,'linear');
    intrgt(:,ii) = interp1(depthrg,rgt(:,ii),anom_depth,'linear');
    inteccot(:,ii) = interp1(ecdepth,eccoth12(:,ii),anom_depth,'linear');
    intsodat(:,ii) = interp1(sodadepc,sodath12(:,ii),anom_depth,'linear');
    int3t(:,ii) = interp1(RC3,theta312(:,ii),anom_depth,'linear');
    int6t(:,ii) = interp1(RC3,theta612(:,ii),anom_depth,'linear');
    int12t(:,ii) = interp1(RC3,theta1212(:,ii),anom_depth,'linear');
end

intodat = intodat - intrgt;
intwoat = intwoat - intrgt;
inteccot = inteccot - intrgt;
intsodat = intsodat - intrgt;
int3t = int3t - intrgt;
int6t = int6t - intrgt;
int12t = int12t - intrgt;
intrgt = intrgt - intrgt;

text = ['JFM';'AMJ';'JAS';'OND'];

A = [1,2,3;4,5,6;7,8,9;10,11,12];

rgts = zeros(58,4);
eccoth12s = zeros(50,4);
sodath12s = zeros(50,4);
theta3s = zeros(52,4);
theta6s = zeros(52,4);
theta12s = zeros(52,4);
woth12s = zeros(57,4);
odats = zeros(50,4);

for ii=1:4
    rgts(:,ii) = mean(rgt(:,A(ii,:)),2);
    eccoth12s(:,ii) = mean(eccoth12(:,A(ii,:)),2);
    sodath12s(:,ii) = mean(sodath12(:,A(ii,:)),2);
    odats(:,ii) = mean(odat(:,A(ii,:)),2);
    woth12s(:,ii) = mean(woth12(:,A(ii,:)),2);
    theta3s(:,ii) = mean(theta312(:,A(ii,:)),2);
    theta6s(:,ii) = mean(theta612(:,A(ii,:)),2);
    theta12s(:,ii) = mean(theta1212(:,A(ii,:)),2);
end

intodats = zeros(115,4);
intwoats = zeros(115,4);
intrgts = zeros(115,4);
inteccots = zeros(115,4);
intsodats = zeros(115,4);
int3ts = zeros(115,4);
int6ts = zeros(115,4);
int12ts = zeros(115,4);

for ii=1:4
    intodats(:,ii) = interp1(RCt,odats(:,ii),anom_depth,'linear');
    intwoats(:,ii) = interp1(wdepth,woth12s(:,ii),anom_depth,'linear');
    intrgts(:,ii) = interp1(depthrg,rgts(:,ii),anom_depth,'linear');
    inteccots(:,ii) = interp1(ecdepth,eccoth12s(:,ii),anom_depth,'linear');
    intsodats(:,ii) = interp1(sodadepc,sodath12s(:,ii),anom_depth,'linear');
    int3ts(:,ii) = interp1(RC3,theta3s(:,ii),anom_depth,'linear');
    int6ts(:,ii) = interp1(RC3,theta6s(:,ii),anom_depth,'linear');
    int12ts(:,ii) = interp1(RC3,theta12s(:,ii),anom_depth,'linear');
end

intodats = intodats - intrgts;
intwoats = intwoats - intrgts;
inteccots = inteccots - intrgts;
intsodats = intsodats - intrgts;
int3ts = int3ts - intrgts;
int6ts = int6ts - intrgts;
int12ts = int12ts - intrgts;
intrgts = intrgts - intrgts;

save theta_season_anom int* anom_depth odats rgts *12s *3s *6s

clear

%% salt
load month_3 RC3 salt312
load month_6 salt612
load month_12 salt1212
load ODAmonthly odas RCt
load ECCOvert ecdepth eccosa12
load SODAvert sodasa12 sodadepc
load WOAvert wdepth wosa12
load rgs rgs depthrg
depthrg = -depthrg;
wdepth = -wdepth;
sodadepc = -sodadepc;
%%

anom_depth = ([-5:-5:-200,-210:-10:-400,-420:-20:-1500])';

intodas = zeros(115,12);
intwoas = zeros(115,12);
intrgs = zeros(115,12);
inteccos = zeros(115,12);
intsodas = zeros(115,12);
int3s = zeros(115,12);
int6s = zeros(115,12);
int12s = zeros(115,12);

for ii=1:12
    intodas(:,ii) = interp1(RCt,odas(:,ii),anom_depth,'linear');
    intwoas(:,ii) = interp1(wdepth,wosa12(:,ii),anom_depth,'linear');
    intrgs(:,ii) = interp1(depthrg,rgs(:,ii),anom_depth,'linear');
    inteccos(:,ii) = interp1(ecdepth,eccosa12(:,ii),anom_depth,'linear');
    intsodas(:,ii) = interp1(sodadepc,sodasa12(:,ii),anom_depth,'linear');
    int3s(:,ii) = interp1(RC3,salt312(:,ii),anom_depth,'linear');
    int6s(:,ii) = interp1(RC3,salt612(:,ii),anom_depth,'linear');
    int12s(:,ii) = interp1(RC3,salt1212(:,ii),anom_depth,'linear');
end

intodas = intodas - intrgs;
intwoas = intwoas - intrgs;
inteccos = inteccos - intrgs;
intsodas = intsodas - intrgs;
int3s = int3s - intrgs;
int6s = int6s - intrgs;
int12s = int12s - intrgs;
intrgs = intrgs - intrgs;

text = ['JFM';'AMJ';'JAS';'OND'];

A = [1,2,3;4,5,6;7,8,9;10,11,12];

rgss = zeros(58,4);
eccosa12s = zeros(50,4);
sodasa12s = zeros(50,4);
salt3s = zeros(52,4);
salt6s = zeros(52,4);
salt12s = zeros(52,4);
wosa12s = zeros(57,4);
odass = zeros(50,4);

for ii=1:4
    rgss(:,ii) = mean(rgs(:,A(ii,:)),2);
    eccosa12s(:,ii) = mean(eccosa12(:,A(ii,:)),2);
    sodasa12s(:,ii) = mean(sodasa12(:,A(ii,:)),2);
    odass(:,ii) = mean(odas(:,A(ii,:)),2);
    wosa12s(:,ii) = mean(wosa12(:,A(ii,:)),2);
    salt3s(:,ii) = mean(salt312(:,A(ii,:)),2);
    salt6s(:,ii) = mean(salt612(:,A(ii,:)),2);
    salt12s(:,ii) = mean(salt1212(:,A(ii,:)),2);
end

intodass = zeros(115,4);
intwoass = zeros(115,4);
intrgss = zeros(115,4);
inteccoss = zeros(115,4);
intsodass = zeros(115,4);
int3ss = zeros(115,4);
int6ss = zeros(115,4);
int12ss = zeros(115,4);

for ii=1:4
    intodass(:,ii) = interp1(RCt,odass(:,ii),anom_depth,'linear');
    intwoass(:,ii) = interp1(wdepth,wosa12s(:,ii),anom_depth,'linear');
    intrgss(:,ii) = interp1(depthrg,rgss(:,ii),anom_depth,'linear');
    inteccoss(:,ii) = interp1(ecdepth,eccosa12s(:,ii),anom_depth,'linear');
    intsodass(:,ii) = interp1(sodadepc,sodasa12s(:,ii),anom_depth,'linear');
    int3ss(:,ii) = interp1(RC3,salt3s(:,ii),anom_depth,'linear');
    int6ss(:,ii) = interp1(RC3,salt6s(:,ii),anom_depth,'linear');
    int12ss(:,ii) = interp1(RC3,salt12s(:,ii),anom_depth,'linear');
end

intodass = intodass - intrgss;
intwoass = intwoass - intrgss;
inteccoss = inteccoss - intrgss;
intsodass = intsodass - intrgss;
int3ss = int3ss - intrgss;
int6ss = int6ss - intrgss;
int12ss = int12ss - intrgss;
intrgss = intrgss - intrgss;

save salt_season_anom int* anom_depth rgss odass *12s *3s *6s

clear

%% wvel
load month_3 RF3 wvel312
load month_6 wvel612
load month_12 wvel1212
load ODAmonthly odaw RCt RFt
load ECCOvert efdepth eccow12
load SODAvert sodaw12 sodadepf
sodadepf = -sodadepf;
%%
RF3 = RF3(1:52);
anom_depth = ([-5:-5:-200,-210:-10:-400,-420:-20:-1500])';

intodaw = zeros(115,12);
inteccow = zeros(115,12);
intsodaw = zeros(115,12);
int3w = zeros(115,12);
int6w = zeros(115,12);
int12w = zeros(115,12);

for ii=1:12
    intodaw(:,ii) = interp1(RFt,odaw(:,ii),anom_depth,'linear');
    inteccow(:,ii) = interp1(efdepth,eccow12(:,ii),anom_depth,'linear');
    intsodaw(:,ii) = interp1(sodadepf,sodaw12(:,ii),anom_depth,'linear');
    int3w(:,ii) = interp1(RF3,wvel312(:,ii),anom_depth,'linear');
    int6w(:,ii) = interp1(RF3,wvel612(:,ii),anom_depth,'linear');
    int12w(:,ii) = interp1(RF3,wvel1212(:,ii),anom_depth,'linear');
end

intodaw = intodaw - intsodaw;
inteccow = inteccow - intsodaw;
int3w = int3w - intsodaw;
int6w = int6w - intsodaw;
int12w = int12w - intsodaw;
intsodaw = intsodaw - intsodaw;

text = ['JFM';'AMJ';'JAS';'OND'];

A = [1,2,3;4,5,6;7,8,9;10,11,12];

eccow12w = zeros(50,4);
sodaw12w = zeros(50,4);
wvel3w = zeros(52,4);
wvel6w = zeros(52,4);
wvel12w = zeros(52,4);
odaws = zeros(50,4);

for ii=1:4
    eccow12w(:,ii) = mean(eccow12(:,A(ii,:)),2);
    sodaw12w(:,ii) = mean(sodaw12(:,A(ii,:)),2);
    odaws(:,ii) = mean(odaw(:,A(ii,:)),2);
    wvel3w(:,ii) = mean(wvel312(:,A(ii,:)),2);
    wvel6w(:,ii) = mean(wvel612(:,A(ii,:)),2);
    wvel12w(:,ii) = mean(wvel1212(:,A(ii,:)),2);
end

intodaws = zeros(115,4);
inteccows = zeros(115,4);
intsodaws = zeros(115,4);
int3ws = zeros(115,4);
int6ws = zeros(115,4);
int12ws = zeros(115,4);

for ii=1:4
    intodaws(:,ii) = interp1(RFt,odaws(:,ii),anom_depth,'linear');
    inteccows(:,ii) = interp1(efdepth,eccow12w(:,ii),anom_depth,'linear');
    intsodaws(:,ii) = interp1(sodadepf,sodaw12w(:,ii),anom_depth,'linear');
    int3ws(:,ii) = interp1(RF3,wvel3w(:,ii),anom_depth,'linear');
    int6ws(:,ii) = interp1(RF3,wvel6w(:,ii),anom_depth,'linear');
    int12ws(:,ii) = interp1(RF3,wvel12w(:,ii),anom_depth,'linear');
end

intodaws = intodaws - intsodaws;
inteccows = inteccows - intsodaws;
intsodaws = intsodaws - intsodaws;
int3ws = int3ws - intsodaws;
int6ws = int6ws - intsodaws;
int12ws = int12ws - intsodaws;

save wvel_season_anom int* anom_depth odaws *12w *3w *6w

clear


toc()