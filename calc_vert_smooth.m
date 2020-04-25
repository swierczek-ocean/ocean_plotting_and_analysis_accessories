clear
close all
clc
tic()

load ../2020_03_March_analysis/theta3
clear theta*sd
load ../2020_03_March_analysis/wvel3
clear wvel*sd

for ii=1:52
    temp3 = smoothdata(theta3(:,:,ii),1,'movmean',5,'omitnan');
    temp3 = smoothdata(temp3,2,'movmean',5,'omitnan');
    theta3(:,:,ii) = temp3;
    temp3 = smoothdata(wvel3(:,:,ii),1,'movmean',5,'omitnan');
    temp3 = smoothdata(temp3,2,'movmean',5,'omitnan');
    wvel3(:,:,ii) = temp3;
    clear temp3
end

RAC = rdmds('../Grids/3/RAC');
hFacC = rdmds('../Grids/3/hFacC');

theta3(isnan(theta3)==1) = 0;
wvel3(isnan(wvel3)==1) = 0;

x = 6:170;
y = 29:119;
z = 1:52; 

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

areaTop = zeros(nx,ny,nz);
areaBox = zeros(1,nz);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

theta3v = zeros(52,1);
wvel3v = zeros(52,1);

for ii=1:52
    theta3v(ii) = sum(sum(theta3(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    wvel3v(ii) = sum(sum(wvel3(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except theta3v wvel3v

load ../2020_03_March_analysis/theta6
clear theta*sd
load ../2020_03_March_analysis/wvel6
clear wvel*sd

for ii=1:52
    temp6 = smoothdata(theta6(:,:,ii),1,'movmean',7,'omitnan');
    temp6 = smoothdata(temp6,2,'movmean',7,'omitnan');
    theta6(:,:,ii) = temp6;
    temp6 = smoothdata(wvel6(:,:,ii),1,'movmean',7,'omitnan');
    temp6 = smoothdata(temp6,2,'movmean',7,'omitnan');
    wvel6(:,:,ii) = temp6;
end

RAC = rdmds('../Grids/6/RAC');
hFacC = rdmds('../Grids/6/hFacC');

theta6(isnan(theta6)==1) = 0;
wvel6(isnan(wvel6)==1) = 0;

x = 11:340;
y = 54:235;
z = 1:52; 

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

areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

theta6v = zeros(52,1);
wvel6v = zeros(52,1);

for ii=1:52
    theta6v(ii) = sum(sum(theta6(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    wvel6v(ii) = sum(sum(wvel6(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except theta3v wvel3v theta6v wvel6v

load ../2020_03_March_analysis/theta12
clear theta*sd
load ../2020_03_March_analysis/wvel12
clear wvel*sd

for ii=1:52
    temp12 = smoothdata(theta12(:,:,ii),1,'movmean',13,'omitnan');
    temp12 = smoothdata(temp12,2,'movmean',13,'omitnan');
    theta12(:,:,ii) = temp12;
    temp12 = smoothdata(wvel12(:,:,ii),1,'movmean',13,'omitnan');
    temp12 = smoothdata(temp12,2,'movmean',13,'omitnan');
    wvel12(:,:,ii) = temp12;
end

RAC = rdmds('../Grids/12/RAC');
hFacC = rdmds('../Grids/12/hFacC');

theta12(isnan(theta12)==1) = 0;
wvel12(isnan(wvel12)==1) = 0;

x = 17:676;
y = 106:467;
z = 1:104; 

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

areaTop = zeros(nx,ny,nz);
areaBox = zeros(nz,1);

for kk=1:nz
    areaTop(:,:,kk) = hFacC_ind(:,:,kk).*RAC(x,y);
    areaBox(kk) = sum(sum(areaTop(:,:,kk)));
end

theta12v = zeros(52,1);
wvel12v = zeros(52,1);

for ii=1:52
    theta12v(ii) = sum(sum(theta12(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
    wvel12v(ii) = sum(sum(wvel12(x,y,ii).*areaTop(:,:,ii)))./areaBox(ii);
end

clearvars -except theta3v wvel3v theta6v wvel6v theta12v wvel12v

save vert_stuff_smooth theta*v wvel*v

toc()