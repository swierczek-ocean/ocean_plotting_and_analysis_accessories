clear
close all
clc
tic()

load woa_misfits

do_woa_misfit_year3 = NaN.*ones(62,32,57);
do_woa_misfit_year6 = NaN.*ones(62,32,57);
do_woa_misfit_year12 = NaN.*ones(62,32,57);
no3_woa_misfit_year3 = NaN.*ones(62,32,43);
no3_woa_misfit_year6 = NaN.*ones(62,32,43);
no3_woa_misfit_year12 = NaN.*ones(62,32,43);

for ii=1:62
    for jj=1:32
        for kk=1:43
            temp = do_woa_misfit3(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                do_woa_misfit_year3(ii,jj,kk) = temp;
            end
            temp = do_woa_misfit6(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                do_woa_misfit_year6(ii,jj,kk) = temp;
            end
            temp = do_woa_misfit12(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                do_woa_misfit_year12(ii,jj,kk) = temp;
            end
            temp = no3_woa_misfit3(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                no3_woa_misfit_year3(ii,jj,kk) = temp;
            end
            temp = no3_woa_misfit6(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                no3_woa_misfit_year6(ii,jj,kk) = temp;
            end
            temp = no3_woa_misfit12(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                no3_woa_misfit_year12(ii,jj,kk) = temp;
            end
        end
        for kk=44:57
            temp = do_woa_misfit3(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                do_woa_misfit_year3(ii,jj,kk) = temp;
            end
            temp = do_woa_misfit6(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                do_woa_misfit_year6(ii,jj,kk) = temp;
            end
            temp = do_woa_misfit12(ii,jj,kk,:);
            temp = mean(temp(isnan(temp)==0));
            if isnan(temp)==0
                do_woa_misfit_year12(ii,jj,kk) = temp;
            end
        end
    end
end

A = do_woa_misfit_year3;
do_woa_misfit_y3 = [olon(isnan(A)==0),olat(isnan(A)==0),odepth(isnan(A)==0),A(isnan(A)==0)];
A = do_woa_misfit_year6;
do_woa_misfit_y6 = [olon(isnan(A)==0),olat(isnan(A)==0),odepth(isnan(A)==0),A(isnan(A)==0)];
A = do_woa_misfit_year12;
do_woa_misfit_y12 = [olon(isnan(A)==0),olat(isnan(A)==0),odepth(isnan(A)==0),A(isnan(A)==0)];


A = no3_woa_misfit_year3;
no3_woa_misfit_y3 = [nlon(isnan(A)==0),nlat(isnan(A)==0),ndepth(isnan(A)==0),A(isnan(A)==0)];
A = no3_woa_misfit_year6;
no3_woa_misfit_y6 = [nlon(isnan(A)==0),nlat(isnan(A)==0),ndepth(isnan(A)==0),A(isnan(A)==0)];
A = no3_woa_misfit_year12;
no3_woa_misfit_y12 = [nlon(isnan(A)==0),nlat(isnan(A)==0),ndepth(isnan(A)==0),A(isnan(A)==0)];


save woa_misfit_map *misfit_y3 *misfit_y6 *misfit_y12 


tic()