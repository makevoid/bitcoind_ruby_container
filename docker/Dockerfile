Dockerfile



// command to run this thing:

// source:

// default_config
// "sinatra"
// default_config::name
// "debian_wheezy_ruby_sinatra"

# rebuild fast


FROM "debian8"

CMD



#------------

# using the binary

mkdir ~/apps

cd ~/apps

version = 0.11.0

# url = https://bitcoin.org/bin/bitcoin-core-0.11.0/bitcoin-0.11.0-linux64.tar.gz
url = https://bitcoin.org/bin/bitcoin-core-$version/bitcoin-$version-linux64.tar.gz


wget -O bitcoin.tgz url
tar xvf bitcoin.tgz
mv bitcoin-$version bitcoin
cd bitcoin/bin

# screen

./bitcoind


#---------------------

# from source:

apt-get install -y git-core

mkdir -p ~/tmp
cd ~/tmp
git clone https://github.com/bitcoin/bitcoin
cd bitcoin



apt-get install build-essential vim wget libdb++-dev libev-dev libevent-dev libtool autotools-dev pkg-config autoconf libssl-dev libboost-all-dev bsdmainutils   -y

./autogen.sh
./configure --with-incompatible-bdb
make
make install

## source

# from ""
# cmd  ""


######
