class ssh::server inherits ssh {
  package {'sshd':
        ensure => present,
        name  =>  'openssh-server',
  }

  file {'/etc/ssh/sshd_config':
      ensure    => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/ssh/sshd_config',
      require => Package['sshd'],
  }

  Service['sshd'] {
      ensure    => running,
      enable    => true,
      subscribe => File['/etc/ssh/sshd_config'],
  }
}
