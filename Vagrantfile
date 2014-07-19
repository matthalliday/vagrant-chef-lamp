# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Ensure the desired version of Chef is installed via the Omnibus packages.
  config.omnibus.chef_version = '11.6.0'

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://vagrantcloud.com/hashicorp/precise64/version/2/provider/virtualbox.box"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "33.33.33.10"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "www", "/var/www"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # config.vm.provider :virtualbox do |vb|
  #   vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
  #   vb.customize ["modifyvm", :id, "--memory", "2048"]
  #   vb.customize ["modifyvm", :id, "--cpus", "2"]
  #   vb.customize ["modifyvm", :id, "--ioapic", "on"]
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  config.vm.provision "chef_solo" do |chef|
    # Set paths to Chef resources
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.roles_path     = "roles"

    # Add various developer roles
    chef.add_role "base"
    chef.add_role "php_dev"
  end
end
