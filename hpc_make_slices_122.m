
%% 122

tffield122 = 1;
cfield122 = 3;
drfield122 = 7;
agfield122 = 10;
efield122 = 1;

AGE65_Series122 = zeros(756,512,396);
AGE105_Series122 = zeros(756,512,396);
AGE135_Series122 = zeros(756,512,396);
TFLUX_Series122 = zeros(756,512,396);
CFLUX_Series122 = zeros(756,512,396);
ETAN_Series122 = zeros(756,512,396);
MLD_Series122 = zeros(756,512,396);

HC = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
RF = squeeze(rdmds('../MITgcm/verification/SO12_20190513/run/RF'));
depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag/';
strs = '../MITgcm/verification/SO12_20190513/diag_slice/';

for ii=1:396
    char122state = [strs,'diag_state.',num2str(360*ii,'%010.f')];
    temp122state = rdmds(char122state);
    ff = temp122state(:,:,:,drfield122);
    MLD_Series122(:,:,ii) = get_mld(ff,RF,HC);
    clear temp122state
    char122surf = [strs,'diag_surf.',num2str(360*ii,'%010.f')];
    temp122surf = rdmds(char122surf); 
    ETAN_Series122(:,:,ii) = temp122surf(:,:,efield122); 
    clear temp122surf
    char122bgc = [strs,'diag_bgc.',num2str(360*ii,'%010.f')];
    temp122bgc = rdmds(char122bgc);
    AGE65_Series122(:,:,ii) = temp122bgc(:,:,18,agfield122);
    AGE105_Series122(:,:,ii) = temp122bgc(:,:,26,agfield122);
    AGE135_Series122(:,:,ii) = temp122bgc(:,:,32,agfield122);
    clear temp122bgc
    char122as = [strs,'diag_airsea.',num2str(360*ii,'%010.f')];
    temp122as = rdmds(char122as);
    TFLUX_Series122(:,:,ii) = temp122as(:,:,tffield122);
    CFLUX_Series122(:,:,ii) = temp122as(:,:,cfield122);
    clear temp122as
end

parfor ii=1:756
    for jj=1:512
        if (HC(ii,jj,1)==0)
            ETAN_Series122(ii,jj,:) = NaN;
            MLD_Series122(ii,jj,:) = NaN;
            TFLUX_Series122(ii,jj,:) = NaN;
            CFLUX_Series122(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,26)==0)
            AGE105_Series122(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,32)==0)
            AGE135_Series122(ii,jj,:) = NaN;
        end
        if (HC(ii,jj,18)==0)
            AGE65_Series122(ii,jj,:) = NaN;
        end
    end
end

save ETAN_Series122 ETAN*
save AGE_Series122 AGE*
save SURFFLX_122 CFLUX* TFLUX*
save MLD_Series122 MLD*

fprintf('finished 122 \n')

%% end 122


