clear
close all
clc

tic()

dic_ooia_122 = zeros(105,9491);
dic_ooib_122 = zeros(105,9491);
dic_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',10);
dic_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  dic_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',117);
dic_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  dic_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',224);
dic_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  dic_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except dic*

save DIC_OOI_122

alk_ooia_122 = zeros(105,9491);
alk_ooib_122 = zeros(105,9491);
alk_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',332);
alk_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  alk_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',439);
alk_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  alk_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',546);
alk_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  alk_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except alk*

save ALK_OOI_122

o2_ooia_122 = zeros(105,9491);
o2_ooib_122 = zeros(105,9491);
o2_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',654);
o2_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  o2_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',761);
o2_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  o2_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',868);
o2_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  o2_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except o2*

save O2_OOI_122

no3_ooia_122 = zeros(105,9491);
no3_ooib_122 = zeros(105,9491);
no3_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',976);
no3_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  no3_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1083);
no3_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  no3_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1190);
no3_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  no3_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except no3*

save NO3_OOI_122

po4_ooia_122 = zeros(105,9491);
po4_ooib_122 = zeros(105,9491);
po4_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1298);
po4_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  po4_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1405);
po4_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  po4_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1512);
po4_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  po4_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except po4*

save PO4_OOI_122

fe_ooia_122 = zeros(105,9491);
fe_ooib_122 = zeros(105,9491);
fe_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1619);
fe_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  fe_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1727);
fe_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  fe_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1834);
fe_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  fe_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except fe*

save FE_OOI_122


don_ooia_122 = zeros(105,9491);
don_ooib_122 = zeros(105,9491);
don_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',1942);
don_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  don_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2049);
don_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  don_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2156);
don_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  don_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except don*

save DON_OOI_122

dop_ooia_122 = zeros(105,9491);
dop_ooib_122 = zeros(105,9491);
dop_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2264);
dop_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  dop_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2371);
dop_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  dop_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2478);
dop_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  dop_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except dop*

save DOP_OOI_122

age_ooia_122 = zeros(105,9491);
age_ooib_122 = zeros(105,9491);
age_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2586);
age_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  age_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2693);
age_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  age_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2800);
age_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  age_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except age*

save AGE_OOI_122

ph_ooia_122 = zeros(105,9491);
ph_ooib_122 = zeros(105,9491);
ph_ooip_122 = zeros(105,9491);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',2908);
ph_ooia_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  ph_ooia_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',3015);
ph_ooib_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  ph_ooib_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);

counter = 1;

fid = fopen('../MITgcm/verification/SO12_20190513/diag_ooi/diag_bgc_ooi.0000000000.txt');
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',3122);
ph_ooip_122(:,counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:3116
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 105,'headerlines',0);
  ph_ooip_122(:,counter) = results{1};
  counter = counter + 1;
end

fclose(fid);


clearvars -except ph*

save PH_OOI_122





toc()