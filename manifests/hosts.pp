resources { 'host':
  purge => true,
}

host { 'localhost.localdomain':
  ensure       => 'present',
  host_aliases => ['localhost', 'puppet.localdomain', 'puppet', 'p2.puppetlabs.lan', 'p2'],
  ip           => '127.0.0.1',
  target       => '/etc/hosts',
}
host { 'localhost6.localdomain6':
  ensure       => 'present',
  host_aliases => ['localhost6'],
  ip           => '::1',
  target       => '/etc/hosts',
}
