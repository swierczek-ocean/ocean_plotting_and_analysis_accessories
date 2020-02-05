clear
close all
clc
tic()

hFacC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
RAC3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RAC'));
DRF3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/DRF'));
strs3 = '../MITgcm/verification/SO3_20190513/diag_slice/';

hFacC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
RAC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RAC'));
DRF6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/DRF'));
strs6 = '../MITgcm/verification/SO6_20190513/diag_slice/';

hFacC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
RAC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RAC'));
DRF12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/DRF'));
strs12 = '../MITgcm/verification/SO12_20190513/diag_slice/';
%% prelim

% select area
x = 1:192;
y = 1:132;
z = 1:12; %
% z = 1:36; % top 1000 m

hFacC3 = hFacC3(x,y,z);
[nx,ny,nz] = size(hFacC3);

volume3 = zeros(nx,ny,nz);
for kk=1:nz
    volume3(:,:,kk) = hFacC3(:,:,kk).*DRF3(kk);
end

depth3 = sum(volume3,3);

% select area
x = 1:384;
y = 1:260;
z = 1:12; %
% z = 1:36; % top 1000 m

hFacC6 = hFacC6(x,y,z);
[nx,ny,nz] = size(hFacC6);

volume6 = zeros(nx,ny,nz);
for kk=1:nz
    volume6(:,:,kk) = hFacC6(:,:,kk).*DRF6(kk);
end

depth6 = sum(volume6,3);

% select area
x = 1:756;
y = 1:512;
z = 1:24; %
% z = 1:36; % top 1000 m

hFacC12 = hFacC12(x,y,z);
[nx,ny,nz] = size(hFacC12);

volume12 = zeros(nx,ny,nz);
for kk=1:nz
    volume12(:,:,kk) = hFacC12(:,:,kk).*DRF12(kk);
end
depth12 = sum(volume12,3);
%% 


cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3
m_to_kg_C = 12.0107/1000;

Heat_100m_TS_3 = zeros(192,132,365);
Heat_100m_TS_6 = zeros(384,260,365);
Heat_100m_TS_12 = zeros(756,512,365);

Carbon_100m_TS_3 = zeros(192,132,365);
Carbon_100m_TS_6 = zeros(384,260,365);
Carbon_100m_TS_12 = zeros(756,512,365);

for ii=1:365
    charstate = [strs3,'diag_state.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    Heat_100m_TS_3(:,:,ii) = sum(temp(:,:,1:12).*volume3,3)./depth3;
    
    charstate = [strs6,'diag_state.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    Heat_100m_TS_6(:,:,ii) = sum(temp(:,:,1:12).*volume6,3)./depth6;
    
    charstate = [strs12,'diag_state.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    Heat_100m_TS_12(:,:,ii) = sum(temp(:,:,1:24).*volume12,3)./depth12;
    
    charbgc = [strs3,'diag_bgc.',num2str(48*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    Carbon_100m_TS_3(:,:,ii) = sum(temp(:,:,1:12).*volume3,3)./depth3;
    
    charbgc = [strs6,'diag_bgc.',num2str(72*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    Carbon_100m_TS_6(:,:,ii) = sum(temp(:,:,1:12).*volume6,3)./depth6;
    
    charbgc = [strs12,'diag_bgc.',num2str(360*(ii+31),'%010.f')];
    temp = rdmds(charbgc,'rec',1);
    Carbon_100m_TS_12(:,:,ii) = sum(temp(:,:,1:24).*volume12,3)./depth12;
end

for ii=1:192
    for jj=1:132
        if (hFacC3(ii,jj,1)==0)
            Heat_100m_TS_3(ii,jj) = NaN;
            Carbon_100m_TS_3(ii,jj) = NaN;
        end
    end
end

for ii=1:384
    for jj=1:260
        if (hFacC6(ii,jj,1)==0)
            Heat_100m_TS_6(ii,jj) = NaN;
            Carbon_100m_TS_6(ii,jj) = NaN;
        end
    end
end

for ii=1:756
    for jj=1:512
        if (hFacC12(ii,jj,1)==0)
            Heat_100m_TS_12(ii,jj) = NaN;
            Carbon_100m_TS_12(ii,jj) = NaN;
        end
    end
end

Heat_100m_mean_3 = mean(Heat_100m_TS_3,3);
Heat_100m_std_3 = std(Heat_100m_TS_3,0,3);
Heat_100m_mean_6 = mean(Heat_100m_TS_6,3);
Heat_100m_std_6 = std(Heat_100m_TS_6,0,3);
Heat_100m_mean_12 = mean(Heat_100m_TS_12,3);
Heat_100m_std_12 = std(Heat_100m_TS_12,0,3);

clear Heat_100m_TS*
save Heat_100m_mean_std Heat_100m_mean* Heat_100m_std*
clear Heat*

Carbon_100m_mean_3 = mean(Carbon_100m_TS_3,3);
Carbon_100m_std_3 = std(Carbon_100m_TS_3,0,3);
Carbon_100m_mean_6 = mean(Carbon_100m_TS_6,3);
Carbon_100m_std_6 = std(Carbon_100m_TS_6,0,3);
Carbon_100m_mean_12 = mean(Carbon_100m_TS_12,3);
Carbon_100m_std_12 = std(Carbon_100m_TS_12,0,3);

clear Carbon_100m_TS*
save Carbon_100m_mean_std Carbon_100m_mean* Carbon_100m_std*
clear Carbon*



toc()