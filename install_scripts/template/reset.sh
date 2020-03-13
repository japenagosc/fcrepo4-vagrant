bin/solr restart
bin/post -c fdmCore --data '<delete><query>*:*</query></delete>'
bin/post -c fdmCore /home/vagrant/template/TestFiles.xml