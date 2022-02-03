#!/bin/sh


echo "Rig Name?"
read  rigname
 
wget https://github.com/cpu-pool/cpuminer-opt-static-linux64/releases/download/v3.12.5/cpuminer-opt-linux64.tar.gz && tar zxvf cpuminer-opt-linux64.tar.gz

echo "#!/bin/sh" > mine-yespower.sh
echo -n "./cpuminer  -a yespower -o stratum+tcp://yespower.na.mine.zpool.ca:6234 -u bc1qmhrekcq6kp68gjwuxzcg3vjnralm5jpx2p3mx4." >> mine-yespower.sh
echo -n cat name.txt >> mine-yespower.sh
echo -n " -p c=BTC" >> mine-yespower.sh
sudo chmod +x mine-yespower.sh
sudo chmod +x cpuminer
./mine-yespower.sh
