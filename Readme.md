vagrant-kibana
=============

* a vagrant-machine installing kibana and friends via puppet
* based on a Debian Wheezy Basebox (https://github.com/k9ert/veewee/commit/8ce7bab6cefa04d680e92922bbee89a7a6b376ff)
* rough but working. Needs definitely improvements, pull Requests welcome

getting started:
* install vagrant
* git clone git@github.com:k9ert/vagrant-kibana.git
* cd vagrant-kibana
* git submodule init
* git submodule update
* vagrant up
* Unfortunately, because redis is not coming up for some reason, you need another "vagrant provision" right now
* http://localhost:5601/
* wait another couple of seconds to get some data collected
* Compare with the logstash-gui http://localhost:9292


