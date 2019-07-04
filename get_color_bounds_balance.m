function [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(A,B,C,D,option)
%% calculates lower and upper bounds for colorbar
DIST = [A(A<100000);B(B<100000);C(C<100000);D(D<100000)];
DIST = sort(DIST);
len = length(DIST);

%% option
% the option input is a switch that tells the function how to give the
% ranges for the colormap
%%

%% actual range
if option==1
    lb = DIST(1);
    ub = DIST(len);
end
%% 

%% 1st to 99th percentile range
if option==2
    ind1 = ceil(len*0.005);
    DIST2 = DIST(ind1:(len-ind1));
    lb = DIST2(1);
    ub = DIST2(end);
end
%%

%% trim first and last 150 measurements
if option==3
    lb = DIST(150);
    ub = DIST(end-149);    
end
%%

%% looking algorithm #1 (check 1st & 99th percentiles)
if option==4
    range = DIST(len) - DIST(1);
    ind1 = ceil(len*0.01);
    DIST2 = DIST(ind1:(len-ind1));
    len2 = length(DIST2);
    new_range = DIST2(len2) - DIST2(1);
    left_side = DIST2(1) - DIST(1);
    right_side = DIST(len) - DIST2(len2);
    if left_side/new_range>0.1
        lb = 0.9*DIST2(1) + 0.1*DIST(1);
    else
        lb = DIST(1);
    end
    if right_side/new_range>0.1
        ub = 0.9*DIST2(len2) + 0.1*DIST(len);
    else
        ub = DIST(len);
    end
end
%%

%% looking algorithm #2 (find gaps in differences)
if option==5
    diffs = DIST(2:len)-DIST(1:(len-1));
    Ave_Dist = mean(diffs);
    sigma = std(Ave_Dist,0);
    index1 = floor(len*0.02);
    ind_list = find(diffs>(Ave_Dist + 6*sigma));
    index2 = find(ind_list>index1,1)-1;
    index3 = find(ind_list>(len-index1),1)-1;
    if isempty(index2)==0&&isempty(index3)==0
        lb = DIST(ind_list(index2))-Ave_Dist;
        ub = DIST(ind_list(index3))+Ave_Dist;
    elseif isempty(index2)==0&&isempty(index3)==1
        lb = DIST(ind_list(index2))-Ave_Dist;
        ub = DIST(len);
    elseif isempty(index2)==1&&isempty(index3)==0
        lb = DIST(1);
        ub = DIST(ind_list(index3))+Ave_Dist;
    else 
        lb = DIST(1);
        ub = DIST(len);
    end
end
%%

%% trim first 50 measurements
if option==6
    lb = DIST(50); 
    ub = DIST(len);
end
%%

%% trim last 100 measurements
if option==7
    lb = DIST(1); 
    ub = DIST(len-100);
end
%%

%% trim last 75 measurements
if option==8
    lb = DIST(1); 
    ub = DIST(len-75);
end
%%

%% trim last 250 measurements
if option==9
    lb = DIST(1); 
    ub = DIST(len-250);
end
%%

%% trim first 2400 measurements (sflux)
if option==10
    lb = DIST(2400); 
    ub = DIST(len);
end
%%

%% trim first and last 300 measurements
if option==11
    lb = DIST(700);
    ub = DIST(end-150);    
end
%%

%% 1st to 99th percentile range
if option==12
    ind1 = ceil(len*0.006);
    DIST2 = DIST(ind1:(len-ind1));
    lb = DIST2(1);
    ub = DIST2(end);
end
%%


lbcb = lb;
ubcb = ub;

maxb = max([abs(lb),abs(ub)]);
lb = -maxb;
ub = maxb;

range = ub - lb;

if range>12&&range<30
    lb = floor(lb);
    ub = ceil(ub);
    nlvls = ub - lb +1;
elseif range>30&&range<60
    lb = 2*floor(lb/2);
    ub = 2*ceil(ub/2);
    nlvls = (ub - lb)/2 + 1;
elseif range>60&&range<100
    lb = 5*floor(lb/5);
    ub = 5*ceil(ub/5);
    nlvls = (ub - lb)/5 + 1;
elseif range>100&&range<200
    lb = 10*floor(lb/10);
    ub = 10*ceil(ub/10);
    nlvls = (ub - lb)/10 + 1;
elseif range>200&&range<500
    lb = 25*floor(lb/25);
    ub = 25*ceil(ub/25);
    nlvls = (ub - lb)/25 + 1;
elseif range>500&&range<1000
    lb = 50*floor(lb/50);
    ub = 50*ceil(ub/50);
    nlvls = (ub - lb)/50 + 1;
elseif range>6&&range<12
    lb = 0.5*floor(lb*2);
    ub = 0.5*ceil(ub*2);
    nlvls = 2*(ub - lb) + 1;
elseif range>2&&range<6
    lb = 0.25*floor(lb*4);
    ub = 0.25*ceil(ub*4);
    nlvls = 4*(ub - lb) + 1;  
else
    nlvls = 21;
end
   
end



