clear
close all
clc

tic()

theta_ooia_122 = zeros(105,9491);
theta_ooib_122 = zeros(105,9491);
theta_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',10);
theta_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  theta_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',117);
theta_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  theta_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',224);
theta_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  theta_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except theta*

save THETA_OOI_122

salt_ooia_122 = zeros(105,9491);
salt_ooib_122 = zeros(105,9491);
salt_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',332);
salt_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  salt_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',439);
salt_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  salt_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',546);
salt_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  salt_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except salt*

save SALT_OOI_122

uvel_ooia_122 = zeros(105,9491);
uvel_ooib_122 = zeros(105,9491);
uvel_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',654);
uvel_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  uvel_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',761);
uvel_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  uvel_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',868);
uvel_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  uvel_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except vvel*

save UVEL_OOI_122

vvel_ooia_122 = zeros(105,9491);
vvel_ooib_122 = zeros(105,9491);
vvel_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',976);
vvel_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  vvel_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1083);
vvel_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  vvel_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1190);
vvel_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  vvel_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except vvel*

save VVEL_OOI_122

wvel_ooia_122 = zeros(105,9491);
wvel_ooib_122 = zeros(105,9491);
wvel_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1298);
wvel_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  wvel_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1405);
wvel_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  wvel_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1512);
wvel_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  wvel_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except wvel*

save WVEL_OOI_122

phihyd_ooia_122 = zeros(105,9491);
phihyd_ooib_122 = zeros(105,9491);
phihyd_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1620);
phihyd_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  phihyd_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1727);
phihyd_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  phihyd_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1834);
phihyd_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  phihyd_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except phihyd*

save PHIHYD_OOI_122


drhodr_ooia_122 = zeros(105,9491);
drhodr_ooib_122 = zeros(105,9491);
drhodr_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1942);
drhodr_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  drhodr_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2049);
drhodr_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  drhodr_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2156);
drhodr_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:2150
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  drhodr_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except drhodr*

save DRHODR_OOI_122







toc()