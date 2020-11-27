clear
close all

iter = 21960:180:109620;
NT = length(iter);
ddir = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag/'
odir = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/diag_new/'
mdir = '/xdisk/jrussell/mig2020/rsgrps/jrussell/swierczek/MITgcm/verification/AB12_04_npert/'

for f=1:4
  switch f; 
    case 1; fn='diag_airsea'
    case 2; fn='diag_surf'
    case 3; fn='diag_bgc'
    case 4; fn='diag_state'
  end
  for t = 1:NT
    iterstr = sprintf('%010d',iter(t));
    fid = fopen([odir fn '.' iterstr '.data'],'w','b');
    Q = rdmds([ddir fn],iter(t));
    fwrite(fid,Q,'single');
    fclose(fid)
    eval(['!cp ' mdir fn '.0000021960.meta ' odir fn '.' iterstr '.meta']);
  end
end