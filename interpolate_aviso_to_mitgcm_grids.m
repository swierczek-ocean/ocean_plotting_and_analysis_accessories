clear
close all
clc

tic()
acc_settings

%%
load mask
load XY3 XC3 YC3
load XY6 XC6 YC6
load XY12 XC12 YC12
load ../2019_06_June_analysis/AB34_output ETAN*
load ../2019_06_June_analysis/AB64_output ETAN*
load ../2019_06_June_analysis/AB124_output ETAN*
load ../2019_06_June_analysis/AB32_output ETAN*
load ../2019_06_June_analysis/AB62_output ETAN*
load ../2019_06_June_analysis/AB122_output ETAN*
load AB_AVISO_adj
load AVISO_avgs

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
[XCA,YCA] = ndgrid(X_AVISO,Y_AVISO);
%%

clearvars -except *AVISO* XC* YC* ETAN*

%% NaNs

ETAN_32_DJF_avg(ETAN_32_DJF_avg>100000) = NaN;
ETAN_32_DJF_std(ETAN_32_DJF_std>100000) = NaN;

ETAN_32_JFM_avg(ETAN_32_JFM_avg>100000) = NaN;
ETAN_32_JFM_std(ETAN_32_JFM_std>100000) = NaN;

ETAN_32_DJFMAM_avg(ETAN_32_DJFMAM_avg>100000) = NaN;
ETAN_32_DJFMAM_std(ETAN_32_DJFMAM_std>100000) = NaN;

ETAN_32_JFMAMJ_avg(ETAN_32_JFMAMJ_avg>100000) = NaN;
ETAN_32_JFMAMJ_std(ETAN_32_JFMAMJ_std>100000) = NaN;

ETAN_32_DN_avg(ETAN_32_DN_avg>100000) = NaN;
ETAN_32_DN_std(ETAN_32_DN_std>100000) = NaN;

ETAN_32_JD_avg(ETAN_32_JD_avg>100000) = NaN;
ETAN_32_JD_std(ETAN_32_JD_std>100000) = NaN;

ETAN_34_JJA_avg(ETAN_34_JJA_avg>100000) = NaN;
ETAN_34_JJA_std(ETAN_34_JJA_std>100000) = NaN;

ETAN_34_JAS_avg(ETAN_34_JAS_avg>100000) = NaN;
ETAN_34_JAS_std(ETAN_34_JAS_std>100000) = NaN;

ETAN_34_JJASON_avg(ETAN_34_JJASON_avg>100000) = NaN;
ETAN_34_JJASON_std(ETAN_34_JJASON_std>100000) = NaN;

ETAN_34_JASOND_avg(ETAN_34_JASOND_avg>100000) = NaN;
ETAN_34_JASOND_std(ETAN_34_JASOND_std>100000) = NaN;

ETAN_62_DJF_avg(ETAN_62_DJF_avg>100000) = NaN;
ETAN_62_DJF_std(ETAN_62_DJF_std>100000) = NaN;

ETAN_62_JFM_avg(ETAN_62_JFM_avg>100000) = NaN;
ETAN_62_JFM_std(ETAN_62_JFM_std>100000) = NaN;

ETAN_62_DJFMAM_avg(ETAN_62_DJFMAM_avg>100000) = NaN;
ETAN_62_DJFMAM_std(ETAN_62_DJFMAM_std>100000) = NaN;

ETAN_62_JFMAMJ_avg(ETAN_62_JFMAMJ_avg>100000) = NaN;
ETAN_62_JFMAMJ_std(ETAN_62_JFMAMJ_std>100000) = NaN;

ETAN_62_DN_avg(ETAN_62_DN_avg>100000) = NaN;
ETAN_62_DN_std(ETAN_62_DN_std>100000) = NaN;

ETAN_62_JD_avg(ETAN_62_JD_avg>100000) = NaN;
ETAN_62_JD_std(ETAN_62_JD_std>100000) = NaN;

ETAN_64_JJA_avg(ETAN_64_JJA_avg>100000) = NaN;
ETAN_64_JJA_std(ETAN_64_JJA_std>100000) = NaN;

ETAN_64_JAS_avg(ETAN_64_JAS_avg>100000) = NaN;
ETAN_64_JAS_std(ETAN_64_JAS_std>100000) = NaN;

ETAN_64_JJASON_avg(ETAN_64_JJASON_avg>100000) = NaN;
ETAN_64_JJASON_std(ETAN_64_JJASON_std>100000) = NaN;

ETAN_64_JASOND_avg(ETAN_64_JASOND_avg>100000) = NaN;
ETAN_64_JASOND_std(ETAN_64_JASOND_std>100000) = NaN;

ETAN_122_DJF_avg(ETAN_122_DJF_avg>100000) = NaN;
ETAN_122_DJF_std(ETAN_122_DJF_std>100000) = NaN;

