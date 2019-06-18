clear
close all
clc

tic()
acc_settings

%%
load mask
load XY3 
load XY6 
load XY12 
load SO3_34_output
load SO3_64_output
load SO3_124_output
load SO3_32_output
load SO3_62_output
load SO3_122_output
load BSOSE_surf_avgs

[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
%%

%% NaNs
CFLUX_32_DJF_avg(CFLUX_32_DJF_avg>100000) = NaN;
OFLUX_32_DJF_avg(OFLUX_32_DJF_avg>100000) = NaN;
TFLUX_32_DJF_avg(TFLUX_32_DJF_avg>100000) = NaN;
SFLUX_32_DJF_avg(SFLUX_32_DJF_avg>100000) = NaN;
THETA_32_DJF_avg(THETA_32_DJF_avg>100000) = NaN;
SALT_32_DJF_avg(SALT_32_DJF_avg>100000) = NaN;
WVEL_32_DJF_avg(WVEL_32_DJF_avg>100000) = NaN;
WVEL_32_DJF_std(WVEL_32_DJF_std>100000) = NaN;
ETAN_32_DJF_avg(ETAN_32_DJF_avg>100000) = NaN;
ETAN_32_DJF_std(ETAN_32_DJF_std>100000) = NaN;

CFLUX_32_DM_avg(CFLUX_32_DM_avg>100000) = NaN;
OFLUX_32_DM_avg(OFLUX_32_DM_avg>100000) = NaN;
TFLUX_32_DM_avg(TFLUX_32_DM_avg>100000) = NaN;
SFLUX_32_DM_avg(SFLUX_32_DM_avg>100000) = NaN;
THETA_32_DM_avg(THETA_32_DM_avg>100000) = NaN;
SALT_32_DM_avg(SALT_32_DM_avg>100000) = NaN;
WVEL_32_DM_avg(WVEL_32_DM_avg>100000) = NaN;
WVEL_32_DM_std(WVEL_32_DM_std>100000) = NaN;
ETAN_32_DM_avg(ETAN_32_DM_avg>100000) = NaN;
ETAN_32_DM_std(ETAN_32_DM_std>100000) = NaN;

CFLUX_32_DD_avg(CFLUX_32_DD_avg>100000) = NaN;
OFLUX_32_DD_avg(OFLUX_32_DD_avg>100000) = NaN;
TFLUX_32_DD_avg(TFLUX_32_DD_avg>100000) = NaN;
SFLUX_32_DD_avg(SFLUX_32_DD_avg>100000) = NaN;
THETA_32_DD_avg(THETA_32_DD_avg>100000) = NaN;
SALT_32_DD_avg(SALT_32_DD_avg>100000) = NaN;
WVEL_32_DD_avg(WVEL_32_DD_avg>100000) = NaN;
WVEL_32_DD_std(WVEL_32_DD_std>100000) = NaN;
ETAN_32_DD_avg(ETAN_32_DD_avg>100000) = NaN;
ETAN_32_DD_std(ETAN_32_DD_std>100000) = NaN;

CFLUX_34_JJA_avg(CFLUX_34_JJA_avg>100000) = NaN;
OFLUX_34_JJA_avg(OFLUX_34_JJA_avg>100000) = NaN;
TFLUX_34_JJA_avg(TFLUX_34_JJA_avg>100000) = NaN;
SFLUX_34_JJA_avg(SFLUX_34_JJA_avg>100000) = NaN;
THETA_34_JJA_avg(THETA_34_JJA_avg>100000) = NaN;
SALT_34_JJA_avg(SALT_34_JJA_avg>100000) = NaN;
WVEL_34_JJA_avg(WVEL_34_JJA_avg>100000) = NaN;
WVEL_34_JJA_std(WVEL_34_JJA_std>100000) = NaN;
ETAN_34_JJA_avg(ETAN_34_JJA_avg>100000) = NaN;
ETAN_34_JJA_std(ETAN_34_JJA_std>100000) = NaN;

CFLUX_34_JN_avg(CFLUX_34_JN_avg>100000) = NaN;
OFLUX_34_JN_avg(OFLUX_34_JN_avg>100000) = NaN;
TFLUX_34_JN_avg(TFLUX_34_JN_avg>100000) = NaN;
SFLUX_34_JN_avg(SFLUX_34_JN_avg>100000) = NaN;
THETA_34_JN_avg(THETA_34_JN_avg>100000) = NaN;
SALT_34_JN_avg(SALT_34_JN_avg>100000) = NaN;
WVEL_34_JN_avg(WVEL_34_JN_avg>100000) = NaN;
WVEL_34_JN_std(WVEL_34_JN_std>100000) = NaN;
ETAN_34_JN_avg(ETAN_34_JN_avg>100000) = NaN;
ETAN_34_JN_std(ETAN_34_JN_std>100000) = NaN;

CFLUX_62_DJF_avg(CFLUX_62_DJF_avg>100000) = NaN;
OFLUX_62_DJF_avg(OFLUX_62_DJF_avg>100000) = NaN;
TFLUX_62_DJF_avg(TFLUX_62_DJF_avg>100000) = NaN;
SFLUX_62_DJF_avg(SFLUX_62_DJF_avg>100000) = NaN;
THETA_62_DJF_avg(THETA_62_DJF_avg>100000) = NaN;
SALT_62_DJF_avg(SALT_62_DJF_avg>100000) = NaN;
WVEL_62_DJF_avg(WVEL_62_DJF_avg>100000) = NaN;
WVEL_62_DJF_std(WVEL_62_DJF_std>100000) = NaN;
ETAN_62_DJF_avg(ETAN_62_DJF_avg>100000) = NaN;
ETAN_62_DJF_std(ETAN_62_DJF_std>100000) = NaN;

CFLUX_62_DM_avg(CFLUX_62_DM_avg>100000) = NaN;
OFLUX_62_DM_avg(OFLUX_62_DM_avg>100000) = NaN;
TFLUX_62_DM_avg(TFLUX_62_DM_avg>100000) = NaN;
SFLUX_62_DM_avg(SFLUX_62_DM_avg>100000) = NaN;
THETA_62_DM_avg(THETA_62_DM_avg>100000) = NaN;
SALT_62_DM_avg(SALT_62_DM_avg>100000) = NaN;
WVEL_62_DM_avg(WVEL_62_DM_avg>100000) = NaN;
WVEL_62_DM_std(WVEL_62_DM_std>100000) = NaN;
ETAN_62_DM_avg(ETAN_62_DM_avg>100000) = NaN;
ETAN_62_DM_std(ETAN_62_DM_std>100000) = NaN;

CFLUX_62_DD_avg(CFLUX_62_DD_avg>100000) = NaN;
OFLUX_62_DD_avg(OFLUX_62_DD_avg>100000) = NaN;
TFLUX_62_DD_avg(TFLUX_62_DD_avg>100000) = NaN;
SFLUX_62_DD_avg(SFLUX_62_DD_avg>100000) = NaN;
THETA_62_DD_avg(THETA_62_DD_avg>100000) = NaN;
SALT_62_DD_avg(SALT_62_DD_avg>100000) = NaN;
WVEL_62_DD_avg(WVEL_62_DD_avg>100000) = NaN;
WVEL_62_DD_std(WVEL_62_DD_std>100000) = NaN;
ETAN_62_DD_avg(ETAN_62_DD_avg>100000) = NaN;
ETAN_62_DD_std(ETAN_62_DD_std>100000) = NaN;

CFLUX_64_JJA_avg(CFLUX_64_JJA_avg>100000) = NaN;
OFLUX_64_JJA_avg(OFLUX_64_JJA_avg>100000) = NaN;
TFLUX_64_JJA_avg(TFLUX_64_JJA_avg>100000) = NaN;
SFLUX_64_JJA_avg(SFLUX_64_JJA_avg>100000) = NaN;
THETA_64_JJA_avg(THETA_64_JJA_avg>100000) = NaN;
SALT_64_JJA_avg(SALT_64_JJA_avg>100000) = NaN;
WVEL_64_JJA_avg(WVEL_64_JJA_avg>100000) = NaN;
WVEL_64_JJA_std(WVEL_64_JJA_std>100000) = NaN;
ETAN_64_JJA_avg(ETAN_64_JJA_avg>100000) = NaN;
ETAN_64_JJA_std(ETAN_64_JJA_std>100000) = NaN;

CFLUX_64_JN_avg(CFLUX_64_JN_avg>100000) = NaN;
OFLUX_64_JN_avg(OFLUX_64_JN_avg>100000) = NaN;
TFLUX_64_JN_avg(TFLUX_64_JN_avg>100000) = NaN;
SFLUX_64_JN_avg(SFLUX_64_JN_avg>100000) = NaN;
THETA_64_JN_avg(THETA_64_JN_avg>100000) = NaN;
SALT_64_JN_avg(SALT_64_JN_avg>100000) = NaN;
WVEL_64_JN_avg(WVEL_64_JN_avg>100000) = NaN;
WVEL_64_JN_std(WVEL_64_JN_std>100000) = NaN;
ETAN_64_JN_avg(ETAN_64_JN_avg>100000) = NaN;
ETAN_64_JN_std(ETAN_64_JN_std>100000) = NaN;

CFLUX_122_DJF_avg(CFLUX_122_DJF_avg>100000) = NaN;
OFLUX_122_DJF_avg(OFLUX_122_DJF_avg>100000) = NaN;
TFLUX_122_DJF_avg(TFLUX_122_DJF_avg>100000) = NaN;
SFLUX_122_DJF_avg(SFLUX_122_DJF_avg>100000) = NaN;
THETA_122_DJF_avg(THETA_122_DJF_avg>100000) = NaN;
SALT_122_DJF_avg(SALT_122_DJF_avg>100000) = NaN;
WVEL_122_DJF_avg(WVEL_122_DJF_avg>100000) = NaN;
WVEL_122_DJF_std(WVEL_122_DJF_std>100000) = NaN;
ETAN_122_DJF_avg(ETAN_122_DJF_avg>100000) = NaN;
ETAN_122_DJF_std(ETAN_122_DJF_std>100000) = NaN;

CFLUX_122_DM_avg(CFLUX_122_DM_avg>100000) = NaN;
OFLUX_122_DM_avg(OFLUX_122_DM_avg>100000) = NaN;
TFLUX_122_DM_avg(TFLUX_122_DM_avg>100000) = NaN;
SFLUX_122_DM_avg(SFLUX_122_DM_avg>100000) = NaN;
THETA_122_DM_avg(THETA_122_DM_avg>100000) = NaN;
SALT_122_DM_avg(SALT_122_DM_avg>100000) = NaN;
WVEL_122_DM_avg(WVEL_122_DM_avg>100000) = NaN;
WVEL_122_DM_std(WVEL_122_DM_std>100000) = NaN;
ETAN_122_DM_avg(ETAN_122_DM_avg>100000) = NaN;
ETAN_122_DM_std(ETAN_122_DM_std>100000) = NaN;

CFLUX_122_DD_avg(CFLUX_122_DD_avg>100000) = NaN;
OFLUX_122_DD_avg(OFLUX_122_DD_avg>100000) = NaN;
TFLUX_122_DD_avg(TFLUX_122_DD_avg>100000) = NaN;
SFLUX_122_DD_avg(SFLUX_122_DD_avg>100000) = NaN;
THETA_122_DD_avg(THETA_122_DD_avg>100000) = NaN;
SALT_122_DD_avg(SALT_122_DD_avg>100000) = NaN;
WVEL_122_DD_avg(WVEL_122_DD_avg>100000) = NaN;
WVEL_122_DD_std(WVEL_122_DD_std>100000) = NaN;
ETAN_122_DD_avg(ETAN_122_DD_avg>100000) = NaN;
ETAN_122_DD_std(ETAN_122_DD_std>100000) = NaN;

CFLUX_124_JJA_avg(CFLUX_124_JJA_avg>100000) = NaN;
OFLUX_124_JJA_avg(OFLUX_124_JJA_avg>100000) = NaN;
TFLUX_124_JJA_avg(TFLUX_124_JJA_avg>100000) = NaN;
SFLUX_124_JJA_avg(SFLUX_124_JJA_avg>100000) = NaN;
THETA_124_JJA_avg(THETA_124_JJA_avg>100000) = NaN;
SALT_124_JJA_avg(SALT_124_JJA_avg>100000) = NaN;
WVEL_124_JJA_avg(WVEL_124_JJA_avg>100000) = NaN;
WVEL_124_JJA_std(WVEL_124_JJA_std>100000) = NaN;
ETAN_124_JJA_avg(ETAN_124_JJA_avg>100000) = NaN;
ETAN_124_JJA_std(ETAN_124_JJA_std>100000) = NaN;

CFLUX_124_JN_avg(CFLUX_124_JN_avg>100000) = NaN;
OFLUX_124_JN_avg(OFLUX_124_JN_avg>100000) = NaN;
TFLUX_124_JN_avg(TFLUX_124_JN_avg>100000) = NaN;
SFLUX_124_JN_avg(SFLUX_124_JN_avg>100000) = NaN;
THETA_124_JN_avg(THETA_124_JN_avg>100000) = NaN;
SALT_124_JN_avg(SALT_124_JN_avg>100000) = NaN;
WVEL_124_JN_avg(WVEL_124_JN_avg>100000) = NaN;
WVEL_124_JN_std(WVEL_124_JN_std>100000) = NaN;
ETAN_124_JN_avg(ETAN_124_JN_avg>100000) = NaN;
ETAN_124_JN_std(ETAN_124_JN_std>100000) = NaN;

CFLUX_BSOSE_DJF_avg(CFLUX_BSOSE_DJF_avg>100000) = NaN;
OFLUX_BSOSE_DJF_avg(OFLUX_BSOSE_DJF_avg>100000) = NaN;
TFLUX_BSOSE_DJF_avg(TFLUX_BSOSE_DJF_avg>100000) = NaN;
SFLUX_BSOSE_DJF_avg(SFLUX_BSOSE_DJF_avg>100000) = NaN;
THETA_BSOSE_DJF_avg(THETA_BSOSE_DJF_avg>100000) = NaN;
SALT_BSOSE_DJF_avg(SALT_BSOSE_DJF_avg>100000) = NaN;
WVEL_BSOSE_DJF_avg(WVEL_BSOSE_DJF_avg>100000) = NaN;
WVEL_BSOSE_DJF_std(WVEL_BSOSE_DJF_std>100000) = NaN;
ETAN_BSOSE_DJF_avg(ETAN_BSOSE_DJF_avg>100000) = NaN;
ETAN_BSOSE_DJF_std(ETAN_BSOSE_DJF_std>100000) = NaN;

CFLUX_BSOSE_DM_avg(CFLUX_BSOSE_DM_avg>100000) = NaN;
OFLUX_BSOSE_DM_avg(OFLUX_BSOSE_DM_avg>100000) = NaN;
TFLUX_BSOSE_DM_avg(TFLUX_BSOSE_DM_avg>100000) = NaN;
SFLUX_BSOSE_DM_avg(SFLUX_BSOSE_DM_avg>100000) = NaN;
THETA_BSOSE_DM_avg(THETA_BSOSE_DM_avg>100000) = NaN;
SALT_BSOSE_DM_avg(SALT_BSOSE_DM_avg>100000) = NaN;
WVEL_BSOSE_DM_avg(WVEL_BSOSE_DM_avg>100000) = NaN;
WVEL_BSOSE_DM_std(WVEL_BSOSE_DM_std>100000) = NaN;
ETAN_BSOSE_DM_avg(ETAN_BSOSE_DM_avg>100000) = NaN;
ETAN_BSOSE_DM_std(ETAN_BSOSE_DM_std>100000) = NaN;

CFLUX_BSOSE_DD_avg(CFLUX_BSOSE_DD_avg>100000) = NaN;
OFLUX_BSOSE_DD_avg(OFLUX_BSOSE_DD_avg>100000) = NaN;
TFLUX_BSOSE_DD_avg(TFLUX_BSOSE_DD_avg>100000) = NaN;
SFLUX_BSOSE_DD_avg(SFLUX_BSOSE_DD_avg>100000) = NaN;
THETA_BSOSE_DD_avg(THETA_BSOSE_DD_avg>100000) = NaN;
SALT_BSOSE_DD_avg(SALT_BSOSE_DD_avg>100000) = NaN;
WVEL_BSOSE_DD_avg(WVEL_BSOSE_DD_avg>100000) = NaN;
WVEL_BSOSE_DD_std(WVEL_BSOSE_DD_std>100000) = NaN;
ETAN_BSOSE_DD_avg(ETAN_BSOSE_DD_avg>100000) = NaN;
ETAN_BSOSE_DD_std(ETAN_BSOSE_DD_std>100000) = NaN;

CFLUX_BSOSE_JJA_avg(CFLUX_BSOSE_JJA_avg>100000) = NaN;
OFLUX_BSOSE_JJA_avg(OFLUX_BSOSE_JJA_avg>100000) = NaN;
TFLUX_BSOSE_JJA_avg(TFLUX_BSOSE_JJA_avg>100000) = NaN;
SFLUX_BSOSE_JJA_avg(SFLUX_BSOSE_JJA_avg>100000) = NaN;
THETA_BSOSE_JJA_avg(THETA_BSOSE_JJA_avg>100000) = NaN;
SALT_BSOSE_JJA_avg(SALT_BSOSE_JJA_avg>100000) = NaN;
WVEL_BSOSE_JJA_avg(WVEL_BSOSE_JJA_avg>100000) = NaN;
WVEL_BSOSE_JJA_std(WVEL_BSOSE_JJA_std>100000) = NaN;
ETAN_BSOSE_JJA_avg(ETAN_BSOSE_JJA_avg>100000) = NaN;
ETAN_BSOSE_JJA_std(ETAN_BSOSE_JJA_std>100000) = NaN;

CFLUX_BSOSE_JN_avg(CFLUX_BSOSE_JN_avg>100000) = NaN;
OFLUX_BSOSE_JN_avg(OFLUX_BSOSE_JN_avg>100000) = NaN;
TFLUX_BSOSE_JN_avg(TFLUX_BSOSE_JN_avg>100000) = NaN;
SFLUX_BSOSE_JN_avg(SFLUX_BSOSE_JN_avg>100000) = NaN;
THETA_BSOSE_JN_avg(THETA_BSOSE_JN_avg>100000) = NaN;
SALT_BSOSE_JN_avg(SALT_BSOSE_JN_avg>100000) = NaN;
WVEL_BSOSE_JN_avg(WVEL_BSOSE_JN_avg>100000) = NaN;
WVEL_BSOSE_JN_std(WVEL_BSOSE_JN_std>100000) = NaN;
ETAN_BSOSE_JN_avg(ETAN_BSOSE_JN_avg>100000) = NaN;
ETAN_BSOSE_JN_std(ETAN_BSOSE_JN_std>100000) = NaN;
%% End NaNs

%% Fill Missing
CFLUX_32_DJF_avg = fillmissingstan(CFLUX_32_DJF_avg);
OFLUX_32_DJF_avg = fillmissingstan(OFLUX_32_DJF_avg);
TFLUX_32_DJF_avg = fillmissingstan(TFLUX_32_DJF_avg);
SFLUX_32_DJF_avg = fillmissingstan(SFLUX_32_DJF_avg);
THETA_32_DJF_avg = fillmissingstan(THETA_32_DJF_avg);
SALT_32_DJF_avg = fillmissingstan(SALT_32_DJF_avg);
WVEL_32_DJF_avg = fillmissingstan(WVEL_32_DJF_avg);
WVEL_32_DJF_std = fillmissingstan(WVEL_32_DJF_std);
ETAN_32_DJF_avg = fillmissingstan(ETAN_32_DJF_avg);
ETAN_32_DJF_std = fillmissingstan(ETAN_32_DJF_std);

CFLUX_32_DM_avg = fillmissingstan(CFLUX_32_DM_avg);
OFLUX_32_DM_avg = fillmissingstan(OFLUX_32_DM_avg);
TFLUX_32_DM_avg = fillmissingstan(TFLUX_32_DM_avg);
SFLUX_32_DM_avg = fillmissingstan(SFLUX_32_DM_avg);
THETA_32_DM_avg = fillmissingstan(THETA_32_DM_avg);
SALT_32_DM_avg = fillmissingstan(SALT_32_DM_avg);
WVEL_32_DM_avg = fillmissingstan(WVEL_32_DM_avg);
WVEL_32_DM_std = fillmissingstan(WVEL_32_DM_std);
ETAN_32_DM_avg = fillmissingstan(ETAN_32_DM_avg);
ETAN_32_DM_std = fillmissingstan(ETAN_32_DM_std);

CFLUX_32_DD_avg = fillmissingstan(CFLUX_32_DD_avg);
OFLUX_32_DD_avg = fillmissingstan(OFLUX_32_DD_avg);
TFLUX_32_DD_avg = fillmissingstan(TFLUX_32_DD_avg);
SFLUX_32_DD_avg = fillmissingstan(SFLUX_32_DD_avg);
THETA_32_DD_avg = fillmissingstan(THETA_32_DD_avg);
SALT_32_DD_avg = fillmissingstan(SALT_32_DD_avg);
WVEL_32_DD_avg = fillmissingstan(WVEL_32_DD_avg);
WVEL_32_DD_std = fillmissingstan(WVEL_32_DD_std);
ETAN_32_DD_avg = fillmissingstan(ETAN_32_DD_avg);
ETAN_32_DD_std = fillmissingstan(ETAN_32_DD_std);

CFLUX_34_JJA_avg = fillmissingstan(CFLUX_34_JJA_avg);
OFLUX_34_JJA_avg = fillmissingstan(OFLUX_34_JJA_avg);
TFLUX_34_JJA_avg = fillmissingstan(TFLUX_34_JJA_avg);
SFLUX_34_JJA_avg = fillmissingstan(SFLUX_34_JJA_avg);
THETA_34_JJA_avg = fillmissingstan(THETA_34_JJA_avg);
SALT_34_JJA_avg = fillmissingstan(SALT_34_JJA_avg);
WVEL_34_JJA_avg = fillmissingstan(WVEL_34_JJA_avg);
WVEL_34_JJA_std = fillmissingstan(WVEL_34_JJA_std);
ETAN_34_JJA_avg = fillmissingstan(ETAN_34_JJA_avg);
ETAN_34_JJA_std = fillmissingstan(ETAN_34_JJA_std);

CFLUX_34_JN_avg = fillmissingstan(CFLUX_34_JN_avg);
OFLUX_34_JN_avg = fillmissingstan(OFLUX_34_JN_avg);
TFLUX_34_JN_avg = fillmissingstan(TFLUX_34_JN_avg);
SFLUX_34_JN_avg = fillmissingstan(SFLUX_34_JN_avg);
THETA_34_JN_avg = fillmissingstan(THETA_34_JN_avg);
SALT_34_JN_avg = fillmissingstan(SALT_34_JN_avg);
WVEL_34_JN_avg = fillmissingstan(WVEL_34_JN_avg);
WVEL_34_JN_std = fillmissingstan(WVEL_34_JN_std);
ETAN_34_JN_avg = fillmissingstan(ETAN_34_JN_avg);
ETAN_34_JN_std = fillmissingstan(ETAN_34_JN_std);

CFLUX_62_DJF_avg = fillmissingstan(CFLUX_62_DJF_avg);
OFLUX_62_DJF_avg = fillmissingstan(OFLUX_62_DJF_avg);
TFLUX_62_DJF_avg = fillmissingstan(TFLUX_62_DJF_avg);
SFLUX_62_DJF_avg = fillmissingstan(SFLUX_62_DJF_avg);
THETA_62_DJF_avg = fillmissingstan(THETA_62_DJF_avg);
SALT_62_DJF_avg = fillmissingstan(SALT_62_DJF_avg);
WVEL_62_DJF_avg = fillmissingstan(WVEL_62_DJF_avg);
WVEL_62_DJF_std = fillmissingstan(WVEL_62_DJF_std);
ETAN_62_DJF_avg = fillmissingstan(ETAN_62_DJF_avg);
ETAN_62_DJF_std = fillmissingstan(ETAN_62_DJF_std);

CFLUX_62_DM_avg = fillmissingstan(CFLUX_62_DM_avg);
OFLUX_62_DM_avg = fillmissingstan(OFLUX_62_DM_avg);
TFLUX_62_DM_avg = fillmissingstan(TFLUX_62_DM_avg);
SFLUX_62_DM_avg = fillmissingstan(SFLUX_62_DM_avg);
THETA_62_DM_avg = fillmissingstan(THETA_62_DM_avg);
SALT_62_DM_avg = fillmissingstan(SALT_62_DM_avg);
WVEL_62_DM_avg = fillmissingstan(WVEL_62_DM_avg);
WVEL_62_DM_std = fillmissingstan(WVEL_62_DM_std);
ETAN_62_DM_avg = fillmissingstan(ETAN_62_DM_avg);
ETAN_62_DM_std = fillmissingstan(ETAN_62_DM_std);

CFLUX_62_DD_avg = fillmissingstan(CFLUX_62_DD_avg);
OFLUX_62_DD_avg = fillmissingstan(OFLUX_62_DD_avg);
TFLUX_62_DD_avg = fillmissingstan(TFLUX_62_DD_avg);
SFLUX_62_DD_avg = fillmissingstan(SFLUX_62_DD_avg);
THETA_62_DD_avg = fillmissingstan(THETA_62_DD_avg);
SALT_62_DD_avg = fillmissingstan(SALT_62_DD_avg);
WVEL_62_DD_avg = fillmissingstan(WVEL_62_DD_avg);
WVEL_62_DD_std = fillmissingstan(WVEL_62_DD_std);
ETAN_62_DD_avg = fillmissingstan(ETAN_62_DD_avg);
ETAN_62_DD_std = fillmissingstan(ETAN_62_DD_std);

CFLUX_64_JJA_avg = fillmissingstan(CFLUX_64_JJA_avg);
OFLUX_64_JJA_avg = fillmissingstan(OFLUX_64_JJA_avg);
TFLUX_64_JJA_avg = fillmissingstan(TFLUX_64_JJA_avg);
SFLUX_64_JJA_avg = fillmissingstan(SFLUX_64_JJA_avg);
THETA_64_JJA_avg = fillmissingstan(THETA_64_JJA_avg);
SALT_64_JJA_avg = fillmissingstan(SALT_64_JJA_avg);
WVEL_64_JJA_avg = fillmissingstan(WVEL_64_JJA_avg);
WVEL_64_JJA_std = fillmissingstan(WVEL_64_JJA_std);
ETAN_64_JJA_avg = fillmissingstan(ETAN_64_JJA_avg);
ETAN_64_JJA_std = fillmissingstan(ETAN_64_JJA_std);

CFLUX_64_JN_avg = fillmissingstan(CFLUX_64_JN_avg);
OFLUX_64_JN_avg = fillmissingstan(OFLUX_64_JN_avg);
TFLUX_64_JN_avg = fillmissingstan(TFLUX_64_JN_avg);
SFLUX_64_JN_avg = fillmissingstan(SFLUX_64_JN_avg);
THETA_64_JN_avg = fillmissingstan(THETA_64_JN_avg);
SALT_64_JN_avg = fillmissingstan(SALT_64_JN_avg);
WVEL_64_JN_avg = fillmissingstan(WVEL_64_JN_avg);
WVEL_64_JN_std = fillmissingstan(WVEL_64_JN_std);
ETAN_64_JN_avg = fillmissingstan(ETAN_64_JN_avg);
ETAN_64_JN_std = fillmissingstan(ETAN_64_JN_std);

CFLUX_122_DJF_avg = fillmissingstan(CFLUX_122_DJF_avg);
OFLUX_122_DJF_avg = fillmissingstan(OFLUX_122_DJF_avg);
TFLUX_122_DJF_avg = fillmissingstan(TFLUX_122_DJF_avg);
SFLUX_122_DJF_avg = fillmissingstan(SFLUX_122_DJF_avg);
THETA_122_DJF_avg = fillmissingstan(THETA_122_DJF_avg);
SALT_122_DJF_avg = fillmissingstan(SALT_122_DJF_avg);
WVEL_122_DJF_avg = fillmissingstan(WVEL_122_DJF_avg);
WVEL_122_DJF_std = fillmissingstan(WVEL_122_DJF_std);
ETAN_122_DJF_avg = fillmissingstan(ETAN_122_DJF_avg);
ETAN_122_DJF_std = fillmissingstan(ETAN_122_DJF_std);

CFLUX_122_DM_avg = fillmissingstan(CFLUX_122_DM_avg);
OFLUX_122_DM_avg = fillmissingstan(OFLUX_122_DM_avg);
TFLUX_122_DM_avg = fillmissingstan(TFLUX_122_DM_avg);
SFLUX_122_DM_avg = fillmissingstan(SFLUX_122_DM_avg);
THETA_122_DM_avg = fillmissingstan(THETA_122_DM_avg);
SALT_122_DM_avg = fillmissingstan(SALT_122_DM_avg);
WVEL_122_DM_avg = fillmissingstan(WVEL_122_DM_avg);
WVEL_122_DM_std = fillmissingstan(WVEL_122_DM_std);
ETAN_122_DM_avg = fillmissingstan(ETAN_122_DM_avg);
ETAN_122_DM_std = fillmissingstan(ETAN_122_DM_std);

CFLUX_122_DD_avg = fillmissingstan(CFLUX_122_DD_avg);
OFLUX_122_DD_avg = fillmissingstan(OFLUX_122_DD_avg);
TFLUX_122_DD_avg = fillmissingstan(TFLUX_122_DD_avg);
SFLUX_122_DD_avg = fillmissingstan(SFLUX_122_DD_avg);
THETA_122_DD_avg = fillmissingstan(THETA_122_DD_avg);
SALT_122_DD_avg = fillmissingstan(SALT_122_DD_avg);
WVEL_122_DD_avg = fillmissingstan(WVEL_122_DD_avg);
WVEL_122_DD_std = fillmissingstan(WVEL_122_DD_std);
ETAN_122_DD_avg = fillmissingstan(ETAN_122_DD_avg);
ETAN_122_DD_std = fillmissingstan(ETAN_122_DD_std);

CFLUX_124_JJA_avg = fillmissingstan(CFLUX_124_JJA_avg);
OFLUX_124_JJA_avg = fillmissingstan(OFLUX_124_JJA_avg);
TFLUX_124_JJA_avg = fillmissingstan(TFLUX_124_JJA_avg);
SFLUX_124_JJA_avg = fillmissingstan(SFLUX_124_JJA_avg);
THETA_124_JJA_avg = fillmissingstan(THETA_124_JJA_avg);
SALT_124_JJA_avg = fillmissingstan(SALT_124_JJA_avg);
WVEL_124_JJA_avg = fillmissingstan(WVEL_124_JJA_avg);
WVEL_124_JJA_std = fillmissingstan(WVEL_124_JJA_std);
ETAN_124_JJA_avg = fillmissingstan(ETAN_124_JJA_avg);
ETAN_124_JJA_std = fillmissingstan(ETAN_124_JJA_std);

CFLUX_124_JN_avg = fillmissingstan(CFLUX_124_JN_avg);
OFLUX_124_JN_avg = fillmissingstan(OFLUX_124_JN_avg);
TFLUX_124_JN_avg = fillmissingstan(TFLUX_124_JN_avg);
SFLUX_124_JN_avg = fillmissingstan(SFLUX_124_JN_avg);
THETA_124_JN_avg = fillmissingstan(THETA_124_JN_avg);
SALT_124_JN_avg = fillmissingstan(SALT_124_JN_avg);
WVEL_124_JN_avg = fillmissingstan(WVEL_124_JN_avg);
WVEL_124_JN_std = fillmissingstan(WVEL_124_JN_std);
ETAN_124_JN_avg = fillmissingstan(ETAN_124_JN_avg);
ETAN_124_JN_std = fillmissingstan(ETAN_124_JN_std);

CFLUX_BSOSE_DJF_avg = fillmissingstan(CFLUX_BSOSE_DJF_avg);
OFLUX_BSOSE_DJF_avg = fillmissingstan(OFLUX_BSOSE_DJF_avg);
TFLUX_BSOSE_DJF_avg = fillmissingstan(TFLUX_BSOSE_DJF_avg);
SFLUX_BSOSE_DJF_avg = fillmissingstan(SFLUX_BSOSE_DJF_avg);
THETA_BSOSE_DJF_avg = fillmissingstan(THETA_BSOSE_DJF_avg);
SALT_BSOSE_DJF_avg = fillmissingstan(SALT_BSOSE_DJF_avg);
WVEL_BSOSE_DJF_avg = fillmissingstan(WVEL_BSOSE_DJF_avg);
WVEL_BSOSE_DJF_std = fillmissingstan(WVEL_BSOSE_DJF_std);
ETAN_BSOSE_DJF_avg = fillmissingstan(ETAN_BSOSE_DJF_avg);
ETAN_BSOSE_DJF_std = fillmissingstan(ETAN_BSOSE_DJF_std);

CFLUX_BSOSE_DM_avg = fillmissingstan(CFLUX_BSOSE_DM_avg);
OFLUX_BSOSE_DM_avg = fillmissingstan(OFLUX_BSOSE_DM_avg);
TFLUX_BSOSE_DM_avg = fillmissingstan(TFLUX_BSOSE_DM_avg);
SFLUX_BSOSE_DM_avg = fillmissingstan(SFLUX_BSOSE_DM_avg);
THETA_BSOSE_DM_avg = fillmissingstan(THETA_BSOSE_DM_avg);
SALT_BSOSE_DM_avg = fillmissingstan(SALT_BSOSE_DM_avg);
WVEL_BSOSE_DM_avg = fillmissingstan(WVEL_BSOSE_DM_avg);
WVEL_BSOSE_DM_std = fillmissingstan(WVEL_BSOSE_DM_std);
ETAN_BSOSE_DM_avg = fillmissingstan(ETAN_BSOSE_DM_avg);
ETAN_BSOSE_DM_std = fillmissingstan(ETAN_BSOSE_DM_std);

CFLUX_BSOSE_DD_avg = fillmissingstan(CFLUX_BSOSE_DD_avg);
OFLUX_BSOSE_DD_avg = fillmissingstan(OFLUX_BSOSE_DD_avg);
TFLUX_BSOSE_DD_avg = fillmissingstan(TFLUX_BSOSE_DD_avg);
SFLUX_BSOSE_DD_avg = fillmissingstan(SFLUX_BSOSE_DD_avg);
THETA_BSOSE_DD_avg = fillmissingstan(THETA_BSOSE_DD_avg);
SALT_BSOSE_DD_avg = fillmissingstan(SALT_BSOSE_DD_avg);
WVEL_BSOSE_DD_avg = fillmissingstan(WVEL_BSOSE_DD_avg);
WVEL_BSOSE_DD_std = fillmissingstan(WVEL_BSOSE_DD_std);
ETAN_BSOSE_DD_avg = fillmissingstan(ETAN_BSOSE_DD_avg);
ETAN_BSOSE_DD_std = fillmissingstan(ETAN_BSOSE_DD_std);

CFLUX_BSOSE_JJA_avg = fillmissingstan(CFLUX_BSOSE_JJA_avg);
OFLUX_BSOSE_JJA_avg = fillmissingstan(OFLUX_BSOSE_JJA_avg);
TFLUX_BSOSE_JJA_avg = fillmissingstan(TFLUX_BSOSE_JJA_avg);
SFLUX_BSOSE_JJA_avg = fillmissingstan(SFLUX_BSOSE_JJA_avg);
THETA_BSOSE_JJA_avg = fillmissingstan(THETA_BSOSE_JJA_avg);
SALT_BSOSE_JJA_avg = fillmissingstan(SALT_BSOSE_JJA_avg);
WVEL_BSOSE_JJA_avg = fillmissingstan(WVEL_BSOSE_JJA_avg);
WVEL_BSOSE_JJA_std = fillmissingstan(WVEL_BSOSE_JJA_std);
ETAN_BSOSE_JJA_avg = fillmissingstan(ETAN_BSOSE_JJA_avg);
ETAN_BSOSE_JJA_std = fillmissingstan(ETAN_BSOSE_JJA_std);

CFLUX_BSOSE_JN_avg = fillmissingstan(CFLUX_BSOSE_JN_avg);
OFLUX_BSOSE_JN_avg = fillmissingstan(OFLUX_BSOSE_JN_avg);
TFLUX_BSOSE_JN_avg = fillmissingstan(TFLUX_BSOSE_JN_avg);
SFLUX_BSOSE_JN_avg = fillmissingstan(SFLUX_BSOSE_JN_avg);
THETA_BSOSE_JN_avg = fillmissingstan(THETA_BSOSE_JN_avg);
SALT_BSOSE_JN_avg = fillmissingstan(SALT_BSOSE_JN_avg);
WVEL_BSOSE_JN_avg = fillmissingstan(WVEL_BSOSE_JN_avg);
WVEL_BSOSE_JN_std = fillmissingstan(WVEL_BSOSE_JN_std);
ETAN_BSOSE_JN_avg = fillmissingstan(ETAN_BSOSE_JN_avg);
ETAN_BSOSE_JN_std = fillmissingstan(ETAN_BSOSE_JN_std);
%% End Fill Missing

%% Interpolate
F = griddedInterpolant(XC3,YC3,CFLUX_32_DJF_avg,'linear');
CFLUX_32_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,OFLUX_32_DJF_avg,'linear');
OFLUX_32_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,TFLUX_32_DJF_avg,'linear');
TFLUX_32_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SFLUX_32_DJF_avg,'linear');
SFLUX_32_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,THETA_32_DJF_avg,'linear');
THETA_32_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SALT_32_DJF_avg,'linear');
SALT_32_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_32_DJF_avg,'linear');
WVEL_32_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_32_DJF_std,'linear');
WVEL_32_DJF_std = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_32_DJF_avg,'linear');
ETAN_32_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_32_DJF_std,'linear');
ETAN_32_DJF_std = F(XCS,YCS);

