clear
close all
clc 
tic()

load flux tflux*
load ECCO_TSUVW eccotflux elat elon
load SODA3 sodatflux XCS YCS
load ERAflx thf lat long

elon = elon + 360;
[elon,elat] = ndgrid(elon,elat);
[XCS,YCS] = ndgrid(XCS,YCS);
[long,lat] = ndgrid(long,lat);

md = [0,31,28,31,30,31,30,31,31,30,31,30,31];
cmd = cumsum(md);

temp3 = zeros(192,132,17);
temp6 = zeros(384,260,17);
temp12 = zeros(756,512,17);
tempecco = zeros(140,80,17);
tempsoda = zeros(140,80,17);
tempera = zeros(281,161,17);

tempecco(:,:,1:12) = eccotflux;
tempsoda(:,:,1:12) = sodatflux;
tempera(:,:,1:12) = thf;

for ii=1:12
    temp3(:,:,ii) = mean(tflux_3(:,:,(cmd(ii)+1):cmd(ii+1)),3);
    temp6(:,:,ii) = mean(tflux_6(:,:,(cmd(ii)+1):cmd(ii+1)),3);
    temp12(:,:,ii) = mean(tflux_12(:,:,(cmd(ii)+1):cmd(ii+1)),3);
end

clear tflux_*

A = [1,2,3;4,5,6;7,8,9;10,11,12];

for ii=1:4
    temp3(:,:,ii+12) = mean(temp3(:,:,A(ii,:)),3);
    temp6(:,:,ii+12) = mean(temp6(:,:,A(ii,:)),3);
    temp12(:,:,ii+12) = mean(temp12(:,:,A(ii,:)),3);
    tempecco(:,:,ii+12) = mean(tempecco(:,:,A(ii,:)),3);
    tempsoda(:,:,ii+12) = mean(tempsoda(:,:,A(ii,:)),3);
    tempera(:,:,ii+12) = mean(tempera(:,:,A(ii,:)),3);
end

temp3(:,:,17) = mean(temp3(:,:,1:12),3);
temp6(:,:,17) = mean(temp6(:,:,1:12),3);
temp12(:,:,17) = mean(temp12(:,:,1:12),3);
tempecco(:,:,17) = mean(tempecco(:,:,1:12),3);
tempsoda(:,:,17) = mean(tempsoda(:,:,1:12),3);
tempera(:,:,17) = mean(tempera(:,:,1:12),3);

tflux3 = temp3;
tflux6 = temp6;
tflux12 = temp12;
tfluxecco = tempecco;
tfluxsoda = tempsoda;
tfluxera = tempera;

save fluxes tflux* XCS YCS elon elat lat long



toc()