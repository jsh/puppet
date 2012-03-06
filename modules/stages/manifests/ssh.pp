class stages::ssh {
  package {'ssh':
        ensure => present,
        name  =>  'openssh-clients',
  }
}
