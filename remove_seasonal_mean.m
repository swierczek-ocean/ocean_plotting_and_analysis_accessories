function C = remove_seasonal_mean(A)
%% 90 day running mean
% A must be an array with time as third dimension
% which must be >91
%%

[nx,ny,nz] = size(A);
B = zeros(nx,ny,nz);

for ii=1:nx
    for jj=1:ny
        for kk=31:45
            B(ii,jj,kk) = mean(A(ii,jj,(kk-30):(kk+45)));
        end
        for kk=46:(nz-45)
            B(ii,jj,kk) = mean(A(ii,jj,(kk-45):(kk+45)));
        end
        for kk=(nz-44):(nz-30)
            B(ii,jj,kk) = mean(A(ii,jj,(kk-45):(kk+30)));
        end
    end
end

C = A(:,:,31:(nz-30)) - B(:,:,31:(nz-30));

end

