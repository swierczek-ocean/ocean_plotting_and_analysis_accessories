clear
close all
clc
run acc_colors.m

x = dir('*.txt');
numfiles = 1;

for ii=1:numfiles
    X= [];
    fileID = fopen(x(ii).name);
    A = textscan(fileID,'%f %f %f','Delimiter','\t','EndOfLine','\r\n','HeaderLines',1);
    n = size(A{1},1);
    X = [X;[A{1}(1:n),A{2}(1:n),A{3}(1:n)]];

    m = size(X,1);
    Y = zeros(m,2);
    
for jj=1:m
   if X(jj,2)<10
       Y(jj,1) = str2double(strcat(num2str(X(jj,1)),'0',num2str(X(jj,2))));
   else
       Y(jj,1) = str2double(strcat(num2str(X(jj,1)),num2str(X(jj,2))));
   end
end


Y(:,2) = X(:,3);

months = unique(Y(:,1));
num_months = size(months,1);    % number of unique months

T = zeros(num_months,2);        % make empty array where you will put averages, size is total # of unique months
dates = zeros(num_months,1);

T(:,1) = months;
%% convert dates to datenum format

for kk=1:num_months
    dates(kk) = datenum(num2str(months(kk)),'yyyymm');    
end

for lll=1:m
    Y(lll,1) = datenum(num2str(Y(lll,1)),'yyyymm');
end


    ll = n-6;
    
    x_diff = [];
    
    Z = Y(:,2);
    R = Y(:,1);
    x_months = R(7:n);
    
    for ii= [7:ll]
    x_diff(ii) = Z(ii+6) - Z(ii-6);
    end
    
    x_diff_sm = [];
    x_diff_sm(1)=NaN;for m=2:length(x_diff)-1;x_diff_sm(m)=mean(x_diff(m-1:m+1));end;x_diff_sm(length(x_diff))=NaN;
    %plot(x_months,x_diff_sm)
    plot(x_months,x_diff_sm,'Color',[0.7,0.7,0.7])
    hold on
    fclose(fileID);
  end

