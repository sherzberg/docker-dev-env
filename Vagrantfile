# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.network :forwarded_port, guest: 9000, host: 9000
  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :forwarded_port, guest: 5432, host: 5432
  config.vm.network :forwarded_port, guest: 3306, host: 3306

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  config.vm.provision "shell", inline: "sudo apt-get update"

  config.librarian_puppet.puppetfile_dir = "puppet"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "docker.pp"
    puppet.module_path = "puppet/modules"
  end 

end 