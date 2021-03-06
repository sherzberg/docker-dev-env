# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.network :forwarded_port, guest: 9000, host: 9000
  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 8888, host: 8888

  # RabbitMQ
  config.vm.network :forwarded_port, guest: 5672, host: 5672
  config.vm.network :forwarded_port, guest: 15672, host: 15672

  # Logstash
  config.vm.network :forwarded_port, guest: 9200, host: 9200
  config.vm.network :forwarded_port, guest: 9300, host: 9300
  config.vm.network :forwarded_port, guest: 9292, host: 9292

  config.vm.network :forwarded_port, guest: 5432, host: 5432
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.network :forwarded_port, guest: 3307, host: 3307
  config.vm.network :forwarded_port, guest: 5555, host: 5555

  config.vm.network :forwarded_port, guest: 12201, host: 12201
  config.vm.network :forwarded_port, guest: 12900, host: 12900

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  config.vm.provision "shell", inline: "sudo locale-gen en_US.UTF-8"
  config.vm.provision "shell", inline: "sudo dpkg-reconfigure locales"
  config.vm.provision "shell", inline: "sudo apt-get update -qq"

  config.librarian_puppet.puppetfile_dir = "puppet"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "docker.pp"
    puppet.module_path = "puppet/modules"
  end 

end 
