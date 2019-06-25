
[lb1,ub1] = acc_mxmn(TFLUX_BSOSE_JJA_avg);
[lb2,ub2] = acc_mxmn(TFLUX_34_JJA_avg);
[lb3,ub3] = acc_mxmn(TFLUX_64_JJA_avg);
[lb4,ub4] = acc_mxmn(TFLUX_124_JJA_avg);
fprintf('TFLUX \n \n')
fprintf('the lower bounds are %g  %g  %g  %g \n \n',lb1,lb2,lb3,lb4)
fprintf('the upper bounds are %g  %g  %g  %g \n \n',ub1,ub2,ub3,ub4)

fprintf('the optimal bounds are %g  %g  \n \n',min([lb1 lb2 lb3 lb4]),max([ub1 ub2 ub3 ub4]))