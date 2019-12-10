
%% 62

tffield62 = 1;
cfield62 = 3;
drfield62 = 7;
agfield62 = 10;

AGE65_Series62 = zeros(384,260,396);
AGE105_Series62 = zeros(384,260,396);
AGE135_Series62 = zeros(384,260,396);
TFLUX_Series62 = zeros(384,260,396);
CFLUX_Series62 = zeros(384,260,396);
ETAN_Series62 = zeros(384,260,396);
MLD_Series62 = zeros(384,260,396);

HC = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
RF = rdmds('../MITgcm/verification/SO6_20190513/run/RF');
depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag/';
strs = '../MITgcm/verification/SO6_20190513/diag_slice/';

for ii=1:396
    char62state = [strs,'diag_state.',num2str(72*ii,'%010.f')];
    temp62state = rdmds(char62state);
    ff = temp62state(:,:,:,drfield62);
    MLD_Series62(:,:,ii) = get_mld(ff,RF,HC);
    clear temp62state
    char62surf = [strs,'diag_surf.',num2str(72*ii,'%010.f')];
    temp62surf = rdmds(char62surf); 
    ETAN_Series62(:,:,ii) = temp62surf(:,:,efield62); 
    clear temp62surf
    char62bgc = [strs,'diag_bgc.',num2str(72*ii,'%010.f')];
    temp62bgc = rdmds(char62bgc);
    AGE65_Series62(:,:,ii) = temp62bgc(:,:,9,agfield62);
    AGE105_Series62(:,:,ii) = temp62bgc(:,:,13,agfield62);
    AGE135_Series62(:,:,ii) = temp62bgc(:,:,16,agfield62);
    clear temp62bgc
    char62as = [strs,'diag_airsea.',num2str(72*ii,'%010.f')];
    temp62as = rdmds(char62as);
    TFLUX_Series62(:,:,ii) = temp62surf(:,:,tffield62);
    CFLUX_Series62(:,:,ii) = temp62surf(:,:,cfield62);
    clear temp62as
end

parfor ii=1:192
    for jj=1:162
        if (HC(ii,jj,1)==0)
            ETAN_Series62(ii,jj,:) = NaN;
            MLD_Series62(ii,jj,:) = NaN;
            TFLUX_Series62(ii,jj,:) = NaN;
            CFLUX_Series62(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,13)==0)
            AGE105_Series62(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,16)==0)
            AGE135_Series62(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,9)==0)
            AGE65_Series62(ii,jj,:) = NaN;
        end
    end
end

save ETAN_Series62 ETAN*
save AGE_Series62 AGE*
save SURFFLX_62 CFLUX* TFLUX*
save MLD_Series62 MLD*

fprintf('finished 62 \n')

%% end 62