F = griddedInterpolant(XC3,YC3,CFLUX_32_DM_avg,'linear');
CFLUX_32_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,OFLUX_32_DM_avg,'linear');
OFLUX_32_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,TFLUX_32_DM_avg,'linear');
TFLUX_32_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SFLUX_32_DM_avg,'linear');
SFLUX_32_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,THETA_32_DM_avg,'linear');
THETA_32_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SALT_32_DM_avg,'linear');
SALT_32_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_32_DM_avg,'linear');
WVEL_32_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_32_DM_std,'linear');
WVEL_32_DM_std = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_32_DM_avg,'linear');
ETAN_32_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_32_DM_std,'linear');
ETAN_32_DM_std = F(XCS,YCS);

F = griddedInterpolant(XC3,YC3,CFLUX_32_DD_avg,'linear');
CFLUX_32_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,OFLUX_32_DD_avg,'linear');
OFLUX_32_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,TFLUX_32_DD_avg,'linear');
TFLUX_32_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SFLUX_32_DD_avg,'linear');
SFLUX_32_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,THETA_32_DD_avg,'linear');
THETA_32_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SALT_32_DD_avg,'linear');
SALT_32_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_32_DD_avg,'linear');
WVEL_32_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_32_DD_std,'linear');
WVEL_32_DD_std = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_32_DD_avg,'linear');
ETAN_32_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_32_DD_std,'linear');
ETAN_32_DD_std = F(XCS,YCS);

