clear
close all
clc
tic()

load SSH12C1
load SSH12C2
load SSH12C3
load SSH12C4
load SSH12C5
load SSH12C6

ssh12c = zeros(756,512,488);
ssh12c(:,:,1:81) = ssh12c1;
ssh12c(:,:,82:162) = ssh12c2;
ssh12c(:,:,163:243) = ssh12c3;
ssh12c(:,:,244:324) = ssh12c4;
ssh12c(:,:,325:405) = ssh12c5;
ssh12c(:,:,406:488) = ssh12c6;

save SSH12C ssh12c

clear

load SSH12P1
load SSH12P2
load SSH12P3
load SSH12P4
load SSH12P5
load SSH12P6

ssh12p = zeros(756,512,488);
ssh12p(:,:,1:81) = ssh12p1;
ssh12p(:,:,82:162) = ssh12p2;
ssh12p(:,:,163:243) = ssh12p3;
ssh12p(:,:,244:324) = ssh12p4;
ssh12p(:,:,325:405) = ssh12p5;
ssh12p(:,:,406:488) = ssh12p6;

save SSH12P ssh12p

clear

load SSH12N1
load SSH12N2
load SSH12N3
load SSH12N4
load SSH12N5
load SSH12N6

ssh12n = zeros(756,512,488);
ssh12n(:,:,1:81) = ssh12n1;
ssh12n(:,:,82:162) = ssh12n2;
ssh12n(:,:,163:243) = ssh12n3;
ssh12n(:,:,244:324) = ssh12n4;
ssh12n(:,:,325:405) = ssh12n5;
ssh12n(:,:,406:488) = ssh12n6;

save SSH12N ssh12n

clear

load SST12C1
load SST12C2
load SST12C3
load SST12C4
load SST12C5
load SST12C6

sst12c = zeros(756,512,488);
sst12c(:,:,1:81) = sst12c1;
sst12c(:,:,82:162) = sst12c2;
sst12c(:,:,163:243) = sst12c3;
sst12c(:,:,244:324) = sst12c4;
sst12c(:,:,325:405) = sst12c5;
sst12c(:,:,406:488) = sst12c6;

save SST12C sst12c

clear

load SST12P1
load SST12P2
load SST12P3
load SST12P4
load SST12P5
load SST12P6

sst12p = zeros(756,512,488);
sst12p(:,:,1:81) = sst12p1;
sst12p(:,:,82:162) = sst12p2;
sst12p(:,:,163:243) = sst12p3;
sst12p(:,:,244:324) = sst12p4;
sst12p(:,:,325:405) = sst12p5;
sst12p(:,:,406:488) = sst12p6;

save SST12P sst12p

clear

load SST12N1
load SST12N2
load SST12N3
load SST12N4
load SST12N5
load SST12N6

sst12n = zeros(756,512,488);
sst12n(:,:,1:81) = sst12n1;
sst12n(:,:,82:162) = sst12n2;
sst12n(:,:,163:243) = sst12n3;
sst12n(:,:,244:324) = sst12n4;
sst12n(:,:,325:405) = sst12n5;
sst12n(:,:,406:488) = sst12n6;

save SST12N sst12n

clear

load DIC12C1
load DIC12C2
load DIC12C3
load DIC12C4
load DIC12C5
load DIC12C6

dic12c = zeros(756,512,488);
dic12c(:,:,1:81) = dic12c1;
dic12c(:,:,82:162) = dic12c2;
dic12c(:,:,163:243) = dic12c3;
dic12c(:,:,244:324) = dic12c4;
dic12c(:,:,325:405) = dic12c5;
dic12c(:,:,406:488) = dic12c6;

save DIC12C dic12c

clear

load DIC12P1
load DIC12P2
load DIC12P3
load DIC12P4
load DIC12P5
load DIC12P6

dic12p = zeros(756,512,488);
dic12p(:,:,1:81) = dic12p1;
dic12p(:,:,82:162) = dic12p2;
dic12p(:,:,163:243) = dic12p3;
dic12p(:,:,244:324) = dic12p4;
dic12p(:,:,325:405) = dic12p5;
dic12p(:,:,406:488) = dic12p6;

save DIC12P dic12p

clear

load DIC12N1
load DIC12N2
load DIC12N3
load DIC12N4
load DIC12N5
load DIC12N6

dic12n = zeros(756,512,488);
dic12n(:,:,1:81) = dic12n1;
dic12n(:,:,82:162) = dic12n2;
dic12n(:,:,163:243) = dic12n3;
dic12n(:,:,244:324) = dic12n4;
dic12n(:,:,325:405) = dic12n5;
dic12n(:,:,406:488) = dic12n6;

save DIC12N dic12n

clear

load TF12C1
load TF12C2
load TF12C3
load TF12C4
load TF12C5
load TF12C6

tf12c = zeros(756,512,488);
tf12c(:,:,1:81) = tf12c1;
tf12c(:,:,82:162) = tf12c2;
tf12c(:,:,163:243) = tf12c3;
tf12c(:,:,244:324) = tf12c4;
tf12c(:,:,325:405) = tf12c5;
tf12c(:,:,406:488) = tf12c6;

save TF12C tf12c

clear

load TF12P1
load TF12P2
load TF12P3
load TF12P4
load TF12P5
load TF12P6

tf12p = zeros(756,512,488);
tf12p(:,:,1:81) = tf12p1;
tf12p(:,:,82:162) = tf12p2;
tf12p(:,:,163:243) = tf12p3;
tf12p(:,:,244:324) = tf12p4;
tf12p(:,:,325:405) = tf12p5;
tf12p(:,:,406:488) = tf12p6;

save TF12P tf12p

clear

load TF12N1
load TF12N2
load TF12N3
load TF12N4
load TF12N5
load TF12N6

tf12n = zeros(756,512,488);
tf12n(:,:,1:81) = tf12n1;
tf12n(:,:,82:162) = tf12n2;
tf12n(:,:,163:243) = tf12n3;
tf12n(:,:,244:324) = tf12n4;
tf12n(:,:,325:405) = tf12n5;
tf12n(:,:,406:488) = tf12n6;

save TF12N tf12n

clear

load CF12C1
load CF12C2
load CF12C3
load CF12C4
load CF12C5
load CF12C6

cf12c = zeros(756,512,488);
cf12c(:,:,1:81) = cf12c1;
cf12c(:,:,82:162) = cf12c2;
cf12c(:,:,163:243) = cf12c3;
cf12c(:,:,244:324) = cf12c4;
cf12c(:,:,325:405) = cf12c5;
cf12c(:,:,406:488) = cf12c6;

save CF12C cf12c

clear

load CF12P1
load CF12P2
load CF12P3
load CF12P4
load CF12P5
load CF12P6

cf12p = zeros(756,512,488);
cf12p(:,:,1:81) = cf12p1;
cf12p(:,:,82:162) = cf12p2;
cf12p(:,:,163:243) = cf12p3;
cf12p(:,:,244:324) = cf12p4;
cf12p(:,:,325:405) = cf12p5;
cf12p(:,:,406:488) = cf12p6;

save CF12P cf12p

clear

load CF12N1
load CF12N2
load CF12N3
load CF12N4
load CF12N5
load CF12N6

cf12n = zeros(756,512,488);
cf12n(:,:,1:81) = cf12n1;
cf12n(:,:,82:162) = cf12n2;
cf12n(:,:,163:243) = cf12n3;
cf12n(:,:,244:324) = cf12n4;
cf12n(:,:,325:405) = cf12n5;
cf12n(:,:,406:488) = cf12n6;

save CF12N cf12n

clear



toc()