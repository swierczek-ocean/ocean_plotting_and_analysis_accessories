


fid = fopen('SOSE_12_bathy3.bin','r','b');
U = fread(fid,inf,'single');
U = reshape(U,[4320,1260]);
fclose(fid);

% contourf(U')

load grid

XC = XC(:,end);
YC = YC(end,:);

lox = find(XC>288,1)-5;
hix = find(XC>352,1)+5;
loy = find(YC>-60,1)-5;
hiy = find(YC>-30,1)+5;


XCm = XC(lox:hix);
YCm = YC(loy:hiy);


mask = hFacC(lox:hix,loy:hiy,2:2:104);

clearvars -except mask XCm YCm

save mask
