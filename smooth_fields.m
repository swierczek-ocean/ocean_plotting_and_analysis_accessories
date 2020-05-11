clear
close all
clc
tic()

%%
load ODA XCt YCt XGt YGt 

load ../2020_03_March_analysis/theta3
load ../2020_03_March_analysis/theta6
load ../2020_03_March_analysis/theta12
clear theta*sd
load ../2020_03_March_analysis/wvel3
load ../2020_03_March_analysis/wvel6
load ../2020_03_March_analysis/wvel12
clear wvel*sd
load MLD_mean

clear RC6 RC12 RF6 RF12 

XC3 = XC3(:,1);
XC6 = XC6(:,1);
XC12 = XC12(:,1);

YC3 = YC3(1,:);
YC6 = YC6(1,:);
YC12 = YC12(1,:);

wvel3int = NaN.*ones(70,40,52);
wvel6int = NaN.*ones(70,40,52);
wvel12int = NaN.*ones(70,40,52);

theta3int = NaN.*ones(70,40,52);
theta6int = NaN.*ones(70,40,52);
theta12int = NaN.*ones(70,40,52);

mld3int = NaN.*ones(70,40);
mld6int = NaN.*ones(70,40);
mld12int = NaN.*ones(70,40);


for ii=1:70
    for jj=1:40
        fprintf('ii = %g  jj = %g \n',ii,jj)
        for kk=1:52
            ind1 = find(XC3>XGt(ii));
            ind2 = find(XC3<XGt(ii+1));
            ind3 = find(YC3>YGt(jj));
            ind4 = find(YC3<YGt(jj+1));
            ind5 = intersect(ind1,ind2);
            ind6 = intersect(ind3,ind4);
            if isempty(ind5)==0 && isempty(ind6)==0
                tempt = theta3(ind5,ind6,kk);
                tempt = tempt(isnan(tempt)==0);
                if isempty(tempt)==0
                    tempw = wvel3(ind5,ind6,kk);
                    tempw = tempw(isnan(tempw)==0);
                    wvel3int(ii,jj,kk) = mean(tempw);
                    theta3int(ii,jj,kk) = mean(tempt);
                    if kk==1
                        tempm = mld3(ind5,ind6);
                        tempm = tempm(isnan(tempm)==0);
                        mld3int(ii,jj) = mean(tempm);
                    end
                end
            end
            ind1 = find(XC6>XGt(ii));
            ind2 = find(XC6<XGt(ii+1));
            ind3 = find(YC6>YGt(jj));
            ind4 = find(YC6<YGt(jj+1));
            ind5 = intersect(ind1,ind2);
            ind6 = intersect(ind3,ind4);
            if isempty(ind5)==0 && isempty(ind6)==0
                tempt = theta6(ind5,ind6,kk);
                tempt = tempt(isnan(tempt)==0);
                if isempty(tempt)==0
                    tempw = wvel6(ind5,ind6,kk);
                    tempw = tempw(isnan(tempw)==0);
                    wvel6int(ii,jj,kk) = mean(tempw);
                    theta6int(ii,jj,kk) = mean(tempt);
                    if kk==1
                        tempm = mld6(ind5,ind6);
                        tempm = tempm(isnan(tempm)==0);
                        mld6int(ii,jj) = mean(tempm);
                    end
                end
            end
            ind1 = find(XC12>XGt(ii));
            ind2 = find(XC12<XGt(ii+1));
            ind3 = find(YC12>YGt(jj));
            ind4 = find(YC12<YGt(jj+1));
            ind5 = intersect(ind1,ind2);
            ind6 = intersect(ind3,ind4);
            if isempty(ind5)==0 && isempty(ind6)==0
                tempt = theta12(ind5,ind6,kk);
                tempt = tempt(isnan(tempt)==0);
                if isempty(tempt)==0
                    tempw = wvel12(ind5,ind6,kk);
                    tempw = tempw(isnan(tempw)==0);
                    wvel12int(ii,jj,kk) = mean(tempw);
                    theta12int(ii,jj,kk) = mean(tempt);
                    if kk==1
                        tempm = mld12(ind5,ind6);
                        tempm = tempm(isnan(tempm)==0);
                        mld12int(ii,jj) = mean(tempm);
                    end
                end
            end
        end
    end
end

clear mld3 mld6 mld12 theta3 theta6 theta12 wvel3 wvel6 wvel12
save smooth_fields mld* theta* wvel* XCt YCt RC3 RF3




toc()