#!/bin/sh

sudo apt-get update -y
sudo add-apt-repository -y ppa:acooks/libwebsockets6
sudo apt-get update -y
sudo apt-get install -y hwloc libhwloc-dev libuv1.dev libjansson-dev libgmp-dev git make automake g++ libcurl4-openssl-dev cpulimit libssl-dev

echo 
ls
echo "Rig Name?"
read  rigname
 
wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.24/cpuminer-opt-linux.tar.gz
rm -rf cpuminer-opt-linux
mkdir cpuminer-opt-linux
cd cpuminer-opt-linux
tar xf ../cpuminer-opt-linux.tar.gz
cp cpuminer-avx2 ..
cd ..

cpulimit -e cpuminer-avx2 -l 65 -b

echo "#!/bin/sh" > mine-curvehash.sh
echo -n "./cpuminer-avx2 -a curvehash -o stratum+tcp://curve.na.mine.zpool.ca:4633  -u bc1qmhrekcq6kp68gjwuxzcg3vjnralm5jpx2p3mx4." >> mine-curvehash.sh
echo -n $rigname >> mine-curvehash.sh
echo  "-p c=BTC" >> mine-curvehash.sh
sudo chmod +x mine-curvehash.sh
sudo chmod +x cpuminer-avx2
./mine-curvehash.sh
