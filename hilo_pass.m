function [mm,ee,tt,cc] = hilo_pass(tsw,tst)
%% high and low pass filters
% takes in two time series and outputs four scalars
% ts must have lengths >91
%%

tswl = tsw;
tstl = tst;

nn = length(tsw);  % must be same as length(tst)

for ii=31:45
    tswl(ii) = mean(tsw((ii-30):(ii+45)));
    tstl(ii) = mean(tst((ii-30):(ii+45)));    
end

for ii=46:(nn-45)
    tswl(ii) = mean(tsw((ii-45):(ii+45)));
    tstl(ii) = mean(tst((ii-45):(ii+45)));
end

for ii=(nn-44):(nn-30)
    tswl(ii) = mean(tsw((ii-45):(ii+30)));
    tstl(ii) = mean(tst((ii-45):(ii+30)));
end

tswl = tswl(31:(nn-30));
tstl = tstl(31:(nn-30));

tswh = tsw(31:(nn-30)) - tswl;
tsth = tst(31:(nn-30)) - tstl;

a = sum(tswl.*tswh);
b = sum(tswl.*tswl);
c = sum(tstl.*tsth);
d = sum(tstl.*tstl);

% fprintf('length of a = %g,  a = %g,  b = %g,  c = %g,  d = %g \n',length(a),a,b,c,d);

if b>0
    tswh = tswh - tswl.*(a/b);
    tsth = tsth - tstl.*(c/d);
    mm = mean(tswl.*tstl);
    ee = mean(tswh.*tsth);
    tt = mm+ee;
    cc = mean(tsw(31:(nn-30)).*tst(31:(nn-30)));
else
    mm = 0;
    ee = 0;
    tt = 0;
    cc = 0;
end

end

