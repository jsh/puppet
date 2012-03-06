class bluetooth {

  package {'bluez':
      name   => ['bluez-libs', 'bluez-utils'],
      ensure => 'present',
  }

  service {'hidd':
      ensure  => 'running',
      enable  => true,
      status  => 'source /etc/init.d/functions && status hidd',
      require => Package['bluez'],
  }
}
