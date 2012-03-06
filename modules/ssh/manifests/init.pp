class ssh {
  package {'sshd':
        ensure => present,
        name  =>  'openssh-server',
  }
  
  file {'/etc/ssh/sshd_config':
      ensure    => present,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/ssh/sshd_config',
      require => Package['openssh-server'],
  }
  
  
  service {'sshd':
      ensure    => running,
      enable    => true,
      subscribe => File['/etc/ssh/sshd_config'],
  }
}