F = griddedInterpolant(XC3,YC3,CFLUX_34_JJA_avg,'linear');
CFLUX_34_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,OFLUX_34_JJA_avg,'linear');
OFLUX_34_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,TFLUX_34_JJA_avg,'linear');
TFLUX_34_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SFLUX_34_JJA_avg,'linear');
SFLUX_34_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,THETA_34_JJA_avg,'linear');
THETA_34_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SALT_34_JJA_avg,'linear');
SALT_34_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_34_JJA_avg,'linear');
WVEL_34_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_34_JJA_std,'linear');
WVEL_34_JJA_std = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_34_JJA_avg,'linear');
ETAN_34_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_34_JJA_std,'linear');
ETAN_34_JJA_std = F(XCS,YCS);

F = griddedInterpolant(XC3,YC3,CFLUX_34_JN_avg,'linear');
CFLUX_34_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,OFLUX_34_JN_avg,'linear');
OFLUX_34_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,TFLUX_34_JN_avg,'linear');
TFLUX_34_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SFLUX_34_JN_avg,'linear');
SFLUX_34_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,THETA_34_JN_avg,'linear');
THETA_34_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,SALT_34_JN_avg,'linear');
SALT_34_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_34_JN_avg,'linear');
WVEL_34_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,WVEL_34_JN_std,'linear');
WVEL_34_JN_std = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_34_JN_avg,'linear');
ETAN_34_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC3,YC3,ETAN_34_JN_std,'linear');
ETAN_34_JN_std = F(XCS,YCS);


