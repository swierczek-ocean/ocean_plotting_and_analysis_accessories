
%% 122

DO_Series122 = zeros(756,512,79,12);
NO3_Series122 = zeros(756,512,68,12);
HC12 = rdmds('../MITgcm/verification/SO12_20190513/run/hFacC');
depth122 = 1;
str = '../MITgcm/verification/SO12_20190513/diag/';

for ii=2:13
    char122bgc = [str,'diag_bgc.',num2str(10950*ii,'%010.f')];
    temp122bgc = rdmds(char122bgc); 
    DO_Series122(:,:,:,ii-1) = temp122bgc(:,:,1:79,3); 
    NO3_Series122(:,:,:,ii-1) = temp122bgc(:,:,1:68,4);
    clear temp122bgc
end

for jj=1:756
    for kk=1:512
        for ii=1:68
            if HC12(jj,kk,ii)==0
                DO_Series122(jj,kk,ii) = NaN;
                NO3_Series122(jj,kk,ii) = NaN;
            end
        end
        for ii=69:79
            if HC12(jj,kk,ii)==0
                DO_Series122(jj,kk,ii) = NaN;
            end
        end
    end
end

%% 62

DO_Series62 = zeros(384,260,40,12);
NO3_Series62 = zeros(384,260,34,12);
HC6 = rdmds('../MITgcm/verification/SO6_20190513/run/hFacC');
depth62 = 1;
str = '../MITgcm/verification/SO6_20190513/diag/';

for ii=2:13
    char62bgc = [str,'diag_bgc.',num2str(2190*ii,'%010.f')];
    temp62bgc = rdmds(char62bgc); 
    DO_Series62(:,:,:,ii-1) = temp62bgc(:,:,1:40,3); 
    NO3_Series62(:,:,:,ii-1) = temp62bgc(:,:,1:34,4); 
    clear temp62bgc
end

for jj=1:384
    for kk=1:260
        for ii=1:34
            if HC6(jj,kk,ii)==0
                DO_Series62(jj,kk,ii) = NaN;
                NO3_Series62(jj,kk,ii) = NaN;
            end
        end
        for ii=35:40
            if HC6(jj,kk,ii)==0
                DO_Series62(jj,kk,ii) = NaN;
            end
        end       
    end
end

%% 32

DO_Series32 = zeros(192,132,40,12);
NO3_Series32 = zeros(192,132,34,12);
HC3 = rdmds('../MITgcm/verification/SO3_20190513/run/hFacC');
depth32 = 1;
str = '../MITgcm/verification/SO3_20190513/diag/';

for ii=2:13
    char32bgc = [str,'diag_bgc.',num2str(1460*ii,'%010.f')];
    temp32bgc = rdmds(char32bgc); 
    DO_Series32(:,:,:,ii-1) = temp32bgc(:,:,1:40,3); 
    NO3_Series32(:,:,:,ii-1) = temp32bgc(:,:,1:34,4);
    clear temp32bgc
end

for jj=1:192
    for kk=1:132
        for ii=1:34
            if HC3(jj,kk,ii)==0
                DO_Series32(jj,kk,ii) = NaN;
                NO3_Series32(jj,kk,ii) = NaN;
            end
        end
        for ii=35:40
            if HC3(jj,kk,ii)==0
                DO_Series32(jj,kk,ii) = NaN;
            end
        end         
    end
end


clearvars -except DO* NO3*

save DO_monthly_f DO*
save NO3_monthly_f NO3*

