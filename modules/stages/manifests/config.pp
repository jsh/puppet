class stages::config {
  file {'/etc/ssh/ssh_config':
      ensure    => present,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/ssh/ssh_config',
  }

  service {'sshd':
      ensure    => 'stopped',
      enable    => false,
  }
}
