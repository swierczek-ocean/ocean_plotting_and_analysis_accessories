clear
close all
clc
tic()


str01 = 'WOA/woa18_all_o01_01.nc';
str02 = 'WOA/woa18_all_n01_01.nc';
ncdisp(str01)

lon = ncread(str01,'lon');
lat = ncread(str01,'lat');
woa_depth_o = ncread(str01,'depth');
woa_depth_n = ncread(str02,'depth');

xlo = find(lon>-70,1)-1;
xhi = find(lon>-10,1);
ylo = find(lat>-60,1)-1;
yhi = find(lat>-30,1);

lon = lon(xlo:xhi) + 360;
lat = lat(ylo:yhi);

nn = length(lon);
mm = length(lat);

DO_clim = zeros(nn,mm,57,12);
NO3_clim = zeros(nn,mm,43,12);
DO_clim_count = zeros(nn,mm,57,12);
NO3_clim_count = zeros(nn,mm,43,12);

for ii=1:12
    temp = ncread(['WOA/woa18_all_o',num2str(ii,'%02.f'),'_01.nc'],'o_mn');
    DO_clim(:,:,:,ii) = temp(xlo:xhi,ylo:yhi,:);
    temp = ncread(['WOA/woa18_all_o',num2str(ii,'%02.f'),'_01.nc'],'o_dd');
    DO_clim_count(:,:,:,ii) = temp(xlo:xhi,ylo:yhi,:);
    temp = ncread(['WOA/woa18_all_n',num2str(ii,'%02.f'),'_01.nc'],'n_mn');
    NO3_clim(:,:,:,ii) = temp(xlo:xhi,ylo:yhi,:);
    temp = ncread(['WOA/woa18_all_n',num2str(ii,'%02.f'),'_01.nc'],'n_dd');
    NO3_clim_count(:,:,:,ii) = temp(xlo:xhi,ylo:yhi,:);
end

save WOA_O_N DO_clim DO_clim_count NO3_clim NO3_clim_count lat lon *depth*

DO_clim_count(DO_clim_count==0) = NaN;
NO3_clim_count(NO3_clim_count==0) = NaN;
DO_clim(isnan(DO_clim_count)==1) = NaN;
NO3_clim(isnan(NO3_clim_count)==1) = NaN;

DO_clim = (1035/1000000).*DO_clim;
NO3_clim = (1035/1000000).*NO3_clim;

woa_do_clim = zeros(nn*mm,3,12);
woa_no3_clim = zeros(nn*mm,3,12);

for ii=1:12
    for jj=1:nn
        for kk=1:mm
            temp = DO_clim(jj,kk,1,ii);
            if isnan(temp)==0
                woa_do_clim(sub2ind([nn,mm],jj,kk),1,ii) = lon(jj);
                woa_do_clim(sub2ind([nn,mm],jj,kk),2,ii) = lat(kk);
                woa_do_clim(sub2ind([nn,mm],jj,kk),3,ii) = temp;
            else
                woa_do_clim(sub2ind([nn,mm],jj,kk),1,ii) = NaN;
                woa_do_clim(sub2ind([nn,mm],jj,kk),2,ii) = NaN;
                woa_do_clim(sub2ind([nn,mm],jj,kk),3,ii) = NaN;
            end
            temp = NO3_clim(jj,kk,5,ii);
            if isnan(temp)==0
                woa_no3_clim(sub2ind([nn,mm],jj,kk),1,ii) = lon(jj);
                woa_no3_clim(sub2ind([nn,mm],jj,kk),2,ii) = lat(kk);
                woa_no3_clim(sub2ind([nn,mm],jj,kk),3,ii) = temp;
            else
                woa_no3_clim(sub2ind([nn,mm],jj,kk),1,ii) = NaN;
                woa_no3_clim(sub2ind([nn,mm],jj,kk),2,ii) = NaN;
                woa_no3_clim(sub2ind([nn,mm],jj,kk),3,ii) = NaN;
            end
        end
    end
end



save woa_do_no3_clim woa_no3_clim woa_do_clim












toc()