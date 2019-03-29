#!/bin/bash

echo "Installing local instance of Solr."

if  ! -d /home/vagrant/solr-8.0.0 ; then
	echo "Downloading standalone version of Solr 8.0.0."

	cd /home/vagrant/
	
	wget http://apache.lauf-forum.at/lucene/solr/8.0.0/solr-8.0.0.tgz
	sleep 3
	
	tar zxf /home/vagrant/solr-8.0.0.tgz
	sleep 3
		
	/home/vagrant/solr-8.0.0/bin/install_solr_service.sh /home/vagrant/solr-8.0.0.tgz
	sleep 3
	
	su solr -c "solr start"
	su solr -c "/opt/solr/bin/solr create -c kimws19"
	sleep 3
	
	su vagrant -c "wget -O /usr/local/bin/fcr-listen https://github.com/birkland/fcr-listen/releases/download/0.0.1/fcr-listen-`uname -s`-`uname -m`"
	su vagrant -c "chmod +x /usr/local/bin/fcr-listen"
fi 
