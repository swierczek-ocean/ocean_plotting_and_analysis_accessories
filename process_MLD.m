clear
close all
clc
tic()

acc_settings

%%

load ../2020_02_February_analysis/MLD_Series32
load ../2020_02_February_analysis/MLD_Series62
load ../2020_02_February_analysis/MLD_Series122
mld3 = mean(MLD_Series32(:,:,32:end),3);
mld6 = mean(MLD_Series62(:,:,32:end),3);
mld12 = mean(MLD_Series122(:,:,32:end),3);
load XY3 XC3 YC3 hFacC3
load XY6 XC6 YC6 hFacC6
load XY12 XC12 YC12 hFacC12
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);

for ii=1:192
    for jj=1:132
        if hFacC3(ii,jj,1)~=0
            if isnan(mld3(ii,jj))==1
                temp = MLD_Series32(ii,jj,32:end); 
                temp = temp(isnan(temp)==0);
                mld3(ii,jj) = mean(temp);
            end
        end
    end
end

for ii=1:384
    for jj=1:260
        if hFacC6(ii,jj,1)~=0
            if isnan(mld6(ii,jj))==1
                temp = MLD_Series62(ii,jj,32:end); 
                temp = temp(isnan(temp)==0);
                mld6(ii,jj) = mean(temp);
            end
        end
    end
end

for ii=1:756
    for jj=1:512
        if hFacC12(ii,jj,1)~=0
            if isnan(mld12(ii,jj))==1
                temp = MLD_Series122(ii,jj,32:end); 
                temp = temp(isnan(temp)==0);
                mld12(ii,jj) = mean(temp);
            end
        end
    end
end



save MLD_mean mld* XC* YC*




toc()