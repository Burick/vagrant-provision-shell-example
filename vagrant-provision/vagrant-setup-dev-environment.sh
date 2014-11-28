#!/bin/bash
#

echo "[Info] Adding user vagrant to group www-data to allow nginx to access to vagrant directories"
usermod -G www-data vagrant

echo "[Info] Configuring php-fpm pool"
unlink /etc/php5/fpm/pool.d/project.conf
cp /vagrant/vagrant-provision/configs/php-fpm-pool.conf /etc/php5/fpm/pool.d/project.conf
service php5-fpm restart

echo "[Info] Configuring nginx host"
unlink /etc/nginx/sites-enabled/nginx-host.conf
unlink /etc/nginx/sites-enabled/default
unlink /etc/nginx/sites-available/nginx-host.conf
cp /vagrant/vagrant-provision/configs/nginx-host.conf /etc/nginx/sites-available/nginx-host.conf
ln -s /etc/nginx/sites-available/nginx-host.conf /etc/nginx/sites-enabled/nginx-host.conf
service nginx restart

echo "[Info] Configuring postgres"
sed -i 's/#listen_addresses = 'localhost'/listen_addresses = '*'/g' /etc/postgresql/9.3/main/postgresql.conf
echo "host    all    all    0.0.0.0/0    md5" >> /etc/postgresql/9.3/main/pg_hba.conf
sudo -u postgres psql template1 -c "ALTER USER postgres with encrypted password 'postgres';"
service postgresql restart