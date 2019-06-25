function [lb,ub] = acc_mxmn(A)
A = A(A<10000);
lb = min(A);
ub = max(A);
end

