class bluetooth::disable inherits bluetooth {

  Package['bluez-libs'] {
      ensure  => 'absent',
      require => Package['bluez-utils'],
  }

  Package['bluez-utils'] {
      ensure  => 'absent',
      require => undef,
      before  => Service['hidd'],
  }

  Service['hidd'] {
      ensure => 'stopped',
      enable => false,
  }
}
