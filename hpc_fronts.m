clear
close all
clc
tic()

XC = rdmds('../MITgcm/verification/SO3_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO3_20190513/run/YC');
str = '../MITgcm/verification/SO3_20190513/diag/';

%% prelim

theta = zeros(192,132,12);
salt = zeros(192,132,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(1460*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,ii) = mean(temp(:,:,12:13),3);
    temp = rdmds(charstate,'rec',2);
    salt(:,:,ii) = mean(temp(:,:,12:13),3);
end

theta = mean(theta,3);
salt = mean(salt,3);

stf310 = zeros(192,132);
stf311 = zeros(192,132);
stf312 = zeros(192,132);

stf310(theta>10) = 1;
stf311(theta>11) = 1;
stf312(theta>12) = 1;

st_front3_x = XC(:,1);
Y = YC(1,:);
st_front3_y = NaN.*ones(192,1);

for ii=1:192
    theta_col = theta(ii,:);
    salt_col = salt(ii,:);
    ind1 = find(theta_col>10);
    ind2 = find(theta_col<12);
    indt = intersect(ind1,ind2);
    ind1 = find(salt_col>34.6);
    ind2 = find(salt_col<35);
    inds = intersect(ind1,ind2);
    clear ind1 ind2
    ind = intersect(indt,inds);
    fprintf('iteration %g  number of indices %g  number of temp indices %g  number of salt indices %g \n',...
        ii,length(ind),length(indt),length(inds))
    if isempty(ind)==0
        st_front3_y(ii) = Y(round(mean(ind)));
    elseif isempty(indt)==0
        st_front3_y(ii) = Y(round(mean(indt)));
    end        
end

XC = rdmds('../MITgcm/verification/SO6_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO6_20190513/run/YC');
str = '../MITgcm/verification/SO6_20190513/diag/';

%% prelim

theta = zeros(384,260,12);
salt = zeros(384,260,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(2190*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,ii) = mean(temp(:,:,12:13),3);
    temp = rdmds(charstate,'rec',2);
    salt(:,:,ii) = mean(temp(:,:,12:13),3);
end

theta = mean(theta,3);
salt = mean(salt,3);

stf610 = zeros(384,260);
stf611 = zeros(384,260);
stf612 = zeros(384,260);

stf610(theta>10) = 1;
stf611(theta>11) = 1;
stf612(theta>12) = 1;

st_front6_x = XC(:,1);
Y = YC(1,:);
st_front6_y = NaN.*ones(384,1);

for ii=1:384
    theta_col = theta(ii,:);
    salt_col = salt(ii,:);
    ind1 = find(theta_col>10);
    ind2 = find(theta_col<12);
    indt = intersect(ind1,ind2);
    ind1 = find(salt_col>34.6);
    ind2 = find(salt_col<35);
    inds = intersect(ind1,ind2);
    clear ind1 ind2
    ind = intersect(indt,inds);
    fprintf('iteration %g  number of indices %g  number of temp indices %g  number of salt indices %g \n',...
        ii,length(ind),length(indt),length(inds))
    if isempty(ind)==0
        st_front6_y(ii) = Y(round(mean(ind)));
    elseif isempty(indt)==0
        st_front6_y(ii) = Y(round(mean(indt)));
    end        
end


XC = rdmds('../MITgcm/verification/SO12_20190513/run/XC');
YC = rdmds('../MITgcm/verification/SO12_20190513/run/YC');
str = '../MITgcm/verification/SO12_20190513/diag/';

%% prelim

theta = zeros(756,512,12);
salt = zeros(756,512,12);

for ii=1:12
    charstate = [str,'diag_state.',num2str(10950*(ii+1),'%010.f')];
    temp = rdmds(charstate,'rec',1);
    theta(:,:,ii) = mean(temp(:,:,24:25),3);
    temp = rdmds(charstate,'rec',2);
    salt(:,:,ii) = mean(temp(:,:,24:25),3);
end

theta = mean(theta,3);
salt = mean(salt,3);

stf1210 = zeros(756,512);
stf1211 = zeros(756,512);
stf1212 = zeros(756,512);

stf1210(theta>10) = 1;
stf1211(theta>11) = 1;
stf1212(theta>12) = 1;

st_front12_x = XC(:,1);
Y = YC(1,:);
st_front12_y = NaN.*ones(756,1);

for ii=1:756
    theta_col = theta(ii,:);
    salt_col = salt(ii,:);
    ind1 = find(theta_col>10);
    ind2 = find(theta_col<12);
    indt = intersect(ind1,ind2);
    ind1 = find(salt_col>34.6);
    ind2 = find(salt_col<35);
    inds = intersect(ind1,ind2);
    clear ind1 ind2
    ind = intersect(indt,inds);
    fprintf('iteration %g  number of indices %g  number of temp indices %g  number of salt indices %g \n',...
        ii,length(ind),length(indt),length(inds))
    if isempty(ind)==0
        st_front12_y(ii) = Y(round(mean(ind)));
    elseif isempty(indt)==0
        st_front12_y(ii) = Y(round(mean(indt)));
    end        
end


save subtropAB st_front*

save subtropABC stf*

toc()