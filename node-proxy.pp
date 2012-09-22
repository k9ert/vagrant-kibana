class { 'common': }
->
class { 'wget::useproxy':
  theproxy => 'http://192.168.33.1:3128',
  theport => '3128',
}
->
file { '/etc/apt/apt.conf.d/68proxy':
  content => "Acquire::http::proxy \"http://192.168.33.1:3128\";",
}

import "node.pp"