ETAN_122_JFM_avg(ETAN_122_JFM_avg>100000) = NaN;
ETAN_122_JFM_std(ETAN_122_JFM_std>100000) = NaN;

ETAN_122_DJFMAM_avg(ETAN_122_DJFMAM_avg>100000) = NaN;
ETAN_122_DJFMAM_std(ETAN_122_DJFMAM_std>100000) = NaN;

ETAN_122_JFMAMJ_avg(ETAN_122_JFMAMJ_avg>100000) = NaN;
ETAN_122_JFMAMJ_std(ETAN_122_JFMAMJ_std>100000) = NaN;

ETAN_122_DN_avg(ETAN_122_DN_avg>100000) = NaN;
ETAN_122_DN_std(ETAN_122_DN_std>100000) = NaN;

ETAN_122_JD_avg(ETAN_122_JD_avg>100000) = NaN;
ETAN_122_JD_std(ETAN_122_JD_std>100000) = NaN;

ETAN_124_JJA_avg(ETAN_124_JJA_avg>100000) = NaN;
ETAN_124_JJA_std(ETAN_124_JJA_std>100000) = NaN;

ETAN_124_JAS_avg(ETAN_124_JAS_avg>100000) = NaN;
ETAN_124_JAS_std(ETAN_124_JAS_std>100000) = NaN;

ETAN_124_JJASON_avg(ETAN_124_JJASON_avg>100000) = NaN;
ETAN_124_JJASON_std(ETAN_124_JJASON_std>100000) = NaN;

ETAN_124_JASOND_avg(ETAN_124_JASOND_avg>100000) = NaN;
ETAN_124_JASOND_std(ETAN_124_JASOND_std>100000) = NaN;

ind = find(isnan(D_AVISO_DJF_avg));

%% End NaNs

%% Fix ETAN

ETAN_mu = mean(ETAN_32_DJF_avg(isnan(ETAN_32_DJF_avg)==0));
ETAN_32_DJF_avg = ETAN_32_DJF_avg - ETAN_mu;
ETAN_mu = mean(ETAN_32_JFM_avg(isnan(ETAN_32_JFM_avg)==0));
ETAN_32_JFM_avg = ETAN_32_JFM_avg - ETAN_mu;
ETAN_mu = mean(ETAN_32_DJFMAM_avg(isnan(ETAN_32_DJFMAM_avg)==0));
ETAN_32_DJFMAM_avg = ETAN_32_DJFMAM_avg - ETAN_mu;
ETAN_mu = mean(ETAN_32_JFMAMJ_avg(isnan(ETAN_32_JFMAMJ_avg)==0));
ETAN_32_JFMAMJ_avg = ETAN_32_JFMAMJ_avg - ETAN_mu;
ETAN_mu = mean(ETAN_32_DN_avg(isnan(ETAN_32_DN_avg)==0));
ETAN_32_DN_avg = ETAN_32_DN_avg - ETAN_mu;
ETAN_mu = mean(ETAN_32_JD_avg(isnan(ETAN_32_JD_avg)==0));
ETAN_32_JD_avg = ETAN_32_JD_avg - ETAN_mu;
ETAN_mu = mean(ETAN_34_JJA_avg(isnan(ETAN_34_JJA_avg)==0));
ETAN_34_JJA_avg = ETAN_34_JJA_avg - ETAN_mu;
ETAN_mu = mean(ETAN_34_JAS_avg(isnan(ETAN_34_JAS_avg)==0));
ETAN_34_JAS_avg = ETAN_34_JAS_avg - ETAN_mu;
ETAN_mu = mean(ETAN_34_JJASON_avg(isnan(ETAN_34_JJASON_avg)==0));
ETAN_34_JJASON_avg = ETAN_34_JJASON_avg - ETAN_mu;
ETAN_mu = mean(ETAN_34_JASOND_avg(isnan(ETAN_34_JASOND_avg)==0));
ETAN_34_JASOND_avg = ETAN_34_JASOND_avg - ETAN_mu;

