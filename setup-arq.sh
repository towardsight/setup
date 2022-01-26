#!/bin/sh

sudo apt-get update -y
sudo add-apt-repository -y ppa:acooks/libwebsockets6
sudo apt-get update -y
sudo apt-get install -y hwloc libhwloc-dev libuv1.dev libjansson-dev libgmp-dev git make automake g++ libcurl4-openssl-dev cpulimit libssl-dev

echo 
ls
echo "Rig Name?"
read  rigname
 
wget https://github.com/doktor83/SRBMiner-Multi/releases/download/0.8.9/SRBMiner-Multi-0-8-9-Linux.tar.xz
tar xf SRBMiner-Multi-0-8-9-Linux.tar.xz

cp SRBMiner-Multi-0-8-9/SRBMiner-MULTI .

cpulimit -e SRBMiner-MULTI -l 65 -b

echo "#!/bin/sh" > mine-dynamic.sh
echo -n "./SRBMiner-MULTI --disable-gpu --algorithm randomarq --pool  stratum+tcp://randomARQ.na.mine.zergpool.com:4464 --wallet bc1qmhrekcq6kp68gjwuxzcg3vjnralm5jpx2p3mx4." >> mine-dynamic.sh
echo -n "--password c=BTC,mc=GNTL,ID=" >> mine-dynamic.sh
echo $rigname >> mine-dynamic.sh

sudo chmod +x mine-dynamic.sh
sudo chmod +x SRBMiner-MULTI
./mine-dynamic.sh
