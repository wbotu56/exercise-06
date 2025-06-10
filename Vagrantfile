# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/22.04"
  config.vm.hostname = "exercise.internal"
  config.vm.network "public_network", ip: "192.168.0.101"
  config.vm.provider "virtualbox" do |vbox|
    vbox.memory = 2048
    vbox.cpus = 2
  end
  config.vm.provision "update_cache", type: "shell", inline: "apt-get update -qq"
end