ETAN_mu = mean(ETAN_62_DJF_avg(isnan(ETAN_62_DJF_avg)==0));
ETAN_62_DJF_avg = ETAN_62_DJF_avg - ETAN_mu;
ETAN_mu = mean(ETAN_62_JFM_avg(isnan(ETAN_62_JFM_avg)==0));
ETAN_62_JFM_avg = ETAN_62_JFM_avg - ETAN_mu;
ETAN_mu = mean(ETAN_62_DJFMAM_avg(isnan(ETAN_62_DJFMAM_avg)==0));
ETAN_62_DJFMAM_avg = ETAN_62_DJFMAM_avg - ETAN_mu;
ETAN_mu = mean(ETAN_62_JFMAMJ_avg(isnan(ETAN_62_JFMAMJ_avg)==0));
ETAN_62_JFMAMJ_avg = ETAN_62_JFMAMJ_avg - ETAN_mu;
ETAN_mu = mean(ETAN_62_DN_avg(isnan(ETAN_62_DN_avg)==0));
ETAN_62_DN_avg = ETAN_62_DN_avg - ETAN_mu;
ETAN_mu = mean(ETAN_62_JD_avg(isnan(ETAN_62_JD_avg)==0));
ETAN_62_JD_avg = ETAN_62_JD_avg - ETAN_mu;
ETAN_mu = mean(ETAN_64_JJA_avg(isnan(ETAN_64_JJA_avg)==0));
ETAN_64_JJA_avg = ETAN_64_JJA_avg - ETAN_mu;
ETAN_mu = mean(ETAN_64_JAS_avg(isnan(ETAN_64_JAS_avg)==0));
ETAN_64_JAS_avg = ETAN_64_JAS_avg - ETAN_mu;
ETAN_mu = mean(ETAN_64_JJASON_avg(isnan(ETAN_64_JJASON_avg)==0));
ETAN_64_JJASON_avg = ETAN_64_JJASON_avg - ETAN_mu;
ETAN_mu = mean(ETAN_64_JASOND_avg(isnan(ETAN_64_JASOND_avg)==0));
ETAN_64_JASOND_avg = ETAN_64_JASOND_avg - ETAN_mu;

ETAN_mu = mean(ETAN_122_DJF_avg(isnan(ETAN_122_DJF_avg)==0));
ETAN_122_DJF_avg = ETAN_122_DJF_avg - ETAN_mu;
ETAN_mu = mean(ETAN_122_JFM_avg(isnan(ETAN_122_JFM_avg)==0));
ETAN_122_JFM_avg = ETAN_122_JFM_avg - ETAN_mu;
ETAN_mu = mean(ETAN_122_DJFMAM_avg(isnan(ETAN_122_DJFMAM_avg)==0));
ETAN_122_DJFMAM_avg = ETAN_122_DJFMAM_avg - ETAN_mu;
ETAN_mu = mean(ETAN_122_JFMAMJ_avg(isnan(ETAN_122_JFMAMJ_avg)==0));
ETAN_122_JFMAMJ_avg = ETAN_122_JFMAMJ_avg - ETAN_mu;
ETAN_mu = mean(ETAN_122_DN_avg(isnan(ETAN_122_DN_avg)==0));
ETAN_122_DN_avg = ETAN_122_DN_avg - ETAN_mu;
ETAN_mu = mean(ETAN_122_JD_avg(isnan(ETAN_122_JD_avg)==0));
ETAN_122_JD_avg = ETAN_122_JD_avg - ETAN_mu;
ETAN_mu = mean(ETAN_124_JJA_avg(isnan(ETAN_124_JJA_avg)==0));
ETAN_124_JJA_avg = ETAN_124_JJA_avg - ETAN_mu;
ETAN_mu = mean(ETAN_124_JAS_avg(isnan(ETAN_124_JAS_avg)==0));
ETAN_124_JAS_avg = ETAN_124_JAS_avg - ETAN_mu;
ETAN_mu = mean(ETAN_124_JJASON_avg(isnan(ETAN_124_JJASON_avg)==0));
ETAN_124_JJASON_avg = ETAN_124_JJASON_avg - ETAN_mu;
ETAN_mu = mean(ETAN_124_JASOND_avg(isnan(ETAN_124_JASOND_avg)==0));
ETAN_124_JASOND_avg = ETAN_124_JASOND_avg - ETAN_mu;
%% End Fix ETAN

%% Fill Missing

ETAN_122_DJF_avg = fillmissingstan(ETAN_122_DJF_avg);
ETAN_122_DJF_std = fillmissingstan(ETAN_122_DJF_std);

ETAN_122_JFM_avg = fillmissingstan(ETAN_122_JFM_avg);
ETAN_122_JFM_std = fillmissingstan(ETAN_122_JFM_std);

ETAN_122_DJFMAM_avg = fillmissingstan(ETAN_122_DJFMAM_avg);
ETAN_122_DJFMAM_std = fillmissingstan(ETAN_122_DJFMAM_std);

ETAN_122_JFMAMJ_avg = fillmissingstan(ETAN_122_JFMAMJ_avg);
ETAN_122_JFMAMJ_std = fillmissingstan(ETAN_122_JFMAMJ_std);

ETAN_122_DN_avg = fillmissingstan(ETAN_122_DN_avg);
ETAN_122_DN_std = fillmissingstan(ETAN_122_DN_std);

ETAN_122_JD_avg = fillmissingstan(ETAN_122_JD_avg);
ETAN_122_JD_std = fillmissingstan(ETAN_122_JD_std);

ETAN_124_JJA_avg = fillmissingstan(ETAN_124_JJA_avg);
ETAN_124_JJA_std = fillmissingstan(ETAN_124_JJA_std);

ETAN_124_JAS_avg = fillmissingstan(ETAN_124_JAS_avg);
ETAN_124_JAS_std = fillmissingstan(ETAN_124_JAS_std);

