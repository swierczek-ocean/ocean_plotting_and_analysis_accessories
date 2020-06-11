clear
close all
clc
tic()

THETAWOA = zeros(252,118,102,12);

name = 'WOA18/woa18_A5B7_t13_04.nc';

ncdisp(name);

t_an = ncread(name,'t_an');

for ii=1:3
    THETAWOA(:,:,58:102,ii) = t_an(436:687,121:238,58:102);
end
clear t_an

name = 'WOA18/woa18_A5B7_t14_04.nc';
t_an = ncread(name,'t_an');

for ii=4:6
    THETAWOA(:,:,58:102,ii) = t_an(436:687,121:238,58:102);
end
clear t_an

name = 'WOA18/woa18_A5B7_t15_04.nc';
t_an = ncread(name,'t_an');

for ii=7:9
    THETAWOA(:,:,58:102,ii) = t_an(436:687,121:238,58:102);
end
clear t_an

name = 'WOA18/woa18_A5B7_t16_04.nc';
t_an = ncread(name,'t_an');

for ii=10:12
    THETAWOA(:,:,58:102,ii) = t_an(436:687,121:238,58:102);
end
clear t_an

for ii=1:12
    name = ['WOA18/woa18_A5B7_t',num2str(ii,'%02.f'),'_04.nc'];
    t_an = ncread(name,'t_an');
    THETAWOA(:,:,1:57,ii) = t_an(436:687,121:238,:);
    clear t_an
end


SALTWOA = zeros(252,118,102,12);

name = 'WOA18/woa18_A5B7_s13_04.nc';

ncdisp(name);

latw = ncread(name,'lat');
lonw = ncread(name,'lon') + 360;
depth = ncread(name,'depth');
s_an = ncread(name,'s_an');

latw = latw(121:238);
lonw = lonw(436:687);

for ii=1:3
    SALTWOA(:,:,58:102,ii) = s_an(436:687,121:238,58:102);
end
clear s_an

name = 'WOA18/woa18_A5B7_s14_04.nc';
s_an = ncread(name,'s_an');

for ii=4:6
    SALTWOA(:,:,58:102,ii) = s_an(436:687,121:238,58:102);
end
clear s_an

name = 'WOA18/woa18_A5B7_s15_04.nc';
s_an = ncread(name,'s_an');

for ii=7:9
    SALTWOA(:,:,58:102,ii) = s_an(436:687,121:238,58:102);
end
clear s_an

name = 'WOA18/woa18_A5B7_s16_04.nc';
s_an = ncread(name,'s_an');

for ii=10:12
    SALTWOA(:,:,58:102,ii) = s_an(436:687,121:238,58:102);
end
clear s_an


for ii=1:12
    name = ['WOA18/woa18_A5B7_s',num2str(ii,'%02.f'),'_04.nc'];
    s_an = ncread(name,'s_an');
    SALTWOA(:,:,1:57,ii) = s_an(436:687,121:238,:);
    clear s_an
end

save WOA18TS SALT* THETA* latw lonw depth

clear

load WOA18TS

THETARGE = squeeze(THETAWOA(252,:,:,:));
THETARGW = squeeze(THETAWOA(1,:,:,:));
THETARGN = squeeze(THETAWOA(:,118,:,:));
THETARGS = squeeze(THETAWOA(:,1,:,:));

SALTRGE = squeeze(SALTWOA(252,:,:,:));
SALTRGW = squeeze(SALTWOA(1,:,:,:));
SALTRGN = squeeze(SALTWOA(:,118,:,:));
SALTRGS = squeeze(SALTWOA(:,1,:,:));

load BCs/THETA12BC *C12 THETA*
load BCs/SALT12BC SALT*
XC12 = double(XC12);
YC12 = double(YC12);
RC12 = -RC12;
[YC12es,RC12es] = ndgrid(YC12,RC12);
[XC12ss,RC12ss] = ndgrid(XC12,RC12);
clear *C12

woathetade = zeros(512,104,12);
woathetadw = zeros(512,104,12);
woathetads = zeros(756,104,12);
woathetadn = zeros(756,104,12);

woasaltde = zeros(512,104,12);
woasaltdw = zeros(512,104,12);
woasaltds = zeros(756,104,12);
woasaltdn = zeros(756,104,12);

[exts,edts] = ndgrid(lonw,depth);
[eyte,edte] = ndgrid(latw,depth);

for ii=1:12
    F = griddedInterpolant(eyte,edte,THETARGE(:,:,ii),'linear');
    woathetade(:,:,ii) = F(YC12es,RC12es) - THETA12E(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,THETARGW(:,:,ii),'linear');
    woathetadw(:,:,ii) = F(YC12es,RC12es) - THETA12W(:,:,ii);
    
    F = griddedInterpolant(exts,edts,THETARGS(:,:,ii),'linear');
    woathetads(:,:,ii) = F(XC12ss,RC12ss) - THETA12S(:,:,ii);
    
    F = griddedInterpolant(exts,edts,THETARGN(:,:,ii),'linear');
    woathetadn(:,:,ii) = F(XC12ss,RC12ss) - THETA12N(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,SALTRGE(:,:,ii),'linear');
    woasaltde(:,:,ii) = F(YC12es,RC12es) - SALT12E(:,:,ii);
    
    F = griddedInterpolant(eyte,edte,SALTRGW(:,:,ii),'linear');
    woasaltdw(:,:,ii) = F(YC12es,RC12es) - SALT12W(:,:,ii);
    
    F = griddedInterpolant(exts,edts,SALTRGS(:,:,ii),'linear');
    woasaltds(:,:,ii) = F(XC12ss,RC12ss) - SALT12S(:,:,ii);
    
    F = griddedInterpolant(exts,edts,SALTRGN(:,:,ii),'linear');
    woasaltdn(:,:,ii) = F(XC12ss,RC12ss) - SALT12N(:,:,ii);
end

save WOAdiffs woa*d* XC12* RC12* YC12*

clear

load WOAdiffs

toc()







toc()