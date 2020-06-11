function error = rmse(vec)
nn = length(vec);
error = sqrt(sum(vec.^2))/sqrt(nn);
end