ETAN_124_JJASON_avg = fillmissingstan(ETAN_124_JJASON_avg);
ETAN_124_JJASON_std = fillmissingstan(ETAN_124_JJASON_std);

ETAN_124_JASOND_avg = fillmissingstan(ETAN_124_JASOND_avg);
ETAN_124_JASOND_std = fillmissingstan(ETAN_124_JASOND_std);

ETAN_62_DJF_avg = fillmissingstan(ETAN_62_DJF_avg);
ETAN_62_DJF_std = fillmissingstan(ETAN_62_DJF_std);

ETAN_62_JFM_avg = fillmissingstan(ETAN_62_JFM_avg);
ETAN_62_JFM_std = fillmissingstan(ETAN_62_JFM_std);

ETAN_62_DJFMAM_avg = fillmissingstan(ETAN_62_DJFMAM_avg);
ETAN_62_DJFMAM_std = fillmissingstan(ETAN_62_DJFMAM_std);

ETAN_62_JFMAMJ_avg = fillmissingstan(ETAN_62_JFMAMJ_avg);
ETAN_62_JFMAMJ_std = fillmissingstan(ETAN_62_JFMAMJ_std);

ETAN_62_DN_avg = fillmissingstan(ETAN_62_DN_avg);
ETAN_62_DN_std = fillmissingstan(ETAN_62_DN_std);

ETAN_62_JD_avg = fillmissingstan(ETAN_62_JD_avg);
ETAN_62_JD_std = fillmissingstan(ETAN_62_JD_std);

ETAN_64_JJA_avg = fillmissingstan(ETAN_64_JJA_avg);
ETAN_64_JJA_std = fillmissingstan(ETAN_64_JJA_std);

ETAN_64_JAS_avg = fillmissingstan(ETAN_64_JAS_avg);
ETAN_64_JAS_std = fillmissingstan(ETAN_64_JAS_std);

ETAN_64_JJASON_avg = fillmissingstan(ETAN_64_JJASON_avg);
ETAN_64_JJASON_std = fillmissingstan(ETAN_64_JJASON_std);

ETAN_64_JASOND_avg = fillmissingstan(ETAN_64_JASOND_avg);
ETAN_64_JASOND_std = fillmissingstan(ETAN_64_JASOND_std);

ETAN_32_DJF_avg = fillmissingstan(ETAN_32_DJF_avg);
ETAN_32_DJF_std = fillmissingstan(ETAN_32_DJF_std);

ETAN_32_JFM_avg = fillmissingstan(ETAN_32_JFM_avg);
ETAN_32_JFM_std = fillmissingstan(ETAN_32_JFM_std);

ETAN_32_DJFMAM_avg = fillmissingstan(ETAN_32_DJFMAM_avg);
ETAN_32_DJFMAM_std = fillmissingstan(ETAN_32_DJFMAM_std);

ETAN_32_JFMAMJ_avg = fillmissingstan(ETAN_32_JFMAMJ_avg);
ETAN_32_JFMAMJ_std = fillmissingstan(ETAN_32_JFMAMJ_std);

ETAN_32_DN_avg = fillmissingstan(ETAN_32_DN_avg);
ETAN_32_DN_std = fillmissingstan(ETAN_32_DN_std);

ETAN_32_JD_avg = fillmissingstan(ETAN_32_JD_avg);
ETAN_32_JD_std = fillmissingstan(ETAN_32_JD_std);

ETAN_34_JJA_avg = fillmissingstan(ETAN_34_JJA_avg);
ETAN_34_JJA_std = fillmissingstan(ETAN_34_JJA_std);

ETAN_34_JAS_avg = fillmissingstan(ETAN_34_JAS_avg);
ETAN_34_JAS_std = fillmissingstan(ETAN_34_JAS_std);

ETAN_34_JJASON_avg = fillmissingstan(ETAN_34_JJASON_avg);
ETAN_34_JJASON_std = fillmissingstan(ETAN_34_JJASON_std);

ETAN_34_JASOND_avg = fillmissingstan(ETAN_34_JASOND_avg);
ETAN_34_JASOND_std = fillmissingstan(ETAN_34_JASOND_std);

D_AVISO_DJF_avg = fillmissingstan(D_AVISO_DJF_avg);
D_AVISO_DJF_std = fillmissingstan(D_AVISO_DJF_std);

D_AVISO_JFM_avg = fillmissingstan(D_AVISO_JFM_avg);
D_AVISO_JFM_std = fillmissingstan(D_AVISO_JFM_std);

D_AVISO_DJFMAM_avg = fillmissingstan(D_AVISO_DJFMAM_avg);
D_AVISO_DJFMAM_std = fillmissingstan(D_AVISO_DJFMAM_std);

D_AVISO_JFMAMJ_avg = fillmissingstan(D_AVISO_JFMAMJ_avg);
D_AVISO_JFMAMJ_std = fillmissingstan(D_AVISO_JFMAMJ_std);

