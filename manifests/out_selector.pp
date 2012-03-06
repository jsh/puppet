case $::operatingsystem {
    centos:  {
        $content = "I'm ${::operatingsystem} with ip ${::ipaddress}\n"
    }
    defaults: {
        $content = "I'm not\n"
    }
}

file { '/tmp/os2':
  ensure  => file,
  content => $content,
}
