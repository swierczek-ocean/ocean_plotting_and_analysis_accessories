hFacC = rdmds('../Grids/3/hFacC');
hFacW = rdmds('../Grids/3/hFacW');
hFacS = rdmds('../Grids/3/hFacS');
DXG = rdmds('../Grids/3/DXG');
DYG = rdmds('../Grids/3/DYG');
DXC = rdmds('../Grids/3/DXC');
DYC = rdmds('../Grids/3/DYC');
XC = rdmds('../Grids/3/XC');
YC = rdmds('../Grids/3/YC');
RAC = squeeze(rdmds('../Grids/3/RAC'));
RC = squeeze(rdmds('../Grids/3/RC'));
RF = squeeze(rdmds('../Grids/3/RF'));
DRF = squeeze(rdmds('../Grids/3/DRF'));


% select area
x = 6:170;
y = 29:119;
z = 1:52; %
% z = 1:36; % top 1000 m

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz+1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = RAC(x,y);
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end
areaTop(:,:,nz+1) = RAC(x,y);
area = RAC(x,y);

volume3 = sum(sum(sum(volume)))


%%

hFacC = rdmds('../Grids/6/hFacC');
hFacW = rdmds('../Grids/6/hFacW');
hFacS = rdmds('../Grids/6/hFacS');
DXG = rdmds('../Grids/6/DXG');
DYG = rdmds('../Grids/6/DYG');
DXC = rdmds('../Grids/6/DXC');
DYC = rdmds('../Grids/6/DYC');
XC = rdmds('../Grids/6/XC');
YC = rdmds('../Grids/6/YC');
RAC = squeeze(rdmds('../Grids/6/RAC'));
RC = squeeze(rdmds('../Grids/6/RC'));
RF = squeeze(rdmds('../Grids/6/RF'));
DRF = squeeze(rdmds('../Grids/6/DRF'));

% select area
x = 11:340;
y = 54:235;
z = 1:52; %
% z = 1:36; % top 1000 m

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz+1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = RAC(x,y);
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end
areaTop(:,:,nz+1) = RAC(x,y);
area = RAC(x,y);

volume6 = sum(sum(sum(volume)))


%%

hFacC = rdmds('../Grids/12/hFacC');
hFacW = rdmds('../Grids/12/hFacW');
hFacS = rdmds('../Grids/12/hFacS');
DXG = rdmds('../Grids/12/DXG');
DYG = rdmds('../Grids/12/DYG');
DXC = rdmds('../Grids/12/DXC');
DYC = rdmds('../Grids/12/DYC');
XC = rdmds('../Grids/12/XC');
YC = rdmds('../Grids/12/YC');
RAC = squeeze(rdmds('../Grids/12/RAC'));
RC = squeeze(rdmds('../Grids/12/RC'));
RF = squeeze(rdmds('../Grids/12/RF'));
DRF = squeeze(rdmds('../Grids/12/DRF'));

% select area
x = 17:676;
y = 106:467;
z = 1:104; %
% z = 1:36; % top 1000 m

XC = XC(x,y);
YC = YC(x,y);
RC = RC(z);
hFacC = hFacC(x,y,z);
[nx,ny,nz] = size(hFacC);
dz = permute(repmat(DRF(z),[1,nx,ny]),[2,3,1]).*hFacC;

volume = zeros(nx,ny,nz);
areaWest = zeros(nx+1,ny,nz);
areaSouth = zeros(nx,ny+1,nz);
areaTop = zeros(nx,ny,nz+1);
for kk=1:nz
    volume(:,:,kk) = hFacC(:,:,kk).*RAC(x,y)*DRF(kk);
    areaTop(:,:,kk) = RAC(x,y);
    areaWest(:,:,kk)  = DYG([x x(end)+1],y).*DRF(kk).*hFacW([x x(end)+1],y,kk);
    areaSouth(:,:,kk) = DXG(x,[y y(end)+1]).*DRF(kk).*hFacS(x,[y y(end)+1],kk);
end
areaTop(:,:,nz+1) = RAC(x,y);
area = RAC(x,y);

volume12 = sum(sum(sum(volume)))

save volumes volume3 volume6 volume12









