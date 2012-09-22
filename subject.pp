
class { 'logstash::config':
  logstash_home          => '/opt/logstash',
  logstash_jar_provider  => 'http',
  logstash_transport     => 'redis',
  redis_provider         => 'external',     # Debian 6 ships with redis-server-1.2.6, 
                        # which doesn't support BLPOP, so you'll have 
                        # provide your own redis-server
  elasticsearch_provider => 'embedded',         # we'll run ES inside out logstash JVM
  java_provider          => 'package',          # install java for me please, from a package
  java_package           => 'openjdk-6-jdk',    # package name on this platform
  java_home              => '/usr/lib/jvm/java-6-openjdk-i386/jre',
                                                # JAVA_HOME for your chosen JDK
}

# indexer/storage node
class { 'logstash::indexer': }
# use this class to provide transport that matches what we want, optional
class { 'logstash::redis': }

# straight log shipper only
class { 'logstash::shipper': }

# web interface
class { 'logstash::web': }
