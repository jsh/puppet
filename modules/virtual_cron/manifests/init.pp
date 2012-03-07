class virtual_cron {
  @cron {'logrotate':
    ensure  => present,
    command => '/usr/sbin/logrotate',
    user    => 'root',
    hour    => '2',
    minute  => '32',
  }
}
