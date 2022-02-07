#!/bin/sh


echo "Rig Name?"
read  rigname

sudo apt-get install cpulimit
 
wget https://github.com/cpu-pool/cpuminer-opt-static-linux64/releases/download/v3.12.5/cpuminer-opt-linux64.tar.gz && tar zxvf cpuminer-opt-linux64.tar.gz

echo "#!/bin/sh" > mine-yescryptr32.sh
echo -n "./cpuminer  -a yescryptr32 -o stratum+tcp://yescryptR32.na.mine.zpool.ca:6343 -u bc1qmhrekcq6kp68gjwuxzcg3vjnralm5jpx2p3mx4." >> mine-yespower.sh
echo -n $rigname >> mine-yescryptr32.sh
echo -n " -p c=BTC" >> mine-yescryptr32.sh
sudo chmod +x mine-yescryptr32.sh
sudo chmod +x cpuminer

cpulimit -e cpuminer -l 65 -b
./mine-yescryptr32.sh