F = griddedInterpolant(XC6,YC6,CFLUX_62_DJF_avg,'linear');
CFLUX_62_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,OFLUX_62_DJF_avg,'linear');
OFLUX_62_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,TFLUX_62_DJF_avg,'linear');
TFLUX_62_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SFLUX_62_DJF_avg,'linear');
SFLUX_62_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,THETA_62_DJF_avg,'linear');
THETA_62_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SALT_62_DJF_avg,'linear');
SALT_62_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_62_DJF_avg,'linear');
WVEL_62_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_62_DJF_std,'linear');
WVEL_62_DJF_std = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_62_DJF_avg,'linear');
ETAN_62_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_62_DJF_std,'linear');
ETAN_62_DJF_std = F(XCS,YCS);

F = griddedInterpolant(XC6,YC6,CFLUX_62_DM_avg,'linear');
CFLUX_62_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,OFLUX_62_DM_avg,'linear');
OFLUX_62_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,TFLUX_62_DM_avg,'linear');
TFLUX_62_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SFLUX_62_DM_avg,'linear');
SFLUX_62_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,THETA_62_DM_avg,'linear');
THETA_62_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SALT_62_DM_avg,'linear');
SALT_62_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_62_DM_avg,'linear');
WVEL_62_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_62_DM_std,'linear');
WVEL_62_DM_std = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_62_DM_avg,'linear');
ETAN_62_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_62_DM_std,'linear');
ETAN_62_DM_std = F(XCS,YCS);

