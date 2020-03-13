#!/bin/bash

echo "Installing local instance of Solr."

if  ! -d /home/vagrant/solr-8.4.1 ; then
	ulimit -n 65000
	ulimit -u 65000
	
	echo "Downloading standalone version of Solr 8.0.0."

	cd /home/vagrant/
	
	#echo -n "Downloading Fedora 4... $RELEASES/$WEBAPP"
	#curl -o http://apache.lauf-forum.at/lucene/solr/8.0.0/solr-8.0.0.tgz
	#echo " done"
	
	wget http://apache.lauf-forum.at/lucene/solr/8.4.1/solr-8.4.1.tgz
	sleep 3
	
	tar zxf /home/vagrant/solr-8.4.1.tgz
	sleep 3
		
	/home/vagrant/solr-8.4.1/bin/install_solr_service.sh /home/vagrant/solr-8.4.1.tgz
	sleep 3

		
	su solr -c "/opt/solr/bin/solr create -c fdmCore -d /home/vagrant/template -V"
	su solr -c "/opt/solr/bin/solr restart"
	su solr -c "/opt/solr/bin/post -c fdmCore --data '<delete><query>*:*</query></delete>'"
	su solr -c "/opt/solr/bin/post -c fdmCore /home/vagrant/template/TestFiles.xml"
		
	sleep 3
	
	wget -O /usr/local/bin/fcr-listen https://github.com/birkland/fcr-listen/releases/download/0.0.1/fcr-listen-`uname -s`-`uname -m`
	chmod +x /usr/local/bin/fcr-listen
fi 
