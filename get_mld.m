function MLD = get_mld(ff, RF, hFacC)
%    Reads:
%          ff       :: 3D array DRHODR 
%          RF       :: Depth of MITgcm cell tops
%          hFacC    :: center partial cell ratio (again, from MITgcm grid)
%    Returns:
%          MLD      :: a 2D array of mld 

  [NX NY NZ] = size(ff);
  [NX2 NY2 NZ2] = size(hFacC);
  if ( (NX ~= NX2) | (NY ~= NY2) | (NZ ~= NZ2))
    %INCOMPATIBLE GRID
    ERROR = 1;
    MLD = nan;
    return
  end
  clear NX2 NY2 NZ2

  % creates dz 
  dz       = RF(2:NZ-1) -  RF(3:NZ);
  invdz = 1./dz; clear dz
  
  % compute MLD:
  MLD     = nan(NX,NY);
  err        = ones(NX,NY);

  % 1. find min(drho/dz)
  ff_min  = min(ff,[],3);
  for iy = 1:NY
    for ix = 1:NX
      tmp   = squeeze(ff(ix,iy,:));
      tmp2  = zeros(1,NZ);
      % 2. check that we have at least 3 grid cells of water & stable strat
      if ( (hFacC(ix,iy,3)>0.) & (ff_min(ix,iy)<0.) )
        % 3. find the index of minimum stratification
        I = find(tmp == ff_min(ix,iy));  % LOCATION OF MAX STRAT
        I = min(I); %FIRST LOC. OF MAX STRAT
        % 4. compute the second derivative (d2rho/dz2)..
        tmp2(3:NZ) = (tmp(2:(NZ-1)) - tmp(3:NZ)).*invdz; % on RC, assume lower RF 
        %if deep enough see strat starts before pynocline
        if I > 3 
          tmp2(I+1:NZ) = 0; %only look up
          J = find(tmp2 == max(tmp2));
          I = min(I, J); %TAKE WHERE STRAT IS FASTEST INCREASING ABOVE PYCNOCLINE
          % 5. Strat should have been increasing (if it doesn't, we are leaving the mld!)
          if ( (tmp2(I)< 0.) & (I==J) ); %error: strat should increase or be flat
            err(ix,iy) = nan; %best for averages as convection may give nan
          end
        end
        MLD(ix,iy) = RF(I);
      end
    end
  end

  MLD = MLD.*err;

  return                





