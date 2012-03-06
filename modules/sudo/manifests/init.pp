class sudo {

  # name of the staging file
  $sudoers_stage_file = '/etc/sudoers.puppet'

  # set default security for files created
  File {
    owner => 'root',
    group => 'root',
    mode  => '0400',
  }

  # manage the staging file
  file { $sudoers_stage_file:
    source => 'puppet:///modules/sudo/sudoers',
  }
  
  # validate the candidate
  exec {'validate_sudoers':
    command => "visudo -cf ${sudoers_stage_file}",
    path    => '/usr/sbin:/usr/bin',
    unless  => "diff /etc/sudoers ${sudoers_stage_file}",
  }

  # if validation is successful, use the file
  file {'/etc/sudoers':
    source => $sudoers_stage_file,
  }

  File[$sudoers_stage_file] -> Exec['validate_sudoers'] -> File['/etc/sudoers']

}
