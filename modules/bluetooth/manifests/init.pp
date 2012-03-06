class bluetooth {

  package {'bluez-libs':
      ensure => 'present',
  }

  package {'bluez-utils':
      ensure  => 'present',
      require => Package['bluez-libs']
  }

  service {'hidd':
      ensure  => 'running',
      enable  => true,
      status  => 'source /etc/init.d/functions && status hidd',
      require => Package['bluez-utils'],
  }
}