D_AVISO_DN_avg = fillmissingstan(D_AVISO_DN_avg);
D_AVISO_DN_std = fillmissingstan(D_AVISO_DN_std);

D_AVISO_JD_avg = fillmissingstan(D_AVISO_JD_avg);
D_AVISO_JD_std = fillmissingstan(D_AVISO_JD_std);

D_AVISO_JJA_avg = fillmissingstan(D_AVISO_JJA_avg);
D_AVISO_JJA_std = fillmissingstan(D_AVISO_JJA_std);

D_AVISO_JAS_avg = fillmissingstan(D_AVISO_JAS_avg);
D_AVISO_JAS_std = fillmissingstan(D_AVISO_JAS_std);

D_AVISO_JJASON_avg = fillmissingstan(D_AVISO_JJASON_avg);
D_AVISO_JJASON_std = fillmissingstan(D_AVISO_JJASON_std);

D_AVISO_JASOND_avg = fillmissingstan(D_AVISO_JASOND_avg);
D_AVISO_JASOND_std = fillmissingstan(D_AVISO_JASOND_std);
%% End Fill Missing

%% Interpolate

F = griddedInterpolant(XC3,YC3,ETAN_32_DJF_avg,'linear');
ETAN_32_DJF_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_32_DJF_std,'linear');
ETAN_32_DJF_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_32_JFM_avg,'linear');
ETAN_32_JFM_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_32_JFM_std,'linear');
ETAN_32_JFM_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_32_DJFMAM_avg,'linear');
ETAN_32_DJFMAM_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_32_DJFMAM_std,'linear');
ETAN_32_DJFMAM_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_32_JFMAMJ_avg,'linear');
ETAN_32_JFMAMJ_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_32_JFMAMJ_std,'linear');
ETAN_32_JFMAMJ_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_32_DN_avg,'linear');
ETAN_32_DN_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_32_DN_std,'linear');
ETAN_32_DN_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_32_JD_avg,'linear');
ETAN_32_JD_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_32_JD_std,'linear');
ETAN_32_JD_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_34_JJA_avg,'linear');
ETAN_34_JJA_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_34_JJA_std,'linear');
ETAN_34_JJA_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_34_JAS_avg,'linear');
ETAN_34_JAS_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_34_JAS_std,'linear');
ETAN_34_JAS_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_34_JJASON_avg,'linear');
ETAN_34_JJASON_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_34_JJASON_std,'linear');
ETAN_34_JJASON_std = F(XCA,YCA);

F = griddedInterpolant(XC3,YC3,ETAN_34_JASOND_avg,'linear');
ETAN_34_JASOND_avg = F(XCA,YCA);
F = griddedInterpolant(XC3,YC3,ETAN_34_JASOND_std,'linear');
ETAN_34_JASOND_std = F(XCA,YCA);

F = griddedInterpolant(XC6,YC6,ETAN_62_DJF_avg,'linear');
ETAN_62_DJF_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_62_DJF_std,'linear');
ETAN_62_DJF_std = F(XCA,YCA);

F = griddedInterpolant(XC6,YC6,ETAN_62_JFM_avg,'linear');
ETAN_62_JFM_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_62_JFM_std,'linear');
ETAN_62_JFM_std = F(XCA,YCA);

F = griddedInterpolant(XC6,YC6,ETAN_62_DJFMAM_avg,'linear');
ETAN_62_DJFMAM_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_62_DJFMAM_std,'linear');
ETAN_62_DJFMAM_std = F(XCA,YCA);


F = griddedInterpolant(XC6,YC6,ETAN_62_JFMAMJ_avg,'linear');
ETAN_62_JFMAMJ_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_62_JFMAMJ_std,'linear');
ETAN_62_JFMAMJ_std = F(XCA,YCA);


F = griddedInterpolant(XC6,YC6,ETAN_62_DN_avg,'linear');
ETAN_62_DN_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_62_DN_std,'linear');
ETAN_62_DN_std = F(XCA,YCA);

F = griddedInterpolant(XC6,YC6,ETAN_62_JD_avg,'linear');
ETAN_62_JD_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_62_JD_std,'linear');
ETAN_62_JD_std = F(XCA,YCA);

F = griddedInterpolant(XC6,YC6,ETAN_64_JJA_avg,'linear');
ETAN_64_JJA_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_64_JJA_std,'linear');
ETAN_64_JJA_std = F(XCA,YCA);

F = griddedInterpolant(XC6,YC6,ETAN_64_JAS_avg,'linear');
ETAN_64_JAS_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_64_JAS_std,'linear');
ETAN_64_JAS_std = F(XCA,YCA);

F = griddedInterpolant(XC6,YC6,ETAN_64_JJASON_avg,'linear');
ETAN_64_JJASON_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_64_JJASON_std,'linear');
ETAN_64_JJASON_std = F(XCA,YCA);

