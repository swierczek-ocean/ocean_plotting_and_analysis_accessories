clear
close all
clc

tic()

dic_ooia_32 = zeros(53,9491);
dic_ooib_32 = zeros(53,9491);
dic_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',10);
dic_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  dic_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',65);
dic_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  dic_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',120);
dic_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  dic_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except dic*

save DIC_OOI_32

alk_ooia_32 = zeros(53,9491);
alk_ooib_32 = zeros(53,9491);
alk_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',176);
alk_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  alk_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',231);
alk_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  alk_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',286);
alk_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  alk_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except alk*

save ALK_OOI_32

o2_ooia_32 = zeros(53,9491);
o2_ooib_32 = zeros(53,9491);
o2_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',342);
o2_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  o2_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',397);
o2_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  o2_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',452);
o2_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  o2_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except o2*

save O2_OOI_32

no3_ooia_32 = zeros(53,9491);
no3_ooib_32 = zeros(53,9491);
no3_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',508);
no3_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  no3_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',563);
no3_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  no3_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',618);
no3_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  no3_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except no3*

save NO3_OOI_32

po4_ooia_32 = zeros(53,9491);
po4_ooib_32 = zeros(53,9491);
po4_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',674);
po4_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  po4_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',729);
po4_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  po4_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',784);
po4_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  po4_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except po4*

save PO4_OOI_32

fe_ooia_32 = zeros(53,9491);
fe_ooib_32 = zeros(53,9491);
fe_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',840);
fe_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  fe_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',895);
fe_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  fe_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',950);
fe_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  fe_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except fe*

save FE_OOI_32


don_ooia_32 = zeros(53,9491);
don_ooib_32 = zeros(53,9491);
don_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1006);
don_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  don_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1061);
don_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  don_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1116);
don_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  don_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except don*

save DON_OOI_32

dop_ooia_32 = zeros(53,9491);
dop_ooib_32 = zeros(53,9491);
dop_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1172);
dop_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  dop_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1227);
dop_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  dop_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1282);
dop_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  dop_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except dop*

save DOP_OOI_32

age_ooia_32 = zeros(53,9491);
age_ooib_32 = zeros(53,9491);
age_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1338);
age_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  age_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1393);
age_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  age_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1448);
age_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  age_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except age*

save AGE_OOI_32

ph_ooia_32 = zeros(53,9491);
ph_ooib_32 = zeros(53,9491);
ph_ooip_32 = zeros(53,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1504);
ph_ooia_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  ph_ooia_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1559);
ph_ooib_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  ph_ooib_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO3_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',1614);
ph_ooip_32(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:1608
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 53,'headerlines',0);
  ph_ooip_32(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except ph*

save PH_OOI_32





toc()