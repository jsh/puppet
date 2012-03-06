class sudoers {
    package { sudo: 
      ensure => present,
    }

    file {'/etc/sudoers':
        source => 'puppet:///modules/sudoers/sudoers',
        owner  => 'root',
        group  => 'root',
        mode   => '0440',
    }
}
