clear
close all
clc
tic()

load grid XC YC Depth

ind = find(XC(:,1)>276,1);

ind1 = find(YC(1,:)>-80,1);
ind2 = find(YC(1,:)>-10,1);

XC = XC(ind:end,1);
YC = YC(1,ind1:ind2);
Depth = -Depth(ind:end,ind1:ind2);

ncloads('elev.americas.5-min.nc')
lat = flipud(lat);
data = flipud(data);



for ii=1:649
    xhi = find(lon>XC(ii),1);
    xlo = xhi-1;
    t1 = abs(XC(ii)-lon(xhi));
    t2 = abs(XC(ii)-lon(xlo));
    if t1<t2
        xind = xhi;
    else
        xind = xlo;
    end
    for jj=1:1235
        yhi = find(lat>YC(jj),1);
        ylo = yhi-1;
        t1 = abs(YC(jj)-lat(yhi));
        t2 = abs(YC(jj)-lat(ylo));
        if t1<t2
            yind = yhi;
        else
            yind = ylo;
        end
        if Depth(ii,jj)==0
            Depth(ii,jj) = data(yind,xind);
        end
    end
end


Domain = zeros(size(Depth));
Budget = zeros(size(Depth));

xlo = find(XC>288.7,1)-1;
xhi = find(XC>352.6,1);
ylo = find(YC>-59.7,1)-1;
yhi = find(YC>-30.6,1);

Domain(xlo:xhi,ylo:yhi) = 1;

xlo = find(XC>290,1)-1;
xhi = find(XC>345,1);
ylo = find(YC>-55,1)-1;
yhi = find(YC>-33.7,1);

Budget(xlo:xhi,ylo:yhi) = 1;

for ii=xlo:620
    for jj=ylo:yhi
        if Depth(ii,jj)>-2000
            Budget(ii,jj) = 0;
        end
    end
end

Budget(614,1113:1114) = 1;
Budget(601:602,1109) = 1;
Budget(444:445,861) = 1;
Budget(436,860) = 1;
Budget(430,793) = 1;
Budget(374:375,868:869) = 1;
Budget(587:589,841:843) = 1;
Budget(402:404,863:864) = 1;
Budget(438:535,809:880) = 1;
Budget(554:623,795:864) = 1;
Budget(369:370,850:852) = 0;


[XC,YC] = ndgrid(XC,YC);

save new_depth XC YC Depth Domain Budget



toc()