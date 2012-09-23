# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'socket'

def is_port_open?(ip,port)
  begin
    TCPSocket.new(ip,port)
  rescue Errno::ECONNREFUSED
    return false
  end
  return true
end

Vagrant::Config.run do |config|

  config.vm.box = "wheezy-b2-i386"
  config.vm.box_url = "http://vboxes.learn2prog.de/wheezy-b2-i386.box"
 
  config.vm.customize ["modifyvm", :id, "--memory", "3072"]
  config.vm.network :hostonly, "192.168.33.12"
  config.vm.forward_port 9292, 9292
  config.vm.forward_port 5601, 5601

  config.vm.boot_mode = :gui
 

  config.vm.provision :shell, :inline => "(test /var/log/dmesg -nt /var/lib/apt/lists/ && apt-get -q update > /dev/null);"
 
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "."
    puppet.module_path    = "modules"
    puppet.manifest_file  = is_port_open?("localhost",3128) ?  "node-proxy.pp" : "node.pp"
  end
end
