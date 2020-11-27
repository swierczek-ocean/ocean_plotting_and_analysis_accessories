function [lin_response,nonlin_response] = pert_response(ctrl,pert,npert)
%% calculates RMSE of linear and nonlinear reponse
% inputs must be same sized 3D fields:
% time series of horizontal fields with dim nx ny nt
%%
nt = size(ctrl,3);

dh1 = pert - ctrl;
dh2 = npert - ctrl;

dH1 = 0.5.*(dh1 - dh2);
dH2 = 0.5.*(dh1 + dh2);

lin_response = zeros(nt,1);
nonlin_response = zeros(nt,1);

for ii=1:nt
    A = dH1(:,:,ii);
    A = A(A~=0);
    len = length(A);
    fprintf('%g nonzero linear entries at iteration %g \n',len,ii)
    lin_response(ii) = sum(A.*A)/sqrt(len);
    clear A
    B = dH2(:,:,ii);
    B = B(B~=0);
    len = length(B);
    nonlin_response(ii) = sum(B.*B)/sqrt(len);
    fprintf('%g nonzero nonlinear entries at iteration %g \n',len,ii)
    clear B
end
end

