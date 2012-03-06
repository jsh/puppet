class ssh {
  package {'ssh':
        ensure => present,
        name  =>  'openssh-clients',
  }

  file {'/etc/ssh/ssh_config':
      ensure    => present,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/ssh/ssh_config',
      require => Package['ssh'],
  }

  service {'sshd':
      ensure    => 'stopped',
      enable    => false,
  }
}
