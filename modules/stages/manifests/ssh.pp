class stages::ssh {
  package {'openssh':
        ensure => present,
  }
}
