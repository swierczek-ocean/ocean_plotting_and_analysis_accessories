for jj=1:365
    if jj<91
        ind = 1;
    elseif jj<182
        ind = 2;
    elseif jj<274
        ind = 3;
    else
        ind = 4;
    end
    fprintf('iteration %g  ind = %g \n',jj,ind);
end