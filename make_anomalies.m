clear
close all
clc
tic()

%%
load vert_wvel_theta_dic
load ODA_wt
load rgt
load woa_t
depth = -depth;
depthrg = -depthrg;

depths = ([-5:-5:-200,-210:-10:-400,-420:-20:-2000])';
%%

intodat = interp1(RCt,odat,depths,'linear');
intwoat = interp1(depth,woa_t,depths,'linear');
intrgt = interp1(depthrg,rgt,depths,'linear');
int3 = interp1(RC3,theta320,depths,'linear');
int6 = interp1(RC3,theta620,depths,'linear');
int12 = interp1(RC3,theta1220,depths,'linear');

mean_t = (intodat + intwoat + intrgt + int3 + int6 + int12)./6;

anomodat = intodat - mean_t;
anomwoat = intwoat - mean_t;
anomrgt = intrgt - mean_t;
anomt3 = int3 - mean_t;
anomt6 = int6 - mean_t;
anomt12 = int12 - mean_t;


intodaw = interp1(RFt,odaw,RF3,'linear');

mean_w = (intodaw + wvel320 + wvel620 + wvel1220)./4;

anomodaw = intodaw - mean_w;
anomw3 = wvel320 - mean_w;
anomw6 = wvel620 - mean_w;
anomw12 = wvel1220 - mean_w;

save anomalies anom* depths RF3

toc()