F = griddedInterpolant(XC6,YC6,CFLUX_62_DD_avg,'linear');
CFLUX_62_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,OFLUX_62_DD_avg,'linear');
OFLUX_62_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,TFLUX_62_DD_avg,'linear');
TFLUX_62_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SFLUX_62_DD_avg,'linear');
SFLUX_62_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,THETA_62_DD_avg,'linear');
THETA_62_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SALT_62_DD_avg,'linear');
SALT_62_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_62_DD_avg,'linear');
WVEL_62_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_62_DD_std,'linear');
WVEL_62_DD_std = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_62_DD_avg,'linear');
ETAN_62_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_62_DD_std,'linear');
ETAN_62_DD_std = F(XCS,YCS);

F = griddedInterpolant(XC6,YC6,CFLUX_64_JJA_avg,'linear');
CFLUX_64_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,OFLUX_64_JJA_avg,'linear');
OFLUX_64_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,TFLUX_64_JJA_avg,'linear');
TFLUX_64_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SFLUX_64_JJA_avg,'linear');
SFLUX_64_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,THETA_64_JJA_avg,'linear');
THETA_64_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SALT_64_JJA_avg,'linear');
SALT_64_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_64_JJA_avg,'linear');
WVEL_64_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_64_JJA_std,'linear');
WVEL_64_JJA_std = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_64_JJA_avg,'linear');
ETAN_64_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_64_JJA_std,'linear');
ETAN_64_JJA_std = F(XCS,YCS);

F = griddedInterpolant(XC6,YC6,CFLUX_64_JN_avg,'linear');
CFLUX_64_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,OFLUX_64_JN_avg,'linear');
OFLUX_64_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,TFLUX_64_JN_avg,'linear');
TFLUX_64_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SFLUX_64_JN_avg,'linear');
SFLUX_64_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,THETA_64_JN_avg,'linear');
THETA_64_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,SALT_64_JN_avg,'linear');
SALT_64_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_64_JN_avg,'linear');
WVEL_64_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,WVEL_64_JN_std,'linear');
WVEL_64_JN_std = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_64_JN_avg,'linear');
ETAN_64_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC6,YC6,ETAN_64_JN_std,'linear');
ETAN_64_JN_std = F(XCS,YCS);


F = griddedInterpolant(XC12,YC12,CFLUX_122_DJF_avg,'linear');
CFLUX_122_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,OFLUX_122_DJF_avg,'linear');
OFLUX_122_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,TFLUX_122_DJF_avg,'linear');
TFLUX_122_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SFLUX_122_DJF_avg,'linear');
SFLUX_122_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,THETA_122_DJF_avg,'linear');
THETA_122_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SALT_122_DJF_avg,'linear');
SALT_122_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_122_DJF_avg,'linear');
WVEL_122_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_122_DJF_std,'linear');
WVEL_122_DJF_std = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_122_DJF_avg,'linear');
ETAN_122_DJF_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_122_DJF_std,'linear');
ETAN_122_DJF_std = F(XCS,YCS);

F = griddedInterpolant(XC12,YC12,CFLUX_122_DM_avg,'linear');
CFLUX_122_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,OFLUX_122_DM_avg,'linear');
OFLUX_122_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,TFLUX_122_DM_avg,'linear');
TFLUX_122_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SFLUX_122_DM_avg,'linear');
SFLUX_122_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,THETA_122_DM_avg,'linear');
THETA_122_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SALT_122_DM_avg,'linear');
SALT_122_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_122_DM_avg,'linear');
WVEL_122_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_122_DM_std,'linear');
WVEL_122_DM_std = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_122_DM_avg,'linear');
ETAN_122_DM_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_122_DM_std,'linear');
ETAN_122_DM_std = F(XCS,YCS);

F = griddedInterpolant(XC12,YC12,CFLUX_122_DD_avg,'linear');
CFLUX_122_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,OFLUX_122_DD_avg,'linear');
OFLUX_122_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,TFLUX_122_DD_avg,'linear');
TFLUX_122_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SFLUX_122_DD_avg,'linear');
SFLUX_122_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,THETA_122_DD_avg,'linear');
THETA_122_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SALT_122_DD_avg,'linear');
SALT_122_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_122_DD_avg,'linear');
WVEL_122_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_122_DD_std,'linear');
WVEL_122_DD_std = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_122_DD_avg,'linear');
ETAN_122_DD_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_122_DD_std,'linear');
ETAN_122_DD_std = F(XCS,YCS);

