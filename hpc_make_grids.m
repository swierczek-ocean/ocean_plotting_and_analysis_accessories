clear
close all
clc
tic()

str = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/';

str32 = 'SO3_20190513/run/';
str34 = 'SO3_20190515/run/';
str62 = 'SO6_20190513/run/';
str64 = 'SO6_20190515/run/';
str122 = 'SO12_20190513/run/';
str124 = 'SO12_20190515/run/';

strXC = 'XC';
strYC = 'YC';
strD = 'Depth';
strDRF = 'DRF';


XC = rdmds([str,str32,strXC]);
YC = rdmds([str,str32,strYC]);
Depth = rdmds([str,str32,strD]);
DRF = rdmds([str,str32,strDRF]);

save grid32 XC YC Depth DRF

XC = rdmds([str,str34,strXC]);
YC = rdmds([str,str34,strYC]);
Depth = rdmds([str,str34,strD]);
DRF = rdmds([str,str34,strDRF]);

save grid34 XC YC Depth DRF

XC = rdmds([str,str62,strXC]);
YC = rdmds([str,str62,strYC]);
Depth = rdmds([str,str62,strD]);
DRF = rdmds([str,str62,strDRF]);

save grid62 XC YC Depth DRF

XC = rdmds([str,str64,strXC]);
YC = rdmds([str,str64,strYC]);
Depth = rdmds([str,str64,strD]);
DRF = rdmds([str,str64,strDRF]);

save grid64 XC YC Depth DRF

XC = rdmds([str,str122,strXC]);
YC = rdmds([str,str122,strYC]);
Depth = rdmds([str,str122,strD]);
DRF = rdmds([str,str122,strDRF]);

save grid122 XC YC Depth DRF

XC = rdmds([str,str124,strXC]);
YC = rdmds([str,str124,strYC]);
Depth = rdmds([str,str124,strD]);
DRF = rdmds([str,str124,strDRF]);

save grid124 XC YC Depth DRF






toc()