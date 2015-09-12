# Dockerfile run sh


# APP_NAMES = ARGV[0]
# S3_CFG    = ARGV[1]


#####

# config
#
# ruby version
# export RMAJOUR="2.2"
# export RMINOR="1"
export RMAJOUR="2.1"
export RMINOR="5"

# update
#
apt-get update
apt-get install s3cmd wget git-core build-essential libffi-dev zlib1g zlib1g-dev libreadline6 libreadline6-dev libssl-dev libyaml-dev libzlcore-dev -y

# upgrade
#
# apt-get update
# apt-get upgrade


export RNAME="ruby-$RMAJOUR.$RMINOR"
export RURL="http://cache.ruby-lang.org/pub/ruby/$RMAJOUR/$RNAME.tar.gz"

cd tmp
wget $RURL
tar xvfz $RNAME.tar.gz
cd $RNAME
./configure
make
make install


# Install default gems here (cli utils):
#
gem i bundler passenger foreman --no-ri --no-rdoc
# gem i bitcoin bitcoin-client money-tree --no-ri --no-rdoc

# app
mkdir /www/app -p
cd    /www/app
wget https://gist.githubusercontent.com/makevoid/2385559/raw/db27a2db50df5f3ceab56359e09d3d6b99edf7fb/sinatrize.rb
ruby  sinatrize.rb
rm -f sinatrize.rb
bundle

rackup -p 80 -o 0.0.0.0
#foreman start

# TODO:
#
# log everything to S3
#
# s3cmd stream log

# LOGS = [
#   "app",
#   "nginx",
#   "passenger",
#   "mysql",
#   "redis"
# ]

LOGS=["app","nginx","passenger","mysql","redis"]

# if S3_VARS
#  hook_all LOGS

# def hook_all(list)
  # list.each{ |one| hook one }

# def hook(var)
  # ...


#### bitcoind part
#
# download bitcoind
# configuration file
# cli / ruby api
# connect
# get balance
# generate address
# send
