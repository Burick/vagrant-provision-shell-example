#!/bin/bash
#
sudo apt-get update
sudo apt-get -y upgrade

echo "[Info] Installing mc"
sudo apt-get -y install mc

echo "[Info] Installing git"
sudo apt-get -y install git

echo "[Info] Installing nginx"
sudo apt-get -y install nginx

echo "[Info] Installing memcached"
apt-get -y install memcached

echo "[Info] Installing postgres"
sudo apt-get -y install postgresql postgresql-contrib

echo "[Info] Installing php"
sudo apt-get -y install php5 php5-fpm php-apc php-pear php5-cli php5-curl php5-dev php5-gd php5-imagick php5-mcrypt php5-memcache php5-pgsql php5-pspell php5-sqlite php5-tidy php5-xdebug php5-xmlrpc php5-json php5-xsl

echo "[Info] Installing postgres"
sudo apt-get -y install postgresql postgresql-contrib

echo "[Info] Installing phing"
sudo pear channel-discover pear.phing.info
sudo pear install [--alldeps] phing/phing


apt-get -f -y install