F = griddedInterpolant(XC6,YC6,ETAN_64_JASOND_avg,'linear');
ETAN_64_JASOND_avg = F(XCA,YCA);
F = griddedInterpolant(XC6,YC6,ETAN_64_JASOND_std,'linear');
ETAN_64_JASOND_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_122_DJF_avg,'linear');
ETAN_122_DJF_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_122_DJF_std,'linear');
ETAN_122_DJF_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_122_JFM_avg,'linear');
ETAN_122_JFM_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_122_JFM_std,'linear');
ETAN_122_JFM_std = F(XCA,YCA);


F = griddedInterpolant(XC12,YC12,ETAN_122_DJFMAM_avg,'linear');
ETAN_122_DJFMAM_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_122_DJFMAM_std,'linear');
ETAN_122_DJFMAM_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_122_JFMAMJ_avg,'linear');
ETAN_122_JFMAMJ_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_122_JFMAMJ_std,'linear');
ETAN_122_JFMAMJ_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_122_DN_avg,'linear');
ETAN_122_DN_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_122_DN_std,'linear');
ETAN_122_DN_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_122_JD_avg,'linear');
ETAN_122_JD_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_122_JD_std,'linear');
ETAN_122_JD_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_124_JJA_avg,'linear');
ETAN_124_JJA_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_124_JJA_std,'linear');
ETAN_124_JJA_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_124_JAS_avg,'linear');
ETAN_124_JAS_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_124_JAS_std,'linear');
ETAN_124_JAS_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_124_JJASON_avg,'linear');
ETAN_124_JJASON_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_124_JJASON_std,'linear');
ETAN_124_JJASON_std = F(XCA,YCA);

F = griddedInterpolant(XC12,YC12,ETAN_124_JASOND_avg,'linear');
ETAN_124_JASOND_avg = F(XCA,YCA);
F = griddedInterpolant(XC12,YC12,ETAN_124_JASOND_std,'linear');
ETAN_124_JASOND_std = F(XCA,YCA);

%% End Interpolate

%% Take Difference
ETAN_32_DJF_avg_diff = ETAN_32_DJF_avg - D_AVISO_DJF_avg;
ETAN_32_DJF_std_diff = ETAN_32_DJF_std - D_AVISO_DJF_avg;

ETAN_32_JFM_avg_diff = ETAN_32_JFM_avg - D_AVISO_JFM_avg;
ETAN_32_JFM_std_diff = ETAN_32_JFM_std - D_AVISO_JFM_avg;

ETAN_32_DJFMAM_avg_diff = ETAN_32_DJFMAM_avg - D_AVISO_DJFMAM_avg;
ETAN_32_DJFMAM_std_diff = ETAN_32_DJFMAM_std - D_AVISO_DJFMAM_avg;

ETAN_32_JFMAMJ_avg_diff = ETAN_32_JFMAMJ_avg - D_AVISO_JFMAMJ_avg;
ETAN_32_JFMAMJ_std_diff = ETAN_32_JFMAMJ_std - D_AVISO_JFMAMJ_avg;

ETAN_32_DN_avg_diff = ETAN_32_DN_avg - D_AVISO_DN_avg;
ETAN_32_DN_std_diff = ETAN_32_DN_std - D_AVISO_DN_avg;

ETAN_32_JD_avg_diff = ETAN_32_JD_avg - D_AVISO_JD_avg;
ETAN_32_JD_std_diff = ETAN_32_JD_std - D_AVISO_JD_avg;

ETAN_34_JJA_avg_diff = ETAN_34_JJA_avg - D_AVISO_JJA_avg;
ETAN_34_JJA_std_diff = ETAN_34_JJA_std - D_AVISO_JJA_avg;

ETAN_34_JAS_avg_diff = ETAN_34_JAS_avg - D_AVISO_JAS_avg;
ETAN_34_JAS_std_diff = ETAN_34_JAS_std - D_AVISO_JAS_avg;

ETAN_34_JJASON_avg_diff = ETAN_34_JJASON_avg - D_AVISO_JJASON_avg;
ETAN_34_JJASON_std_diff = ETAN_34_JJASON_std - D_AVISO_JJASON_avg;

ETAN_34_JASOND_avg_diff = ETAN_34_JASOND_avg - D_AVISO_JASOND_avg;
ETAN_34_JASOND_std_diff = ETAN_34_JASOND_std - D_AVISO_JASOND_avg;

ETAN_62_DJF_avg_diff = ETAN_62_DJF_avg - D_AVISO_DJF_avg;
ETAN_62_DJF_std_diff = ETAN_62_DJF_std - D_AVISO_DJF_avg;

ETAN_62_JFM_avg_diff = ETAN_62_JFM_avg - D_AVISO_JFM_avg;
ETAN_62_JFM_std_diff = ETAN_62_JFM_std - D_AVISO_JFM_avg;

