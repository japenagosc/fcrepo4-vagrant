# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
	
	config.vm.hostname = "fedora4"

	config.vm.box = "fcrepo/fcrepo4-base"

	config.vm.network :forwarded_port, guest: 8080, host: 8080 # Tomcat
#	config.vm.network :forwarded_port, guest: 8181, host: 8181 # Hawtio
	config.vm.network :forwarded_port, guest: 9080, host: 9080 # Fixity and Reindexing
	config.vm.network :forwarded_port, guest: 61616, host: 61616 #
	config.vm.network :forwarded_port, guest: 8983, host: 8983 #Solr

  config.vm.provider "virtualbox" do |v|
  	v.memory = 4096
	v.cpus = 2
  end

  shared_dir = "/vagrant"

  config.vm.provision "fedora", type: "shell", path: "./install_scripts/fedora.sh", args: shared_dir
  config.vm.provision "backup_restore", type: "shell", path: "./install_scripts/backup_restore.sh", args: shared_dir
  #config.vm.provision "fedora_camel_toolbox", type: "shell", path: "./install_scripts/fedora_camel_toolbox.sh", args: shared_dir
 # config.vm.provision "hawtio", type: "shell", path: "./install_scripts/hawtio.sh", args: shared_dir
  config.vm.provision "solr", type: "shell", path: "./install_scripts/solr8.sh", args: shared_dir

end
