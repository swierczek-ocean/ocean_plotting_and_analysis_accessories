clear
close all
clc
tic()

z52 = [9,13,20,23];
z104 = [17,25,39,45];
lvls = [3,6];
str3 = '../MITgcm/verification/SO3_20190513/diag/';
str6 = '../MITgcm/verification/SO6_20190513/diag/';
str12 = '../MITgcm/verification/SO12_20190513/diag/';
strb3 = '../MITgcm/verification/SO3_20190513/diag_budgets/';
strb6 = '../MITgcm/verification/SO6_20190513/diag_budgets/';
strb12 = '../MITgcm/verification/SO12_20190513/diag_budgets/';
HC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
HC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
HC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');

RAC3 = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RAC'));
RAC6 = squeeze(rdmds('../MITgcm/verification/SO6_20190513/run/RAC'));
RAC12 = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RAC'));

RAC3 = RAC3.*ones(192,132,4);
RAC6 = RAC6.*ones(384,260,4);
RAC12 = RAC12.*ones(756,512,4);

for ii=1:192
    for jj=1:132
        for kk=1:4
            if HC3(ii,jj,z52(kk))==0
                RAC3(ii,jj,kk) = NaN;
            end
        end
    end
end

for ii=1:384
    for jj=1:260
        for kk=1:4
            if HC6(ii,jj,z52(kk))==0
                RAC6(ii,jj,kk) = NaN;
            end
        end
    end
end

for ii=1:756
    for jj=1:512
        for kk=1:4
            if HC12(ii,jj,z104(kk))==0
                RAC12(ii,jj,kk) = NaN;
            end
        end
    end
end

str = '60m,100m,190m,250m';

vert_wvel_3 = zeros(192,132,4,12);
vert_wvel_6 = zeros(384,260,4,12);
vert_wvel_12 = zeros(756,512,4,12);

for t=1:12
    charwvel = [str3,'diag_state.',num2str(1460*(t+1),'%010.f')];
    temp1 = rdmds(charwvel,'rec',5);
    vert_wvel_3(:,:,:,t) = temp1(:,:,z52);
    clear temp
    charwvel = [str6,'diag_state.',num2str(2190*(t+1),'%010.f')];
    temp1 = rdmds(charwvel,'rec',5);
    vert_wvel_6(:,:,:,t) = temp1(:,:,z52);
    clear temp
    charwvel = [str12,'diag_state.',num2str(10950*(t+1),'%010.f')];
    temp1 = rdmds(charwvel,'rec',5);
    vert_wvel_12(:,:,:,t) = temp1(:,:,z104);
    clear temp
end % for t

cp_oce = 3994; % J/(kg deg C)
rho = 1035; % kg/m^3
vert_heat_adv_3 = zeros(192,132,4,12);
vert_heat_adv_6 = zeros(384,260,4,12);
vert_heat_adv_12 = zeros(756,512,4,12);

for t=1:12
    charheat = [strb3,'diag_T_budget.',num2str(1460*(t+1),'%010.f')];
    temp1 = rdmds(charheat,'rec',lvls(1));
    temp2 = rdmds(charheat,'rec',lvls(2));
    temp1 = cp_oce*rho.*temp1(:,:,z52)./RAC3;
    temp2 = cp_oce*rho.*temp2(:,:,z52)./RAC3;
    vert_heat_adv_3(:,:,:,t) = temp1 + temp2;
    clear temp
    charheat = [strb6,'diag_T_budget.',num2str(2190*(t+1),'%010.f')];
    temp1 = rdmds(charheat,'rec',lvls(1));
    temp2 = rdmds(charheat,'rec',lvls(2));
    temp1 = cp_oce*rho.*temp1(:,:,z52)./RAC6;
    temp2 = cp_oce*rho.*temp2(:,:,z52)./RAC6;
    vert_heat_adv_6(:,:,:,t) = temp1 + temp2;
    clear temp
    charheat = [strb12,'diag_T_budget.',num2str(10950*(t+1),'%010.f')];
    temp1 = rdmds(charheat,'rec',lvls(1));
    temp2 = rdmds(charheat,'rec',lvls(2));
    temp1 = cp_oce*rho.*temp1(:,:,z104)./RAC12;
    temp2 = cp_oce*rho.*temp2(:,:,z104)./RAC12;
    vert_heat_adv_12(:,:,:,t) = temp1 + temp2;
    clear temp
end % for t

