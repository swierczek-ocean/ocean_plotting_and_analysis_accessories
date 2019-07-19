function [lb,ub] = get_color_bounds_s(X,option)
len = numel(X);
if isvector(X)==0
    X = reshape(X,[len,1]);
end
X = sort(X);

%% 1st to 99th percentile range
if option==1
    ind1 = ceil(len*0.006);
    X = X(ind1:(len-ind1));
    lb = X(1);
    ub = X(end);
end
%%

%% 1st to 99th percentile range
if option==2
    ind1 = ceil(len*0.01);
    X = X(ind1:(len-ind1));
    lb = X(1);
    ub = X(end);
end
%%

%% 1st to 99th percentile range
if option==3
    ind1 = ceil(len*0.008);
    X = X(ind1:(len-ind1));
    lb = X(1);
    ub = X(end);
end
%%

%% 1st to 99th percentile range
if option==4
    ind1 = ceil(len*0.003);
    X = X(ind1:(len-ind1));
    lb = X(1);
    ub = X(end);
end
%%

%% trim first and last 150 measurements
if option==5
    lb = X(50);
    ub = X(end-49);    
end
%%

%% trim first and last 150 measurements
if option==6
    lb = X(100);
    ub = X(end-99);    
end
%%

%% trim first and last 150 measurements
if option==7
    lb = X(150);
    ub = X(end-149);    
end
%%

%% 1st to 99th percentile range
if option==8
    ind1 = ceil(len*0.03);
    X = X(ind1:(len-ind1));
    lb = X(1);
    ub = X(end);
end
%%

%% 1st to 99th percentile range
if option==9
    ind1 = ceil(len*0.015);
    X = X(ind1:(len-ind1));
    lb = X(1);
    ub = X(end);
end
%%
   
end

