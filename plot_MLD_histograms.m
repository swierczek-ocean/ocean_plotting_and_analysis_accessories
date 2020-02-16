clear
close all
clc

tic()
acc_settings

%%
load MLD_Series32 MLD*
load MLD_Series62 MLD*
load MLD_Series122 MLD*
%%

%%
acc_colors
lw = 2.9;
c3 = 55;
c6 = 56;
c12 = 57;
alpha = 0.8;
%%

x = 6:170;
y = 29:119;
MLD_Series32 = MLD_Series32(x,y,:);

x = 11:340;
y = 54:235;
MLD_Series62 = MLD_Series62(x,y,:);

x = 17:676;
y = 106:467;
MLD_Series122 = MLD_Series122(x,y,:);


mld12 = MLD_Series122(isnan(MLD_Series122)==0);
mld6 = MLD_Series62(isnan(MLD_Series62)==0);
mld3 = MLD_Series32(isnan(MLD_Series32)==0);

TS3 = zeros(365,1);
TS6 = TS3;
TS12 = TS3;

for ii=1:365
    temp = MLD_Series122(:,:,ii+31);
    temp = temp(isnan(temp)==0);
    TS12(ii) = mean(temp);
    clear temp
    
    temp = MLD_Series62(:,:,ii+31);
    temp = temp(isnan(temp)==0);
    TS6(ii) = mean(temp);
    clear temp
    
    temp = MLD_Series32(:,:,ii+31);
    temp = temp(isnan(temp)==0);
    TS3(ii) = mean(temp);
    clear temp    
end
    
clear MLD_Series*

str = 'cdf';
x = -200:10:0;
histogram(mld3,x,'Normalization',str)
hold on
histogram(mld6,x,'Normalization',str)
histogram(mld12,x,'Normalization',str)


    
toc()