vert_salt_adv_3 = zeros(192,132,4,12);
vert_salt_adv_6 = zeros(384,260,4,12);
vert_salt_adv_12 = zeros(756,512,4,12);

for t=1:12
    charsalt = [strb3,'diag_S_budget.',num2str(1460*(t+1),'%010.f')];
    temp1 = rdmds(charsalt,'rec',lvls(1));
    temp2 = rdmds(charsalt,'rec',lvls(2));
    temp1 = rho.*temp1(:,:,z52)./RAC3;
    temp2 = rho.*temp2(:,:,z52)./RAC3;
    vert_salt_adv_3(:,:,:,t) = temp1 + temp2;
    clear temp
    charsalt = [strb6,'diag_S_budget.',num2str(2190*(t+1),'%010.f')];
    temp1 = rdmds(charsalt,'rec',lvls(1));
    temp2 = rdmds(charsalt,'rec',lvls(2));
    temp1 = rho.*temp1(:,:,z52)./RAC6;
    temp2 = rho.*temp2(:,:,z52)./RAC6;
    vert_salt_adv_6(:,:,:,t) = temp1 + temp2;
    clear temp
    charsalt = [strb12,'diag_S_budget.',num2str(10950*(t+1),'%010.f')];
    temp1 = rdmds(charsalt,'rec',lvls(1));
    temp2 = rdmds(charsalt,'rec',lvls(2));
    temp1 = rho.*temp1(:,:,z104)./RAC12;
    temp2 = rho.*temp2(:,:,z104)./RAC12;
    vert_salt_adv_12(:,:,:,t) = temp1 + temp2;
    clear temp
end % for t

ty = 31536000/1000;
vert_carbon_adv_3 = zeros(192,132,4,12);
vert_carbon_adv_6 = zeros(384,260,4,12);
vert_carbon_adv_12 = zeros(756,512,4,12);

for t=1:12
    charcarbon = [strb3,'diag_dic_budget.',num2str(1460*(t+1),'%010.f')];
    temp1 = rdmds(charcarbon,'rec',lvls(1));
    temp2 = rdmds(charcarbon,'rec',lvls(2));
    temp1 = ty*12.0107.*temp1(:,:,z52)./RAC3;
    temp2 = ty*12.0107.*temp2(:,:,z52)./RAC3;
    vert_carbon_adv_3(:,:,:,t) = temp1 + temp2;
    clear temp
    charcarbon = [strb6,'diag_dic_budget.',num2str(2190*(t+1),'%010.f')];
    temp1 = rdmds(charcarbon,'rec',lvls(1));
    temp2 = rdmds(charcarbon,'rec',lvls(2));
    temp1 = ty*12.0107.*temp1(:,:,z52)./RAC6;
    temp2 = ty*12.0107.*temp2(:,:,z52)./RAC6;
    vert_carbon_adv_6(:,:,:,t) = temp1 + temp2;
    clear temp
    charcarbon = [strb12,'diag_dic_budget.',num2str(10950*(t+1),'%010.f')];
    temp1 = rdmds(charcarbon,'rec',lvls(1));
    temp2 = rdmds(charcarbon,'rec',lvls(2));
    temp1 = ty*12.0107.*temp1(:,:,z104)./RAC12;
    temp2 = ty*12.0107.*temp2(:,:,z104)./RAC12;
    vert_carbon_adv_12(:,:,:,t) = temp1 + temp2;
    clear temp
end % for t

vert_oxygen_adv_3 = zeros(192,132,4,12);
vert_oxygen_adv_6 = zeros(384,260,4,12);
vert_oxygen_adv_12 = zeros(756,512,4,12);

for t=1:12
    charoxygen = [strb3,'diag_o2_budget.',num2str(1460*(t+1),'%010.f')];
    temp1 = rdmds(charoxygen,'rec',lvls(1));
    temp2 = rdmds(charoxygen,'rec',lvls(2));
    temp1 = ty*15.9994.*temp1(:,:,z52)./RAC3;
    temp2 = ty*15.9994.*temp2(:,:,z52)./RAC3;
    vert_oxygen_adv_3(:,:,:,t) = temp1 + temp2;
    clear temp
    charoxygen = [strb6,'diag_o2_budget.',num2str(2190*(t+1),'%010.f')];
    temp1 = rdmds(charoxygen,'rec',lvls(1));
    temp2 = rdmds(charoxygen,'rec',lvls(2));
    temp1 = ty*15.9994.*temp1(:,:,z52)./RAC6;
    temp2 = ty*15.9994.*temp2(:,:,z52)./RAC6;
    vert_oxygen_adv_6(:,:,:,t) = temp1 + temp2;
    clear temp
    charoxygen = [strb12,'diag_o2_budget.',num2str(10950*(t+1),'%010.f')];
    temp1 = rdmds(charoxygen,'rec',lvls(1));
    temp2 = rdmds(charoxygen,'rec',lvls(2));
    temp1 = ty*15.9994.*temp1(:,:,z104)./RAC12;
    temp2 = ty*15.9994.*temp2(:,:,z104)./RAC12;
    vert_oxygen_adv_12(:,:,:,t) = temp1 + temp2;
    clear temp
