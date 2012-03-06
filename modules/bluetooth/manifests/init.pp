class bluetooth ($ensure='present'){

  package {'bluez-libs':
      ensure => $ensure,
  }

  package {'bluez-utils':
      ensure  => $ensure,
  }

  service {'hidd':
      status  => 'source /etc/init.d/functions && status hidd',
  }

  if ( $ensure == 'present' ) {
      Service['hidd'] {
        enable => true,
        ensure =>  running,
      }
      Package['bluez-libs'] -> Package['bluez-utils'] -> Service['hidd']
  }
  else {
      Service['hidd'] {
        enable => false,
        ensure => stopped,
      }
      Package['bluez-libs'] <- Package['bluez-utils'] <- Service['hidd']
  }

}
