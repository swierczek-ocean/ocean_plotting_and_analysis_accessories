
%% 32

tffield32 = 1;
cfield32 = 3;
drfield32 = 7;
agfield32 = 10;
efield32 = 1;

AGE65_Series32 = zeros(192,132,396);
AGE105_Series32 = zeros(192,132,396);
AGE135_Series32 = zeros(192,132,396);
TFLUX_Series32 = zeros(192,132,396);
CFLUX_Series32 = zeros(192,132,396);
ETAN_Series32 = zeros(192,132,396);
MLD_Series32 = zeros(192,132,396);

HC = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
RF = squeeze(rdmds('../MITgcm/verification/SO3_20190513/run/RF'));
depth32 = 1;
str = '../MITgcm/verification/SO3_20190513/diag/';
strs = '../MITgcm/verification/SO3_20190513/diag_slice/';

for ii=1:396
    char32state = [strs,'diag_state.',num2str(48*ii,'%010.f')];
    temp32state = rdmds(char32state);
    ff = temp32state(:,:,:,drfield32);
    MLD_Series32(:,:,ii) = get_mld(ff,RF,HC);
    clear temp32state
    char32surf = [strs,'diag_surf.',num2str(48*ii,'%010.f')];
    temp32surf = rdmds(char32surf); 
    ETAN_Series32(:,:,ii) = temp32surf(:,:,efield32); 
    clear temp32surf
    char32bgc = [strs,'diag_bgc.',num2str(48*ii,'%010.f')];
    temp32bgc = rdmds(char32bgc);
    AGE65_Series32(:,:,ii) = temp32bgc(:,:,9,agfield32);
    AGE105_Series32(:,:,ii) = temp32bgc(:,:,13,agfield32);
    AGE135_Series32(:,:,ii) = temp32bgc(:,:,16,agfield32);
    clear temp32bgc
    char32as = [strs,'diag_airsea.',num2str(48*ii,'%010.f')];
    temp32as = rdmds(char32as);
    TFLUX_Series32(:,:,ii) = temp32as(:,:,tffield32);
    CFLUX_Series32(:,:,ii) = temp32as(:,:,cfield32);
    clear temp32as
end


parfor ii=1:192
    for jj=1:132
        if (HC(ii,jj,1)==0)
            ETAN_Series32(ii,jj,:) = NaN;
            MLD_Series32(ii,jj,:) = NaN;
            TFLUX_Series32(ii,jj,:) = NaN;
            CFLUX_Series32(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,13)==0)
            AGE105_Series32(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,16)==0)
            AGE135_Series32(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,9)==0)
            AGE65_Series32(ii,jj,:) = NaN;
        end
    end
end

save ETAN_Series32 ETAN*
save AGE_Series32 AGE*
save SURFFLX_32 CFLUX* TFLUX*
save MLD_Series32 MLD*

fprintf('finished 32 \n')

%% end 32