ETAN_62_DJFMAM_avg_diff = ETAN_62_DJFMAM_avg - D_AVISO_DJFMAM_avg;
ETAN_62_DJFMAM_std_diff = ETAN_62_DJFMAM_std - D_AVISO_DJFMAM_avg;

ETAN_62_JFMAMJ_avg_diff = ETAN_62_JFMAMJ_avg - D_AVISO_JFMAMJ_avg;
ETAN_62_JFMAMJ_std_diff = ETAN_62_JFMAMJ_std - D_AVISO_JFMAMJ_avg;

ETAN_62_DN_avg_diff = ETAN_62_DN_avg - D_AVISO_DN_avg;
ETAN_62_DN_std_diff = ETAN_62_DN_std - D_AVISO_DN_avg;

ETAN_62_JD_avg_diff = ETAN_62_JD_avg - D_AVISO_JD_avg;
ETAN_62_JD_std_diff = ETAN_62_JD_std - D_AVISO_JD_avg;

ETAN_64_JJA_avg_diff = ETAN_64_JJA_avg - D_AVISO_JJA_avg;
ETAN_64_JJA_std_diff = ETAN_64_JJA_std - D_AVISO_JJA_avg;

ETAN_64_JAS_avg_diff = ETAN_64_JAS_avg - D_AVISO_JAS_avg;
ETAN_64_JAS_std_diff = ETAN_64_JAS_std - D_AVISO_JAS_avg;

ETAN_64_JJASON_avg_diff = ETAN_64_JJASON_avg - D_AVISO_JJASON_avg;
ETAN_64_JJASON_std_diff = ETAN_64_JJASON_std - D_AVISO_JJASON_avg;

ETAN_64_JASOND_avg_diff = ETAN_64_JASOND_avg - D_AVISO_JASOND_avg;
ETAN_64_JASOND_std_diff = ETAN_64_JASOND_std - D_AVISO_JASOND_avg;

ETAN_122_DJF_avg_diff = ETAN_122_DJF_avg - D_AVISO_DJF_avg;
ETAN_122_DJF_std_diff = ETAN_122_DJF_std - D_AVISO_DJF_avg;

ETAN_122_JFM_avg_diff = ETAN_122_JFM_avg - D_AVISO_JFM_avg;
ETAN_122_JFM_std_diff = ETAN_122_JFM_std - D_AVISO_JFM_avg;

ETAN_122_DJFMAM_avg_diff = ETAN_122_DJFMAM_avg - D_AVISO_DJFMAM_avg;
ETAN_122_DJFMAM_std_diff = ETAN_122_DJFMAM_std - D_AVISO_DJFMAM_avg;

ETAN_122_JFMAMJ_avg_diff = ETAN_122_JFMAMJ_avg - D_AVISO_JFMAMJ_avg;
ETAN_122_JFMAMJ_std_diff = ETAN_122_JFMAMJ_std - D_AVISO_JFMAMJ_avg;

ETAN_122_DN_avg_diff = ETAN_122_DN_avg - D_AVISO_DN_avg;
ETAN_122_DN_std_diff = ETAN_122_DN_std - D_AVISO_DN_avg;

ETAN_122_JD_avg_diff = ETAN_122_JD_avg - D_AVISO_JD_avg;
ETAN_122_JD_std_diff = ETAN_122_JD_std - D_AVISO_JD_avg;

ETAN_124_JJA_avg_diff = ETAN_124_JJA_avg - D_AVISO_JJA_avg;
ETAN_124_JJA_std_diff = ETAN_124_JJA_std - D_AVISO_JJA_avg;

ETAN_124_JAS_avg_diff = ETAN_124_JAS_avg - D_AVISO_JAS_avg;
ETAN_124_JAS_std_diff = ETAN_124_JAS_std - D_AVISO_JAS_avg;

ETAN_124_JJASON_avg_diff = ETAN_124_JJASON_avg - D_AVISO_JJASON_avg;
ETAN_124_JJASON_std_diff = ETAN_124_JJASON_std - D_AVISO_JJASON_avg;

ETAN_124_JASOND_avg_diff = ETAN_124_JASOND_avg - D_AVISO_JASOND_avg;
ETAN_124_JASOND_std_diff = ETAN_124_JASOND_std - D_AVISO_JASOND_avg;
%% End Difference

%% Put Land Value In
ETAN_122_DJF_avg_diff(ind) = 999999999; 
ETAN_122_DJF_std_diff(ind) = 999999999; 

ETAN_122_JFM_avg_diff(ind) = 999999999; 
ETAN_122_JFM_std_diff(ind) = 999999999; 

ETAN_122_DJFMAM_avg_diff(ind) = 999999999; 
ETAN_122_DJFMAM_std_diff(ind) = 999999999; 

ETAN_122_JFMAMJ_avg_diff(ind) = 999999999; 
ETAN_122_JFMAMJ_std_diff(ind) = 999999999; 

ETAN_122_DN_avg_diff(ind) = 999999999; 
ETAN_122_DN_std_diff(ind) = 999999999; 

