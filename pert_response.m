function [lin_response,nonlin_response] = pert_response(ctrl,pert,npert,mask,area)
%% calculates RMSE of linear and nonlinear reponse
% inputs must be same sized 3D fields:
% time series of horizontal fields with dim nx ny nt
%%
nt = size(ctrl,3);

weights = mask.*area;
wsum = sum(sum(weights));
num = sum(sum(mask));

dh1 = pert - ctrl;
dh2 = npert - ctrl;

dH1 = 0.5.*(dh1 - dh2);
dH2 = 0.5.*(dh1 + dh2);

dH1 = weights.*dH1./wsum;
dH2 = weights.*dH2./wsum;

lin_response = zeros(nt,1);
nonlin_response = zeros(nt,1);

for ii=1:nt
    lin_response(ii) = sqrt(sum(dH1(:,:,ii).^2,[1,2]))/sqrt(num);
    nonlin_response(ii) = sqrt(sum(dH2(:,:,ii).^2,[1,2]))/sqrt(num);
end
end

