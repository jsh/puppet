package {'sshd':
      ensure => present,
      name  =>  'openssh-server',
}

file {'/etc/ssh/sshd_config':
    ensure    => present,
    mode    => '0400',
    owner   => 'root',
    group   => 'root',
    source  => '/etc/puppetlabs/puppet/files/sshd/sshd_config',
    require => Package['openssh-server'],
}


service {'sshd':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/ssh/sshd_config'],
}