ETAN_122_JD_avg_diff(ind) = 999999999; 
ETAN_122_JD_std_diff(ind) = 999999999; 

ETAN_124_JJA_avg_diff(ind) = 999999999; 
ETAN_124_JJA_std_diff(ind) = 999999999; 

ETAN_124_JAS_avg_diff(ind) = 999999999; 
ETAN_124_JAS_std_diff(ind) = 999999999; 

ETAN_124_JJASON_avg_diff(ind) = 999999999; 
ETAN_124_JJASON_std_diff(ind) = 999999999; 

ETAN_124_JASOND_avg_diff(ind) = 999999999;
ETAN_124_JASOND_std_diff(ind) = 999999999;

ETAN_62_DJF_avg_diff(ind) = 999999999; 
ETAN_62_DJF_std_diff(ind) = 999999999; 

ETAN_62_JFM_avg_diff(ind) = 999999999; 
ETAN_62_JFM_std_diff(ind) = 999999999; 

ETAN_62_DJFMAM_avg_diff(ind) = 999999999; 
ETAN_62_DJFMAM_std_diff(ind) = 999999999; 

ETAN_62_JFMAMJ_avg_diff(ind) = 999999999; 
ETAN_62_JFMAMJ_std_diff(ind) = 999999999; 

ETAN_62_DN_avg_diff(ind) = 999999999; 
ETAN_62_DN_std_diff(ind) = 999999999; 

ETAN_62_JD_avg_diff(ind) = 999999999; 
ETAN_62_JD_std_diff(ind) = 999999999; 

ETAN_64_JJA_avg_diff(ind) = 999999999; 
ETAN_64_JJA_std_diff(ind) = 999999999; 

ETAN_64_JAS_avg_diff(ind) = 999999999; 
ETAN_64_JAS_std_diff(ind) = 999999999; 

ETAN_64_JJASON_avg_diff(ind) = 999999999; 
ETAN_64_JJASON_std_diff(ind) = 999999999; 

ETAN_64_JASOND_avg_diff(ind) = 999999999;
ETAN_64_JASOND_std_diff(ind) = 999999999;

ETAN_32_DJF_avg_diff(ind) = 999999999; 
ETAN_32_DJF_std_diff(ind) = 999999999; 

ETAN_32_JFM_avg_diff(ind) = 999999999; 
ETAN_32_JFM_std_diff(ind) = 999999999; 

ETAN_32_DJFMAM_avg_diff(ind) = 999999999; 
ETAN_32_DJFMAM_std_diff(ind) = 999999999; 

ETAN_32_JFMAMJ_avg_diff(ind) = 999999999; 
ETAN_32_JFMAMJ_std_diff(ind) = 999999999; 

ETAN_32_DN_avg_diff(ind) = 999999999; 
ETAN_32_DN_std_diff(ind) = 999999999; 

ETAN_32_JD_avg_diff(ind) = 999999999; 
ETAN_32_JD_std_diff(ind) = 999999999; 

ETAN_34_JJA_avg_diff(ind) = 999999999; 
ETAN_34_JJA_std_diff(ind) = 999999999; 

ETAN_34_JAS_avg_diff(ind) = 999999999; 
ETAN_34_JAS_std_diff(ind) = 999999999; 

ETAN_34_JJASON_avg_diff(ind) = 999999999; 
ETAN_34_JJASON_std_diff(ind) = 999999999; 

ETAN_34_JASOND_avg_diff(ind) = 999999999;
ETAN_34_JASOND_std_diff(ind) = 999999999;

D_AVISO_DJF_avg(ind) = 999999999; 
D_AVISO_DJF_std(ind) = 999999999; 

D_AVISO_JFM_avg(ind) = 999999999; 
D_AVISO_JFM_std(ind) = 999999999; 

D_AVISO_DJFMAM_avg(ind) = 999999999; 
D_AVISO_DJFMAM_std(ind) = 999999999; 

D_AVISO_JFMAMJ_avg(ind) = 999999999; 
D_AVISO_JFMAMJ_std(ind) = 999999999; 

D_AVISO_DN_avg(ind) = 999999999; 
D_AVISO_DN_std(ind) = 999999999; 

D_AVISO_JD_avg(ind) = 999999999; 
D_AVISO_JD_std(ind) = 999999999; 

D_AVISO_JJA_avg(ind) = 999999999; 
D_AVISO_JJA_std(ind) = 999999999; 

D_AVISO_JAS_avg(ind) = 999999999; 
D_AVISO_JAS_std(ind) = 999999999; 

D_AVISO_JJASON_avg(ind) = 999999999; 
D_AVISO_JJASON_std(ind) = 999999999; 

D_AVISO_JASOND_avg(ind) = 999999999; 
D_AVISO_JASOND_std(ind) = 999999999; 

%% End Put Land Value In

clearvars -except *AVISO* XCA YCA ETAN*
save AVISO_diff_avgs

toc()