end % for t


vert_nitrate_adv_3 = zeros(192,132,4,12);
vert_nitrate_adv_6 = zeros(384,260,4,12);
vert_nitrate_adv_12 = zeros(756,512,4,12);

for t=1:12
    charnitrate = [strb3,'diag_no3_budget.',num2str(1460*(t+1),'%010.f')];
    temp1 = rdmds(charnitrate,'rec',lvls(1));
    temp2 = rdmds(charnitrate,'rec',lvls(2));
    temp1 = ty*14.0067.*temp1(:,:,z52)./RAC3;
    temp2 = ty*14.0067.*temp2(:,:,z52)./RAC3;
    vert_nitrate_adv_3(:,:,:,t) = temp1 + temp2;
    clear temp
    charnitrate = [strb6,'diag_no3_budget.',num2str(2190*(t+1),'%010.f')];
    temp1 = rdmds(charnitrate,'rec',lvls(1));
    temp2 = rdmds(charnitrate,'rec',lvls(2));
    temp1 = ty*14.0067.*temp1(:,:,z52)./RAC6;
    temp2 = ty*14.0067.*temp2(:,:,z52)./RAC6;
    vert_nitrate_adv_6(:,:,:,t) = temp1 + temp2;
    clear temp
    charnitrate = [strb12,'diag_no3_budget.',num2str(10950*(t+1),'%010.f')];
    temp1 = rdmds(charnitrate,'rec',lvls(1));
    temp2 = rdmds(charnitrate,'rec',lvls(2));
    temp1 = ty*14.0067.*temp1(:,:,z104)./RAC12;
    temp2 = ty*14.0067.*temp2(:,:,z104)./RAC12;
    vert_nitrate_adv_12(:,:,:,t) = temp1 + temp2;
    clear temp
end % for t


for ii=1:192
    for jj=1:132
        for kk=1:4
            if HC3(ii,jj,z52(kk))==0
                vert_wvel_3(ii,jj,kk,:) = NaN;
                vert_heat_adv_3(ii,jj,kk,:) = NaN;
                vert_salt_adv_3(ii,jj,kk,:) = NaN;
                vert_carbon_adv_3(ii,jj,kk,:) = NaN;
                vert_oxygen_adv_3(ii,jj,kk,:) = NaN;
                vert_nitrate_adv_3(ii,jj,kk,:) = NaN;
            end
        end
    end
end

for ii=1:384
    for jj=1:260
        for kk=1:4
            if HC6(ii,jj,z52(kk))==0
                vert_wvel_6(ii,jj,kk,:) = NaN;
                vert_heat_adv_6(ii,jj,kk,:) = NaN;
                vert_salt_adv_6(ii,jj,kk,:) = NaN;
                vert_carbon_adv_6(ii,jj,kk,:) = NaN;
                vert_oxygen_adv_6(ii,jj,kk,:) = NaN;
                vert_nitrate_adv_6(ii,jj,kk,:) = NaN;
            end
        end
    end
end

for ii=1:756
    for jj=1:512
        for kk=1:4
            if HC12(ii,jj,z104(kk))==0
                vert_wvel_12(ii,jj,kk,:) = NaN;
                vert_heat_adv_12(ii,jj,kk,:) = NaN;
                vert_salt_adv_12(ii,jj,kk,:) = NaN;
                vert_carbon_adv_12(ii,jj,kk,:) = NaN;
                vert_oxygen_adv_12(ii,jj,kk,:) = NaN;
                vert_nitrate_adv_12(ii,jj,kk,:) = NaN;
            end
        end
    end
end

save HEAT_BUDGETS vert_heat* str
save SALT_BUDGETS vert_salt* str
save WVEL_BUDGETS vert_wvel* str
save CARBON_BUDGETS vert_carbon* str
save OXYGEN_BUDGETS vert_oxygen* str
save NITRATE_BUDGETS vert_nitrate* str




toc()