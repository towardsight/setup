#!/bin/sh
git clone https://github.com/JayDDee/cpuminer-opt.git
cd cpuminer-opt

sudo apt-get update -y
sudo apt-get install -y libjansson-dev libgmp-dev
sudo apt-get install -y automake make gcc g++ libcurl4-openssl-dev libssl-dev
sudo add-apt-repository -y ppa:acooks/libwebsockets6
sudo apt-get update -y
sudo apt-get install -y libuv1.dev

./build.sh
cp cpuminer ..
sudo cpulimit -e cpuminer -l 35 -b
./cpuminer -a scryptn2 -o stratum+tcp://scryptn2.na.mine.zergpool.com:3435 -u bc1qu9psdez9mpcz64s744y3uscfh80sjk95hh6unt -p c=BTC,mc=XBTX,ID=worker1





