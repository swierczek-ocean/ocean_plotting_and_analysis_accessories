clear
close all
clc

tic()

theta_ooia_62 = zeros(53,9491);
theta_ooib_62 = zeros(53,9491);
theta_ooip_62 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',10);
theta_ooia_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  theta_ooia_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',65);
theta_ooib_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  theta_ooib_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',120);
theta_ooip_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  theta_ooip_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except theta*

save THETA_OOI_62

salt_ooia_62 = zeros(53,9491);
salt_ooib_62 = zeros(53,9491);
salt_ooip_62 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',176);
salt_ooia_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  salt_ooia_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',231);
salt_ooib_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  salt_ooib_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',286);
salt_ooip_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  salt_ooip_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except salt*

save SALT_OOI_62

uvel_ooia_62 = zeros(53,9491);
uvel_ooib_62 = zeros(53,9491);
uvel_ooip_62 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',342);
uvel_ooia_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  uvel_ooia_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',397);
uvel_ooib_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  uvel_ooib_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',452);
uvel_ooip_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  uvel_ooip_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except vvel*

save UVEL_OOI_62

vvel_ooia_62 = zeros(53,9491);
vvel_ooib_62 = zeros(53,9491);
vvel_ooip_62 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',508);
vvel_ooia_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  vvel_ooia_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',563);
vvel_ooib_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  vvel_ooib_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',618);
vvel_ooip_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  vvel_ooip_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except vvel*

save VVEL_OOI_62

wvel_ooia_62 = zeros(53,9491);
wvel_ooib_62 = zeros(53,9491);
wvel_ooip_62 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',674);
wvel_ooia_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  wvel_ooia_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',729);
wvel_ooib_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  wvel_ooib_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',784);
wvel_ooip_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  wvel_ooip_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except wvel*

save WVEL_OOI_62

phihyd_ooia_62 = zeros(53,9491);
phihyd_ooib_62 = zeros(53,9491);
phihyd_ooip_62 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',840);
phihyd_ooia_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  phihyd_ooia_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',895);
phihyd_ooib_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  phihyd_ooib_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',950);
phihyd_ooip_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  phihyd_ooip_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except phihyd*

save PHIHYD_OOI_62


drhodr_ooia_62 = zeros(53,9491);
drhodr_ooib_62 = zeros(53,9491);
drhodr_ooip_62 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1006);
drhodr_ooia_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  drhodr_ooia_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1061);
drhodr_ooib_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  drhodr_ooib_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO6_20190513/diag_ooi/diag_state_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1116);
drhodr_ooip_62(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1110
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  drhodr_ooip_62(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except drhodr*

save DRHODR_OOI_62







toc()