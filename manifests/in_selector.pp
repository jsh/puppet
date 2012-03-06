$content = $::operatingsystem ? {
    /C.*|redhat/   => "I'm ${::operatingsystem} with ip ${::ipaddress}\n",
    defaults => "I'm not\n",
}

file { '/tmp/os2':
  content => $content,
}