F = griddedInterpolant(XC12,YC12,CFLUX_124_JJA_avg,'linear');
CFLUX_124_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,OFLUX_124_JJA_avg,'linear');
OFLUX_124_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,TFLUX_124_JJA_avg,'linear');
TFLUX_124_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SFLUX_124_JJA_avg,'linear');
SFLUX_124_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,THETA_124_JJA_avg,'linear');
THETA_124_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SALT_124_JJA_avg,'linear');
SALT_124_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_124_JJA_avg,'linear');
WVEL_124_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_124_JJA_std,'linear');
WVEL_124_JJA_std = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_124_JJA_avg,'linear');
ETAN_124_JJA_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_124_JJA_std,'linear');
ETAN_124_JJA_std = F(XCS,YCS);

F = griddedInterpolant(XC12,YC12,CFLUX_124_JN_avg,'linear');
CFLUX_124_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,OFLUX_124_JN_avg,'linear');
OFLUX_124_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,TFLUX_124_JN_avg,'linear');
TFLUX_124_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SFLUX_124_JN_avg,'linear');
SFLUX_124_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,THETA_124_JN_avg,'linear');
THETA_124_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,SALT_124_JN_avg,'linear');
SALT_124_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_124_JN_avg,'linear');
WVEL_124_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,WVEL_124_JN_std,'linear');
WVEL_124_JN_std = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_124_JN_avg,'linear');
ETAN_124_JN_avg = F(XCS,YCS);
F = griddedInterpolant(XC12,YC12,ETAN_124_JN_std,'linear');
ETAN_124_JN_std = F(XCS,YCS);
%% End Interpolate

%% Take Difference
CFLUX_32_DJF_avg = CFLUX_32_DJF_avg - CFLUX_BSOSE_DJF_avg;
OFLUX_32_DJF_avg = OFLUX_32_DJF_avg - OFLUX_BSOSE_DJF_avg;
TFLUX_32_DJF_avg = TFLUX_32_DJF_avg - TFLUX_BSOSE_DJF_avg;
SFLUX_32_DJF_avg = SFLUX_32_DJF_avg - SFLUX_BSOSE_DJF_avg;
THETA_32_DJF_avg = THETA_32_DJF_avg - THETA_BSOSE_DJF_avg;
SALT_32_DJF_avg = SALT_32_DJF_avg - SALT_BSOSE_DJF_avg;
WVEL_32_DJF_avg = WVEL_32_DJF_avg - WVEL_BSOSE_DJF_avg;
WVEL_32_DJF_std = WVEL_32_DJF_std - WVEL_BSOSE_DJF_std;
ETAN_32_DJF_avg = ETAN_32_DJF_avg - ETAN_BSOSE_DJF_avg;
ETAN_32_DJF_std = ETAN_32_DJF_std - ETAN_BSOSE_DJF_std;

CFLUX_32_DM_avg = CFLUX_32_DM_avg - CFLUX_BSOSE_DM_avg;
OFLUX_32_DM_avg = OFLUX_32_DM_avg - OFLUX_BSOSE_DM_avg;
TFLUX_32_DM_avg = TFLUX_32_DM_avg - TFLUX_BSOSE_DM_avg;
SFLUX_32_DM_avg = SFLUX_32_DM_avg - SFLUX_BSOSE_DM_avg;
THETA_32_DM_avg = THETA_32_DM_avg - THETA_BSOSE_DM_avg;
SALT_32_DM_avg = SALT_32_DM_avg - SALT_BSOSE_DM_avg;
WVEL_32_DM_avg = WVEL_32_DM_avg - WVEL_BSOSE_DM_avg;
WVEL_32_DM_std = WVEL_32_DM_std - WVEL_BSOSE_DM_std;
ETAN_32_DM_avg = ETAN_32_DM_avg - ETAN_BSOSE_DM_avg;
ETAN_32_DM_std = ETAN_32_DM_std - ETAN_BSOSE_DM_std;

CFLUX_32_DD_avg = CFLUX_32_DD_avg - CFLUX_BSOSE_DD_avg;
OFLUX_32_DD_avg = OFLUX_32_DD_avg - OFLUX_BSOSE_DD_avg;
TFLUX_32_DD_avg = TFLUX_32_DD_avg - TFLUX_BSOSE_DD_avg;
SFLUX_32_DD_avg = SFLUX_32_DD_avg - SFLUX_BSOSE_DD_avg;
THETA_32_DD_avg = THETA_32_DD_avg - THETA_BSOSE_DD_avg;
SALT_32_DD_avg = SALT_32_DD_avg - SALT_BSOSE_DD_avg;
WVEL_32_DD_avg = WVEL_32_DD_avg - WVEL_BSOSE_DD_avg;
WVEL_32_DD_std = WVEL_32_DD_std - WVEL_BSOSE_DD_std;
ETAN_32_DD_avg = ETAN_32_DD_avg - ETAN_BSOSE_DD_avg;
ETAN_32_DD_std = ETAN_32_DD_std - ETAN_BSOSE_DD_std;

CFLUX_34_JJA_avg = CFLUX_34_JJA_avg - CFLUX_BSOSE_JJA_avg;
OFLUX_34_JJA_avg = OFLUX_34_JJA_avg - OFLUX_BSOSE_JJA_avg;
TFLUX_34_JJA_avg = TFLUX_34_JJA_avg - TFLUX_BSOSE_JJA_avg;
SFLUX_34_JJA_avg = SFLUX_34_JJA_avg - SFLUX_BSOSE_JJA_avg;
THETA_34_JJA_avg = THETA_34_JJA_avg - THETA_BSOSE_JJA_avg;
SALT_34_JJA_avg = SALT_34_JJA_avg - SALT_BSOSE_JJA_avg;
WVEL_34_JJA_avg = WVEL_34_JJA_avg - WVEL_BSOSE_JJA_avg;
WVEL_34_JJA_std = WVEL_34_JJA_std - WVEL_BSOSE_JJA_std;
ETAN_34_JJA_avg = ETAN_34_JJA_avg - ETAN_BSOSE_JJA_avg;
ETAN_34_JJA_std = ETAN_34_JJA_std - ETAN_BSOSE_JJA_std;

CFLUX_34_JN_avg = CFLUX_34_JN_avg - CFLUX_BSOSE_JN_avg;
OFLUX_34_JN_avg = OFLUX_34_JN_avg - OFLUX_BSOSE_JN_avg;
TFLUX_34_JN_avg = TFLUX_34_JN_avg - TFLUX_BSOSE_JN_avg;
SFLUX_34_JN_avg = SFLUX_34_JN_avg - SFLUX_BSOSE_JN_avg;
THETA_34_JN_avg = THETA_34_JN_avg - THETA_BSOSE_JN_avg;
SALT_34_JN_avg = SALT_34_JN_avg - SALT_BSOSE_JN_avg;
WVEL_34_JN_avg = WVEL_34_JN_avg - WVEL_BSOSE_JN_avg;
WVEL_34_JN_std = WVEL_34_JN_std - WVEL_BSOSE_JN_std;
ETAN_34_JN_avg = ETAN_34_JN_avg - ETAN_BSOSE_JN_avg;
ETAN_34_JN_std = ETAN_34_JN_std - ETAN_BSOSE_JN_std;

CFLUX_62_DJF_avg = CFLUX_62_DJF_avg - CFLUX_BSOSE_DJF_avg;
OFLUX_62_DJF_avg = OFLUX_62_DJF_avg - OFLUX_BSOSE_DJF_avg;
TFLUX_62_DJF_avg = TFLUX_62_DJF_avg - TFLUX_BSOSE_DJF_avg;
SFLUX_62_DJF_avg = SFLUX_62_DJF_avg - SFLUX_BSOSE_DJF_avg;
THETA_62_DJF_avg = THETA_62_DJF_avg - THETA_BSOSE_DJF_avg;
SALT_62_DJF_avg = SALT_62_DJF_avg - SALT_BSOSE_DJF_avg;
WVEL_62_DJF_avg = WVEL_62_DJF_avg - WVEL_BSOSE_DJF_avg;
WVEL_62_DJF_std = WVEL_62_DJF_std - WVEL_BSOSE_DJF_std;
ETAN_62_DJF_avg = ETAN_62_DJF_avg - ETAN_BSOSE_DJF_avg;
ETAN_62_DJF_std = ETAN_62_DJF_std - ETAN_BSOSE_DJF_std;

CFLUX_62_DM_avg = CFLUX_62_DM_avg - CFLUX_BSOSE_DM_avg;
OFLUX_62_DM_avg = OFLUX_62_DM_avg - OFLUX_BSOSE_DM_avg;
TFLUX_62_DM_avg = TFLUX_62_DM_avg - TFLUX_BSOSE_DM_avg;
SFLUX_62_DM_avg = SFLUX_62_DM_avg - SFLUX_BSOSE_DM_avg;
THETA_62_DM_avg = THETA_62_DM_avg - THETA_BSOSE_DM_avg;
SALT_62_DM_avg = SALT_62_DM_avg - SALT_BSOSE_DM_avg;
WVEL_62_DM_avg = WVEL_62_DM_avg - WVEL_BSOSE_DM_avg;
WVEL_62_DM_std = WVEL_62_DM_std - WVEL_BSOSE_DM_std;
ETAN_62_DM_avg = ETAN_62_DM_avg - ETAN_BSOSE_DM_avg;
ETAN_62_DM_std = ETAN_62_DM_std - ETAN_BSOSE_DM_std;

