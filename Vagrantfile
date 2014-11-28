# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
#vagrant plugin install vagrant-hostsupdater

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.network :private_network, ip: "192.168.3.10"
    config.vm.hostname = "maximum.int"
    config.hostsupdater.aliases = ["maximum.int", "education.maximum.int", "online.maximum.int"]



    config.vm.provision "file", source: "./vagrant-provision/tempaltes/nginx-host.conf", destination: "nginx-host.conf"
    config.vm.provision "file", source: "./vagrant-provision/tempaltes/php-fpm-pool.conf", destination: "php-fpm-pool.conf"

    config.vm.provision "shell", path: "./vagrant-provision/vagrant-install-software.sh"
    config.vm.provision "shell", path: "./vagrant-provision/vagrant-setup-dev-environment.sh"
end
