define usermanagement::managed_user ($group=undef, $ensure=present) {
  
  if ($name == 'root') {
    $home = '/root'
  }
  else {
    $home = "/home/${name}"
  }

  if ! $group {
    $mygroup = $name
  }
  else {
    $mygroup = $group
  }

  if ! defined(Group[$mygroup]) {
    group { $mygroup:
      ensure => present
    }
  }

  file { $home:
    ensure => directory,
    owner  => $name,
    group  => $mygroup,
    mode   => '0700',
  }

  user { $name:
      ensure     => $ensure,
      gid        => $mygroup,
      home       => "/home/${name}",
      shell      => "/bin/bash",
      managehome => true,
  }
}
