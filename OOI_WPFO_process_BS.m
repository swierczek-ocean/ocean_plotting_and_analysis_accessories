
X = poissrnd(9,20,3);
X = sortrows(X,1)

A = X(:,1);
B = X(:,2);
C = X(:,3);

ind1 = find(A<10);
ind2 = find(A(ind1)>7);

ind3 = intersect(ind1,ind2)
temp = X(ind3,:)
ind4 = find(temp(:,2)>10)
ind5 = find(temp(:,2)<14)
ind6 = intersect(ind4,ind5)

mean(temp(ind6,3))