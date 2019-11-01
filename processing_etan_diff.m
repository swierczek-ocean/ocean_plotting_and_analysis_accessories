clear
close all
clc

tic()
acc_settings

%%
load mask
load XY3 XC3 YC3
load XY6  XC6 YC6
load XY12 XC12 YC12
load ../2019_06_June_analysis/ETAN_MAT
load AB_AVISO_adj
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str *DYG* *DXG* *DRF*
%%

%%
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
ETAN122DIFF = zeros(size(D_AVISO));
ETAN62DIFF = ETAN122DIFF;
ETAN32DIFF = ETAN122DIFF;
temp_aviso = squeeze(D_AVISO(:,:,1));
ind = find(isnan(temp_aviso));

for ii=1:395
    temp32 = ETAN_Series32(:,:,ii);
    temp62 = ETAN_Series62(:,:,ii);
    temp122 = ETAN_Series122(:,:,ii);
    temp_aviso = D_AVISO(:,:,ii);
    
    temp32(temp32>100000) = NaN;
    temp62(temp62>100000) = NaN;
    temp122(temp122>100000) = NaN;
    
    temp32 = temp32 - mean(temp32(isnan(temp32)==0));
    temp62 = temp62 - mean(temp62(isnan(temp62)==0));
    temp122 = temp122 - mean(temp122(isnan(temp122)==0));
    
    temp32 = fillmissingstan(temp32);
    temp62 = fillmissingstan(temp62);
    temp122 = fillmissingstan(temp122);
    temp_aviso = fillmissingstan(temp_aviso);
    
    F = griddedInterpolant(XC3,YC3,temp32,'linear');
    temp32 = F(XCA,YCA);
    
    F = griddedInterpolant(XC6,YC6,temp62,'linear');
    temp62 = F(XCA,YCA);
    
    F = griddedInterpolant(XC12,YC12,temp122,'linear');
    temp122 = F(XCA,YCA);
    
    temp32 = temp32 - temp_aviso;
    temp62 = temp62 - temp_aviso;
    temp122 = temp122 - temp_aviso;
    
    temp32(ind) = NaN;
    temp62(ind) = NaN;
    temp122(ind) = NaN;
    
    ETAN32DIFF(:,:,ii) = temp32;
    ETAN62DIFF(:,:,ii) = temp62;
    ETAN122DIFF(:,:,ii) = temp122;
    ii
end

D_AVISO(isnan(D_AVISO)==1) = NaN;

ETAN32DIFFstd = std(ETAN32DIFF,0,3);
ETAN62DIFFstd = std(ETAN62DIFF,0,3);
ETAN122DIFFstd = std(ETAN122DIFF,0,3);

save ETAN_DIFF_std *DIFFstd* XCA YCA
 
clearvars -except ETAN32DIFF ETAN62DIFF ETAN122DIFF *_AVISO XCA YCA

save AVISO_DIFF_movie

toc()