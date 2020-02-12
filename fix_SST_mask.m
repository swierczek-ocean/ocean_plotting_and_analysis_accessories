clear
close all
clc
tic()


load SST_TS
load XY3 hFacC3
load XY6 hFacC6
load XY12 hFacC12


for ii=1:192
    for jj=1:132
        if (hFacC3(ii,jj,1)==0)
            SST_TS_3(ii,jj,:) = NaN;
        end
    end
end

for ii=1:384
    for jj=1:260
        if (hFacC6(ii,jj,1)==0)
            SST_TS_6(ii,jj,:) = NaN;
        end
    end
end

for ii=1:756
    for jj=1:512
        if (hFacC12(ii,jj,1)==0)
            SST_TS_12(ii,jj,:) = NaN;
        end
    end
end

save SST_TS SST_TS*