CFLUX_62_DD_avg = CFLUX_62_DD_avg - CFLUX_BSOSE_DD_avg;
OFLUX_62_DD_avg = OFLUX_62_DD_avg - OFLUX_BSOSE_DD_avg;
TFLUX_62_DD_avg = TFLUX_62_DD_avg - TFLUX_BSOSE_DD_avg;
SFLUX_62_DD_avg = SFLUX_62_DD_avg - SFLUX_BSOSE_DD_avg;
THETA_62_DD_avg = THETA_62_DD_avg - THETA_BSOSE_DD_avg;
SALT_62_DD_avg = SALT_62_DD_avg - SALT_BSOSE_DD_avg;
WVEL_62_DD_avg = WVEL_62_DD_avg - WVEL_BSOSE_DD_avg;
WVEL_62_DD_std = WVEL_62_DD_std - WVEL_BSOSE_DD_std;
ETAN_62_DD_avg = ETAN_62_DD_avg - ETAN_BSOSE_DD_avg;
ETAN_62_DD_std = ETAN_62_DD_std - ETAN_BSOSE_DD_std;

CFLUX_64_JJA_avg = CFLUX_64_JJA_avg - CFLUX_BSOSE_JJA_avg;
OFLUX_64_JJA_avg = OFLUX_64_JJA_avg - OFLUX_BSOSE_JJA_avg;
TFLUX_64_JJA_avg = TFLUX_64_JJA_avg - TFLUX_BSOSE_JJA_avg;
SFLUX_64_JJA_avg = SFLUX_64_JJA_avg - SFLUX_BSOSE_JJA_avg;
THETA_64_JJA_avg = THETA_64_JJA_avg - THETA_BSOSE_JJA_avg;
SALT_64_JJA_avg = SALT_64_JJA_avg - SALT_BSOSE_JJA_avg;
WVEL_64_JJA_avg = WVEL_64_JJA_avg - WVEL_BSOSE_JJA_avg;
WVEL_64_JJA_std = WVEL_64_JJA_std - WVEL_BSOSE_JJA_std;
ETAN_64_JJA_avg = ETAN_64_JJA_avg - ETAN_BSOSE_JJA_avg;
ETAN_64_JJA_std = ETAN_64_JJA_std - ETAN_BSOSE_JJA_std;

CFLUX_64_JN_avg = CFLUX_64_JN_avg - CFLUX_BSOSE_JN_avg;
OFLUX_64_JN_avg = OFLUX_64_JN_avg - OFLUX_BSOSE_JN_avg;
TFLUX_64_JN_avg = TFLUX_64_JN_avg - TFLUX_BSOSE_JN_avg;
SFLUX_64_JN_avg = SFLUX_64_JN_avg - SFLUX_BSOSE_JN_avg;
THETA_64_JN_avg = THETA_64_JN_avg - THETA_BSOSE_JN_avg;
SALT_64_JN_avg = SALT_64_JN_avg - SALT_BSOSE_JN_avg;
WVEL_64_JN_avg = WVEL_64_JN_avg - WVEL_BSOSE_JN_avg;
WVEL_64_JN_std = WVEL_64_JN_std - WVEL_BSOSE_JN_std;
ETAN_64_JN_avg = ETAN_64_JN_avg - ETAN_BSOSE_JN_avg;
ETAN_64_JN_std = ETAN_64_JN_std - ETAN_BSOSE_JN_std;

CFLUX_122_DJF_avg = CFLUX_122_DJF_avg - CFLUX_BSOSE_DJF_avg;
OFLUX_122_DJF_avg = OFLUX_122_DJF_avg - OFLUX_BSOSE_DJF_avg;
TFLUX_122_DJF_avg = TFLUX_122_DJF_avg - TFLUX_BSOSE_DJF_avg;
SFLUX_122_DJF_avg = SFLUX_122_DJF_avg - SFLUX_BSOSE_DJF_avg;
THETA_122_DJF_avg = THETA_122_DJF_avg - THETA_BSOSE_DJF_avg;
SALT_122_DJF_avg = SALT_122_DJF_avg - SALT_BSOSE_DJF_avg;
WVEL_122_DJF_avg = WVEL_122_DJF_avg - WVEL_BSOSE_DJF_avg;
WVEL_122_DJF_std = WVEL_122_DJF_std - WVEL_BSOSE_DJF_std;
ETAN_122_DJF_avg = ETAN_122_DJF_avg - ETAN_BSOSE_DJF_avg;
ETAN_122_DJF_std = ETAN_122_DJF_std - ETAN_BSOSE_DJF_std;

CFLUX_122_DM_avg = CFLUX_122_DM_avg - CFLUX_BSOSE_DM_avg;
OFLUX_122_DM_avg = OFLUX_122_DM_avg - OFLUX_BSOSE_DM_avg;
TFLUX_122_DM_avg = TFLUX_122_DM_avg - TFLUX_BSOSE_DM_avg;
SFLUX_122_DM_avg = SFLUX_122_DM_avg - SFLUX_BSOSE_DM_avg;
THETA_122_DM_avg = THETA_122_DM_avg - THETA_BSOSE_DM_avg;
SALT_122_DM_avg = SALT_122_DM_avg - SALT_BSOSE_DM_avg;
WVEL_122_DM_avg = WVEL_122_DM_avg - WVEL_BSOSE_DM_avg;
WVEL_122_DM_std = WVEL_122_DM_std - WVEL_BSOSE_DM_std;
ETAN_122_DM_avg = ETAN_122_DM_avg - ETAN_BSOSE_DM_avg;
ETAN_122_DM_std = ETAN_122_DM_std - ETAN_BSOSE_DM_std;

CFLUX_122_DD_avg = CFLUX_122_DD_avg - CFLUX_BSOSE_DD_avg;
OFLUX_122_DD_avg = OFLUX_122_DD_avg - OFLUX_BSOSE_DD_avg;
TFLUX_122_DD_avg = TFLUX_122_DD_avg - TFLUX_BSOSE_DD_avg;
SFLUX_122_DD_avg = SFLUX_122_DD_avg - SFLUX_BSOSE_DD_avg;
THETA_122_DD_avg = THETA_122_DD_avg - THETA_BSOSE_DD_avg;
SALT_122_DD_avg = SALT_122_DD_avg - SALT_BSOSE_DD_avg;
WVEL_122_DD_avg = WVEL_122_DD_avg - WVEL_BSOSE_DD_avg;
WVEL_122_DD_std = WVEL_122_DD_std - WVEL_BSOSE_DD_std;
ETAN_122_DD_avg = ETAN_122_DD_avg - ETAN_BSOSE_DD_avg;
ETAN_122_DD_std = ETAN_122_DD_std - ETAN_BSOSE_DD_std;

CFLUX_124_JJA_avg = CFLUX_124_JJA_avg - CFLUX_BSOSE_JJA_avg;
OFLUX_124_JJA_avg = OFLUX_124_JJA_avg - OFLUX_BSOSE_JJA_avg;
TFLUX_124_JJA_avg = TFLUX_124_JJA_avg - TFLUX_BSOSE_JJA_avg;
SFLUX_124_JJA_avg = SFLUX_124_JJA_avg - SFLUX_BSOSE_JJA_avg;
THETA_124_JJA_avg = THETA_124_JJA_avg - THETA_BSOSE_JJA_avg;
SALT_124_JJA_avg = SALT_124_JJA_avg - SALT_BSOSE_JJA_avg;
WVEL_124_JJA_avg = WVEL_124_JJA_avg - WVEL_BSOSE_JJA_avg;
WVEL_124_JJA_std = WVEL_124_JJA_std - WVEL_BSOSE_JJA_std;
ETAN_124_JJA_avg = ETAN_124_JJA_avg - ETAN_BSOSE_JJA_avg;
ETAN_124_JJA_std = ETAN_124_JJA_std - ETAN_BSOSE_JJA_std;

CFLUX_124_JN_avg = CFLUX_124_JN_avg - CFLUX_BSOSE_JN_avg;
OFLUX_124_JN_avg = OFLUX_124_JN_avg - OFLUX_BSOSE_JN_avg;
TFLUX_124_JN_avg = TFLUX_124_JN_avg - TFLUX_BSOSE_JN_avg;
SFLUX_124_JN_avg = SFLUX_124_JN_avg - SFLUX_BSOSE_JN_avg;
THETA_124_JN_avg = THETA_124_JN_avg - THETA_BSOSE_JN_avg;
SALT_124_JN_avg = SALT_124_JN_avg - SALT_BSOSE_JN_avg;
WVEL_124_JN_avg = WVEL_124_JN_avg - WVEL_BSOSE_JN_avg;
WVEL_124_JN_std = WVEL_124_JN_std - WVEL_BSOSE_JN_std;
ETAN_124_JN_avg = ETAN_124_JN_avg - ETAN_BSOSE_JN_avg;
ETAN_124_JN_std = ETAN_124_JN_std - ETAN_BSOSE_JN_std;
%% End Difference

