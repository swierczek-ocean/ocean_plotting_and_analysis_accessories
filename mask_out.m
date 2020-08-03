clear
close all
clc
tic()

acc_settings

%%
load eddy_TSCO12_190m
load eddy_TSCO6_190m
load eddy_TSCO3_190m
H3 = rdmds('../Grids/3/hFacC');
H3 = H3(:,:,20);
H6 = rdmds('../Grids/6/hFacC');
H6 = H6(:,:,20);
H12 = rdmds('../Grids/12/hFacC');
H12 = H12(:,:,39);


for ii=1:756
    for jj=1:512
        if H12(ii,jj)==0
            edic12(ii,jj) = NaN;
            edo12(ii,jj) = NaN;
            esalt12(ii,jj) = NaN;
            etheta12(ii,jj) = NaN;
            wdic12(ii,jj) = NaN;
            wdo12(ii,jj) = NaN;
            wsalt12(ii,jj) = NaN;
            wtheta12(ii,jj) = NaN;
            mwdic12(ii,jj) = NaN;
            mwdo12(ii,jj) = NaN;
            mwsalt12(ii,jj) = NaN;
            mwtheta12(ii,jj) = NaN;
        end
    end
end

for ii=1:384
    for jj=1:260
        if H6(ii,jj)==0
            edic6(ii,jj) = NaN;
            edo6(ii,jj) = NaN;
            esalt6(ii,jj) = NaN;
            etheta6(ii,jj) = NaN;
            wdic6(ii,jj) = NaN;
            wdo6(ii,jj) = NaN;
            wsalt6(ii,jj) = NaN;
            wtheta6(ii,jj) = NaN;
            mwdic6(ii,jj) = NaN;
            mwdo6(ii,jj) = NaN;
            mwsalt6(ii,jj) = NaN;
            mwtheta6(ii,jj) = NaN;
        end
    end
end

for ii=1:192
    for jj=1:132
        if H3(ii,jj)==0
            edic3(ii,jj) = NaN;
            edo3(ii,jj) = NaN;
            esalt3(ii,jj) = NaN;
            etheta3(ii,jj) = NaN;
            wdic3(ii,jj) = NaN;
            wdo3(ii,jj) = NaN;
            wsalt3(ii,jj) = NaN;
            wtheta3(ii,jj) = NaN;
            mwdic3(ii,jj) = NaN;
            mwdo3(ii,jj) = NaN;
            mwsalt3(ii,jj) = NaN;
            mwtheta3(ii,jj) = NaN;
        end
    end
end

save eddy_TSCO3_190m *theta3 *salt3 *dic3 *do3 XC3 YC3
save eddy_TSCO6_190m *theta6 *salt6 *dic6 *do6 XC6 YC6
save eddy_TSCO12_190m *theta12 *salt12 *dic12 *do12 XC12 YC12



toc()