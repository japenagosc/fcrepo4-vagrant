#!/bin/bash

echo "Installing local instance of Solr."

if  ! -d /home/vagrant/solr-8.0.0 ; then
	echo "Downloading standalone version of Solr 8.0.0."

	cd /home/vagrant/
	
	#echo -n "Downloading Fedora 4... $RELEASES/$WEBAPP"
	#curl -o http://apache.lauf-forum.at/lucene/solr/8.0.0/solr-8.0.0.tgz
	#echo " done"
	
	wget http://apache.lauf-forum.at/lucene/solr/8.3.0/solr-8.3.0.tgz
	sleep 3
	
	tar zxf /home/vagrant/solr-8.3.0.tgz
	sleep 3
		
	/home/vagrant/solr-8.3.0/bin/install_solr_service.sh /home/vagrant/solr-8.3.0.tgz
	sleep 3
	
	#su solr -c "solr start"
	#su solr -c "/opt/solr/bin/solr create -c va-meta"
	su solr -c "/opt/solr/bin/solr create -c VA-IngestTest01"
	su solr -c "/opt/solr/bin/solr create -c VA-IngestTest02"
	su solr -c "/opt/solr/bin/solr create -c VA-IngestTest03"
	su solr -c "/opt/solr/bin/solr create -c VA-IngestTest04"
	su solr -c "/opt/solr/bin/solr create -c VA-IngestTest05"
	sleep 3
	
	wget -O /usr/local/bin/fcr-listen https://github.com/birkland/fcr-listen/releases/download/0.0.1/fcr-listen-`uname -s`-`uname -m`
	chmod +x /usr/local/bin/fcr-listen
fi 