%% Put Land Value In
CFLUX_32_DJF_avg(HC==0) = 9999999;
OFLUX_32_DJF_avg(HC==0) = 9999999;
TFLUX_32_DJF_avg(HC==0) = 9999999;
SFLUX_32_DJF_avg(HC==0) = 9999999;
THETA_32_DJF_avg(HC==0) = 9999999;
SALT_32_DJF_avg(HC==0) = 9999999;
WVEL_32_DJF_avg(HC==0) = 9999999;
WVEL_32_DJF_std(HC==0) = 9999999;
ETAN_32_DJF_avg(HC==0) = 9999999;
ETAN_32_DJF_std(HC==0) = 9999999;

CFLUX_32_DM_avg(HC==0) = 9999999;
OFLUX_32_DM_avg(HC==0) = 9999999;
TFLUX_32_DM_avg(HC==0) = 9999999;
SFLUX_32_DM_avg(HC==0) = 9999999;
THETA_32_DM_avg(HC==0) = 9999999;
SALT_32_DM_avg(HC==0) = 9999999;
WVEL_32_DM_avg(HC==0) = 9999999;
WVEL_32_DM_std(HC==0) = 9999999;
ETAN_32_DM_avg(HC==0) = 9999999;
ETAN_32_DM_std(HC==0) = 9999999;

CFLUX_32_DD_avg(HC==0) = 9999999;
OFLUX_32_DD_avg(HC==0) = 9999999;
TFLUX_32_DD_avg(HC==0) = 9999999;
SFLUX_32_DD_avg(HC==0) = 9999999;
THETA_32_DD_avg(HC==0) = 9999999;
SALT_32_DD_avg(HC==0) = 9999999;
WVEL_32_DD_avg(HC==0) = 9999999;
WVEL_32_DD_std(HC==0) = 9999999;
ETAN_32_DD_avg(HC==0) = 9999999;
ETAN_32_DD_std(HC==0) = 9999999;

CFLUX_34_JJA_avg(HC==0) = 9999999;
OFLUX_34_JJA_avg(HC==0) = 9999999;
TFLUX_34_JJA_avg(HC==0) = 9999999;
SFLUX_34_JJA_avg(HC==0) = 9999999;
THETA_34_JJA_avg(HC==0) = 9999999;
SALT_34_JJA_avg(HC==0) = 9999999;
WVEL_34_JJA_avg(HC==0) = 9999999;
WVEL_34_JJA_std(HC==0) = 9999999;
ETAN_34_JJA_avg(HC==0) = 9999999;
ETAN_34_JJA_std(HC==0) = 9999999;

CFLUX_34_JN_avg(HC==0) = 9999999;
OFLUX_34_JN_avg(HC==0) = 9999999;
TFLUX_34_JN_avg(HC==0) = 9999999;
SFLUX_34_JN_avg(HC==0) = 9999999;
THETA_34_JN_avg(HC==0) = 9999999;
SALT_34_JN_avg(HC==0) = 9999999;
WVEL_34_JN_avg(HC==0) = 9999999;
WVEL_34_JN_std(HC==0) = 9999999;
ETAN_34_JN_avg(HC==0) = 9999999;
ETAN_34_JN_std(HC==0) = 9999999;

CFLUX_62_DJF_avg(HC==0) = 9999999;
OFLUX_62_DJF_avg(HC==0) = 9999999;
TFLUX_62_DJF_avg(HC==0) = 9999999;
SFLUX_62_DJF_avg(HC==0) = 9999999;
THETA_62_DJF_avg(HC==0) = 9999999;
SALT_62_DJF_avg(HC==0) = 9999999;
WVEL_62_DJF_avg(HC==0) = 9999999;
WVEL_62_DJF_std(HC==0) = 9999999;
ETAN_62_DJF_avg(HC==0) = 9999999;
ETAN_62_DJF_std(HC==0) = 9999999;

CFLUX_62_DM_avg(HC==0) = 9999999;
OFLUX_62_DM_avg(HC==0) = 9999999;
TFLUX_62_DM_avg(HC==0) = 9999999;
SFLUX_62_DM_avg(HC==0) = 9999999;
THETA_62_DM_avg(HC==0) = 9999999;
SALT_62_DM_avg(HC==0) = 9999999;
WVEL_62_DM_avg(HC==0) = 9999999;
WVEL_62_DM_std(HC==0) = 9999999;
ETAN_62_DM_avg(HC==0) = 9999999;
ETAN_62_DM_std(HC==0) = 9999999;

CFLUX_62_DD_avg(HC==0) = 9999999;
OFLUX_62_DD_avg(HC==0) = 9999999;
TFLUX_62_DD_avg(HC==0) = 9999999;
SFLUX_62_DD_avg(HC==0) = 9999999;
THETA_62_DD_avg(HC==0) = 9999999;
SALT_62_DD_avg(HC==0) = 9999999;
WVEL_62_DD_avg(HC==0) = 9999999;
WVEL_62_DD_std(HC==0) = 9999999;
ETAN_62_DD_avg(HC==0) = 9999999;
ETAN_62_DD_std(HC==0) = 9999999;

CFLUX_64_JJA_avg(HC==0) = 9999999;
OFLUX_64_JJA_avg(HC==0) = 9999999;
TFLUX_64_JJA_avg(HC==0) = 9999999;
SFLUX_64_JJA_avg(HC==0) = 9999999;
THETA_64_JJA_avg(HC==0) = 9999999;
SALT_64_JJA_avg(HC==0) = 9999999;
WVEL_64_JJA_avg(HC==0) = 9999999;
WVEL_64_JJA_std(HC==0) = 9999999;
ETAN_64_JJA_avg(HC==0) = 9999999;
ETAN_64_JJA_std(HC==0) = 9999999;

CFLUX_64_JN_avg(HC==0) = 9999999;
OFLUX_64_JN_avg(HC==0) = 9999999;
TFLUX_64_JN_avg(HC==0) = 9999999;
SFLUX_64_JN_avg(HC==0) = 9999999;
THETA_64_JN_avg(HC==0) = 9999999;
SALT_64_JN_avg(HC==0) = 9999999;
WVEL_64_JN_avg(HC==0) = 9999999;
WVEL_64_JN_std(HC==0) = 9999999;
ETAN_64_JN_avg(HC==0) = 9999999;
ETAN_64_JN_std(HC==0) = 9999999;

CFLUX_122_DJF_avg(HC==0) = 9999999;
OFLUX_122_DJF_avg(HC==0) = 9999999;
TFLUX_122_DJF_avg(HC==0) = 9999999;
SFLUX_122_DJF_avg(HC==0) = 9999999;
THETA_122_DJF_avg(HC==0) = 9999999;
SALT_122_DJF_avg(HC==0) = 9999999;
WVEL_122_DJF_avg(HC==0) = 9999999;
WVEL_122_DJF_std(HC==0) = 9999999;
ETAN_122_DJF_avg(HC==0) = 9999999;
ETAN_122_DJF_std(HC==0) = 9999999;

CFLUX_122_DM_avg(HC==0) = 9999999;
OFLUX_122_DM_avg(HC==0) = 9999999;
TFLUX_122_DM_avg(HC==0) = 9999999;
SFLUX_122_DM_avg(HC==0) = 9999999;
THETA_122_DM_avg(HC==0) = 9999999;
SALT_122_DM_avg(HC==0) = 9999999;
WVEL_122_DM_avg(HC==0) = 9999999;
WVEL_122_DM_std(HC==0) = 9999999;
ETAN_122_DM_avg(HC==0) = 9999999;
ETAN_122_DM_std(HC==0) = 9999999;

CFLUX_122_DD_avg(HC==0) = 9999999;
OFLUX_122_DD_avg(HC==0) = 9999999;
TFLUX_122_DD_avg(HC==0) = 9999999;
SFLUX_122_DD_avg(HC==0) = 9999999;
THETA_122_DD_avg(HC==0) = 9999999;
SALT_122_DD_avg(HC==0) = 9999999;
WVEL_122_DD_avg(HC==0) = 9999999;
WVEL_122_DD_std(HC==0) = 9999999;
ETAN_122_DD_avg(HC==0) = 9999999;
ETAN_122_DD_std(HC==0) = 9999999;

CFLUX_124_JJA_avg(HC==0) = 9999999;
OFLUX_124_JJA_avg(HC==0) = 9999999;
TFLUX_124_JJA_avg(HC==0) = 9999999;
SFLUX_124_JJA_avg(HC==0) = 9999999;
THETA_124_JJA_avg(HC==0) = 9999999;
SALT_124_JJA_avg(HC==0) = 9999999;
WVEL_124_JJA_avg(HC==0) = 9999999;
WVEL_124_JJA_std(HC==0) = 9999999;
ETAN_124_JJA_avg(HC==0) = 9999999;
ETAN_124_JJA_std(HC==0) = 9999999;

CFLUX_124_JN_avg(HC==0) = 9999999;
OFLUX_124_JN_avg(HC==0) = 9999999;
TFLUX_124_JN_avg(HC==0) = 9999999;
SFLUX_124_JN_avg(HC==0) = 9999999;
THETA_124_JN_avg(HC==0) = 9999999;
SALT_124_JN_avg(HC==0) = 9999999;
WVEL_124_JN_avg(HC==0) = 9999999;
WVEL_124_JN_std(HC==0) = 9999999;
ETAN_124_JN_avg(HC==0) = 9999999;
ETAN_124_JN_std(HC==0) = 9999999;
%% End Put Land Value In

clear *BSOSE*
save diff_avgs




toc()