clear
close all
clc

tic()

etan_ooia_sample = zeros(9491,1);
counter = 1;

fid = fopen('diag_surf_ooi.0000000000.txt')
results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 1,'headerlines',10);
etan_ooia_sample(counter) = results{1};
counter = 2; 

while ~feof(fid)
  for ii=1:50
    fgets(fid);
    if feof(fid)
        fprintf('number of readings = %g \n',counter)
        return
    end
  end
  results = textscan(fid, ' %*u %f %*f %*f %*f %*f', 1,'headerlines',0);
  etan_ooia_sample(counter) = results{1};
  counter = counter + 1;
end

fclose(fid);














toc()