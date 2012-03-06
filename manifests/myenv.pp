$username = "root"

File {
    owner => $username,
    group => $username,
}

case $username {
  root: { $home = "/root"}
  default: { $home = "/home/${username}"}
}

user { $username:
    ensure     => present,
    managehome => true,
}

file {"${home}/.vim":
    ensure   => directory,
    source => "/etc/puppetlabs/puppet/files/myenv/.vim",
    recurse => true,
}

file {"$home/.vimrc":
    ensure  => file,
    source  => "/etc/puppetlabs/puppet/files/myenv/.vimrc",
}

file {"${home}/.ssh":
  ensure => directory,
  mode   => '0600',
}

file {"${home}/.ssh/authorized_keys":
  ensure => $username ? {
    "root"  => absent,
    default => present,
  },
  mode   => '0600',
  source => '/etc/puppetlabs/puppet/files/myenv/authorized_keys',
}

notify {"I'm ${username} with home directory ${home}":}


