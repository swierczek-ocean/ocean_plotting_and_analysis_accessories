function X = normalize_age(X)
%% fixes age tracer to be between 0 and 1
% dimension 2 must be time
%% 
[nn,mm] = size(X);

for ii=1:mm
    X(:,ii) = X(:,ii)./max(X(:,ii));
end
end

