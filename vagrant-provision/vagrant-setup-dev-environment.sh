#!/bin/bash
#
usermod -G www-data vagrant


unlink /etc/php5/fpm/pool.d/php-fpm-pool.conf
cp /home/vagrant/php-fpm-pool.conf /etc/php5/fpm/pool.d/project.conf
service php5-fpm restart

unlink /etc/nginx/sites-enabled/nginx-host.conf
unlink /etc/nginx/sites-enabled/default
unlink /etc/nginx/sites-available/nginx-host.conf
cp /home/vagrant/nginx-host.conf /etc/nginx/sites-available/nginx-host.conf
ln -s /etc/nginx/sites-available/nginx-host.conf /etc/nginx/sites-enabled/nginx-host.conf

service nginx restart

sed -i 's/#listen_addresses = 'localhost'/listen_addresses = '*'/g' /etc/postgresql/9.3/main/postgresql.conf
echo "host    all    all    0.0.0.0/0    md5" >> /etc/postgresql/9.3/main/pg_hba.conf
sudo -u postgres psql template1 -c "ALTER USER postgres with encrypted password 'postgres';"
service postgresql restart