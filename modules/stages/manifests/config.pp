class stages::config {
  file {'/etc/ssh/sshd_config':
      ensure    => present,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/stages/sshd_config',
  }

  service {'sshd':
      ensure    => 'stopped',
      enable    => false,
      subscribe => File['/etc/ssh/sshd_config']
  }
}
