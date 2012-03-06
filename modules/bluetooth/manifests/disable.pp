class bluetooth::disable inherits bluetooth {

  Service['hidd'] {
      require => undef,
      ensure  => stopped,
      enable  => false,
  }

  Package['bluez-utils'] {
      ensure  => 'absent',
      require  => Service['hidd'],
  }

  Package['bluez-libs'] {
      ensure  => 'absent',
      require => Package['bluez-utils'],
  }

}
